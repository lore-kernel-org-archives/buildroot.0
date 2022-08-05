Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C231C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 20:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9570E60F41;
	Fri,  5 Aug 2022 20:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9570E60F41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8iSGa6ANDKo5; Fri,  5 Aug 2022 20:01:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A29960F29;
	Fri,  5 Aug 2022 20:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A29960F29
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEA4F1BF417
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 20:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84D3E83EFD
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 20:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84D3E83EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NEf85mLY7_vX for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 20:01:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 058148346C
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2114.outbound.protection.outlook.com [40.107.220.114])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 058148346C
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 20:01:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkPykdVx1MJ+Udouou8UmSgpiJZRPiAho4lZ5aFloQ3rHigd28k8UYWKZgTaiV4gYbChWZmSVBz1RvLq/tKR+axRd/j9F6QlsbteBy1kA6hWCDvOnv47DFLyjX4+kXRBPKPOCp6Vq1pmKoSxV9IXEAWoev+88a8i9JBUGq8i59d6dsEW5M2cvUk4c8x/3a0sK8POt/z3nG6YNNQInMe+SlUlG5yjBfmzWeLvIHZz8lUR0B+aHGHhTV/a24MAbOv/ZEOadqSeqqY0DfuIRtjwQsL9kVzxoMC6iU8kB8ZHp++2Ock377bch1rYlmCI0T36MZ1yUC6bTF+0WLA+DjaWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHZB610x9vFfLOZpaxfFWlnyRbyY1y5mb+wWLkKL+ZE=;
 b=STDmPNCCTWFyEqHDQzP0+xP4jg4K+IEcx1AajBilFZVMEMZTiG07MqHJ5Mei6SAhhQds8x5i74KFZZF8UOaFrdPnT4XVdPLaFYsJLzAq4n+maVFvM8cMl6eYAJCOXCk2vah5SvsjDwg/Q+Bd49Au/jOQe22LpkfFHP9hVNt3sjX5CWIvkL3dcVtIeaLIzdCW+n+ad3VvhEAEijFbN8zkMLMvi9G61W+WISDWyUF5xuero5j+jl19EBYxFlwsGwu8ahDMygWR07JCYUtN0Ane3RJvaRQl6wRHkCkUg+lg6b/os0cih0pcVR3+g0LLsanWdLlmqSblhrSH1DWj6OgMHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by BY3PR17MB5252.namprd17.prod.outlook.com (2603:10b6:a03:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 20:01:33 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f%3]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 20:01:33 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Fri,  5 Aug 2022 15:01:13 -0500
Message-Id: <20220805200114.288208-1-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SA0PR12CA0027.namprd12.prod.outlook.com
 (2603:10b6:806:6f::32) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08d78883-474b-4bd8-436b-08da771d4b68
X-MS-TrafficTypeDiagnostic: BY3PR17MB5252:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OBS7OsSQzvltFtsFd7RqVYprUJm4YaGYWZb8nVZNGLZIKAAigWycMXFRHkZuhWZYvdUeCWzeA15Mlm2SMQJkZfGzhtOemqTvIMkLAJkheeRJ9mByAzRamogwb67qCPO+ah0dYYI1Kr4KDk2k9X6Qm3rYQH32E8Nj15kdSAffqoV9nKIt9vDB3b5hbQh5MQSGT9zBM0sJ0c1wgvsbdqh1SOmQEXt5Q+/Z4vUUvcIVIM6GevnrrzDcjHpbQ+nI8YQEiM9Z3tWKh8V/eZw7lYFkFbSH6T+n0hAk/1PfPtH/SlBXaUgDfElfsNpO6SNoTdeD9P9wCCnz/73pxMnDiIJV3XqaojiZ4mM8PFp172jEbChCwv/6W8A0tknpAd8BKRYI/7CR6PpGkJh3fi3YlvWSSMcvyO35wk+jP784UWbKyW5PUGcj9eMQMyTuTSJIg7qLteSQOK1+AaLqHgM4vl1SaOEa5QKg+4wnH7X5FbED6OB8lkHhPpr/4zvygM9aLSMPyrixnV+l90SKA7HoadsRoNluquwQtczRCFVW3jnox3GzV2EMOr40Jccy7HhkFi7OSed3Q16xnxoWPaAc+QrJRqbU329+20K8uqEo3JTyxzI8U7S9y8QzjY0YnXE4EMLX/0j/f+vWCt1fiEHtYAIVQxt55yyD5vvH1/jGJX81em70OjvOmoG+rDXSFtOruskgz2EFAreC+Z8Sex+ZI6wWCMs9Fkbso8v0YYjAqtH+bCUeIq1R4w/u09oZGpEFZQjVk65w+KhZ2TX6/jejaB8IxXSdP3a8CuHKVS2z67yagDlji7ehjNw73aNQMF2M2aqRqcyD0993kweiyJ4ovZpklA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39830400003)(346002)(376002)(136003)(366004)(396003)(6486002)(966005)(478600001)(66946007)(6512007)(66556008)(316002)(41300700001)(26005)(2906002)(6666004)(6506007)(36756003)(52116002)(86362001)(1076003)(6916009)(8936002)(107886003)(30864003)(2616005)(166002)(38100700002)(66476007)(8676002)(4326008)(186003)(5660300002)(38350700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?89LA08t9Yhp2gEk49AJ5ouq2WM4+jIGedBNV1hSq+2/fBJOnjOqx8NlbjHxl?=
 =?us-ascii?Q?T0Q0wXpDVF2zp+2nBoEGPb3yTBo4RUcZfiyz87ugLrGCZNWA+RnnLV5tNzIw?=
 =?us-ascii?Q?eq6PlznIpKeYnwzcQ3hs1eGau+KowC67m4yy3BpTu1CcZc9DBjHB5f2gDuvq?=
 =?us-ascii?Q?HSdqYKuX0xXXUnm+Zz6qGHuUIExjlmqLO78KENNfJvMbTCQ7+rHR6u85jW+H?=
 =?us-ascii?Q?ugjuwiMLxABTlDUQuVGygyhpGgbkyBT6AihS6Mi9CEk5ZYii1YF9fAwn7zze?=
 =?us-ascii?Q?bqAlv3hC5neOc74fxFNWvQgB3v78zUhGR+scz+JwiLMn2SmNMf9KDri0y6qx?=
 =?us-ascii?Q?rb00Kua0Ch0GFLW1CZsTy+5g87ivZ0vU38i6SqFckCpetl+ObjPLK6U2inAO?=
 =?us-ascii?Q?bjDFpXFSvD6RyUcgPmkh2Cp1eFY2Op1tTBWoSvkwiotH+l5WaGFA/B6vzM1T?=
 =?us-ascii?Q?rn4oFmEvzQvxR/luJwJssC41Ewiuz90CLOGDmpY87Clc2vrBy9SlHeLL15eW?=
 =?us-ascii?Q?6ypGOIpxg+x4umeaaD7VGQhZXnHfxxihHLFy2EQ60R6YYsA3p8ouyqIAtUbt?=
 =?us-ascii?Q?47K7tx1wwXmE+RQSu94/ghfryPSZNlsPEyl+zdfM9ZPjp1WOAYT1F5ur5y9p?=
 =?us-ascii?Q?VUGIeFNFyAr57+yeipZ5BF/X6LTWzMibkp05zDJz7maM3BvBBrsBxUn5xJV8?=
 =?us-ascii?Q?4Afn0XU45pC/O1aOXRqeTRXz58H705wKrpfuVVgEsejP366/71KBW4YjaRoh?=
 =?us-ascii?Q?EzYhM967VRPwaq2kJTTy7hr1ATPvTeX6XOMbApS2uykzZZXCn4tHB/jdel4o?=
 =?us-ascii?Q?jTXZJyPet2JCZ1rkPjdQV5vxaF48Tzz+BS/PsGbmiUrAo7Nk0WcmvR8v162x?=
 =?us-ascii?Q?Slpw/LTzQvs+naETOfW1/o+3sNckW8RRoqQt4y3wM9YpiecTGR+p6cMiflE4?=
 =?us-ascii?Q?cS2/qEOX5nbt5vW5KkD5shXJ2gZVe45VY2ekn/2xaZnFr8zfTrNMnjLzqkrP?=
 =?us-ascii?Q?hlyO5ZurS/phVaYs5I2VnXGUbPOSDt72hRaqO1lyS8Wiw/P0fb5u+i83aiNT?=
 =?us-ascii?Q?xZOk1mXvxZRMHCLVx0sxJRikSej6+15SYNBdID7J3O/mbxpTgqKUXqxqcFBx?=
 =?us-ascii?Q?MsO13X437AsdWUimvKK1rn7EnjKHQtH3NEYvzqcp1wnpKeUks2380aLOZ3n1?=
 =?us-ascii?Q?afofTJBhX2Wk2E3fQsn/eO2q4/9LU1dLCtOsNeIr4ZY+e6bqhLKf6oShgwKk?=
 =?us-ascii?Q?0S2rDwjOhtPkJsY7ddr7W9FIvrdTBNH4MzHcnxU3OUu6e5kOzuOR5ewbflh5?=
 =?us-ascii?Q?2l8RAdj7DnBdzw4/b7F64s+vQuCPOxVkX6m/GuJGYJMcHQXNB/TF/uCBuYsO?=
 =?us-ascii?Q?DNXwnF8YShimAHpN+yMTwSc/YH+L+WD6zNQ7ves8G/HpGK1ug0jUssanGjNl?=
 =?us-ascii?Q?XIOtIZoAd3+rz/uP0AaogpWNS6FAyp7/KWiMOWhNA5BOcfqqKSG9fuczL/nK?=
 =?us-ascii?Q?W+hC3oif8bfBlnqT911nXoEnVfUw3TaeGmZrbbEoW+lgibOEu6S03rXeRIIN?=
 =?us-ascii?Q?ASn85o/b4fQU/dRuAJFNh95t46LECbAAbVFmDKui?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d78883-474b-4bd8-436b-08da771d4b68
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 20:01:33.0946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPbP0pO2ICQ1E5fFB8LSjEX12pSsVHejbcrPfbkaHZJK5ux7wlyfUw73RyhIyO1lebHU3aULi64ATNAj/F61cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR17MB5252
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHZB610x9vFfLOZpaxfFWlnyRbyY1y5mb+wWLkKL+ZE=;
 b=eL6ZIaZ75KKPWUBvSVSg+41N1Gk9d16jmvkpunDA9aQvxrqAZP+iZmUy77OfNf/Px9Ik0bXzqNuZ3gzVADtd0spC6YTyKRDTRnYp8226PJuHs/cVvDNQW7uKiv9MA07LcVEnuqC5qIvD/xauasyvVv77Fn7C3brmQv2GQ7/ctxg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=eL6ZIaZ7
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH v2 1/2] support/scripts/pkg-stats: move to
 procedurally generated row/column clases
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

Rather than having pre-baked classes in the markup for sorting purposes,
all the cells in package-grid are iterated over at load time and given
a row/column class.

example: https://sen-h.github.io/pkg-stats/b6f4cbddb14233c3ab3fdfea1e486c14871cfb2a.html

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
---
v1->v2:
*   fixed current version class attributes being rendered as inner text
*   added link to example html
---
 support/scripts/pkg-stats | 160 ++++++++++++++++----------------------
 1 file changed, 68 insertions(+), 92 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index d32abd7225..39da5e5593 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -758,6 +758,17 @@ addedCSSRules = [
 
 addedCSSRules.forEach(rule => styleSheet.insertRule(rule));
 
+window.addEventListener('DOMContentLoaded', (event) => {
+	gridArray = Array.from(document.getElementById("package-grid").children);
+	let l = row = 0;
+	gridArray.forEach(cell =>{
+		if (l != 13){ l++ }
+		else { l = 1; row++; };
+
+		cell.classList.add("c" + l, "ir" + row);
+	});
+});
+
 function sortGrid(sortLabel){
 	let i = 0;
 	let pkgSortArray = [], sortedPkgArray = [], pkgStringSortArray = [], pkgNumSortArray = [];
@@ -774,14 +785,11 @@ function sortGrid(sortLabel){
 	const styleSheet = styleElement.sheet;
 
         columnValues.shift();
-        columnValues.forEach((listing) => {
+	columnValues.forEach((listing) => {
                 let sortArr = [];
-                sortArr[0] = listing.id.replace(sortLabel+"_", "");
-                if (!listing.innerText){
-                        sortArr[1] = -1;
-                } else {
-                        sortArr[1] = listing.innerText;
-                };
+                sortArr[0] = listing.classList[listing.classList.length - 1];
+                sortArr[1] = listing.innerText;
+                if (!listing.innerText){sortArr[1] = -1;};
                 pkgSortArray.push(sortArr);
         });
         pkgSortArray.forEach((listing) => {
@@ -821,13 +829,12 @@ function sortGrid(sortLabel){
 	addedCSSRules.forEach(rule => styleSheet.insertRule(rule));
 };
 
-function expandField(fieldId){
-        const field = document.getElementById(fieldId);
+function expandField(field){
         const fieldText = field.firstElementChild.innerText;
         const fieldTotal = fieldText.split(' ')[2];
 
         if (fieldText == "see all " + fieldTotal + triangleDown){
-		field.firstElementChild.innerText = "see less " + fieldTotal + triangleUp;
+                field.firstElementChild.innerText = "see less " + fieldTotal + triangleUp;
                 field.style.height = "auto";
         } else {
                 field.firstElementChild.innerText = "see all " + fieldTotal + triangleDown;
@@ -919,80 +926,59 @@ def boolean_str(b):
 
 
 def dump_html_pkg(f, pkg):
-    pkg_css_class = pkg.path.replace("/", "_")[:-3]
-    f.write(f'<div id=\"package__{pkg_css_class}\" \
-        class=\"package data _{pkg_css_class}\">{pkg.path}</div>\n')
+    f.write(f'<div class=\"data\">{pkg.path}</div>\n')
     # Patch count
-    data_field_id = f'patch_count__{pkg_css_class}'
-    div_class = ["centered patch_count data"]
-    div_class.append(f'_{pkg_css_class}')
+    div_class = ["centered data"]
     if pkg.patch_count == 0:
         div_class.append("nopatches")
     elif pkg.patch_count < 5:
         div_class.append("somepatches")
     else:
         div_class.append("lotsofpatches")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
-        \">{str(pkg.patch_count)}</div>\n')
+    f.write(f'  <div class=\"{" ".join(div_class)}\">{str(pkg.patch_count)}</div>\n')
 
     # Infrastructure
-    data_field_id = f'infrastructure__{pkg_css_class}'
     infra = infra_str(pkg.infras)
-    div_class = ["centered infrastructure data"]
-    div_class.append(f'_{pkg_css_class}')
+    div_class = ["centered data"]
     if infra == "Unknown":
         div_class.append("wrong")
     else:
         div_class.append("correct")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
-        \">{infra_str(pkg.infras)}</div>\n')
+    f.write(f'  <div class=\"{" ".join(div_class)}\">{infra_str(pkg.infras)}</div>\n')
 
     # License
-    data_field_id = f'license__{pkg_css_class}'
-    div_class = ["centered license data"]
-    div_class.append(f'_{pkg_css_class}')
+    div_class = ["centered data"]
     if pkg.is_status_ok('license'):
         div_class.append("correct")
     else:
         div_class.append("wrong")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
-        \">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
+    f.write(f'  <div class=\"{" ".join(div_class)}\">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
 
     # License files
-    data_field_id = f'license_files__{pkg_css_class}'
-    div_class = ["centered license_files data"]
-    div_class.append(f'_{pkg_css_class}')
+    div_class = ["centered data"]
     if pkg.is_status_ok('license-files'):
         div_class.append("correct")
     else:
         div_class.append("wrong")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
-        \">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
+    f.write(f'  <div class=\"{" ".join(div_class)}\">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
 
     # Hash
-    data_field_id = f'hash_file__{pkg_css_class}'
-    div_class = ["centered hash_file data"]
-    div_class.append(f'_{pkg_css_class}')
+    div_class = ["centered data"]
     if pkg.is_status_ok('hash'):
         div_class.append("correct")
     else:
         div_class.append("wrong")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
-        \">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
+    f.write(f'  <div class=\"{" ".join(div_class)}\">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
 
     # Current version
-    data_field_id = f'current_version__{pkg_css_class}'
     if len(pkg.current_version) > 20:
         current_version = pkg.current_version[:20] + "..."
     else:
         current_version = pkg.current_version
-    f.write(f'  <div id=\"{data_field_id}\" \
-        class=\"centered current_version data _{pkg_css_class}\">{current_version}</div>\n')
+    f.write(f'  <div class=\"centered data\">{current_version}</div>\n')
 
     # Latest version
-    data_field_id = f'latest_version__{pkg_css_class}'
-    div_class.append(f'_{pkg_css_class}')
-    div_class.append("latest_version data")
+    div_class = ["centered data"]
     if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
         div_class.append("version-error")
     if pkg.latest_version['version'] is None:
@@ -1020,22 +1006,18 @@ def dump_html_pkg(f, pkg):
         else:
             latest_version_text += "found by guess"
 
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{latest_version_text}</div>\n')
+    f.write(f'  <div class=\"{" ".join(div_class)}\">{latest_version_text}</div>\n')
 
     # Warnings
-    data_field_id = f'warnings__{pkg_css_class}'
-    div_class = ["centered warnings data"]
-    div_class.append(f'_{pkg_css_class}')
+    div_class = ["centered data"]
     if pkg.warnings == 0:
         div_class.append("correct")
     else:
         div_class.append("wrong")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{pkg.warnings}</div>\n')
+    f.write(f'  <div class=\"{" ".join(div_class)}\">{pkg.warnings}</div>\n')
 
     # URL status
-    data_field_id = f'upstream_url__{pkg_css_class}'
-    div_class = ["centered upstream_url data"]
-    div_class.append(f'_{pkg_css_class}')
+    div_class = ["centered data"]
     url_str = pkg.status['url'][1]
     if pkg.status['url'][0] in ("error", "warning"):
         div_class.append("missing_url")
@@ -1045,12 +1027,10 @@ def dump_html_pkg(f, pkg):
     else:
         div_class.append("good_url")
         url_str = "<a href=\"%s\">Link</a>" % pkg.url
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{url_str}</div>\n')
+    f.write(f'  <div class=\"{" ".join(div_class)}\">{url_str}</div>\n')
 
     # CVEs
-    data_field_id = f'cves__{pkg_css_class}'
-    div_class = ["centered cves data"]
-    div_class.append(f'_{pkg_css_class}')
+    div_class = ["centered data"]
     if len(pkg.cves) > 10:
         div_class.append("collapse")
     if pkg.is_status_ok("cve"):
@@ -1061,10 +1041,10 @@ def dump_html_pkg(f, pkg):
         div_class.append("cve-ok")
     else:
         div_class.append("cve-unknown")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
+    f.write(f'  <div class=\"{" ".join(div_class)}\">\n')
     if len(pkg.cves) > 10:
         cve_total = len(pkg.cves) + 1
-        f.write(f' <div onclick=\"expandField(\'{data_field_id}\')\" \
+        f.write(f' <div onclick=\"expandField(this.parentElement)\" \
         class=\"see-more centered cve_ignored\">see all ({cve_total}) &#9662;</div>\n')
     if pkg.is_status_error("cve"):
         for cve in pkg.cves:
@@ -1078,20 +1058,16 @@ def dump_html_pkg(f, pkg):
     f.write("  </div>\n")
 
     # CVEs Ignored
-    data_field_id = f'ignored_cves__{pkg_css_class}'
-    div_class = ["centered data ignored_cves"]
-    div_class.append(f'_{pkg_css_class}')
+    div_class = ["centered data"]
     if pkg.ignored_cves:
         div_class.append("cve_ignored")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
+    f.write(f'  <div class=\"{" ".join(div_class)}\">\n')
     for ignored_cve in pkg.ignored_cves:
         f.write("    <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (ignored_cve, ignored_cve))
     f.write("  </div>\n")
 
     # CPE ID
-    data_field_id = f'cpe_id__{pkg_css_class}'
-    div_class = ["left cpe_id data"]
-    div_class.append(f'_{pkg_css_class}')
+    div_class = ["data"]
     if pkg.is_status_ok("cpe"):
         div_class.append("cpe-ok")
     elif pkg.is_status_error("cpe"):
@@ -1100,7 +1076,7 @@ def dump_html_pkg(f, pkg):
         div_class.append("cpe-ok")
     else:
         div_class.append("cpe-unknown")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
+    f.write(f'  <div class=\"{" ".join(div_class)}\">\n')
     if pkg.cpeid:
         cpeid_begin = ":".join(pkg.cpeid.split(":")[0:4]) + ":"
         cpeid_formatted = pkg.cpeid.replace(cpeid_begin, cpeid_begin + "<wbr>")
@@ -1122,32 +1098,32 @@ def dump_html_pkg(f, pkg):
 def dump_html_all_pkgs(f, packages):
     f.write("""
 <div id=\"package-grid\">
-<div style="grid-column: 1;" onclick="sortGrid(this.id)" id=\"package\"
-     class=\"package data label\"><span>Package</span><span></span></div>
-<div style="grid-column: 2;" onclick="sortGrid(this.id)" id=\"patch_count\"
-     class=\"centered patch_count data label\"><span>Patch count</span><span></span></div>
-<div style="grid-column: 3;" onclick="sortGrid(this.id)" id=\"infrastructure\"
-     class=\"centered infrastructure data label\">Infrastructure<span></span></div>
-<div style="grid-column: 4;" onclick="sortGrid(this.id)" id=\"license\"
-     class=\"centered license data label\"><span>License</span><span></span></div>
-<div style="grid-column: 5;" onclick="sortGrid(this.id)" id=\"license_files\"
-     class=\"centered license_files data label\"><span>License files</span><span></span></div>
-<div style="grid-column: 6;" onclick="sortGrid(this.id)" id=\"hash_file\"
-     class=\"centered hash_file data label\"><span>Hash file</span><span></span></div>
-<div style="grid-column: 7;" onclick="sortGrid(this.id)" id=\"current_version\"
-     class=\"centered current_version data label\"><span>Current version</span><span></span></div>
-<div style="grid-column: 8;" onclick="sortGrid(this.id)" id=\"latest_version\"
-     class=\"centered latest_version data label\"><span>Latest version</span><span></span></div>
-<div style="grid-column: 9;" onclick="sortGrid(this.id)" id=\"warnings\"
-     class=\"centered warnings data label\"><span>Warnings</span><span></span></div>
-<div style="grid-column: 10;" onclick="sortGrid(this.id)" id=\"upstream_url\"
-     class=\"centered upstream_url data label\"><span>Upstream URL</span><span></span></div>
-<div style="grid-column: 11;" onclick="sortGrid(this.id)" id=\"cves\"
-     class=\"centered cves data label\"><span>CVEs</span><span></span></div>
-<div style="grid-column: 12;" onclick="sortGrid(this.id)" id=\"ignored_cves\"
-     class=\"centered ignored_cves data label\"><span>CVEs Ignored</span><span></span></div>
-<div style="grid-column: 13;" onclick="sortGrid(this.id)" id=\"cpe_id\"
-     class=\"centered cpe_id data label\"><span>CPE ID</span><span></span></div>
+<div style="grid-column: 1;" onclick="sortGrid(this.id)" id=\"c1\"
+     class=\"data label\"><span>Package</span><span></span></div>
+<div style="grid-column: 2;" onclick="sortGrid(this.id)" id=\"c2\"
+     class=\"centered data label\"><span>Patch count</span><span></span></div>
+<div style="grid-column: 3;" onclick="sortGrid(this.id)" id=\"c3\"
+     class=\"centered data label\">Infrastructure<span></span></div>
+<div style="grid-column: 4;" onclick="sortGrid(this.id)" id=\"c4\"
+     class=\"centered data label\"><span>License</span><span></span></div>
+<div style="grid-column: 5;" onclick="sortGrid(this.id)" id=\"c5\"
+     class=\"centered data label\"><span>License files</span><span></span></div>
+<div style="grid-column: 6;" onclick="sortGrid(this.id)" id=\"c6\"
+     class=\"centered data label\"><span>Hash file</span><span></span></div>
+<div style="grid-column: 7;" onclick="sortGrid(this.id)" id=\"c7\"
+     class=\"centered data label\"><span>Current version</span><span></span></div>
+<div style="grid-column: 8;" onclick="sortGrid(this.id)" id=\"c8\"
+     class=\"centered data label\"><span>Latest version</span><span></span></div>
+<div style="grid-column: 9;" onclick="sortGrid(this.id)" id=\"c9\"
+     class=\"centered data label\"><span>Warnings</span><span></span></div>
+<div style="grid-column: 10;" onclick="sortGrid(this.id)" id=\"c10\"
+     class=\"centered data label\"><span>Upstream URL</span><span></span></div>
+<div style="grid-column: 11;" onclick="sortGrid(this.id)" id=\"c11\"
+     class=\"centered data label\"><span>CVEs</span><span></span></div>
+<div style="grid-column: 12;" onclick="sortGrid(this.id)" id=\"c12\"
+     class=\"centered data label\"><span>CVEs Ignored</span><span></span></div>
+<div style="grid-column: 13;" onclick="sortGrid(this.id)" id=\"c13\"
+     class=\"data label\"><span>CPE ID</span><span></span></div>
 """)
     for pkg in sorted(packages):
         dump_html_pkg(f, pkg)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
