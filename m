Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D95ECA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3032F41919;
	Wed, 10 Sep 2025 21:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2f2rUNLT_4a; Wed, 10 Sep 2025 21:33:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13D9A4192B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13D9A4192B;
	Wed, 10 Sep 2025 21:33:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0B98234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 929844080B
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DfGrrz0yJXEw for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5600340103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5600340103
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5600340103
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 97BA61A0D9B
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6F7AE606D4;
 Wed, 10 Sep 2025 21:33:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 33954102F29D8; 
 Wed, 10 Sep 2025 23:33:11 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 10 Sep 2025 23:32:11 +0200
Message-ID: <20250910213241.1529448-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757539992; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=4Ef8xHN9tzTzsaa8f2lqSVnuLmLKKCEWgVSqrSy2a7g=;
 b=uPSn2T95jy5aGqmZm+fAXKM0/lL7bSUpRXSjfCjqkmE5TvX+KRQeZrbZDJSoaVPUEzTByU
 lqICMD4OQGsGwDB/JVdxES7BUCIcWGWp6ATa+Bqm/hp1TzDKHsvWPN5zeBUVV7pFTxJCY0
 ukQvnDb55ybQcWVwKmXfo2PFMPAh74XA/8cvXLwnsMwiuZ7nR/cwlGN/zZq5yl4mjWOCb3
 0QcCGlhXBqmIxZsaSeh09eGTMoJltRzqmhVrv8Mgwwejsg9cExXqM7Lxk2+tKM4w2sCP+I
 xmYD8HVr3Tek2Pf0bybjHILGFK1XelSBlNf4v4aMSGSNjVzX62lWnj/M2YAvfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=uPSn2T95
Subject: [Buildroot] [PATCH 03/23] package/gkrellm: remove package,
 needs libgtk2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The gkrellm client needs libgtk2, which we are about to drop from
Buildroot.

Even though gkrellm has a somewhat active upstream at
https://git.srcbox.net/gkrellm/gkrellm, it isn't clear whether it is
compatible with Gtk 3 or not.

Since building just the server isn't very useful, this commit drops
the gkrellm package entirely, which is anyway not fitting well within
the scope of Buildroot, which doesn't include building a full desktop
environment: gkrellm is unlikely to be useful in typical embedded
use-cases.

Cc: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy             |  8 +++++
 DEVELOPERS                   |  1 -
 package/Config.in            |  1 -
 package/gkrellm/Config.in    | 43 --------------------------
 package/gkrellm/gkrellm.hash |  4 ---
 package/gkrellm/gkrellm.mk   | 60 ------------------------------------
 6 files changed, 8 insertions(+), 109 deletions(-)
 delete mode 100644 package/gkrellm/Config.in
 delete mode 100644 package/gkrellm/gkrellm.hash
 delete mode 100644 package/gkrellm/gkrellm.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 4bb160c4a3..5badcfe259 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_GKRELLM
+	bool "gkrellm has been removed"
+	select BR2_LEGACY
+	help
+	  The gkrellm package has been removed, as its client required
+	  libgtk2, which was removed from Buildroot, and just the
+	  gkrellm server isn't that useful.
+
 config BR2_PACKAGE_CWIID_WMGUI
 	bool "cwiid wmgui has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 16d9ee892b..7374e389fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -381,7 +381,6 @@ F:	package/freetype/
 F:	package/fstrcmp/
 F:	package/ghostscript/
 F:	package/giflib/
-F:	package/gkrellm/
 F:	package/gpsd/
 F:	package/gptfdisk/
 F:	package/hddtemp/
diff --git a/package/Config.in b/package/Config.in
index 5ac6dc6972..1b740c02f5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2870,7 +2870,6 @@ menu "System tools"
 	source "package/fluent-bit/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
-	source "package/gkrellm/Config.in"
 	source "package/htop/Config.in"
 	source "package/hwclock-initscript/Config.in"
 	source "package/ibm-sw-tpm2/Config.in"
diff --git a/package/gkrellm/Config.in b/package/gkrellm/Config.in
deleted file mode 100644
index e957c058de..0000000000
--- a/package/gkrellm/Config.in
+++ /dev/null
@@ -1,43 +0,0 @@
-config BR2_PACKAGE_GKRELLM
-	bool "gkrellm"
-	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_USE_MMU # libglib2
-	select BR2_PACKAGE_GKRELLM_SERVER if !BR2_PACKAGE_GKRELLM_CLIENT
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  GKrellM is a single process stack of system monitors which
-	  supports applying themes to match its appearance to your
-	  window manager, Gtk, or any other theme.
-
-	  http://gkrellm.srcbox.net/
-
-if BR2_PACKAGE_GKRELLM
-
-config BR2_PACKAGE_GKRELLM_SERVER
-	bool "server"
-	help
-	  Enable gkrellm server.
-
-config BR2_PACKAGE_GKRELLM_CLIENT
-	bool "client"
-	depends on BR2_PACKAGE_XORG7 # libgtk2
-	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2
-	select BR2_PACKAGE_LIBGTK2
-	select BR2_PACKAGE_XLIB_LIBSM
-	help
-	  Enable gkrellm client.
-
-comment "client needs a toolchain w/ C++, gcc >= 4.8"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-
-endif # BR2_PACKAGE_GKRELLM
-
-comment "gkrellm needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gkrellm/gkrellm.hash b/package/gkrellm/gkrellm.hash
deleted file mode 100644
index 27ba276efa..0000000000
--- a/package/gkrellm/gkrellm.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally computed
-sha256  6f83665760b936ad4b55f9182b1ec7601faf38a0f25ea1e4bddc9965088f032d  gkrellm-2.4.0.tar.bz2
-sha256  691de85c3c6eeda5b6982c751548575344739ce4b4418d78905e599359f6c435  COPYING
-sha256  a4bb0b604fe7d40ca4469ffd5e2e2de70ff8ece43e47980ab2c8962d5e913330  COPYRIGHT
diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
deleted file mode 100644
index 165b71c7c8..0000000000
--- a/package/gkrellm/gkrellm.mk
+++ /dev/null
@@ -1,60 +0,0 @@
-################################################################################
-#
-# gkrellm
-#
-################################################################################
-
-GKRELLM_VERSION = 2.4.0
-GKRELLM_SITE = http://gkrellm.srcbox.net/releases
-GKRELLM_SOURCE = gkrellm-$(GKRELLM_VERSION).tar.bz2
-GKRELLM_LICENSE = GPL-3.0+
-GKRELLM_LICENSE_FILES = COPYING COPYRIGHT
-GKRELLM_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
-GKRELLM_BUILD_OPTS = \
-	STRIP="" \
-	SYS_LIBS="$(GKRELLM_SYS_LIBS)"
-
-GKRELLM_SYS_LIBS = $(TARGET_NLS_LIBS)
-
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-GKRELLM_SYS_LIBS += -latomic
-endif
-
-ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
-GKRELLM_DEPENDENCIES += lm-sensors
-else
-GKRELLM_BUILD_OPTS += without-libsensors=yes
-endif
-
-ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
-GKRELLM_BUILD_OPTS += enable_nls=1
-else
-GKRELLM_BUILD_OPTS += enable_nls=0
-endif
-
-ifeq ($(BR2_PACKAGE_GKRELLM_SERVER)$(BR2_PACKAGE_GKRELLM_CLIENT),yy)
-GKRELLM_BUILD_DIR = $(@D)
-else ifeq ($(BR2_PACKAGE_GKRELLM_SERVER),y)
-GKRELLM_BUILD_DIR = $(@D)/server
-else
-GKRELLM_BUILD_DIR = $(@D)/src
-endif
-
-ifeq ($(BR2_PACKAGE_GKRELLM_CLIENT),y)
-GKRELLM_DEPENDENCIES += libgtk2 xlib_libSM
-GKRELLM_BUILD_OPTS += X11_LIBS="-lX11 -lSM -lICE"
-GKRELLM_LICENSE += GPL (base64.c), Public Domain (md5.h, md5c.c)
-endif
-
-define GKRELLM_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) \
-		-C $(GKRELLM_BUILD_DIR) $(GKRELLM_BUILD_OPTS)
-endef
-
-define GKRELLM_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) \
-		-C $(GKRELLM_BUILD_DIR) $(GKRELLM_BUILD_OPTS) \
-		INSTALLROOT=$(TARGET_DIR)/usr install
-endef
-
-$(eval $(generic-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
