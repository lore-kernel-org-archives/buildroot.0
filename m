Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D098C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 19:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A12C360B11;
	Fri, 22 Jul 2022 19:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A12C360B11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SjUJknyEhs9U; Fri, 22 Jul 2022 19:16:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D583760F64;
	Fri, 22 Jul 2022 19:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D583760F64
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 043711BF330
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 19:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E007584AEE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 19:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E007584AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkOdj98kZIPS for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 19:16:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E531884AE9
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2107.outbound.protection.outlook.com [40.107.220.107])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E531884AE9
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 19:16:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSyTOIsoof7rFhxM8uEOF/CxBff6V5cRP28JJZNbr0e6xATHZHVy+lmhiUrbVcDE8yRt3ATN0Nhc3dir31/HZNGhGzkmjrdqO6VYx8abn0E47Ice8E4UVHLrCSiwHKnVKiHzuOz91B7orR4SErBSSJJIT2sxoAQgUBrId58ljAgdotZ0eOeHMf0IVYsrfVHrjpCVskLSy0mZoAmiU+tTI/YsDsUIndPfzvynBPQZG5FRyoQ8mnBpL0aXzVktV0MgNrA//gXeczUvmJ3nANMTkaFeTYh3JBdOXxfESGvpcpTE3OMpCqHKvWcnlx2TPSvZ5IxLvQfEL2R8fMOxQMIK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoWe5OfdKKzqzPGSAXk19LQHe+70O5IW95JdPQOOkEI=;
 b=YFONTIHs5kU/b9m0/NsFihmaPWfN31FRqjQzYPS7XF8JiKOiIPMFHwlmhVje8pCR5XOkJ7RBKA5jD1E6ufhnUnFc3TAGomvzg85wvyl7RsP+QjEN/Z8p9UHy/j4wmMZwGUmCMEhLduqtuG5qacklzCSEhxlxEqo8IRAtS06jv+Il5Hfz/SYSpbcOg+cnCpD3Lw/e6eCsywYD1lUJQq2UyCQT7SocIues7O6W+flAqeem7MtecM65Uc+F17zHasEvDz0tTPJ9uyU27Cqv5r3qfSBIvB6NBT2lUNUt8VqU2qVjHeHydF+O4m/WIpdNjwsV0IPFBnThz9iuqvpNGO+1ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by CY4PR17MB1254.namprd17.prod.outlook.com (2603:10b6:903:91::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 19:16:30 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f%7]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 19:16:30 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 14:15:58 -0500
Message-Id: <20220722191558.809011-1-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SN7P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::24) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86d0b412-9fd4-42d0-22ef-08da6c16aea3
X-MS-TrafficTypeDiagnostic: CY4PR17MB1254:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WnGrM2twnlf9Nr5y4IzcR9XqSgl3HLTLQSc2e5KInpQaAyHeJYqJ3m6aFVqSRcUeA7xWjzz9OLDtyRAG5bTQBKOqKeVNmpZ30AkfFafD5OriL+advhsjR9rRj4tlF1ykVXEfvJf/q7qbu3+Jw29qZhNkklxMAG1QdxjEIZ1ySbHcWtkJPYtcOjxDHiurEudrG0VZdCxZcO6m/yhdyCi/InmvSkTpKyQejw9jD+PScOXwvs28bzBxjU9L2WdjjUuMiE0dnmzvw1+Uy9OoVsujzOWJBkuWuUVkmfyT4bTimoKb1PZkdzS+XrC51OuQ8+wD6WX+QBuigRSTKJWtPN/QESrwXMOx5GqhLG5MvdKsqA/OypquityAA0ZTxXbGff97tbReVMO+Z/4lauV6ERn4roVmMlk0Iz0sNZbYF6D9d4WGYUPqrogp9hfw0POWT7Ca7VFXbZxrG8J8cme1W4bUlZBWb4NlpQS5CsDhmbLONUTRu4WPECTFIs0LamNv9cG48RIuLotpv2T5wI/k5kAvMHPt4HiFPtpjYFAe5Ba1JhxVh4pp3kQkS9supgcRXXLl4i0aygMNN+SDw7Lto90oAPY9Ae7HIEa+L9ynJLg745DcnM2RqqoVY7IjMJ3bHO7W1s97GgEWFWt0rGolbu09IG+Um2QQFUF6YAWrC5x9Afua+KfPajXbtD5oRqsv3GZhwmGoKE5ziqKQe9dIe4rYTdhKbYnScOOPH0s4AqCnMuVuBMdO9m6TBSP9RE+wsT/z80tFH+ueWJsZqI0hH5SUTO//lz1k9vE/jToFcunZ3i5SVO0cWwy2d8LDYR5NYW6PFaXRY0qXxfkwpQkuLBf3Hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(136003)(39830400003)(346002)(376002)(30864003)(38350700002)(5660300002)(38100700002)(166002)(52116002)(8936002)(2616005)(1076003)(26005)(6512007)(316002)(41300700001)(6486002)(107886003)(6506007)(6666004)(4326008)(6916009)(66574015)(8676002)(66946007)(66476007)(66556008)(83380400001)(186003)(2906002)(86362001)(36756003)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?668DGCDIeVdujJHl5jxgVJ/J1hkpNFEREkLui1rgsmpiqbKqP5L2LIzg1aAu?=
 =?us-ascii?Q?P3wFX1UcgIVeAUT5DVhhKS6D7axIKE3nkOhMrNJEYIh9U18f4G6b40KzEgUo?=
 =?us-ascii?Q?qLx1TW5Yw6Iz4dWe0FFL2cTOMhrkFfRf0mPFh5HYvBERtQUqRjDwrDXYx5q2?=
 =?us-ascii?Q?+G5G0ptZZe3u6I/IJwyDvYUGmnffjQ6LEhgglVjMKFtc73BHV6f6J8ATtBY2?=
 =?us-ascii?Q?k2fkopx+kHZOIgSECNJKz/CrvFjuq0OtW86KB8JIbBkIAfFUkD2xJvzUf3Kb?=
 =?us-ascii?Q?lT7tjn4BiDjlQWb1Ab8I718XWfAFVgocgjjEtBDS+GosUaffPBspoj22QV3D?=
 =?us-ascii?Q?/gY7JIybAej/3NjhJ7njQGX5uJ2oTgYNp2h6CtLDR0cDFgABxrwX75EL8tMy?=
 =?us-ascii?Q?2qc9EeQExomg5KJjX5wzdKQ/Lkh2YysYRsvzviPg644nt5PsNAc6YWROE15F?=
 =?us-ascii?Q?pc2fEDyzpAEy1P6yXjFCgRaoaRsPfh6j2DnbbfYRRwnRtaJTVDSdy3ovZEXi?=
 =?us-ascii?Q?bP0q5vdjjkxmQ1NIDoU867YSCI1AXeKqdWOcksv/w5wJ5GKei4RurF9sbJxP?=
 =?us-ascii?Q?R7y4Td2eq7l5iCFabAKboScAzS4hQi2UUr1yRDyRrKJafVK8IBFsAKVCFanv?=
 =?us-ascii?Q?I8nwOOlj+eRkSwX+fhV/pb5wFQcH7rziSqpc0YQryJvNIrcgsO4TdZdKyiw2?=
 =?us-ascii?Q?YOXBSBWaNDis4LfHlDoKiqYqu/3sYyLBqSFenBXkPwr1KfI2XW9lMexGNdwb?=
 =?us-ascii?Q?6N7tUE7bG/EcSx4nHU5lv2/wUX8oScdx7MYvI2jbr+xnFCVSKvJnIJaBTzbt?=
 =?us-ascii?Q?0wOlUDR9qQGTlFZL8uz2ob/SJi7YpaWEKIwk091YvhIjpbIif4aARbIcDGGh?=
 =?us-ascii?Q?lfibTQt14RpPedE4THXu45RAUMFqJTa639Zp90KcTGmvrhGXWjEXMlS3qk/d?=
 =?us-ascii?Q?RbU4UX0uj8THNFvOrT9hy0xaJNSeVBaehkhRUWLdM/n7EUeXo3PzK10mEolD?=
 =?us-ascii?Q?B7eo6HreGau35xdR3bYk1JInSQw5LNxzwNn3tzPASR8bAcLDMI0G3k/qUyQE?=
 =?us-ascii?Q?R/uExFXdMPxUgFOU4sAFSmDuqEKbP/F5UH/R6X9sF/cwJgOCi3QfTsByxTlT?=
 =?us-ascii?Q?su/ZLG789KrH0ZNSAtFrmMtGpYfoagpHfj9wCZ3wAwD4TfyeBeJqaWF5L8Iv?=
 =?us-ascii?Q?AHbykOE63fB3uuzPHXf2X9UubMbohIRQQO0mHFGc2+oh7eS5ptA8o9ianP/D?=
 =?us-ascii?Q?7nTFmm2Hq4RA0TUBM/gPGFu8rIQzfhy0/S7/WnIH4Jys21XOQX3hqUkyNBTF?=
 =?us-ascii?Q?Au5TDvRlcPqRe8C4m6swyYvYGEeIgOKnkcByJnR6RTJ8nS26K9SnkB89ytRL?=
 =?us-ascii?Q?y9WXgg7IdbhaokBvlOnvCatfNllLzQhdH1AQHkO4eaPBY0lndWF7LgBKw20u?=
 =?us-ascii?Q?EqJ8wdOs229gdlP+DQp42LFApaFAMZdSKm/EcEsLZNSQfw1xuEPrU4ciMaus?=
 =?us-ascii?Q?1I+EoQtMY7Fh+LfhXraLAHhdeIh2t0rJRj/rNGOaVk+7FBslOpftKGO0YNFo?=
 =?us-ascii?Q?asYpCt0/S5Y9OXeBn9VYSpsnrcPI5dTUFoy1MUcp?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d0b412-9fd4-42d0-22ef-08da6c16aea3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 19:16:30.2916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: giEi9mI+AN1Cv0uL/Yz8xCmmht1v8lwDu3Um5obv9FvZy6Zb2bKG+Siw4qcJAWoqGpNjRf0Borx6aZGuru1aVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR17MB1254
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoWe5OfdKKzqzPGSAXk19LQHe+70O5IW95JdPQOOkEI=;
 b=izVy1Bxf2rQi5rxz3x2nU2q8thLxiO4HPOpbfOr3gfhZnyIMrsHZeKzyFdgMHa2rW3dfZStKyHzukju9HZJp2yGIGC8xLgodMucPiA6EIMau5MAohwvWi/0YBkeOCCWo8NylL08XD/feIhExVpcqOOO1S5ghObjWZnAVNOQxlto=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=izVy1Bxf
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH v3] support/scripts/pkg-stats: migrate to CSS
 grid and inline javascript
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

This migrates pkg-stats.html from html tables to CSS grid, allowing
the use of newer, simpler javascript that is short enough to be
inlined, instead of relying on externally hosted javascript.

Javascript sorting function was rewritten from scratch in ~55 lines,
short enough to be inlined directly in the html.

Tables were redone in CSS grid, but with care taken to mimic existing
"look and feel" of prevous implementation, albeit with slightly
better responsive behavior and default styling characteristics.

Column labels are now "sticky" and stay stuck to the top of the
viewport as you scroll down the page.

Also, css was rewritten in fewer lines and table elements were changed
to divs (for grid support).

Other small misc fixes include quoted hrefs and document language
declarations to make the w3c html validator happy.

Signed-off-by: Sen Hastings <sen@phobosdpl.com>

---
v1->v2:
*   added new entry in DEVELOPERS as part of same commit
*   sent patch with UTF-8 instead of base64 transfer encoding 
v2->v3:
*   rewrote sortGrid to remove all UTF-8 characters.
*   also sortGrid is now slightly cleaner and only uses arrays.   
*   patch *hopefully* now us-ascii and will *not* be base64 encoded
---
 DEVELOPERS                |   3 +
 support/scripts/pkg-stats | 405 +++++++++++++++++++++-----------------
 2 files changed, 226 insertions(+), 182 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5c3c24ff7a..0246f80713 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2565,6 +2565,9 @@ F:	package/libbson/
 F:	package/lua-resty-http/
 F:	package/mpir/
 
+N:	Sen Hastings <sen@phobosdpl.com>
+F:	support/scripts/pkg-stats
+
 N:	Sergey Bobrenok <bobrofon@gmail.com>
 F:	package/sdbus-cpp/
 
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index f67be0063f..6dc206d2bc 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -718,89 +718,113 @@ def calculate_stats(packages):
 
 
 html_header = """
+<!DOCTYPE html>
+<html lang="en">
 <head>
-<script src=\"https://www.kryogenix.org/code/browser/sorttable/sorttable.js\"></script>
-<style type=\"text/css\">
-table {
-  width: 100%;
-}
-td {
-  border: 1px solid black;
-}
-td.centered {
-  text-align: center;
-}
-td.wrong {
-  background: #ff9a69;
-}
-td.correct {
-  background: #d2ffc4;
-}
-td.nopatches {
-  background: #d2ffc4;
-}
-td.somepatches {
-  background: #ffd870;
-}
-td.lotsofpatches {
-  background: #ff9a69;
-}
-
-td.good_url {
-  background: #d2ffc4;
-}
-td.missing_url {
-  background: #ffd870;
-}
-td.invalid_url {
-  background: #ff9a69;
-}
-
-td.version-good {
-  background: #d2ffc4;
-}
-td.version-needs-update {
-  background: #ff9a69;
-}
-td.version-unknown {
- background: #ffd870;
-}
-td.version-error {
- background: #ccc;
+<meta charset="UTF-8">
+<meta name="viewport" content="width=device-width, initial-scale=1">
+<script>
+function sortGrid(sortLabel){
+	let pkgSortArray = [], sortedPkgArray = [], pkgStringSortArray = [], pkgNumSortArray = [];
+	let columnValues = Array.from(document.getElementsByClassName(sortLabel));
+
+	columnValues.shift();
+	columnValues.forEach((listing) => {
+		let sortArr = [];
+		sortArr[0] = listing.id.replace(sortLabel+"_", "");
+		if (!listing.innerText){
+			sortArr[1] = -1;
+		} else {
+			sortArr[1] = listing.innerText;
+		};
+		pkgSortArray.push(sortArr);
+	})
+	pkgSortArray.forEach((listing) => {
+		if ( isNaN(parseInt(listing[1], 10)) ){
+			pkgStringSortArray.push(listing);
+		} else {
+			listing[1] = parseFloat(listing[1]);
+			pkgNumSortArray.push(listing);
+		};
+	})
+	sortedStringPkgArray = pkgStringSortArray.sort(function(a, b) {
+		const nameA = a[1].toUpperCase(); // ignore upper and lowercase
+		const nameB = b[1].toUpperCase(); // ignore upper and lowercase
+		if (nameA < nameB) { return -1;	};
+		if (nameA > nameB) { return 1; };
+		return 0;   // names must be equal
+	});
+	sortedNumPkgArray = pkgNumSortArray.sort(function(a, b) {
+		return a[1] - b[1];
+	});
+
+	let triangleUp = String.fromCodePoint(32, 9652);
+	let triangleDown = String.fromCodePoint(32, 9662);
+	let columnName = document.getElementById(sortLabel);
+
+	if (columnName.lastElementChild.innerText == triangleDown) {
+		columnName.lastElementChild.innerText = triangleUp;
+		sortedStringPkgArray.reverse();
+		sortedNumPkgArray.reverse();
+		sortedPkgArray = sortedNumPkgArray.concat(sortedStringPkgArray)
+	} else {
+		columnName.lastElementChild.innerText = triangleDown;
+		sortedPkgArray = sortedStringPkgArray.concat(sortedNumPkgArray)
+	}
+
+	sortedPkgArray.forEach((listing) => {
+		let row = Array.from(document.getElementsByClassName(listing[0]));
+		let packageGrid = document.getElementById("package-grid");
+		row.forEach((element) => { packageGrid.append(element)});
+	})
 }
+</script>
 
-td.cpe-ok {
-  background: #d2ffc4;
-}
+<style>
 
-td.cpe-nok {
-  background: #ff9a69;
+.label {
+  position: sticky;
+  top: 1px;
 }
-
-td.cpe-unknown {
- background: #ffd870;
+.label{
+  background: white;
+  padding: 10px 2px 10px 2px;
 }
-
-td.cve-ok {
-  background: #d2ffc4;
+#package-grid, #results-grid {
+  display: grid;
+  grid-gap: 2px;
+  grid-template-columns: 1fr repeat(12, min-content);
 }
-
-td.cve-nok {
-  background: #ff9a69;
+#results-grid {
+  grid-template-columns: 3fr 1fr;
 }
-
-td.cve-unknown {
- background: #ffd870;
+.data {
+  border: solid 1px gray;
 }
-
-td.cve_ignored {
- background: #ccc;
+.centered {
+  text-align: center;
 }
+ .wrong, .lotsofpatches, .invalid_url, .version-needs-update, .cpe-nok, .cve-nok {
+   background: #ff9a69;
+ }
+ .correct, .nopatches, .good_url, .version-good, .cpe-ok, .cve-ok {
+   background: #d2ffc4;
+ }
+ .somepatches, .missing_url, .version-unknown, .cpe-unknown, .cve-unknown {
+   background: #ffd870;
+ }
+ .cve_ignored, .version-error {
+  background: #ccc;
+ }
 
 </style>
+
 <title>Statistics of Buildroot packages</title>
+
 </head>
 
+<body>
+
 <a href=\"#results\">Results</a><br/>
 
 <p id=\"sortable_hint\"></p>
@@ -808,13 +832,13 @@ td.cve_ignored {
 
 
 html_footer = """
-</body>
 <script>
-if (typeof sorttable === \"object\") {
-  document.getElementById(\"sortable_hint\").innerHTML =
-  \"hint: the table can be sorted by clicking the column headers\"
+if (typeof sortGrid === "function") {
+  document.getElementById("sortable_hint").innerHTML =
+  "hint: the table can be sorted by clicking the column headers"
 }
 </script>
+</body>
 </html>
 """
 
@@ -841,73 +865,87 @@ def boolean_str(b):
 
 
 def dump_html_pkg(f, pkg):
-    f.write(" <tr>\n")
-    f.write("  <td>%s</td>\n" % pkg.path)
-
+    f.write( f'<div id=\"package_{pkg.name}\" \
+	class=\"package data {pkg.name}\">{pkg.path}</div>\n')
     # Patch count
-    td_class = ["centered"]
+    data_field_id = f'patch_count_{pkg.name}'
+    div_class = ["centered patch_count data"]
+    div_class.append(pkg.name)
     if pkg.patch_count == 0:
-        td_class.append("nopatches")
+        div_class.append("nopatches")
     elif pkg.patch_count < 5:
-        td_class.append("somepatches")
+        div_class.append("somepatches")
     else:
-        td_class.append("lotsofpatches")
-    f.write("  <td class=\"%s\">%s</td>\n" %
-            (" ".join(td_class), str(pkg.patch_count)))
+        div_class.append("lotsofpatches")
+    f.write( f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
+	\">{str(pkg.patch_count)}</div>\n')
 
     # Infrastructure
+    data_field_id = f'infrastructure_{pkg.name}'
     infra = infra_str(pkg.infras)
-    td_class = ["centered"]
+    div_class = ["centered infrastructure data"]
+    div_class.append(pkg.name)
     if infra == "Unknown":
-        td_class.append("wrong")
+        div_class.append("wrong")
     else:
-        td_class.append("correct")
-    f.write("  <td class=\"%s\">%s</td>\n" %
-            (" ".join(td_class), infra_str(pkg.infras)))
+        div_class.append("correct")
+    f.write( f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
+	\">{infra_str(pkg.infras)}</div>\n')
 
     # License
-    td_class = ["centered"]
+    data_field_id = f'license_{pkg.name}'
+    div_class = ["centered license data"]
+    div_class.append(pkg.name)
     if pkg.is_status_ok('license'):
-        td_class.append("correct")
+        div_class.append("correct")
     else:
-        td_class.append("wrong")
-    f.write("  <td class=\"%s\">%s</td>\n" %
-            (" ".join(td_class), boolean_str(pkg.is_status_ok('license'))))
+        div_class.append("wrong")
+    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
+	\">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
 
     # License files
-    td_class = ["centered"]
+    data_field_id = f'license_files_{pkg.name}'
+    div_class = ["centered license_files data"]
+    div_class.append(pkg.name)
     if pkg.is_status_ok('license-files'):
-        td_class.append("correct")
+        div_class.append("correct")
     else:
-        td_class.append("wrong")
-    f.write("  <td class=\"%s\">%s</td>\n" %
-            (" ".join(td_class), boolean_str(pkg.is_status_ok('license-files'))))
+        div_class.append("wrong")
+    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
+	\">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
 
     # Hash
-    td_class = ["centered"]
+    data_field_id = f'hash_file_{pkg.name}'
+    div_class = ["centered hash_file data"]
+    div_class.append(pkg.name)
     if pkg.is_status_ok('hash'):
-        td_class.append("correct")
+        div_class.append("correct")
     else:
-        td_class.append("wrong")
-    f.write("  <td class=\"%s\">%s</td>\n" %
-            (" ".join(td_class), boolean_str(pkg.is_status_ok('hash'))))
+        div_class.append("wrong")
+    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
+	\">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
 
     # Current version
+    data_field_id = f'current_version_{pkg.name}'
     if len(pkg.current_version) > 20:
         current_version = pkg.current_version[:20] + "..."
     else:
         current_version = pkg.current_version
-    f.write("  <td class=\"centered\">%s</td>\n" % current_version)
+    f.write(f'  <div id=\"{data_field_id}\" \
+	class=\"centered current_version data {pkg.name}\">{current_version}</div>\n')
 
     # Latest version
+    data_field_id = f'latest_version_{pkg.name}'
+    div_class.append(pkg.name)
+    div_class.append("latest_version data")
     if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
-        td_class.append("version-error")
+        div_class.append("version-error")
     if pkg.latest_version['version'] is None:
-        td_class.append("version-unknown")
+        div_class.append("version-unknown")
     elif pkg.latest_version['version'] != pkg.current_version:
-        td_class.append("version-needs-update")
+        div_class.append("version-needs-update")
     else:
-        td_class.append("version-good")
+        div_class.append("version-good")
 
     if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
         latest_version_text = "<b>Error</b>"
@@ -927,74 +965,81 @@ def dump_html_pkg(f, pkg):
         else:
             latest_version_text += "found by guess"
 
-    f.write("  <td class=\"%s\">%s</td>\n" %
-            (" ".join(td_class), latest_version_text))
+    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{latest_version_text}</div>\n')
 
     # Warnings
-    td_class = ["centered"]
+    data_field_id = f'warnings_{pkg.name}'
+    div_class = ["centered warnings data"]
+    div_class.append(pkg.name)
     if pkg.warnings == 0:
-        td_class.append("correct")
+        div_class.append("correct")
     else:
-        td_class.append("wrong")
-    f.write("  <td class=\"%s\">%d</td>\n" %
-            (" ".join(td_class), pkg.warnings))
+        div_class.append("wrong")
+    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{pkg.warnings}</div>\n')
 
     # URL status
-    td_class = ["centered"]
+    data_field_id = f'upstream_url_{pkg.name}'
+    div_class = ["centered upstream_url data"]
+    div_class.append(pkg.name)
     url_str = pkg.status['url'][1]
     if pkg.status['url'][0] in ("error", "warning"):
-        td_class.append("missing_url")
+        div_class.append("missing_url")
     if pkg.status['url'][0] == "error":
-        td_class.append("invalid_url")
-        url_str = "<a href=%s>%s</a>" % (pkg.url, pkg.status['url'][1])
+        div_class.append("invalid_url")
+        url_str = "<a href=\"%s\">%s</a>" % (pkg.url, pkg.status['url'][1])
     else:
-        td_class.append("good_url")
-        url_str = "<a href=%s>Link</a>" % pkg.url
-    f.write("  <td class=\"%s\">%s</td>\n" %
-            (" ".join(td_class), url_str))
+        div_class.append("good_url")
+        url_str = "<a href=\"%s\">Link</a>" % pkg.url
+    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{url_str}</div>\n')
 
     # CVEs
-    td_class = ["centered"]
+    data_field_id = f'cves_{pkg.name}'
+    div_class = ["centered cves data"]
+    div_class.append(pkg.name)
     if pkg.is_status_ok("cve"):
-        td_class.append("cve-ok")
+        div_class.append("cve-ok")
     elif pkg.is_status_error("cve"):
-        td_class.append("cve-nok")
+        div_class.append("cve-nok")
     elif pkg.is_status_na("cve") and not pkg.is_actual_package:
-        td_class.append("cve-ok")
+        div_class.append("cve-ok")
     else:
-        td_class.append("cve-unknown")
-    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
+        div_class.append("cve-unknown")
+    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
     if pkg.is_status_error("cve"):
         for cve in pkg.cves:
-            f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
+            f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (cve, cve))
         for cve in pkg.unsure_cves:
-            f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s <i>(unsure)</i><br/>\n" % (cve, cve))
+            f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s <i>(unsure)</i></a><br/>\n" % (cve, cve))
     elif pkg.is_status_na("cve"):
         f.write("    %s" % pkg.status['cve'][1])
     else:
         f.write("    N/A\n")
-    f.write("  </td>\n")
+    f.write("  </div>\n")
 
     # CVEs Ignored
-    td_class = ["centered"]
+    data_field_id = f'ignored_cves_{pkg.name}'
+    div_class = ["centered data ignored_cves"]
+    div_class.append(pkg.name)
     if pkg.ignored_cves:
-        td_class.append("cve_ignored")
-    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
+        div_class.append("cve_ignored")
+    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
     for ignored_cve in pkg.ignored_cves:
-        f.write("    <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (ignored_cve, ignored_cve))
-    f.write("  </td>\n")
+        f.write("    <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (ignored_cve, ignored_cve))
+    f.write("  </div>\n")
 
     # CPE ID
-    td_class = ["left"]
+    data_field_id = f'cpe_id_{pkg.name}'
+    div_class = ["left cpe_id data"]
+    div_class.append(pkg.name)
     if pkg.is_status_ok("cpe"):
-        td_class.append("cpe-ok")
+        div_class.append("cpe-ok")
     elif pkg.is_status_error("cpe"):
-        td_class.append("cpe-nok")
+        div_class.append("cpe-nok")
     elif pkg.is_status_na("cpe") and not pkg.is_actual_package:
-        td_class.append("cpe-ok")
+        div_class.append("cpe-ok")
     else:
-        td_class.append("cpe-unknown")
-    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
+        div_class.append("cpe-unknown")
+    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
     if pkg.cpeid:
         f.write("  <code>%s</code>\n" % pkg.cpeid)
     if not pkg.is_status_ok("cpe"):
@@ -1008,79 +1053,75 @@ def dump_html_pkg(f, pkg):
         else:
             f.write("  %s\n" % pkg.status['cpe'][1])
 
-    f.write("  </td>\n")
-
-    f.write(" </tr>\n")
+    f.write("  </div>\n")
 
 
 def dump_html_all_pkgs(f, packages):
     f.write("""
-<table class=\"sortable\">
-<tr>
-<td>Package</td>
-<td class=\"centered\">Patch count</td>
-<td class=\"centered\">Infrastructure</td>
-<td class=\"centered\">License</td>
-<td class=\"centered\">License files</td>
-<td class=\"centered\">Hash file</td>
-<td class=\"centered\">Current version</td>
-<td class=\"centered\">Latest version</td>
-<td class=\"centered\">Warnings</td>
-<td class=\"centered\">Upstream URL</td>
-<td class=\"centered\">CVEs</td>
-<td class=\"centered\">CVEs Ignored</td>
-<td class=\"centered\">CPE ID</td>
-</tr>
+<div id=\"package-grid\">
+<div style="grid-column: 1;" onclick="sortGrid(this.id)" id=\"package\" class=\"package data label\"><span>Package</span><span></span></div>
+<div style="grid-column: 2;" onclick="sortGrid(this.id)" id=\"patch_count\" class=\"centered patch_count data label\"><span>Patch count</span><span></span></div>
+<div style="grid-column: 3;" onclick="sortGrid(this.id)" id=\"infrastructure\" class=\"centered infrastructure data label\">Infrastructure<span></span></div>
+<div style="grid-column: 4;" onclick="sortGrid(this.id)" id=\"license\" class=\"centered license data label\"><span>License</span><span></span></div>
+<div style="grid-column: 5;" onclick="sortGrid(this.id)" id=\"license_files\" class=\"centered license_files data label\"><span>License files</span><span></span></div>
+<div style="grid-column: 6;" onclick="sortGrid(this.id)" id=\"hash_file\" class=\"centered hash_file data label\"><span>Hash file</span><span></span></div>
+<div style="grid-column: 7;" onclick="sortGrid(this.id)" id=\"current_version\" class=\"centered current_version data label\"><span>Current version</span><span></span></div>
+<div style="grid-column: 8;" onclick="sortGrid(this.id)" id=\"latest_version\" class=\"centered latest_version data label\"><span>Latest version</span><span></span></div>
+<div style="grid-column: 9;" onclick="sortGrid(this.id)" id=\"warnings\" class=\"centered warnings data label\"><span>Warnings</span><span></span></div>
+<div style="grid-column: 10;" onclick="sortGrid(this.id)" id=\"upstream_url\" class=\"centered upstream_url data label\"><span>Upstream URL</span><span></span></div>
+<div style="grid-column: 11;" onclick="sortGrid(this.id)" id=\"cves\" class=\"centered cves data label\"><span>CVEs</span><span></span></div>
+<div style="grid-column: 12;" onclick="sortGrid(this.id)" id=\"ignored_cves\" class=\"centered ignored_cves data label\"><span>CVEs Ignored</span><span></span></div>
+<div style="grid-column: 13;" onclick="sortGrid(this.id)" id=\"cpe_id\" class=\"centered cpe_id data label\"><span>CPE ID</span><span></span></div>
 """)
     for pkg in sorted(packages):
         dump_html_pkg(f, pkg)
-    f.write("</table>")
+    f.write("</div>")
 
 
 def dump_html_stats(f, stats):
     f.write("<a id=\"results\"></a>\n")
-    f.write("<table>\n")
+    f.write("<div class=\"data\" id=\"results-grid\">\n")
     infras = [infra[6:] for infra in stats.keys() if infra.startswith("infra-")]
     for infra in infras:
-        f.write(" <tr><td>Packages using the <i>%s</i> infrastructure</td><td>%s</td></tr>\n" %
+        f.write(" <div class=\"data\">Packages using the <i>%s</i> infrastructure</div><div class=\"data\">%s</div>\n" %
                 (infra, stats["infra-%s" % infra]))
-    f.write(" <tr><td>Packages having license information</td><td>%s</td></tr>\n" %
+    f.write(" <div class=\"data\">Packages having license information</div><div class=\"data\">%s</div>\n" %
             stats["license"])
-    f.write(" <tr><td>Packages not having license information</td><td>%s</td></tr>\n" %
+    f.write(" <div class=\"data\">Packages not having license information</div><div class=\"data\">%s</div>\n" %
             stats["no-license"])
-    f.write(" <tr><td>Packages having license files information</td><td>%s</td></tr>\n" %
+    f.write(" <div class=\"data\">Packages having license files information</div><div class=\"data\">%s</div>\n" %
             stats["license-files"])
-    f.write(" <tr><td>Packages not having license files information</td><td>%s</td></tr>\n" %
+    f.write(" <div class=\"data\">Packages not having license files information</div><div class=\"data\">%s</div>\n" %
             stats["no-license-files"])
-    f.write(" <tr><td>Packages having a hash file</td><td>%s</td></tr>\n" %
+    f.write(" <div class=\"data\">Packages having a hash file</div><div class=\"data\">%s</div>\n" %
             stats["hash"])
-    f.write(" <tr><td>Packages not having a hash file</td><td>%s</td></tr>\n" %
+    f.write(" <div class=\"data\">Packages not having a hash file</div><div class=\"data\">%s</div>\n" %
             stats["no-hash"])
-    f.write(" <tr><td>Total number of patches</td><td>%s</td></tr>\n" %
+    f.write(" <div class=\"data\">Total number of patches</div><div class=\"data\">%s</div>\n" %
             stats["patches"])
-    f.write("<tr><td>Packages having a mapping on <i>release-monitoring.org</i></td><td>%s</td></tr>\n" %
+    f.write("<div class=\"data\">Packages having a mapping on <i>release-monitoring.org</i></div><div class=\"data\">%s</div>\n" %
             stats["rmo-mapping"])
-    f.write("<tr><td>Packages lacking a mapping on <i>release-monitoring.org</i></td><td>%s</td></tr>\n" %
+    f.write("<div class=\"data\">Packages lacking a mapping on <i>release-monitoring.org</i></div><div class=\"data\">%s</div>\n" %
             stats["rmo-no-mapping"])
-    f.write("<tr><td>Packages that are up-to-date</td><td>%s</td></tr>\n" %
+    f.write("<div class=\"data\">Packages that are up-to-date</div><div class=\"data\">%s</div>\n" %
             stats["version-uptodate"])
-    f.write("<tr><td>Packages that are not up-to-date</td><td>%s</td></tr>\n" %
+    f.write("<div class=\"data\">Packages that are not up-to-date</div><div class=\"data\">%s</div>\n" %
             stats["version-not-uptodate"])
-    f.write("<tr><td>Packages with no known upstream version</td><td>%s</td></tr>\n" %
+    f.write("<div class=\"data\">Packages with no known upstream version</div><div class=\"data\">%s</div>\n" %
             stats["version-unknown"])
-    f.write("<tr><td>Packages affected by CVEs</td><td>%s</td></tr>\n" %
+    f.write("<div class=\"data\">Packages affected by CVEs</div><div class=\"data\">%s</div>\n" %
             stats["pkg-cves"])
-    f.write("<tr><td>Total number of CVEs affecting all packages</td><td>%s</td></tr>\n" %
+    f.write("<div class=\"data\">Total number of CVEs affecting all packages</div><div class=\"data\">%s</div>\n" %
             stats["total-cves"])
-    f.write("<tr><td>Packages affected by unsure CVEs</td><td>%s</td></tr>\n" %
+    f.write("<div class=\"data\">Packages affected by unsure CVEs</div><div class=\"data\">%s</div>\n" %
             stats["pkg-unsure-cves"])
-    f.write("<tr><td>Total number of unsure CVEs affecting all packages</td><td>%s</td></tr>\n" %
+    f.write("<div class=\"data\">Total number of unsure CVEs affecting all packages</div><div class=\"data\">%s</div>\n" %
             stats["total-unsure-cves"])
-    f.write("<tr><td>Packages with CPE ID</td><td>%s</td></tr>\n" %
+    f.write("<div class=\"data\">Packages with CPE ID</div><div class=\"data\">%s</div>\n" %
             stats["cpe-id"])
-    f.write("<tr><td>Packages without CPE ID</td><td>%s</td></tr>\n" %
+    f.write("<div class=\"data\">Packages without CPE ID</div><div class=\"data\">%s</div>\n" %
             stats["no-cpe-id"])
-    f.write("</table>\n")
+    f.write("</div>\n")
 
 
 def dump_html_gen_info(f, date, commit):
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
