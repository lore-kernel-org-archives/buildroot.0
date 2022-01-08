Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA254C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5549540185;
	Sat,  8 Jan 2022 22:06:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NJIVOAqtNJiX; Sat,  8 Jan 2022 22:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1387340256;
	Sat,  8 Jan 2022 22:06:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56FDF1BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 445F940232
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9uo_KwLdsNll for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:06:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 089C740185
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:06:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D4B4E82972; Sat,  8 Jan 2022 21:59:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 23:04:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6fc1b09211abc1c724e3665cec606c3bbdb209e
X-Git-Newrev: 3fac3b2b88574e605d713ac917024ba39d444563
X-Patchwork-Hint: ignore
Message-Id: <20220108215947.D4B4E82972@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/safeclib: fix build without
 stack-protector
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3fac3b2b88574e605d713ac917024ba39d444563
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without stack-protector raised since
bump to version 02092020 in commit
ebe808ac4071395b4d1e90d617c33a5e6e514af1 and
https://github.com/rurban/safeclib/commit/caa4408eb4a5c767f0474258af3b6ccf444e10aa:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: ../src/.libs/libsafec-3.6.0.a(safe_mem_constraint.o): in function `handle_mem_bos_chk_warn':
safe_mem_constraint.c:(.text+0x40): undefined reference to `__stack_chk_guard'

If stack-protector is enabled in the Buildroot config, the toolchain
wrapper will make sure it is used, so there's no need for the safeclib
configure to handle it.

Fixes:
 - http://autobuild.buildroot.org/results/a481ee2d26a094358b0298617cce691be3077f22

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: add comment explaining why this is done]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...configure.ac-add-disable-hardening-option.patch | 63 ++++++++++++++++++++++
 package/safeclib/safeclib.mk                       |  5 ++
 2 files changed, 68 insertions(+)

diff --git a/package/safeclib/0001-configure.ac-add-disable-hardening-option.patch b/package/safeclib/0001-configure.ac-add-disable-hardening-option.patch
new file mode 100644
index 0000000000..e851fce993
--- /dev/null
+++ b/package/safeclib/0001-configure.ac-add-disable-hardening-option.patch
@@ -0,0 +1,63 @@
+From 94c612016834d7bdc2b721ff5f4f5e158bda6fdd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 8 Jan 2022 21:49:22 +0100
+Subject: [PATCH] configure.ac: add --disable-hardening option
+
+Allow the user to disable hardening which is enabled by default since
+version 02092020 and
+https://github.com/rurban/safeclib/commit/caa4408eb4a5c767f0474258af3b6ccf444e10aa
+to avoid the following build failure when the toolchain doesn't support
+stack-protector:
+
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: ../src/.libs/libsafec-3.6.0.a(safe_mem_constraint.o): in function `handle_mem_bos_chk_warn':
+safe_mem_constraint.c:(.text+0x40): undefined reference to `__stack_chk_guard'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a481ee2d26a094358b0298617cce691be3077f22
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/rurban/safeclib/pull/107]
+---
+ configure.ac | 27 +++++++++++++++++++--------
+ 1 file changed, 19 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 55756b06..f852ed44 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -383,6 +383,21 @@ AC_ARG_ENABLE(debug-build,
+ 	esac], [enable_debug_build=false ])
+ AM_CONDITIONAL(ENABLE_DEBUG_BUILD, test "x$enable_debug_build" = "xtrue")
+ 
++AC_ARG_ENABLE(hardening,
++	AS_HELP_STRING([--disable-hardening],
++	               [disable hardening @<:@default=no@:>@]),
++	[case "${enableval}" in
++	yes) enable_hardening=true ;;
++	no)  enable_hardening=false ;;
++	*)   AC_MSG_ERROR([bad value ${enableval} for --enable-hardening]) ;;
++	esac], [enable_hardening=true])
++
++if test "x$enable_hardening" = "xtrue" ; then
++	AX_APPEND_COMPILE_FLAGS([-fstack-protector-strong -fstack-clash-protection -fcf-protection],
++                         [WARN_CFLAGS],[$ax_ccf_err])
++	AX_APPEND_LINK_FLAGS([-fstack-protector-strong -fstack-clash-protection -fcf-protection],
++                         [WARN_LDFLAGS],[$ax_ccf_err])
++fi
+ 
+ AC_MSG_NOTICE([Check programs])
+ # ===============================================
+@@ -543,10 +562,6 @@ case $host_os in
+        [],[$ax_ccf_err])
+     ;;
+ esac
+-AX_APPEND_COMPILE_FLAGS([-fstack-protector-strong -fstack-clash-protection -fcf-protection],
+-                         [WARN_CFLAGS],[$ax_ccf_err])
+-AX_APPEND_LINK_FLAGS([-fstack-protector-strong -fstack-clash-protection -fcf-protection],
+-                         [WARN_LDFLAGS],[$ax_ccf_err])
+ 
+ if test x$ax_cv_check_cflags__Wrestrict = xyes; then
+    AC_DEFINE([HAVE_WARNING_RESTRICT], 1, [Have -Wrestrict])
+-- 
+2.34.1
+
diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
index 032a73bf67..29ffea7f2e 100644
--- a/package/safeclib/safeclib.mk
+++ b/package/safeclib/safeclib.mk
@@ -11,5 +11,10 @@ SAFECLIB_SOURCE = libsafec-$(SAFECLIB_VERSION).tar.xz
 SAFECLIB_LICENSE = MIT
 SAFECLIB_LICENSE_FILES = COPYING
 SAFECLIB_INSTALL_STAGING = YES
+# We're patching configure.ac
+SAFECLIB_AUTORECONF = YES
+# -fstack-protector-strong is used by default. Disable that so the
+# BR2_SSP_* options in the toolchain wrapper are used instead
+SAFECLIB_CONF_OPTS = --disable-hardening
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
