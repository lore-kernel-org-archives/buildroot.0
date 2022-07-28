Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F388C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 02:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A05134177F;
	Thu, 28 Jul 2022 02:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A05134177F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KssR_CPtEp2w; Thu, 28 Jul 2022 02:15:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 072E64175F;
	Thu, 28 Jul 2022 02:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 072E64175F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28C621BF94B
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 02:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0419640A68
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 02:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0419640A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fE3kRlt3I3H3 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 02:15:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAF364052D
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2104.outbound.protection.outlook.com [40.107.223.104])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAF364052D
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 02:15:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5fNGaGPX80Vr9hvRNFfiR6Yb+KDe8RjcPQvRIbznL8HrM4OknImLGtoTtKBMq43ODxML4tY3M39q+8TQzh8HaPgfRQLUsONsli4umEUHOpAbXL01LOh2CpsN/SyxHwJ4z3Uz+HQzOapSAgrALoFc5FRf51W7asr02XGF/xKFGY4xRrOoXwd+nraz8iNIhgIWg+DKYk/1MZTVdfm4DEBTbwRDGmAUskfOXSnQZNb/gET6PLvhgGMckr12vB/R8QRbAy5FqMMX/lVEzm/AmvoWMilmotA6iHDceCRu/CbP1YShyRrcADw2fZHu1L4IgVw/IqyMnTVDfg9bnytXphi7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjlktygnkXUt9vHmWtPONObUTJH270F1YIHdlkpL03M=;
 b=mMj8/x/y82Z7p5yHPcDlCn/NIZRkYWZJuqkwvYEmCDvnzS9dIXdguqE9FvRmXQ2iJN3GZsVRPl+iZkI2E2PkyVqdnbGq+qdFXqoT0u0XDOh1aJLHije8V+Jvp9VjI1f+FzkcsI3853sFOQF3d6Mkx+fdRn1OFJPqaUfXt4+qh0ObsH4ufqvqVvksoS+C1nS3t+qo0IaKPBKltVL5Q0j+hQoNIkBFQnTuwc3OjDz0AFgcRAqnS+F2eRKwMKLyWavL2qiiFhuW7llkntGB2BtyuEaVMmdnJPW6SHIUtPHk1AFgitc1CWYydUE4eSSZToTBKTVemMe39B6qpbuBOPvBuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from CH2PR17MB3512.namprd17.prod.outlook.com (2603:10b6:610:3b::30)
 by CY4PR17MB0950.namprd17.prod.outlook.com (2603:10b6:903:a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Thu, 28 Jul
 2022 02:15:33 +0000
Received: from CH2PR17MB3512.namprd17.prod.outlook.com
 ([fe80::e828:d088:296:c]) by CH2PR17MB3512.namprd17.prod.outlook.com
 ([fe80::e828:d088:296:c%4]) with mapi id 15.20.5482.006; Thu, 28 Jul 2022
 02:15:32 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 21:14:43 -0500
Message-Id: <20220728021444.135820-2-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220728021444.135820-1-sen@phobosdpl.com>
References: <20220728021444.135820-1-sen@phobosdpl.com>
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To CH2PR17MB3512.namprd17.prod.outlook.com
 (2603:10b6:610:3b::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9306d258-3719-4769-61bf-08da703f0cdf
X-MS-TrafficTypeDiagnostic: CY4PR17MB0950:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KaQgg2j+d4IoRVXf51S6iChuXoCFjNDsnb8o1d/Dxp7jbcoSBZSD+uhIxP4U84stsGAAPevOa55nC/zjssUXfnH/iuthqgDKrLHFHFTTgPtPePEyLbyI69MWW81++rvj7MoUuDDF4Jlfrfu1IDhJYYuwTrWklzjcgU+ShnwC0lJgf+X0QYc2O8CcYvaFAgliZdnv6NBGHaVFtF1rNL6mT3JRVcZJeYmyjc/FAyT/GfZ2PKS/rqJ39/wQS+z71YujBqQIt6w0emo/Y8YblYKmJQcNOJJkXLYYS+TYHfAow5Znvof4DTYShAoAx3+SaxRdeZjJ2cgPdtfumyeJofxLBh7j4r52m6B9txz1kg6dTutfD6K42KO3MWuB7TjO/Mtz0qavuWz1HL/xNkcxzeiP20rE5+RHHeARk7tJEqQGRbd2oGVFTNTvXperSwIR8Kh7ZCtp1w0NtGnf8D0UsDNCZCgyLecCsR+G2CIrEhkbXJzlhkXNZSaXNwcWebwNTnaRl51QAELUv1D5d1Yn2xzM2J4omhz4+qxNmtxiiJVwVyusuUZUUuFwMcTa/NLlI82L6OyxqKCWhz6j7V2TTMuDDfEZLIkHSB48sVCT0UUtvj7pqqcRrYy0E+c3tFV5FbzERNrTfg3XoLBKtzhqUNNNrawdc071rRWuQ4vRAOC28Qgad4Ps66JGFvf4wzyXwBSMjNHpjfBxhMLheRtEzEtgwsQZXA+UbeOtJsY5ZFHP2+ymz8b2o7X7cOjWeuB6JBvRhHqZyZQYC0EkDc+Hzsgyn6qkwjNs/6t9eg0Kc6FumJA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR17MB3512.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(136003)(39830400003)(346002)(366004)(38350700002)(8936002)(8676002)(54906003)(38100700002)(5660300002)(6666004)(6486002)(316002)(66556008)(66946007)(4326008)(36756003)(186003)(6916009)(66476007)(86362001)(6506007)(478600001)(41300700001)(1076003)(26005)(52116002)(2616005)(6512007)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6xdG/XzleL3jC2vEKuKDstZsOGZKrTYu5q4ISTi6mUE0Q82hoU52KayG6VJ5?=
 =?us-ascii?Q?uCkblNZWOuK8tFpbD+omSFtKawFBOULbCnT2+VPfMSraDTU45VURhoSap3FQ?=
 =?us-ascii?Q?jM+z+OhzcxiikgwUHuTzMZWNbWETjl68xXMfFmRnvA5MzWgt+wGQdN5xRpZH?=
 =?us-ascii?Q?8yXrvdwwXvtf4sNIWzB0Nv6gw3XAC5wgbmg5AYZ/2rl/1GRtdjQIllYV58va?=
 =?us-ascii?Q?SaL1SDAzhsBHbjn6hfM/+9lWdDVhyao7yy3PpdikdGytoXP/gLYeMz8cXSac?=
 =?us-ascii?Q?Qbgeq5816eDCmN2EdCFr86M/C3qbASW4rpN5iOI1GDBrlmXJDFhcMuWQcYLn?=
 =?us-ascii?Q?jEqy5mfLLYZMT4oKhkrJuQGFwhGfx9UZqbGofngNXyLCsgMbqsILMjC95D8q?=
 =?us-ascii?Q?XH9o7y7dnkvCy3nu/F7QsIC80GxPhKhLqrUwCFOhETicUsChNH1onfXXZiQV?=
 =?us-ascii?Q?R32fpRpRiYve2wXHZV45EJCPk78Y5XSQWW/8DVZSboOCec9vHGVF3taykHBs?=
 =?us-ascii?Q?GnHeSF2XfzZC1UWVl/i6JwWvVfTQInmDoGoJKALicyt+ePp/GsSpd/EArtQl?=
 =?us-ascii?Q?ozKB5rn2FbF/pqqMJaPOxKElAW10Id/pcOLKnhdxGlgkZ02ygpMorGho4q9S?=
 =?us-ascii?Q?AjELmdmpP+C14XZlpA8GPxW919CqSruff4EH6c4mNCo5DrdEvuj/6r2E3vNH?=
 =?us-ascii?Q?RIPqVuqGbw2QovPDzXPEsScqVpIL0f5RoMR8UIi61tDRvJ5ck2eNW+UZtg0N?=
 =?us-ascii?Q?WYr+vYTsGrPk/nq7M6yU9udd4lU4jEAO5MOzBsyO47oZTLtZFPN79tFTsDum?=
 =?us-ascii?Q?yOsD3cfm1ItbifTNkVjTUvEe2UZgBk8Qt6B48vBvA1H1wdPQ2Nslvj7OYlzc?=
 =?us-ascii?Q?t+8Ju9y3o9P+w3mKa0TFDAnK97Kbb3NY3CEZNvO8RjWDIoc5x0ZC+8hZHe7/?=
 =?us-ascii?Q?b857fN1JQg2LR5HK3G7GbRmtxC/M7+6SsqXXA6wsd0KGlIgz/W3wCZ0qiOx7?=
 =?us-ascii?Q?uJaW8I/5rCtujKmmbjT74jxdiEdueOW5+HBD2ZyFXhZhudUkGh786zsvJpri?=
 =?us-ascii?Q?6B24MvSZRIs17b9e762QZCUHHKRR93RcIje+b/lInlBQHJZKoT4Ox/NVlkgF?=
 =?us-ascii?Q?0Zy+hFE4xzK15LszQf4jd/IepTe4eq9uQRon5afUVrfcQf//Jh22QFJIGmyV?=
 =?us-ascii?Q?+WbckLP30Ce8nHBWfhsKpT91vaxob/y73OHkiuplBmUDTvwplAs25mbixCAX?=
 =?us-ascii?Q?caqU2Rk8BZYRO/VUbayVXW11LcclC8Po2az5H7iQw8fowU3BFNH7Fz92tSdc?=
 =?us-ascii?Q?8ctd35EImEX7ilMaFr9Mbaf2aNnQYoBGO2BBJSettQKuw2pRZpMsS8qpLBNJ?=
 =?us-ascii?Q?jh36JnDO8LekiTiNJuMsk6EzonZp1FUvR+yDU5tsEudmdhhfdk28HUe07BHF?=
 =?us-ascii?Q?NKnc8xQfxspk5QLTBZP4TYWSzWtp7MIC9CmF0W1oaXlUg8r6SLwFaiVqdpHh?=
 =?us-ascii?Q?9cYaCDBwTZkw7dlpcM5skMW3zmu8uc86NjzSNsbHbob1K4+xTWrVgErrLpJE?=
 =?us-ascii?Q?GN1BYtQIASdTx0oGna6A/lcwtiGCXyxO2YWnc/gX?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9306d258-3719-4769-61bf-08da703f0cdf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR17MB3512.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 02:15:32.8969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sHy0oPE9vOylR5Cx6nwhhYTy3X+pfqKA4opy54mzi4FnlpX8J+EbbkuHGuGBwO1XQNPFIu5vPOJ8YY271HUVJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR17MB0950
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjlktygnkXUt9vHmWtPONObUTJH270F1YIHdlkpL03M=;
 b=VR5H96Z46DkuoZgQzDW5KskYRNf9ga/BncrUZZBxyVdrWlXqRP0vK0t8B5/Y9/9OOD1bJpTHE4dyRYeccXMSJLo3FAn5z19AgRmmisSWi2wioruFe6kexPV9iQod22djYyWjGU8Bo76k3Tq0dLhCq3HVV/ubEwe93K0XvMUGAFY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=VR5H96Z4
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 1/2] support/scripts/pkg-stats: fix duplicate
 package class names across rows
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

Like all good problems, disparate pieces work together to create
a "synergistically" hairy mess.

The sortGrid() overhaul highlighted a flaw in pkg-stats allowing
for duplicate package class names across rows.

As an example,

boot/barebox/barebox.mk and boot/barebox/barebox/barebox.mk
both get the classname ._barebox and so sortGrid() sticks them on
the same line giving a table with a vestigal row sticking out
of the right side like some kind of appendage.

Also I neglected to add a "_" to the current version column's cells
pkgname class so instead of "._pkgname" we had ".pkgname" and so
the cells were not collected properly as part of the row.

These issues explain the formatting weirdness.

package classnames are now ".path_to_package_makefile" without suffix
(.mk) (so ._boot_barebox_barebox and ._boot_barebox_barebox_barebox
instead of ._barebox) in order to guarantee uniqueness.

and what was *accidentally*
class="centered current_version data .barebox" is now
class="centered current_version data ._boot_barebox_barebox"
just like *all* the other cells in the row. :p

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
---
 support/scripts/pkg-stats | 53 ++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 9c37506cd4..d3ec65edbb 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -885,12 +885,13 @@ def boolean_str(b):
 
 
 def dump_html_pkg(f, pkg):
-    f.write(f'<div id=\"package__{pkg.name}\" \
-        class=\"package data _{pkg.name}\">{pkg.path}</div>\n')
+    pkg_css_class = pkg.path.replace("/", "_")[:-3]
+    f.write(f'<div id=\"package__{pkg_css_class}\" \
+        class=\"package data _{pkg_css_class}\">{pkg.path}</div>\n')
     # Patch count
-    data_field_id = f'patch_count__{pkg.name}'
+    data_field_id = f'patch_count__{pkg_css_class}'
     div_class = ["centered patch_count data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if pkg.patch_count == 0:
         div_class.append("nopatches")
     elif pkg.patch_count < 5:
@@ -901,10 +902,10 @@ def dump_html_pkg(f, pkg):
         \">{str(pkg.patch_count)}</div>\n')
 
     # Infrastructure
-    data_field_id = f'infrastructure__{pkg.name}'
+    data_field_id = f'infrastructure__{pkg_css_class}'
     infra = infra_str(pkg.infras)
     div_class = ["centered infrastructure data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if infra == "Unknown":
         div_class.append("wrong")
     else:
@@ -913,9 +914,9 @@ def dump_html_pkg(f, pkg):
         \">{infra_str(pkg.infras)}</div>\n')
 
     # License
-    data_field_id = f'license__{pkg.name}'
+    data_field_id = f'license__{pkg_css_class}'
     div_class = ["centered license data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if pkg.is_status_ok('license'):
         div_class.append("correct")
     else:
@@ -924,9 +925,9 @@ def dump_html_pkg(f, pkg):
         \">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
 
     # License files
-    data_field_id = f'license_files__{pkg.name}'
+    data_field_id = f'license_files__{pkg_css_class}'
     div_class = ["centered license_files data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if pkg.is_status_ok('license-files'):
         div_class.append("correct")
     else:
@@ -935,9 +936,9 @@ def dump_html_pkg(f, pkg):
         \">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
 
     # Hash
-    data_field_id = f'hash_file__{pkg.name}'
+    data_field_id = f'hash_file__{pkg_css_class}'
     div_class = ["centered hash_file data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if pkg.is_status_ok('hash'):
         div_class.append("correct")
     else:
@@ -946,17 +947,17 @@ def dump_html_pkg(f, pkg):
         \">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
 
     # Current version
-    data_field_id = f'current_version__{pkg.name}'
+    data_field_id = f'current_version__{pkg_css_class}'
     if len(pkg.current_version) > 20:
         current_version = pkg.current_version[:20] + "..."
     else:
         current_version = pkg.current_version
     f.write(f'  <div id=\"{data_field_id}\" \
-        class=\"centered current_version data {pkg.name}\">{current_version}</div>\n')
+        class=\"centered current_version data _{pkg_css_class}\">{current_version}</div>\n')
 
     # Latest version
-    data_field_id = f'latest_version__{pkg.name}'
-    div_class.append(f'_{pkg.name}')
+    data_field_id = f'latest_version__{pkg_css_class}'
+    div_class.append(f'_{pkg_css_class}')
     div_class.append("latest_version data")
     if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
         div_class.append("version-error")
@@ -988,9 +989,9 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{latest_version_text}</div>\n')
 
     # Warnings
-    data_field_id = f'warnings__{pkg.name}'
+    data_field_id = f'warnings__{pkg_css_class}'
     div_class = ["centered warnings data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if pkg.warnings == 0:
         div_class.append("correct")
     else:
@@ -998,9 +999,9 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{pkg.warnings}</div>\n')
 
     # URL status
-    data_field_id = f'upstream_url__{pkg.name}'
+    data_field_id = f'upstream_url__{pkg_css_class}'
     div_class = ["centered upstream_url data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     url_str = pkg.status['url'][1]
     if pkg.status['url'][0] in ("error", "warning"):
         div_class.append("missing_url")
@@ -1013,9 +1014,9 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{url_str}</div>\n')
 
     # CVEs
-    data_field_id = f'cves__{pkg.name}'
+    data_field_id = f'cves__{pkg_css_class}'
     div_class = ["centered cves data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if pkg.is_status_ok("cve"):
         div_class.append("cve-ok")
     elif pkg.is_status_error("cve"):
@@ -1037,9 +1038,9 @@ def dump_html_pkg(f, pkg):
     f.write("  </div>\n")
 
     # CVEs Ignored
-    data_field_id = f'ignored_cves__{pkg.name}'
+    data_field_id = f'ignored_cves__{pkg_css_class}'
     div_class = ["centered data ignored_cves"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if pkg.ignored_cves:
         div_class.append("cve_ignored")
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
@@ -1048,9 +1049,9 @@ def dump_html_pkg(f, pkg):
     f.write("  </div>\n")
 
     # CPE ID
-    data_field_id = f'cpe_id__{pkg.name}'
+    data_field_id = f'cpe_id__{pkg_css_class}'
     div_class = ["left cpe_id data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if pkg.is_status_ok("cpe"):
         div_class.append("cpe-ok")
     elif pkg.is_status_error("cpe"):
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
