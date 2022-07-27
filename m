Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D25DC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11ADE60BF1;
	Wed, 27 Jul 2022 15:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11ADE60BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d9Tzyyve_qty; Wed, 27 Jul 2022 15:42:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AB56606BF;
	Wed, 27 Jul 2022 15:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AB56606BF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DAD81BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25D7A82796
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25D7A82796
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nLva-21iNlND for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:42:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EAEF82726
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2117.outbound.protection.outlook.com [40.107.93.117])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EAEF82726
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:42:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6cJmQWvaZvx3zQKSp+G1oFrhiOLZIA2p1mSmaMGwu5uOf9z0HUGjKbx6s+cCFycRpb82SBb7oi0Rqk6t2DitnHeRlzbxLk5kkwx/Rv3FzJsTritOVLc4xyvW8ap8ugtAiiaZuxt3T+/Y0BQN31PQHqn2pC2VnYh7XrJTlWWQwwStM6+lWjz0XIIJ2HjB+pwBoNjTtc7aRHO61V7qs0BG+mkdNKTIgBvQMuTk5ShmTiCVrjST1gebuA6t2KTKAkybKwZEwewAsCh9QfrgiMZ8a2BFeau9h1Nia5sxKhprDWIsPh2AE02jJpKxBKio6VtN2baIVQcdJvdLHt5Xbqbww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPRUCvVpEfewrQ+hDOLd3e87O6bo7/Bx6tq2viPK+9E=;
 b=llEoPdH6/kxKgnQdo392PZSxw3Q4QwVugOeMW2T2SV7EIzOFXi1ROz/PmSYnLqnehSBpn57Lr0LCxx3S8zwytCIFGx2AQs3PUA9ByOxRXDzye/celM0MXtXHxCJ7mr88fVzO1oFrES73AN/y92q5WrCopq7hwvUslcFwgaIlKbVVHg0emzo3VQfomCRJdZfYTSXDj4bchF76o/pdND+UEPd/y3/xRNXdiGvWdRN155O7prkaduMzvYYhLd5aybluFTKcoC5JuOqn8qOHTri7ipM0XSxQOm9MPBd/PgyA+kQmTb80dIC0crKty5qfrGkbKTcAmAEJrIiR1w9d9AXrMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by BN8PR17MB2820.namprd17.prod.outlook.com (2603:10b6:408:52::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Wed, 27 Jul
 2022 15:42:35 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f%7]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 15:42:35 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 10:41:12 -0500
Message-Id: <20220727154114.1378721-3-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727154114.1378721-1-sen@phobosdpl.com>
References: <20220727154114.1378721-1-sen@phobosdpl.com>
X-ClientProxiedBy: SN6PR08CA0005.namprd08.prod.outlook.com
 (2603:10b6:805:66::18) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 199ff60d-bc62-42be-8244-08da6fe69d3e
X-MS-TrafficTypeDiagnostic: BN8PR17MB2820:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yA4LDWS9W6R/OdHrCoQ/9IS+a4CGp8L9+RUftZKUm/aPoRVzRM/UQ9prkZ+MaEKUYCDCZkFZbcXhWn3xJbM6i+c/9eeoyfmoN0XeZb+1lNuFSxn7SBdKF/Nv8vi9Lyo2Fl9T+Ms3wSSJnGYcmronsYA47IEBouzDgnEES5EFw8BXjX0tPat1ayXu7YHcDLHY6Xi7tzhi8kRD8PKmZamyFz4Fa3pOt+Mb/2gu9UGxtt7OKGXvMny3hm8ac7cP+aOsyPgi18vAjv+M+myKQjtyTJBx9sKxEA6mHp7cCDH1q7WVKP3XCh4qA1is02FHwG9rco+kWF/H1wKry340RAlazKrUAdlzEumT2MNymvV8iAf+2wfxOoBm4CLh9/0Cj2qlSPe3sq93smXeIVvHbKbuTfM44r3WjkG2KFgbz/n81sZef0q9CZYUmpENjKPNxllvLQXYsKcx9Ksy5w4yTNhx9+GQLhySgADF8QvqK1iHcUhIQrMLud1xcc7WJrlWgKSzmcPiiHstCWIcucMtZdWIK4/jm1KUFS/FxVDcH0SMDtN8hZQdlqJy8Cua4eb6tGCT/wfwuX/zhV+gRuF+bVTNxWdCvHfUURXXwZjRAInbE0gehRwWDRbBwe5KQqv44lwDQxbJ3sVXPH0I2oQJw8VNFvWIKyX6WmST1tr3s6FBnCJDJVB2Fd561Xuikpj4JaC9EaVq2WHKYyAHLC695nSBmC5P+F9ddnHbtxoGovQKVvdkqLhKJWyl6qoYO348spLLoytf0vApMZjgRSE0Qt5kHHFI7eYz3PqmuSyBrYNj7OtUUA+ab3Q4P9InL/w3CsrOJxwGUwEV9PWVcicjv8Ekzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(136003)(396003)(366004)(39830400003)(83380400001)(8936002)(5660300002)(107886003)(1076003)(38100700002)(38350700002)(186003)(6666004)(41300700001)(478600001)(52116002)(6506007)(6512007)(26005)(6486002)(6916009)(316002)(36756003)(2616005)(86362001)(66476007)(66556008)(66946007)(8676002)(4326008)(2906002)(4210325003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Q5x90leontLH6hUF2CjTIJJcQBWC3OPHToCMyqa3VaPegYYxUWkdFu+OIUN?=
 =?us-ascii?Q?/6bOkokpXW8JYZss9E5OCU82W9itb62NTzjOqYlX6aheju7csG4SOXBICURw?=
 =?us-ascii?Q?9jRLXqCGppymQfeaUMqshvHSXCvYfHQgELw834v4YJ/ukR6dgplq2I4KVXcL?=
 =?us-ascii?Q?St/gXYMZ8ietmvcp1d2i79tnqH9u9ZOB9GwvYXJMHatAd2rRxyx7+IaFjbIa?=
 =?us-ascii?Q?WxQslyKhEGnzXlIIJP6zl8TDROxVvQnhpWdnYVyH+LnAN7g7dxB6eiSLMKSI?=
 =?us-ascii?Q?m2ZaD6It3rh2I9TP/38yk6t2JXZd6rnb11h0s1XnFF7lfcrC58xGaxfryJjJ?=
 =?us-ascii?Q?kmBsZGr44UEBZMkNS+WSiAibxmhKPVHPsZPOP8v6HeTCynv20UZggmJtxO8S?=
 =?us-ascii?Q?5oJnRWf3GxaBUmYOvQtI7HarXwaeBa1OpdPYHDCtWOI95iA43mA+l7fllYuz?=
 =?us-ascii?Q?7AIII2ETy+JWU9DsrwS0HVRj4WNnC0dQFKp2CejmSU9VNupCqc8nGejGoDtb?=
 =?us-ascii?Q?jzJ0/AnCDCH0Nsq9e9ln5XnR2B2QRiIeaLbjP3NIWyUQuvU4d0+J+Pc8Etiq?=
 =?us-ascii?Q?swHiNzKclS3HCzCQ6i/nqifg5Bk9uDnPIyFmwjMc8rhT9twWsbgtXOVIhovD?=
 =?us-ascii?Q?zagPLpGWRPtxr9tewDOE+osGf6d3DYzfM28xit/oG4DgKS6A0iubGLJ4u7i9?=
 =?us-ascii?Q?0gsRRJunp1sqscEUlM24CBTxhYqQ4qp6nQK9fd7u/quLAjcu0RzYyxgh0QSy?=
 =?us-ascii?Q?OmE/ybPrMKhgT6tOQGCUzeN331aKYDFCNWK+9OlQxFftpxgUMTmrkSQSRYbO?=
 =?us-ascii?Q?Zb6SyzU4wYlIqSaPk/1Nvk4SRwXt9Bpa3tf3N3EL3GzwOcrsar/NwPDYPxQa?=
 =?us-ascii?Q?VPfRktGBZp/zKMclqXDbfTjuzKBR55wJ0T/8m3qkIgoe2Bp9vT7baJ2+f5ur?=
 =?us-ascii?Q?yjLpYKXGZT8Qn3W0MdZMH21aPLOEm+nTNSur55wzMxcxhsl0LEFL0F7uQAQn?=
 =?us-ascii?Q?kujogQAcRWHCp8QwDu+2JjYd/IZBQyj75Sw/ZHC8k0pT1k/T1WsCVCqBBaZH?=
 =?us-ascii?Q?4xma7o5FqQVqTp4LKcDPvHoCHg4Vvf5ThU0dfIVZ7hwoVBTvosqiOhPNcvlL?=
 =?us-ascii?Q?jeSmrvXBtiHJukz7Xot76TPnl8RVrllcn74pWqcMCXo5eTxMXfrE5MI7vKLl?=
 =?us-ascii?Q?Qrakwg60J6HB19xc04hzhvbbCmiKrNa4C1eHQpMkUA0J8sg5t9XGGBk18zCu?=
 =?us-ascii?Q?qMQ5H/vjdtraThBLWy0GzCOI+GrLzr5Tad3qUwDdvVQTOMtyvQ6UpJgYnCZX?=
 =?us-ascii?Q?149kMm9ElFpSjAz6La586MgHg4LUt5E2vXdRnQFNDwgz23xhXJemXirWEkoF?=
 =?us-ascii?Q?V3bM0l52ICiHjgF0ueoJRQun4b7fRuwuOzHY9cY5fgmX/bScht/5xGFJNzHs?=
 =?us-ascii?Q?iXZo+nFH+OmFjlJWAjzCQCWM5yqhiFkAMXGTwxhaCgrVystgmS7EutdS86DY?=
 =?us-ascii?Q?lFlFahwusJmL/9N5IIWDMJZ0nsNoTTFP8tc0CahhZbTAfKMajwyPCe9/8FKX?=
 =?us-ascii?Q?FuJLmSoPuDEfthDWZjzl49fcSbpIfQXNAO+es9M4?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 199ff60d-bc62-42be-8244-08da6fe69d3e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 15:42:29.9345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqXtEakY3xkD707HXi+BdvHzhNDLmzme98+yE+loGVsd8bZwHnqyrcQyYZse+S5N91SE3ED7/6XnnFd9DA2SiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR17MB2820
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPRUCvVpEfewrQ+hDOLd3e87O6bo7/Bx6tq2viPK+9E=;
 b=l77ZhncAsBKTU4nFZ/4+QqxiUiVk7ndZas2+ax7HuHw+sgIxbel0ANj1frqPN6fP3Lr4XSN4vG5EtCewwdSd1M3YVN2Gz8yPkDLtELE9pcZFX/TscgHUvpioO2sNZD3DQYK8sRUQEY/CWuvt/8ygsUVSbOGgCcYjAl4G4v/aT80=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=l77ZhncA
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 2/4] support/scripts/pkg-stats: fixed sortGrid()
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
Cc: Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sortGrid() has been rewritten to dynamically generate stylesheets with
explicit grid-row properties to re-order the cells, instead of removing
and reinserting the cells.
Performance *should* now be comperable to sort-table.js.

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
---
 support/scripts/pkg-stats | 116 +++++++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 52 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index b2a8ddd446..0fb44d1e11 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -738,60 +738,72 @@ html_header = """
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
