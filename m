Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3F6C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 20:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22F3E4177C;
	Tue,  8 Aug 2023 20:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22F3E4177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TjQX4I02YxBH; Tue,  8 Aug 2023 20:00:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED3D54173F;
	Tue,  8 Aug 2023 20:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED3D54173F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B32161BF25F
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 19:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99BCB4038E
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 19:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99BCB4038E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xde9Ty5jvRsw for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 19:59:45 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A872401AD
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 19:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A872401AD
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-687087d8ddaso5849454b3a.1
 for <buildroot@buildroot.org>; Tue, 08 Aug 2023 12:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691524784; x=1692129584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GbFtCkANS5S03ulY2/ZDg+/Gkxdaut1tYerlYUoM86M=;
 b=aY9gmMoLnL8VGN2z9f1v0EicDwz1fOK1/NebWuqllmbno2KuiTY233lHHnG7xVjz6J
 YEIcBGuFaouQlDHc18ZzGrd8Xr46jG1CJiskYDR65dJfeEUSaFkhvVjbYFT+ssloHovQ
 2voWhxaUZonV2jctSzghw+T4MUES21ddqdqdyPlDIDvzMfEWwgzvThhv6JKmFEq11WXa
 5cUfj79A6Z62bag5ofwloXvNLoCC1n3vxXRn8z38mK7mQdCNa2CZ6WSBpuURnOeDrOZG
 mrwmUrPQ8r+rwP07AmLq9J73SQ0G+7y82qfvTZwdUcvebv9NWwBWFwM/nos1O1sLts7t
 CcKg==
X-Gm-Message-State: AOJu0YzBrbFBAUc6L+G22TOUqVZZ0D6SZt9V7J6aI2Q0G2aScmRKFFqV
 wHqqRWGz1YPowkB8vzvpK4ixZnwzb/orxtrtXK2M1g==
X-Google-Smtp-Source: AGHT+IFm6eea8bNrCH9Sd/zWW5eeAVgacTV0DN+PcoFLeiNRKd1uZUmZoC5EZ2YA5DAbOWhIkRatLQ==
X-Received: by 2002:a05:6a20:a10b:b0:135:4527:efe4 with SMTP id
 q11-20020a056a20a10b00b001354527efe4mr728364pzk.10.1691524784088; 
 Tue, 08 Aug 2023 12:59:44 -0700 (PDT)
Received: from fedora.amarulasolutions.com ([174.27.153.162])
 by smtp.gmail.com with ESMTPSA id
 d6-20020aa78686000000b0067a50223e3bsm8483958pfo.111.2023.08.08.12.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 12:59:43 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 13:59:38 -0600
Message-ID: <20230808195938.454382-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230808195938.454382-1-adam.duskett@amarulasolutions.com>
References: <20230808195938.454382-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1691524784; x=1692129584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GbFtCkANS5S03ulY2/ZDg+/Gkxdaut1tYerlYUoM86M=;
 b=OjNTgxK+DrQH6WSL3fiT+7JafIQ2iGISD3Tn1KTjVkTROTo0yDIQY+cnaVth3l/C8V
 CTHGwOQM2KK1MDs/mAJChexkQJ1tGyHHiKGv/BH8cSdiY09H4a9gSVi5AMlj/IfPkM9L
 oKHllWQ63IHzTjuXas7V6kRwOMkJM4BmE5mQs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=OjNTgxK+
Subject: [Buildroot] [PATCH 3/3] package/flutter-engine: new package
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

  Even worse, the flutter buildsystem depends on the .git dirs being present.
  (https://github.com/meta-flutter/meta-flutter/issues/271) This dependency
  means it is not possible to create a reproducible tarball from the downloaded
  sources, which is why there is no .hash file provided.

  I have asked the flutter project to release full tarballs suitable for
  compiling here: https://github.com/flutter/flutter/issues/130734

- Flutter engine includes a patched copy of clang that must be used to compile.
  Using a Buildroot-build clang results in linking warning and errors.
  As such, we depend on LLVM_ARCH_SUPPORTS but use the included clang for
  building. On the plus side, this saves time having to compile clang.

Tested with:
  - Debian 11 and 12
  - Ubuntu 18.04, 20.04, and 22.04
  - Fedora 38
  - Per package directory enabled and disabled
  - x86_64, arm64

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
Changes rfc v2 -> v1:
  - DEVELOPERS file format cleanup [Thomas]

  - Add upstream issue for 0004-pkg-config.py-do-not-prepend-sysroot-path.patch
    (https://github.com/flutter/flutter/issues/132152) [Thomas]

  - Changed BR2_PACKAGE_LLVM_ARCH_SUPPORTS to BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
    [Thomas]

  - Fixed alphabetic ordering of selects in Config.in [Thomas]

  - Removed BR2_PACKAGE_FLUTTER_ENGINE_ARTIFACTS option from Config.in. That
    option builds binaries used for compiling on the device, which Buildroot
    doesn't need nor want.

  - Added BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS to the
    "flutter-engine needs an OpenGL backend" line. [Thomas]

  - Added --no-stripped unconditionally [Thomas]

  - Removed check for mesa3d, as libgl and libgles take care of that. [Thomas]

  - Moved libflutter_linux_gtk.so into the ifeq ($(BR2_PACKAGE_LIBGTK3),y)
    conditional check, which removes the need to check if the
    FLUTTER_ENGINE_INSTALL_FILES exist in the INSTALL_STAGING and
    INSTALL_TARGET commands. [Thomas]

  - Install .so files from the so.unstripped/ directory. [Thomas]
  
  - Remove the check in gen-tarball that checks if the tarball already exists.
    Always re-create the tarball when running the gen-tarball script. [Thomas]

Changes rfc v1 -> rfc v2:
  - Use the flutter-engine provided clang.
  - Remove 0003-disable-undefined-version.patch
  - Add 0003-fix-toolchain-paths.patch
  - Fix signed-off-by lines in the patches [Yann]
  - Remove "Runtime mode" option in favor of checking BR2_ENABLE_RUNTIME_DEBUG [Yann]
  - Use positive logic in flutter-engine.mk [Yann]
  - Add comments when --disable-${option} doesn't exist. [Yann]
  - Remove unecessary subshells in flutter-engine.mk [Yann]
  - Rename flutter-engine/gclient to flutter-engine/dot-gclient [Yann]
  - Create flutter-engine/gen-tarball to generate the flutter-engine tarball. [Yann]
  - Remove finding and copying crtbeginS.o crtendS.o libgcc.a as it's
    unecessary when using the flutter-engine provided clang.
  - FLUTTER_ENGINE_INSTALL_STAGING_FILES -> FLUTTER_ENGINE_INSTALL_FILES [Yann]
  - Reword comments at the top of flutter-engine.mk for clarity.

 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 .../0001-disable-pre-canned-sysroot.patch     |  32 +++
 .../0002-remove-explicit-x11-dependency.patch |  33 +++
 .../0003-fix-toolchain-paths.patch            |  40 ++++
 ...onfig.py-do-not-prepend-sysroot-path.patch |  37 +++
 package/flutter-engine/Config.in              |  56 +++++
 package/flutter-engine/dot-gclient            |  16 ++
 package/flutter-engine/flutter-engine.mk      | 220 ++++++++++++++++++
 package/flutter-engine/gen-tarball            | 106 +++++++++
 10 files changed, 542 insertions(+)
 create mode 100644 package/flutter-engine/0001-disable-pre-canned-sysroot.patch
 create mode 100644 package/flutter-engine/0002-remove-explicit-x11-dependency.patch
 create mode 100644 package/flutter-engine/0003-fix-toolchain-paths.patch
 create mode 100644 package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
 create mode 100644 package/flutter-engine/Config.in
 create mode 100644 package/flutter-engine/dot-gclient
 create mode 100644 package/flutter-engine/flutter-engine.mk
 create mode 100755 package/flutter-engine/gen-tarball

diff --git a/DEVELOPERS b/DEVELOPERS
index 64b9acd0a5..fd439106f8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -28,6 +28,7 @@
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
+F:	package/flutter-engine/
 
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
diff --git a/package/Config.in b/package/Config.in
index 1617f7488a..469f3bba4b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -344,6 +344,7 @@ comment "Graphic libraries"
 	source "package/fbset/Config.in"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
+	source "package/flutter-engine/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
diff --git a/package/flutter-engine/0001-disable-pre-canned-sysroot.patch b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
new file mode 100644
index 0000000000..953705e33b
--- /dev/null
+++ b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
@@ -0,0 +1,32 @@
+From 49a14e693124dc34f2cccbfb755d01a1198aa6bf Mon Sep 17 00:00:00 2001
+From: Joel Winarske <joel.winarsk@gmail.com>
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
index 0000000000..23d7ec9b06
--- /dev/null
+++ b/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
@@ -0,0 +1,33 @@
+From b1a5db9318ca33a03f2700758d5debad907d21b6 Mon Sep 17 00:00:00 2001
+From: Joel Winarske <joel.winarsk@gmail.com>
+Date: Wed, 19 Jul 2023 15:26:40 -0700
+Subject: [PATCH] remove explicit x11 dependency
+
+This is superfluous and may conflict with the actual rendering system used in
+gtk3 (e.g. wayland.)
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
diff --git a/package/flutter-engine/0003-fix-toolchain-paths.patch b/package/flutter-engine/0003-fix-toolchain-paths.patch
new file mode 100644
index 0000000000..ba5d5f8023
--- /dev/null
+++ b/package/flutter-engine/0003-fix-toolchain-paths.patch
@@ -0,0 +1,40 @@
+From ca175ef5bf7f96db57fb5aa562602dc424fab81c Mon Sep 17 00:00:00 2001
+From: Joel Winarske <joel.winarsk@gmail.com>
+Date: Sun, 5 Mar 2023 10:43:02 -0800
+Subject: [PATCH] fix toolchain paths
+
+Flutter includes a copy of clang which is required to build. However, by
+default, build/toolchain/custom/BUILD.gn attempts to use several gcc utilities
+such as ar, readelf, nm, and strip. Change these to the proper llvm provided
+utility.
+
+Upstream: https://github.com/flutter/flutter/issues/123073
+
+Signed-off-by: Joel Winarske <joel.winarsk@gmail.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ build/toolchain/custom/BUILD.gn | 4 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/build/toolchain/custom/BUILD.gn b/build/toolchain/custom/BUILD.gn
+index 65b1623..8b3f6f8 100644
+--- a/build/toolchain/custom/BUILD.gn
++++ b/build/toolchain/custom/BUILD.gn
+@@ -12,11 +12,11 @@ toolchain("custom") {
+   # these values in our scope.
+   cc = "${toolchain_bin}/clang"
+   cxx = "${toolchain_bin}/clang++"
+-  ar = "${toolchain_bin}/${custom_target_triple}-ar"
++  ar = "${toolchain_bin}/llvm-ar"
+   ld = "${toolchain_bin}/clang++"
+-  readelf = "${toolchain_bin}/${custom_target_triple}-readelf"
+-  nm = "${toolchain_bin}/${custom_target_triple}-nm"
+-  strip = "${toolchain_bin}/${custom_target_triple}-strip"
++  readelf = "${toolchain_bin}/llvm-readelf"
++  nm = "${toolchain_bin}/llvm-nm"
++  strip = "${toolchain_bin}/llvm-strip"
+ 
+   target_triple_flags = "--target=${custom_target_triple}"
+   sysroot_flags = "--sysroot ${custom_sysroot}"
+-- 
+2.39.2
diff --git a/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch b/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
new file mode 100644
index 0000000000..a31be7d77f
--- /dev/null
+++ b/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
@@ -0,0 +1,37 @@
+From 51e8fed854fd9d373bb9b20d7ed8e7cf6ef12312 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Wed, 19 Jul 2023 11:48:59 -0700
+Subject: [PATCH] pkg-config.py: do not prepend sysroot path
+
+Buildroot uses the standard PKG_CONFIG_SYSROOT_DIR variable, so what the
+pkg-config.py script is doing doesn't make sense. There is no need to prepend
+the sysroot, and flutter should let pkg-config use the PKG_CONFIG_SYSROOT_DIR
+variable.
+
+Without this patch, the pkg-config.py script double prepends the sysroot path.
+IE: output/host/.../sysroot/output/host/.../sysroot
+
+Upstream: https://github.com/flutter/flutter/issues/132152
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
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
index 0000000000..aad0fc6108
--- /dev/null
+++ b/package/flutter-engine/Config.in
@@ -0,0 +1,56 @@
+# Flutter includes a vender copy of clang which is mandatory to use for
+# compiling. These are the supported architectures.
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
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_HOST_DEPOT_TOOLS
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
+comment "flutter-engine needs an OpenGL or OpenGLES backend"
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
+
+comment "flutter-engine needs a glibc toolchain w/ wchar, C++, gcc >= 5, dynamic library, host gcc >= 5, NPTL"
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
+		|| !BR2_HOST_GCC_AT_LEAST_5
+
+comment "flutter-engine needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/flutter-engine/dot-gclient b/package/flutter-engine/dot-gclient
new file mode 100644
index 0000000000..168e9a368d
--- /dev/null
+++ b/package/flutter-engine/dot-gclient
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
diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
new file mode 100644
index 0000000000..8a2c83df58
--- /dev/null
+++ b/package/flutter-engine/flutter-engine.mk
@@ -0,0 +1,220 @@
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
+#  - Copy the pre-made gclient config file to a temporary scratch directory.
+#  - Run gclient sync to generate a source directory with the proper
+#    flutter-engine source code in the correct places.
+#  - Run mk_tar_gz to create a tarball.
+#  - Copy the tarball to the $(FLUTTER_ENGINE_DL_DIR) directory to create a
+#    tarball.
+#
+# There is no hash provided, as the gn binary (used for configuration) relies
+# on the .git directories. As such, a reproducible tarball is not possible.
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
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
+FLUTTER_ENGINE_RUNTIME_MODE=debug
+else
+FLUTTER_ENGINE_RUNTIME_MODE=release
+endif
+
+FLUTTER_ENGINE_BUILD_DIR = \
+	$(@D)/out/linux_$(FLUTTER_ENGINE_RUNTIME_MODE)_$(FLUTTER_ENGINE_TARGET_ARCH)
+
+FLUTTER_ENGINE_INSTALL_FILES = libflutter_engine.so
+
+# Flutter engine includes a bundled patched clang that must be used for
+# compiling or else there are linking errors.
+FLUTTER_ENGINE_CLANG_PATH = $(@D)/buildtools/linux-x64/clang
+
+FLUTTER_ENGINE_CONF_OPTS = \
+	--clang \
+	--depot-tools $(HOST_DIR)/share/depot_tools \
+	--embedder-for-target \
+	--linux-cpu $(FLUTTER_ENGINE_TARGET_ARCH) \
+	--no-build-embedder-examples \
+	--no-build-engine-artifacts \
+	--no-clang-static-analyzer \
+	--no-enable-unittests \
+	--no-goma \
+	--no-prebuilt-dart-sdk \
+	--no-stripped \
+	--runtime-mode $(FLUTTER_ENGINE_RUNTIME_MODE) \
+	--target-os linux \
+	--target-sysroot $(STAGING_DIR) \
+	--target-toolchain $(FLUTTER_ENGINE_CLANG_PATH) \
+	--target-triple $(FLUTTER_ENGINE_TARGET_TRIPPLE)
+
+ifeq ($(BR2_arm)$(BR2_armeb),y)
+FLUTTER_ENGINE_CONF_OPTS += \
+	--arm-float-abi $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+endif
+
+# We must specify a full path to ccache and a full path to the flutter-engine
+# provided clang in order to use ccache, or else flutter-engine will error out
+# attempting to find ccache in the target-toolchain provided path.
+ifeq ($(BR2_CCACHE),y)
+define FLUTTER_ENGINE_COMPILER_PATH_FIXUP
+	$(SED) "s%cc =.*%cc = \"$(HOST_DIR)/bin/ccache $(FLUTTER_ENGINE_CLANG_PATH)/bin/clang\""%g \
+		$(@D)/build/toolchain/custom/BUILD.gn
+
+	$(SED) "s%cxx =.*%cxx = \"$(HOST_DIR)/bin/ccache $(FLUTTER_ENGINE_CLANG_PATH)/bin/clang++\""%g \
+		$(@D)/build/toolchain/custom/BUILD.gn
+endef
+FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_COMPILER_PATH_FIXUP
+endif
+
+ifeq ($(BR2_ENABLE_LTO),y)
+FLUTTER_ENGINE_CONF_OPTS += --lto
+else
+FLUTTER_ENGINE_CONF_OPTS += --no-lto
+endif
+
+ifeq ($(BR2_OPTIMIZE_0),y)
+FLUTTER_ENGINE_CONF_OPTS += --unoptimized
+endif
+
+# There is no --disable-fontconfig option.
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
+ifeq ($(BR2_PACKAGE_LIBGLFW),y)
+FLUTTER_ENGINE_DEPENDENCIES += libglfw
+FLUTTER_ENGINE_CONF_OPTS += --build-glfw-shell
+else
+FLUTTER_ENGINE_CONF_OPTS += --no-build-glfw-shell
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+FLUTTER_ENGINE_DEPENDENCIES += libgtk3
+FLUTTER_ENGINE_INSTALL_FILES += libflutter_linux_gtk.so
+else
+FLUTTER_ENGINE_CONF_OPTS += --disable-desktop-embeddings
+endif
+
+# There is no --disable-vulkan option
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
+FLUTTER_ENGINE_CONF_OPTS += --enable-vulkan
+endif
+
+ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_LIBXCB),yy)
+FLUTTER_ENGINE_DEPENDENCIES += libxcb
+else
+define FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
+	$(SED) "s%vulkan_use_x11.*%vulkan_use_x11 = false%g" -i \
+		$(@D)/build_overrides/vulkan_headers.gni
+endef
+FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+FLUTTER_ENGINE_DEPENDENCIES += wayland
+else
+define FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
+	$(SED) "s%vulkan_use_wayland.*%vulkan_use_wayland = false%g" \
+		$(@D)/build_overrides/vulkan_headers.gni
+endef
+FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
+endif
+
+# Generate a tarball if one does not already exist.
+define FLUTTER_ENGINE_GENERATE_TARBALL
+	PATH=$(BR_PATH):$(HOST_DIR)/share/depot_tools \
+	PYTHONPATH=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR) \
+	$(FLUTTER_ENGINE_PKGDIR)/gen-tarball \
+		--dot-gclient $(FLUTTER_ENGINE_PKGDIR)/dot-gclient \
+		--jobs $(PARALLEL_JOBS) \
+		--scratch-dir $(@D)/dl-tmp \
+		--tarball $(FLUTTER_ENGINE_TARBALL_PATH) \
+		--version $(FLUTTER_ENGINE_VERSION)
+endef
+FLUTTER_ENGINE_POST_DOWNLOAD_HOOKS += FLUTTER_ENGINE_GENERATE_TARBALL
+
+define FLUTTER_ENGINE_EXTRACT_CMDS
+	gzip -d -c $(FLUTTER_ENGINE_TARBALL_PATH) | tar --strip-components 1 -C $(@D) -xf -
+endef
+
+define FLUTTER_ENGINE_CONFIGURE_CMDS
+	cd $(@D) && \
+		rm -rf $(FLUTTER_ENGINE_BUILD_DIR) && \
+		PATH=$(BR_PATH):$(HOST_DIR)/share/depot_tools \
+		./flutter/tools/gn \
+			$(FLUTTER_ENGINE_CONF_OPTS)
+endef
+
+define FLUTTER_ENGINE_BUILD_CMDS
+	cd $(@D) && \
+		PATH=$(BR_PATH):$(HOST_DIR)/share/depot_tools \
+		$(HOST_DIR)/bin/ninja \
+			-j $(PARALLEL_JOBS) \
+			-C $(FLUTTER_ENGINE_BUILD_DIR)
+endef
+
+define FLUTTER_ENGINE_INSTALL_STAGING_CMDS
+	$(foreach i,$(FLUTTER_ENGINE_INSTALL_FILES),
+		$(INSTALL) -D -m 0755 $(FLUTTER_ENGINE_BUILD_DIR)/so.unstripped/$(i) \
+			$(STAGING_DIR)/usr/lib/$(i); \
+	)
+	$(INSTALL) -D -m 0755 $(FLUTTER_ENGINE_BUILD_DIR)/flutter_embedder.h \
+		$(STAGING_DIR)/usr/include/flutter_embedder.h
+endef
+
+define FLUTTER_ENGINE_INSTALL_TARGET_CMDS
+	$(foreach i,$(FLUTTER_ENGINE_INSTALL_FILES),
+		$(INSTALL) -D -m 0755 $(FLUTTER_ENGINE_BUILD_DIR)/so.unstripped/$(i) \
+			$(TARGET_DIR)/usr/lib/$(i); \
+	)
+endef
+
+$(eval $(generic-package))
diff --git a/package/flutter-engine/gen-tarball b/package/flutter-engine/gen-tarball
new file mode 100755
index 0000000000..48e73e655c
--- /dev/null
+++ b/package/flutter-engine/gen-tarball
@@ -0,0 +1,106 @@
+#!/usr/bin/env bash
+# Call gclient and generate a flutter-engine source tarball if one does not
+# already exist.
+#
+# Author: Adam Duskett <adam.duskett@amarulasolutions.com>
+set -eu
+
+DL_DIR=
+DOT_GCLIENT=
+JOBS=
+SCRATCH_DIR=
+TARBALL=
+VERSION=
+
+# shellcheck disable=SC1091
+. ./support/download/helpers
+
+# Print status messages in the same style Buildroot prints.
+message() {
+  term_bold="$(tput smso 2>/dev/null)"
+  term_reset="$(tput rmso 2>/dev/null)"
+  echo "${term_bold}>>> flutter-engine ${VERSION} ${1}${term_reset}"
+}
+
+parse_opts(){
+  local o O opts
+
+  o='d:j:s:t:v:'
+  O='dot-gclient:,jobs:,scratch-dir:,tarball:,version:'
+  opts="$(getopt -o "${o}" -l "${O}" -- "${@}")"
+  eval set -- "${opts}"
+
+  while [ ${#} -gt 0 ]; do
+    case "${1}" in
+    (-d|--dot-gclient)
+      DOT_GCLIENT="${2}"
+      shift 2
+      ;;
+    (-j|--jobs)
+      JOBS="${2}"
+      shift 2
+      ;;
+    (-s|--scratch-dir)
+      SCRATCH_DIR="${2}"
+      shift 2
+      ;;
+    (-t|--tarball)
+      DL_DIR=$(dirname "${2}")
+      TARBALL="${2}"
+      shift 2
+      ;;
+    (-v|--version)
+      VERSION="${2}"
+      shift 2
+      ;;
+    (--)
+      shift
+      break
+      ;;
+    esac
+  done
+}
+
+copy_dot_gclient(){
+  rm -rf "${SCRATCH_DIR}"
+  mkdir -p "${SCRATCH_DIR}"
+  install -D -m 0755 "${DOT_GCLIENT}" "${SCRATCH_DIR}"/.gclient
+  sed "s%!FLUTTER_VERSION!%${VERSION}%g" -i "${SCRATCH_DIR}"/.gclient
+}
+
+run_gclient() {
+  local gclient="${HOST_DIR}"/share/depot_tools/gclient.py
+  if [[ ! -e "${gclient}" ]]; then
+    message "${gclient} does not exist. Is host-depot-tools built and installed?"
+    exit 1
+  fi
+  message "Downloading"
+  cd "${SCRATCH_DIR}"
+  "${gclient}" \
+    sync \
+    --delete_unversioned_trees \
+    --no-history \
+    --reset \
+    --shallow \
+    -j"${JOBS}"
+}
+
+gen_tarball(){
+  message "Generating tarball"
+  mkdir -p "${DL_DIR}"
+  mk_tar_gz \
+    "${SCRATCH_DIR}"/src \
+    flutter-"${VERSION}" \
+    "$(git -C "${SCRATCH_DIR}"/src log -1 --pretty=format:%ci)" \
+    "${TARBALL}"
+  rm -rf "${SCRATCH_DIR}"
+}
+
+main() {
+  parse_opts "${@}"
+  copy_dot_gclient
+  run_gclient
+  gen_tarball
+}
+
+main "${@}"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
