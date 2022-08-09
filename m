Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39253C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 21:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAF6040875;
	Tue,  9 Aug 2022 21:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAF6040875
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eLMz26plOqCc; Tue,  9 Aug 2022 21:18:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD15B40879;
	Tue,  9 Aug 2022 21:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD15B40879
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF3101BF5E0
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 21:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7917400E4
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 21:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7917400E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mhppmv0auh2X for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 21:18:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C26440141
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C26440141
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 21:18:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j1so15697131wrw.1
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 14:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=v3QIyYmN+yjJepllyqNt/b6PXp3r/JRBeTpZGdvMoho=;
 b=yUlpcbGRgQdFFuOmdzE0Hm4jHCgYndO9d9quGcPjvpxu9ApCYWVoOrAPiVtt/wyite
 RaSqXKmzBP5haLwjJw6qxQKacLsolk29PETsV1X/4Wl6QR6SiDLqqO+/qGCjPlwr66w0
 9aH6eaQsLbaMzcyb3t+oiYNpJ6oldMHhCm/TW98hJ8wEJd8bRp6W4MGdOmpfGxwVjEzW
 lR2OufdZIotgl/PhJyPnnt44J7EGMMLrG4yVuUIm1X4Cjh0Fzae6htYJMdTMDypxJgJ6
 N7ePo6sWV0qd34GOueo4ae/+HhooFYvLlCkjaPeqqhC1+DQC1Gh47XesG7i6OdG6HHHZ
 FqDQ==
X-Gm-Message-State: ACgBeo3kuFRJs4+DJYDhVJ6RjsOaz4I0burQMU+IVUiUgdODlbQCzgDg
 TpkwdUzo/4ncZ/JPQ9jFodFAXGfSuuA=
X-Google-Smtp-Source: AA6agR7Z7nN6Iwqhu4gR6rKeJ1nA8UJ/gZo8IkvVMIz3e0DE+xrr2hUmuATl8x7wT9pD+asJJrE/2w==
X-Received: by 2002:a5d:6487:0:b0:221:7dcb:7cc0 with SMTP id
 o7-20020a5d6487000000b002217dcb7cc0mr10799011wri.365.1660079926006; 
 Tue, 09 Aug 2022 14:18:46 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d4dc7000000b0022377df817fsm392198wru.58.2022.08.09.14.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 14:18:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 23:18:37 +0200
Message-Id: <20220809211837.2549340-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=v3QIyYmN+yjJepllyqNt/b6PXp3r/JRBeTpZGdvMoho=;
 b=g2dnCeTq45z3iJARSqilVxyLovnPiKQshoGXfjfh7CQYXoSWf1VETScjsURw9b+kmF
 dgv/OegPrDkNQ+5I+lk0/Hp7zAp90Bqb7YJ/RYZWLNpGOqrY2IpBO6Gi0IpbFfUQCfFl
 ed5GtMcOGT8Ijvj6zRgzvBUpzs+CZp5gSkAGiGSiPa+V2k42jW8J1V7ElHJSqLfpOf02
 nNM5IvSzUHIwo9oA/PzYyRDddajE5EK77maBpcsPkllAJ4ai+8moelOj9KBsrquk9xoU
 PxsruAYrchjSzMCDyoNLidXwersDUQwYntNWKCWXhuo1IaQS5OSX4qzQ7IgBtE4jfk0w
 ruXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=g2dnCeTq
Subject: [Buildroot] [PATCH 1/1] package/glog: fix build without threads
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without threads raised since bump to
version 0.6.0 in commit 017dbc770c4fd58d7d52cf290dd3fc39a3603e0d and
https://github.com/google/glog/commit/4a4331f2f2de4c35ce72badf0bdc604c04eebb26:

CMake Error at /home/giuliobenetti/autobuild/run/instance-1/output-1/build/glog-0.6.0/CMakeFiles/CMakeTmp/CMakeLists.txt:18 (add_executable):
  Target "cmTC_ed950" links to target "Threads::Threads" but the target was
  not found.  Perhaps a find_package() call is missing for an IMPORTED
  target, or an ALIAS target is missing?

Fixes:
 - http://autobuild.buildroot.org/results/bf0846a51da69169286c7af38089d204d3d242d1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../glog/0001-added-emscripten-support.patch  | 290 ++++++++++++++++++
 1 file changed, 290 insertions(+)
 create mode 100644 package/glog/0001-added-emscripten-support.patch

diff --git a/package/glog/0001-added-emscripten-support.patch b/package/glog/0001-added-emscripten-support.patch
new file mode 100644
index 0000000000..d47085bc28
--- /dev/null
+++ b/package/glog/0001-added-emscripten-support.patch
@@ -0,0 +1,290 @@
+From 6ed0c9e58b11680779c571996a3007bd972e0853 Mon Sep 17 00:00:00 2001
+From: Sergiu Deitsch <sergiud@users.noreply.github.com>
+Date: Thu, 4 Aug 2022 22:52:47 +0200
+Subject: [PATCH] added emscripten support (#846)
+
+[Retrieved from:
+https://github.com/google/glog/commit/6ed0c9e58b11680779c571996a3007bd972e0853]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ .github/workflows/emscripten.yml | 60 ++++++++++++++++++++++++++++++++
+ CMakeLists.txt                   | 14 ++++----
+ src/config.h.cmake.in            |  6 ++--
+ src/glog/logging.h.in            |  6 ++--
+ src/glog/platform.h              |  2 ++
+ src/logging.cc                   | 11 ++++--
+ src/raw_logging.cc               |  9 ++---
+ src/stacktrace_unwind-inl.h      |  2 +-
+ src/symbolize.cc                 |  2 +-
+ src/utilities.h                  |  2 +-
+ 10 files changed, 93 insertions(+), 21 deletions(-)
+ create mode 100644 .github/workflows/emscripten.yml
+
+diff --git a/.github/workflows/emscripten.yml b/.github/workflows/emscripten.yml
+new file mode 100644
+index 00000000..566c67eb
+--- /dev/null
++++ b/.github/workflows/emscripten.yml
+@@ -0,0 +1,60 @@
++name: Emscripten
++
++on: [push, pull_request]
++
++jobs:
++  build-linux:
++    defaults:
++      run:
++        shell: bash
++    name: Emscripten-C++${{matrix.std}}-${{matrix.build_type}}-${{matrix.lib}}-${{matrix.extra}}
++    runs-on: ubuntu-latest
++    container: emscripten/emsdk
++    strategy:
++      fail-fast: true
++      matrix:
++        build_type: [Release, Debug]
++        extra: [no-custom-prefix, custom-prefix]
++        lib: [static]
++        std: [98, 11, 14, 17, 20]
++
++    steps:
++      - uses: actions/checkout@v2
++
++      - name: Setup Dependencies
++        run: |
++          apt-get update
++          DEBIAN_FRONTEND=noninteractive sudo apt-get install -y \
++            cmake \
++            ninja-build
++
++      - name: Setup C++98 Environment
++        if: matrix.std == '98'
++        run: |
++          echo 'CXXFLAGS=-Wno-error=variadic-macros -Wno-error=long-long ${{env.CXXFLAGS}}' >> $GITHUB_ENV
++
++      - name: Configure
++        env:
++          CXXFLAGS: -Wall -Wextra -Wsign-conversion -Wtautological-compare -Wformat-nonliteral -Wundef -Werror -Wno-error=wasm-exception-spec ${{env.CXXFLAGS}}
++        run: |
++          cmake -S . -B build_${{matrix.build_type}} \
++            -DBUILD_SHARED_LIBS=${{matrix.lib == 'shared'}} \
++            -DCMAKE_AR=$(which emar) \
++            -DCMAKE_C_COMPILER=$(which emcc) \
++            -DCMAKE_CXX_COMPILER=$(which em++) \
++            -DCMAKE_CXX_STANDARD=${{matrix.std}} \
++            -DCMAKE_CXX_STANDARD_REQUIRED=ON \
++            -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
++            -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
++            -DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE=ONLY \
++            -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER \
++            -DCMAKE_INSTALL_PREFIX=${{github.workspace}}/install \
++            -DCMAKE_RANLIB=$(which emranlib) \
++            -DWITH_CUSTOM_PREFIX=${{matrix.extra == 'custom-prefix'}} \
++            -G Ninja \
++            -Werror
++
++      - name: Build
++        run: |
++          cmake --build build_${{matrix.build_type}} \
++                --config ${{matrix.build_type}}
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 643a8b8a..ce6daa40 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -93,11 +93,11 @@ find_package (Unwind)
+ if (Unwind_FOUND)
+   set (HAVE_LIB_UNWIND 1)
+ else (Unwind_FOUND)
+-  check_include_file_cxx (unwind.h HAVE_UNWIND_H)
+   # Check whether linking actually succeeds. ARM toolchains of LLVM unwind
+   # implementation do not necessarily provide the _Unwind_Backtrace function
+   # which causes the previous check to succeed but the linking to fail.
+   check_cxx_symbol_exists (_Unwind_Backtrace unwind.h HAVE__UNWIND_BACKTRACE)
++  check_cxx_symbol_exists (_Unwind_GetIP unwind.h HAVE__UNWIND_GETIP)
+ endif (Unwind_FOUND)
+ 
+ check_include_file_cxx (dlfcn.h HAVE_DLFCN_H)
+@@ -197,9 +197,10 @@ int main(void)
+ }
+ " HAVE___SYNC_VAL_COMPARE_AND_SWAP)
+ 
+-cmake_push_check_state (RESET)
+-set (CMAKE_REQUIRED_LIBRARIES Threads::Threads)
+-check_cxx_source_compiles ("
++if (Threads_FOUND)
++  cmake_push_check_state (RESET)
++  set (CMAKE_REQUIRED_LIBRARIES Threads::Threads)
++  check_cxx_source_compiles ("
+ #define _XOPEN_SOURCE 500
+ #include <pthread.h>
+ int main(void)
+@@ -209,8 +210,9 @@ int main(void)
+   pthread_rwlock_rdlock(&l);
+   return 0;
+ }
+-" HAVE_RWLOCK)
+-cmake_pop_check_state ()
++  " HAVE_RWLOCK)
++  cmake_pop_check_state ()
++endif (Threads_FOUND)
+ 
+ check_cxx_source_compiles ("
+ __declspec(selectany) int a;
+diff --git a/src/config.h.cmake.in b/src/config.h.cmake.in
+index b67e8a77..20b5f1c4 100644
+--- a/src/config.h.cmake.in
++++ b/src/config.h.cmake.in
+@@ -118,12 +118,12 @@
+ /* Define to 1 if you have the <unistd.h> header file. */
+ #cmakedefine HAVE_UNISTD_H ${HAVE_UNISTD_H}
+ 
+-/* Define if you have the <unwind.h> header file. */
+-#cmakedefine HAVE_UNWIND_H
+-
+ /* Define if you linking to _Unwind_Backtrace is possible. */
+ #cmakedefine HAVE__UNWIND_BACKTRACE
+ 
++/* Define if you linking to _Unwind_GetIP is possible. */
++#cmakedefine HAVE__UNWIND_GETIP
++
+ /* define if the compiler supports using expression for operator */
+ #cmakedefine HAVE_USING_OPERATOR
+ 
+diff --git a/src/glog/logging.h.in b/src/glog/logging.h.in
+index c6def152..098e28fe 100644
+--- a/src/glog/logging.h.in
++++ b/src/glog/logging.h.in
+@@ -97,7 +97,7 @@
+ 
+ @ac_google_start_namespace@
+ 
+-#if @ac_cv_have_uint16_t@      // the C99 format
++#if @ac_cv_have_stdint_h@      // the C99 format
+ typedef int32_t int32;
+ typedef uint32_t uint32;
+ typedef int64_t int64;
+@@ -1822,8 +1822,8 @@ GLOG_EXPORT void SetEmailLogging(LogSeverity min_severity,
+ 
+ // A simple function that sends email. dest is a commma-separated
+ // list of addressess.  Thread-safe.
+-GLOG_EXPORT bool SendEmail(const char *dest,
+-                                    const char *subject, const char *body);
++GLOG_EXPORT bool SendEmail(const char* dest, const char* subject,
++                           const char* body);
+ 
+ GLOG_EXPORT const std::vector<std::string>& GetLoggingDirectories();
+ 
+diff --git a/src/glog/platform.h b/src/glog/platform.h
+index e6144119..7893c45d 100644
+--- a/src/glog/platform.h
++++ b/src/glog/platform.h
+@@ -50,6 +50,8 @@
+ #define GLOG_OS_NETBSD
+ #elif defined(__OpenBSD__)
+ #define GLOG_OS_OPENBSD
++#elif defined(__EMSCRIPTEN__)
++#define GLOG_OS_EMSCRIPTEN
+ #else
+ // TODO(hamaji): Add other platforms.
+ #error Platform not supported by glog. Please consider to contribute platform information by submitting a pull request on Github.
+diff --git a/src/logging.cc b/src/logging.cc
+index e65e80e9..1df1034a 100644
+--- a/src/logging.cc
++++ b/src/logging.cc
+@@ -2188,6 +2188,7 @@ void SetExitOnDFatal(bool value) {
+ }  // namespace internal
+ }  // namespace base
+ 
++#ifndef GLOG_OS_EMSCRIPTEN
+ // Shell-escaping as we need to shell out ot /bin/mail.
+ static const char kDontNeedShellEscapeChars[] =
+             "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
+@@ -2222,14 +2223,14 @@ static string ShellEscape(const string& src) {
+   }
+   return result;
+ }
+-
++#endif
+ 
+ // use_logging controls whether the logging functions LOG/VLOG are used
+ // to log errors.  It should be set to false when the caller holds the
+ // log_mutex.
+ static bool SendEmailInternal(const char*dest, const char *subject,
+                               const char*body, bool use_logging) {
+-#ifndef __EMSCRIPTEN__
++#ifndef GLOG_OS_EMSCRIPTEN
+   if (dest && *dest) {
+     if ( use_logging ) {
+       VLOG(1) << "Trying to send TITLE:" << subject
+@@ -2275,6 +2276,12 @@ static bool SendEmailInternal(const char*dest, const char *subject,
+       }
+     }
+   }
++#else
++  (void)dest;
++  (void)subject;
++  (void)body;
++  (void)use_logging;
++  LOG(WARNING) << "Email support not available; not sending message";
+ #endif
+   return false;
+ }
+diff --git a/src/raw_logging.cc b/src/raw_logging.cc
+index 43159832..befeac89 100644
+--- a/src/raw_logging.cc
++++ b/src/raw_logging.cc
+@@ -59,11 +59,12 @@
+ # include <unistd.h>
+ #endif
+ 
+-#if (defined(HAVE_SYSCALL_H) || defined(HAVE_SYS_SYSCALL_H)) && (!(defined(GLOG_OS_MACOSX)))
+-# define safe_write(fd, s, len)  syscall(SYS_write, fd, s, len)
++#if (defined(HAVE_SYSCALL_H) || defined(HAVE_SYS_SYSCALL_H)) && \
++    (!(defined(GLOG_OS_MACOSX))) && !defined(GLOG_OS_EMSCRIPTEN)
++#define safe_write(fd, s, len) syscall(SYS_write, fd, s, len)
+ #else
+-  // Not so safe, but what can you do?
+-# define safe_write(fd, s, len)  write(fd, s, len)
++// Not so safe, but what can you do?
++#define safe_write(fd, s, len) write(fd, s, len)
+ #endif
+ 
+ _START_GOOGLE_NAMESPACE_
+diff --git a/src/stacktrace_unwind-inl.h b/src/stacktrace_unwind-inl.h
+index fbb5f988..dc1665b4 100644
+--- a/src/stacktrace_unwind-inl.h
++++ b/src/stacktrace_unwind-inl.h
+@@ -73,7 +73,7 @@ static _Unwind_Reason_Code GetOneFrame(struct _Unwind_Context *uc, void *opq) {
+   if (targ->skip_count > 0) {
+     targ->skip_count--;
+   } else {
+-    targ->result[targ->count++] = (void *) _Unwind_GetIP(uc);
++    targ->result[targ->count++] = reinterpret_cast<void *>(_Unwind_GetIP(uc));
+   }
+ 
+   if (targ->count == targ->max_depth) {
+diff --git a/src/symbolize.cc b/src/symbolize.cc
+index 51025018..f56e97c9 100644
+--- a/src/symbolize.cc
++++ b/src/symbolize.cc
+@@ -834,7 +834,7 @@ static ATTRIBUTE_NOINLINE bool SymbolizeAndDemangle(void *pc, char *out,
+ 
+ _END_GOOGLE_NAMESPACE_
+ 
+-#elif defined(GLOG_OS_MACOSX) && defined(HAVE_DLADDR)
++#elif (defined(GLOG_OS_MACOSX) || defined(GLOG_OS_EMSCRIPTEN)) && defined(HAVE_DLADDR)
+ 
+ #include <dlfcn.h>
+ #include <cstring>
+diff --git a/src/utilities.h b/src/utilities.h
+index bd0ec632..760c142c 100644
+--- a/src/utilities.h
++++ b/src/utilities.h
+@@ -88,7 +88,7 @@
+ 
+ #if defined(HAVE_LIB_UNWIND)
+ # define STACKTRACE_H "stacktrace_libunwind-inl.h"
+-#elif defined(HAVE__UNWIND_BACKTRACE)
++#elif defined(HAVE__UNWIND_BACKTRACE) && defined(HAVE__UNWIND_GETIP)
+ # define STACKTRACE_H "stacktrace_unwind-inl.h"
+ #elif !defined(NO_FRAME_POINTER)
+ # if defined(__i386__) && __GNUC__ >= 2
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
