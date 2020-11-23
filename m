From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Nov 2020 08:52:47 +0100
Subject: [Buildroot] [git commit] package/spandsp: disable MMX on i686
Message-ID: <20201123073949.E4A06872F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27af87813e8850e2c3a9bd92e1eaf6fe84133fd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MMX raises the following build failure on i686:

gsm0610_rpe.c: In function 'gsm0610_rpe_encoding':
gsm0610_rpe.c:132:5: error: invalid 'asm': invalid constraints for operand
     __asm__ __volatile__(
     ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3e986c3109c392afe47fc98446a2563ac9776cf6
 - http://autobuild.buildroot.org/results/00ed4a4285b35d8ec0be09217e5b503e4820d971

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-configure.ac-fix-AVX-SSE-and-MMX-options.patch | 60 ++++++++++++++++++++++
 package/spandsp/spandsp.mk                         |  5 +-
 2 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/package/spandsp/0001-configure.ac-fix-AVX-SSE-and-MMX-options.patch b/package/spandsp/0001-configure.ac-fix-AVX-SSE-and-MMX-options.patch
new file mode 100644
index 0000000000..50eecfbf4b
--- /dev/null
+++ b/package/spandsp/0001-configure.ac-fix-AVX-SSE-and-MMX-options.patch
@@ -0,0 +1,60 @@
+From e7330bfe63efd0062fa51d50a4aaa0f1abd5ff75 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 22 Nov 2020 17:02:43 +0100
+Subject: [PATCH] configure.ac: fix AVX, SSE and MMX options
+
+AVX, SSE and MMX options are broken since
+https://github.com/freeswitch/spandsp/commit/87a900c70df73e128a5926587047f529105f5f64
+
+For example, when the user enables SSE, it will also enable MMX and the
+user can't disable MMX
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/freeswitch/spandsp/pull/20]
+---
+ configure.ac | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 83fb3fd..ac2592e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -486,35 +486,27 @@ armv7[bl] | armv7-*)
+ x86_64-* | i386-* | i686-*)
+     if test "$enable_avx2" = "yes" ; then
+         AC_DEFINE([SPANDSP_USE_AVX2], [1], [Use the AVX2 instruction set (i386 and x86_64 only).])
+-        enable_avx="yes"
+     fi
+     if test "$enable_avx" = "yes" ; then
+         AC_DEFINE([SPANDSP_USE_AVX], [1], [Use the AVX instruction set (i386 and x86_64 only).])
+-        enable_sse4_2="yes"
+     fi
+     if test "$enable_sse4_2" = "yes" ; then
+         AC_DEFINE([SPANDSP_USE_SSE4_2], [1], [Use the SSE4.2 instruction set (i386 and x86_64 only).])
+-        enable_sse4_1="yes"
+     fi
+     if test "$enable_sse4_1" = "yes" ; then
+         AC_DEFINE([SPANDSP_USE_SSE4_1], [1], [Use the SSE4.1 instruction set (i386 and x86_64 only).])
+-        enable_ssse3="yes"
+     fi
+     if test "$enable_ssse3" = "yes" ; then
+         AC_DEFINE([SPANDSP_USE_SSSE3], [1], [Use the SSSE3 instruction set (i386 and x86_64 only).])
+-        enable_sse3="yes"
+     fi
+     if test "$enable_sse3" = "yes" ; then
+         AC_DEFINE([SPANDSP_USE_SSE3], [1], [Use the SSE3 instruction set (i386 and x86_64 only).])
+-        enable_sse2="yes"
+     fi
+     if test "$enable_sse2" = "yes" ; then
+         AC_DEFINE([SPANDSP_USE_SSE2], [1], [Use the SSE2 instruction set (i386 and x86_64 only).])
+-        enable_sse="yes"
+     fi
+     if test "$enable_sse" = "yes" ; then
+         AC_DEFINE([SPANDSP_USE_SSE], [1], [Use the SSE instruction set (i386 and x86_64 only).])
+-        enable_mmx="yes"
+     fi
+     if test "$enable_mmx" = "yes" ; then
+         AC_DEFINE([SPANDSP_USE_MMX], [1], [Use the MMX instruction set (i386 and x86_64 only).])
+-- 
+2.29.2
+
diff --git a/package/spandsp/spandsp.mk b/package/spandsp/spandsp.mk
index 42c0e3bb69..4735212f31 100644
--- a/package/spandsp/spandsp.mk
+++ b/package/spandsp/spandsp.mk
@@ -8,14 +8,17 @@ SPANDSP_VERSION = 3.0.0-6ec23e5a7e
 SPANDSP_SITE = https://files.freeswitch.org/downloads/libs
 SPANDSP_LICENSE = LGPL-2.1 (library), GPL-2.0 (test suite)
 SPANDSP_LICENSE_FILES = COPYING
+# We're patching configure.ac
+SPANDSP_AUTORECONF = YES
 
 SPANDSP_DEPENDENCIES = tiff host-pkgconf
 SPANDSP_INSTALL_STAGING = YES
 SPANDSP_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtiff-4`"
 
+# MMX on i686 raises a build failure
 SPANDSP_CONF_OPTS = \
 	--disable-builtin-tiff \
-	$(if $(BR2_X86_CPU_HAS_MMX),--enable-mmx,--disable-mmx) \
+	$(if $(BR2_x86_64),--enable-mmx,--disable-mmx) \
 	$(if $(BR2_X86_CPU_HAS_SSE),--enable-sse,--disable-sse) \
 	$(if $(BR2_X86_CPU_HAS_SSE2),--enable-sse2,--disable-sse2) \
 	$(if $(BR2_X86_CPU_HAS_SSE3),--enable-sse3,--disable-sse3) \
