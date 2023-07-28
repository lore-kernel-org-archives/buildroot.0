Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0D9EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 23:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EEE76140B;
	Fri, 28 Jul 2023 23:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EEE76140B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycdDw9HCuTVV; Fri, 28 Jul 2023 23:18:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8E2960F15;
	Fri, 28 Jul 2023 23:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8E2960F15
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F2761BF31F
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 23:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 765124159F
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 23:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 765124159F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TnLlSzebgC0F for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 23:18:55 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20718.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::718])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31EA141583
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 23:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31EA141583
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ld8rk5PAId3vchih7qNspLE4iRC5eSW7U8v2TZEhl/3ess7QVbdyFwSH1Zib3HjFwCB36pL/NyqAf2Kit77kK0qnkAHHTWS00HRxECHHc3FOu7lL1JH2du7OtzdvDQX/PJJNaBSJ9+/9U9Zif9u4K7Gvx74iV6KI3CY/qISKxjkrG9dXU+Quo1Kqb50RjRjbrT0h1NStqkiJC+EnsRmU5kt9xqcBIM9hCPo4gkSRadRu1c4Jzwb5J7ybcb55ItvvGFLaVenWvdctgBHnjBX0gMtA8y7MsaC/ymLY6boq4wiCimhyEmvey6G04GXKGMTbZhHmv5hFkiQll1zZWaQweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbJELBjjj4dLhhDUQC9VBkvQczcFyj4nOxUMr/+BHxk=;
 b=W0AGzawglWoCJRJsSP/BBfUsGLH3q3/z+B3c8qKGzYqWSsxyf654UdjNA7pWS0/K+N3BepUMzAkifCbVE82lT+C/zKZoaES9uJ3Hut7m/rA2qKxKcJdTGVPRCmm7kkH686PgzRhSkKSQz/DhSq6qB1AC6PA/PpVKamKSp+BR6XGatFu95GxxrdGxZCaXa1T7aoKRpRWfKfeEgGIw8faw+B/k+bTWGvaSXRLpJUHSxjPo3fTnafUI1hwCVuZKHSVyg9/BRJV07ZWgUQ3hFlR+6TXQ7u4UzT3pXk4jk1VThsEUWo88yhqCGfM2YLXrhXWfq+dMx4PT1cuIYunolqzwXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by MW4PR10MB6581.namprd10.prod.outlook.com
 (2603:10b6:303:22a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 23:18:50 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::5ff7:e83d:39df:dacb]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::5ff7:e83d:39df:dacb%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 23:18:49 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 16:18:39 -0700
Message-Id: <20230728231839.4193379-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: BY5PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:180::31) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|MW4PR10MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: 2640317f-5cb6-4cb5-12c7-08db8fc1000a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0U4qasN7hB0kLG/NIncFKEpjhTpqYmmvHhnFY3iLt3RFD5kgF3zQ2z/dx/R8r1qQX9pIG0dK6r+SSlGHPE56VGV8n+6GrCpIbAPdiHcYeNIdsuimErHZQ01WtKfH6mfaHZts/jSwLUqB6pHfkvSXzZfkDzCaHQzMlPIvYZT3EbVgbkbBT2xpNg3Rg4fStBcVtqh6jzvk3JQwDRQmF+v/rEckDd66ZWRdTLwBsrBy3SM4dxYQnQq6KFp7dOLGg2CXWC4woCUaYl+xr7zOnrdQKtrAmO6jl2m/CKkpp7tWGu12uEcPwZL+lNkS9wbCOoP56ReKgTrnfOX6tcFH7+PALNVeBRBzUTpt3XPKmN783yvVbT+Uvduj2TmIgxUMDSWoDOhRvC48/ZqGd5amoWLrVFWcZ9TmF8gzqGPNJkQHe8oJsAdoBfWZhFHOoJoKbm6rTvi76d/sONJjlUEfuy3y3+6QQp9jL+p2KEz0J1JOK7AtqRaPmIJQHxQ6D1jklBlBEhncVK/x22bG2XJRr4wutE0ggyNkZAr2nvjbT1HkuuCEBERMo78hx4N8tKOuASFhAD0fp5+aYuVvaxrFOtyDtj4igYY7Jr6wo51aQ3yGvWkM6sYbwQJR/9RUBrrk+ZMl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(39830400003)(366004)(346002)(451199021)(6506007)(86362001)(1076003)(186003)(26005)(66476007)(44832011)(66946007)(66556008)(6916009)(6512007)(2616005)(2906002)(6486002)(38100700002)(478600001)(6666004)(38350700002)(41300700001)(36756003)(5660300002)(316002)(8676002)(8936002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Q9TapRl16xnzXvLC3MdXcWYxcS3qW8cpV9LGGyX9RABmWgfkr0fQiUgCrFS?=
 =?us-ascii?Q?q+kfezFllVFTt/arcAAXM6Gq7p/NcheUxaiqUSB2lXtNBDb1sZZz27XBXgby?=
 =?us-ascii?Q?8aoqRQjCSVAcww5ycmyA/jnfyEipGfWaRisueu9JmQrdYRXH6cPT8wszbVkx?=
 =?us-ascii?Q?iTLLouCe1/5bU0iS+kaXYhTNT0Cfo2r4f0QS0X1PJG2rRUBP1Zjl6cuUOYmI?=
 =?us-ascii?Q?sW6lIyMF92tFpG+4zW28en5HjJot/zR4Tsa4+SzhkFtLi+kHz1JU4KOOUG7+?=
 =?us-ascii?Q?sqCBdwJ/1uPN6yMa/tcECCHvoV3F4n6LApsdzsevUqu2PCAE0O0AHzjrbiCC?=
 =?us-ascii?Q?+IbppJyb9rjUd0V1GAS8SWclmysWwBIC76uVtfLLCG1ucSbwBNrjB/t1CTSG?=
 =?us-ascii?Q?GdFX9Yve1XYQwRNTkTEKcZV/TLMJXyHMOa4zp2vIdZAgyVyQm7lRJQS/SRsG?=
 =?us-ascii?Q?aECbCKEWx2Y39Rh5zTAOlt+6E967En1lFLzEgflSLcgJ5jYA7wbVJAqfvaq1?=
 =?us-ascii?Q?q/CZQBZa9kuaSK2NBfV9wj9UPb3QFKrkWdVai6wdjeoCfPirXGH8FhlPXTsD?=
 =?us-ascii?Q?FcrrXsNfGbcK9XjI8FFkLsHxbn7+0PteRwG/f4JxjB0OToa7POWV01cuFZEg?=
 =?us-ascii?Q?iviv8hCo2iencg3fkW/ACZ752CDC5BC0pp9C7SGbbg73iugD8Q3RRYEb5142?=
 =?us-ascii?Q?f5fHaOmiOSjyd8+5E+zVOq0N7MMXNdUAN8ozINOjIyxXkuzFZ2PIK6biEhBi?=
 =?us-ascii?Q?+brefnUAm5DRSHGIw9SKsD1OyGzP7ryP/L+eLM8dLeOI4NmvQvffYI1BeLH+?=
 =?us-ascii?Q?2l0HItOJ7b0bf9che1nGZQ36rGxsKd6wU8+oXe8FFerQDqpnA5e6fC7YQwzd?=
 =?us-ascii?Q?Dq8THUHF8bTCoKCOLqjsZioInZBt1RqM4AgcFuv2WnfkoN/CFRz6zRwW6S82?=
 =?us-ascii?Q?By5ZjUli9vMQwXLG8Dz/LwlJ6tzvbZaHnj50vnQkypWpBl9ohAzTmIkaM5AG?=
 =?us-ascii?Q?Yt7NCBjXicUW2gmwySQipRi6I+/KkPxWECDOGei2d9JKc6D/PSLWdIyu/YCJ?=
 =?us-ascii?Q?XJqqGSIBoHlALM+Vj2zweA2+Rsv9r5w52MFGns8+y0JrLokIqv0DGySVNF3p?=
 =?us-ascii?Q?5rX2Uetdb01miKpoxKzFZcsEpFAsLzpw8XqxjFiKC5kCcUxijKgS2gEiUT+B?=
 =?us-ascii?Q?QHRsGfVjjzYYHvQwIuBxfKtWtgHvIqccdX1HElTU9+9JvzIOlCT5i2DNxCKA?=
 =?us-ascii?Q?FrChgOa7MQnMPjDAx8W7vNb0NBbGYkyemSTwTgNCHEvngRIFMmxjcOBDeAAd?=
 =?us-ascii?Q?bInK+yEsA+LHqOnMx0/Shx02ioi90o4B/nwYG/RgaTsObLg7Qw5rSPDfANLj?=
 =?us-ascii?Q?WjAlGK077gPyKUI72T2MqxfWiNP/v56xWKXmhoozzJwlo0Iv4YXew7Yl0rgN?=
 =?us-ascii?Q?3rwk0yqxL8HzZ2rTV7kQOlUFhA0//qMLNYXPJq3NODy5lWR5KITsBrlUM1XU?=
 =?us-ascii?Q?qATeq+Rm2IZgIrMk1lKB3ev2fE6NGOj17/u26rccdchhRBV7IYUCt/pv60ed?=
 =?us-ascii?Q?vkylDbKn7T9c6SzbCe7Ah2qFsF7rc3j+GvCzVU3/VPTD/j1RzzyVp3Rh3wYY?=
 =?us-ascii?Q?EA=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2640317f-5cb6-4cb5-12c7-08db8fc1000a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 23:18:49.7028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBPT1MG0Jr8CHdLYC2xgBBD4bVPhOBrW7OAtn0Y20Q3DwGJvIvJ9EyIDPzaVFbXWD/Csk+yYaleTcouOWUxnkIrrkT5PLwbITgBuc3JPkfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6581
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbJELBjjj4dLhhDUQC9VBkvQczcFyj4nOxUMr/+BHxk=;
 b=nyOGbCjL/eP7MshAwpfeopTOABJZ0gverX7ALNGcEvAwIg/KV9rwA1SnQIYSAzMGcc/pjflUG/4170yTQVZy6Cxr73orUOeKwM3rvfT9pn/LK63PWNZFbSL6PLnz9zUkdgSHP2PkZoEeI07rCi76DiO1Fzd66uXr6FEW4bLUnIk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=nyOGbCjL
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [PATCH V1] core: add kconfig option to archive an
 un-stripped filesystem
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It is reasonable to expect that deployed systems don't contain debugging
symbols. At the very least, it will bloat image size unnecessarily.

There might also be scenarios where a previously released image might
generate core dumps, or require attaching a debugger to a process
well after the filesystem image has been made.

These two goals contradict each other, and is addressed here.

Just before stripping target binaries, allow the option to tar the
target filesystem for archiving. This will create a single image -
rootfs_syms.tgz - with un-stripped target binaries, and allow post-build
debugging and core dump analysis. The final image will be unaffected.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 Config.in | 10 ++++++++++
 Makefile  |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/Config.in b/Config.in
index 0d7641633c..a6343f6336 100644
--- a/Config.in
+++ b/Config.in
@@ -443,6 +443,16 @@ config BR2_STRIP_strip
 	  on the target are needed for native debugging, but not when
 	  remote debugging is used.
 
+config BR2_TAR_UNSTRIPPED_FILESYSTEM
+    bool "create filesystem image with unstripped binaries"
+    default n
+    depends on BR2_STRIP_strip
+    help
+      Create an image of the filesystem prior to the 'strip' command.
+      This will allow binaries with debugging symbols to be archived,
+      and should aid in remote debugging and core dump analysis while
+      not taking up space on the target filesystem.
+
 config BR2_STRIP_EXCLUDE_FILES
 	string "executables that should not be stripped"
 	default ""
diff --git a/Makefile b/Makefile
index 09b2066f05..9a5165c24e 100644
--- a/Makefile
+++ b/Makefile
@@ -746,6 +746,9 @@ endif
 	rmdir $(TARGET_DIR)/usr/share 2>/dev/null || true
 ifneq ($(BR2_ENABLE_DEBUG):$(BR2_STRIP_strip),y:)
 	rm -rf $(TARGET_DIR)/lib/debug $(TARGET_DIR)/usr/lib/debug
+endif
+ifeq ($(BR2_TAR_UNSTRIPPED_FILESYSTEM),y)
+	tar -czvf $(BINARIES_DIR)/rootfs_syms.tgz -C $(TARGET_DIR) .
 endif
 	$(STRIP_FIND_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
 	$(STRIP_FIND_SPECIAL_LIBS_CMD) | xargs -0 -r $(STRIPCMD) $(STRIP_STRIP_DEBUG) 2>/dev/null || true
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
