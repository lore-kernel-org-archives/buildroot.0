From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 21 Jan 2019 14:51:10 +0100
Subject: [Buildroot] [PATCH v4 16/17] package/fftw: remove as regular package
In-Reply-To: <1548078671-63318-15-git-send-email-gwenj@trabucayre.com>
References: <1548078671-63318-1-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-2-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-3-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-4-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-5-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-6-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-7-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-8-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-9-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-10-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-11-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-12-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-13-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-14-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-15-git-send-email-gwenj@trabucayre.com>
Message-ID: <1548078671-63318-16-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

fftw is no longer a package: only fftw-single, fftw-double,
fftw-long-double and fftw-quad are. fftw.mk only contains some common
definitions that are used by the different fftw variants.

The old BR2_PACKAGE_FFTW_PRECISION_* options, which are no longer used
anywhere, are moved to Config.in.legacy.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 Changes v3 -> V4:
 * when BR2_PACKAGE_FFTW is enabled without flavour, selects fftw-double
   by default. (Yann)
 * suppress suppress two consecutive empty lines. (Yann)
---
 Config.in.legacy       | 35 +++++++++++++++++++++++++++++++++
 package/fftw/Config.in | 44 +++---------------------------------------
 package/fftw/fftw.mk   | 18 -----------------
 3 files changed, 38 insertions(+), 59 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ef460752f3..b26a070759 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -154,6 +154,41 @@ config BR2_PACKAGE_BOOST_SIGNALS
 	  was announced in 1.54. Users are encouraged to use Signals2
 	  instead.
 
+config BR2_PACKAGE_FFTW_PRECISION_SINGLE
+	bool "single"
+	select BR2_LEGACY
+	select BR2_PACKAGE_FFTW_SINGLE
+	help
+	  This option has been removed in favor of
+	  BR2_PACKAGE_FFTW_SINGLE.
+
+config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
+	bool "double"
+	select BR2_LEGACY
+	select BR2_PACKAGE_FFTW_DOUBLE
+	help
+	  This option has been removed in favor of
+	  BR2_PACKAGE_FFTW_DOUBLE.
+
+config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
+	bool "long double"
+	depends on !(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && \
+		(BR2_arm || BR2_mips || BR2_mipsel))
+	select BR2_LEGACY
+	select BR2_PACKAGE_FFTW_LONG_DOUBLE
+	help
+	  This option has been removed in favor of
+	  BR2_PACKAGE_FFTW_LONG_DOUBLE.
+
+config BR2_PACKAGE_FFTW_PRECISION_QUAD
+	bool "quad"
+	depends on (BR2_i386 || BR2_x86_64) && BR2_USE_WCHAR
+	select BR2_LEGACY
+	select BR2_PACKAGE_FFTW_QUAD
+	help
+	  This option has been removed in favor of
+	  BR2_PACKAGE_FFTW_QUAD.
+
 config BR2_PACKAGE_LUA_5_2
 	bool "Lua 5.2.x version removed"
 	select BR2_LEGACY
diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index ed87de1a70..89d99c5f9d 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_FFTW
 	bool "fftw"
+	select BR2_PACKAGE_FFTW_DOUBLE if !BR2_PACKAGE_FFTW_SINGLE \
+		&& !BR2_PACKAGE_FFTW_LONG_DOUBLE && !BR2_PACKAGE_FFTW_QUAD
+
 	help
 	  Library for computing Fast Fourier Transforms.
 
@@ -12,47 +15,6 @@ config BR2_PACKAGE_FFTW
 
 if BR2_PACKAGE_FFTW
 
-choice
-	prompt "fftw precision"
-	default BR2_PACKAGE_FFTW_PRECISION_DOUBLE
-	help
-	  Selects fftw precision
-
-config BR2_PACKAGE_FFTW_PRECISION_SINGLE
-	bool "single"
-	select BR2_PACKAGE_FFTW_SINGLE
-	help
-	  Compile fftw in single precision, i.e. use 'float' for
-	  floating point type.
-
-config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
-	bool "double"
-	select BR2_PACKAGE_FFTW_DOUBLE
-	help
-	  Compile fftw in double precision (the default), i.e. use
-	  'double' for floating point type.
-
-config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
-	bool "long double"
-	# long-double precision require long-double trigonometric routines
-	depends on !(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && \
-		(BR2_arm || BR2_mips || BR2_mipsel))
-	select BR2_PACKAGE_FFTW_LONG_DOUBLE
-	help
-	  Compile fftw in long double precision, i.e. use 'long double'
-	  for floating point type.
-
-config BR2_PACKAGE_FFTW_PRECISION_QUAD
-	bool "quad"
-	# quad-precision needs to have a gcc with libquadmath
-	depends on (BR2_i386 || BR2_x86_64) && BR2_USE_WCHAR
-	select BR2_PACKAGE_FFTW_QUAD
-	help
-	  Compile fftw in quadruple precision, i.e. use '__float128' for
-	  floating point type.
-
-endchoice
-
 source "package/fftw/fftw-single/Config.in"
 source "package/fftw/fftw-double/Config.in"
 source "package/fftw/fftw-long-double/Config.in"
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 862ad5edc0..bcfdb9c96a 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -10,22 +10,6 @@ FFTW_INSTALL_STAGING = YES
 FFTW_LICENSE = GPL-2.0+
 FFTW_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
-FFTW_DEPENDENCIES += fftw-double
-endif
-
-ifeq ($(BR2_PACKAGE_FFTW_LONG_DOUBLE),y)
-FFTW_DEPENDENCIES += fftw-long-double
-endif
-
-ifeq ($(BR2_PACKAGE_FFTW_QUAD),y)
-FFTW_DEPENDENCIES += fftw-quad
-endif
-
-ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
-FFTW_DEPENDENCIES += fftw-single
-endif
-
 # fortran support only enables generation and installation of fortran sources
 ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
 FFTW_COMMON_CONF_OPTS += --enable-fortran
@@ -49,6 +33,4 @@ FFTW_COMMON_CONF_OPTS += --disable-threads
 endif
 FFTW_COMMON_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
 
-$(eval $(generic-package))
-
 include $(sort $(wildcard package/fftw/*/*.mk))
-- 
2.19.2
