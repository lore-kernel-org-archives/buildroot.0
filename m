Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85479C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02AA1503FC;
	Fri, 28 Feb 2025 17:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mjt_qctC8TMN; Fri, 28 Feb 2025 17:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 306BE4FB35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 306BE4FB35;
	Fri, 28 Feb 2025 17:00:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07E9E68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 242B1424E1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJewRZeFOKJY for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3B3442E26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3B3442E26
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC6E084109; Fri, 28 Feb 2025 16:30:13 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 19:13:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 027c9ce67ca21409faed9f9add7222cb3e5ba4d4
X-Git-Newrev: ea55aa2819c83dc384131b6ca44ffbf997726f2c
X-Patchwork-Hint: ignore
Message-Id: <20250228163013.BC6E084109@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/xen: fix build for gcc
 14 and aarch64
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6446478858673241666=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6446478858673241666==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ea55aa2819c83dc384131b6ca44ffbf997726f2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Backport two commits from upstream Xen to fix the build for AArch64
with gcc 14.

This repairs the tests.package.test_xen.TestXen runtime test
introduced in [1], which uses an external AArch64 toolchain that has
been upgraded to gcc 14 in [2].

Fixes:
    utils/docker-run support/testing/run-tests \
        -d dl -o output_folder -s \
        tests.package.test_xen
    ...
    checking for openpty et al... configure: error: in '/build/xen-4.14.6/tools':
    configure: error: Unable to find library for openpty and login_tty

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/055f82ebbd07b582c992eed30ef5191f18873ba4
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/e5a965a648adfc0bcd571fed04ee50b2ec3ebd29

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Cc: Alistair Francis <alistair@alistair23.me>
[Julien:
  - fix "make check-package" errors
  - add info in the commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...tools-drop-bogus-and-obsolete-ptyfuncs.m4.patch | 253 +++++++++++++++++++++
 ...ust-__irq_to_desc-to-fix-build-with-gcc14.patch |  62 +++++
 2 files changed, 315 insertions(+)

diff --git a/package/xen/0005-tools-drop-bogus-and-obsolete-ptyfuncs.m4.patch b/package/xen/0005-tools-drop-bogus-and-obsolete-ptyfuncs.m4.patch
new file mode 100644
index 0000000000..ce13f454f3
--- /dev/null
+++ b/package/xen/0005-tools-drop-bogus-and-obsolete-ptyfuncs.m4.patch
@@ -0,0 +1,253 @@
+From 13a088627ae0c99f6c7c763ce0883dc804b54b66 Mon Sep 17 00:00:00 2001
+From: Olaf Hering <olaf@aepfle.de>
+Date: Fri, 12 May 2023 12:26:14 +0000
+Subject: [PATCH] tools: drop bogus and obsolete ptyfuncs.m4
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+According to openpty(3) it is required to include <pty.h> to get the
+prototypes for openpty() and login_tty(). But this is not what the
+function AX_CHECK_PTYFUNCS actually does. It makes no attempt to include
+the required header.
+
+The two source files which call openpty() and login_tty() already contain
+the conditionals to include the required header.
+
+Remove the bogus m4 file to fix build with clang, which complains about
+calls to undeclared functions.
+
+Remove usage of INCLUDE_LIBUTIL_H in libxl_bootloader.c, it is already
+covered by inclusion of libxl_osdep.h.
+
+Remove usage of PTYFUNCS_LIBS in libxl/Makefile, it is already covered
+by UTIL_LIBS from config/StdGNU.mk.
+
+Signed-off-by: Olaf Hering <olaf@aepfle.de>
+Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
+[Vincent: backported to 4.14.6]
+Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
+Upstream: https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=42abf5b9c53eb1b1a902002fcda68708234152c3
+---
+ config/Tools.mk.in             |  2 -
+ m4/ptyfuncs.m4                 | 35 -----------------
+ tools/config.h.in              |  3 --
+ tools/configure                | 68 ----------------------------------
+ tools/configure.ac             |  2 -
+ tools/libxl/Makefile           |  2 +-
+ tools/libxl/libxl_bootloader.c |  4 --
+ 7 files changed, 1 insertion(+), 115 deletions(-)
+ delete mode 100644 m4/ptyfuncs.m4
+
+diff --git a/config/Tools.mk.in b/config/Tools.mk.in
+index 23df47af8d..4971c3f526 100644
+--- a/config/Tools.mk.in
++++ b/config/Tools.mk.in
+@@ -31,8 +31,6 @@ PTHREAD_CFLAGS      := @PTHREAD_CFLAGS@
+ PTHREAD_LDFLAGS     := @PTHREAD_LDFLAGS@
+ PTHREAD_LIBS        := @PTHREAD_LIBS@
+ 
+-PTYFUNCS_LIBS       := @PTYFUNCS_LIBS@
+-
+ LIBNL3_LIBS         := @LIBNL3_LIBS@
+ LIBNL3_CFLAGS       := @LIBNL3_CFLAGS@
+ XEN_TOOLS_RPATH     := @rpath@
+diff --git a/m4/ptyfuncs.m4 b/m4/ptyfuncs.m4
+deleted file mode 100644
+index 3e37b5a23c..0000000000
+--- a/m4/ptyfuncs.m4
++++ /dev/null
+@@ -1,35 +0,0 @@
+-AC_DEFUN([AX_CHECK_PTYFUNCS], [
+-    dnl This is a workaround for a bug in Debian package
+-    dnl libbsd-dev-0.3.0-1. Once we no longer support that
+-    dnl package we can remove the addition of -Werror to
+-    dnl CPPFLAGS.
+-    AX_SAVEVAR_SAVE(CPPFLAGS)
+-    CPPFLAGS="$CPPFLAGS -Werror"
+-    AC_CHECK_HEADER([libutil.h],[
+-      AC_DEFINE([INCLUDE_LIBUTIL_H],[<libutil.h>],[libutil header file name])
+-    ])
+-    AX_SAVEVAR_RESTORE(CPPFLAGS)
+-    AC_CACHE_CHECK([for openpty et al], [ax_cv_ptyfuncs_libs], [
+-        for ax_cv_ptyfuncs_libs in -lutil "" NOT_FOUND; do
+-            if test "x$ax_cv_ptyfuncs_libs" = "xNOT_FOUND"; then
+-                AC_MSG_FAILURE([Unable to find library for openpty and login_tty])
+-            fi
+-            AX_SAVEVAR_SAVE(LIBS)
+-            LIBS="$LIBS $ax_cv_ptyfuncs_libs"
+-            AC_LINK_IFELSE([AC_LANG_SOURCE([
+-#ifdef INCLUDE_LIBUTIL_H
+-#include INCLUDE_LIBUTIL_H
+-#endif
+-int main(void) {
+-  openpty(0,0,0,0,0);
+-  login_tty(0);
+-}
+-])],[
+-                break
+-            ],[])
+-            AX_SAVEVAR_RESTORE(LIBS)
+-        done
+-    ])
+-    PTYFUNCS_LIBS="$ax_cv_ptyfuncs_libs"
+-    AC_SUBST(PTYFUNCS_LIBS)
+-])
+diff --git a/tools/config.h.in b/tools/config.h.in
+index 5abf6092de..6b9a479928 100644
+--- a/tools/config.h.in
++++ b/tools/config.h.in
+@@ -87,9 +87,6 @@
+ /* Define extfs header to use */
+ #undef INCLUDE_EXTFS_H
+ 
+-/* libutil header file name */
+-#undef INCLUDE_LIBUTIL_H
+-
+ /* IPXE path */
+ #undef IPXE_PATH
+ 
+diff --git a/tools/configure b/tools/configure
+index cf937c9b7a..5102297210 100755
+--- a/tools/configure
++++ b/tools/configure
+@@ -636,7 +636,6 @@ LIBNL3_LIBS
+ LIBNL3_CFLAGS
+ argp_ldflags
+ libiconv
+-PTYFUNCS_LIBS
+ PTHREAD_LIBS
+ PTHREAD_LDFLAGS
+ PTHREAD_CFLAGS
+@@ -3739,8 +3738,6 @@ esac
+ 
+ 
+ 
+-
+-
+ # Fetched from http://git.savannah.gnu.org/gitweb/?p=autoconf-archive.git;a=blob_plain;f=m4/ax_compare_version.m4
+ # Commit ID: 27948f49ca30e4222bb7cdd55182bd7341ac50c5
+ # ===========================================================================
+@@ -8871,71 +8868,6 @@ $as_echo "$ax_cv_pthread_flags" >&6; }
+ 
+ 
+ 
+-
+-
+-    saved_CPPFLAGS="$CPPFLAGS"
+-
+-    CPPFLAGS="$CPPFLAGS -Werror"
+-    ac_fn_c_check_header_mongrel "$LINENO" "libutil.h" "ac_cv_header_libutil_h" "$ac_includes_default"
+-if test "x$ac_cv_header_libutil_h" = xyes; then :
+-
+-
+-$as_echo "#define INCLUDE_LIBUTIL_H <libutil.h>" >>confdefs.h
+-
+-
+-fi
+-
+-
+-
+-    CPPFLAGS="$saved_CPPFLAGS"
+-
+-    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for openpty et al" >&5
+-$as_echo_n "checking for openpty et al... " >&6; }
+-if ${ax_cv_ptyfuncs_libs+:} false; then :
+-  $as_echo_n "(cached) " >&6
+-else
+-
+-        for ax_cv_ptyfuncs_libs in -lutil "" NOT_FOUND; do
+-            if test "x$ax_cv_ptyfuncs_libs" = "xNOT_FOUND"; then
+-                { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "Unable to find library for openpty and login_tty
+-See \`config.log' for more details" "$LINENO" 5; }
+-            fi
+-
+-    saved_LIBS="$LIBS"
+-
+-            LIBS="$LIBS $ax_cv_ptyfuncs_libs"
+-            cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-
+-#ifdef INCLUDE_LIBUTIL_H
+-#include INCLUDE_LIBUTIL_H
+-#endif
+-int main(void) {
+-  openpty(0,0,0,0,0);
+-  login_tty(0);
+-}
+-
+-_ACEOF
+-if ac_fn_c_try_link "$LINENO"; then :
+-
+-                break
+-
+-fi
+-rm -f core conftest.err conftest.$ac_objext \
+-    conftest$ac_exeext conftest.$ac_ext
+-
+-    LIBS="$saved_LIBS"
+-
+-        done
+-
+-fi
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_ptyfuncs_libs" >&5
+-$as_echo "$ax_cv_ptyfuncs_libs" >&6; }
+-    PTYFUNCS_LIBS="$ax_cv_ptyfuncs_libs"
+-
+-
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for yajl_alloc in -lyajl" >&5
+ $as_echo_n "checking for yajl_alloc in -lyajl... " >&6; }
+ if ${ac_cv_lib_yajl_yajl_alloc+:} false; then :
+diff --git a/tools/configure.ac b/tools/configure.ac
+index 1808cffafb..9e5cf3aae0 100644
+--- a/tools/configure.ac
++++ b/tools/configure.ac
+@@ -67,7 +67,6 @@ m4_include([../m4/uuid.m4])
+ m4_include([../m4/pkg.m4])
+ m4_include([../m4/curses.m4])
+ m4_include([../m4/pthread.m4])
+-m4_include([../m4/ptyfuncs.m4])
+ m4_include([../m4/extfs.m4])
+ m4_include([../m4/fetcher.m4])
+ m4_include([../m4/ax_compare_version.m4])
+@@ -417,7 +416,6 @@ AC_SUBST(zlib)
+ AC_SUBST(system_aio)
+ AX_CHECK_EXTFS
+ AX_CHECK_PTHREAD
+-AX_CHECK_PTYFUNCS
+ AC_CHECK_LIB([yajl], [yajl_alloc], [],
+     [AC_MSG_ERROR([Could not find yajl])])
+ AC_CHECK_LIB([z], [deflateCopy], [], [AC_MSG_ERROR([Could not find zlib])])
+diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
+index 38cd43abae..0f09be1624 100644
+--- a/tools/libxl/Makefile
++++ b/tools/libxl/Makefile
+@@ -20,7 +20,7 @@ LIBUUID_LIBS += -luuid
+ endif
+ 
+ LIBXL_LIBS =
+-LIBXL_LIBS = $(LDLIBS_libxentoollog) $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenhypfs) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(PTYFUNCS_LIBS) $(LIBUUID_LIBS)
++LIBXL_LIBS = $(LDLIBS_libxentoollog) $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenhypfs) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(UTIL_LIBS) $(LIBUUID_LIBS)
+ ifeq ($(CONFIG_LIBNL),y)
+ LIBXL_LIBS += $(LIBNL3_LIBS)
+ endif
+diff --git a/tools/libxl/libxl_bootloader.c b/tools/libxl/libxl_bootloader.c
+index 18e9ebd714..1bc6e51827 100644
+--- a/tools/libxl/libxl_bootloader.c
++++ b/tools/libxl/libxl_bootloader.c
+@@ -19,10 +19,6 @@
+ #include <utmp.h>
+ #endif
+ 
+-#ifdef INCLUDE_LIBUTIL_H
+-#include INCLUDE_LIBUTIL_H
+-#endif
+-
+ #include "libxl_internal.h"
+ 
+ #define BOOTLOADER_BUF_OUT 65536
+-- 
+2.45.2
+
diff --git a/package/xen/0006-Arm64-adjust-__irq_to_desc-to-fix-build-with-gcc14.patch b/package/xen/0006-Arm64-adjust-__irq_to_desc-to-fix-build-with-gcc14.patch
new file mode 100644
index 0000000000..ea810ed3f8
--- /dev/null
+++ b/package/xen/0006-Arm64-adjust-__irq_to_desc-to-fix-build-with-gcc14.patch
@@ -0,0 +1,62 @@
+From a17dda1d2bf9c25b91f9e72625696cf26b32673a Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Thu, 29 Aug 2024 10:03:53 +0200
+Subject: [PATCH] Arm64: adjust __irq_to_desc() to fix build with gcc14
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With the original code I observe
+
+In function ‘__irq_to_desc’,
+    inlined from ‘route_irq_to_guest’ at arch/arm/irq.c:465:12:
+arch/arm/irq.c:54:16: error: array subscript -2 is below array bounds of ‘irq_desc_t[32]’ {aka ‘struct irq_desc[32]’} [-Werror=array-bounds=]
+   54 |         return &this_cpu(local_irq_desc)[irq];
+      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+which looks pretty bogus: How in the world does the compiler arrive at
+-2 when compiling route_irq_to_guest()? Yet independent of that the
+function's parameter wants to be of unsigned type anyway, as shown by
+a vast majority of callers (others use plain int when they really mean
+non-negative quantities). With that adjustment the code compiles fine
+again.
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Acked-by: Michal Orzel <michal.orzel@amd.com>
+[Vincent: backported to 4.14.6]
+Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
+Upstream: https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=99f942f3d410059dc223ee0a908827e928ef3592
+---
+ xen/arch/arm/irq.c        | 2 +-
+ xen/include/asm-arm/irq.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
+index 3877657a52..2862de00d9 100644
+--- a/xen/arch/arm/irq.c
++++ b/xen/arch/arm/irq.c
+@@ -66,7 +66,7 @@ hw_irq_controller no_irq_type = {
+ static irq_desc_t irq_desc[NR_IRQS];
+ static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
+ 
+-irq_desc_t *__irq_to_desc(int irq)
++irq_desc_t *__irq_to_desc(unsigned int irq)
+ {
+     if ( irq < NR_LOCAL_IRQS )
+         return &this_cpu(local_irq_desc)[irq];
+diff --git a/xen/include/asm-arm/irq.h b/xen/include/asm-arm/irq.h
+index e45d574598..33fbbadb34 100644
+--- a/xen/include/asm-arm/irq.h
++++ b/xen/include/asm-arm/irq.h
+@@ -57,7 +57,7 @@ extern const unsigned int nr_irqs;
+ struct irq_desc;
+ struct irqaction;
+ 
+-struct irq_desc *__irq_to_desc(int irq);
++struct irq_desc *__irq_to_desc(unsigned int irq);
+ 
+ #define irq_to_desc(irq)    __irq_to_desc(irq)
+ 
+-- 
+2.45.2
+

--===============6446478858673241666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6446478858673241666==--
