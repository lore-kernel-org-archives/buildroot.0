Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3178CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC5F8427CF;
	Sat, 30 May 2026 10:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0SSHlCTnRKbv; Sat, 30 May 2026 10:41:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 931FC427DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780137717;
	bh=as2zLwXFOmgnyJe8NIirifatv++0AHExqmTLzB0Vn3g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jIjLCWDpTLZjTo+kQ+FUucVa7EZE/igav8zL3MUfw3D6nqoqI4OcjlCTAN0annuN3
	 3XdW2ouhVCGFPt9wosVtw3sKYAZSQoSDut0QNLCGnav4JgJ03RorfGRIgOLbRyowd1
	 oKZ3jWLzMi+SGD/lmT7ZEaghduYkfjV1QqiFMjGA/UDlgI9m3bgy0FrzjMCJJmzAtn
	 PPbKjdqy38LWgCwNdpTveP/ZCJcfYzehkAE36ZqpDSRfTM2nX/mURQZWthSnURxJPV
	 dPgqMc2dQ/mjjxAFT0F+zrqtPunkcen3ympE2VdKAdzh2zeOq6zefjLKslwgtKar1t
	 7vvOQr66fJMuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 931FC427DF;
	Sat, 30 May 2026 10:41:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5230F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D42B8427DF
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSeKuaH1NbZz for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:41:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 86E83427CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86E83427CF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86E83427CF
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:41:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2854BA4C2EC6
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:41:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38554)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTH8a-000000005T0-0Cl9
 for buildroot@buildroot.org; Sat, 30 May 2026 10:41:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 12:41:51 +0200
Message-ID: <20260530104151.610288-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780137712;
 bh=MSA/qHhDwxkm6f491JH8FKrRh2+HIXd7MfAi5htscfI=;
 h=From:To:Subject:Date:From;
 b=KSbNgJ9ocAOgvS0gefl1oMG6O9jRX05p4iDCcdDkwnj3ODc+RK1j/LOlRbyoGJGq7
 nICkOuRx6Azsnlu+/gnIBRxA36d1f+Qy+seBdyF41TXmrknU0RwGj9nai7w9fMZ9jO
 A1ubn+5zEKOpFeREh6r65UOrgWFkWEdViYcZfyvFQGuJikhKjUwTBNuHq7q1OU5TuU
 iXyp9jj+imS+wX/vq3blr8/8oJbsbCNCObce68QlA9pq98sNYQDN3IRFCAkhwZfJKV
 0wRY/Mm5rHDTYkrClUnsJuI1PFDOObLw+3/+LjTiwbUgEAXyY4rwFBVTFvejOLoVpr
 wIrIEVRFtXgwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KSbNgJ9o
Subject: [Buildroot] [PATCH 1/1] package/{lib,
 kodi-pvr-}hdhomerun: remove packages
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As proposed by Peter:
https://lists.buildroot.org/pipermail/buildroot/2026-May/803331.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2563648765

 .checkpackageignore                           |  1 -
 Config.in.legacy                              | 16 ++++++++++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 package/kodi-pvr-hdhomerun/Config.in          |  8 -----
 .../kodi-pvr-hdhomerun.hash                   |  3 --
 .../kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk  | 13 --------
 package/kodi/Config.in                        |  1 -
 package/libhdhomerun/0001-dont-strip.patch    | 18 -----------
 package/libhdhomerun/Config.in                | 12 -------
 package/libhdhomerun/libhdhomerun.hash        |  3 --
 package/libhdhomerun/libhdhomerun.mk          | 32 -------------------
 package/tvheadend/tvheadend.mk                |  8 +----
 13 files changed, 17 insertions(+), 100 deletions(-)
 delete mode 100644 package/kodi-pvr-hdhomerun/Config.in
 delete mode 100644 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
 delete mode 100644 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
 delete mode 100644 package/libhdhomerun/0001-dont-strip.patch
 delete mode 100644 package/libhdhomerun/Config.in
 delete mode 100644 package/libhdhomerun/libhdhomerun.hash
 delete mode 100644 package/libhdhomerun/libhdhomerun.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index ff5e82b6a7..91443abd73 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -492,7 +492,6 @@ package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch lib_pat
 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch lib_patch.Upstream
 package/libgsm/0001-Misc-fixes-from-Archlinux.patch lib_patch.Upstream
 package/libgtk3/0001-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch lib_patch.Upstream
-package/libhdhomerun/0001-dont-strip.patch lib_patch.Upstream
 package/libjson/0001-fix-broken-makefile.patch lib_patch.Upstream
 package/libks/0001-CMakeLists.txt-honour-BUILD_TESTING.patch lib_patch.Upstream
 package/liblinear/0001-build-static-lib.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 8fed4b72c1..f7fc6e186d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,22 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_LIBHDHOMERUN
+	bool "libhdhomerun"
+	select BR2_LEGACY
+	help
+	  libhdhomerun was removed from Buildroot as it was
+	  insufficiently maintained. It can be re-added if someone
+	  volunteers to  maintain it.
+
+config BR2_PACKAGE_KODI_PVR_HDHOMERUN
+	bool "kodi-pvr-hdhomerun"
+	select BR2_LEGACY
+	help
+	  kodi-pvr-hdhomerun was removed from Buildroot as it was
+	  insufficiently maintained. It can be re-added if someone
+	  volunteers to maintain it.
+
 config BR2_PACKAGE_ZEEK
 	bool "zeek removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 877aa56d96..9aaffa29a9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -427,7 +427,6 @@ F:	package/libfribidi/
 F:	package/libg7221/
 F:	package/libglew/
 F:	package/libglu/
-F:	package/libhdhomerun/
 F:	package/libheif/
 F:	package/libid3tag/
 F:	package/libilbc/
diff --git a/package/Config.in b/package/Config.in
index b2305ca019..7e69d025e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1949,7 +1949,6 @@ menu "Multimedia"
 	source "package/libdvdnav/Config.in"
 	source "package/libdvdread/Config.in"
 	source "package/libebml/Config.in"
-	source "package/libhdhomerun/Config.in"
 	source "package/libheif/Config.in"
 	source "package/libimxvpuapi/Config.in"
 	source "package/libmatroska/Config.in"
diff --git a/package/kodi-pvr-hdhomerun/Config.in b/package/kodi-pvr-hdhomerun/Config.in
deleted file mode 100644
index 5a05a85c9c..0000000000
--- a/package/kodi-pvr-hdhomerun/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_KODI_PVR_HDHOMERUN
-	bool "kodi-pvr-hdhomerun"
-	select BR2_PACKAGE_JSONCPP
-	select BR2_PACKAGE_LIBHDHOMERUN
-	help
-	  Kodi's HDHomeRun client addon
-
-	  https://github.com/kodi-pvr/pvr.hdhomerun
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
deleted file mode 100644
index 88bd915f1d..0000000000
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  3033a3bdb8ac4cc5fdb1a85ec9ac8307a37dfa894472283ac589ae8c1f339dc7  kodi-pvr-hdhomerun-21.0.4-Omega.tar.gz
-sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
deleted file mode 100644
index 1d3338d5f7..0000000000
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# kodi-pvr-hdhomerun
-#
-################################################################################
-
-KODI_PVR_HDHOMERUN_VERSION = 21.0.4-Omega
-KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
-KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
-KODI_PVR_HDHOMERUN_LICENSE_FILES = LICENSE.md
-KODI_PVR_HDHOMERUN_DEPENDENCIES = jsoncpp kodi libhdhomerun
-
-$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a05a180eb3..50f7e21f4a 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -320,7 +320,6 @@ menu "PVR addons"
 	source "package/kodi-pvr-dvblink/Config.in"
 	source "package/kodi-pvr-dvbviewer/Config.in"
 	source "package/kodi-pvr-filmon/Config.in"
-	source "package/kodi-pvr-hdhomerun/Config.in"
 	source "package/kodi-pvr-hts/Config.in"
 	source "package/kodi-pvr-iptvsimple/Config.in"
 	source "package/kodi-pvr-mediaportal-tvserver/Config.in"
diff --git a/package/libhdhomerun/0001-dont-strip.patch b/package/libhdhomerun/0001-dont-strip.patch
deleted file mode 100644
index 17a9ff49a9..0000000000
--- a/package/libhdhomerun/0001-dont-strip.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Disable strip in Makefile.
-
-Patch downloaded from Gentoo:
-https://gitweb.gentoo.org/repo/gentoo.git/tree/media-libs/libhdhomerun/files/dont-strip.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -Nur libhdhomerun/Makefile libhdhomerun.fix/Makefile
---- libhdhomerun/Makefile	2012-08-30 15:46:27.000000000 -0500
-+++ libhdhomerun.fix/Makefile	2013-03-24 14:47:08.740937164 -0500
-@@ -42,7 +42,6 @@
- 
- hdhomerun_config$(BINEXT) : hdhomerun_config.c $(LIBSRCS)
- 	$(CC) $(CFLAGS) $+ $(LDFLAGS) -o $@
--	$(STRIP) $@
- 
- libhdhomerun$(LIBEXT) : $(LIBSRCS)
- 	$(CC) $(CFLAGS) -fPIC -DDLL_EXPORT $(SHARED) $+ $(LDFLAGS) -o $@
diff --git a/package/libhdhomerun/Config.in b/package/libhdhomerun/Config.in
deleted file mode 100644
index 9425c1b159..0000000000
--- a/package/libhdhomerun/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_LIBHDHOMERUN
-	bool "libhdhomerun"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
-	help
-	  HDHomeRun is a network-attached digital television tuner
-	  box, produced by the company SiliconDust USA, Inc.
-
-	  http://www.silicondust.com
-
-comment "libhdhomerun needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libhdhomerun/libhdhomerun.hash b/package/libhdhomerun/libhdhomerun.hash
deleted file mode 100644
index 66edd6a0d3..0000000000
--- a/package/libhdhomerun/libhdhomerun.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  deaf463bbcc3eefa72f97199efb6213f7b0e2c8e91f1b3d2cbf52056a8715d15  libhdhomerun_20210624.tgz
-sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/libhdhomerun/libhdhomerun.mk b/package/libhdhomerun/libhdhomerun.mk
deleted file mode 100644
index 4bc584e622..0000000000
--- a/package/libhdhomerun/libhdhomerun.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# libhdhomerun
-#
-################################################################################
-
-LIBHDHOMERUN_VERSION = 20210624
-LIBHDHOMERUN_SOURCE = libhdhomerun_$(LIBHDHOMERUN_VERSION).tgz
-LIBHDHOMERUN_SITE = http://download.silicondust.com/hdhomerun
-LIBHDHOMERUN_LICENSE = LGPL-2.1+
-LIBHDHOMERUN_LICENSE_FILES = LICENSE
-LIBHDHOMERUN_INSTALL_STAGING = YES
-
-define LIBHDHOMERUN_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
-		CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
-endef
-
-define LIBHDHOMERUN_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/libhdhomerun.so \
-		$(STAGING_DIR)/usr/lib/libhdhomerun.so
-	mkdir -p $(STAGING_DIR)/usr/include/libhdhomerun/
-	$(INSTALL) -m 0644 $(@D)/*.h \
-		$(STAGING_DIR)/usr/include/libhdhomerun/
-endef
-
-define LIBHDHOMERUN_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/libhdhomerun.so \
-		$(TARGET_DIR)/usr/lib/libhdhomerun.so
-endef
-
-$(eval $(generic-package))
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 2f99bebbb2..73563acb8e 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -16,6 +16,7 @@ TVHEADEND_DEPENDENCIES = \
 	host-python3 \
 	openssl
 TVHEADEND_CONF_OPTS = \
+	--disable-hdhomerun_client \
 	--disable-omx \
 	--disable-pcre
 
@@ -108,13 +109,6 @@ else
 TVHEADEND_CONF_OPTS += --disable-tvhcsa
 endif
 
-ifeq ($(BR2_PACKAGE_LIBHDHOMERUN),y)
-TVHEADEND_DEPENDENCIES += libhdhomerun
-TVHEADEND_CONF_OPTS += --enable-hdhomerun_client
-else
-TVHEADEND_CONF_OPTS += --disable-hdhomerun_client
-endif
-
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TVHEADEND_DEPENDENCIES += libiconv
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
