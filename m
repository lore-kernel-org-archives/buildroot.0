Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAC2EB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 11:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BFE260A88;
	Sat,  8 Jul 2023 11:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BFE260A88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qN74c35N9_Dm; Sat,  8 Jul 2023 11:14:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E9F960A92;
	Sat,  8 Jul 2023 11:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E9F960A92
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E9C01BF83B
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 11:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8555F4195C
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 11:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8555F4195C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFWoPh8gkfaM for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 11:14:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6A76418F7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6A76418F7
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 11:14:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6EFF4A4C0981;
 Sat,  8 Jul 2023 13:14:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54668)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qI5tX-0000iv-2g;
 Sat, 08 Jul 2023 13:14:31 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 13:14:31 +0200
Message-Id: <20230708111431.425846-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688814872;
 bh=7BjWfP5AtO5ZJyS0EZgteN1/dwJwe5YwSyinLnhuGK8=;
 h=From:To:Cc:Subject:Date:From;
 b=hbJamkHLPhS5titguHDxV1/o96PZUUboSDfC5Wq4ijtALl4BuxAkzImSQeszlEuJ7
 iOVNhfOPOloqWSNAHABYdPZdAFK11cbEY/SgnNySRWmBOy7pA+rDXBTnmSg0xb9fk+
 MAaCovLaWjl6O4mAcpL8qWUBCadIbNHgJKCvwQRfhxYKBIDrPzLjYS0gMFG5+L+JrU
 KtuW41h4g6VXDUsMgLW/V0YanbrOcXfsAGqULUifNoNh5FqLNYfBNC5imUfv0AMz8E
 mUX6H7th6L27rX5YgjD1Kji8to42b6BOAIZK3EMO0/I1H9g3EFXnhHOPAUMajrCg0F
 3IJ+8rgIKbnJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=hbJamkHL
Subject: [Buildroot] [PATCH 1/1] package/emlog: Fix build on Linux 6.4
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/f6c/f6c52f58c3c016cee59d2dfe513c449d96dc3b09/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../emlog/0001-Fix-build-on-Linux-6.4.patch   | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/emlog/0001-Fix-build-on-Linux-6.4.patch

diff --git a/package/emlog/0001-Fix-build-on-Linux-6.4.patch b/package/emlog/0001-Fix-build-on-Linux-6.4.patch
new file mode 100644
index 0000000000..65440c1933
--- /dev/null
+++ b/package/emlog/0001-Fix-build-on-Linux-6.4.patch
@@ -0,0 +1,34 @@
+From 32ec7f7b4eb1466100d59aaea8855d770af54327 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 8 Jul 2023 13:10:24 +0200
+Subject: [PATCH] Fix build on Linux 6.4
+
+Needed after upstream changes in kernel 6.4:
+https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/diff/include/linux/device/class.h?id=1aaba11da9aa
+
+Upstream: https://github.com/nicupavel/emlog/pull/15
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ emlog.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/emlog.c b/emlog.c
+index 4462466..2ead738 100644
+--- a/emlog.c
++++ b/emlog.c
+@@ -500,7 +500,11 @@ static int __init emlog_init(void)
+ 
+     pr_info("version %s running, major is %u, MINOR is %u, max size %d K.\n", EMLOG_VERSION, (unsigned)MAJOR(emlog_dev_type), (unsigned)MINOR(emlog_dev_type), emlog_max_size);
+ 
++#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 4, 0)
+     emlog_class = class_create(THIS_MODULE, DEVICE_NAME);
++#else
++    emlog_class = class_create(DEVICE_NAME);
++#endif
+     if (emlog_class == NULL) {
+         pr_err("Can not class_create.\n");
+         ret_val = -4; goto emlog_init_error;
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
