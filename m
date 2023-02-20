Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9D9C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8082701AA;
	Tue, 21 Feb 2023 02:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8082701AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvLXzvFVRRzQ; Tue, 21 Feb 2023 02:21:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF25470296;
	Tue, 21 Feb 2023 02:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF25470296
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C8AC31BF310
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 23:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1E8C42B5D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 23:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1E8C42B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41kfwqdtvT8z for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 23:19:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0206F41D8B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0206F41D8B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 23:19:07 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 p3-20020a05600c358300b003e206711347so1907715wmq.0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 15:19:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a9npU6mldAW1ap4NStwxQldx/onOUFHOHAgr0YtlEtY=;
 b=NMRIpnD2dEoF+EpByitb+2xyGeRlycO3jvAiC3gIcKxU+URZUjJ4BlPrqQdplqyQwG
 +NFsP8jTXHfFUlljjKrmUNwWabOBeArFcE/Y9koy/a4ZGTqZ5/oCy87wdp7YhExVJ+Zo
 8vqeWnU6VTfpBrMSY/OMtyq5HgZjlkHUhrqMX1EZzfDU7c0GUWoxgmiQMXasru2HY8d3
 KhsQLEePP6sko46tRbZseDQUri42zkg7G/+uAl/S9TpuX8wy12u3JBJuxXJ0dmqQ7o/B
 4z7ieyRShkLnFKnRclqMhSKeJ3DZtRriGTadOL3/ogFNMciOmkgDBaFEFimOU8YYM80i
 a7jQ==
X-Gm-Message-State: AO0yUKWCa7Jx2oBXzhvCae0D1PuxJXPdxDTaDFTnM+/pSwWgXoHEtjn6
 GGdVI3U+8+pepWmlYJJJG0zWiOgIJ4c=
X-Google-Smtp-Source: AK7set9aHyCD2FRnlVOgRw+XMWXoeeBWHvqws5ol9MDSaQnZwTH+ptmOOpldM5Hmr4/S4oOyVIwnCQ==
X-Received: by 2002:a05:600c:492f:b0:3e2:6ec:7fbe with SMTP id
 f47-20020a05600c492f00b003e206ec7fbemr1287416wmp.40.1676935145686; 
 Mon, 20 Feb 2023 15:19:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m26-20020a7bca5a000000b003e20a6fd604sm2024524wml.4.2023.02.20.15.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:19:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 00:19:02 +0100
Message-Id: <20230220231902.340496-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a9npU6mldAW1ap4NStwxQldx/onOUFHOHAgr0YtlEtY=;
 b=ZuXwKKay9a/jhExsJ1NPYQwcSyrV6/fRkec2hf1V3BDm2f/Pk+7b6k6ZiGIlabF0JZ
 okprayI1ap32Ze+0ZCEDLhpe2hkpL2F4kPd4rxRTdZAcilWFjWAVkxIAMIxxUAZDYO7N
 XMvnlCZBoTtxiDyAamAQ6nFu16CdWWT5EuyRE+MQB3vdm3Si9bMYq6F67l/5Ow6jSSZF
 CJVQnfbV+438/IjgJzeJbgZVtWmftFb8JuTRTreYPEzElLCBvfBIE5WU7XfpclcChcB7
 sdFOC1EBRKhjttQK1tY8gi3GeSPXSe0ExLif1lFKrDmPe4WlXMlzZJ3+s4E74p4FuYDa
 qbmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZuXwKKay
Subject: [Buildroot] [PATCH 1/1] package/fluent-bit: fix build without C++
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit dedbc69022ba0beaf259463ac8082c86776f7e88 was incomplete resuling
in the following build failure since the addition of the package in
commit 6a0f7c39bcb48fc13aa2ce3fc4996baf1be66483:

-- Check for working CXX compiler: /usr/bin/c++ - broken
CMake Error at /home/autobuild/autobuild/instance-15/output-1/per-package/fluent-bit/host/share/cmake-3.22/Modules/CMakeTestCXXCompiler.cmake:62 (message):
  The C++ compiler

    "/usr/bin/c++"

  is not able to compile a simple test program.

  It fails with the following output:

    Change Dir: /home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp

    Run Build Command(s):/home/autobuild/make/make -f Makefile cmTC_bfb29/fast && make[1]: Entering directory '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp'
    /home/autobuild/make/make  -f CMakeFiles/cmTC_bfb29.dir/build.make CMakeFiles/cmTC_bfb29.dir/build
    make[2]: Entering directory '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp'
    Building CXX object CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx.o
    /usr/bin/c++ --sysroot=/home/autobuild/autobuild/instance-15/output-1/per-package/fluent-bit/host/xtensa-buildroot-linux-uclibc/sysroot   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O2 -g0  -fcommon -U_FILE_OFFSET_BITS  -g -fPIE -o CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx.o -c /home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp/testCXXCompiler.cxx
    c++: error: unrecognized command-line option '-mlongcalls'
    c++: error: unrecognized command-line option '-mauto-litpools'
    make[2]: *** [CMakeFiles/cmTC_bfb29.dir/build.make:78: CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx.o] Error 1
    make[2]: Leaving directory '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp'
    make[1]: *** [Makefile:127: cmTC_bfb29/fast] Error 2
    make[1]: Leaving directory '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp'

  CMake will not be able to correctly generate this project.
Call Stack (most recent call first):
  lib/msgpack-c/CMakeLists.txt:2 (project)

While at it, add missing comment about C++ dependency for wasm

Fixes:
 - http://autobuild.buildroot.org/results/4b0f90d79d6dbbf976acf1da839260b0ee94ddda

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../fluent-bit/0003-fix-build-without-C.patch | 131 ++++++++++++++++++
 package/fluent-bit/Config.in                  |   4 +
 2 files changed, 135 insertions(+)
 create mode 100644 package/fluent-bit/0003-fix-build-without-C.patch

diff --git a/package/fluent-bit/0003-fix-build-without-C.patch b/package/fluent-bit/0003-fix-build-without-C.patch
new file mode 100644
index 0000000000..16afec3fe5
--- /dev/null
+++ b/package/fluent-bit/0003-fix-build-without-C.patch
@@ -0,0 +1,131 @@
+From 014e44808ebaf29b0c25b5a3fa2e35a99a30f628 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 21 Feb 2023 00:09:57 +0100
+Subject: [PATCH] fix build without C++
+
+Fix the following build failure without C++:
+
+-- Check for working CXX compiler: /usr/bin/c++ - broken
+CMake Error at /home/autobuild/autobuild/instance-15/output-1/per-package/fluent-bit/host/share/cmake-3.22/Modules/CMakeTestCXXCompiler.cmake:62 (message):
+  The C++ compiler
+
+    "/usr/bin/c++"
+
+  is not able to compile a simple test program.
+
+  It fails with the following output:
+
+    Change Dir: /home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp
+
+    Run Build Command(s):/home/autobuild/make/make -f Makefile cmTC_bfb29/fast && make[1]: Entering directory '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp'
+    /home/autobuild/make/make  -f CMakeFiles/cmTC_bfb29.dir/build.make CMakeFiles/cmTC_bfb29.dir/build
+    make[2]: Entering directory '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp'
+    Building CXX object CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx.o
+    /usr/bin/c++ --sysroot=/home/autobuild/autobuild/instance-15/output-1/per-package/fluent-bit/host/xtensa-buildroot-linux-uclibc/sysroot   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O2 -g0  -fcommon -U_FILE_OFFSET_BITS  -g -fPIE -o CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx.o -c /home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp/testCXXCompiler.cxx
+    c++: error: unrecognized command-line option '-mlongcalls'
+    c++: error: unrecognized command-line option '-mauto-litpools'
+    make[2]: *** [CMakeFiles/cmTC_bfb29.dir/build.make:78: CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx.o] Error 1
+    make[2]: Leaving directory '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp'
+    make[1]: *** [Makefile:127: cmTC_bfb29/fast] Error 2
+    make[1]: Leaving directory '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp'
+
+  CMake will not be able to correctly generate this project.
+Call Stack (most recent call first):
+  lib/msgpack-c/CMakeLists.txt:2 (project)
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4b0f90d79d6dbbf976acf1da839260b0ee94ddda
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/fluent/fluent-bit/pull/6893]
+---
+ lib/chunkio/CMakeLists.txt          | 2 +-
+ lib/lwrb/CMakeLists.txt             | 2 +-
+ lib/msgpack-c/CMakeLists.txt        | 2 +-
+ lib/onigmo/CMakeLists.txt           | 2 +-
+ lib/snappy-fef67ac/CMakeLists.txt   | 2 +-
+ lib/tutf8e/CMakeLists.txt           | 2 +-
+ src/stream_processor/CMakeLists.txt | 2 +-
+ 7 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/lib/chunkio/CMakeLists.txt b/lib/chunkio/CMakeLists.txt
+index 233bce35c..8bfe5199d 100644
+--- a/lib/chunkio/CMakeLists.txt
++++ b/lib/chunkio/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ cmake_minimum_required(VERSION 3.0)
+-project(chunk-io)
++project(chunk-io C)
+ 
+ set(CIO_VERSION_MAJOR  1)
+ set(CIO_VERSION_MINOR  4)
+diff --git a/lib/lwrb/CMakeLists.txt b/lib/lwrb/CMakeLists.txt
+index 2fabd6319..031cbc1dd 100644
+--- a/lib/lwrb/CMakeLists.txt
++++ b/lib/lwrb/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ cmake_minimum_required(VERSION 3.0)
+ 
+ # Setup project
+-project(LwLibPROJECT)
++project(LwLibPROJECT C)
+ 
+ # -------------------------------------------------
+ # This CMakeLists.txt is used only if it is a top-level file.
+diff --git a/lib/msgpack-c/CMakeLists.txt b/lib/msgpack-c/CMakeLists.txt
+index 810ad609a..ffbbc5ddb 100644
+--- a/lib/msgpack-c/CMakeLists.txt
++++ b/lib/msgpack-c/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ cmake_minimum_required(VERSION 2.8)
+-project(msgpack-c)
++project(msgpack-c C)
+ 
+ set(src
+     src/objectc.c
+diff --git a/lib/onigmo/CMakeLists.txt b/lib/onigmo/CMakeLists.txt
+index 4a3b30d7d..66865130a 100644
+--- a/lib/onigmo/CMakeLists.txt
++++ b/lib/onigmo/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ cmake_minimum_required(VERSION 3.4)
+-project(onigmo)
++project(onigmo C)
+ 
+ # Onigmo Version
+ set(ONIGMO_VERSION_MAJOR  6)
+diff --git a/lib/snappy-fef67ac/CMakeLists.txt b/lib/snappy-fef67ac/CMakeLists.txt
+index 8bb1e9598..ae9225c49 100644
+--- a/lib/snappy-fef67ac/CMakeLists.txt
++++ b/lib/snappy-fef67ac/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ cmake_minimum_required(VERSION 2.8)
+-project(snappy-c)
++project(snappy-c C)
+ 
+ set(CMAKE_POSITION_INDEPENDENT_CODE ON)
+ 
+diff --git a/lib/tutf8e/CMakeLists.txt b/lib/tutf8e/CMakeLists.txt
+index 35cbe01ad..a056ef83c 100644
+--- a/lib/tutf8e/CMakeLists.txt
++++ b/lib/tutf8e/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ cmake_minimum_required(VERSION 2.8)
+-project(tutf8e)
++project(tutf8e C)
+ 
+ # Not supported: -std=c90 (lacks support for inline)
+ # Supported:     -std=gnu90, -std=c99 or -std=gnu99
+diff --git a/src/stream_processor/CMakeLists.txt b/src/stream_processor/CMakeLists.txt
+index 8c5d70d13..de2c2fe38 100644
+--- a/src/stream_processor/CMakeLists.txt
++++ b/src/stream_processor/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-project(stream-processor)
++project(stream-processor C)
+ 
+ include_directories(${CMAKE_CURRENT_SOURCE_DIR})
+ 
+-- 
+2.39.0
+
diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index f53eacb447..bfdea895b0 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -30,6 +30,10 @@ config BR2_PACKAGE_FLUENT_BIT_WASM
 	help
 	  Support for WASM-based plugins.
 
+comment "wasm runtime support needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 endif
 
 comment "fluent-bit needs a toolchain w/ threads, dynamic library"
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
