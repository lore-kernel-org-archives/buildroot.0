Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F27C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 18:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 374C983EF9;
	Fri,  5 Aug 2022 18:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 374C983EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBD5FgiC3nbC; Fri,  5 Aug 2022 18:59:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9D3383EEB;
	Fri,  5 Aug 2022 18:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9D3383EEB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F9A31BF3A3
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 18:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3DA160B43
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 18:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3DA160B43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id udNFfDVSofyL for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 18:58:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E71D60B63
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2137.outbound.protection.outlook.com [40.107.102.137])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E71D60B63
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 18:58:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVkCXHZvpZlbDx4f/0AyTWKqglnScpbghzGJyOCRyTeqnupupsxu368DyE8bIUDgKGkBE7qGyYrCxPNZx3sMGe4jWbfPJcwskUs9eAwFR9SrQhBCZECovfUjQSeaGoQ5AW3IkI7ZUMhf26xSWyRvhbThRzrUj3E0doQrkISYWB4aEHrKrKdh3+EQZy0xZoL4vE27r9qecCkjtSKqAqrc6jhaLzgiLhYUu0oLkyrvmQzF72z9M3ZZSgSmTZquK/K76RVCCEB6Qz5lnm+STMsk9svePDNSift6bQBx3zgzMwa/TSg+4Dx7Iwqz+4pYwZsDPjow+ACnyq7TS7oKfuhCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYQ9ClvNZy0LDeMggbSdJ9PfU4XMyhP++S5wf05MOJk=;
 b=G+Jr0gPxCG9JORIjz2B9bDP4DcYujy4VMDWLLBmT0eDNQxWN9GkITYrm1L75p9Y9SDtesNklg8Z7RGJo+3BaR39uPl9dcV+8jrlrSKzCp4zX5ifD+cTE3+MhBITzKcXvucvBXBXpeNkHQ9MHuFDSlVOTWn1f9IjAf3/6nA6/iV3dU5uS8wvBagh5gcnP6ix85BJvlQrSNSxa5x+hT9k//Cd6mP2cXJyntg8TbXTit58i/t8Cq1XeA3Cq5w0A9rVyugFzqMCT56yCr8QWPoFn34rSN+/agy4nuVyWaZqd57PQS/err5QtcKJJ6Ca8Y3mt7c6XrVRtsJoN3xQdBlw5kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by MW4PR17MB4451.namprd17.prod.outlook.com (2603:10b6:303:70::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 18:58:45 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f%3]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 18:58:45 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Fri,  5 Aug 2022 13:58:20 -0500
Message-Id: <20220805185821.261049-2-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805185821.261049-1-sen@phobosdpl.com>
References: <20220805185821.261049-1-sen@phobosdpl.com>
X-ClientProxiedBy: SN6PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:805:de::24) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c76e7de2-e355-45e1-e440-08da77148578
X-MS-TrafficTypeDiagnostic: MW4PR17MB4451:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RtOKmx/5hF6R3vL6BK5R3dq/Ew4VNPaDA77mylJJSo8+bdaVnxg4rdlHiivVW/FYBBjas+KN4fWRWFwSRGsNDJfYy320B6c27a7aJ6HdNK2pN6M106yJlnPS+Ks+LwN/Roy9O27xWd9rFqqnF7fDK7neBA7hivM7wGScRwe6ZgU3MZ/ys+EC+cWsgR/d4L/b58y6dgEAueLTS7Qx8ys1l1Cu0qNDR/70DyqGJtEu5QJe7ipfVVcW7lUxXknPR+gaB5rtHAA3sEjL4a2LpEltyho2bIVs0RNtzhNvQwCCfHJ+KTeZR7K/7KxndDJ1//5v9/Ij1L0Ye2U48dtankqmoqgGKtwaQcho70F6xwfXfRX+IjTBUATzRnKJeD8/dQDNi94VYRtN+nqSGNV1RuUlqVJNM1I6igIBfCpsRLOS6zl9pnoUiqXrRxXAN7vtrTy3U/Unit0kP7nadP13mmsZOQokdXF9hpsJocrsCcvlah6sEbU6ZQMP+ZIiLxvxuqZNb5/S/rEIiFtRJg1zUoXwi3OccX20+dCCrBPq2FWkdR8V7CXPPvP/86W9aoP3fo74RXYu72Zlz0PfLMrTvkLFsehsobjYP1jh2uFoQ91Cx5DN3odfvUOw2BT2/mLOr7pnCVTINwZPlhku8c21vu5/Jm86txdJdGwrIqMgAV2qmNBK550zuLpSfeOnchYtCcRH5wzcntjUuE3u46WiKkDAigSOReC2Dn4C+JX0V5IeUyBOvb1RLJqhooubpbEWDOSEq1a0PaDqhXyniVyeQZOqZe93RtRHOowuFdVPaMtEa7sGTnBztyenkcwsocjvpI+sJ5fYrFRQrpwHq7+iJco2Qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(346002)(136003)(39830400003)(396003)(52116002)(1076003)(107886003)(2616005)(186003)(30864003)(5660300002)(6666004)(6512007)(41300700001)(6506007)(26005)(36756003)(8936002)(6916009)(6486002)(478600001)(166002)(86362001)(83380400001)(2906002)(8676002)(316002)(38350700002)(38100700002)(4326008)(66476007)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/ey2lQgeeur2XI7hi1X5es3edWk/L9YFU6srzbApAcgz5Lw45vzQvsDfTFm5?=
 =?us-ascii?Q?4Z7KHsBsqeZe1qNNhuKUkYAoqIp0S5LnPfVCzoP6qVBjZh/YztiV1aABthCM?=
 =?us-ascii?Q?xJS6jOZ6UadAtm91RP4fxDsXuHbqRbFJTv8ZpmRmLsYEFU90OZV31Z6lyYgL?=
 =?us-ascii?Q?khc4ipM/l7gcJW72ntxWe2E9XB05ggQ7OgSDcFQUfmSxHl2819xgYN2lNBvx?=
 =?us-ascii?Q?Wzm1RBdrB9+y6ZkkUlK71aQ5NCi3g6nVwuyAYebv1KQ+8jBQFWYletAiW/Xy?=
 =?us-ascii?Q?RN1ovnrmK/ZvFhRJS0RP824WD+JpwV9ZTYsdGBf8cNoNPdkpLBoVdhtWawKY?=
 =?us-ascii?Q?aDHcrJCkW3yV3jwQ6h8hjvzNW5lKjazVYTaOuq1uUC72nVun5opdjZj412yK?=
 =?us-ascii?Q?4apyU16oRWhT9dDr/5xWMV3k6BTuYI47F7hBPSuiP6KoJCf9qqOsgeUcVu9y?=
 =?us-ascii?Q?vKfxyd/g7sada2p0/P7z+Hp1gOvLlRmhY3zLtPZ2Lifx2m6nQw0V5YVzhHke?=
 =?us-ascii?Q?N6olu2x3aH4SgcYJam0qWVkdjGD4LNClA+6Ag5vQVO4jtJZ4FYs+erF7tugy?=
 =?us-ascii?Q?Cqolxb70ooDXBt3Ui3UdGdTSI3rkyptFzYs++2ddf+XaVyQn5Semf5WpH0R8?=
 =?us-ascii?Q?WW4RCsyoixzYYqV+6htYuRxFYhNGC+6tyPJRJ6ASICAq59niLsLfNWzyDbQW?=
 =?us-ascii?Q?vC/RyvYXcTRpD5Qjk8FRYm07/SNU/rAb6ndVTAQwmnXRfZvCYN3FHcoZ7ZQv?=
 =?us-ascii?Q?Tv1Fh37a22PC6ogQoQkiCxdqPqOdji9EnTrZLmuPWkx/G1tPyiJdYm08ekdG?=
 =?us-ascii?Q?aKXkQFyhbXQNkF9epasKW+ao9c3X/XFo+NSMjZ/IhEw5rW8Sqm5071X5ipLA?=
 =?us-ascii?Q?+PuEtzuGh3lduqu6XwVuudd9OSKc7iaRbmDcNSGPWM3acutpym0o2N8DSIIp?=
 =?us-ascii?Q?SuhWtJ0cHd3rUU+BEWdDL8xivD4VVk+DceHNmk+gPBeoB1VJtze/Zrm/WuiM?=
 =?us-ascii?Q?pPXYGFVNqrQ5qg7wjJvoFuFJExTgDeu5OWJHVEo3Y1tmoBgRld2RStnDg8tq?=
 =?us-ascii?Q?XxZkNIupXJQMwSq7KGfHCn7/BvwRD+IAuuCo0Rmqi6ZsRe1T71q+F17ITXm9?=
 =?us-ascii?Q?zpq/rRvCAXn6uwE2+bjRgWmHDGRftA5NVOCkOhCPzMYEW/1n8Lqo2L/OAcR0?=
 =?us-ascii?Q?C4J/Jf9ju9/Lzkk5Q3PcDaCa/i6LudrlTApyp/jqULUA/2CP1dMCqYd4OneZ?=
 =?us-ascii?Q?/VSXtjr08BgNjEdJzo0gr0R7PBMT1XfncvWUGfmYNmj1EmyVN8/t5zN4jo28?=
 =?us-ascii?Q?X+3i2Zc6OvZ+yp7gBtBskGCyMyZntMYXSFITeojLXn13DAi5PueImAz0fRhy?=
 =?us-ascii?Q?9PjrdhDCBOOcMtKjoHFrAr96K7aAV0iwMCXpNSqprwnIlbq5awBIk6P9Qr+d?=
 =?us-ascii?Q?V2g43gDVmmOiFN06QXTidnuqrDhj6ky4vz7fHF6HDQNlEnbYIhSiaUu4Sdfk?=
 =?us-ascii?Q?Isx1ref6n6kGNEALXsRdGi90aS/nClzq7iC4NCcM1Ap7m/X56rZztFCxYcMP?=
 =?us-ascii?Q?3pznlzym3UpWltAk8WjB3Un39kokHAcXV2ZCIxFV?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76e7de2-e355-45e1-e440-08da77148578
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 18:58:45.0408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0luP+rylAQ5avoozp/WJ+c6rt6zFZ5QVFlRhrjCiy2O5bXLOsy3zkilUI9SBJn+NtGOIKqV8kosvJrWPYxGBFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR17MB4451
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYQ9ClvNZy0LDeMggbSdJ9PfU4XMyhP++S5wf05MOJk=;
 b=qo6AtnfXeYO739iJFJpw1kFy2VJB9vfVX11LfcjbxesnbW4vKiTVj0LJYKdqVPvIBsVp/toHoodT2ih6HsJVCTB0RIaZPA4aA8vjzB+mqhKD5DwXvqOqfpP6FOFLU8yDMKVWzrRMMyGLLsOPnqhFAKcPid91Hu56yoBIwyk9i3k=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=qo6AtnfX
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 1/2] support/scripts/pkg-stats: move to
 procedurally generated row/column classes
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

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
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
+    f.write(f'  <div>class=\"centered data\" {current_version}</div>\n')
 
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
