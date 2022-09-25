Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838CEC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 17:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13E9282730;
	Sun, 25 Sep 2022 17:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13E9282730
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GOL4PGuaSGzC; Sun, 25 Sep 2022 17:20:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2029B82F39;
	Sun, 25 Sep 2022 17:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2029B82F39
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 456251BF97E
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 17:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 087138188A
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 17:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 087138188A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcqwqo5hXtC8 for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 17:19:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9227381759
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9227381759
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 17:19:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 5EACF200005;
 Sun, 25 Sep 2022 17:19:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 25 Sep 2022 19:19:29 +0200
Message-Id: <20220925171932.1630739-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664126381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JS16v+GXLkca8a/b/Dbj34d/9Snh8Wdl95UdtiVoVTg=;
 b=KnwxTCooG/xSYEdzJp3LDCtqPaXbbweeeDTmRVOEwlSmFVmf54wHuDlCP/GnqsF/fJK1SF
 vIrMH9HFhJq6iRPzYPONFob7MrbmBTlbkrREh4M9tp3VHbJdUagWvfYH+1dvDqAeAxU6Yn
 nnKuxcdqPVSA3UmE8j1y6W+OSjoNpn5U3NTYo6bVO9FB7Kl1w4mar6+Pef73KqvcNWkIzb
 UtyylmzJMeXlg+tNmJfkpIIbvubwTLOwjxrsCpib7A4Je1/TtUpd9V+KChu6E31rklDnoX
 Uzb58MJHpQRu2LV6LVx58MFVWGz3j0wICah7MgDlRTkMA9qV3r7vtzknMb4SvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KnwxTCoo
Subject: [Buildroot] [PATCH 1/4] package/nodejs: fixup qemu dependencies
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 1facb09b94bf806b301868539185c0ff9ddffee2 ("package/nodejs:
build host-nodejs only if we're installing modules with NPM") forgot
to account for the dependency on Qemu. Now that nodejs no longer
depends on host-nodejs, but needs host-qemu, we need to make sure that
nodejs selects the relevant BR2_PACKAGE_HOST_QEMU options.

So this patch:

 - Drops the dependency of BR2_PACKAGE_NODEJS_ARCH_SUPPORTS on
   BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET, which was incorrect: we
   don't care about running Qemu on the target. We care about
   host-qemu supporting the emulation of the target architecture,
   which is what BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS is for.

 - Adds the dependency to the relevant BR2_PACKAGE_HOST_QEMU options
   to BR2_PACKAGE_NODEJS, so that host-qemu is built with the
   appropriate features needed to build the target nodejs.

 - Removes the qemu related dependencies from host-nodejs, which does
   not need Qemu at all.

Without this change the build of nodejs without npm enabled is broken
as the host-qemu that gets built does not have all the features that
are needed. There are no autobuild failures at this point, however.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/Config.in      | 4 +++-
 package/nodejs/Config.in.host | 4 ----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 8d0bd8fd60..5375dfeacd 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	default y if BR2_aarch64 || BR2_i386 || BR2_x86_64
 	# libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
+	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 
 comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 7, wchar, host gcc >= 8"
 	depends on BR2_USE_MMU
@@ -31,6 +31,8 @@ config BR2_PACKAGE_NODEJS
 	select BR2_PACKAGE_HOST_PYTHON3
 	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
 	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	select BR2_PACKAGE_HOST_QEMU
+	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_ZLIB
diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
index 4ceaf0c73e..f7f2b80a9b 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs/Config.in.host
@@ -1,12 +1,9 @@
 config BR2_PACKAGE_HOST_NODEJS
 	bool "host nodejs"
-	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_PACKAGE_HOST_PYTHON3
 	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
 	select BR2_PACKAGE_HOST_PYTHON3_SSL
-	select BR2_PACKAGE_HOST_QEMU
-	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
 	help
 	  Event-driven I/O server-side JavaScript environment based on
 	  V8.
@@ -14,5 +11,4 @@ config BR2_PACKAGE_HOST_NODEJS
 	  http://nodejs.org/
 
 comment "host nodejs needs a host gcc >= 8"
-	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	depends on !BR2_HOST_GCC_AT_LEAST_8
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
