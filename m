Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE05DC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 23:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FA3741736;
	Thu, 28 Jul 2022 23:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FA3741736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ax9ddA_4SNJV; Thu, 28 Jul 2022 23:25:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D97F94159F;
	Thu, 28 Jul 2022 23:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D97F94159F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24F831BF360
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 23:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2E6660B47
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 23:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2E6660B47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xHEC_6NscKFy for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 23:24:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 135AB60ABB
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 135AB60ABB
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 23:24:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNt2UXg8FYfJ19bpu+Ha/dYnH+UJelbcmrbg3k8VkhCBiqu/RPH97c/8OvA6uMIovKKx+LdIsV3OQthOwHk9+k2i+fvEuS0v0kXwNPjDRtjkgcI6opoVJMdFnJVtdXtuydIQccemo3uGPhReRCRFn9QOvG3oTyi4Y/gdjlpkg07Nwx81ivITVa8OMJCZ38P76OWozjc7rTJpVhd/MYfh95r+CHBCAwofyr1RY/OTIwVxf21OlK2ZOSS+wAoJ1+QFsEg6ETJSKiw3YlijJqSEzXE3oTXrzBdHrGiTxtGn3lYJjxFBYH5mBvf/ggC/1P14ubB1EH91PfduyaN5xJZ4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/l/6ZXiAlMMStXIhx4t6tW2v0RblZZTBYtPgFS7rqqs=;
 b=gJ8qjQN+qGOUVXUgCjokxmu6SstheXGWmYm55QCzd7SOhPIYz2ne3Xx/h0sL7VXGbIDIQJCoFJlag7x0dZnQJ95ZkDXoG0KhXhJf5IVb+3iibJuTuExGcIpDBh4S+jStqtzwtAz2GLA163ryudRNEM3yQYtxbtmz4InSdEaa/NSPfxVnqtEUpI1mMvzbMS+GdYbxDNcw4ubrugVXi0AngwX1LGZ09Y3tsj+79EpaaEcrj3kHg1eCxgMnCHoXRLqwOKGekq0+mD8ibTn2TYpRk6ZqVhMyuoidZtBNQTELjnK7gbp/7Yh5iFmwjWVt+1HXoyf/cI6OOvn1OCmKzNQbnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by PH0PR17MB4688.namprd17.prod.outlook.com (2603:10b6:510:86::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 23:24:24 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f%7]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 23:24:24 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 18:23:55 -0500
Message-Id: <20220728232357.270130-1-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SN6PR04CA0081.namprd04.prod.outlook.com
 (2603:10b6:805:f2::22) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ad038f6-3458-4b79-3d83-08da70f04e8a
X-MS-TrafficTypeDiagnostic: PH0PR17MB4688:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ldMj8LyGHPo2CO7UYeBSc4DAXlgZWL+AQg9xdPGynDbPoacaF4OssfZYSSIgh7JGEHFMQlk/rcJxB61YgC/5X32XdETCShFr1tpEOiGGPhOv47/w42QLQOffolNI0o6UWKuts15AuttTEtDVmALCjDOOPL/0salJX/G9swYhlCW522vbOGbA6lYWOBFv62dslJHMtsyHIkqZVtDPj5tiQcM+sY1u7Tl0YsHnxPwxV8aQhA+ZQNE0foZA18Rl0Fv0V6iAUYjbGF4JwgeVCLFEWfqtTJwhLGhxJqaMWn+1EtKbzV1jK+6HKh2QI5zht3q5XYUGjw+2niixklOlvcUcKZnxA31prECRe11LG91HbOzsGbvNHhExL64q+GuWAkOPksK5IgRRY555uyJx5d1E+9e1MpP/iBUydlggHyRCmtRGt9G+D0MZUcrQjF/L2dR5G+HQ5DJzOKeceQtk5x08y7MUzcg8bI3xGkMrbNMA0KCxmLnGaW7UONpowA8Q8TQDSyeaZXVe0QX4yWmnyRFnArENGN0zTh1bYwOpVLlESp8wGHEvkAFDdwhkCToz5M9WSJraqMJYi6NLisyaVWAhsKr7ao1zo+Vw83pR18+XhHEtVXwsMVkktnxPWrNAidv/rIjmVahMgoaoFwQfNHxZk8L/Mf1jyUKxhR9cPbigEW3GVWUTeJ8PNiJjXwZ+WN435ohrXorwC6QOFk6FRpDrSww8qHvXIBSDY8IEnP5v2FN6TpAw7oEe6Lot1PKB5qRIsFgF8j/bF6tW7x+BScjlZJwkdbZDmYc8rUx1MfboIMsz0X7A291V1T88i1tx846F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(376002)(366004)(39830400003)(136003)(66476007)(8676002)(66556008)(66946007)(4326008)(316002)(6916009)(26005)(6512007)(52116002)(478600001)(6486002)(966005)(36756003)(19627405001)(1076003)(2616005)(186003)(107886003)(83380400001)(8936002)(86362001)(166002)(5660300002)(6506007)(6666004)(41300700001)(38350700002)(38100700002)(53546011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U3kCp5Y61oNNEfu5HWUyIWRbqaQ+HpYGuQS4Uo1cnJZnc338RM48ZzRaNVly?=
 =?us-ascii?Q?ltyCgGxD365beASkN6wmRTPlA0GZmInGBoqgva5vzf1JZlv11GbJiSziHQvT?=
 =?us-ascii?Q?6i91RZHvvpUSPJlL4Y61MyXwQl9F9HHQbMSmggeAJl+OmDooBJotYz9oq2Ak?=
 =?us-ascii?Q?Q95VmVNcS4ua0i1IIzAFl+vDtq+QKNRmFV8LJpKofPaVg0IL5O7oLz+5g92i?=
 =?us-ascii?Q?Z0h6iiV13owIlj9HBpA+juimI85v1p4CcRNQrB54ZnfXKm+EiuRS5ICZ1oDD?=
 =?us-ascii?Q?IkeHjzRBux2Ey2nJWhS+xwcXzZT2tPHzPmU3LWZk5TDVGegeB6UrNZGWs/Mf?=
 =?us-ascii?Q?ViWFL3Yyd+GPegND7PaEmZ1DBqJz04lU9/ceWkVspUzastkqvgHyTDZwAlfp?=
 =?us-ascii?Q?CwFgOHFpqTXlai5xpIWApWpnacHMisOQQn7g6GqOCilXs9NiMP8Y6t3Bk8/e?=
 =?us-ascii?Q?6GwEopEMMlgPNOwJ7aBPHHeCeuF1KS5r4aKh0s6+hNTXxfhx5vM/5YTaYeHg?=
 =?us-ascii?Q?JwSvMBZYCn9GbZk9o4BQRgoqt2Oa2Wk25h2e2Wm+5KYLK+qeeCawHtj9vdQ2?=
 =?us-ascii?Q?YJz7NGazSTIfn2/EmrnN9CN/JczG0H3iDK+JI5CbtCNh7tpyLwsZ04zdgN13?=
 =?us-ascii?Q?ICaoTx1sHGT0kjx+Lu1sOVcQNI2Bqo6/NwIVblzw76tzYaWyNAfsLXtf0LxB?=
 =?us-ascii?Q?siutpce6dvNzBJSuByMJ0fRBp8qZslF0ytFZEqz+be/xdMCiZVDL0vFYMt42?=
 =?us-ascii?Q?4q2CF2jEBSuhLzVPJPJiUB0G+hYuvA7uW6ez4+b2mD1NgzTZyodoKQcwGjxO?=
 =?us-ascii?Q?OCs9374Aam3C+OVtX+mEvtWzoRSHzV0jHL7kZa7ByBYNf6PEnrCyPXsuwG4m?=
 =?us-ascii?Q?AGq5Ki0oA0jOw3a5JW3Lq66YmrBdunCLh5AZN0rIfYpaVfQzdsxk/SuomXgz?=
 =?us-ascii?Q?oj9Iy09jgtgP7NIazZX7A5XI0XjZruR/0Fhh+6rwlEm+wS1n9hA6te1x0u7d?=
 =?us-ascii?Q?9LcXTVhn4Ap78YtwJK6k5VOWseiNQ9KREN7VTDk3nuttOnOnSDj1IUba06Km?=
 =?us-ascii?Q?onVnb9D+Z7Wsw0d/e7pkJtAW7al9j8bjgCfWdbofDhpcx0N2TT/8x9PTcxOv?=
 =?us-ascii?Q?A54AQs61IZZI4L17x/pQDY6/ViRO/grKhG8A3QJMU6xOZdMPv23LQb50uObK?=
 =?us-ascii?Q?4BN8NMBwBwBJZ5GNiqKqeUZBkCqSgV8rB2jV+QgrWJjROuSD8PajpNQy4XOl?=
 =?us-ascii?Q?itbbWj7aCYt+vSoGpc++Mry1kOZUDEAGWU9J0P4pyflx+I+S6mCrxKL2ZADD?=
 =?us-ascii?Q?StFK5Pyr1Sv84ZjA+dRWPomo5+oK5E1o7IpLdMFMt3w9LE0ykTwhz4WG5ltR?=
 =?us-ascii?Q?JV4sDHoG4Vv9FAS3bEaQKVGiiuQ5QkDKYLywwia6EgqvzID7Rfpx4fLgxBp0?=
 =?us-ascii?Q?YkNfuK3Ix3qfiRRxT/jVgWA+AQy/Wt7FcvEZXl2XJ3x1395TqyYGskWLxSn4?=
 =?us-ascii?Q?3YWB9TOVXiZok2oKBAa3CNNN+jBv2qYPcvtXRjUUMz2rSj0WfJkhJwWI1S9F?=
 =?us-ascii?Q?BNQ+3wstpflhSlW1cDiMSR9DnzeQRlfvMWyPieQn?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad038f6-3458-4b79-3d83-08da70f04e8a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 23:24:23.9584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SUKs/fSSXyWk3yMzTFvYvI36z/oEh9YTLATCeBNDeefjExTrf2E1uHBcylF5LZ9HnIjA8VDQFzzSQK/l4LOUGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR17MB4688
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/l/6ZXiAlMMStXIhx4t6tW2v0RblZZTBYtPgFS7rqqs=;
 b=EgamrHA/koUOmBzDmh8ZX6K3W4THFzqz2ac6Sl640Homnc4YSB4RFA6KblIHkx+WkD7hu786D6S2CGoTC56/bwRKbUZVSTPkW3/1gOGlVSlzWPiEbx4sG+9A19SozbYA4HEsxWiCr79oHbC7VCAXDQDNPRsbkIE1ESvITKX+goY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=EgamrHA/
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 1/3] support/scripts/pkg-stats: make cells with
 many CVEs collapsible
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

Sometimes a package can have a lot of CVEs.
Rather than have the CVE cell make a really tall row
(that means you have to scroll a bunch) this collapses the CVE
cell to a fixed size scrollable element with a
sticky button that lets you expand and collapse it.

If Javascript is enabled:

A stylesheet is generated and appended before content rendering,
amending the cells style to have a fixed height and overflow.

Also, the expand/contract button is unhidden.

This means the CVE cells are rendered in a collapsed state
instead of being rendered in an expanded state and then
slamming shut.

This avoids a "flash" and *helps* (vertically at least) manage CLS
(cumulative layout shift).

see: https://web.dev/cls/

If Javascript is disabled:

The cells stay fully open and the expand/contract button stays hidden.

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
---
 support/scripts/pkg-stats | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index d795131cef..8ce4e3f260 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -747,6 +747,14 @@ html_header = """
 const triangleUp = String.fromCodePoint(32, 9652);
 const triangleDown = String.fromCodePoint(32, 9662);
 var lastColumnName = false;
+const styleElement = document.createElement('style');
+document.head.insertAdjacentElement("afterend", styleElement);
+const styleSheet = styleElement.sheet;
+const collapseRule = ".collapse{ height: 200px; overflow: hidden scroll;}"
+const buttonRule = ".see-more{ display: block;}"
+
+styleSheet.insertRule(collapseRule);
+styleSheet.insertRule(buttonRule);
 
 function sortGrid(sortLabel){
 	let i = 0;
@@ -759,7 +767,6 @@ function sortGrid(sortLabel){
 		lastStyle.disable = true;
 		lastStyle.remove();
 	};
-	const styleElement = document.createElement('style');
 	styleElement.id = "sort-css";
 	document.head.appendChild(styleElement);
 	const styleSheet = styleElement.sheet;
@@ -809,16 +816,37 @@ function sortGrid(sortLabel){
 		let rule = "." + listing[0] + " { grid-row: " + i + "; }";
 		styleSheet.insertRule(rule);
         });
+	styleSheet.insertRule(collapseRule);
+	styleSheet.insertRule(buttonRule);
+};
+
+function expandField(fieldId){
+        const field = document.getElementById(fieldId);
+        const fieldText = field.firstElementChild.innerText;
+        const fieldTotal = fieldText.split(' ')[2];
+
+        if (fieldText == "see all " + fieldTotal + triangleDown){
+		field.firstElementChild.innerText = "see less " + fieldTotal + triangleUp;
+                field.style.height = "auto";
+        } else {
+                field.firstElementChild.innerText = "see all " + fieldTotal + triangleDown;
+                field.style.height = "200px";
+        }
 };
 </script>
 
 <style>
 
-.label {
+.see-more{
+  display: none;
+}
+
+.label, .see-more {
   position: sticky;
   top: 1px;
 }
 .label{
+  z-index: 1;
   background: white;
   padding: 10px 2px 10px 2px;
 }
@@ -1029,6 +1057,8 @@ def dump_html_pkg(f, pkg):
     data_field_id = f'cves__{pkg_css_class}'
     div_class = ["centered cves data"]
     div_class.append(f'_{pkg_css_class}')
+    if len(pkg.cves) > 10:
+        div_class.append("collapse")
     if pkg.is_status_ok("cve"):
         div_class.append("cve-ok")
     elif pkg.is_status_error("cve"):
@@ -1038,6 +1068,10 @@ def dump_html_pkg(f, pkg):
     else:
         div_class.append("cve-unknown")
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
+    if len(pkg.cves) > 10:
+        cve_total = len(pkg.cves) + 1
+        f.write(f' <div onclick=\"expandField(\'{data_field_id}\')\" \
+        class=\"see-more centered cve_ignored\">see all ({cve_total}) &#9662;</div>\n')
     if pkg.is_status_error("cve"):
         for cve in pkg.cves:
             f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (cve, cve))
-- 
2.34.1






From cbb01a5a28346617aa2fbf17479fb5aed1d2b0c0 Mon Sep 17 00:00:00 2001
From: Sen Hastings <sen@phobosdpl.com>
Date: Thu, 28 Jul 2022 15:05:34 -0500
Subject: [PATCH 1/2] support/scripts/pkg-stats: make cells with many CVEs collapseable


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
