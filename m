Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2584C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FA6C410D0;
	Wed, 27 Jul 2022 15:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FA6C410D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6RgFir0KWXX; Wed, 27 Jul 2022 15:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10032410E0;
	Wed, 27 Jul 2022 15:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10032410E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5ECD81BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 471AD60E35
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 471AD60E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0VUATXyss2v for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:42:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28D7C60E33
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2100.outbound.protection.outlook.com [40.107.93.100])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28D7C60E33
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:42:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=givWaOvEkomxrbmmbfoVzTOrojwawX6sw1r7/bN5hQMeYOj7V2jlZVaeH1iqy31vOfuoiO+tLfInKfMFuWmbv146BYZm963KQ6QxtYqawEjTgK52HQKoDBMepxxbbIs+JGGgEBJ84uQtWhVM8eh0Bq0eqSHHhA/adzSGbbP2cYpl6dJetveenrpjaJ/RitPmtxju03o1Hu/LrANe2JhBWerTtWDtvendFZ+d8aiWMpe4ixUQNfkqzDKu51K8eR2Vb48XTPFzzIzPemvQBqww5DUPxKwp4CAtGnou5SVVDAL33Lrkm4IiekoajGTR2poMmy2XgvunOZ3wAxYsOcc4dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ad8IdQgQuwd9/4I6BLSDtbIND+768kEUL0omYFZCeYQ=;
 b=cAzN3tqWT8fpCj6I+e90Zp6HElF7StRBjLhBQbeTiZnPER5gN1/Q3+APyr7DvmhkZgrRCd3vNlCRGW44/xi1TmnO1/VTfEAci9fahqxYcsG/hnwCYE7RR2oI5suh0GGQFoWh/vXrD3TXu/HQ0hwVVfQWCtwwKSYAg/h+q9LEsJ/EVDgdQjsgNoreyw5jGYPEpFBmEVZrQCgW7iltLxDE4AKXx4ORPkUrNoHiD4hFQCvv2htjC3tjx0f69JWUH2flfnQyY6fA5ON348eBPnvAAq0dirQhFHwjNREQ7X5IyxRRwD7F8bGpC2pb7jP1KNVHfXzgP1c0oPzHHrrTNkJ1AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by BN8PR17MB2820.namprd17.prod.outlook.com (2603:10b6:408:52::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Wed, 27 Jul
 2022 15:42:50 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f%7]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 15:42:48 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 10:41:13 -0500
Message-Id: <20220727154114.1378721-4-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727154114.1378721-1-sen@phobosdpl.com>
References: <20220727154114.1378721-1-sen@phobosdpl.com>
X-ClientProxiedBy: SN6PR08CA0005.namprd08.prod.outlook.com
 (2603:10b6:805:66::18) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76252e3c-4f57-41ae-4364-08da6fe6a47d
X-MS-TrafficTypeDiagnostic: BN8PR17MB2820:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ie0cQOlgQ97MM36F120Iilub8YC2ml3wHoxdCbzVo8wxv0XUHp4NfssUMh8V+BrK+qOcHgOyhH7iC7Kl+D1rooQGKMKP3DU4RFNomGmil/R5gxMM02ZNpRVskbEzJWQxLlghZtAr3S8Zf17Iju314tGsY9G2VLl/tWSGuka2DNssh6RLWQNzNSVpSpM52Qv9vi4Hbx30rsbsntZEifGJ5LVU5vn8jHTElRkBBFnMtxiiEvRr/3fDiakSMGiFncIoYqjJIUuEgx5wNHsYidgSUYjDdTbuauxWZEvQwJdwXe07orupjfXP7ROMbksvjClAyCcsmGXIlXPLkHoQRdZnFBBg4Itz/MGtXQhmYQWrVUBHjIEiG9IEInQwAwx34TwF/c4znmqcQ+3mI3C6n2CVN4gaB5DFrdT/NN8yp49qPVUA9KkmGirm9mqztwesa3pv/FYixBbVOQTfcm98LIkiWCcuqoRJJACSGU7iZGDl+eukXESvVegR8Jg1s/QTzyXtLaRZ/Ej2EjguE2paVwqhGP1CxuOcJVPyaosBbJPs+T/FNKgoDKMh0DEnSodlt6vQBFSUJ9PSq3AMKwRLmZg8dZaSDkoQE7wzK9i9sWhg/aJFGIDeKf1L9hEqiCBlX3xHvbksZKnhzeaSYPST26dSDrzj98vwKCTyeU/kr5DRMc2XFGum5TLjHb15WM2IY35BTonZD/sdD1D4DonIZjc89aXSw0IezuU9fDz0hUmMozwdqmPEHG9xrD1Rdf2rHe7BnB7unYCKg04n0QgKw14pNMW1pjsH1tpTc1RLNnXBFm7SHi0yL7Hq1OwSr5buMe4ejojEjAMDPM5x0t59UX8VZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(136003)(396003)(366004)(39830400003)(83380400001)(8936002)(5660300002)(107886003)(1076003)(38100700002)(38350700002)(186003)(6666004)(41300700001)(966005)(478600001)(52116002)(6506007)(6512007)(26005)(6486002)(6916009)(316002)(36756003)(2616005)(86362001)(66476007)(66556008)(66946007)(8676002)(4326008)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SUgByv9MGe6KqCCcqtQglMq0EQonGTnlRj/iREi5BE21pX6elnbW5+5/wot0?=
 =?us-ascii?Q?2UWPAP8m71kPyxkWbSPQy1uBCtpwsLSNHzpmUhdet7wmmC01K8Ur3tN3Z6pH?=
 =?us-ascii?Q?5wEV3qnnSQ/3tkYXwR/hZEqF5YCetCEqIC0RLwOvwNnEbHuQbjcTxXrdRNz5?=
 =?us-ascii?Q?b/5z3ma/300IG3eNZ9xjvgcfhfv5GvKHNEH7kvRLkMnkckEbg+g1YybAZhJX?=
 =?us-ascii?Q?sKh02WEez+hDohux/F02FEJxvzjcY0B29AubwgonUKthoS+xTqW8NUYdYQOU?=
 =?us-ascii?Q?PVjE1ehcrB63Luk0wPeJ98FWFuAYWtpqb8HECCpxmJFksKN3sU/qeuUbs8RR?=
 =?us-ascii?Q?yaYa+Nm5Keon/DyAm6BIfrHjJYazBZSJzG6RZhaZ4fe7qvfyADbGOGESuqXQ?=
 =?us-ascii?Q?34SpuQBQucxr+HS3E0AGP8AwQAAF0+kdCvcdewF7Irt0e/GVAUPIXVljcGY7?=
 =?us-ascii?Q?M1a0G1QunuOYgHNRXczZEAhE7ESPU9VdF1V+T2DjxXaRL6eYm4SydcRlzo3h?=
 =?us-ascii?Q?VXG20R92WWiY0xBKFWL3cOMiaIWbj3goCTV/eQqCMk+d+wNRYQwlOWzHjCc4?=
 =?us-ascii?Q?mab+YwUKNFzTvOkM+7MYVIieFbBQdsftvJN2FX0JRerH7AZ5msfrzX9R/Q29?=
 =?us-ascii?Q?gWXzYWQUtLyuvgxvbXH1pucES3EX9r2q9SDKR20vqVGnRBWKbIrw1gmayUEu?=
 =?us-ascii?Q?8U9gWkzAgDh2mNXfsHXd8sr4D8on91++tLoWQmOGrtExQkrR+6xcP165AS5X?=
 =?us-ascii?Q?VCilrL3qfxevjFgq5ZBNMrO1y/VNXDZwrhagyppqDuekxsnAwfTCuYswcmxI?=
 =?us-ascii?Q?REUaJf6U+2tVavohBzKxwVASbYpy59krI1TO/I1sbRiIx5GvIzYrWz1GzTWp?=
 =?us-ascii?Q?j76gtOV8kMkHHPTYHiBMclUQ9an+pFdVtde6tRJxqOmtHLWy/tZchvMsLnOI?=
 =?us-ascii?Q?L5ib7iO2iieHuH+pYnmZoiieHwnjJUNU0GqqVNK1/ooENxwe2Qw0AqhwOjOA?=
 =?us-ascii?Q?DV5t7Vj75I5UigvNSmgVFhJK+erVKgOvBz9JSi6ahSSAfZOe77Awem0UPjRQ?=
 =?us-ascii?Q?jizJd1CwT65RgEijzgDHWhajoKek1Ayk4NNiMI2YItvj69R8fH3Ef9xUdAkc?=
 =?us-ascii?Q?HGx+WaHNwWqzFZLVBjfMqoNIO59Ijsht9wW2Try1EcQN8u+ZaPYWD+LnJufs?=
 =?us-ascii?Q?zmngubVH0d1WVd+MpkIQolkT+z9ysQaVraFgFiOM6PUN2JXkVlyn28aqZxvy?=
 =?us-ascii?Q?Y7mCou7msZcaOLN1zA2t6IY+vCzqPCjsghIZ0/I3cZcWvBoOYAyknjnp3b6I?=
 =?us-ascii?Q?VEv4I/JP6sW20pjCGjwvB4jKMqOa4IoV2hklISgJJ3ynPkulALfix+4ZW/Ff?=
 =?us-ascii?Q?GmI8GRPTeodaBHFU7XtqINaTWX3Q3sIht8TF6NRLxkrRu/soajGC0cHf5ntP?=
 =?us-ascii?Q?Yt26NcY+g3hlT5bxYU7grm1d2H0cUwoTaHM6UA95PRYyOW6D/dbHifLyYMN3?=
 =?us-ascii?Q?iNgegovfHhKA9X5IX9CFBuFcl2COcZUQpmTMagJI55zHo1YWGAQpY8iRPTd9?=
 =?us-ascii?Q?KbfwwvkNNzjwfVuyAKhnUQTOfRQ3+8CAInEtj8hk?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76252e3c-4f57-41ae-4364-08da6fe6a47d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 15:42:42.0586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+CYI3KZ1sFVblJLkBNfLQmCLYi2OXSzPrqd9Skmnr8/sR/0PfkIAgRVjt9JrP91L702js/a3lRuDIIyoOlg2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR17MB2820
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ad8IdQgQuwd9/4I6BLSDtbIND+768kEUL0omYFZCeYQ=;
 b=4t1RIOUG2eDlvtJmdHCizua5eqrfMga0poGMv6MfwqEdpcOIsXNzG6lz7ysdWSHZLihfXqXQWZlpjArC24gmT6RyfWNYWtQGAlNaWVbHypl1syxwwsRO/heujl9YqEsJWGDqqgcUyJphE12WGMZkojGRyNbCt2ARfaJ+oGlkINU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=4t1RIOUG
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 3/4] support/scripts/pkg-stats: fixed numeral in
 beginning of CSS class
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
Cc: Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CSS classes are generated for each package name for sorting purposes,
However some package names start with a number and this is not allowed.
(see https://www.w3.org/TR/CSS2/syndata.html#value-def-identifier)
Fix is to prepend a character to every class name such as "_".
so every ".package" is now "._package".

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
---
 support/scripts/pkg-stats | 50 +++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 0fb44d1e11..e6a1bb849e 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -891,12 +891,12 @@ def boolean_str(b):
 
 
 def dump_html_pkg(f, pkg):
-    f.write(f'<div id=\"package_{pkg.name}\" \
-        class=\"package data {pkg.name}\">{pkg.path}</div>\n')
+    f.write(f'<div id=\"package__{pkg.name}\" \
+        class=\"package data _{pkg.name}\">{pkg.path}</div>\n')
     # Patch count
-    data_field_id = f'patch_count_{pkg.name}'
+    data_field_id = f'patch_count__{pkg.name}'
     div_class = ["centered patch_count data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if pkg.patch_count == 0:
         div_class.append("nopatches")
     elif pkg.patch_count < 5:
@@ -907,10 +907,10 @@ def dump_html_pkg(f, pkg):
         \">{str(pkg.patch_count)}</div>\n')
 
     # Infrastructure
-    data_field_id = f'infrastructure_{pkg.name}'
+    data_field_id = f'infrastructure__{pkg.name}'
     infra = infra_str(pkg.infras)
     div_class = ["centered infrastructure data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if infra == "Unknown":
         div_class.append("wrong")
     else:
@@ -919,9 +919,9 @@ def dump_html_pkg(f, pkg):
         \">{infra_str(pkg.infras)}</div>\n')
 
     # License
-    data_field_id = f'license_{pkg.name}'
+    data_field_id = f'license__{pkg.name}'
     div_class = ["centered license data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if pkg.is_status_ok('license'):
         div_class.append("correct")
     else:
@@ -930,9 +930,9 @@ def dump_html_pkg(f, pkg):
         \">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
 
     # License files
-    data_field_id = f'license_files_{pkg.name}'
+    data_field_id = f'license_files__{pkg.name}'
     div_class = ["centered license_files data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if pkg.is_status_ok('license-files'):
         div_class.append("correct")
     else:
@@ -941,9 +941,9 @@ def dump_html_pkg(f, pkg):
         \">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
 
     # Hash
-    data_field_id = f'hash_file_{pkg.name}'
+    data_field_id = f'hash_file__{pkg.name}'
     div_class = ["centered hash_file data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if pkg.is_status_ok('hash'):
         div_class.append("correct")
     else:
@@ -952,7 +952,7 @@ def dump_html_pkg(f, pkg):
         \">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
 
     # Current version
-    data_field_id = f'current_version_{pkg.name}'
+    data_field_id = f'current_version__{pkg.name}'
     if len(pkg.current_version) > 20:
         current_version = pkg.current_version[:20] + "..."
     else:
@@ -961,8 +961,8 @@ def dump_html_pkg(f, pkg):
         class=\"centered current_version data {pkg.name}\">{current_version}</div>\n')
 
     # Latest version
-    data_field_id = f'latest_version_{pkg.name}'
-    div_class.append(pkg.name)
+    data_field_id = f'latest_version__{pkg.name}'
+    div_class.append(f'_{pkg.name}')
     div_class.append("latest_version data")
     if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
         div_class.append("version-error")
@@ -994,9 +994,9 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{latest_version_text}</div>\n')
 
     # Warnings
-    data_field_id = f'warnings_{pkg.name}'
+    data_field_id = f'warnings__{pkg.name}'
     div_class = ["centered warnings data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if pkg.warnings == 0:
         div_class.append("correct")
     else:
@@ -1004,9 +1004,9 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{pkg.warnings}</div>\n')
 
     # URL status
-    data_field_id = f'upstream_url_{pkg.name}'
+    data_field_id = f'upstream_url__{pkg.name}'
     div_class = ["centered upstream_url data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     url_str = pkg.status['url'][1]
     if pkg.status['url'][0] in ("error", "warning"):
         div_class.append("missing_url")
@@ -1019,9 +1019,9 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{url_str}</div>\n')
 
     # CVEs
-    data_field_id = f'cves_{pkg.name}'
+    data_field_id = f'cves__{pkg.name}'
     div_class = ["centered cves data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if pkg.is_status_ok("cve"):
         div_class.append("cve-ok")
     elif pkg.is_status_error("cve"):
@@ -1043,9 +1043,9 @@ def dump_html_pkg(f, pkg):
     f.write("  </div>\n")
 
     # CVEs Ignored
-    data_field_id = f'ignored_cves_{pkg.name}'
+    data_field_id = f'ignored_cves__{pkg.name}'
     div_class = ["centered data ignored_cves"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if pkg.ignored_cves:
         div_class.append("cve_ignored")
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
@@ -1054,9 +1054,9 @@ def dump_html_pkg(f, pkg):
     f.write("  </div>\n")
 
     # CPE ID
-    data_field_id = f'cpe_id_{pkg.name}'
+    data_field_id = f'cpe_id__{pkg.name}'
     div_class = ["left cpe_id data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if pkg.is_status_ok("cpe"):
         div_class.append("cpe-ok")
     elif pkg.is_status_error("cpe"):
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
