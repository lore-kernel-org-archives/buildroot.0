Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E1DC25B06
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 20:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E4F140914;
	Fri,  5 Aug 2022 20:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E4F140914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QAx-DWaNlJFl; Fri,  5 Aug 2022 20:01:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B486404CD;
	Fri,  5 Aug 2022 20:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B486404CD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB34D1BF417
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 20:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A31178346C
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 20:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A31178346C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 74a6ShLic1Mj for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 20:01:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A2CD83EFB
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2114.outbound.protection.outlook.com [40.107.220.114])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A2CD83EFB
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 20:01:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDgRqcXeiUuZdqgd37mPY0KTn21vXnbRewok2LS4g1UxOJ5gLDxqI990nWqWQjEl65TWbK4gac+xZUKzPn1yTQ2ekDC7QOH6pH9ypB0jTzlXmwevDLY42H/jbkc6rVDU9jZkoLhiXhh7IP+LBE/F1Y65if8RqLg9Hreeenq9f4bfdUZAJs4SGoPmBvgvX92xzUbcF5dlojsGwsU4oB4k3JM57v+Ar6mXdnzEnPEyeNigfgkmggu6gGv4dU7sYDKwPRTbyU1eATMCU1mIrEq+5yDpC+0InxlSY+alemA7T/wpL7xtdEWAuBZF6FZoe9XBGEHv65hsVwRucp7wNWUPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVL1ZNUqY1ESCtgHbmug1rRTCm3abVkuOQhxVT+yr7M=;
 b=h1T1uZBnUb8yEl8iOzhVTh3op26hozl+oiMhGpL1KRMXHItJNCsXIN56PT+ZP7nbE2PwDji5O2xWD0zve8LCuG/PwIC1tcVdUngEML+GhYyPzklGntqx4ad0bWXfK9WAuLgQo0iwspek8kdrpCopQNvyEHAwj61JE8ftdMbFxV1CuYkFVXfbpTE9b0LQM/lDURBhoVzPAf4GfqVxnUSS/4nZiXKSRpC19O/yKJaUE/md3fwCS4M7o5KExe5N10AzwCuvA3vAcnFMt08XlwRtWXqlgoC2LelkFBBsUFaK7+fXzkhR0iBhh8G2ePDZFUugxbN5srC4//WNSpYeJ29y9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by BY3PR17MB5252.namprd17.prod.outlook.com (2603:10b6:a03:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 20:01:39 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f%3]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 20:01:39 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Fri,  5 Aug 2022 15:01:14 -0500
Message-Id: <20220805200114.288208-2-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805200114.288208-1-sen@phobosdpl.com>
References: <20220805200114.288208-1-sen@phobosdpl.com>
X-ClientProxiedBy: SA0PR12CA0027.namprd12.prod.outlook.com
 (2603:10b6:806:6f::32) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33adbb3d-50b3-463d-a2be-08da771d4f07
X-MS-TrafficTypeDiagnostic: BY3PR17MB5252:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H55YEoDN/fnpp1ONBHPVKCvndPEVbGWbfFwbLiadC7DSTJbX2Wtao+HUTkVQxi8Q19JuMWoFHOp6sCUHX4+YiGVjtb7D+/VBwaLaT1tBLSu+m7WfR0xkRIvxfxsOi2WAb8PEqZR6ksTsjAMxJpxf3ye7sBuy3tUbVUA0jScWWopdWZB21W+gx0iUrB6i4YxgUOrJ8oIcDYYoh8nxXuRj63HKWDuBdedLwLjzSUaLe+WlI4efkN2KIz1auAqgLdy/vuCGD6W5w6J9DwHHJV5M99O/wMKp0C1jwH/5Sl9VIK5LWrnoLDbE2YtJZ14mTCa7pjVKiHGr2wj1c1jfMCjRqiVwE7xdjYnQVWrtyQIa++eChYziRbbYc9P0mhnHG9UJxwSJOesD1DHIXxdpMhAuPrmU4GKhSgXJY4OVcU40AC4LWoFXVA5CQC6ee0XJCdaDTPjHBj7P1F6+0Opr7U11ulWfULOs5PkFSya7vaDYsSyJGvs8Z5zIoTQMoRq/ojcWJ74nOfNQCBa2ajXAnI0acSwI/3uqIXfghYxB0ncWhIYTXcnuP4NENYlRx7MHjMAlfkuRjd2nfg/PhS8k4Rr6QUhxvX4s1xm5sftVK03r0C0F7yGKOOyxlvHt7vYtlKf5hegAW4LsS/lDXf53Oa7MD8mCH1R6rkXPofHzIAyIp1xdH16wg+3WNNytTeLbwlw+Rx2DFfYIqOg+eJ772mvPImp3wWKOW/cr7Ykp9DhB3i3e9TWtTT+qPo/EagFQ7h8HRJj78Jbg0xi2XVJs6eQ1oYUf3691jC3hXAvq4VtOxCpj5xAQ6M+3WDeMUd+oDCo4BTVKJmOPEXn+XX+esTdpIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39830400003)(346002)(376002)(136003)(366004)(396003)(6486002)(966005)(478600001)(66946007)(6512007)(66556008)(316002)(19627405001)(41300700001)(26005)(2906002)(6666004)(6506007)(36756003)(52116002)(86362001)(1076003)(6916009)(8936002)(107886003)(30864003)(2616005)(166002)(38100700002)(66476007)(8676002)(4326008)(186003)(5660300002)(38350700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nd0upjhulTV8m28fZN6dIa5rl7Q0hwUTT8t/Rl0fSpuoarcqs9/SXTjXhlTo?=
 =?us-ascii?Q?2B17epE+b4C97dLwv6du5xChi3m3fyDvIZrH1CkU1qa0J/+a2aIAxHX6k0cf?=
 =?us-ascii?Q?srfYVNql5wvKeafSrd5WRuHNBu29WBlQlaNpBbKwFG3LvqlJV4fI82YCw4EQ?=
 =?us-ascii?Q?aamluqfS53xAyVXNcTBHiT9sV2jh+hRnmvAUohF9hesEVHUuPtqC2TBOp3b6?=
 =?us-ascii?Q?F8ieyGGhSNEJWO0ECd1v/DL6VkloRNdFxajUBMWnrZTaxIywpWWvivyGHlKV?=
 =?us-ascii?Q?iCRV3dUiBYSEdb7jC5oPXZ5dnUp5gn4YrKrFIwRG1brTu3uFTot463p2JiFD?=
 =?us-ascii?Q?35qrxZxIDm0w1Zv3xXKzh0k7ECpxOQMKS7vMZ8e18Dc0tVoAUkCOP20nbZdz?=
 =?us-ascii?Q?t2s6IV59J1Vyfa2x3QZvHCZ+kDNvHzeN5trfQem87hDTvyuxmz3oEoLfAofL?=
 =?us-ascii?Q?pD3rhcvujx1ffaep71P5765Jh30DSuxStamGC9gTgprEylag5AFbE0LVElBe?=
 =?us-ascii?Q?GIESB2GzLnwRNCAsM+mnOAv8wLLCChueAUQuw8zxG+Q+n7k7yjEeSb3Tknue?=
 =?us-ascii?Q?x7j9X1+ves7nLfnrTUyrHq06Mbskj8niDbfJE8bSwtHbC/QTa+4IA6OM09y1?=
 =?us-ascii?Q?93JZo7IRDdlPssLMUHiaTQ34Fg8Lyz13gUAbO2Zk9pHsj54APEhLFSfNn7ga?=
 =?us-ascii?Q?5ZRzSNscn+63xHlmviMZ1f3265Ytbb/PqYiplcUnWc3UUnpTbDgcZq3aGSyb?=
 =?us-ascii?Q?BBOkg/ttzZ95wMD1sKTMpwgXJuKgzxeb6bYQlbB62Y3VkQ1Ji57/AqftA83n?=
 =?us-ascii?Q?LqLultL3wpPwDnjzC97yugOFqCVhofNNeNd6gpgnnfPPdL9Hum/KRrW6yO1D?=
 =?us-ascii?Q?Y5keFAa361eflGStZMCSJFY78WOuQk5lmEkMyAMbHS2p2o7W8GC53qsIFatY?=
 =?us-ascii?Q?I4hJHkuWxujVREt2FH2Dp/oCYxy16sScmBSRgfQCJ82NhohaHDZ3Wx7sqCdm?=
 =?us-ascii?Q?HzudIbjdxzFZN2JfgW7yXq9NTCzeMI3fE0qH0qgOgOUD/IF9dT2raTxxLM0e?=
 =?us-ascii?Q?SoL2QwxqyAnm0NW5pEFBeEjrStJH69Iy+AFJ1wggGS3ZdXdUnXulaadsQxRh?=
 =?us-ascii?Q?hn6E1Iq/DDYJSfbcBGJ3K6rpgh1rPrc6Aum3Z4KngUGUgmAxoJ8h1cDMCiqC?=
 =?us-ascii?Q?EgDAwBuJJY2axLglGijCfBdG1EGBN5vF4onns7YWawLnL6TASdUh4+lLhFK1?=
 =?us-ascii?Q?7GViOX+S5SFF6uzO3+vT0nMaiReJ3WiaR2JMJh7A7bWb6XQLCp14auGG5ge3?=
 =?us-ascii?Q?q5TydzgxLC0Cl2LbKkwDu1XLnxxQzYsBH+G4OumkO94JAFjEiKnqdfPbHYVC?=
 =?us-ascii?Q?GaFCah4Aj2oChbz2KucwctdJUdXXkSHtHn4KzXOKp2zsCO6cszHnS4y/FRRZ?=
 =?us-ascii?Q?4jG7u2RGTTXVZl2EiYYI/Rre0AK42+tPWaK3JAnPaN7/aOOsbWFapAI5mLxh?=
 =?us-ascii?Q?gPuvbIJZ51YDuuXic7brYXxz1+y/VaYJltGqyv1Pt2jhCzGHTQCgDnDe1k0z?=
 =?us-ascii?Q?R8scgzg3Mt9t6kBw/h492ToPFnyFxHglyzvBgx1C?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33adbb3d-50b3-463d-a2be-08da771d4f07
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 20:01:39.1878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dJP5zPNYwwaZKRscI+cdo9i5e4TJRS0+UtOrQGlqruc9SS2gOnr75p7vVdCu9O4aFnvagGBgOaFDsmjpI0V4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR17MB5252
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVL1ZNUqY1ESCtgHbmug1rRTCm3abVkuOQhxVT+yr7M=;
 b=HnC04e/D5cUSzrvsMc3zKoPoAWwifH0lZkkPcAywY1W75oQW7b4H9HsGMj1FoCRicob6epf3Du7ulN/IsFxf8hKB9We8F0wlkHYIpHNRSbkrNxcXX74XMhWzbB3/DIF7l6bncEM0tdp05rh0cqsIH+urdT4+pbvu5gmq/3qb+vA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=HnC04e/D
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH v1 2/2] support/scripts/pkg-stats: optimize CSS
 selector usage
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

Having lots of CSS selector declarations adds up, especially at 70k+
elements.

This reduces the number of CSS selectors printed in the markup
to the bare minimum, by using pseudo-classes and tag names as selectors.

example: https://sen-h.github.io/pkg-stats/9ad05210dcd9e4fb6b6a45be87c0fbb3e022085b.html

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
---
v1->v2:
*   added link to example html
---
 support/scripts/pkg-stats | 132 ++++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 62 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 39da5e5593..654b918911 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -845,7 +845,20 @@ function expandField(field){
 
 <style>
 
-.see-more{
+div {
+  text-align: center;
+  border: solid 1px gray;
+}
+#results-grid div{
+  text-align: left;
+}
+#package-grid div:nth-child(13n+1), #package-grid div:nth-child(13n+13)  {
+  text-align: left;
+}
+#package-grid div:nth-child(13){
+  text-align: center;
+}
+.see-more {
   display: none;
 }
 
@@ -859,6 +872,7 @@ function expandField(field){
   padding: 10px 2px 10px 2px;
 }
 #package-grid, #results-grid {
+  border: none;
   display: grid;
   grid-gap: 2px;
   grid-template-columns: 1fr repeat(12, min-content);
@@ -866,21 +880,15 @@ function expandField(field){
 #results-grid {
   grid-template-columns: 3fr 1fr;
 }
-.data {
-  border: solid 1px gray;
+.correct, .nopatches, .good_url, .version-good, .cpe-ok, .cve-ok {
+  background: #d2ffc4;
 }
-.centered {
-  text-align: center;
+.wrong, .lotsofpatches, .invalid_url, .version-needs-update, .cpe-nok, .cve-nok {
+  background: #ff9a69;
+}
+.somepatches, .missing_url, .version-unknown, .cpe-unknown, .cve-unknown {
+  background: #ffd870;
 }
- .correct, .nopatches, .good_url, .version-good, .cpe-ok, .cve-ok {
-   background: #d2ffc4;
- }
- .wrong, .lotsofpatches, .invalid_url, .version-needs-update, .cpe-nok, .cve-nok {
-   background: #ff9a69;
- }
- .somepatches, .missing_url, .version-unknown, .cpe-unknown, .cve-unknown {
-   background: #ffd870;
- }
  .cve_ignored, .version-error {
   background: #ccc;
  }
@@ -926,9 +934,9 @@ def boolean_str(b):
 
 
 def dump_html_pkg(f, pkg):
-    f.write(f'<div class=\"data\">{pkg.path}</div>\n')
+    f.write(f'<div>{pkg.path}</div>\n')
     # Patch count
-    div_class = ["centered data"]
+    div_class = []
     if pkg.patch_count == 0:
         div_class.append("nopatches")
     elif pkg.patch_count < 5:
@@ -939,7 +947,7 @@ def dump_html_pkg(f, pkg):
 
     # Infrastructure
     infra = infra_str(pkg.infras)
-    div_class = ["centered data"]
+    div_class = []
     if infra == "Unknown":
         div_class.append("wrong")
     else:
@@ -947,7 +955,7 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div class=\"{" ".join(div_class)}\">{infra_str(pkg.infras)}</div>\n')
 
     # License
-    div_class = ["centered data"]
+    div_class = []
     if pkg.is_status_ok('license'):
         div_class.append("correct")
     else:
@@ -955,7 +963,7 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div class=\"{" ".join(div_class)}\">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
 
     # License files
-    div_class = ["centered data"]
+    div_class = []
     if pkg.is_status_ok('license-files'):
         div_class.append("correct")
     else:
@@ -963,7 +971,7 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div class=\"{" ".join(div_class)}\">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
 
     # Hash
-    div_class = ["centered data"]
+    div_class = []
     if pkg.is_status_ok('hash'):
         div_class.append("correct")
     else:
@@ -975,10 +983,10 @@ def dump_html_pkg(f, pkg):
         current_version = pkg.current_version[:20] + "..."
     else:
         current_version = pkg.current_version
-    f.write(f'  <div>class=\"centered data\" {current_version}</div>\n')
+    f.write(f'  <div>{current_version}</div>\n')
 
     # Latest version
-    div_class = ["centered data"]
+    div_class = []
     if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
         div_class.append("version-error")
     if pkg.latest_version['version'] is None:
@@ -1009,7 +1017,7 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div class=\"{" ".join(div_class)}\">{latest_version_text}</div>\n')
 
     # Warnings
-    div_class = ["centered data"]
+    div_class = []
     if pkg.warnings == 0:
         div_class.append("correct")
     else:
@@ -1017,7 +1025,7 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div class=\"{" ".join(div_class)}\">{pkg.warnings}</div>\n')
 
     # URL status
-    div_class = ["centered data"]
+    div_class = []
     url_str = pkg.status['url'][1]
     if pkg.status['url'][0] in ("error", "warning"):
         div_class.append("missing_url")
@@ -1030,7 +1038,7 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div class=\"{" ".join(div_class)}\">{url_str}</div>\n')
 
     # CVEs
-    div_class = ["centered data"]
+    div_class = []
     if len(pkg.cves) > 10:
         div_class.append("collapse")
     if pkg.is_status_ok("cve"):
@@ -1045,7 +1053,7 @@ def dump_html_pkg(f, pkg):
     if len(pkg.cves) > 10:
         cve_total = len(pkg.cves) + 1
         f.write(f' <div onclick=\"expandField(this.parentElement)\" \
-        class=\"see-more centered cve_ignored\">see all ({cve_total}) &#9662;</div>\n')
+        style=\"text-align: center;\" class=\"see-more cve_ignored\">see all ({cve_total}) &#9662;</div>\n')
     if pkg.is_status_error("cve"):
         for cve in pkg.cves:
             f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (cve, cve))
@@ -1058,16 +1066,16 @@ def dump_html_pkg(f, pkg):
     f.write("  </div>\n")
 
     # CVEs Ignored
-    div_class = ["centered data"]
     if pkg.ignored_cves:
-        div_class.append("cve_ignored")
-    f.write(f'  <div class=\"{" ".join(div_class)}\">\n')
+        f.write("  <div class=\"cve_ignored\">\n")
+    else:
+        f.write("  <div>\n")
     for ignored_cve in pkg.ignored_cves:
         f.write("    <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (ignored_cve, ignored_cve))
     f.write("  </div>\n")
 
     # CPE ID
-    div_class = ["data"]
+    div_class = []
     if pkg.is_status_ok("cpe"):
         div_class.append("cpe-ok")
     elif pkg.is_status_error("cpe"):
@@ -1099,31 +1107,31 @@ def dump_html_all_pkgs(f, packages):
     f.write("""
 <div id=\"package-grid\">
 <div style="grid-column: 1;" onclick="sortGrid(this.id)" id=\"c1\"
-     class=\"data label\"><span>Package</span><span></span></div>
+     class=\"label\"><span>Package</span><span></span></div>
 <div style="grid-column: 2;" onclick="sortGrid(this.id)" id=\"c2\"
-     class=\"centered data label\"><span>Patch count</span><span></span></div>
+     class=\"label\"><span>Patch count</span><span></span></div>
 <div style="grid-column: 3;" onclick="sortGrid(this.id)" id=\"c3\"
-     class=\"centered data label\">Infrastructure<span></span></div>
+     class=\"label\">Infrastructure<span></span></div>
 <div style="grid-column: 4;" onclick="sortGrid(this.id)" id=\"c4\"
-     class=\"centered data label\"><span>License</span><span></span></div>
+     class=\"label\"><span>License</span><span></span></div>
 <div style="grid-column: 5;" onclick="sortGrid(this.id)" id=\"c5\"
-     class=\"centered data label\"><span>License files</span><span></span></div>
+     class=\"label\"><span>License files</span><span></span></div>
 <div style="grid-column: 6;" onclick="sortGrid(this.id)" id=\"c6\"
-     class=\"centered data label\"><span>Hash file</span><span></span></div>
+     class=\"label\"><span>Hash file</span><span></span></div>
 <div style="grid-column: 7;" onclick="sortGrid(this.id)" id=\"c7\"
-     class=\"centered data label\"><span>Current version</span><span></span></div>
+     class=\"label\"><span>Current version</span><span></span></div>
 <div style="grid-column: 8;" onclick="sortGrid(this.id)" id=\"c8\"
-     class=\"centered data label\"><span>Latest version</span><span></span></div>
+     class=\"label\"><span>Latest version</span><span></span></div>
 <div style="grid-column: 9;" onclick="sortGrid(this.id)" id=\"c9\"
-     class=\"centered data label\"><span>Warnings</span><span></span></div>
+     class=\"label\"><span>Warnings</span><span></span></div>
 <div style="grid-column: 10;" onclick="sortGrid(this.id)" id=\"c10\"
-     class=\"centered data label\"><span>Upstream URL</span><span></span></div>
+     class=\"label\"><span>Upstream URL</span><span></span></div>
 <div style="grid-column: 11;" onclick="sortGrid(this.id)" id=\"c11\"
-     class=\"centered data label\"><span>CVEs</span><span></span></div>
+     class=\"label\"><span>CVEs</span><span></span></div>
 <div style="grid-column: 12;" onclick="sortGrid(this.id)" id=\"c12\"
-     class=\"centered data label\"><span>CVEs Ignored</span><span></span></div>
+     class=\"label\"><span>CVEs Ignored</span><span></span></div>
 <div style="grid-column: 13;" onclick="sortGrid(this.id)" id=\"c13\"
-     class=\"data label\"><span>CPE ID</span><span></span></div>
+     class=\"label\"><span>CPE ID</span><span></span></div>
 """)
     for pkg in sorted(packages):
         dump_html_pkg(f, pkg)
@@ -1135,43 +1143,43 @@ def dump_html_stats(f, stats):
     f.write("<div class=\"data\" id=\"results-grid\">\n")
     infras = [infra[6:] for infra in stats.keys() if infra.startswith("infra-")]
     for infra in infras:
-        f.write(" <div class=\"data\">Packages using the <i>%s</i> infrastructure</div><div class=\"data\">%s</div>\n" %
+        f.write(" <div>Packages using the <i>%s</i> infrastructure</div><div>%s</div>\n" %
                 (infra, stats["infra-%s" % infra]))
-    f.write(" <div class=\"data\">Packages having license information</div><div class=\"data\">%s</div>\n" %
+    f.write(" <div>Packages having license information</div><div>%s</div>\n" %
             stats["license"])
-    f.write(" <div class=\"data\">Packages not having license information</div><div class=\"data\">%s</div>\n" %
+    f.write(" <div>Packages not having license information</div><div>%s</div>\n" %
             stats["no-license"])
-    f.write(" <div class=\"data\">Packages having license files information</div><div class=\"data\">%s</div>\n" %
+    f.write(" <div>Packages having license files information</div><div>%s</div>\n" %
             stats["license-files"])
-    f.write(" <div class=\"data\">Packages not having license files information</div><div class=\"data\">%s</div>\n" %
+    f.write(" <div>Packages not having license files information</div><div>%s</div>\n" %
             stats["no-license-files"])
-    f.write(" <div class=\"data\">Packages having a hash file</div><div class=\"data\">%s</div>\n" %
+    f.write(" <div>Packages having a hash file</div><div>%s</div>\n" %
             stats["hash"])
-    f.write(" <div class=\"data\">Packages not having a hash file</div><div class=\"data\">%s</div>\n" %
+    f.write(" <div>Packages not having a hash file</div><div>%s</div>\n" %
             stats["no-hash"])
-    f.write(" <div class=\"data\">Total number of patches</div><div class=\"data\">%s</div>\n" %
+    f.write(" <div>Total number of patches</div><div>%s</div>\n" %
             stats["patches"])
-    f.write("<div class=\"data\">Packages having a mapping on <i>release-monitoring.org</i></div><div class=\"data\">%s</div>\n" %
+    f.write("<div>Packages having a mapping on <i>release-monitoring.org</i></div><div>%s</div>\n" %
             stats["rmo-mapping"])
-    f.write("<div class=\"data\">Packages lacking a mapping on <i>release-monitoring.org</i></div><div class=\"data\">%s</div>\n" %
+    f.write("<div>Packages lacking a mapping on <i>release-monitoring.org</i></div><div>%s</div>\n" %
             stats["rmo-no-mapping"])
-    f.write("<div class=\"data\">Packages that are up-to-date</div><div class=\"data\">%s</div>\n" %
+    f.write("<div>Packages that are up-to-date</div><div>%s</div>\n" %
             stats["version-uptodate"])
-    f.write("<div class=\"data\">Packages that are not up-to-date</div><div class=\"data\">%s</div>\n" %
+    f.write("<div>Packages that are not up-to-date</div><div>%s</div>\n" %
             stats["version-not-uptodate"])
-    f.write("<div class=\"data\">Packages with no known upstream version</div><div class=\"data\">%s</div>\n" %
+    f.write("<div>Packages with no known upstream version</div><div>%s</div>\n" %
             stats["version-unknown"])
-    f.write("<div class=\"data\">Packages affected by CVEs</div><div class=\"data\">%s</div>\n" %
+    f.write("<div>Packages affected by CVEs</div><div>%s</div>\n" %
             stats["pkg-cves"])
-    f.write("<div class=\"data\">Total number of CVEs affecting all packages</div><div class=\"data\">%s</div>\n" %
+    f.write("<div>Total number of CVEs affecting all packages</div><div>%s</div>\n" %
             stats["total-cves"])
-    f.write("<div class=\"data\">Packages affected by unsure CVEs</div><div class=\"data\">%s</div>\n" %
+    f.write("<div>Packages affected by unsure CVEs</div><div>%s</div>\n" %
             stats["pkg-unsure-cves"])
-    f.write("<div class=\"data\">Total number of unsure CVEs affecting all packages</div><div class=\"data\">%s</div>\n" %
+    f.write("<div>Total number of unsure CVEs affecting all packages</div><div>%s</div>\n" %
             stats["total-unsure-cves"])
-    f.write("<div class=\"data\">Packages with CPE ID</div><div class=\"data\">%s</div>\n" %
+    f.write("<div>Packages with CPE ID</div><div>%s</div>\n" %
             stats["cpe-id"])
-    f.write("<div class=\"data\">Packages without CPE ID</div><div class=\"data\">%s</div>\n" %
+    f.write("<div>Packages without CPE ID</div><div>%s</div>\n" %
             stats["no-cpe-id"])
     f.write("</div>\n")
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
