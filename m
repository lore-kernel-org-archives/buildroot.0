Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC87EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 23:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 589594049D;
	Thu, 20 Jul 2023 23:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 589594049D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lowJInlDIZoV; Thu, 20 Jul 2023 23:37:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 596304174F;
	Thu, 20 Jul 2023 23:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 596304174F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9D7B1BF39A
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 23:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 905C181E15
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 23:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 905C181E15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oFJFKJKignC9 for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 23:36:55 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB123820C8
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 23:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB123820C8
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1b8c81e36c0so9149125ad.0
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 16:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689896215; x=1690501015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oS+RXRA6cKBvuM0sETTDaagUL/kRLHKPaZlwF1rdMXY=;
 b=SpZ1XbqLH9LpbFaR0sHJGJ8ysC34l9THskj4z/OO8pG73GapmbACCLcI1sSwcDCy8G
 FM8xqVISwcKG9my9nmWBaA7L6kXOXWzAnPzzbAKMrPo79Bulv8t4QXlgLX0kz8r6OXw1
 AJ005iUoM/UQqtn+3uz7/BMkxJC8jh5eY7nRqeJggGgfQwtStuW41qJQXCczZJTKAmsj
 BtalYh/WJLWL6DkIZhP6dWfAX7sZ6h96vLYiU7fXInc8kBksLUeoD+XNlDoi7jdZN2Cu
 L/w0cx4ill7lbZAbcyRvDsnFsBalquc9QcwCtjyfDG2W2pCwEIdokfI5Iagcilw6cSyj
 oc+g==
X-Gm-Message-State: ABy/qLYqajUfoiN0EOWxT1Qclrg4V4X/LL369Wy3ehmxOLgK65j0Tgxu
 tTZlWqohba/XiSYjT/Mu06gTCKomt1zuWhjOcCR7wA==
X-Google-Smtp-Source: APBJJlED3T3Itu4moXcJe20XD4jMkI7zFvYVpjlEVcd96hWdMmRR2oklQWkTK57v1EKsSdZNN0hisA==
X-Received: by 2002:a17:903:4285:b0:1b8:987f:39c0 with SMTP id
 ju5-20020a170903428500b001b8987f39c0mr364174plb.28.1689896214467; 
 Thu, 20 Jul 2023 16:36:54 -0700 (PDT)
Received: from fedora.amarulasolutions.com ([2601:603:217f:25e0::99d])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a170902cec300b001b89b7e208fsm1981790plg.88.2023.07.20.16.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 16:36:54 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 16:36:29 -0700
Message-ID: <20230720233629.1642220-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720233629.1642220-1-adam.duskett@amarulasolutions.com>
References: <20230720233629.1642220-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1689896215; x=1690501015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oS+RXRA6cKBvuM0sETTDaagUL/kRLHKPaZlwF1rdMXY=;
 b=cCiTCoPz77G1XK4rBOVYjskhz0ZsxKei7EVk6bTj/9GRu+VHpLRSHZk/8jUog3vWST
 Xf4u1vuf7P+CR7Ijl+IA0UIcPwXZ0yj28ivGy5ii6e5VkoE9fVRhGuy8+oi05Xsb7mCq
 6nTmQaCec2unWplsVwFvrO0lrAh3DNXhKA8iQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=cCiTCoPz
Subject: [Buildroot] [PATCH vRFC 3/3] package/flutter-engine: new package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There are many issues with this package:

- The release tarballs from https://github.com/flutter/engine are in no state
  to compile. They are only for the use of gclient to download a source
  directory structure suitable to build the Flutter engine! If you download,
  extract and attempt to run `./tools/gn --no-goma --no-prebuilt-dart-sdk`, you
  receive the error message:
  `No such file or directory: 'flutter/flutter/third_party/gn/gn.'

  But wait! Wasn't the gn binary just called? No, that's a wrapper in the
  Flutter source tree that formats arguments to call the real gn binary.
  The real gn is not provided in the tarball but is downloaded via gclient
  (among many other supporting repositories.)

  Even worse, the flutter repository depends on the .git dirs being present.
  (https://github.com/meta-flutter/meta-flutter/issues/271) This dependency
  means it is not possible to create a reproducible tarball from the downloaded
  sources, which is why there is no .hash file provided.

  I have asked the flutter project to release full tarballs suitable for
  compiling here: https://github.com/flutter/flutter/issues/130734

- The clang toolchain wrapper does not work properly, resulting in the immediate
  errors of:
    -Wl,-z,now: 'linker' input unused
    -Wl,-z,relro: 'linker' input unused
  The solution is to use clang.br_real and clang++.br_real.

- If using per_package builds, flutter-engine tries to use the host /usr/bin/ld
  instead of the one provided by the compiler, resulting in linking errors.
  As such, if BR2_PER_PACKAGE_DIRECTORIES is enabled, we search for the ld
  provided by the compiler in the host directory and set the path accordingly.

- libtessellator.so (built by flutter) requires three files:
  crtbeginS.o crtendS.o libgcc.a. However, the toolchain path isn't referenced
  when linking. The solution is to copy those three files to the staging lib
  directory before building.

Tested with:
  - Debian 11 and 12
  - Ubuntu 18.04, 20.04, and 22.04
  - Fedora 38
  - Per package directory enabled and disabled
  - x86_64, arm64

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 .../0001-disable-pre-canned-sysroot.patch     |  32 ++
 .../0002-remove-explicit-x11-dependency.patch |  33 ++
 .../0003-disable-undefined-version.patch      |  32 ++
 ...onfig.py-do-not-prepend-sysroot-path.patch |  34 +++
 package/flutter-engine/Config.in              |  93 ++++++
 package/flutter-engine/flutter-engine.mk      | 286 ++++++++++++++++++
 package/flutter-engine/gclient                |  16 +
 9 files changed, 528 insertions(+)
 create mode 100644 package/flutter-engine/0001-disable-pre-canned-sysroot.patch
 create mode 100644 package/flutter-engine/0002-remove-explicit-x11-dependency.patch
 create mode 100644 package/flutter-engine/0003-disable-undefined-version.patch
 create mode 100644 package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
 create mode 100644 package/flutter-engine/Config.in
 create mode 100644 package/flutter-engine/flutter-engine.mk
 create mode 100644 package/flutter-engine/gclient

diff --git a/DEVELOPERS b/DEVELOPERS
index 38db2dd345..603bebca1c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -28,6 +28,7 @@
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools
+F:	package/flutter-engine
 
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
diff --git a/package/Config.in b/package/Config.in
index 601922aad5..8c36fe486f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -342,6 +342,7 @@ comment "Graphic libraries"
 	source "package/fbset/Config.in"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
+	source "package/flutter-engine/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
diff --git a/package/flutter-engine/0001-disable-pre-canned-sysroot.patch b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
new file mode 100644
index 0000000000..c4064a77c9
--- /dev/null
+++ b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
@@ -0,0 +1,32 @@
+From 49a14e693124dc34f2cccbfb755d01a1198aa6bf Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Wed, 19 Jul 2023 15:24:22 -0700
+Subject: [PATCH] disable pre-canned sysroot
+
+Override should be enabled if a custom sysroot using --target-sysroot is
+specified. If --target-sysroot is not set, then it should default to the
+pre-canned sysroot.
+
+Upstream: https://github.com/flutter/flutter/issues/123073
+Signed-off-by: Joel Winarske <joel.winarsk@gmail.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ build/config/sysroot.gni | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/config/sysroot.gni b/build/config/sysroot.gni
+index 7987e519d..1de694263 100644
+--- a/build/config/sysroot.gni
++++ b/build/config/sysroot.gni
+@@ -14,7 +14,7 @@ declare_args() {
+ 
+   # Whether to use the default sysroot when building for Linux, if an explicit
+   # sysroot isn't set.
+-  use_default_linux_sysroot = true
++  use_default_linux_sysroot = false
+ }
+ 
+ if (current_toolchain == default_toolchain && target_sysroot != "") {
+-- 
+2.41.0
+
diff --git a/package/flutter-engine/0002-remove-explicit-x11-dependency.patch b/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
new file mode 100644
index 0000000000..1345d4a3dd
--- /dev/null
+++ b/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
@@ -0,0 +1,33 @@
+From b1a5db9318ca33a03f2700758d5debad907d21b6 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Wed, 19 Jul 2023 15:26:40 -0700
+Subject: [PATCH] remove explicit x11 dependency
+
+This is redundant, as the gtk pkg-config query will reference x11 if that's how
+it was built.
+
+Upstream: https://github.com/flutter/flutter/issues/123073
+Signed-off-by: Joel Winarske <joel.winarske@gmail.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ flutter/shell/platform/linux/config/BUILD.gn | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/flutter/shell/platform/linux/config/BUILD.gn b/flutter/shell/platform/linux/config/BUILD.gn
+index da0ac056b..70c7a0ea1 100644
+--- a/flutter/shell/platform/linux/config/BUILD.gn
++++ b/flutter/shell/platform/linux/config/BUILD.gn
+@@ -5,10 +5,6 @@
+ import("//build/config/linux/pkg_config.gni")
+ import("//flutter/shell/platform/glfw/config.gni")
+ 
+-pkg_config("x11") {
+-  packages = [ "x11" ]
+-}
+-
+ pkg_config("gtk") {
+   packages = [ "gtk+-3.0" ]
+ }
+-- 
+2.41.0
+
diff --git a/package/flutter-engine/0003-disable-undefined-version.patch b/package/flutter-engine/0003-disable-undefined-version.patch
new file mode 100644
index 0000000000..468ec4daf9
--- /dev/null
+++ b/package/flutter-engine/0003-disable-undefined-version.patch
@@ -0,0 +1,32 @@
+From 9512040259f3970dd5ca08fd9ebcfd42e7539997 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Tue, 18 Jul 2023 15:21:51 -0700
+Subject: [PATCH] Disable undefined-version
+
+This isn't a valid flag for ld, and flutter compiles just fine with the
+no-undefined-version flag.
+
+Upstream: Buildroot specific
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ build/config/compiler/BUILD.gn | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/build/config/compiler/BUILD.gn b/build/config/compiler/BUILD.gn
+index 4c9a1ee2b..53fe4a3d5 100644
+--- a/build/config/compiler/BUILD.gn
++++ b/build/config/compiler/BUILD.gn
+@@ -354,8 +354,8 @@ config("compiler") {
+ 
+   # TODO(crbug.com/1374347): Cleanup undefined symbol errors caught by
+   # --no-undefined-version.
+-  if (is_clang && !is_win && !is_mac && !is_ios && !is_wasm) {
+-    ldflags += [ "-Wl,--undefined-version" ]
++  if (!is_clang && !is_win && !is_mac && !is_ios && !is_wasm) {
++    ldflags += [ "-Wl,--no-undefined-version" ]
+   }
+ 
+   # C++ compiler flags setup.
+-- 
+2.41.0
+
diff --git a/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch b/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
new file mode 100644
index 0000000000..94da49fdf8
--- /dev/null
+++ b/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
@@ -0,0 +1,34 @@
+From 51e8fed854fd9d373bb9b20d7ed8e7cf6ef12312 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Wed, 19 Jul 2023 11:48:59 -0700
+Subject: [PATCH] pkg-config.py: do not prepend sysroot path
+
+The pkg-config script provided by Buildroot already includes the sysroot
+path, causing the pkg-config.py script to double prepend the sysroot path.
+
+IE: output/host/.../sysroot/output/host/.../sysroot
+
+Upstream: Buildroot specific
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ build/config/linux/pkg-config.py | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/build/config/linux/pkg-config.py b/build/config/linux/pkg-config.py
+index b4a6aff17..44ffdcaea 100644
+--- a/build/config/linux/pkg-config.py
++++ b/build/config/linux/pkg-config.py
+@@ -207,9 +207,7 @@ def main():
+   all_flags = flag_string.strip().split(' ')
+ 
+ 
+-  sysroot = options.sysroot
+-  if not sysroot:
+-    sysroot = ''
++  sysroot = ''
+ 
+   includes = []
+   cflags = []
+-- 
+2.41.0
+
diff --git a/package/flutter-engine/Config.in b/package/flutter-engine/Config.in
new file mode 100644
index 0000000000..fe72191e77
--- /dev/null
+++ b/package/flutter-engine/Config.in
@@ -0,0 +1,93 @@
+config BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
+	default y if BR2_i386
+	default y if BR2_x86_64
+
+config BR2_PACKAGE_FLUTTER_ENGINE
+	bool "flutter-engine"
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthreads
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # std::wstring
+	depends on BR2_HOST_GCC_AT_LEAST_5
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HOST_DEPOT_TOOLS
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_ZLIB
+	help
+	  Flutter is Google's SDK for crafting beautiful, fast user
+	  experience for mobile, web, and desktop from a single
+	  codebase. Flutter works with existing code, is used by
+	  developers and organizations around the world, and is
+	  free and open source.
+
+	  The Flutter Engine is a portable runtime for hosting
+	  Flutter applications. It implements Flutter's core
+	  libraries, including animation and graphics, file and
+	  network I/O, accessibility support, plugin architecture,
+	  and a Dart runtime and compile toolchain. Most developers
+	  will interact with Flutter via the Flutter Framework,
+	  which provides a modern, reactive framework, and a rich
+	  set of platform, layout and foundation widgets.
+
+	  https://github.com/flutter/engine
+
+if BR2_PACKAGE_FLUTTER_ENGINE
+
+choice
+	prompt "Runtime mode"
+	default BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_RELEASE
+	help
+	  Select the runtime mode.
+
+config BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_RELEASE
+	bool "release"
+	help
+	  This build mode is ideal for developers who are looking to
+	  release a high-performance, production-ready application.
+
+config BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_PROFILE
+	bool "profile"
+	help
+	  Profile mode is used for performance profiling and
+	  optimization. This build mode is similar to the development
+	  mode, but it includes more aggressive inlining and
+	  optimization.
+
+config BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_DEBUG
+	bool "debug"
+	help
+	  Includes additional error checking to catch errors at
+	  runtime. This build mode is ideal for developers who are
+	  in the process of writing and testing their applications.
+
+endchoice
+
+config BR2_PACKAGE_FLUTTER_ENGINE_ARTIFACTS
+	bool "build the development artifacts"
+	help
+	  Build the development artifacts used for compiling
+	  flutter applications. This significantly increases the time
+	  to compile.
+
+endif #if BR2_PACKAGE_FLUTTER_ENGINE
+
+comment "flutter-engine needs an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
+
+comment "flutter-engine needs a glibc toolchain w/ wchar, C++, gcc >= 5, dynamic library, host gcc >= 5, NPTL"
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARM_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
+		|| !BR2_HOST_GCC_AT_LEAST_5
+
+comment "flutter-engine needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
new file mode 100644
index 0000000000..aa392a31d8
--- /dev/null
+++ b/package/flutter-engine/flutter-engine.mk
@@ -0,0 +1,286 @@
+################################################################################
+#
+# flutter-engine
+#
+################################################################################
+
+# Flutter-engine has a release on the GitHub page. However, that release is
+# only for Google. Its intended purpose is for the gclient tool provided by
+# Google in their depot-tools package. To use the source code, we must use
+# gclient to download the flutter-engine source code along with several other
+# projects. Unfortunately, the Buildroot download system does not have the
+# capability of using gclient, and considering this package is the only
+# package that uses gclient, we side-step the entire download process and
+# perform the following steps if a tarball does not exist already:
+#
+#  - Copy the pre-made gclient config file to a temporary download
+#    directory.
+#  - Run gclient sync to generate a source directory with the proper
+#    flutter-engine source code in the correct places.
+#  - Run mk_tar_gz to create a tarball.
+#  - Copy the tarball to $(FLUTTER_ENGINE_DL_DIR)
+#    directory to create a reproducible tarball.
+#
+# There is no hash provided, as the gn binary (used for configuration) relies
+# on the .git directories, so there is no way to make reproducible tarballs.
+FLUTTER_ENGINE_VERSION = 3.10.6
+
+# There is nothing for Buildroot to download. This is handled by gclient.
+FLUTTER_ENGINE_SITE =
+FLUTTER_ENGINE_SOURCE =
+FLUTTER_ENGINE_LICENSE = BSD-3-Clause
+FLUTTER_ENGINE_LICENSE_FILES = LICENSE
+FLUTTER_ENGINE_TARBALL_PATH = $(FLUTTER_ENGINE_DL_DIR)/flutter-$(FLUTTER_ENGINE_VERSION).tar.gz
+FLUTTER_ENGINE_INSTALL_STAGING = YES
+FLUTTER_ENGINE_DOWNLOAD_DEPENDENCIES = host-depot-tools
+FLUTTER_ENGINE_DEPENDENCIES = \
+	host-clang \
+	host-ninja \
+	host-pkgconf \
+	freetype \
+	zlib
+
+# Dispatch all architectures of flutter
+ifeq ($(BR2_i386),y)
+FLUTTER_ENGINE_TARGET_ARCH = x86
+FLUTTER_ENGINE_TARGET_TRIPPLE = x86-linux
+else ifeq ($(BR2_x86_64),y)
+FLUTTER_ENGINE_TARGET_ARCH = x64
+FLUTTER_ENGINE_TARGET_TRIPPLE = x86_64-linux
+else ifeq ($(BR2_arm)$(BR2_armeb),y)
+FLUTTER_ENGINE_TARGET_ARCH = arm
+FLUTTER_ENGINE_TARGET_TRIPPLE = arm-linux
+else ifeq ($(BR2_aarch64),y)
+FLUTTER_ENGINE_TARGET_ARCH = arm64
+FLUTTER_ENGINE_TARGET_TRIPPLE = aarch64-linux
+endif
+
+ifeq ($(BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_RELEASE),y)
+FLUTTER_ENGINE_RUNTIME_MODE=release
+else ifeq ($(BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_PROFILE),y)
+FLUTTER_ENGINE_RUNTIME=profile
+else
+FLUTTER_ENGINE_RUNTIME=debug
+endif
+
+FLUTTER_ENGINE_BUILD_DIR = \
+	$(@D)/out/linux_$(FLUTTER_ENGINE_RUNTIME_MODE)_$(FLUTTER_ENGINE_TARGET_ARCH)
+
+FLUTTER_ENGINE_INSTALL_FILES = libflutter_engine.so libflutter_linux_gtk.so
+
+FLUTTER_ENGINE_CONF_OPTS = \
+	--clang \
+	--depot-tools $(HOST_DIR)/share/depot_tools \
+	--embedder-for-target \
+	--linux-cpu $(FLUTTER_ENGINE_TARGET_ARCH) \
+	--no-build-embedder-examples \
+	--no-clang-static-analyzer \
+	--no-enable-unittests \
+	--no-goma \
+	--no-prebuilt-dart-sdk \
+	--runtime-mode $(FLUTTER_ENGINE_RUNTIME_MODE) \
+	--target-os linux \
+	--target-sysroot $(STAGING_DIR) \
+	--target-toolchain $(HOST_DIR) \
+	--target-triple $(FLUTTER_ENGINE_TARGET_TRIPPLE)
+
+ifeq ($(BR2_arm)$(BR2_armeb),y)
+FLUTTER_ENGINE_CONF_OPTS += \
+	--arm-float-abi $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+endif
+
+ifeq ($(BR2_PACKAGE_FLUTTER_ENGINE_ARTIFACTS),y)
+FLUTTER_ENGINE_CONF_OPTS += --build-engine-artifacts
+else
+FLUTTER_ENGINE_CONF_OPTS += --no-build-engine-artifacts
+endif
+
+ifeq ($(BR2_OPTIMIZE_0),y)
+FLUTTER_ENGINE_CONF_OPTS += --unoptimized
+endif
+
+ifeq ($(BR2_ENABLE_LTO),y)
+FLUTTER_ENGINE_CONF_OPTS += --lto
+else
+FLUTTER_ENGINE_CONF_OPTS += --no-lto
+endif
+
+ifeq ($(BR2_STRIP_strip),y)
+FLUTTER_ENGINE_CONF_OPTS += --stripped
+else
+FLUTTER_ENGINE_CONF_OPTS += --no-stripped
+endif
+
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+FLUTTER_ENGINE_DEPENDENCIES += fontconfig
+FLUTTER_ENGINE_CONF_OPTS += --enable-fontconfig
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+FLUTTER_ENGINE_DEPENDENCIES += libgl
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+FLUTTER_ENGINE_DEPENDENCIES += libgles
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D),y)
+FLUTTER_ENGINE_DEPENDENCIES += mesa3d
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
+FLUTTER_ENGINE_CONF_OPTS += --enable-vulkan
+endif
+
+ifneq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_LIBXCB),yy)
+define FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
+	$(SED) "s%vulkan_use_x11.*%vulkan_use_x11 = false%g" -i \
+		$(@D)/build_overrides/vulkan_headers.gni
+endef
+FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
+else
+FLUTTER_ENGINE_DEPENDENCIES += libxcb
+endif
+
+ifneq ($(BR2_PACKAGE_WAYLAND),y)
+define FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
+	$(SED) "s%vulkan_use_wayland.*%vulkan_use_wayland = false%g" \
+		$(@D)/build_overrides/vulkan_headers.gni
+endef
+FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
+else
+FLUTTER_ENGINE_DEPENDENCIES += wayland
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+FLUTTER_ENGINE_DEPENDENCIES += libgtk3
+else
+FLUTTER_ENGINE_CONF_OPTS += --disable-desktop-embeddings
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLFW),y)
+FLUTTER_ENGINE_DEPENDENCIES += libglfw
+FLUTTER_ENGINE_CONF_OPTS += --build-glfw-shell
+else
+FLUTTER_ENGINE_CONF_OPTS += --no-build-glfw-shell
+endif
+
+# The clang toolchain wrapper causes a lot of the following errors:
+# error: -Wl,-z,now: 'linker' input unused [-Werror,-Wunused-command-line-argument]
+# error: -Wl,-z,relro: 'linker' input unused [-Werror,-Wunused-command-line-argument]
+# Excplicitly use the real clang binaries for cc and cxx.
+ifeq ($(BR2_CCACHE),y)
+define FLUTTER_ENGINE_COMPILER_PATH_FIXUP
+	$(SED) "s%cc =.*%cc = \"\$${toolchain_bin}/ccache clang.br_real\""%g \
+		$(@D)/build/toolchain/custom/BUILD.gn
+
+	$(SED) "s%cxx =.*%cxx = \"\$${toolchain_bin}/ccache clang++.br_real\""%g \
+		$(@D)/build/toolchain/custom/BUILD.gn
+endef
+else
+define FLUTTER_ENGINE_COMPILER_PATH_FIXUP
+	$(SED) "s%cc =.*%cc = \"\$${toolchain_bin}/clang.br_real\""%g \
+		$(@D)/build/toolchain/custom/BUILD.gn
+
+	$(SED) "s%cxx =.*%cxx = \"\$${toolchain_bin}/clang++.br_real\""%g \
+		$(@D)/build/toolchain/custom/BUILD.gn
+endef
+endif
+FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_COMPILER_PATH_FIXUP
+
+# If using per_package builds, flutter-engine tries to use the /usr/bin/ld instead of
+# the one provided by the compiler, resulting in linking errors.
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define FLUTTER_ENGINE_GET_PATH
+	(ld_bin_path=$$(dirname $$(realpath $$(find $(PER_PACKAGE_DIR)/flutter-engine -name ld -type f))); \
+		echo $${ld_bin_path}:$(BR_PATH):$(HOST_DIR)/share/depot_tools; \
+	)
+endef
+else
+define FLUTTER_ENGINE_GET_PATH
+		echo $(BR_PATH):$(HOST_DIR)/share/depot_tools
+endef
+endif
+
+# Generate a tarball if one does not already exist.
+define FLUTTER_ENGINE_GENERATE_TARBALL
+	(if [ ! -e $(FLUTTER_ENGINE_TARBALL_PATH) ]; then \
+		. ./support/download/helpers && \
+		rm -rf $(@D)/dl-tmp && mkdir -p $(@D)/dl-tmp && \
+		$(INSTALL) -D -m 0755 $(FLUTTER_ENGINE_PKGDIR)/gclient \
+			$(@D)/dl-tmp/.gclient && \
+		$(SED) "s%!FLUTTER_VERSION!%$(FLUTTER_ENGINE_VERSION)%g" \
+			$(@D)/dl-tmp/.gclient && \
+		cd $(@D)/dl-tmp && \
+		$(DEPOT_TOOLS_GCLIENT) \
+			sync \
+			--delete_unversioned_trees \
+			-j$(PARALLEL_JOBS) \
+			--no-history \
+			--reset \
+			--shallow && \
+		mkdir -p $(FLUTTER_ENGINE_DL_DIR); \
+		cd $(@D)/dl-tmp && \
+		mk_tar_gz \
+		$(@D)/dl-tmp/src \
+		flutter-$(FLUTTER_ENGINE_VERSION) \
+		"$$(git -C $(@D)/dl-tmp/src log -1 --pretty=format:%ci)" \
+		$(FLUTTER_ENGINE_TARBALL_PATH) && \
+		rm -rf $(@D)/dl-tmp; \
+	fi \
+	)
+endef
+FLUTTER_ENGINE_POST_DOWNLOAD_HOOKS += FLUTTER_ENGINE_GENERATE_TARBALL
+
+define FLUTTER_ENGINE_EXTRACT_CMDS
+	gzip -d -c $(FLUTTER_ENGINE_TARBALL_PATH) | tar --strip-components 1 -C $(@D) -xf -
+endef
+
+define FLUTTER_ENGINE_CONFIGURE_CMDS
+  # libtessellator requires these three files, but the toolchain path isn't
+  # referenced when linking. Copy them to the staging lib directory before
+  # building.
+	$(Q)$(foreach i,crtbeginS.o crtendS.o libgcc.a,
+		$(Q)if [ ! -e $(STAGING_DIR)/usr/lib/$(i) ]; then \
+			file_path=$$(find $(HOST_DIR) -type f -name $(i)); \
+			$(INSTALL) -D -m 0755 $${file_path} $(STAGING_DIR)/usr/lib/$(i); \
+		fi \
+	)
+	(cd $(@D)/ && \
+		rm -rf $(FLUTTER_ENGINE_BUILD_DIR) && \
+		PATH=$(shell $(call FLUTTER_ENGINE_GET_PATH)) \
+		./flutter/tools/gn $(FLUTTER_ENGINE_CONF_OPTS) \
+	)
+endef
+
+define FLUTTER_ENGINE_BUILD_CMDS
+	(cd $(@D); \
+		PATH=$(shell $(call FLUTTER_ENGINE_GET_PATH)) \
+		PYTHONNOUSERSITE=y \
+		$(HOST_DIR)/bin/ninja \
+			-j $(PARALLEL_JOBS) \
+			-C $(FLUTTER_ENGINE_BUILD_DIR) \
+	)
+endef
+
+define FLUTTER_ENGINE_INSTALL_STAGING_CMDS
+	$(foreach i,$(FLUTTER_ENGINE_INSTALL_STAGING_FILES),
+		$(Q)if [ -e $(FLUTTER_ENGINE_BUILD_DIR)/$(i) ]; then \
+			$(INSTALL) -D -m 0755 $(FLUTTER_ENGINE_BUILD_DIR)/$(i) \
+				$(STAGING_DIR)/usr/lib/$(i); \
+		fi \
+	)
+	$(INSTALL) -D -m 0755 $(FLUTTER_ENGINE_BUILD_DIR)/flutter_embedder.h \
+		$(STAGING_DIR)/usr/include/flutter_embedder.h
+endef
+
+define FLUTTER_ENGINE_INSTALL_TARGET_CMDS
+	$(foreach i,$(FLUTTER_ENGINE_INSTALL_FILES),
+		$(Q)if [ -e $(FLUTTER_ENGINE_BUILD_DIR)/$(i) ]; then \
+			$(INSTALL) -D -m 0755 $(FLUTTER_ENGINE_BUILD_DIR)/$(i) \
+				$(TARGET_DIR)/usr/lib/$(i); \
+		fi \
+	)
+endef
+
+$(eval $(generic-package))
diff --git a/package/flutter-engine/gclient b/package/flutter-engine/gclient
new file mode 100644
index 0000000000..168e9a368d
--- /dev/null
+++ b/package/flutter-engine/gclient
@@ -0,0 +1,16 @@
+# This file is taken from the output of meta-flutter/lib/gn.py
+
+solutions = [{
+    "managed": False,
+    "name": "src/flutter",
+    "url": "https://github.com/flutter/engine.git@!FLUTTER_VERSION!",
+    "custom_vars": {
+        "download_android_deps": False,
+        "download_windows_deps": False,
+        "download_linux_deps": False
+    },
+    "custom_deps": {
+        "src/third_party/dart/third_party/pkg/tools":
+        "https://dart.googlesource.com/tools.git@unified_analytics-v1.1.0"
+    }
+}]
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
