Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9B7C8303F
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 08:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3032D4126B;
	Fri, 29 Aug 2025 08:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1KEqTOLUK2t; Fri, 29 Aug 2025 08:48:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 060504125B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 060504125B;
	Fri, 29 Aug 2025 08:48:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42022D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2127284095
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUhdI79L1Ii0 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 08:48:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5DB784155
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5DB784155
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5DB784155
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:48:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2E5821A0CD7
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:48:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F0E15606B9;
 Fri, 29 Aug 2025 08:48:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CCC5A1C22D9F8; 
 Fri, 29 Aug 2025 10:48:00 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Romain Naour <romain.naour@gmail.com>
Date: Fri, 29 Aug 2025 10:47:52 +0200
Message-ID: <20250829084753.1175658-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756457287; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=nN7Siq/Zv2ZGzKBiKqP5pFy2H1wl0WGf7zt/om3ASBs=;
 b=z841fQ2aKhnvPbbhQ4QWuUoZsuDsrJLF2+JY+BaKGZ6cQNy4m6RH35ad95F58zgn2SgnJe
 vPdP1OOch/D84/JKhxjPyQ8T4ng3jaFBe7DXUeCUD2d4agrwaJVpiSbSZ2IYixM2UpmVKN
 zzjvTcSyw8Q1f3J9eCsvwkhS4MB7yz9hUSHbTUaDaHEOsyr0dhqI2pj8mBWjOG2q1w/XAa
 3AF9aDLcJiZyrFZViEMGRK1DL1KDLwVGpJFvrMSwejaRPiBpz3Rh101TYuJOSHwCRgfxNo
 enCl2E+Gk83onAHGIjkrs3nztWekkZFPSRkxP2I+EqTQQy4+05iPi0hF2NYGMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=z841fQ2a
Subject: [Buildroot] [PATCH] package/openal: bump to 1.24.3 to fix GCC 15.x
 build issues
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

openal 1.22.0 does not build with GCC 15.x, but the backport of the
fixes to 1.22.0 turns out to be too complicated, so let's bump to
1.24.3 instead.

Since 1.24.3 uses C++17, and after testing with GCC 7.x, then GCC 8.x
then GCC 9.x, we found out that GCC 9.x at least is
necessary. Therefore, reverse dependencies are updated accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/alure/Config.in                       | 11 +++--------
 package/gstreamer1/gst1-plugins-bad/Config.in |  6 +++---
 package/lugaru/Config.in                      |  6 +++---
 package/minetest/Config.in                    |  8 ++++----
 package/openal/Config.in                      |  6 +++---
 package/openal/openal.hash                    |  2 +-
 package/openal/openal.mk                      |  2 +-
 package/solarus/Config.in                     |  6 +++---
 package/supertux/Config.in                    |  6 +++---
 package/supertuxkart/Config.in                |  6 +++---
 10 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/package/alure/Config.in b/package/alure/Config.in
index e0064accba..c831bba913 100644
--- a/package/alure/Config.in
+++ b/package/alure/Config.in
@@ -1,11 +1,10 @@
 config BR2_PACKAGE_ALURE
 	bool "alure"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # openal
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_USE_WCHAR # use wchar_t
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
 	select BR2_PACKAGE_OPENAL
 	help
 	  Alure is a C++ 3D audio API. It uses OpenAL for audio
@@ -50,12 +49,8 @@ config BR2_PACKAGE_ALURE_VORBIS_DECODER
 
 endif
 
-comment "alure needs a toolchain w/ C++, gcc >= 4.9, NPTL, wchar"
+comment "alure needs a toolchain w/ C++, gcc >= 9, NPTL, wchar"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
-
-comment "alure needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 89db860f87..4a78e9b694 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -520,16 +520,16 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENAL
 	bool "openal"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENAL
 
-comment "openal plugin needs a toolchain w/ NPTL, C++, gcc >= 4.9"
+comment "openal plugin needs a toolchain w/ NPTL, C++, gcc >= 9"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264
 	bool "openh264"
diff --git a/package/lugaru/Config.in b/package/lugaru/Config.in
index 4454ebcd06..904652d99b 100644
--- a/package/lugaru/Config.in
+++ b/package/lugaru/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LUGARU
 	depends on BR2_PACKAGE_HAS_LIBGL # libglu
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7 # SDL2 OpenGL (GLX)
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # openal
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_USE_MMU # SDL2 OpenGL (GLX)
 	depends on !BR2_STATIC_LIBS # SDL2
@@ -29,10 +29,10 @@ config BR2_PACKAGE_LUGARU
 
 	  https://osslugaru.gitlab.io/
 
-comment "lugaru needs X11 and a toolchain w/ C++, OpenGL backend, gcc >= 4.9, NPTL, dynamic library"
+comment "lugaru needs X11 and a toolchain w/ C++, OpenGL backend, gcc >= 9, NPTL, dynamic library"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_LIBGL || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_STATIC_LIBS
diff --git a/package/minetest/Config.in b/package/minetest/Config.in
index 4e139ac3e2..290c062bab 100644
--- a/package/minetest/Config.in
+++ b/package/minetest/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MINETEST
 	bool "minetest"
 	depends on BR2_INSTALL_LIBSTDCPP # irrlichtMt (bundled)
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_XORG7 # irrlichtMt (bundled)
 	depends on BR2_PACKAGE_HAS_LIBGL # irrlichtMt (bundled)
@@ -52,14 +52,14 @@ comment "sound support needs a toolchain w/ threads NPTL"
 
 endif
 
-comment "minetest needs a toolchain w/ C++, gcc >= 5.1, threads"
+comment "minetest needs a toolchain w/ C++, gcc >= 9, threads"
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "minetest needs X11 and an OpenGL provider"
 	depends on (BR2_INSTALL_LIBSTDCPP \
-		&& BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
+		&& BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
 		&& BR2_TOOLCHAIN_HAS_THREADS)
 	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
diff --git a/package/openal/Config.in b/package/openal/Config.in
index 6b0e9973db..648b855471 100644
--- a/package/openal/Config.in
+++ b/package/openal/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 config BR2_PACKAGE_OPENAL
 	bool "openal"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11 PR56019
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	help
@@ -27,8 +27,8 @@ config BR2_PACKAGE_OPENAL
 
 	  http://kcat.strangesoft.net/openal.html
 
-comment "openal needs a toolchain w/ NPTL, C++, gcc >= 4.9"
+comment "openal needs a toolchain w/ NPTL, C++, gcc >= 7"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index eae78b0582..ea4664c492 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  814831a8013d7365dfd1917b27f1fb6e723f3be3fe1c6a7ff4516425d8392f68  openal-1.22.0.tar.gz
+sha256  7e1fecdeb45e7f78722b776c5cf30bd33934b961d7fd2a11e0494e064cc631ce  openal-1.24.3.tar.gz
 sha256  d808ce217e5b611854da622b57ec29fe545584c48bc5352fae72a4b6e5074a15  COPYING
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 3d624139c2..d01a6f4b2f 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENAL_VERSION = 1.22.0
+OPENAL_VERSION = 1.24.3
 OPENAL_SITE = $(call github,kcat,openal-soft,$(OPENAL_VERSION))
 OPENAL_LICENSE = LGPL-2.0+
 OPENAL_LICENSE_FILES = COPYING
diff --git a/package/solarus/Config.in b/package/solarus/Config.in
index bcfa640890..b0c807faed 100644
--- a/package/solarus/Config.in
+++ b/package/solarus/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_SOLARUS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # openal
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on !BR2_STATIC_LIBS # SDL2
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
@@ -25,9 +25,9 @@ config BR2_PACKAGE_SOLARUS
 	  http://www.solarus-games.org
 	  https://github.com/solarus-games/solarus
 
-comment "solarus needs OpenGL and a toolchain w/ C++, gcc >= 4.9, NPTL, dynamic library, and luajit or lua 5.1"
+comment "solarus needs OpenGL and a toolchain w/ C++, gcc >= 9, NPTL, dynamic library, and luajit or lua 5.1"
 	depends on !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/supertux/Config.in b/package/supertux/Config.in
index e8e96a3ae5..64c1715a25 100644
--- a/package/supertux/Config.in
+++ b/package/supertux/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SUPERTUX
 	depends on BR2_PACKAGE_HAS_LIBGL # libglew
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7 # libglew, SDL2 OpenGL (GLX)
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	depends on BR2_USE_MMU # SDL2 OpenGL (GLX)
@@ -35,11 +35,11 @@ config BR2_PACKAGE_SUPERTUX
 
 	  http://supertux.github.io/
 
-comment "supertux needs OpenGL and a toolchain w/ C++, gcc >= 6, NPTL, dynamic library, wchar"
+comment "supertux needs OpenGL and a toolchain w/ C++, gcc >= 9, NPTL, dynamic library, wchar"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_LIBGL || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_6 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index 319415754a..0f6c244058 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # openal
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz, openal
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
 	depends on BR2_PACKAGE_HAS_LIBGL
@@ -33,7 +33,7 @@ config BR2_PACKAGE_SUPERTUXKART
 
 	  http://supertuxkart.sourceforge.net/Main_Page
 
-comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++, gcc >= 4.9"
+comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++, gcc >= 9"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
@@ -41,6 +41,6 @@ comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NP
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
 		|| !BR2_PACKAGE_HAS_LIBGL \
 		|| BR2_TOOLCHAIN_USES_MUSL
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
