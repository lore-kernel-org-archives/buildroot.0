Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D33CCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 14:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D26F440F13;
	Fri,  3 Oct 2025 14:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKzVaQ1RrEAY; Fri,  3 Oct 2025 14:30:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B974240F0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B974240F0E;
	Fri,  3 Oct 2025 14:30:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1242213D
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 14:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC2038195C
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 14:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXIYYkLilaM4 for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 14:30:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 504EA812BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 504EA812BD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 504EA812BD
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 14:30:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc8f.dip0.t-ipconnect.de [79.214.204.143])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EFE18A4C5D05;
 Fri,  3 Oct 2025 16:30:44 +0200 (CEST)
Received: from [192.168.1.144] (port=36342 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4go0-00000000316-1kp3;
 Fri, 03 Oct 2025 14:30:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>,
 Sen Hastings <sen@hastings.org>
Date: Fri,  3 Oct 2025 16:30:42 +0200
Message-ID: <20251003143043.641856-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759501845;
 bh=t0aMCg1CCC/9F+L/9WSqVByk58oS58qw0Yhdqk5Xckc=;
 h=From:To:Cc:Subject:Date:From;
 b=rZqNioJVtOqoxqPHCvXq3P5+PaihjSLSPPM9Bia2chRkoPQc937ld7ks6Wn3vlREf
 SVtJZOOOXRqdgJ09gu4sKDoGjMvgxYrZcDjstUYd+YDZEwZZOQMXOsGrdPoE30QScI
 AkBopwIfo2n/OJp/NuywTnS3xpX4RM9CZ439+c/5pWp2MfWpzal5OKm/l5Xb5JPj8T
 ax7PniuuvzP5TtRjYh11sJH3uGVPWChVkqBGTko6iGf5pwurum4GVCDasXkYHv2a3i
 ApROeW09pb6M3/zGZj8KgJvKgtFV3Q+Iyn49Ns2TmJzQH2ida6BmTtBF2UELBwW3OS
 3Ls8yGasjNY4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=rZqNioJV
Subject: [Buildroot] [PATCH 1/2] package/libplacebo: add libplacebo package
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

From: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>

This patch adds libplacebo package that is used
by mpv player.
libplacebo is the core rendering algorithms and
ideas of mpv rewritten as an independent library
and contains a large assortment of video processing
shaders, focusing on both quality and performance.

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Tested-by: Sen Hastings <sen@hastings.org>
[Bernd:
- bumped to v7.351.0
- moved Kconfig option to Multimedia (Sen)
- rebased patch 0001 after version bump
- added project URL to Config.in helptext
- removed redundancy in Config.in comment
- added comment to hash file
- switched _SITE to official repo
- added patch to fix build error with latest python3]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...ild-fix-linker-error-in-uclibc-sparc.patch | 45 +++++++++++++++++++
 ...h-add-static_assert-define-for-ulibc.patch | 36 +++++++++++++++
 ...vulkan-utils_gen-fix-for-python-3.14.patch | 31 +++++++++++++
 package/libplacebo/Config.in                  | 20 +++++++++
 package/libplacebo/libplacebo.hash            |  3 ++
 package/libplacebo/libplacebo.mk              | 15 +++++++
 8 files changed, 152 insertions(+)
 create mode 100644 package/libplacebo/0001-meson.build-fix-linker-error-in-uclibc-sparc.patch
 create mode 100644 package/libplacebo/0002-src-pl_assert.h-add-static_assert-define-for-ulibc.patch
 create mode 100644 package/libplacebo/0003-vulkan-utils_gen-fix-for-python-3.14.patch
 create mode 100644 package/libplacebo/Config.in
 create mode 100644 package/libplacebo/libplacebo.hash
 create mode 100644 package/libplacebo/libplacebo.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c2c867263a..b4bcda651c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -428,6 +428,7 @@ F:	package/libnpth/
 F:	package/libogg/
 F:	package/libopenh264/
 F:	package/libpciaccess/
+F:	package/libplacebo/
 F:	package/libplatform/
 F:	package/libpng/
 F:	package/libsidplay2/
diff --git a/package/Config.in b/package/Config.in
index acc1c8258b..a88f254be5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1993,6 +1993,7 @@ menu "Multimedia"
 	source "package/libopenaptx/Config.in"
 	source "package/libopenh264/Config.in"
 	source "package/libopusenc/Config.in"
+	source "package/libplacebo/Config.in"
 	source "package/libtheora/Config.in"
 	source "package/libudfread/Config.in"
 	source "package/libvpx/Config.in"
diff --git a/package/libplacebo/0001-meson.build-fix-linker-error-in-uclibc-sparc.patch b/package/libplacebo/0001-meson.build-fix-linker-error-in-uclibc-sparc.patch
new file mode 100644
index 0000000000..795a1ae3e5
--- /dev/null
+++ b/package/libplacebo/0001-meson.build-fix-linker-error-in-uclibc-sparc.patch
@@ -0,0 +1,45 @@
+From 4386f3e3b3d02c55776e3f674d8447fd24388c2c Mon Sep 17 00:00:00 2001
+From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
+Date: Fri, 19 Jul 2024 07:02:48 +0200
+Subject: [PATCH] meson.build: add libatomic dependency if needed
+
+This PR fixes the problem related to not finding the libatomic during the
+build. Some combinations or architecture and libc (e.g. uClibc on SPARC)
+operations in a separate library and don't link with it automatically.
+An optional find_library to meson.build has been added to 
+discover this.
+
+
+Fixes:
+ - https://github.com/haasn/libplacebo/issues/278
+
+Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
+Upstream: https://github.com/haasn/libplacebo/commit/4386f3e3b3d02c55776e3f674d8447fd24388c2c
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index a73e49ff..f8cbf9f1 100644
+--- a/meson.build
++++ b/meson.build
+@@ -450,6 +450,7 @@ add_project_link_arguments(link_args, language: ['c', 'cpp'])
+ # Global dependencies
+ fs = import('fs')
+ libm = cc.find_library('m', required: false)
++atomic = cc.find_library('atomic', required: false)
+ thirdparty = meson.project_source_root()/'3rdparty'
+ python = import('python').find_installation()
+ python_env = environment()
+@@ -475,7 +476,7 @@ else
+     )
+ endif
+ 
+-build_deps = [ libm, threads ]
++build_deps = [ libm, threads, atomic]
+ 
+ subdir('tools')
+ subdir('src')
+-- 
+2.45.2
+
diff --git a/package/libplacebo/0002-src-pl_assert.h-add-static_assert-define-for-ulibc.patch b/package/libplacebo/0002-src-pl_assert.h-add-static_assert-define-for-ulibc.patch
new file mode 100644
index 0000000000..6960c2f219
--- /dev/null
+++ b/package/libplacebo/0002-src-pl_assert.h-add-static_assert-define-for-ulibc.patch
@@ -0,0 +1,36 @@
+From 0182e2b94bbc6bb964f96527d18e93c9b4709a3a Mon Sep 17 00:00:00 2001
+From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
+Date: Fri, 19 Jul 2024 07:57:45 +0200
+Subject: [PATCH] src/pl_assert.h:add static_assert define for ulibc
+
+This PR adds the static_assert macro defination for uClibc that is
+missed in some platforms. However, it is limited to C versions lower
+than C23. From C23, static_assert is not defined as macro anymore:
+https://en.cppreference.com/w/c/language/_Static_assert
+
+Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
+Upstream: https://github.com/haasn/libplacebo/commit/0182e2b94bbc6bb964f96527d18e93c9b4709a3a
+---
+ src/pl_assert.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/pl_assert.h b/src/pl_assert.h
+index b4c6656c..de9d3547 100644
+--- a/src/pl_assert.h
++++ b/src/pl_assert.h
+@@ -20,6 +20,12 @@
+ #include <stdio.h>
+ #include <assert.h>
+ 
++#if !defined (__cplusplus)
++#if (__STDC_VERSION__ < 202301L)
++#define static_assert _Static_assert
++#endif
++#endif
++
+ #ifndef NDEBUG
+ # define pl_assert assert
+ #else
+-- 
+2.45.2
+
diff --git a/package/libplacebo/0003-vulkan-utils_gen-fix-for-python-3.14.patch b/package/libplacebo/0003-vulkan-utils_gen-fix-for-python-3.14.patch
new file mode 100644
index 0000000000..86f7c00856
--- /dev/null
+++ b/package/libplacebo/0003-vulkan-utils_gen-fix-for-python-3.14.patch
@@ -0,0 +1,31 @@
+From a22f0dff5fe89385155743a1735b146babfdb131 Mon Sep 17 00:00:00 2001
+From: Nicolas Chauvet <kwizart@gmail.com>
+Date: Tue, 29 Jul 2025 11:42:35 +0200
+Subject: [PATCH] vulkan/utils_gen: fix for python 3.14
+
+Python 3.14+ has added more type checking. This patch fixes usage
+
+Fixes: https://github.com/haasn/libplacebo/issues/335
+
+Upstream: https://code.videolan.org/videolan/libplacebo/-/commit/12509c0f1ee8c22ae163017f0a5e7b8a9d983a17
+
+Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/vulkan/utils_gen.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/vulkan/utils_gen.py b/src/vulkan/utils_gen.py
+index 9a97d35f..9b803d82 100644
+--- a/src/vulkan/utils_gen.py
++++ b/src/vulkan/utils_gen.py
+@@ -202,7 +202,8 @@ def find_registry_xml(datadir):
+     if not xmlfile or xmlfile == '':
+         xmlfile = find_registry_xml(datadir)
+ 
+-    registry = VkXML(ET.parse(xmlfile))
++    tree = ET.parse(xmlfile)
++    registry = VkXML(tree.getroot())
+     with open(outfile, 'w') as f:
+         f.write(TEMPLATE.render(
+             vkresults = get_vkenum(registry, 'VkResult'),
diff --git a/package/libplacebo/Config.in b/package/libplacebo/Config.in
new file mode 100644
index 0000000000..739de5c05c
--- /dev/null
+++ b/package/libplacebo/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBPLACEBO
+	bool "libplacebo"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_STATIC_LIBS # needs <dlfcn.h>
+	help
+	  libplacebo is, in a nutshell, the core rendering
+	  algorithms and ideas of mpv rewritten as an
+	  independent library. As of today, libplacebo
+	  contains a large assortment of video processing
+	  shaders, focusing on both quality and performance.
+
+	  https://libplacebo.org
+
+comment "libplacebo needs a toolchain w/ dynamic library, threads, gcc >= 10"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/libplacebo/libplacebo.hash b/package/libplacebo/libplacebo.hash
new file mode 100644
index 0000000000..302afcca16
--- /dev/null
+++ b/package/libplacebo/libplacebo.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  46b501842e5b18867c6b7dd5c901e65ad6396608ad76309c366d8ace8be0d0d7  libplacebo-v7.351.0-git4.tar.gz
+sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  LICENSE
diff --git a/package/libplacebo/libplacebo.mk b/package/libplacebo/libplacebo.mk
new file mode 100644
index 0000000000..67bf0f00fb
--- /dev/null
+++ b/package/libplacebo/libplacebo.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libplacebo
+#
+################################################################################
+
+LIBPLACEBO_VERSION = v7.351.0
+LIBPLACEBO_SITE = https://code.videolan.org/videolan/libplacebo.git
+LIBPLACEBO_SITE_METHOD = git
+LIBPLACEBO_GIT_SUBMODULES = YES
+LIBPLACEBO_LICENSE = LGPL-2.1
+LIBPLACEBO_LICENSE_FILES = LICENSE
+LIBPLACEBO_INSTALL_STAGING = YES
+
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
