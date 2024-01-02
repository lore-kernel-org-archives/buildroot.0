Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E12C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14D7A40A66;
	Tue,  2 Jan 2024 22:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14D7A40A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7iVQOt59el-x; Tue,  2 Jan 2024 22:20:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD2AB40A7E;
	Tue,  2 Jan 2024 22:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD2AB40A7E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F35EC1BF276
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB727404C2
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB727404C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZKo_sNNiP2cR for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:20:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01E11400CB
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01E11400CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E108783D7F; Tue,  2 Jan 2024 22:19:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 23:17:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a8065ebe20607d659af5e25a3b8220606d606ab
X-Git-Newrev: 74f401025d7ffbc5be9191b9c31208e501759edb
X-Patchwork-Hint: ignore
Message-Id: <20240102221959.E108783D7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsigsegv: fix musl build with
 powerpc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=74f401025d7ffbc5be9191b9c31208e501759edb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure with powerpc raised since bump to
version 2.14 in commit c6addf4606c3a41cdad5c6ac4c6508b298b6e92a:

In file included from fault.h:36,
                 from handler-unix.c:77,
                 from handler.c:19:
handler-unix.c: In function 'sigsegv_handler':
fault-linux-powerpc.h:35:73: error: 'mcontext_t' has no member named 'uc_regs'; did you mean 'gregs'?
   35 | #  define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
      |                                                                         ^~~~~~~
handler-unix.c:157:43: note: in expansion of macro 'SIGSEGV_FAULT_STACKPOINTER'
  157 |           uintptr_t old_sp = (uintptr_t) (SIGSEGV_FAULT_STACKPOINTER);
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/77b600071f07605be3ec28e2da46d6938e240087

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...t-for-Linux-PowerPC-32-bit-with-musl-libc.patch | 114 +++++++++++++++++++++
 package/libsigsegv/0002-add-musl.m4.patch          |  47 +++++++++
 package/libsigsegv/libsigsegv.mk                   |   2 +
 3 files changed, 163 insertions(+)

diff --git a/package/libsigsegv/0001-Add-support-for-Linux-PowerPC-32-bit-with-musl-libc.patch b/package/libsigsegv/0001-Add-support-for-Linux-PowerPC-32-bit-with-musl-libc.patch
new file mode 100644
index 0000000000..dcc2f7c9cb
--- /dev/null
+++ b/package/libsigsegv/0001-Add-support-for-Linux-PowerPC-32-bit-with-musl-libc.patch
@@ -0,0 +1,114 @@
+From a6ff69873110c0a8ba6f7fd90532dbc11224828c Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Sun, 13 Mar 2022 15:04:06 +0100
+Subject: [PATCH] Add support for Linux/PowerPC (32-bit) with musl libc.
+
+Reported by Khem Raj <raj.khem@gmail.com> in
+<https://lists.gnu.org/archive/html/m4-patches/2022-03/msg00000.html>.
+
+* autogen.sh: Copy also musl.m4.
+* configure.ac: Invoke gl_MUSL_LIBC.
+* src/fault-linux-powerpc.h (SIGSEGV_FAULT_STACKPOINTER): In the 32-bit
+case, handle musl libc differently.
+* NEWS: Mention it.
+
+Upstream: https://git.savannah.gnu.org/gitweb/?p=libsigsegv.git;a=commit;h=a6ff69873110c0a8ba6f7fd90532dbc11224828c
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ChangeLog                 | 11 +++++++++++
+ NEWS                      |  4 ++++
+ autogen.sh                |  3 ++-
+ configure.ac              |  2 ++
+ src/fault-linux-powerpc.h | 27 ++++++++++++++++++++++-----
+ 5 files changed, 41 insertions(+), 6 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index c52b227..7c0a8fa 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,14 @@
++2022-03-13  Bruno Haible  <bruno@clisp.org>
++
++	Add support for Linux/PowerPC (32-bit) with musl libc.
++	Reported by Khem Raj <raj.khem@gmail.com> in
++	<https://lists.gnu.org/archive/html/m4-patches/2022-03/msg00000.html>.
++	* autogen.sh: Copy also musl.m4.
++	* configure.ac: Invoke gl_MUSL_LIBC.
++	* src/fault-linux-powerpc.h (SIGSEGV_FAULT_STACKPOINTER): In the 32-bit
++	case, handle musl libc differently.
++	* NEWS: Mention it.
++
+ 2022-01-07  Bruno Haible  <bruno@clisp.org>
+ 
+ 	Prepare for version 2.14.
+diff --git a/NEWS b/NEWS
+index 4d012f8..82cc0f4 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,3 +1,7 @@
++New in 2.15:
++
++* Added support for Linux/PowerPC (32-bit) with musl libc.
++
+ New in 2.14:
+ 
+ * Added support for 64-bit Cygwin.
+diff --git a/configure.ac b/configure.ac
+index e87f13b..164786f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -75,6 +75,8 @@ AC_MSG_RESULT([$sv_cv_host])
+ PLATFORM="$sv_cv_host"
+ AC_SUBST([PLATFORM])
+ 
++gl_MUSL_LIBC
++
+ dnl ========================== Done with PLATFORM ==========================
+ 
+ 
+diff --git a/src/fault-linux-powerpc.h b/src/fault-linux-powerpc.h
+index cba6ea7..b3f922a 100644
+--- a/src/fault-linux-powerpc.h
++++ b/src/fault-linux-powerpc.h
+@@ -1,5 +1,5 @@
+ /* Fault handler information.  Linux/PowerPC version when it supports POSIX.
+-   Copyright (C) 2002, 2009, 2017  Bruno Haible <bruno@clisp.org>
++   Copyright (C) 2002, 2009, 2017, 2022  Bruno Haible <bruno@clisp.org>
+ 
+    This program is free software: you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+@@ -28,10 +28,27 @@
+ #if defined(__powerpc64__) || defined(_ARCH_PPC64) /* 64-bit */
+ # define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gp_regs[1]
+ #else /* 32-bit */
+-/* both should be equivalent */
+-# if 0
+-#  define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.regs->gpr[1]
++# if MUSL_LIBC
++/* musl libc has a different structure of ucontext_t in
++   musl/arch/powerpc/bits/signal.h.  */
++/* The glibc comments say:
++     "Different versions of the kernel have stored the registers on signal
++      delivery at different offsets from the ucontext struct.  Programs should
++      thus use the uc_mcontext.uc_regs pointer to find where the registers are
++      actually stored."  */
++#  if 0
++#   define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gregs[1]
++#  else
++#   define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_regs->gregs[1]
++#  endif
+ # else
+-#  define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
++/* Assume the structure of ucontext_t in
++   glibc/sysdeps/unix/sysv/linux/powerpc/sys/ucontext.h.  */
++/* Because of the union, both definitions should be equivalent.  */
++#  if 0
++#   define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.regs->gpr[1]
++#  else
++#   define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
++#  endif
+ # endif
+ #endif
+-- 
+2.17.1
+
diff --git a/package/libsigsegv/0002-add-musl.m4.patch b/package/libsigsegv/0002-add-musl.m4.patch
new file mode 100644
index 0000000000..d6f06d8400
--- /dev/null
+++ b/package/libsigsegv/0002-add-musl.m4.patch
@@ -0,0 +1,47 @@
+From a9b07220b986500cfee7777a543494d360964306 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 2 Jan 2024 21:39:24 +0100
+Subject: [PATCH] add musl.m4
+
+Add musl.m4 (retrieved from
+https://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=blob;f=m4/musl.m4;h=34d2c1ff22a148eeb76936410ac497d68b228f59;hb=HEAD)
+
+musl.m4 is needed for gl_MUSL_LIBC since
+https://git.savannah.gnu.org/gitweb/?p=libsigsegv.git;a=commit;h=a6ff69873110c0a8ba6f7fd90532dbc11224828c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: sent to Bruno Haible <bruno@clisp.org>
+---
+ m4/musl.m4 | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+ create mode 100644 m4/musl.m4
+
+diff --git a/m4/musl.m4 b/m4/musl.m4
+new file mode 100644
+index 0000000..34d2c1f
+--- /dev/null
++++ b/m4/musl.m4
+@@ -0,0 +1,20 @@
++# musl.m4 serial 4
++dnl Copyright (C) 2019-2024 Free Software Foundation, Inc.
++dnl This file is free software; the Free Software Foundation
++dnl gives unlimited permission to copy and/or distribute it,
++dnl with or without modifications, as long as this notice is preserved.
++
++# Test for musl libc, despite the musl libc authors don't like it
++# <https://wiki.musl-libc.org/faq.html>
++# <https://lists.gnu.org/archive/html/bug-gnulib/2018-02/msg00079.html>.
++# From Bruno Haible.
++
++AC_DEFUN_ONCE([gl_MUSL_LIBC],
++[
++  AC_REQUIRE([AC_CANONICAL_HOST])
++  case "$host_os" in
++    *-musl* | midipix*)
++      AC_DEFINE([MUSL_LIBC], [1], [Define to 1 on musl libc.])
++      ;;
++  esac
++])
+-- 
+2.43.0
+
diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
index 98bcd55c8c..0d5875aa95 100644
--- a/package/libsigsegv/libsigsegv.mk
+++ b/package/libsigsegv/libsigsegv.mk
@@ -10,5 +10,7 @@ LIBSIGSEGV_INSTALL_STAGING = YES
 LIBSIGSEGV_CONF_ENV = sv_cv_fault_posix=yes
 LIBSIGSEGV_LICENSE = GPL-2.0+
 LIBSIGSEGV_LICENSE_FILES = COPYING
+# We're patching configure.ac
+LIBSIGSEGV_AUTORECONF = YES
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
