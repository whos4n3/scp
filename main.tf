resource "aws_organizations_policy" "RestrictBasedonRegion-India" {
  name = "RestrictBasedonRegion-India"

  content = <<CONTENT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "DenyAllOutsideEU",
            "Effect": "Deny",
            "NotAction": [
                "iam:*",
                "organizations:*",
                "route53:*",
                "budgets:*",
                "waf:*",
                "cloudfront:*",
                "globalaccelerator:*",
                "importexport:*",
                "support:*",
                "s3:*",
                "wafv2:*"
            ],
            "Resource": "*",
            "Condition": {
                "StringNotEquals": {
                    "aws:RequestedRegion": [
                        "ap-south-1"
                    ]
                }
            }
        }
    ]
}
CONTENT
}

resource "aws_organizations_policy_attachment" "unit" {
  policy_id = aws_organizations_policy.RestrictBasedonRegion-India.id
  target_id = "370617850610"
}