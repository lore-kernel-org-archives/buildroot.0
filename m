Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153FFC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 23:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F8A160D65;
	Thu, 28 Jul 2022 23:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F8A160D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7k0PAzajal9M; Thu, 28 Jul 2022 23:24:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F49E60B47;
	Thu, 28 Jul 2022 23:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F49E60B47
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0EA81BF360
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 23:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8CEC4159F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 23:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8CEC4159F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5ej-eV8kjnI for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 23:24:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94A8A41586
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2092.outbound.protection.outlook.com [40.107.220.92])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94A8A41586
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 23:24:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmP48Fn6zgH/ftxv4yWf+3X3e3k821aQUY1AaoQbti8RQxOU0IbGm16cqzusFv/kAxf+ISrx4RBY+ANELHwTUX9h3/+K8kM9QMNGsfBGg+qkp8d7YiGp+Q0UY7luVVvbA8CZ0ZQs/U2HefATa3OI4Da1wuy4rdOGvpTNMmphE7dAwFMKko0Fg3sqDU7i/56DYNpMbu812yMd/24iXkB4BV8sBrFuFYuw3i3x6mhJh545VOpj+LXbHkKby8QrH8VA1XyIBX6Y00gs86s3dIMf7iKQMXozQUbbkOJ3YrPFgeyvLMWaewKC8G0wH/P1mHoyD2MXyRU/UkC74XRQvegefQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jerkwkIR8UVcXIL+NRabnI77ROO6blSOGZR5HQae0Sg=;
 b=Kfz5Ql6H9JCDSDb3Z4xPl0Nltvxvk+Ae29J1k5nkGqgI43kLcKnJmTIHOYg5mFSPWCqo0oFXWbJdai6tMJKyR1DBNB932y9o1cmCIxdiCAVaJzSmD2A9K41QNnS0dp42L+WGmbnk1NuUwKZdjIQ5cv5bHA1p3mLe6tI4soeU2B9TYPd62pDGMOpKdPHnTWFnSXBNCaJmu2pvJ/cgQz5+Tpv66YOHh4u3aXG9AlF6G0fMSdEZlfFjRCO/YLqV0HZzXOia05nSdvipizSvJYMxPW9tlNVcdQp5xSuO3Yl6EVxB0tQFfaDZCCa1Ip3BZdy3ezar8j1XNaYwDocEcWUOhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by DM6PR17MB3084.namprd17.prod.outlook.com (2603:10b6:5:193::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 23:24:25 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f%7]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 23:24:25 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 18:23:57 -0500
Message-Id: <20220728232357.270130-3-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220728232357.270130-1-sen@phobosdpl.com>
References: <20220728232357.270130-1-sen@phobosdpl.com>
X-ClientProxiedBy: SN6PR04CA0081.namprd04.prod.outlook.com
 (2603:10b6:805:f2::22) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 404125b6-2ecc-4da3-581a-08da70f04f4b
X-MS-TrafficTypeDiagnostic: DM6PR17MB3084:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n5rE3pO8Ey4tfxefpSTS0IxuorKIiMewyE3+0bN1VjMKk+GmLl3mcXNdMR2mJDbCyKxCmHB+zTsem3aqI3TOTFc2r6rKisrEXvlEPTq/bH9iTlyg9rSsEa7h2aEOIo7P5bENvHNs+0z1lEaRg7Ztj431WxMTC3oXGqO14ZxARlTdCCIrPJZHxCgc/JIbTIqfozysI4LwLdg4/YkVSnzw4Ahlad4mk/1zme34/1rIbDv9iYKiio9X/UiICkf90zUUeDlNzqu3OO6DUw7Bhzz8nSRVvgJOg5kDA6+hcJYNNKyX7eW37TBnNxeeK+95ZJWI4T1gr7bs7GqFI9RG8h8KCk1hnyBLCooTZEZMPApjYcluSEN0qSSZ1c2gNyPcPjW4eAzhxtEu6wsN0A5mMYg4rtH87vSV1kxv9F65tp3Oivd0ziSXHv83zkEH83ICChm2cYKVnM1GJkUPQVets3pUbUeWtJogvEoxzdiuROZKEXb4mAZiHEMw6XexkWHlghKpl/UUyt7E0ZTn0TieD7Z6vE3t4+m8L3J045z1UhsYQ6ZsC8RuOQQZelBafl7mNwi0iuRo1rE9T2iqCuPApfgMAMhEofHi3SraynssAJnJpdiWeRnFvFG1JTAVqhHbWLF8T2RvK92fFFFQNCeeScgRbqT2CsIjt1AREpV479nGPiEGIle+MFboDYd5hM/RSiPR6T+ZB65uQh1U0SaqhNylHECad23w3Gz0+l2tFzRSYWyL2wwvBiwMG5RzUElOS+qxCSYA0HAsHDexS9SOFKRAG2JBPsbJaYddOL3MJP903Hg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(346002)(376002)(39830400003)(366004)(38100700002)(38350700002)(2906002)(86362001)(5660300002)(8936002)(66476007)(52116002)(6506007)(298455003)(41300700001)(6666004)(26005)(6916009)(316002)(6486002)(83380400001)(478600001)(36756003)(6512007)(8676002)(66556008)(4326008)(66946007)(2616005)(1076003)(107886003)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mwZmasUDB9hybL6I8GhueqKE4mJ5Ahmg8RGK4Nh4ztjfmdaD5sqv6VhJ3wSU?=
 =?us-ascii?Q?oVPLkDWiQpMPpqF5BtxGSqvfw4xQpZZ2mhH+FZFzu6BPU4cuIGCNqmtZ8L+I?=
 =?us-ascii?Q?J5/v9tmX76uwCMdq+j98czxL1Zo+R2p6VGqrDJVWNg2cftHyK5mtwR/bRVdQ?=
 =?us-ascii?Q?8hn7NH2KfzvG5inqiAuizhG9Z8T8+ABYwUwoNOxqk0rbSM0ghy1yjKlYJmv0?=
 =?us-ascii?Q?2g82hp4JMWkf5RbRis0QZ7tiWaywr4M1aO36G3PdnEQl/iO97sOaeiDidpgG?=
 =?us-ascii?Q?9FKfb9iowjm72j2EN9bcopM5Q0NOVlavAhij2Y+5HegVIRrElGC+WuWhACwX?=
 =?us-ascii?Q?D2j0TaMzYAue0/MLcFjSfYc5ffGO/AtAU0N5rPWgW4QBfa+JFZGaSoh+zL9P?=
 =?us-ascii?Q?wkBjy08BEZKluBrOsyrWDkeZet38IbteXMGJe4LKXLlAvPvXUA4suFxC9Ew6?=
 =?us-ascii?Q?1u5AELW06fjFi4cNn5EQujQtjV9fMyt4fftiXqA8pZW37e33kUWZnD0nQKRW?=
 =?us-ascii?Q?X/UoiMzFkZrOUGlZfukxcg5iMPm3ZZ+ASc8Dgd8fP965GIoPYf3rFMOvAU2s?=
 =?us-ascii?Q?K0g3BbIOFHj3h7M9s1ovbeRn48EHZaV9EsQAaPJFum/2O+FKnYKjtCa9K69e?=
 =?us-ascii?Q?KQtFr2Spt814jrWnUHidD3IKqDIWSrsnZ9TaQIrb8zQAK1JzaJxSOMML0tz/?=
 =?us-ascii?Q?qbsgSqzgJHyYR1udDbFqjYUVs+kmTiWlyUeUcZYWYzOmLEaavr9db2YhTLGV?=
 =?us-ascii?Q?gzzpiWuhUpFDfdz/2DTn0V079QPGc1w9skyAvc9a6b8tnriqMquaddVOc0yh?=
 =?us-ascii?Q?LocZ7hF4PR+ixXRrFvi+s+c6I23EzyTwCmAHVbMtJ5He1Tr9p4lh1AY1jJhP?=
 =?us-ascii?Q?FIiNYSmjx1EzXMCZwJm26V/p9KO9Je1xbvPDRsACusXVMbD+NvHh7r45ej6Q?=
 =?us-ascii?Q?yaOQsshF4D9W10Ph1OLvYClr7OnDPXrmuREg42ZNR0AXSYKYWre+V9va5L7T?=
 =?us-ascii?Q?/ZDgJGfscD1I2mZsjjH9MF6UZDx8cvE2QVqqTS0eSXTe/CBfoi7cgh9e0DIe?=
 =?us-ascii?Q?2zXZwRplsLlNGLKZUPRDAzkOU4Ex4VavzkVGa7tFKxADFtyJMH6Gsc7rwSRn?=
 =?us-ascii?Q?spI65X4r7Ncb1bhFnAqLyHwROHyidbX6SzEAD8/xyghT29uxXelrPia1OGuV?=
 =?us-ascii?Q?mkAySCR0/O2arS30bKqb1zbgbxXA8073dm1kiMywCoZhKTfkYcbitC84A3gy?=
 =?us-ascii?Q?QzNpPtmeSF4ypvlWFUpbbETKBhiJM8VK/vBUHpx4cdYWRQ5E1wDEQcZ9eewt?=
 =?us-ascii?Q?liBbcRjmN/EPtucNGZOQqzl8IO1uv8QwSAcqwHCLbh4BeL9Lf6flSqlsqlkn?=
 =?us-ascii?Q?R7IuPLNIcTUxIydxlti6Iggy4qHPS1ABtEUFrQGZC8DEFSgGmDcLRjTSEfmY?=
 =?us-ascii?Q?Y8WLqhREd176yoOUT0dmC4rT69MQ8FDcYxE79JxJq6OsxmKvqt5wRx2cAsnj?=
 =?us-ascii?Q?yA5lJbHcVzYRYNorC6tjdEDYV/eilFY/q6yobTDlcgItdbP2H9CKuIi/bkbV?=
 =?us-ascii?Q?mVixy7GwmLoljjnT5EFvP2dvcqSX4o375aSCtju7?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404125b6-2ecc-4da3-581a-08da70f04f4b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 23:24:25.2239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zbxdwrs+6CPWAekeEPNXemZwrBorJVPQiuCL4SbHWKT0rz+nMHUcCLGLKgXHar7Btv48QpxAR7xUXc8h7bBzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR17MB3084
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jerkwkIR8UVcXIL+NRabnI77ROO6blSOGZR5HQae0Sg=;
 b=Gqrd4q1XhLhU+7bB9+2gTSuDRJgfKsiKcBUAiCHI+XMcFp+xmbufW3lBeM7fGJMRQ38CeLe7dWgJYZGBhlp0/ekfwnlnBpax7v2DgWg07+HARwxdxnOGahpbHVXWZaQQ2BXa26/ME+KeINAGnaVIh3e0F2cc/7aid+qxwzv7eA0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=Gqrd4q1X
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 3/3] support/scripts/pkg-stats: re-implement the
 sortable_hint
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

This attempts to re-implement the "sortable_hint" feature without
relying on words. The column headers and CVE expand/contract buttons
change color and cursor style on hover.

If Javascript is enabled:

Just like [PATCH 1/3] more rules are applied to the
generated stylesheet before content is loaded.

If Javascript is disabled:

The headers stay pearly white. :-)

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
---
 support/scripts/pkg-stats | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 4b396d3217..7a68b5dca9 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -750,11 +750,13 @@ var lastColumnName = false;
 const styleElement = document.createElement('style');
 document.head.insertAdjacentElement("afterend", styleElement);
 const styleSheet = styleElement.sheet;
-const collapseRule = ".collapse{ height: 200px; overflow: hidden scroll;}"
-const buttonRule = ".see-more{ display: block;}"
+addedCSSRules = [
+".collapse{ height: 200px; overflow: hidden scroll;}",
+".see-more{ display: block;}",
+".label:hover,.see-more:hover { cursor: pointer; background: #d2ffc4;}"
+];
 
-styleSheet.insertRule(collapseRule);
-styleSheet.insertRule(buttonRule);
+addedCSSRules.forEach(rule => styleSheet.insertRule(rule));
 
 function sortGrid(sortLabel){
 	let i = 0;
@@ -816,8 +818,7 @@ function sortGrid(sortLabel){
 		let rule = "." + listing[0] + " { grid-row: " + i + "; }";
 		styleSheet.insertRule(rule);
         });
-	styleSheet.insertRule(collapseRule);
-	styleSheet.insertRule(buttonRule);
+	addedCSSRules.forEach(rule => styleSheet.insertRule(rule));
 };
 
 function expandField(fieldId){
@@ -887,17 +888,10 @@ function expandField(fieldId){
 
 <a href=\"#results\">Results</a><br/>
 
-<p id=\"sortable_hint\"></p>
 """  # noqa - tabs and spaces
 
 
 html_footer = """
-<script>
-if (typeof sortGrid === "function") {
-  document.getElementById("sortable_hint").innerHTML =
-  "hint: the table can be sorted by clicking the column headers"
-}
-</script>
 </body>
 </html>
 """
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
