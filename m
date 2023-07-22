Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D567EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 06:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18BE24000B;
	Sat, 22 Jul 2023 06:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18BE24000B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LK_wrrV61n-3; Sat, 22 Jul 2023 06:53:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0207040320;
	Sat, 22 Jul 2023 06:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0207040320
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FAA21BF5A7
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 06:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1920181E34
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 06:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1920181E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JbF0Taetoxt6 for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 06:53:46 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A887C81E30
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 06:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A887C81E30
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A4E69A4C066D;
 Sat, 22 Jul 2023 08:53:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33646)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qN6UZ-0007ro-1I;
 Sat, 22 Jul 2023 08:53:28 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 08:53:23 +0200
Message-Id: <20230722065324.18202-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690008808;
 bh=RRv4zyk0+7btVjVxckW5GxjYJ0PKuPB4v9LqITwC+zA=;
 h=From:To:Cc:Subject:Date:From;
 b=EZr31YvmKvDeQaKvxqVXzOXOV8Cn6nredswVcrhv73flY/6j/SWTlzqceYw1De98B
 Ls2fhsXl9BNggQMv82NGkXrOFmw38gPfI/L6ZT53iPpFHA/58DTVq7pt0oVF6Fzh7O
 Q32p/Hou423D06HHwkOEywFUqy9ryfjvPXZrzQd1GiUDa1SnBvcAcMfGCzujxkePyq
 1OXrmGGe6MnyuMFfxvukJcC9ANRWGeBpsjyx1hZQjw2EUmdLIqU/fTdylAT8im5OVL
 pP2otCefpi6ky0ZSObR0CpD4QRyni1j9lQVxelJA3dTbD2+vZP911zpePO+ZKgiQgq
 7GNdPch5jDHqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=EZr31Yvm
Subject: [Buildroot] [PATCH v3 1/2] package/onevpl: new package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: bumped version to 2023.3.1
v2: no changes

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-Don-t-force-fstack-protector.patch   | 32 ++++++++++++++
 package/onevpl/Config.in                      | 26 +++++++++++
 package/onevpl/onevpl.hash                    |  3 ++
 package/onevpl/onevpl.mk                      | 43 +++++++++++++++++++
 6 files changed, 106 insertions(+)
 create mode 100644 package/onevpl/0001-Don-t-force-fstack-protector.patch
 create mode 100644 package/onevpl/Config.in
 create mode 100644 package/onevpl/onevpl.hash
 create mode 100644 package/onevpl/onevpl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 01050ebf59..074fd9c597 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -415,6 +415,7 @@ F:	package/mjpg-streamer/
 F:	package/mpg123/
 F:	package/ntp/
 F:	package/nut/
+F:	package/onevpl/
 F:	package/opus/
 F:	package/pciutils/
 F:	package/perl-crypt-openssl-guess/
diff --git a/package/Config.in b/package/Config.in
index 601922aad5..0e18433a36 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1634,6 +1634,7 @@ menu "Graphics"
 	source "package/libvips/Config.in"
 	source "package/libwpe/Config.in"
 	source "package/menu-cache/Config.in"
+	source "package/onevpl/Config.in"
 	source "package/opencl-clhpp/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
diff --git a/package/onevpl/0001-Don-t-force-fstack-protector.patch b/package/onevpl/0001-Don-t-force-fstack-protector.patch
new file mode 100644
index 0000000000..14948e28cc
--- /dev/null
+++ b/package/onevpl/0001-Don-t-force-fstack-protector.patch
@@ -0,0 +1,32 @@
+From 682a9eabc71c2e33ebbbba2e75d0ba7caa08c7c8 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 8 May 2023 20:03:22 +0200
+Subject: [PATCH] Don't force -fstack-protector
+
+This allows the environment to decide whether SSP should be used or
+not, for example to support toolchains that don't have SSP support.
+
+Upstream: Not applicable
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ cmake/CompileOptions.cmake | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/cmake/CompileOptions.cmake b/cmake/CompileOptions.cmake
+index 9923f1c..5b24622 100644
+--- a/cmake/CompileOptions.cmake
++++ b/cmake/CompileOptions.cmake
+@@ -54,9 +54,6 @@ else()
+       add_definitions("-D_FORTIFY_SOURCE=2")
+     endif()
+   endif()
+-  if(NOT MINGW)
+-    add_compile_options("-fstack-protector-strong")
+-  endif()
+   if(NOT MINGW)
+     add_link_options("-Wl,-z,relro,-z,now,-z,noexecstack")
+   endif()
+-- 
+2.39.2
+
diff --git a/package/onevpl/Config.in b/package/onevpl/Config.in
new file mode 100644
index 0000000000..65a34185e3
--- /dev/null
+++ b/package/onevpl/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
+	bool
+	default y if BR2_ARCH_IS_64
+	default y if BR2_arm
+
+config BR2_PACKAGE_ONEVPL
+	bool "onevpl"
+	depends on BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_LIBDRM_INTEL if BR2_PACKAGE_LIBVA
+	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	help
+	  oneAPI Video Processing Library (oneVPL) dispatcher,
+	  tools, and examples
+
+	  https://github.com/oneapi-src/oneVPL
+
+comment "onevpl needs a toolchain w/ dynamic library, gcc >= 7, C++, threads"
+	depends on BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/onevpl/onevpl.hash b/package/onevpl/onevpl.hash
new file mode 100644
index 0000000000..c9ca1e6c04
--- /dev/null
+++ b/package/onevpl/onevpl.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  4411543519486a2450f6f5af06a077596e7888a551768594e9dfa2a46b23b6f5  onevpl-2023.3.1.tar.gz
+sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/onevpl/onevpl.mk b/package/onevpl/onevpl.mk
new file mode 100644
index 0000000000..2033f755c0
--- /dev/null
+++ b/package/onevpl/onevpl.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# onevpl
+#
+################################################################################
+
+ONEVPL_VERSION = 2023.3.1
+ONEVPL_SITE = $(call github,oneapi-src,oneVPL,v$(ONEVPL_VERSION))
+ONEVPL_LICENSE = MIT
+ONEVPL_LICENSE_FILES = LICENSE
+ONEVPL_INSTALL_STAGING = YES
+ONEVPL_DEPENDENCIES = host-pkgconf
+
+ONEVPL_CONF_OPTS = \
+	-DINSTALL_EXAMPLE_CODE=OFF
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+ONEVPL_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="-latomic"
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+ONEVPL_CONF_OPTS += -DENABLE_VA=ON
+ONEVPL_DEPENDENCIES += libva
+else
+ONEVPL_CONF_OPTS += -DENABLE_VA=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+ONEVPL_CONF_OPTS += -DENABLE_WAYLAND=ON
+ONEVPL_DEPENDENCIES += wayland wayland-protocols
+else
+ONEVPL_CONF_OPTS += -DENABLE_WAYLAND=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+ONEVPL_CONF_OPTS += -DENABLE_X11=ON
+ONEVPL_DEPENDENCIES += libxcb xlib_libX11
+else
+ONEVPL_CONF_OPTS += -DENABLE_X11=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
