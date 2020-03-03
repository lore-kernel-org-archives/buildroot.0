From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2020 23:47:03 +0100
Subject: [Buildroot] [git commit] package/jamvm: drop package
Message-ID: <20200303224447.1BCF38F337@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcb7b2a5724779956c6ba5d2069cf210cd237d78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

JamVM has not had a release since 2014 and is unmaintained.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |   6 ++
 package/Config.in                                  |   1 -
 ...h-when-available-instead-of-fpu_control.h.patch | 108 ---------------------
 package/jamvm/Config.in                            |  26 -----
 package/jamvm/jamvm.hash                           |   3 -
 package/jamvm/jamvm.mk                             |  27 ------
 6 files changed, 6 insertions(+), 165 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6a33ce9e1c..0238fbcb24 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_JAMVM
+	bool "jamvm removed"
+	select BR2_LEGACY
+	help
+	  JamVM has not had a release since 2014 and is unmaintained.
+
 config BR2_PACKAGE_QT5_VERSION_5_6
 	bool "qt 5.6 support removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index dfa3f34b9d..564a60c617 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -605,7 +605,6 @@ endif
 	source "package/gauche/Config.in"
 	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
-	source "package/jamvm/Config.in"
 	source "package/jimtcl/Config.in"
 	source "package/lua/Config.in"
 	source "package/luainterpreter/Config.in"
diff --git a/package/jamvm/0001-Use-fenv.h-when-available-instead-of-fpu_control.h.patch b/package/jamvm/0001-Use-fenv.h-when-available-instead-of-fpu_control.h.patch
deleted file mode 100644
index 78ee9b7e18..0000000000
--- a/package/jamvm/0001-Use-fenv.h-when-available-instead-of-fpu_control.h.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From ecd4eceae98cfb1c83133bdeaa9095546ca8b7c6 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 26 May 2016 15:05:48 +0200
-Subject: [PATCH] Use <fenv.h> when available instead of <fpu_control.h>
-
-musl libc (http://musl-libc.org lack the non-standard <fpu_control.h>
-header, which is used in src/os/linux/{i386,x86_64}/init.c files to
-setup the floating point precision. This patch makes it use the
-standard C <fenv.h> header instead when available.
-
-Original patch at Felix Janda at
-https://sourceforge.net/p/jamvm/patches/6/, adapted to still use
-<fpu_control.h> if <fenv.h> is not provided.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac               |  2 +-
- src/os/linux/i386/init.c   | 15 +++++++++++++++
- src/os/linux/x86_64/init.c | 15 +++++++++++++--
- 3 files changed, 29 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 19f77e6..ce59a3e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -279,7 +279,7 @@ fi
- 
- dnl Checks for header files.
- AC_HEADER_STDC
--AC_CHECK_HEADERS(sys/time.h unistd.h endian.h sys/param.h locale.h alloca.h)
-+AC_CHECK_HEADERS(sys/time.h unistd.h endian.h sys/param.h locale.h alloca.h fenv.h)
- 
- if test "$enable_zip" != no; then
-     AC_CHECK_HEADER(zlib.h,,AC_MSG_ERROR(zlib.h is missing))
-diff --git a/src/os/linux/i386/init.c b/src/os/linux/i386/init.c
-index d9c6648..8fefe7d 100644
---- a/src/os/linux/i386/init.c
-+++ b/src/os/linux/i386/init.c
-@@ -19,18 +19,33 @@
-  * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
-  */
- 
-+#include "config.h"
-+
-+#if defined(HAVE_FENV_H)
-+#include <fenv.h>
-+#else
- #include <fpu_control.h>
-+#endif
- 
- /* Change floating point precision to double (64-bit) from
-  * the extended (80-bit) Linux default. */
- 
- void setDoublePrecision() {
-+#if defined(HAVE_FENV_H)
-+    fenv_t fenv;
-+
-+    fegetenv(&fenv);
-+    fenv.__control_word &= ~0x300; /* _FPU_EXTENDED */
-+    fenv.__control_word |= 0x200; /* _FPU_DOUBLE */
-+    fesetenv(&fenv);
-+#else
-     fpu_control_t cw;
- 
-     _FPU_GETCW(cw);
-     cw &= ~_FPU_EXTENDED;
-     cw |= _FPU_DOUBLE;
-     _FPU_SETCW(cw);
-+#endif
- }
- 
- void initialisePlatform() {
-diff --git a/src/os/linux/x86_64/init.c b/src/os/linux/x86_64/init.c
-index 9d55229..b42b14e 100644
---- a/src/os/linux/x86_64/init.c
-+++ b/src/os/linux/x86_64/init.c
-@@ -19,7 +19,11 @@
-  * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
-  */
- 
--#ifdef __linux__
-+#include "config.h"
-+
-+#if defined(HAVE_FENV_H)
-+#include <fenv.h>
-+#else
- #include <fpu_control.h>
- #endif
- 
-@@ -30,7 +34,14 @@
- */
- 
- void setDoublePrecision() {
--#ifdef __linux__
-+#if defined(HAVE_FENV_H)
-+    fenv_t fenv;
-+
-+    fegetenv(&fenv);
-+    fenv.__control_word &= ~0x300; /*_FPU_EXTENDED */
-+    fenv.__control_word |= 0x200; /*_FPU_DOUBLE */
-+    fesetenv(&fenv);
-+#else
-     fpu_control_t cw;
- 
-     _FPU_GETCW(cw);
--- 
-2.7.4
-
diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
deleted file mode 100644
index 7717ccaadb..0000000000
--- a/package/jamvm/Config.in
+++ /dev/null
@@ -1,26 +0,0 @@
-config BR2_PACKAGE_JAMVM_ARCH_SUPPORTS
-	bool
-	default y if BR2_arm || BR2_armeb
-	default y if BR2_i386 || BR2_x86_64
-	default y if (BR2_mips || BR2_mipsel) \
-		&& (BR2_MIPS_FP32_MODE_32 || BR2_MIPS_SOFT_FLOAT)
-	default y if BR2_powerpc
-
-config BR2_PACKAGE_JAMVM
-	bool "jamvm"
-	depends on BR2_PACKAGE_JAMVM_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_CLASSPATH
-	help
-	  JamVM is a new Java Virtual Machine which conforms to the
-	  JVM specification version 2 (blue book).
-
-	  http://jamvm.sf.net
-
-comment "jamvm needs a toolchain w/ threads, dynamic library"
-	depends on BR2_PACKAGE_JAMVM_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/jamvm/jamvm.hash b/package/jamvm/jamvm.hash
deleted file mode 100644
index 9bcbd61393..0000000000
--- a/package/jamvm/jamvm.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  76428e96df0ae9dd964c7a7c74c1e9a837e2f312c39e9a357fa8178f7eff80da  jamvm-2.0.0.tar.gz
-sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/jamvm/jamvm.mk b/package/jamvm/jamvm.mk
deleted file mode 100644
index 26615ef7a3..0000000000
--- a/package/jamvm/jamvm.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-################################################################################
-#
-# jamvm
-#
-################################################################################
-
-JAMVM_VERSION = 2.0.0
-JAMVM_SITE = http://downloads.sourceforge.net/project/jamvm/jamvm/JamVM%20$(JAMVM_VERSION)
-JAMVM_LICENSE = GPL-2.0+
-JAMVM_LICENSE_FILES = COPYING
-JAMVM_DEPENDENCIES = zlib classpath
-# For 0001-Use-fenv.h-when-available-instead-of-fpu_control.h.patch
-JAMVM_AUTORECONF = YES
-# int inlining seems to crash jamvm, don't build shared version of internal lib
-JAMVM_CONF_OPTS = \
-	--with-classpath-install-dir=/usr \
-	--disable-int-inlining \
-	--disable-shared \
-	--without-pic
-
-# jamvm has ARM assembly code that cannot be compiled in Thumb2 mode,
-# so we must force traditional ARM mode.
-ifeq ($(BR2_arm),y)
-JAMVM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -marm"
-endif
-
-$(eval $(autotools-package))
