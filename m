Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B97C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:54:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FFA061078
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FFA061078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unilogic.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F6FF6069B;
	Thu,  5 Aug 2021 08:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TdC17wgPLppj; Thu,  5 Aug 2021 08:54:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D3E8605DB;
	Thu,  5 Aug 2021 08:54:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02DAB1BF9CB
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEFEF40368
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:54:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=unilogic.nl
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UcSui99k360s for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 08:54:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BEAB4035F
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 08:54:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJvzn/xIIUV6tVCtFjEPo5VZGMSWXgAm9otJLpULze/8ysRSUgXZCMfp81k5+egwxEjMvmn+0CgckmktnkslRu7+7HR0X99TqcbOeR1VaJbhosxTCN8ipl3888BtjxQ32Dx/XhpgU4DjeYMzgNM7hMUdL8/v+wJU2L9+QXsJZ5ndp5C5F8+35AtfFRc2AMlJz1Ks4GXyA4BPdpLt8PuL9dx5FbJJG3TAAOisLR3rP5WHuHE/xDYwRiqOXUryXo+49XRP80BQuGWz2QmlwJ2V/P8Jv6Wnt18dA06A3WFleEb6rNnomNUyJy5b7XbYo9KWN5kqu61WQ4AKxKlTzIUH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnwXEasncVj6BUogFuaA5Whk+YM/p9YO7KyigZzhDvY=;
 b=d37rp/4g1U690rgBD9JAccs5h+SN9dgcw/do/rpCgU0BwxZ034b8I3/Erhrl99Z3TX0Jr3V/HnebT0Xr8SJoMx+ZrCjNylfceEdCc2vVUwBw0mzYDDcuR3rp2ZMnBxKR4mdTBh7RIyZrF10Kp7Xt7cDx0R15vrj+8q56LFfORk9RlZvhCKbWubPpeEF95mfwBC2zpDVcrpWrAPpXLrLS5kIKImuLvf+ScMzCAWjz7HqU0yjg7Uc1Vf3QuFKRf45pQsusoSTZ5t49FWMkRgXApQb0iAiqfsyMiffUkLlaqB+3cnDV2fPhLJ9LqY7Ynaj9ij6MW8XtPAae0MYULF2RIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=unilogic.nl; dmarc=pass action=none header.from=unilogic.nl;
 dkim=pass header.d=unilogic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unilogic.nl;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnwXEasncVj6BUogFuaA5Whk+YM/p9YO7KyigZzhDvY=;
 b=CV1K30sRYQiWUUdQUKn4ditupvKoRZ3GGMppQOe7p59snkP93N2EInZMJCQungoJe5KQ6lku+mnA86DH00uGQjPrwy8gaLcvZKHYbZ5EF01CyEudwwdGS+csvOgt9vw+Oy9okfYCrT4tXlAow/uhhRsUipIsCS51cRNCiLEpZSE=
Authentication-Results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none header.from=unilogic.nl;
Received: from AM0PR07MB3987.eurprd07.prod.outlook.com (2603:10a6:208:46::31)
 by AM0PR07MB6339.eurprd07.prod.outlook.com (2603:10a6:20b:15f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5; Thu, 5 Aug
 2021 08:54:00 +0000
Received: from AM0PR07MB3987.eurprd07.prod.outlook.com
 ([fe80::3cfb:3f55:9e55:4fe6]) by AM0PR07MB3987.eurprd07.prod.outlook.com
 ([fe80::3cfb:3f55:9e55:4fe6%6]) with mapi id 15.20.4394.016; Thu, 5 Aug 2021
 08:54:00 +0000
From: Pascal de Bruijn <p.debruijn@unilogic.nl>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 10:53:51 +0200
Message-Id: <20210805085353.3457-1-p.debruijn@unilogic.nl>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: AM3PR07CA0142.eurprd07.prod.outlook.com
 (2603:10a6:207:8::28) To AM0PR07MB3987.eurprd07.prod.outlook.com
 (2603:10a6:208:46::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from optiplex-pbrui.unilogic.local (62.133.193.10) by
 AM3PR07CA0142.eurprd07.prod.outlook.com (2603:10a6:207:8::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.5 via Frontend Transport; Thu, 5 Aug 2021 08:54:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b128d5db-c106-48b0-25b6-08d957ee915b
X-MS-TrafficTypeDiagnostic: AM0PR07MB6339:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR07MB6339AE205B05EFC040D102D29DF29@AM0PR07MB6339.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TUPs8BAi61yuMLfJMqeUQVOvm50rEkdb/BYFsIRKUlqgE0WxBBOM1HZCHEdTxOb/X6vIy9HfmwwkYALqCoKBQtW7vWGCoYM7g3Q37Q97TAwJPgwcWdruGhMBiPIRBOBHDt+2SnL5RJ6kel+BsIVRKONLwh/eumQNYqQZ07lgrbe6ip7sDiEi4HlxMRZ7U2Hu2aV658KsE9KtRZZVw4Yb5RPLUsUuspDADk3MiZ5JFZYXv9UfDC5mdYQiSfh/0YbKtsWuEs1kRMLsaN2kRNshlKttkK4frQtX7sHdJMCNb7Cos+IrNr5IYU7tjCy4meZGlGHEQ1dvwq21cPfPyEtikwFj7HcMVGtm2qodIt9GeXTbBKGtZ/n8XA/eJzzgQsL9YY/j5Q2c+88h6/Fdh8KGQ/+X/b6DlGxzPxh3Vp8ArRMoV1jJTasAxSrqgPbmdGjVmJdRAaVbb1ZyiMZNBjyPlmu1M1MXE55HGxkIaUNFIZquYeHe81+oXP67o3pauTGJ9QVXxMNWhiIQO/N+/EONRG0E0AXpA3FbUqNfpdIEYyIOR2x65/nxVjcjF+Hdg3C16S2VSFWj/PT5QLg6f+gV/MOyEhisZoeKl3XpdBDNV0vfrym0RtPRg2Vk/IwCKPgq8at3SQiZJc8f5VJswlmElfcA9TK25oGvAG+L8hqxPsGqIGK2IQzMBqE9PpbJRns3tXrptJcyITTfWtADEA+nXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR07MB3987.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(136003)(39830400003)(346002)(6486002)(6512007)(83380400001)(8936002)(6666004)(8676002)(6916009)(38350700002)(38100700002)(5660300002)(478600001)(86362001)(1076003)(26005)(2906002)(66476007)(956004)(2616005)(52116002)(66946007)(6506007)(186003)(66556008)(36756003)(316002)(107886003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UtaIHsADlbFv1p6Ko3Z8mIK4m6XApR1ITPNWBixGL7sDh6Bdlib0avzgHZ/n?=
 =?us-ascii?Q?oDBiGeErZAOuHCryX3ihLIui4/Ku570JvHTwBRe+ZKQ5KJdo3wFvZmLSvh8j?=
 =?us-ascii?Q?jXUCRq5O+6zWHJM4mmoRw/LfMpPgSK/98Pa8oMYIz36ZrJjFHWLyiKB52fsW?=
 =?us-ascii?Q?M0qHO46c2aTusGEGcXGyeaFYQbPS2UNqRC94Bl9/N4bPQ+pNhzRdtCzSH7QE?=
 =?us-ascii?Q?IbpCRWB9eWxSZ133osvHDhSLlcNl6iNaWE+eq7nexYqXORK3PycBm4FgWeam?=
 =?us-ascii?Q?eYang51ZeIUO2k4SWz+JiXbG0qT5d0bLGfbrbHUMshbYYzmaKp/SfPpOuPL9?=
 =?us-ascii?Q?T7KLWVEfBcT49IWhfq1klIvTK90WGMDDe9zfV+ErhXFoCbdWEVeOlgLaaPfZ?=
 =?us-ascii?Q?eNVnY1xp91VROGYMtiUmaIxjfz0jflEgSD62uiD7Tzbf1JvRW/L+5EJA480o?=
 =?us-ascii?Q?yNHlqOgQl9Z4Guveh/lkt/EAHwSWqfdCL7VDkrrIg04DbsKhINwds9hKBs8s?=
 =?us-ascii?Q?6Pwc8m9CpEKzNSSzKZO3VtIe8vLoItjms+ITS1EG75FKjE/umEnf3z6px0U2?=
 =?us-ascii?Q?qejEbn7wBwNmR7BAmOeeLTp+w8mOgNIjoeUPWhZhz23gwhvN+8yA6FI14Avb?=
 =?us-ascii?Q?WtMCsTMAQGyXF/McVa0gno7XNRj91pKVhXRPbtZrHe2QFFa0Ad9QruPNuWzw?=
 =?us-ascii?Q?CZqPmSPAxfKO89Voln1Q33UmI++5oFKviVW0Kz++yNPdIvNkHzI7Y/I1p89z?=
 =?us-ascii?Q?k+ixMEJRx9r/8Dqn+wP/YOe18LkM9+jwjKZXqIznRXT0zS7cq1bAm1NPROQi?=
 =?us-ascii?Q?/RuNlbrQQ3WDkIZ/sdIRoP4Gvq5qI4bc8ZVBiAtZdIlckbbn5tWTqNuBttVu?=
 =?us-ascii?Q?s9SKb0P7gjXiewwBYkiz4BYpvv9tdhjoReDF6pxqpCa8XQRfIwmh6lcMU7Iq?=
 =?us-ascii?Q?+McjsAmLn0Ey3y6RGXt9hNlhpBwj49bsC2s90ZLVkcaTgB8SyNSgKDap6Xeb?=
 =?us-ascii?Q?LKHQYcUdc8lD89sCAZEOHnCEzqxnofK+nV2W+WQ5kPv16lDOruRPZ1byRB1D?=
 =?us-ascii?Q?xdzUu6aG7kFnCwT4a2nhGA6weaXvI3r6W702vKpuSUQFq5MxbPAIGiPFhAI0?=
 =?us-ascii?Q?MoFiQQPKuog12j6wWTSqsOiAArAcBmnE3OWIbzVhVU+G6Avz7C2L8hQxxMUA?=
 =?us-ascii?Q?6TWK1RbFLDSFu3KsbcInWEX5Mrzok6zhT8cytPQa7/u12OIL2pKnf+7OXwCc?=
 =?us-ascii?Q?HiUFW+QWea7dzU+V+aKK0YGnZpa976b3bSZp5/MJxLe8CDasQkyioFC/mMgZ?=
 =?us-ascii?Q?aVpkCPp+EYt3pfOrKcIlDsx9?=
X-OriginatorOrg: unilogic.nl
X-MS-Exchange-CrossTenant-Network-Message-Id: b128d5db-c106-48b0-25b6-08d957ee915b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB3987.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 08:54:00.4347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 80e1d02e-cf3d-42a6-8024-091a212ef6af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZCtoXoS55NxiOYtddTrH2eiRWOMiqpNU2iOtBCeBJOHW9sgG259ioOZI1SFFnuMlXggcBwnuzVaY07152Iq8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB6339
Subject: [Buildroot] [PATCH 1/3] package/php: remove ineffective opcache
 patch
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: aduskett@gmail.com, Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Current opcache builds compile, but fail at runtime due to shm_unlink not
being resolvable.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 .../0005-allow-opcache-cross-compiling.patch  | 37 -------------------
 1 file changed, 37 deletions(-)
 delete mode 100644 package/php/0005-allow-opcache-cross-compiling.patch

diff --git a/package/php/0005-allow-opcache-cross-compiling.patch b/package/php/0005-allow-opcache-cross-compiling.patch
deleted file mode 100644
index d168f71892..0000000000
--- a/package/php/0005-allow-opcache-cross-compiling.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 9bb316c41a69935ee2072626467241889594bed4 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 28 Jun 2021 11:12:36 -0700
-Subject: [PATCH] allow opcache cross-compiling
-
-Remove the check at the end of ext/opcache/config.m4 that prevents opcache from
-being enabled in a cross-compiled environment. We pass the following as a
-CFLAGS when opcache is enabled:
-  -DHAVE_SHM_IPC
-  -DHAVE_SHM_MMAP_ANON
-  -DHAVE_SHM_MMAP_ZERO
-  -DHAVE_SHM_MMAP_POSIX
-  -DHAVE_SHM_MMAP_FILE
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- ext/opcache/config.m4 | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
-index 5492fd92..10c150ff 100644
---- a/ext/opcache/config.m4
-+++ b/ext/opcache/config.m4
-@@ -339,10 +339,6 @@ int main() {
-   PHP_ADD_BUILD_DIR([$ext_builddir/Optimizer], 1)
-   PHP_ADD_EXTENSION_DEP(opcache, pcre)
- 
--  if test "$have_shm_ipc" != "yes" && test "$have_shm_mmap_posix" != "yes" && test "$have_shm_mmap_anon" != "yes"; then
--    AC_MSG_ERROR([No supported shared memory caching support was found when configuring opcache. Check config.log for any errors or missing dependencies.])
--  fi
--
-   if test "$PHP_OPCACHE_JIT" = "yes"; then
-     PHP_ADD_BUILD_DIR([$ext_builddir/jit], 1)
-     PHP_ADD_MAKEFILE_FRAGMENT($ext_srcdir/jit/Makefile.frag)
--- 
-2.31.1
-
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
