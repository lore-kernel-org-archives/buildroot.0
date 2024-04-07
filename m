Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A0ACD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBB1281FF2;
	Sun,  7 Apr 2024 11:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7C7ie-Y2Ulq; Sun,  7 Apr 2024 11:45:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88A5881FE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88A5881FE7;
	Sun,  7 Apr 2024 11:45:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 756F61BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62311407CD
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7R6DA6hhku8J for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:45:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88230407CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88230407CC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88230407CC
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 11:45:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a070b.dip0.t-ipconnect.de [91.58.7.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F2B95A4C2D97;
 Sun,  7 Apr 2024 13:44:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53892)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rtQx4-000000005Wv-30P4;
 Sun, 07 Apr 2024 11:44:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 13:44:28 +0200
Message-Id: <20240407114445.683504-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240407114445.683504-1-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712490287;
 bh=tLPunopYax0XUnTdCiUaA8jFFlps1YWGEAHk7oS1Emo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OKekFHQbtNG8ZQ/tAzuf3yTCbpcT1a10eFWshx6gUotiyE70ezekVKZ734EJasyVN
 E8R6UIxazLHaYju4My1tZIOe7zgLgZSwj8g//pQYqNV3KXlQfZ7mLoyl7pUFwWp+Oc
 pLjtjZZKWs4derbfE4/wSbSvJsLSQRFaa5JYC0o1Lk73Bhu6RGObKEvC5eGKeo4x+q
 OdOvoZUNcVQqc1VSKiRV4GP6+WMxaPh3ipKdJsdBUvRgWBZ06ko8/pT4eiimsj7GDL
 RWtJdOu3ObLgnZNkF+KxBi5Qqj3l/1ahPo2ftchJI/wLMODayU6wJeLGk7do/+xHIE
 5fuXc5E3NhJ/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=OKekFHQb
Subject: [Buildroot] [PATCH v2 03/20] package/omxplayer: remove package
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting https://github.com/popcornmix/omxplayer/blob/master/README.md
"Note: omxplayer has been deprecated since 2020; resources are directed
 at improving vlc."

This package is incompatible with ffmpeg 6.x:
https://bugs.gentoo.org/908959#c2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  6 +++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 ...file-to-be-compatible-with-buildroot.patch | 39 -------------------
 package/omxplayer/Config.in                   | 36 -----------------
 package/omxplayer/omxplayer.hash              |  6 ---
 package/omxplayer/omxplayer.mk                | 39 -------------------
 8 files changed, 6 insertions(+), 123 deletions(-)
 delete mode 100644 package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch
 delete mode 100644 package/omxplayer/Config.in
 delete mode 100644 package/omxplayer/omxplayer.hash
 delete mode 100644 package/omxplayer/omxplayer.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 1b336ce7a3..43665df7e6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -919,7 +919,6 @@ package/olsr/0003-pud-adapt-to-API-changes-in-gpsd-3-20.patch lib_patch.Upstream
 package/olsr/0005-lib-pud-src-gpsdclient.c-drop-handling-of-gpsdata-fi.patch lib_patch.Upstream
 package/olsr/0006-build-patch-for-gpsd-3-25.patch lib_patch.Upstream
 package/olsr/S50olsr Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch lib_patch.Upstream
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch lib_patch.Upstream
 package/open2300/0001-fix-makefile.patch lib_patch.Upstream
 package/openjdk/17.0.9+9/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index d00196e08b..87b7954cb8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_PACKAGE_OMXPLAYER
+	bool "omxplayer removed"
+	select BR2_LEGACY
+	help
+	  Package was deprecated in 2020 and is broken with ffmpeg 6.x
+
 config BR2_PACKAGE_FLUTTER_GALLERY
 	bool "flutter-gallery removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index d78661cd60..ca73006c78 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3231,7 +3231,6 @@ F:	package/mesa3d-headers/
 F:	package/nbd/
 F:	package/nut/
 F:	package/nvidia-driver/
-F:	package/omxplayer/
 F:	package/python-pyparsing/
 F:	package/pkg-download.mk
 F:	package/pkg-waf.mk
diff --git a/package/Config.in b/package/Config.in
index 0d31faf354..4fa0e541fe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -44,7 +44,6 @@ menu "Audio and video applications"
 	source "package/multicat/Config.in"
 	source "package/musepack/Config.in"
 	source "package/ncmpc/Config.in"
-	source "package/omxplayer/Config.in"
 	source "package/on2-8170-libs/Config.in"
 	source "package/opus-tools/Config.in"
 	source "package/pipewire/Config.in"
diff --git a/package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch b/package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch
deleted file mode 100644
index 8f8bfad73e..0000000000
--- a/package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 40bf9c0960becaf0e592cac901466af93f24e52b Mon Sep 17 00:00:00 2001
-From: Julius Kriukas <julius@kriukas.lt>
-Date: Fri, 1 Dec 2017 18:29:24 +0200
-Subject: [PATCH] Update Makefile to be compatible with buildroot
-
-- Append to existing CFLAGS instead of overwriting.
-- Remove cross-compilation specific options from CFLAGS, they will be
-  set by buildroot.
-- Remove local ffmpeg_compiled include, buildroot will build ffmpeg
-  separately.
-- Remove hard-coded dbus, freetype, rpi-firmware include paths, they
-  will be added by buildroot.
-
-Signed-off-by: Julius Kriukas <julius@kriukas.lt>
----
- Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 5f4e414..53fa1bc 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,10 +1,10 @@
--CFLAGS=-pipe -mfloat-abi=hard -mcpu=arm1176jzf-s -fomit-frame-pointer -mabi=aapcs-linux -mtune=arm1176jzf-s -mfpu=vfp -Wno-psabi -mno-apcs-stack-check -g -mstructure-size-boundary=32 -mno-sched-prolog
-+CFLAGS+=-fomit-frame-pointer -Wno-psabi -mno-apcs-stack-check -g -mstructure-size-boundary=32 -mno-sched-prolog
- CFLAGS+=-std=c++0x -D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS -DTARGET_POSIX -DTARGET_LINUX -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CMAKE_CONFIG -D__VIDEOCORE4__ -U_FORTIFY_SOURCE -Wall -DHAVE_OMXLIB -DUSE_EXTERNAL_FFMPEG  -DHAVE_LIBAVCODEC_AVCODEC_H -DHAVE_LIBAVUTIL_OPT_H -DHAVE_LIBAVUTIL_MEM_H -DHAVE_LIBAVUTIL_AVUTIL_H -DHAVE_LIBAVFORMAT_AVFORMAT_H -DHAVE_LIBAVFILTER_AVFILTER_H -DHAVE_LIBSWRESAMPLE_SWRESAMPLE_H -DOMX -DOMX_SKIP64BIT -ftree-vectorize -DUSE_EXTERNAL_OMX -DTARGET_RASPBERRY_PI -DUSE_EXTERNAL_LIBBCM_HOST
- 
- LDFLAGS=-L$(SDKSTAGE)/opt/vc/lib/
--LDFLAGS+=-L./ -Lffmpeg_compiled/usr/local/lib/ -lc -lbrcmGLESv2 -lbrcmEGL -lbcm_host -lopenmaxil -lfreetype -lz -lasound
-+LDFLAGS+=-L./ -lc -lbrcmGLESv2 -lbrcmEGL -lbcm_host -lopenmaxil -lfreetype -lz -lasound
- 
--INCLUDES+=-I./ -Ilinux -Iffmpeg_compiled/usr/local/include/ -I /usr/include/dbus-1.0 -I /usr/lib/arm-linux-gnueabihf/dbus-1.0/include -I/usr/include/freetype2 -isystem$(SDKSTAGE)/opt/vc/include -isystem$(SDKSTAGE)/opt/vc/include/interface/vcos/pthreads
-+INCLUDES+=-I./ -Ilinux
- 
- DIST ?= omxplayer-dist
- STRIP ?= strip
--- 
-2.11.0
-
diff --git a/package/omxplayer/Config.in b/package/omxplayer/Config.in
deleted file mode 100644
index d2e4b5ace0..0000000000
--- a/package/omxplayer/Config.in
+++ /dev/null
@@ -1,36 +0,0 @@
-config BR2_PACKAGE_OMXPLAYER
-	bool "omxplayer"
-	depends on BR2_arm
-	depends on BR2_USE_MMU # dbus
-	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # ffmpeg
-	depends on BR2_INSTALL_LIBSTDCPP # boost
-	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, boost, libusb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-	depends on BR2_USE_WCHAR # boost
-	depends on BR2_PACKAGE_RPI_USERLAND
-	select BR2_PACKAGE_ALSA_LIB
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
-	select BR2_PACKAGE_FFMPEG_SWSCALE
-	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_LIBIDN
-	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_ZLIB
-	help
-	  OMXPlayer is a commandline OMX player for the Raspberry
-	  Pi. It was developed as a testbed for the XBMC Raspberry PI
-	  implementation and is quite handy to use standalone.
-
-	  https://github.com/popcornmix/omxplayer
-
-comment "omxplayer needs rpi-userland and a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.9"
-	depends on BR2_arm
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_RPI_USERLAND
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/omxplayer/omxplayer.hash b/package/omxplayer/omxplayer.hash
deleted file mode 100644
index 5826c68d70..0000000000
--- a/package/omxplayer/omxplayer.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# Locally computed:
-sha1  a9106203f822fe88eb35980479f46a555086d4a7  omxplayer-f06235cc9690a6d58187514452df8cf8fcdaacec.tar.gz
-sha256  af2d9450f8947842ea8c401fe9f71eec444013ebbdee29f2ac828c9c493c1329  omxplayer-f06235cc9690a6d58187514452df8cf8fcdaacec.tar.gz
-
-# Hash for license file:
-sha256  60e78ba9f921bb06bcf957575245414b1577c9688a63ddd73bc65f9d48fe31c9  COPYING
diff --git a/package/omxplayer/omxplayer.mk b/package/omxplayer/omxplayer.mk
deleted file mode 100644
index 072274cdfc..0000000000
--- a/package/omxplayer/omxplayer.mk
+++ /dev/null
@@ -1,39 +0,0 @@
-################################################################################
-#
-# omxplayer
-#
-################################################################################
-
-OMXPLAYER_VERSION = f06235cc9690a6d58187514452df8cf8fcdaacec
-OMXPLAYER_SITE = $(call github,popcornmix,omxplayer,$(OMXPLAYER_VERSION))
-OMXPLAYER_LICENSE = GPL-2.0+
-OMXPLAYER_LICENSE_FILES = COPYING
-
-OMXPLAYER_DEPENDENCIES = \
-	host-pkgconf alsa-lib boost dbus ffmpeg freetype libidn libusb pcre \
-	rpi-userland zlib
-
-OMXPLAYER_EXTRA_CFLAGS = \
-	-DTARGET_LINUX -DTARGET_POSIX \
-	`$(PKG_CONFIG_HOST_BINARY) --cflags bcm_host` \
-	`$(PKG_CONFIG_HOST_BINARY) --cflags freetype2` \
-	`$(PKG_CONFIG_HOST_BINARY) --cflags dbus-1`
-
-# OMXplayer has support for building in Buildroot, but that
-# procedure is, well, tainted. Fix this by forcing the real,
-# correct values.
-OMXPLAYER_MAKE_ENV = \
-	SDKSTAGE=$(STAGING_DIR) \
-	$(TARGET_CONFIGURE_OPTS) \
-	STRIP=true \
-	CFLAGS="$(TARGET_CFLAGS) $(OMXPLAYER_EXTRA_CFLAGS)"
-
-define OMXPLAYER_BUILD_CMDS
-	$(OMXPLAYER_MAKE_ENV) $(MAKE) -C $(@D) omxplayer.bin
-endef
-
-define OMXPLAYER_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/omxplayer.bin $(TARGET_DIR)/usr/bin/omxplayer
-endef
-
-$(eval $(generic-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
