Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADEAC001DC
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 09:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B37D740869;
	Sun, 23 Jul 2023 09:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B37D740869
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dAp4_lyADnMp; Sun, 23 Jul 2023 09:23:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E18DE40964;
	Sun, 23 Jul 2023 09:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E18DE40964
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC4A01BF589
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 09:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9149E40964
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 09:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9149E40964
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G2kLtyI88Vd1 for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 09:23:25 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84C9C40869
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 09:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84C9C40869
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3163eb69487so2722982f8f.1
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 02:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690104203; x=1690709003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IzGzijgkyRqJL4diVqsYa8aNEeAnHRU6cEVAFTY//Z0=;
 b=jFZF2rf6GaaYXHJnSM+MnUrZyYif2kmBo4S4Gp64RRN9JNt0Yb52nTDnwV3gjt87Do
 RI0PQEzXincfglyo11m8qEy6LM0aOMwce141IXZgBIwJxNqjVojFnKMEhIMpeecTDDbw
 OjJ+zVs+8rei3B8qYi91vAIif1h7OVi4+RSRmKNzEhV9MLccKNeb9WYWiz5K8fqZYAZM
 B1/ykt77I1jp3h9AVJBqeo7H8ITj6QG7YuTxFn1FQATjhRAHhz3ijHmprDGGd2a/LZmx
 SQO9W8+nAIU2Ob1mpgbtXCg16hy8DPS3fIdfKmFcu1gguWfzqGUvHW3YKEDsT8IMxoSV
 rnOA==
X-Gm-Message-State: ABy/qLaTaIwnj0tHW6LXxYNjg7HV/MjkfNV+hutaZoXGI0IRd4K1E72p
 6CyVwSfDoA8pKAO/FypXA8FQYCAViyNKWw==
X-Google-Smtp-Source: APBJJlF1sWg2vmorw0CATXxIBW738cRCckd5l9hYhQncsmluJwg9TTkhDSB5J2XPansZJEamPSFyEQ==
X-Received: by 2002:adf:f2ce:0:b0:30e:56b3:60fe with SMTP id
 d14-20020adff2ce000000b0030e56b360femr6010594wrp.4.1690104202982; 
 Sun, 23 Jul 2023 02:23:22 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb68:2f00:f09c:126e:2c9c:1d2b])
 by smtp.gmail.com with ESMTPSA id
 o8-20020adfeac8000000b003143b7449ffsm9124728wrn.25.2023.07.23.02.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jul 2023 02:23:22 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 11:23:11 +0200
Message-Id: <20230723092314.129079-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230610133251.97022-1-thomas@devoogdt.com>
References: <20230610133251.97022-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/4] package/fluent-bit: bump to version 2.1.7
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fluent Bit v2.1 is the start of the new stable series of the project.

Release Notes:

  https://fluentbit.io/announcements/v2.1.0/
  https://fluentbit.io/announcements/v2.1.1/
  https://fluentbit.io/announcements/v2.1.2/
  https://fluentbit.io/announcements/v2.1.3/
  https://fluentbit.io/announcements/v2.1.4/
  https://fluentbit.io/announcements/v2.1.5/
  https://fluentbit.io/announcements/v2.1.6/
  https://fluentbit.io/announcements/v2.1.7/

Fluent Bit v2.1.7 contains this list of upstreamed patches:

  https://github.com/fluent/fluent-bit/pull/7266
  https://github.com/fluent/fluent-bit/pull/7254
  https://github.com/fluent/fluent-bit/pull/7253

So the old patches can be dropped.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: bump from 2.1.3 to 2.1.4
v3: bump from 2.1.4 to 2.1.7
---
 .checkpackageignore                           |   3 -
 .../0001-lib-cfl-fixup-static_assert.patch    |  33 -----
 .../0002-lib-c-ares-fixup-static_assert.patch |  56 --------
 .../fluent-bit/0003-fix-build-without-C.patch | 131 ------------------
 package/fluent-bit/fluent-bit.hash            |   2 +-
 package/fluent-bit/fluent-bit.mk              |   2 +-
 6 files changed, 2 insertions(+), 225 deletions(-)
 delete mode 100644 package/fluent-bit/0001-lib-cfl-fixup-static_assert.patch
 delete mode 100644 package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch
 delete mode 100644 package/fluent-bit/0003-fix-build-without-C.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 5fcb292629..b9265ae2e4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -465,9 +465,6 @@ package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch Ups
 package/flex/0003-build-make-it-possible-to-disable-the-build-of-the-d.patch Upstream
 package/flite/0001-fix-alsa-static.patch Upstream
 package/fltk/0001-disable-tests.patch Upstream
-package/fluent-bit/0001-lib-cfl-fixup-static_assert.patch Upstream
-package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch Upstream
-package/fluent-bit/0003-fix-build-without-C.patch Upstream
 package/fluxbox/0001-fixes-bug-1138.patch Upstream
 package/freeipmi/0001-add-disable-doc.patch Upstream
 package/freeradius-client/0001-fix-for-nettle.patch Upstream
diff --git a/package/fluent-bit/0001-lib-cfl-fixup-static_assert.patch b/package/fluent-bit/0001-lib-cfl-fixup-static_assert.patch
deleted file mode 100644
index 19dab7cac6..0000000000
--- a/package/fluent-bit/0001-lib-cfl-fixup-static_assert.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e4f825dd9e952f4a056bf89342049e67102ae6bb Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
-Date: Wed, 1 Feb 2023 11:38:15 +0100
-Subject: [PATCH] lib: cfl: fixup static_assert
-
-"undefined reference to 'static_assert'"
-
-Not defined when using uClibc or if not C++ >= 11.
-
-upstream: https://github.com/Cyan4973/xxHash/commit/6189ecd3d44a693460f86280ccf49d33cb4b18e1
-
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
----
- lib/cfl/lib/xxhash/xxhash.h | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/lib/cfl/lib/xxhash/xxhash.h b/lib/cfl/lib/xxhash/xxhash.h
-index 08ab79457..511c4d12b 100644
---- a/lib/cfl/lib/xxhash/xxhash.h
-+++ b/lib/cfl/lib/xxhash/xxhash.h
-@@ -1546,8 +1546,7 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
- /* note: use after variable declarations */
- #ifndef XXH_STATIC_ASSERT
- #  if defined(__STDC_VERSION__) && (__STDC_VERSION__ >= 201112L)    /* C11 */
--#    include <assert.h>
--#    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { static_assert((c),m); } while(0)
-+#    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { _Static_assert((c),m); } while(0)
- #  elif defined(__cplusplus) && (__cplusplus >= 201103L)            /* C++11 */
- #    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { static_assert((c),m); } while(0)
- #  else
--- 
-2.34.1
-
diff --git a/package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch b/package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch
deleted file mode 100644
index d9b918ea8a..0000000000
--- a/package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From f55f9bf6d9201169d2e5d3782068b03ff17dec90 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
-Date: Wed, 1 Feb 2023 11:26:56 +0100
-Subject: [PATCH] lib: c-ares: fixup static_assert
-
-"undefined reference to 'static_assert'"
-
-Not defined when using uClibc or if not C++ >= 11.
-
-upstream: https://github.com/c-ares/c-ares/issues/504
-
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
----
- lib/c-ares-1.19.0/configure                      | 4 ++++
- lib/c-ares-1.19.0/m4/ax_cxx_compile_stdcxx_11.m4 | 3 +++
- 2 files changed, 7 insertions(+)
-
-diff --git a/lib/c-ares-1.19.0/configure b/lib/c-ares-1.19.0/configure
-index 4c5e1a966..58712ec34 100755
---- a/lib/c-ares-1.19.0/configure
-+++ b/lib/c-ares-1.19.0/configure
-@@ -6317,6 +6317,8 @@ else $as_nop
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
- 
-+#define static_assert _Static_assert
-+
-   template <typename T>
-     struct check
-     {
-@@ -6394,6 +6396,8 @@ else $as_nop
-          cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
- 
-+#define static_assert _Static_assert
-+
-   template <typename T>
-     struct check
-     {
-diff --git a/lib/c-ares-1.19.0/m4/ax_cxx_compile_stdcxx_11.m4 b/lib/c-ares-1.19.0/m4/ax_cxx_compile_stdcxx_11.m4
-index 229de3091..fe4a11c67 100644
---- a/lib/c-ares-1.19.0/m4/ax_cxx_compile_stdcxx_11.m4
-+++ b/lib/c-ares-1.19.0/m4/ax_cxx_compile_stdcxx_11.m4
-@@ -37,6 +37,9 @@
- #serial 9
- 
- m4_define([_AX_CXX_COMPILE_STDCXX_11_testbody], [[
-+
-+#define static_assert _Static_assert
-+
-   template <typename T>
-     struct check
-     {
--- 
-2.34.1
-
diff --git a/package/fluent-bit/0003-fix-build-without-C.patch b/package/fluent-bit/0003-fix-build-without-C.patch
deleted file mode 100644
index 0f0b239216..0000000000
--- a/package/fluent-bit/0003-fix-build-without-C.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From f2aeca6fcc37bf22dd7307cab8fc9db6b53dd652 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 21 Feb 2023 00:09:57 +0100
-Subject: [PATCH] fix build without C++
-
-Fix the following build failure without C++:
-
--- Check for working CXX compiler: /usr/bin/c++ - broken
-CMake Error at /home/autobuild/autobuild/instance-15/output-1/per-package/fluent-bit/host/share/cmake-3.22/Modules/CMakeTestCXXCompiler.cmake:62 (message):
-  The C++ compiler
-
-    "/usr/bin/c++"
-
-  is not able to compile a simple test program.
-
-  It fails with the following output:
-
-    Change Dir: /home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp
-
-    Run Build Command(s):/home/autobuild/make/make -f Makefile cmTC_bfb29/fast && make[1]: Entering directory '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp'
-    /home/autobuild/make/make  -f CMakeFiles/cmTC_bfb29.dir/build.make CMakeFiles/cmTC_bfb29.dir/build
-    make[2]: Entering directory '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp'
-    Building CXX object CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx.o
-    /usr/bin/c++ --sysroot=/home/autobuild/autobuild/instance-15/output-1/per-package/fluent-bit/host/xtensa-buildroot-linux-uclibc/sysroot   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O2 -g0  -fcommon -U_FILE_OFFSET_BITS  -g -fPIE -o CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx.o -c /home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp/testCXXCompiler.cxx
-    c++: error: unrecognized command-line option '-mlongcalls'
-    c++: error: unrecognized command-line option '-mauto-litpools'
-    make[2]: *** [CMakeFiles/cmTC_bfb29.dir/build.make:78: CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx.o] Error 1
-    make[2]: Leaving directory '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp'
-    make[1]: *** [Makefile:127: cmTC_bfb29/fast] Error 2
-    make[1]: Leaving directory '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp'
-
-  CMake will not be able to correctly generate this project.
-Call Stack (most recent call first):
-  lib/msgpack-c/CMakeLists.txt:2 (project)
-
-Fixes:
- - http://autobuild.buildroot.org/results/4b0f90d79d6dbbf976acf1da839260b0ee94ddda
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/fluent/fluent-bit/pull/6893]
----
- lib/chunkio/CMakeLists.txt          | 2 +-
- lib/lwrb/CMakeLists.txt             | 2 +-
- lib/msgpack-c/CMakeLists.txt        | 2 +-
- lib/onigmo/CMakeLists.txt           | 2 +-
- lib/snappy-fef67ac/CMakeLists.txt   | 2 +-
- lib/tutf8e/CMakeLists.txt           | 2 +-
- src/stream_processor/CMakeLists.txt | 2 +-
- 7 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/lib/chunkio/CMakeLists.txt b/lib/chunkio/CMakeLists.txt
-index 233bce35c..8bfe5199d 100644
---- a/lib/chunkio/CMakeLists.txt
-+++ b/lib/chunkio/CMakeLists.txt
-@@ -1,5 +1,5 @@
- cmake_minimum_required(VERSION 3.0)
--project(chunk-io)
-+project(chunk-io C)
- 
- set(CIO_VERSION_MAJOR  1)
- set(CIO_VERSION_MINOR  4)
-diff --git a/lib/lwrb/CMakeLists.txt b/lib/lwrb/CMakeLists.txt
-index 2fabd6319..031cbc1dd 100644
---- a/lib/lwrb/CMakeLists.txt
-+++ b/lib/lwrb/CMakeLists.txt
-@@ -1,7 +1,7 @@
- cmake_minimum_required(VERSION 3.0)
- 
- # Setup project
--project(LwLibPROJECT)
-+project(LwLibPROJECT C)
- 
- # -------------------------------------------------
- # This CMakeLists.txt is used only if it is a top-level file.
-diff --git a/lib/msgpack-c/CMakeLists.txt b/lib/msgpack-c/CMakeLists.txt
-index 810ad609a..ffbbc5ddb 100644
---- a/lib/msgpack-c/CMakeLists.txt
-+++ b/lib/msgpack-c/CMakeLists.txt
-@@ -1,5 +1,5 @@
- cmake_minimum_required(VERSION 2.8)
--project(msgpack-c)
-+project(msgpack-c C)
- 
- set(src
-     src/objectc.c
-diff --git a/lib/onigmo/CMakeLists.txt b/lib/onigmo/CMakeLists.txt
-index 4a3b30d7d..66865130a 100644
---- a/lib/onigmo/CMakeLists.txt
-+++ b/lib/onigmo/CMakeLists.txt
-@@ -1,5 +1,5 @@
- cmake_minimum_required(VERSION 3.4)
--project(onigmo)
-+project(onigmo C)
- 
- # Onigmo Version
- set(ONIGMO_VERSION_MAJOR  6)
-diff --git a/lib/snappy-fef67ac/CMakeLists.txt b/lib/snappy-fef67ac/CMakeLists.txt
-index 8bb1e9598..ae9225c49 100644
---- a/lib/snappy-fef67ac/CMakeLists.txt
-+++ b/lib/snappy-fef67ac/CMakeLists.txt
-@@ -1,5 +1,5 @@
- cmake_minimum_required(VERSION 2.8)
--project(snappy-c)
-+project(snappy-c C)
- 
- set(CMAKE_POSITION_INDEPENDENT_CODE ON)
- 
-diff --git a/lib/tutf8e/CMakeLists.txt b/lib/tutf8e/CMakeLists.txt
-index 35cbe01ad..a056ef83c 100644
---- a/lib/tutf8e/CMakeLists.txt
-+++ b/lib/tutf8e/CMakeLists.txt
-@@ -1,5 +1,5 @@
- cmake_minimum_required(VERSION 2.8)
--project(tutf8e)
-+project(tutf8e C)
- 
- # Not supported: -std=c90 (lacks support for inline)
- # Supported:     -std=gnu90, -std=c99 or -std=gnu99
-diff --git a/src/stream_processor/CMakeLists.txt b/src/stream_processor/CMakeLists.txt
-index 8c5d70d13..de2c2fe38 100644
---- a/src/stream_processor/CMakeLists.txt
-+++ b/src/stream_processor/CMakeLists.txt
-@@ -1,4 +1,4 @@
--project(stream-processor)
-+project(stream-processor C)
- 
- include_directories(${CMAKE_CURRENT_SOURCE_DIR})
- 
--- 
-2.39.1
-
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index d60531438a..7e2059109a 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  aad5176cb4dcadacacd379ca43160074c6690012d37c4749536ac3b977d50495  fluent-bit-2.0.10.tar.gz
+sha256  ed80291d660be19f8458d81796c7d3f7e8735eb48ec393467a0c9deca2e9abc3  fluent-bit-2.1.7.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 319815f056..6cfa601614 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 2.0.10
+FLUENT_BIT_VERSION = 2.1.7
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
