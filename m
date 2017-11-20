From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Nov 2017 23:22:53 +0100
Subject: [Buildroot] [git commit] jose: fix build with old compilers
Message-ID: <20171122201022.9CD0580E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47df95a73d24d0bfe4216b6fc53da17abbafa4fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds two patches to the jose package that fix the build
with old compilers such as gcc 4.7.

Fixes:

  http://autobuild.buildroot.net/results/00d5a4b809922f8fa42c0de9d461c9754d2f8098

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-lib-hsh.c-rename-hsh-local-variable.patch |  71 +++++++++
 ...02-configure-fix-build-with-old-compilers.patch | 165 +++++++++++++++++++++
 package/jose/jose.mk                               |   2 +
 3 files changed, 238 insertions(+)

diff --git a/package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch b/package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch
new file mode 100644
index 0000000..0bd259a
--- /dev/null
+++ b/package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch
@@ -0,0 +1,71 @@
+From 591fc6da944ffc29936e0019b2bc225ddc81dbba Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 20 Nov 2017 22:48:33 +0100
+Subject: [PATCH] lib/hsh.c: rename hsh local variable
+
+The hsh local variable name conflicts with the function prototype of
+hsh() in hsh.h, causing the following build issues with old compilers
+(gcc 4.7):
+
+hsh.c: In function 'hsh':
+hsh.c:28:21: error: declaration of 'hsh' shadows a global declaration [-Werror=shadow]
+hsh.c:26:1: error: shadowed declaration is here [-Werror=shadow]
+hsh.c: In function 'hsh_buf':
+hsh.c:60:21: error: declaration of 'hsh' shadows a global declaration [-Werror=shadow]
+hsh.c:26:1: error: shadowed declaration is here [-Werror=shadow]
+
+Therefore, we rename this local variable to _hsh.
+
+Submitted-upstream: https://github.com/latchset/jose/pull/51
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ lib/hsh.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/lib/hsh.c b/lib/hsh.c
+index c59a95f..a2a891b 100644
+--- a/lib/hsh.c
++++ b/lib/hsh.c
+@@ -25,7 +25,7 @@
+ json_t *
+ hsh(jose_cfg_t *cfg, const char *alg, const void *data, size_t dlen)
+ {
+-    jose_io_auto_t *hsh = NULL;
++    jose_io_auto_t *_hsh = NULL;
+     jose_io_auto_t *enc = NULL;
+     jose_io_auto_t *buf = NULL;
+     char b[1024] = {};
+@@ -33,8 +33,8 @@ hsh(jose_cfg_t *cfg, const char *alg, const void *data, size_t dlen)
+ 
+     buf = jose_io_buffer(cfg, b, &l);
+     enc = jose_b64_enc_io(buf);
+-    hsh = hsh_io(cfg, alg, enc);
+-    if (!buf || !enc || !hsh || !hsh->feed(hsh, data, dlen) || !hsh->done(hsh))
++    _hsh = hsh_io(cfg, alg, enc);
++    if (!buf || !enc || !_hsh || !_hsh->feed(_hsh, data, dlen) || !_hsh->done(_hsh))
+         return NULL;
+ 
+     return json_stringn(b, l);
+@@ -57,7 +57,7 @@ hsh_buf(jose_cfg_t *cfg, const char *alg,
+         const void *data, size_t dlen, void *hash, size_t hlen)
+ {
+     const jose_hook_alg_t *a = NULL;
+-    jose_io_auto_t *hsh = NULL;
++    jose_io_auto_t *_hsh = NULL;
+     jose_io_auto_t *buf = NULL;
+ 
+     a = jose_hook_alg_find(JOSE_HOOK_ALG_KIND_HASH, alg);
+@@ -71,8 +71,8 @@ hsh_buf(jose_cfg_t *cfg, const char *alg,
+         return SIZE_MAX;
+ 
+     buf = jose_io_buffer(cfg, hash, &hlen);
+-    hsh = a->hash.hsh(a, cfg, buf);
+-    if (!buf || !hsh || !hsh->feed(hsh, data, dlen) || !hsh->done(hsh))
++    _hsh = a->hash.hsh(a, cfg, buf);
++    if (!buf || !_hsh || !_hsh->feed(_hsh, data, dlen) || !_hsh->done(_hsh))
+         return SIZE_MAX;
+ 
+     return hlen;
+-- 
+2.13.6
+
diff --git a/package/jose/0002-configure-fix-build-with-old-compilers.patch b/package/jose/0002-configure-fix-build-with-old-compilers.patch
new file mode 100644
index 0000000..0484f38
--- /dev/null
+++ b/package/jose/0002-configure-fix-build-with-old-compilers.patch
@@ -0,0 +1,165 @@
+From 98e9faa4d39cd5b6aaab882877e19ae394ba3810 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 20 Nov 2017 23:10:38 +0100
+Subject: [PATCH] configure: fix build with old compilers
+
+Old gcc versions (gcc 4.7) do not support all warnings flags currently
+hard-coded by configure.ac. In order to fix this, we import the
+AX_CHECK_COMPILE_FLAG() macro from the autoconf-archive, and use it in
+the configure.ac to only use warning flags when the compiler supports
+them.
+
+Submitted-upstream: https://github.com/latchset/jose/pull/51
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac                | 46 +++++++++++++++-------------
+ m4/ax_check_compile_flag.m4 | 74 +++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 105 insertions(+), 22 deletions(-)
+ create mode 100644 m4/ax_check_compile_flag.m4
+
+diff --git a/configure.ac b/configure.ac
+index cf8c9a6..6fe4ded 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,5 +1,6 @@
+ AC_PREREQ(2.62)
+ AC_INIT(jose, 10)
++AC_CONFIG_MACRO_DIRS([m4])
+ AC_CANONICAL_SYSTEM
+ AC_PROG_CC_C99
+ 
+@@ -18,27 +19,30 @@ PKG_CHECK_MODULES([libcrypto], [libcrypto >= 1.0.2])
+ AC_OPENMP
+ AC_SUBST([OPENMP_CFLAGS])
+ 
+-JOSE_CFLAGS="\
+--Wall \
+--Wextra \
+--Werror \
+--Wstrict-aliasing \
+--Wchar-subscripts \
+--Wformat-security \
+--Wmissing-declarations \
+--Wmissing-prototypes \
+--Wnested-externs \
+--Wpointer-arith \
+--Wshadow \
+--Wsign-compare \
+--Wstrict-prototypes \
+--Wtype-limits \
+--Wunused-function \
+--Wno-missing-field-initializers \
+--Wno-unused-command-line-argument \
+--Wno-unused-parameter \
+--Wno-unknown-pragmas \
+-"
++for flag in \
++    -Wall \
++    -Wextra \
++    -Werror \
++    -Wstrict-aliasing \
++    -Wchar-subscripts \
++    -Wformat-security \
++    -Wmissing-declarations \
++    -Wmissing-prototypes \
++    -Wnested-externs \
++    -Wpointer-arith \
++    -Wshadow \
++    -Wsign-compare \
++    -Wstrict-prototypes \
++    -Wtype-limits \
++    -Wunused-function \
++    -Wno-missing-field-initializers \
++    -Wno-unused-command-line-argument \
++    -Wno-unused-parameter \
++    -Wno-unknown-pragmas ; do
++    AX_CHECK_COMPILE_FLAG([${flag}],
++		[JOSE_CFLAGS="${JOSE_CFLAGS} ${flag}"])
++done
++
+ AC_SUBST([JOSE_CFLAGS])
+ 
+ AC_MSG_CHECKING([for linker script support])
+diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
+new file mode 100644
+index 0000000..dcabb92
+--- /dev/null
++++ b/m4/ax_check_compile_flag.m4
+@@ -0,0 +1,74 @@
++# ===========================================================================
++#  https://www.gnu.org/software/autoconf-archive/ax_check_compile_flag.html
++# ===========================================================================
++#
++# SYNOPSIS
++#
++#   AX_CHECK_COMPILE_FLAG(FLAG, [ACTION-SUCCESS], [ACTION-FAILURE], [EXTRA-FLAGS], [INPUT])
++#
++# DESCRIPTION
++#
++#   Check whether the given FLAG works with the current language's compiler
++#   or gives an error.  (Warnings, however, are ignored)
++#
++#   ACTION-SUCCESS/ACTION-FAILURE are shell commands to execute on
++#   success/failure.
++#
++#   If EXTRA-FLAGS is defined, it is added to the current language's default
++#   flags (e.g. CFLAGS) when the check is done.  The check is thus made with
++#   the flags: "CFLAGS EXTRA-FLAGS FLAG".  This can for example be used to
++#   force the compiler to issue an error when a bad flag is given.
++#
++#   INPUT gives an alternative input source to AC_COMPILE_IFELSE.
++#
++#   NOTE: Implementation based on AX_CFLAGS_GCC_OPTION. Please keep this
++#   macro in sync with AX_CHECK_{PREPROC,LINK}_FLAG.
++#
++# LICENSE
++#
++#   Copyright (c) 2008 Guido U. Draheim <guidod@gmx.de>
++#   Copyright (c) 2011 Maarten Bosmans <mkbosmans@gmail.com>
++#
++#   This program is free software: you can redistribute it and/or modify it
++#   under the terms of the GNU General Public License as published by the
++#   Free Software Foundation, either version 3 of the License, or (at your
++#   option) any later version.
++#
++#   This program is distributed in the hope that it will be useful, but
++#   WITHOUT ANY WARRANTY; without even the implied warranty of
++#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
++#   Public License for more details.
++#
++#   You should have received a copy of the GNU General Public License along
++#   with this program. If not, see <https://www.gnu.org/licenses/>.
++#
++#   As a special exception, the respective Autoconf Macro's copyright owner
++#   gives unlimited permission to copy, distribute and modify the configure
++#   scripts that are the output of Autoconf when processing the Macro. You
++#   need not follow the terms of the GNU General Public License when using
++#   or distributing such scripts, even though portions of the text of the
++#   Macro appear in them. The GNU General Public License (GPL) does govern
++#   all other use of the material that constitutes the Autoconf Macro.
++#
++#   This special exception to the GPL applies to versions of the Autoconf
++#   Macro released by the Autoconf Archive. When you make and distribute a
++#   modified version of the Autoconf Macro, you may extend this special
++#   exception to the GPL to apply to your modified version as well.
++
++#serial 5
++
++AC_DEFUN([AX_CHECK_COMPILE_FLAG],
++[AC_PREREQ(2.64)dnl for _AC_LANG_PREFIX and AS_VAR_IF
++AS_VAR_PUSHDEF([CACHEVAR],[ax_cv_check_[]_AC_LANG_ABBREV[]flags_$4_$1])dnl
++AC_CACHE_CHECK([whether _AC_LANG compiler accepts $1], CACHEVAR, [
++  ax_check_save_flags=$[]_AC_LANG_PREFIX[]FLAGS
++  _AC_LANG_PREFIX[]FLAGS="$[]_AC_LANG_PREFIX[]FLAGS $4 $1"
++  AC_COMPILE_IFELSE([m4_default([$5],[AC_LANG_PROGRAM()])],
++    [AS_VAR_SET(CACHEVAR,[yes])],
++    [AS_VAR_SET(CACHEVAR,[no])])
++  _AC_LANG_PREFIX[]FLAGS=$ax_check_save_flags])
++AS_VAR_IF(CACHEVAR,yes,
++  [m4_default([$2], :)],
++  [m4_default([$3], :)])
++AS_VAR_POPDEF([CACHEVAR])dnl
++])dnl AX_CHECK_COMPILE_FLAGS
+-- 
+2.13.6
+
diff --git a/package/jose/jose.mk b/package/jose/jose.mk
index 1f5e3e4..2758d40 100644
--- a/package/jose/jose.mk
+++ b/package/jose/jose.mk
@@ -9,6 +9,8 @@ JOSE_SOURCE = jose-$(JOSE_VERSION).tar.bz2
 JOSE_SITE = https://github.com/latchset/jose/releases/download/v$(JOSE_VERSION)
 JOSE_LICENSE = Apache-2.0
 JOSE_LICENSE_FILES = COPYING
+# 0002-configure-fix-build-with-old-compilers.patch
+JOSE_AUTORECONF = YES
 JOSE_INSTALL_STAGING = YES
 JOSE_DEPENDENCIES = host-pkgconf zlib jansson openssl
 
