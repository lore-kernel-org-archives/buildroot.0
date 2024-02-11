Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E119CC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 16:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4919E81852;
	Sun, 11 Feb 2024 16:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2IcK_veFAW2p; Sun, 11 Feb 2024 16:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1765C82145
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1765C82145;
	Sun, 11 Feb 2024 16:31:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4509A1BF5A9
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 16:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F74260861
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 16:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DALr7pPpJiGt for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 16:31:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD0C96085F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD0C96085F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD0C96085F
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 16:31:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 435E1A4C0686
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 17:31:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42970)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rZCjc-000000001q7-491L
 for buildroot@buildroot.org; Sun, 11 Feb 2024 17:31:17 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 17:31:16 +0100
Message-Id: <20240211163116.2318321-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1707669077;
 bh=iIJZzVrw8kLREpC1YMQZ892LpnKDrXgooczIj9eWTic=;
 h=From:To:Subject:Date:From;
 b=Ifjd+yZ/UBcTTGqG6s7yoIx9YqLF4WEsav7Y2WQy3sTBbqDjEp+pa2uFMFkGILXC+
 mq4c7FXoaywy57Ji/7t9OITcOcX4/OhnwVxpUXqhsVxwPzDUj/A/Xfpv4lOpkQRcga
 TjTXfpLS2tpC9Fhb+IB7V0W2jPX4ZlPkl1HEViYj3vUAbaFzSXhuOgvB3bYjd87ucW
 bWfQKqv2TdKC1ps4RxgMdTsVxnSmuJMV8dYKYFoqBwjGkW83oU4dJvWnRtJqqOp/Mz
 QeDRX65IF77N2I8B7HPOI+IueTnzd1DeFrSNG1Nt2Olk3mf5ylcMej/srQn9LrGdOl
 4y2aZL/kiL8lA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=Ifjd+yZ/
Subject: [Buildroot] [PATCH 1/1] package/libpng: bump version to 1.6.42
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

Release notes:
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.42/ANNOUNCE

Removed patch which disabled pngfix and png-fix-itxt tools and use the
new upstream-provided configure option --disable-tools instead:
https://github.com/pnggroup/libpng/commit/22ad62c25e7355b20d1486da301cb69159db0915
https://github.com/pnggroup/libpng/commit/71475b064f3e628e55a2f89f55e873945650afe9

Updated license hash due to copyright year bump:
https://github.com/pnggroup/libpng/commit/0dfe422e9f872d3a851d52fc45047bdfd6da0cf4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...0001-Disable-pngfix-and-png-fix-itxt.patch | 47 -------------------
 package/libpng/libpng.hash                    |  6 +--
 package/libpng/libpng.mk                      |  3 +-
 3 files changed, 5 insertions(+), 51 deletions(-)
 delete mode 100644 package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch

diff --git a/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch b/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
deleted file mode 100644
index d16bdb2b11..0000000000
--- a/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 60c3ee917c8e7a4760b1ef7c3dc2b44a615150d3 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 26 May 2016 16:26:18 -0300
-Subject: [PATCH] Disable pngfix and png-fix-itxt
-
-Disable the new pngfix and png-fix-itxt tools: they take up space, fail
-to build on some oddball toolchain configurations and aren't
-expected/needed in a non-interactive embedded system.
-
-[Julien: update for 1.6.25]
-Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- Makefile.am | 2 +-
- Makefile.in | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 7212951..3430dca 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -18,7 +18,7 @@ check_PROGRAMS += timepng
- endif
- 
- # Utilities - installed
--bin_PROGRAMS= pngfix png-fix-itxt
-+bin_PROGRAMS=
- 
- # This ensures that pnglibconf.h gets built at the start of 'make all' or
- # 'make check', but it does not add dependencies to the individual programs,
-diff --git a/Makefile.in b/Makefile.in
-index a66f6aa..4e67782 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -104,7 +104,7 @@ check_PROGRAMS = pngtest$(EXEEXT) pngunknown$(EXEEXT) \
- 	pngstest$(EXEEXT) pngvalid$(EXEEXT) pngimage$(EXEEXT) \
- 	pngcp$(EXEEXT) $(am__EXEEXT_1)
- @HAVE_CLOCK_GETTIME_TRUE@am__append_1 = timepng
--bin_PROGRAMS = pngfix$(EXEEXT) png-fix-itxt$(EXEEXT)
-+bin_PROGRAMS =
- @PNG_ARM_NEON_TRUE@am__append_2 = arm/arm_init.c\
- @PNG_ARM_NEON_TRUE@	arm/filter_neon.S arm/filter_neon_intrinsics.c \
- @PNG_ARM_NEON_TRUE@	arm/palette_neon_intrinsics.c
--- 
-2.7.3
-
diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index d864850b06..fbae14c51d 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/png-mng/mailman/message/37860896/
-sha256  535b479b2467ff231a3ec6d92a525906fb8ef27978be4f66dbe05d3f3a01b3a1  libpng-1.6.40.tar.xz
+# From https://sourceforge.net/p/png-mng/mailman/message/58731120/
+sha256  c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450  libpng-1.6.42.tar.xz
 # Locally computed:
-sha256  5c0bb4b05b1354ae7c173532b6702ea68b611047ff9b91c4d3af77da39c195d9  LICENSE
+sha256  7317e078e2d3b5d7ba5a6159e650945153262b44b76f6700f8e9edb261c5143e  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index b7bacd9217..c4da9f89c7 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.40
+LIBPNG_VERSION = 1.6.42
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
@@ -15,6 +15,7 @@ LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
 HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
+LIBPNG_CONF_OPTS = --disable-tools
 
 ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_aarch64),y)
 LIBPNG_CONF_OPTS += --enable-arm-neon
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
