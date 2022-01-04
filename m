Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061D1C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE65A40971;
	Tue,  4 Jan 2022 18:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFCa6KEtMIom; Tue,  4 Jan 2022 18:11:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF44940977;
	Tue,  4 Jan 2022 18:11:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0FE31BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37A7B40236
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fufs1RRivj7o for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:09:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8941740955
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:09:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DFA4F82BA6; Tue,  4 Jan 2022 18:02:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 18:32:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c92ef3dd8f6b83c33d8e4fad2e2ac2d2a2d6a39
X-Git-Newrev: b72b849ad597810823ecf9efe471a40e2427c8e8
X-Patchwork-Hint: ignore
Message-Id: <20220104180256.DFA4F82BA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jose: bump to version 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=b72b849ad597810823ecf9efe471a40e2427c8e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to meson-package (and so drop second patch)
- Update indentation in hash file (two spaces)

https://github.com/latchset/jose/releases/tag/v11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...02-configure-fix-build-with-old-compilers.patch | 165 ---------------------
 package/jose/jose.hash                             |   4 +-
 package/jose/jose.mk                               |   8 +-
 3 files changed, 5 insertions(+), 172 deletions(-)

diff --git a/package/jose/0002-configure-fix-build-with-old-compilers.patch b/package/jose/0002-configure-fix-build-with-old-compilers.patch
deleted file mode 100644
index 0484f38f0d..0000000000
--- a/package/jose/0002-configure-fix-build-with-old-compilers.patch
+++ /dev/null
@@ -1,165 +0,0 @@
-From 98e9faa4d39cd5b6aaab882877e19ae394ba3810 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 20 Nov 2017 23:10:38 +0100
-Subject: [PATCH] configure: fix build with old compilers
-
-Old gcc versions (gcc 4.7) do not support all warnings flags currently
-hard-coded by configure.ac. In order to fix this, we import the
-AX_CHECK_COMPILE_FLAG() macro from the autoconf-archive, and use it in
-the configure.ac to only use warning flags when the compiler supports
-them.
-
-Submitted-upstream: https://github.com/latchset/jose/pull/51
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac                | 46 +++++++++++++++-------------
- m4/ax_check_compile_flag.m4 | 74 +++++++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 105 insertions(+), 22 deletions(-)
- create mode 100644 m4/ax_check_compile_flag.m4
-
-diff --git a/configure.ac b/configure.ac
-index cf8c9a6..6fe4ded 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,5 +1,6 @@
- AC_PREREQ(2.62)
- AC_INIT(jose, 10)
-+AC_CONFIG_MACRO_DIRS([m4])
- AC_CANONICAL_SYSTEM
- AC_PROG_CC_C99
- 
-@@ -18,27 +19,30 @@ PKG_CHECK_MODULES([libcrypto], [libcrypto >= 1.0.2])
- AC_OPENMP
- AC_SUBST([OPENMP_CFLAGS])
- 
--JOSE_CFLAGS="\
---Wall \
---Wextra \
---Werror \
---Wstrict-aliasing \
---Wchar-subscripts \
---Wformat-security \
---Wmissing-declarations \
---Wmissing-prototypes \
---Wnested-externs \
---Wpointer-arith \
---Wshadow \
---Wsign-compare \
---Wstrict-prototypes \
---Wtype-limits \
---Wunused-function \
---Wno-missing-field-initializers \
---Wno-unused-command-line-argument \
---Wno-unused-parameter \
---Wno-unknown-pragmas \
--"
-+for flag in \
-+    -Wall \
-+    -Wextra \
-+    -Werror \
-+    -Wstrict-aliasing \
-+    -Wchar-subscripts \
-+    -Wformat-security \
-+    -Wmissing-declarations \
-+    -Wmissing-prototypes \
-+    -Wnested-externs \
-+    -Wpointer-arith \
-+    -Wshadow \
-+    -Wsign-compare \
-+    -Wstrict-prototypes \
-+    -Wtype-limits \
-+    -Wunused-function \
-+    -Wno-missing-field-initializers \
-+    -Wno-unused-command-line-argument \
-+    -Wno-unused-parameter \
-+    -Wno-unknown-pragmas ; do
-+    AX_CHECK_COMPILE_FLAG([${flag}],
-+		[JOSE_CFLAGS="${JOSE_CFLAGS} ${flag}"])
-+done
-+
- AC_SUBST([JOSE_CFLAGS])
- 
- AC_MSG_CHECKING([for linker script support])
-diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
-new file mode 100644
-index 0000000..dcabb92
---- /dev/null
-+++ b/m4/ax_check_compile_flag.m4
-@@ -0,0 +1,74 @@
-+# ===========================================================================
-+#  https://www.gnu.org/software/autoconf-archive/ax_check_compile_flag.html
-+# ===========================================================================
-+#
-+# SYNOPSIS
-+#
-+#   AX_CHECK_COMPILE_FLAG(FLAG, [ACTION-SUCCESS], [ACTION-FAILURE], [EXTRA-FLAGS], [INPUT])
-+#
-+# DESCRIPTION
-+#
-+#   Check whether the given FLAG works with the current language's compiler
-+#   or gives an error.  (Warnings, however, are ignored)
-+#
-+#   ACTION-SUCCESS/ACTION-FAILURE are shell commands to execute on
-+#   success/failure.
-+#
-+#   If EXTRA-FLAGS is defined, it is added to the current language's default
-+#   flags (e.g. CFLAGS) when the check is done.  The check is thus made with
-+#   the flags: "CFLAGS EXTRA-FLAGS FLAG".  This can for example be used to
-+#   force the compiler to issue an error when a bad flag is given.
-+#
-+#   INPUT gives an alternative input source to AC_COMPILE_IFELSE.
-+#
-+#   NOTE: Implementation based on AX_CFLAGS_GCC_OPTION. Please keep this
-+#   macro in sync with AX_CHECK_{PREPROC,LINK}_FLAG.
-+#
-+# LICENSE
-+#
-+#   Copyright (c) 2008 Guido U. Draheim <guidod@gmx.de>
-+#   Copyright (c) 2011 Maarten Bosmans <mkbosmans@gmail.com>
-+#
-+#   This program is free software: you can redistribute it and/or modify it
-+#   under the terms of the GNU General Public License as published by the
-+#   Free Software Foundation, either version 3 of the License, or (at your
-+#   option) any later version.
-+#
-+#   This program is distributed in the hope that it will be useful, but
-+#   WITHOUT ANY WARRANTY; without even the implied warranty of
-+#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
-+#   Public License for more details.
-+#
-+#   You should have received a copy of the GNU General Public License along
-+#   with this program. If not, see <https://www.gnu.org/licenses/>.
-+#
-+#   As a special exception, the respective Autoconf Macro's copyright owner
-+#   gives unlimited permission to copy, distribute and modify the configure
-+#   scripts that are the output of Autoconf when processing the Macro. You
-+#   need not follow the terms of the GNU General Public License when using
-+#   or distributing such scripts, even though portions of the text of the
-+#   Macro appear in them. The GNU General Public License (GPL) does govern
-+#   all other use of the material that constitutes the Autoconf Macro.
-+#
-+#   This special exception to the GPL applies to versions of the Autoconf
-+#   Macro released by the Autoconf Archive. When you make and distribute a
-+#   modified version of the Autoconf Macro, you may extend this special
-+#   exception to the GPL to apply to your modified version as well.
-+
-+#serial 5
-+
-+AC_DEFUN([AX_CHECK_COMPILE_FLAG],
-+[AC_PREREQ(2.64)dnl for _AC_LANG_PREFIX and AS_VAR_IF
-+AS_VAR_PUSHDEF([CACHEVAR],[ax_cv_check_[]_AC_LANG_ABBREV[]flags_$4_$1])dnl
-+AC_CACHE_CHECK([whether _AC_LANG compiler accepts $1], CACHEVAR, [
-+  ax_check_save_flags=$[]_AC_LANG_PREFIX[]FLAGS
-+  _AC_LANG_PREFIX[]FLAGS="$[]_AC_LANG_PREFIX[]FLAGS $4 $1"
-+  AC_COMPILE_IFELSE([m4_default([$5],[AC_LANG_PROGRAM()])],
-+    [AS_VAR_SET(CACHEVAR,[yes])],
-+    [AS_VAR_SET(CACHEVAR,[no])])
-+  _AC_LANG_PREFIX[]FLAGS=$ax_check_save_flags])
-+AS_VAR_IF(CACHEVAR,yes,
-+  [m4_default([$2], :)],
-+  [m4_default([$3], :)])
-+AS_VAR_POPDEF([CACHEVAR])dnl
-+])dnl AX_CHECK_COMPILE_FLAGS
--- 
-2.13.6
-
diff --git a/package/jose/jose.hash b/package/jose/jose.hash
index 376bc0b585..128d26d163 100644
--- a/package/jose/jose.hash
+++ b/package/jose/jose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 5c9cdcfb535c4d9f781393d7530521c72b1dd81caa9934cab6dd752cc7efcd72  jose-10.tar.bz2
-sha256 09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  COPYING
+sha256  e272afe7717e22790c383f3164480627a567c714ccb80c1ee96f62c9929d8225  jose-11.tar.xz
+sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  COPYING
diff --git a/package/jose/jose.mk b/package/jose/jose.mk
index 2758d408da..8a60e20cc6 100644
--- a/package/jose/jose.mk
+++ b/package/jose/jose.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-JOSE_VERSION = 10
-JOSE_SOURCE = jose-$(JOSE_VERSION).tar.bz2
+JOSE_VERSION = 11
+JOSE_SOURCE = jose-$(JOSE_VERSION).tar.xz
 JOSE_SITE = https://github.com/latchset/jose/releases/download/v$(JOSE_VERSION)
 JOSE_LICENSE = Apache-2.0
 JOSE_LICENSE_FILES = COPYING
-# 0002-configure-fix-build-with-old-compilers.patch
-JOSE_AUTORECONF = YES
 JOSE_INSTALL_STAGING = YES
 JOSE_DEPENDENCIES = host-pkgconf zlib jansson openssl
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
