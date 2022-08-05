Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD4DC00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 18:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C90A460E09;
	Fri,  5 Aug 2022 18:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C90A460E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IJf96XfHQpGl; Fri,  5 Aug 2022 18:59:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1ADB60B63;
	Fri,  5 Aug 2022 18:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1ADB60B63
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83D501BF3A3
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 18:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BB5760B63
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 18:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BB5760B63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bpNodwjfO-OY for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 18:58:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 277E860B43
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2118.outbound.protection.outlook.com [40.107.237.118])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 277E860B43
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 18:58:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeaiiIs2RM0fUk/2xFPbKGawNBMUNMsbOUlotWOx8vhrkDhvTCtHuQyC/ymqSC+oPyfeYeF2kZ8QYJwdtf2FoBaguSHi6o06vIV6UAjNIRLUYePXQYBb15LRoTwf+hAnpjTjTTkateUu9Y37Ek1sBokiw3B8Ave2ASM6X0J4x5orKZSJ35MEj9atbbJLQex/2T7U7swdw6PLAGpkY/TSPmVnn80ZGyq6XGoHxjUABBjqmcWL57ZtzBL8VLGkh4ST6SC3tN0NPt2CL8xA9TqS8xZ9b63wtPwdrrx1DACt3nXA2MSz9WVdrR2WW0GKtEOjll1cuXL4fZGwW0BJKA/t5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lfrhDG/pgM+pdiDgeL2yE8QbrFPal+YyEt4tjNvlao=;
 b=VEDlP4qCixZDzW4RK+8xqKWvKVz6vfbHAWk/709OSK9ZgY5aBcTyXKe/x4iLc9jEPUKCH9ZvI1GKpo/lYB6xA014XXDkchB0Y4Mjg2eUcWr8bwVYzDypOha8dnXZ5eSYMc0Pf+x291rxWS7UQhbVZn3ZGkmXuRhDbpUxoKX1Alw0+0wsL8UfNYMsB6qYoU2oiY/zoRMCfm9F3wZ9e24O0sCf/RQIaeia88Tb/v9otzcvI/oLt/8Ht/9UjE/YdFTcfImVYyoRh5HoYJq/qLvR8wh4YFegHVOrYO7yFgEdhU9tO1hkGNvYUgtMENu7EfQ6W0uwzb/gT5i2BBdrjLgtnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by MW4PR17MB4451.namprd17.prod.outlook.com (2603:10b6:303:70::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 18:58:49 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f%3]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 18:58:49 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Fri,  5 Aug 2022 13:58:21 -0500
Message-Id: <20220805185821.261049-3-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805185821.261049-1-sen@phobosdpl.com>
References: <20220805185821.261049-1-sen@phobosdpl.com>
X-ClientProxiedBy: SN6PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:805:de::24) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86962eec-4a23-41ef-9472-08da771487dd
X-MS-TrafficTypeDiagnostic: MW4PR17MB4451:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vzz165VzprUZq/nq24UbrNDT4T8OZce7WNiZ+8RWrX24UrpeVynxzEvnqe/HpH7LkIc8zbs2hvuh1EZRWeJpAbB9VTiLzmb9cHK3YBimIRzfKKNP2uDoIY33jB6xvQLjI6jed8Sm6DQ7ybNLuoYb4j1MnwFGNDD9j6EfIeWGEQxf2RA2u8fPKcG9nInXDZ8KwTRUtqGe6bc4uNnN8SKFlZvmZZl7pwZjhDnHgV48d5qJfqjcnWfX+bb9bnhX/+TPb63Sjt8lTji9YCBbAFmioZri3TObAyBpgJDHWW+sHgyOg7yQ/VokdyKhFw3pmnBjMUG6o3+2Ul0XsxybYeGrRtsWsh+GVDl4wVk2eEG0fvdUqZRcSvaau/XJpN8qhPBXStNbJmipl+FAKeEXoEFf/P6os+TVEmJBaakqOhLA3DYCEEKdwcHxEDh5LdFEKC8/Qc97kTDPlU3cXoqcX40XpGcoWEOWtGDlhrgcYTc8/mowlCsF4oj8dkzI0neGWU/xY7QNarlTfi/INWPN6nU6I8kfXi+N8xGh4335DRcPrCBn2gkXcB7FWdq2zhxbEf1FPMeiFvCs+Lxa2o2AjGxXC5h7FgRTyWyMFKjYtAVjOqJUXLvJyhSlHEvNrhwlhP8tYzSD9WLLIpPzXflaExy7iwfKfP1SKu3iV3dUcc9NCr5qhTe/pUs8JbdSi1jsGYXr9qQSzMEmtUrGOgPFPANNehHUj7vJazLmX0AcYDMbiZksJTlXtGBXPgUlrYLgdIwgqYkVoYSHTxww8QRO48MwyviHeBAa7DEk8GeIMEfRyADghOQG0v8/r39Sn+uog163M827zo7M4R60RnytXabrXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(346002)(136003)(39830400003)(396003)(52116002)(1076003)(107886003)(2616005)(186003)(30864003)(5660300002)(6666004)(6512007)(41300700001)(6506007)(26005)(19627405001)(36756003)(8936002)(6916009)(6486002)(478600001)(166002)(86362001)(83380400001)(2906002)(8676002)(316002)(38350700002)(38100700002)(4326008)(66476007)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sV6xOVgDaqPI+V5d06c1uTlwLwI13xvSpb6qB438tWt+NBWi2D6WcDXRuUWU?=
 =?us-ascii?Q?521+/S3Jr5fDcwk3H0O4e6vZ1CZZom2DWau+f6t5byPFvSgLDHr6ipf85AcO?=
 =?us-ascii?Q?1HE/TAAv5UzL7P8zdjFxP2y2q/uimaz1q0orDd1FR6b7tTmZYQCZ7LnV7kQJ?=
 =?us-ascii?Q?dnjZAK+86OnDOQ1bzdISg/jsr8RlGYVoXcD6aMCrcgZLd2rxJqYJq8rIXZhf?=
 =?us-ascii?Q?YDKsaI0ukafbFnJkl5/E47fXjCrqx27hza1h5ihR6ccNl351M8exLfyL3DNS?=
 =?us-ascii?Q?39/vczVaHvplAy4pneyVzsD1MJioCMZBJg6ltKq/JAN+cFDofl0L6q+I57dP?=
 =?us-ascii?Q?hqMKquThMTmX2nRie7X3kAO+NZGSiK33FKrmQ5lOlLdsu5lfuQrxVVL80KY3?=
 =?us-ascii?Q?bd2t6Mxruocw9rJRi5ObUmRxEJ+RlpUkBHjuGIErMc5rPkAe0XmbsrYX5z8z?=
 =?us-ascii?Q?FqV5ySPxCtnLyzQ0hscywSmwFqQCDtGtDMIuCA/yFyhPVdn0WuZo1q47d5Ra?=
 =?us-ascii?Q?/vOReJW6G/hSSyAC3/Uj23Oat8yJT3miZZT9Go+X1rr/YfGeAZag1xqJ6bEC?=
 =?us-ascii?Q?9G2I9ggyKvCf7V4j6ajM21k+WFPwmwZXcqOnKv//viWqG6uOcxruzhSn5PsM?=
 =?us-ascii?Q?9VX8PaZZCqGssgryWvaAKj9Ma7zTzp/eymlpwcRUwn2iqQK7uizsGxs9jxpy?=
 =?us-ascii?Q?jcO7AywYeJTFlAhqR+dNs4VerEXj4Hm9egPfo9ZfEAgsO93VHHxWQyvdtxS4?=
 =?us-ascii?Q?JOYqcDRqbg+zgNRN7mb4SAQ05FdxWWOCc24BNriNtfIC8a1iBQ6RQ9WNZDJw?=
 =?us-ascii?Q?bPnymdOgY61iNUHK9bgcb9rVynkd8N5VPLG2VL2+tupmPMGqG18jklIN1dkS?=
 =?us-ascii?Q?PVF95i1useZwpe4K3NkmFWj6VAMO4c+JyF6JtPz1+OvigRBbg93ECZpV5hwb?=
 =?us-ascii?Q?rc/d9lGLt3RqM9WJ4WHJpCa+whIVmrcznmEtLGcIKFjneddx5YvyQboH7h0R?=
 =?us-ascii?Q?gd6gt0ecWg1j7rJJlJ/Cjh3B3dexz56C2qr441BFUrSePAFuJStrAKRcHx01?=
 =?us-ascii?Q?RcyU/iSBZ/tUkp+7v3ZrKIEP2nGJyBtktw2M+WECFqEIYjiWSdZDzLoCRBSB?=
 =?us-ascii?Q?6iniqww7C9jKV5ktzbqEN9qqvk39HX5EBK7fG1lvf+Pm5uLUmdUBNTpRypYX?=
 =?us-ascii?Q?5ZOYEg+R4sbsOqUk4zD8rGVxFsaamdXA6dUqLSbHnEoin22sMH+d+F+IuaRl?=
 =?us-ascii?Q?ndVByGBTFIkBkPARvpy5qMYfCSnJhyzzIs232Z+KEyFih+iEe+VmYlXzv1/z?=
 =?us-ascii?Q?OFKkH3UZAp93aKkSBc2f8Aah7VwjBy2JL8F9qwZ8PiCePANr0d5f2gu4Ef8Y?=
 =?us-ascii?Q?arKcoMgyhiDYeOEF3aSniYRHuJ0lbr8pFD1bRAnQgTULnFk447lLsxK8NYcL?=
 =?us-ascii?Q?njMBcd04BxTiGEe/KJbTvp53seRf5SXhB7HZq83kCs4AElawMwjiUiUd6hXz?=
 =?us-ascii?Q?R30VP3bXXGHa+i3i4rh9a9Zf+zHecP0q5TmNU2a2dbhdDRIid8s4MaG9hZBe?=
 =?us-ascii?Q?A2NceGRSctD+W30EyHGfhjZP2GNuRcTsZwrbT10R?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86962eec-4a23-41ef-9472-08da771487dd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 18:58:49.0093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMLIjD1XLySwJi5PUKiiruwncp9CqdIjTRyyJxpa6oaJlZEg20ei+AaAAU4fZTg0rTT6TrfPMLG/GGZtRaKQRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR17MB4451
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lfrhDG/pgM+pdiDgeL2yE8QbrFPal+YyEt4tjNvlao=;
 b=hHe4yv5YnSLt6tCWY8NV0yQ+ttprhU+6oiuohxHwDW9otazxjfwFqEKnIHKiKBnUFF+IQHM5ksZbX6ZDkKfUsyZNgQ10pMAR/NdGSPFY9r2gpMto2Yo+5HdTg76jXLKYHkdOmWNt0FdDm4IcqPlQCTMu33/bEnDCeGyg9YZygeE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=hHe4yv5Y
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 2/2] support/scripts/pkg-stats: optimize CSS
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

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
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
