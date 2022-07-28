Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C457C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 02:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3194982C38;
	Thu, 28 Jul 2022 02:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3194982C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ltT7L4FnxBfS; Thu, 28 Jul 2022 02:15:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AD3482A0B;
	Thu, 28 Jul 2022 02:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AD3482A0B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 796B51BF94B
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 02:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E8FC41774
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 02:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E8FC41774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83L9eTXuBNsv for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 02:15:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D99841719
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2118.outbound.protection.outlook.com [40.107.223.118])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D99841719
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 02:15:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTexNuHyiUP+RNRUo2X8kXOUSk4K4BsgOUdWqhL8feq/ox9vv3VE41QknhQWpAG38onR9bsffArOziHEJMoJARS1HzTVXA+51H1HwViiXyuGXLWiK0YJt0FB8P11MPVWEXgvywPnUBSTLQowskI1zsaDhaii+3tCcSEuEwwQXDqE4FH/TOY1uffJLaoe9970lJ93BmiwmC/LXv2gLUgviJSY0N5uKsvbJHC5Bnn6/QQUEDVQ6SJaaRbVYwBgW/vOSs9tLGmHVAcAaQcYwAmdLS67zdn+ZFmgWYXRSsDCdUtt4eLAcfhQ05YlEfyjKfkysYAWPnbk72/Lbv6sVkx4wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKa90j6tdHPlZO/GiwMAbVhrzI8kHy+xjeuoleBPW6U=;
 b=Q2kslgagVYnig65XSpihiKR9u2AzT+M9Gtx9r1HBv9eCs+hgd0XEAbrueVA5ZupGEvc+WkNh991yexFjOWS2d1M2J5JI70yXC5iZKbE1ETpKTKNHB+2FTq98CNN06WUYmQlvTsTEgGY7qJI3umw2OrAhCkbTzUdH4PSGHIDgCNXZ9M24T7wV3PAuQgwRE5yug1zNYTyKVEaPmtIqjPIkZUIHAFAqFQt26L0IKptGxdq75AbCF+E3L53nh6MMxAjGaNUXmFvGblCLs4HVyebcwJir0WvKmxBV3Aex2eWIdl2qQMO/RuJO+kjeZlRaoexZ7kx9dRdjhpcU+7fMNsHQEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from CH2PR17MB3512.namprd17.prod.outlook.com (2603:10b6:610:3b::30)
 by CY4PR17MB0950.namprd17.prod.outlook.com (2603:10b6:903:a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Thu, 28 Jul
 2022 02:15:42 +0000
Received: from CH2PR17MB3512.namprd17.prod.outlook.com
 ([fe80::e828:d088:296:c]) by CH2PR17MB3512.namprd17.prod.outlook.com
 ([fe80::e828:d088:296:c%4]) with mapi id 15.20.5482.006; Thu, 28 Jul 2022
 02:15:42 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 21:14:44 -0500
Message-Id: <20220728021444.135820-3-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220728021444.135820-1-sen@phobosdpl.com>
References: <20220728021444.135820-1-sen@phobosdpl.com>
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To CH2PR17MB3512.namprd17.prod.outlook.com
 (2603:10b6:610:3b::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eee204bb-3d49-469b-0186-08da703f1290
X-MS-TrafficTypeDiagnostic: CY4PR17MB0950:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iphGqMLETQZFBtVB1I0WJmUFqgwH9bABm9ZOCQDTcPfnREk88h7wp32eS2dAYLeXTIR7uCJ2FVjjtGNmS1n4Xo7EPDC7GSx8/sdJB1c9tw86K8H3EGztdk6XiiI5E2sG8+IgaNq5/K2//ql9mz2i6iWRt4kTEKzPPainp7w0WcAJkU7MhVua/+7j+8Gekhg0JeIE0iA0hn+Lown6KXDZ0BVCHu+xiV4pp6itZLUEm5bEfaRVOSmg5GaHgmTSNFx9VPN/Oos9WdhKJepeXkqNOaDrJwk8DqdoITCgsqkyjfesy9Ss6t1lL6PHiikZ31McelHjhmzywC4UtoMQKLGEKtSN26BJI/YkOb3jBxgM7KdBe2UolhLVtl9B5qq7FWZSfeTSB2hOeVGC3BAJ40b6F2NOCq1MaGlqoUOESefsnYM26iDPiNEpIN4SAi5PqLRx74gljTEf8UwmIdgdW3Ab1mbg90YyBxtEd/Ldf94s23HcfPcIX9VhLb9BdiM977neQGREfuT3DkE1VT4KmSxYfgV0uEMOGAsaCpIHAkKFBJCoWc/olEqOjHP3quumtIim7V11x0A5qrnAezfkAeAxE35tjXdXY9r4LHeezPq5FMZA+FQsov0vZ0Dwcq93wVDiibjuIjC/6Ekxu+hh9G0H9dShXzWZqPCO32xj4NCBh4x7NnnBUPvMBz3Im//mMABHDmGWiS2x1Cgvu5rBuXJZkwCYWNzAxUG0abUzcC/qAFpK+kda0F0ScYZ/4qHpH8JumNFgmIlQRraXeRGEVPC5HVgD4TCQNV5Qr3iJh+7hOjNy6V4WfU/lF5M+qLWCS08KDTIBo6kGQfR8mE3tHGBGBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR17MB3512.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(136003)(39830400003)(346002)(366004)(38350700002)(8936002)(8676002)(54906003)(38100700002)(5660300002)(6486002)(316002)(66556008)(66946007)(4326008)(36756003)(186003)(6916009)(66476007)(86362001)(6506007)(478600001)(41300700001)(1076003)(26005)(52116002)(2616005)(6512007)(2906002)(83380400001)(4210325003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g92MKmtwFUGHwe7N5adrHMWoAOdTG5MnLUxErlqkbxQR6Yl/nSHGd54sMfeN?=
 =?us-ascii?Q?ZkD5ybxk3z5J8KPQLibF3/m9EMW7YEC++VPz0GyUZa5BLHBD1euTs6n4UHW+?=
 =?us-ascii?Q?olCHeid8dfSJAEYSqB9kq3jd93nUQ/4jPQZhbZkrs9XH5XLzoXi1B8fEZMBJ?=
 =?us-ascii?Q?a8n/XtgahAwGr3jO9hlfDWi/zTN4ABrw6u8JLw5k+65FIKO3/bsmOzlX0IJs?=
 =?us-ascii?Q?fh3ftdprq9Y6EffihOJAY75bY9sdcG3ULEfUECVOToAxlZ844cqcjHyTZjgi?=
 =?us-ascii?Q?IkyIXIT1X6t33SN9+IMy4J9v12E4guIsNq7MIWlvIyjgqxyTTYnjEpoCq/4/?=
 =?us-ascii?Q?etqNB7J63gEMQau6j9O63ha+wf2+TjFVQgsLvRtDgBQPOTBRPOXBTtsvVIEC?=
 =?us-ascii?Q?6XOJJxpy7JGt/5Q0b6Zz0JteuV2dhk1zhz9fGaapVc9Q7xYP6TL6uZy0AVGw?=
 =?us-ascii?Q?F7GbGW6nhmi6dmwHq7tuKzV2Lp0q+DhDoDpl/p/uYZosK7QeCB+A71YQwmKW?=
 =?us-ascii?Q?XHQp1JvV+Yec+8Tfu74TaePmHXcbn/7UBFS7Q/nzLokweAi8RnSB5ifdzvLl?=
 =?us-ascii?Q?58O9BpHoLMg9t8E3R9yUUGxkCOVGuXAirDEjX3oAPMV7ORu/yVlX11kyZc25?=
 =?us-ascii?Q?yFThayn7Nd3SGuuiGqUzwmoDHWRNS5Czfo7CwpdUpxj1h2GyGs3IWmbQGxU6?=
 =?us-ascii?Q?7dyVs3YKeLO1dsXvOj96eobrSy5ooY48bEg5KRSu8B/jPRkrrb1OMDJMjUBM?=
 =?us-ascii?Q?/RUo8mEDYEbOqSEOpOO0xzdPw+0+L9UjDa6tfIJoxy+6AdAsgqf0B3CSDnpR?=
 =?us-ascii?Q?Pl6oHXe0tbXprXXgc8bzdJ7F08feERYFM72j2PTojqhwBNyS7o0373qfEdkg?=
 =?us-ascii?Q?vpinQ02k/qy2IwTxv/di2lQg+dxuycPZuGS4eUNCalHYhb2XD/w2+stPiPdE?=
 =?us-ascii?Q?g75Q7R9IxFmiF2DkPeKtMN5ZsxqUIDy8gY1/XP4hFZL6S7x9Ber8kWaeTCyX?=
 =?us-ascii?Q?3uvo80hJwLFMIGCnM8QdJMaJAtmKD+wYCBefOjMhBSEkWeojnT5xKFFs4Szg?=
 =?us-ascii?Q?AozwIxqyO5ciffsq1/2AZXRfrbvEaagcPDEpStPLRPf403wl2ZkopDPhtPbU?=
 =?us-ascii?Q?62SrAFK8qK0bYD1VQHfjLhQ7DMJnS5jDX25BSvL6qkavU7+OaHDGuoLLX+RK?=
 =?us-ascii?Q?248QuwWmrT8Z1n613lkIF+goKimm5JhoMYEaeFrNDm3jsz9GYIYqMmT3vWzP?=
 =?us-ascii?Q?+L3FpfO3xYKiplztwlodgJPdaQi+N2cahVWv1ozQGhBLDw9LfCOMSOXdHTx6?=
 =?us-ascii?Q?o+224qGhvElFK3jIrrDXeRZnvTdOXDk8JDf7IRhwCCkrkqdv/MVi5AtgEqGa?=
 =?us-ascii?Q?+PdNgc2uijyqzYBmgtPd/sUAifjk5StY2anwjKN4s+7ZIE/Y2FdRK0MQ6KMd?=
 =?us-ascii?Q?fdh4sZ8XIxPhXwM6LbGfcYh0Ub7oDGqYXvQd7u37wmODuMd1wsgY/owKuIMY?=
 =?us-ascii?Q?g4aAq2lpaCZSGif39nTPR7NUXb5zvsCOrbkCigWtg0A2kOx69ZxrQFRNo+B1?=
 =?us-ascii?Q?k9UfR2UQZ5zl9uBt8hGK64B9UouDe4O4wZSreofr?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee204bb-3d49-469b-0186-08da703f1290
X-MS-Exchange-CrossTenant-AuthSource: CH2PR17MB3512.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 02:15:42.4430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3yXJhBBUSOzZHPeUPz1yIQZRHXgXjbDQ/M6D8U4q1a/Ueq0RkmJ80ExC6iyNXIhoE6TGA0LmN02Zy6Ebi9diw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR17MB0950
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKa90j6tdHPlZO/GiwMAbVhrzI8kHy+xjeuoleBPW6U=;
 b=gJfq7MKCLOCXqXRgxelyH1ieMNK8qapM0NW4Mhu3kGKMQOwIF4lrGtTycLWvRtz9oNISPI9b5EnwhtT8D13W/d0K50Ngfrcv2GZQNUjP3KgEvuGk0+20lCxdX0HR5uPNE46f6p4YotNOBZD/VBS2eilyyb0srgY3WPO2DiMviNY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=gJfq7MKC
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 2/2] support/scripts/pkg-stats: fixed sortGrid()
 performance
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

sortGrid() has been rewritten to dynamically generate stylesheets with
explicit grid-row properties to re-order the rows, instead of removing
and reinserting the cells.
Performance *should* now be comperable to sorttable.js.

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
---
 support/scripts/pkg-stats | 116 +++++++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 52 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index d3ec65edbb..d795131cef 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -744,60 +744,72 @@ html_header = """
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <script>
+const triangleUp = String.fromCodePoint(32, 9652);
+const triangleDown = String.fromCodePoint(32, 9662);
+var lastColumnName = false;
+
 function sortGrid(sortLabel){
+	let i = 0;
 	let pkgSortArray = [], sortedPkgArray = [], pkgStringSortArray = [], pkgNumSortArray = [];
-	let columnValues = Array.from(document.getElementsByClassName(sortLabel));
-
-	columnValues.shift();
-	columnValues.forEach((listing) => {
-		let sortArr = [];
-		sortArr[0] = listing.id.replace(sortLabel+"_", "");
-		if (!listing.innerText){
-			sortArr[1] = -1;
-		} else {
-			sortArr[1] = listing.innerText;
-		};
-		pkgSortArray.push(sortArr);
-	})
-	pkgSortArray.forEach((listing) => {
-		if ( isNaN(parseInt(listing[1], 10)) ){
-			pkgStringSortArray.push(listing);
-		} else {
-			listing[1] = parseFloat(listing[1]);
-			pkgNumSortArray.push(listing);
-		};
-	})
-	sortedStringPkgArray = pkgStringSortArray.sort(function(a, b) {
-		const nameA = a[1].toUpperCase(); // ignore upper and lowercase
-		const nameB = b[1].toUpperCase(); // ignore upper and lowercase
-		if (nameA < nameB) { return -1;	};
-		if (nameA > nameB) { return 1; };
-		return 0;   // names must be equal
-	});
-	sortedNumPkgArray = pkgNumSortArray.sort(function(a, b) {
-		return a[1] - b[1];
-	});
-
-	let triangleUp = String.fromCodePoint(32, 9652);
-	let triangleDown = String.fromCodePoint(32, 9662);
-	let columnName = document.getElementById(sortLabel);
-
-	if (columnName.lastElementChild.innerText == triangleDown) {
-		columnName.lastElementChild.innerText = triangleUp;
-		sortedStringPkgArray.reverse();
-		sortedNumPkgArray.reverse();
-		sortedPkgArray = sortedNumPkgArray.concat(sortedStringPkgArray)
-	} else {
-		columnName.lastElementChild.innerText = triangleDown;
-		sortedPkgArray = sortedStringPkgArray.concat(sortedNumPkgArray)
-	}
-
-	sortedPkgArray.forEach((listing) => {
-		let row = Array.from(document.getElementsByClassName(listing[0]));
-		let packageGrid = document.getElementById("package-grid");
-		row.forEach((element) => { packageGrid.append(element)});
-	})
-}
+	const columnValues = Array.from(document.getElementsByClassName(sortLabel));
+	const columnName = document.getElementById(sortLabel);
+	let lastStyle = document.getElementById("sort-css");
+
+	if (lastStyle){
+		lastStyle.disable = true;
+		lastStyle.remove();
+	};
+	const styleElement = document.createElement('style');
+	styleElement.id = "sort-css";
+	document.head.appendChild(styleElement);
+	const styleSheet = styleElement.sheet;
+
+        columnValues.shift();
+        columnValues.forEach((listing) => {
+                let sortArr = [];
+                sortArr[0] = listing.id.replace(sortLabel+"_", "");
+                if (!listing.innerText){
+                        sortArr[1] = -1;
+                } else {
+                        sortArr[1] = listing.innerText;
+                };
+                pkgSortArray.push(sortArr);
+        });
+        pkgSortArray.forEach((listing) => {
+                if ( isNaN(parseInt(listing[1], 10)) ){
+                        pkgStringSortArray.push(listing);
+                } else {
+                        listing[1] = parseFloat(listing[1]);
+                        pkgNumSortArray.push(listing);
+                };
+        });
+
+        let sortedStringPkgArray = pkgStringSortArray.sort((a, b) => {
+                if (a[1].toUpperCase() < b[1].toUpperCase()) { return -1; };
+                if (a[1].toUpperCase() > b[1].toUpperCase()) { return 1; };
+                return 0;
+        });
+        let sortedNumPkgArray = pkgNumSortArray.sort((a, b) => a[1] - b[1]);
+
+        if (columnName.lastElementChild.innerText == triangleDown) {
+                columnName.lastElementChild.innerText = triangleUp;
+                sortedStringPkgArray.reverse();
+                sortedNumPkgArray.reverse();
+                sortedPkgArray = sortedNumPkgArray.concat(sortedStringPkgArray);
+        } else {
+                columnName.lastElementChild.innerText = triangleDown;
+                sortedPkgArray = sortedStringPkgArray.concat(sortedNumPkgArray);
+        };
+
+	if (lastColumnName && lastColumnName != columnName){lastColumnName.lastElementChild.innerText = ""};
+	lastColumnName = columnName;
+	sortedPkgArray.unshift(["label"]);
+        sortedPkgArray.forEach((listing) => {
+		i++;
+		let rule = "." + listing[0] + " { grid-row: " + i + "; }";
+		styleSheet.insertRule(rule);
+        });
+};
 </script>
 
 <style>
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
