Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CA9C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 22:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46FF960DCB;
	Thu, 18 Aug 2022 22:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46FF960DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9xBF6kU3n77p; Thu, 18 Aug 2022 22:37:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9A5C60C16;
	Thu, 18 Aug 2022 22:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9A5C60C16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE6631BF33D
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 22:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C950B4015E
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 22:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C950B4015E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EcLw2lg9pB-9 for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 22:37:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BF2B40129
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2130.outbound.protection.outlook.com [40.107.94.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BF2B40129
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 22:37:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4gbjUx4Y8OzPUq/nm6mSYlWk7CwyqBNTY9CRxSU3pQZb4nlb2t31kHjypj/GNBP7FBUZvIAMuu07AVX97hl2nTYIZsnK5zkbhi8Wc+0iuPIErD0e4hUnExSatedHwvZXX2qqBuoISUi2tcdF20oFfWHJs+Aeas6Qkry19Fn5PF9AtnSG9NsMdk5+9iByoaIng5/yrV4YKYuUg1H4mKXI+Ak0QFOPBp98jjRw3a3PD1VeGv7aHjRSTUNPqGKqcy6m3UXRw3X9+BpAyfruMEr4vLAzgUWCFP0BPRLA6HQIQRraiqGVQ/paa6r2RaJ/0Be7pWDLzNlA9E2qhSkVC7vmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsJ6txxWTj3kNtKQJsM8aCedrLQWH7OYNNpaOoobiww=;
 b=LXxdg6LkXJmqnIMK7Gcnhh7YUNvgxS3VAx9R9O4UgzaACIxKO50Y2H0EYs1E79ckHZsFgEp0mmVVf8uI0OD17/y3xARye94ZNiQ8DyBkN71nuNqIGO1MzZWiT7M1eonqAujOkupv6JurhE1/CBHm6aXclkULIMbAiF16w6H79qjSP0kBranLrtOe01pSYBhtTVgtdowvlITZBfCwQ2aDRVupjNABqQhrh0F1KJUKWGkgmErf5lKXoxbdHdGez+Z9SVhtoZv+WDrgZz/gr6w1NgOIA5tYFVX2E5aEezP39GQqo/IRopUQupFynSzvFvEiTbX4I9nE8lRT9twUj1F8fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by DM6PR17MB3514.namprd17.prod.outlook.com (2603:10b6:5:204::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 22:37:11 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f%3]) with mapi id 15.20.5525.019; Thu, 18 Aug 2022
 22:37:11 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 17:36:03 -0500
Message-Id: <20220818223603.45459-2-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818223603.45459-1-sen@phobosdpl.com>
References: <20220818223603.45459-1-sen@phobosdpl.com>
X-ClientProxiedBy: SN4PR0501CA0041.namprd05.prod.outlook.com
 (2603:10b6:803:41::18) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c9604e0-564b-4174-2747-08da816a30c8
X-MS-TrafficTypeDiagnostic: DM6PR17MB3514:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9bMd8y8YfXzyNwl9uuPExCk9114lFidD6PyiTQFFPYvW3eHEJ/0eMXjWZUfP7YuSB5aJ0/BWZ2azsFBv6rszqyaqR+i6eLwdMuyiRTv6Wy4hnfjnfVG8iwmOdqo+4B+YwoLK9FmA59TwQTNvBPnzdr7rer3BjM3P4WLVpgWQ8uc85myaBjMxpcLiVHEzIHzZqsrLAe4E2v7V3UJyiAJu75QmGykYAYTe9VXiUgI6pMZDp/CpYOkj5Uje5vqTZZu9gsufUf9PYFFUKtWjOIEdJ8+mmeempDdFn4AIsmERSwZXqeMzyZrQwEfzdWOrQclpKmSicqVSJ8OwmacuSODQO8tFNBQAovwiBEocGMTwfFzGa9+WMAze6y/qyZSVT6rBmaXs9TvyNLp1cSISo2qd31stkcq+WYNxjbqVMU6hHinZEogHluHMFYW1KPZUwQBpPPHhYVFVwLz0+35qs5kBIhmK4SSmJLIrdQhRZZp7pkx3+ysx9/5OFI9qjcbkBSxc6tz1/JBuEu3r2ACOMjCe7fSyU0uoF0+/E5+J/Idkojg54fB8+SIdUs7mKao0kVb1ZxoOs0+v2v0BV7q+QspkZDEfwahFKBIlHqGSwaJXcF5/xoKR2xN2n5lsub0g1QXnbQFCEBVxet8ID71YZHXpQNG+Hl/UOPMJ1UUvGk6c38AThPh9NLUHECUYPUsyoYGad4sA9Q33kBUOlojLfkD/AuznQJhJLlPQPGyZMAwMoFUy3kOGZ7h15tYRyicEUBII483XKoadF0YOA8JahLZtHRT8Ecw0xTOGoNRxKHxbc9k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39830400003)(136003)(346002)(396003)(376002)(2616005)(6916009)(166002)(316002)(1076003)(186003)(54906003)(83380400001)(36756003)(38350700002)(38100700002)(6486002)(6506007)(66946007)(4326008)(66476007)(66556008)(2906002)(8676002)(53546011)(6512007)(41300700001)(478600001)(86362001)(26005)(107886003)(8936002)(6666004)(5660300002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qO0f3g+rFbsp7+6NC7eXfljyp1nCeCtQgfEjE8hv4pfyqrlIhwk17v1BdGJq?=
 =?us-ascii?Q?rar0s2VkNCUxPyX72rPzFFavOxcTBgf0iC7I6Oshe52GTmuGtzlj+mzEI6We?=
 =?us-ascii?Q?52isw3L2mvaCXv0qgwy6Ku6nbxEJPrVfBPufd4EyO8nRo6d7JzV+RSCehhDN?=
 =?us-ascii?Q?xPL9S7Mk8EO8LUBOSS6gK3eCzp3VZtLsHvk5lyEyfNuR5diIqIKKkBLSouyn?=
 =?us-ascii?Q?wRYMVRVwuQ6Fq0FeqOYbgrQr6Tif2tMYDZ3NxZInwjwppAseb4CETmZNVhwI?=
 =?us-ascii?Q?vucBh3+tFqeLKUC7QSCB1U/G79uB6BRRqTUIhOpaVKM8UhA0t+Y3ssIQ5bRC?=
 =?us-ascii?Q?04hJzWwrXWwBUdzsGcCO72sYYxiJgY7LugOrnhCPiupUZ25q+2KIrrY5mbkH?=
 =?us-ascii?Q?XBcZKFZKiFs2Xc6coWYBFW9Fob65bqSygVS0oJuPQe5BCZ0eiHkVo/kLvK9v?=
 =?us-ascii?Q?EGknuIp3vsxXBSpE3JSzgmBx/gghtCB2bAXljQgcTahHeiYwmucRP7WFJAy3?=
 =?us-ascii?Q?B1LAqi4y0CMh3+q0njqjEgw3AgClLB96YVRl//VPrYqUB+0xUV11Ks72LW6p?=
 =?us-ascii?Q?TmJUXqJYmsM2IPSsd5obPbUnc8tVAkqTnUTI+3Njhv8lDMB3Okawjw1A/D0t?=
 =?us-ascii?Q?3AnTJuOoKfQCQVG+pmBgMSHzr9EU0udOxrXSFIBhVINrLDnAObut+0xaNc2S?=
 =?us-ascii?Q?IGmIlEZQWlstqpHS/Ew/MxiouuM9ZeTPUubydQW45Mr7WM0ZgkAgF5PyWN9C?=
 =?us-ascii?Q?m42/t78+PQoE9/rGKhSTB/Hnurff48bBNElxPtZtuoSB9zx/0yArkAMnLUgS?=
 =?us-ascii?Q?GtD4IFBVffFDkfpkz3lq3mRLdtvGpHlwHOyvngqaRU8BeyDHQmmftRInO/5P?=
 =?us-ascii?Q?5A/07HGhKr+gM8lgYZYoQu+87EX7ERLYccHAAzjs+FhFU5uZrMnvmrNn1Udk?=
 =?us-ascii?Q?GLmvSHSE8LwUxna5mnFxv8LfPIYQIj6IIN8S7W6EkwBNXxEXGkraofjqV1Fs?=
 =?us-ascii?Q?tWWZXzw6jFKagi30dNGO5PurtIa1f6XZ4Xx8ixk1k55+Dl2MSNDAjqS56RCF?=
 =?us-ascii?Q?57A55BXHNLudgI0FDIKmeV35fzf3OqiU64w/2DruXh9pMRYEhkBga0JALZv7?=
 =?us-ascii?Q?eTLw5m7kIpDeJ38KYquqAsGKopn7FT0esZrrIve1/dhHvivAlWzWVPj7WkJn?=
 =?us-ascii?Q?xGNwNmlH++hCQIkOxFYWVV78ev7/WMthuPFoN1QqUH3KJS34WrprOH/FuNhf?=
 =?us-ascii?Q?l3iTuE6TqLCdks/tMZoYtYCOMCGy/pJVjxmL00OOEr6qnNoK5JrQLaHvUMkM?=
 =?us-ascii?Q?kNAjiileTC9zHIs4InBcmnZr/wYq0RxnSKBluv00qukiDoLIkrat0fCCcxye?=
 =?us-ascii?Q?5nrAvxb1ndOSSUtdAGUax90rb8k5HgqLTVOnyIARU5vk+5niyqyvuigskDXs?=
 =?us-ascii?Q?njomT6izqjtn4e1dUUieTYmIYStJg09Ztsnjhyp6A3boV5TxU01VrrUKqpc5?=
 =?us-ascii?Q?88rRwpKgAOxbZK6q5febmNDSTHl9Uyz0x45pUJDWdNn7HTP7kO+EaRNOXWF/?=
 =?us-ascii?Q?GYWGaJq10FP2MlE1psnDb1sZX4uFXnnu1P0ubiHi?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9604e0-564b-4174-2747-08da816a30c8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 22:37:11.2536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: koHhAhWdaHxVx+G87pwc5BreIBnucFZ11BCIGXshaAShoNhhNzWSfueDD/nu46tw7rM1VnGyGn7C8/7WK+Ox8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR17MB3514
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsJ6txxWTj3kNtKQJsM8aCedrLQWH7OYNNpaOoobiww=;
 b=DFK5nV4+W6nE87vXs40ajctVCTz/r1tBA7uFf67CLbVxYbaANDou+/o+gvgCm89zdQyuqfm/6jotWlXfzpGdaHu2Wp6e0GxVfcyZ/GUijHDX9eQBtd2dd4XVAYEQCQyPxD5mbwhZaG7AaqVOYT6WFeSIq1CnDCBog9zy4uwhX8w=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=DFK5nV4+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/pkg-stats: remove
 remaining double quote escaping
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/6/22 16:56, Thomas Petazzoni wrote:
> This is done either by switching to single quoted f-strings, triple
> double quoted f-strings when needed, or simply single-quoted strings.
> 
> The renderer HTML is exactly identical before/after this commit.
> 
yeah looks good.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-By: Sen Hastings <sen@phobosdpl.com>
Acked-By: Sen Hastings <sen@phobosdpl.com>
> ---
>  support/scripts/pkg-stats | 67 +++++++++++++++++++--------------------
>  1 file changed, 32 insertions(+), 35 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 572757b7ea..aa3b49c809 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -1010,13 +1010,12 @@ def dump_html_pkg(f, pkg):
>          if pkg.latest_version['version'] is None:
>              latest_version_text = "<b>Found, but no version</b>"
>          else:
> -            latest_version_text = "<a href=\"https://release-monitoring.org/project/%s\"><b>%s</b></a>" % \
> -                (pkg.latest_version['id'], str(pkg.latest_version['version']))
> +            latest_version_text = f"""<a href="https://release-monitoring.org/project/{pkg.latest_version['id']}"><b>{str(pkg.latest_version['version'])}</b></a>"""
>  
>          latest_version_text += "<br/>"
>  
>          if pkg.latest_version['status'] == RM_API_STATUS_FOUND_BY_DISTRO:
> -            latest_version_text += "found by <a href=\"https://release-monitoring.org/distro/Buildroot/\">distro</a>"
> +            latest_version_text += f'found by <a href="https://release-monitoring.org/distro/Buildroot/">distro</a>'
>          else:
>              latest_version_text += "found by guess"
>  
> @@ -1041,10 +1040,10 @@ def dump_html_pkg(f, pkg):
>          div_class.append("missing_url")
>      if pkg.status['url'][0] == "error":
>          div_class.append("invalid_url")
> -        url_str = "<a href=\"%s\">%s</a>" % (pkg.url, pkg.status['url'][1])
> +        url_str = f"""<a href="{pkg.url}">{pkg.status['url'][1]}</a>"""
>      else:
>          div_class.append("good_url")
> -        url_str = "<a href=\"%s\">Link</a>" % pkg.url
> +        url_str = f'<a href="{pkg.url}">Link</a>'
>      f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{url_str}</div>\n')
>  
>      # CVEs
> @@ -1068,11 +1067,11 @@ def dump_html_pkg(f, pkg):
>          class="see-more centered cve_ignored">see all ({cve_total}) &#9662;</div>\n')
>      if pkg.is_status_error("cve"):
>          for cve in pkg.cves:
> -            f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (cve, cve))
> +            f.write(f'   <a href="https://security-tracker.debian.org/tracker/{cve}">{cve}</a><br/>\n')
>          for cve in pkg.unsure_cves:
> -            f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s <i>(unsure)</i></a><br/>\n" % (cve, cve))
> +            f.write(f'   <a href="https://security-tracker.debian.org/tracker/{cve}">{cve} <i>(unsure)</i></a><br/>\n')
>      elif pkg.is_status_na("cve"):
> -        f.write("    %s" % pkg.status['cve'][1])
> +        f.write(f"""    {pkg.status['cve'][1]}""")
>      else:
>          f.write("    N/A\n")
>      f.write("  </div>\n")
> @@ -1085,7 +1084,7 @@ def dump_html_pkg(f, pkg):
>          div_class.append("cve_ignored")
>      f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">\n')
>      for ignored_cve in pkg.ignored_cves:
> -        f.write("    <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (ignored_cve, ignored_cve))
> +        f.write(f'    <a href="https://security-tracker.debian.org/tracker/{ignored_cve}">{ignored_cve}</a><br/>\n')
>      f.write("  </div>\n")
>  
>      # CPE ID
> @@ -1108,11 +1107,9 @@ def dump_html_pkg(f, pkg):
>      if not pkg.is_status_ok("cpe"):
>          if pkg.is_actual_package and pkg.current_version:
>              if pkg.cpeid:
> -                f.write("  <br/>%s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %  # noqa: E501
> -                        (pkg.status['cpe'][1], ":".join(pkg.cpeid.split(":")[0:5])))
> +                f.write(f"""  <br/>{pkg.status['cpe'][1]} <a href="https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword={":".join(pkg.cpeid.split(":")[0:5])}">(Search)</a>\n""") # noqa: E501
>              else:
> -                f.write("  %s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %  # noqa: E501
> -                        (pkg.status['cpe'][1], pkg.name))
> +                f.write(f"""  {pkg.status['cpe'][1]} <a href="https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword={pkg.name}">(Search)</a>\n""")  # noqa: E501
>          else:
>              f.write("  %s\n" % pkg.status['cpe'][1])
>  
> @@ -1155,49 +1152,49 @@ def dump_html_all_pkgs(f, packages):
>  
>  
>  def dump_html_stats(f, stats):
> -    f.write("<a id=\"results\"></a>\n")
> -    f.write("<div class=\"data\" id=\"results-grid\">\n")
> +    f.write('<a id="results"></a>\n')
> +    f.write('<div class="data" id="results-grid">\n')
>      infras = [infra[6:] for infra in stats.keys() if infra.startswith("infra-")]
>      for infra in infras:
> -        f.write(" <div class=\"data\">Packages using the <i>%s</i> infrastructure</div><div class=\"data\">%s</div>\n" %
> +        f.write(' <div class="data">Packages using the <i>%s</i> infrastructure</div><div class="data">%s</div>\n' %
>                  (infra, stats["infra-%s" % infra]))
> -    f.write(" <div class=\"data\">Packages having license information</div><div class=\"data\">%s</div>\n" %
> +    f.write(' <div class="data">Packages having license information</div><div class="data">%s</div>\n' %
>              stats["license"])
> -    f.write(" <div class=\"data\">Packages not having license information</div><div class=\"data\">%s</div>\n" %
> +    f.write(' <div class="data">Packages not having license information</div><div class="data">%s</div>\n' %
>              stats["no-license"])
> -    f.write(" <div class=\"data\">Packages having license files information</div><div class=\"data\">%s</div>\n" %
> +    f.write(' <div class="data">Packages having license files information</div><div class="data">%s</div>\n' %
>              stats["license-files"])
> -    f.write(" <div class=\"data\">Packages not having license files information</div><div class=\"data\">%s</div>\n" %
> +    f.write(' <div class="data">Packages not having license files information</div><div class="data">%s</div>\n' %
>              stats["no-license-files"])
> -    f.write(" <div class=\"data\">Packages having a hash file</div><div class=\"data\">%s</div>\n" %
> +    f.write(' <div class="data">Packages having a hash file</div><div class="data">%s</div>\n' %
>              stats["hash"])
> -    f.write(" <div class=\"data\">Packages not having a hash file</div><div class=\"data\">%s</div>\n" %
> +    f.write(' <div class="data">Packages not having a hash file</div><div class="data">%s</div>\n' %
>              stats["no-hash"])
> -    f.write(" <div class=\"data\">Total number of patches</div><div class=\"data\">%s</div>\n" %
> +    f.write(' <div class="data">Total number of patches</div><div class="data">%s</div>\n' %
>              stats["patches"])
> -    f.write("<div class=\"data\">Packages having a mapping on <i>release-monitoring.org</i></div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages having a mapping on <i>release-monitoring.org</i></div><div class="data">%s</div>\n' %
>              stats["rmo-mapping"])
> -    f.write("<div class=\"data\">Packages lacking a mapping on <i>release-monitoring.org</i></div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages lacking a mapping on <i>release-monitoring.org</i></div><div class="data">%s</div>\n' %
>              stats["rmo-no-mapping"])
> -    f.write("<div class=\"data\">Packages that are up-to-date</div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages that are up-to-date</div><div class="data">%s</div>\n' %
>              stats["version-uptodate"])
> -    f.write("<div class=\"data\">Packages that are not up-to-date</div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages that are not up-to-date</div><div class="data">%s</div>\n' %
>              stats["version-not-uptodate"])
> -    f.write("<div class=\"data\">Packages with no known upstream version</div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages with no known upstream version</div><div class="data">%s</div>\n' %
>              stats["version-unknown"])
> -    f.write("<div class=\"data\">Packages affected by CVEs</div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages affected by CVEs</div><div class="data">%s</div>\n' %
>              stats["pkg-cves"])
> -    f.write("<div class=\"data\">Total number of CVEs affecting all packages</div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Total number of CVEs affecting all packages</div><div class="data">%s</div>\n' %
>              stats["total-cves"])
> -    f.write("<div class=\"data\">Packages affected by unsure CVEs</div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages affected by unsure CVEs</div><div class="data">%s</div>\n' %
>              stats["pkg-unsure-cves"])
> -    f.write("<div class=\"data\">Total number of unsure CVEs affecting all packages</div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Total number of unsure CVEs affecting all packages</div><div class="data">%s</div>\n' %
>              stats["total-unsure-cves"])
> -    f.write("<div class=\"data\">Packages with CPE ID</div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages with CPE ID</div><div class="data">%s</div>\n' %
>              stats["cpe-id"])
> -    f.write("<div class=\"data\">Packages without CPE ID</div><div class=\"data\">%s</div>\n" %
> +    f.write('<div class="data">Packages without CPE ID</div><div class="data">%s</div>\n' %
>              stats["no-cpe-id"])
> -    f.write("</div>\n")
> +    f.write('</div>\n')
>  
>  
>  def dump_html_gen_info(f, date, commit):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
