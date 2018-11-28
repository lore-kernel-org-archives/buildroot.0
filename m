From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 28 Nov 2018 17:12:31 +0100
Subject: [Buildroot] [PATCH 01/11] package/fftw : Allow all precisions to be
 installed at the same time.
Message-ID: <1543421561-37355-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

fftw's library name depends on the precision option. Consequently,
it's possible to install multiple flavor on the same target.

This patch split current fftw in 5 part:
- 1 to provide common variables
- 4 to provide specificities for each precision.

This patch suppress hidden BR2_PACKAGE_FFTW_USE_xx variables and directly use
corresponding options in specifics .mk.

Based on http://lists.busybox.net/pipermail/buildroot/2016-August/170116.html

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/fftw/Config.in                        | 56 +++----------------
 package/fftw/fftw-double/Config.in            |  5 ++
 package/fftw/fftw-double/fftw-double.hash     |  1 +
 package/fftw/fftw-double/fftw-double.mk       | 23 ++++++++
 package/fftw/fftw-long-double/Config.in       |  8 +++
 .../fftw-long-double/fftw-long-double.hash    |  1 +
 .../fftw/fftw-long-double/fftw-long-double.mk | 21 +++++++
 package/fftw/fftw-quad/Config.in              |  7 +++
 package/fftw/fftw-quad/fftw-quad.hash         |  1 +
 package/fftw/fftw-quad/fftw-quad.mk           | 21 +++++++
 package/fftw/fftw-single/Config.in            |  5 ++
 package/fftw/fftw-single/fftw-single.hash     |  1 +
 package/fftw/fftw-single/fftw-single.mk       | 33 +++++++++++
 package/fftw/fftw.mk                          | 14 +----
 14 files changed, 135 insertions(+), 62 deletions(-)
 create mode 100644 package/fftw/fftw-double/Config.in
 create mode 120000 package/fftw/fftw-double/fftw-double.hash
 create mode 100644 package/fftw/fftw-double/fftw-double.mk
 create mode 100644 package/fftw/fftw-long-double/Config.in
 create mode 120000 package/fftw/fftw-long-double/fftw-long-double.hash
 create mode 100644 package/fftw/fftw-long-double/fftw-long-double.mk
 create mode 100644 package/fftw/fftw-quad/Config.in
 create mode 120000 package/fftw/fftw-quad/fftw-quad.hash
 create mode 100644 package/fftw/fftw-quad/fftw-quad.mk
 create mode 100644 package/fftw/fftw-single/Config.in
 create mode 120000 package/fftw/fftw-single/fftw-single.hash
 create mode 100644 package/fftw/fftw-single/fftw-single.mk

diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index d51f8f3c51..c37fd17b5f 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -12,55 +12,11 @@ config BR2_PACKAGE_FFTW
 
 if BR2_PACKAGE_FFTW
 
-config BR2_PACKAGE_FFTW_USE_SSE
-	bool
-
-config BR2_PACKAGE_FFTW_USE_SSE2
-	bool
-
-config BR2_PACKAGE_FFTW_USE_NEON
-	bool
-
-choice
-	prompt "fftw precision"
-	default BR2_PACKAGE_FFTW_PRECISION_DOUBLE
-	help
-	  Selects fftw precision
-
-config BR2_PACKAGE_FFTW_PRECISION_SINGLE
-	bool "single"
-	select BR2_PACKAGE_FFTW_USE_SSE if BR2_X86_CPU_HAS_SSE
-	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
-	select BR2_PACKAGE_FFTW_USE_NEON if BR2_ARM_CPU_HAS_NEON && !BR2_ARM_SOFT_FLOAT
-	help
-	  Compile fftw in single precision, i.e. use 'float' for
-	  floating point type.
-
-config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
-	bool "double"
-	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
-	help
-	  Compile fftw in double precision (the default), i.e. use
-	  'double' for floating point type.
-
-config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
-	bool "long double"
-	# long-double precision require long-double trigonometric routines
-	depends on !(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && \
-		(BR2_arm || BR2_mips || BR2_mipsel))
-	help
-	  Compile fftw in long double precision, i.e. use 'long double'
-	  for floating point type.
-
-config BR2_PACKAGE_FFTW_PRECISION_QUAD
-	bool "quad"
-	# quad-precision needs to have a gcc with libquadmath
-	depends on (BR2_i386 || BR2_x86_64) && BR2_USE_WCHAR
-	help
-	  Compile fftw in quadruple precision, i.e. use '__float128' for
-	  floating point type.
-
-endchoice
+menu "FFTW precision and options"
+source "package/fftw/fftw-double/Config.in"
+source "package/fftw/fftw-long-double/Config.in"
+source "package/fftw/fftw-single/Config.in"
+source "package/fftw/fftw-quad/Config.in"
 
 config BR2_PACKAGE_FFTW_FAST
 	bool "optimise for speed over accuracy"
@@ -75,4 +31,6 @@ config BR2_PACKAGE_FFTW_FAST
 	  turn is basically using gcc's -ffast-math. See the gcc manual
 	  for what this means.
 
+endmenu
+
 endif
diff --git a/package/fftw/fftw-double/Config.in b/package/fftw/fftw-double/Config.in
new file mode 100644
index 0000000000..f52502fe26
--- /dev/null
+++ b/package/fftw/fftw-double/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
+	bool "fftw-double"
+	help
+	  Compile fftw in double precision (the default), i.e. use
+	  'double' for floating point type.
diff --git a/package/fftw/fftw-double/fftw-double.hash b/package/fftw/fftw-double/fftw-double.hash
new file mode 120000
index 0000000000..3ee7ecb3ba
--- /dev/null
+++ b/package/fftw/fftw-double/fftw-double.hash
@@ -0,0 +1 @@
+../fftw.hash
\ No newline at end of file
diff --git a/package/fftw/fftw-double/fftw-double.mk b/package/fftw/fftw-double/fftw-double.mk
new file mode 100644
index 0000000000..b8a587184c
--- /dev/null
+++ b/package/fftw/fftw-double/fftw-double.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# fft-double
+#
+################################################################################
+
+FFTW_PRECISION_DOUBLE_VERSION = $(FFTW_VERSION)
+FFTW_PRECISION_DOUBLE_SOURCE = fftw-$(FFTW_VERSION).tar.gz
+FFTW_PRECISION_DOUBLE_SITE = $(FFTW_SITE)
+FFTW_PRECISION_DOUBLE_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
+FFTW_PRECISION_DOUBLE_LICENSE = $(FFTW_LICENSE)
+FFTW_PRECISION_DOUBLE_LICENSE_FILES = $(FFTW_LICENSE_FILES)
+
+FFTW_PRECISION_DOUBLE_CONF_ENV = $(FFTW_CONF_ENV)
+
+FFTW_PRECISION_DOUBLE_CONF_OPTS= $(FFTW_CONF_OPTS)
+
+FFTW_PRECISION_DOUBLE_CFLAGS = $(FFTW_CFLAGS)
+
+# x86 optimisations
+FFTW_PRECISION_DOUBLE_CONF_OPTS += $(if $(BR2_X86_CPU_HAS_SSE2),--enable,--disable)-sse2
+
+$(eval $(autotools-package))
diff --git a/package/fftw/fftw-long-double/Config.in b/package/fftw/fftw-long-double/Config.in
new file mode 100644
index 0000000000..d52a4d2e18
--- /dev/null
+++ b/package/fftw/fftw-long-double/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
+	bool "fftw-long-double"
+	# long-double precision require long-double trigonometric routines
+	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && \
+		(BR2_arm || BR2_mips || BR2_mipsel))
+	help
+	  Compile fftw in long double precision, i.e. use 'long double'
+	  for floating point type.
diff --git a/package/fftw/fftw-long-double/fftw-long-double.hash b/package/fftw/fftw-long-double/fftw-long-double.hash
new file mode 120000
index 0000000000..3ee7ecb3ba
--- /dev/null
+++ b/package/fftw/fftw-long-double/fftw-long-double.hash
@@ -0,0 +1 @@
+../fftw.hash
\ No newline at end of file
diff --git a/package/fftw/fftw-long-double/fftw-long-double.mk b/package/fftw/fftw-long-double/fftw-long-double.mk
new file mode 100644
index 0000000000..9c96ed5f56
--- /dev/null
+++ b/package/fftw/fftw-long-double/fftw-long-double.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# fftw-long-double
+#
+################################################################################
+
+FFTW_PRECISION_LONG_DOUBLE_VERSION = $(FFTW_VERSION)
+FFTW_PRECISION_LONG_DOUBLE_SOURCE = fftw-$(FFTW_VERSION).tar.gz
+FFTW_PRECISION_LONG_DOUBLE_SITE = $(FFTW_SITE)
+FFTW_PRECISION_LONG_DOUBLE_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
+FFTW_PRECISION_LONG_DOUBLE_LICENSE = $(FFTW_LICENSE)
+FFTW_PRECISION_LONG_DOUBLE_LICENSE_FILES = $(FFTW_LICENSE_FILES)
+
+FFTW_PRECISION_LONG_DOUBLE_CONF_ENV = $(FFTW_CONF_ENV)
+
+FFTW_PRECISION_LONG_DOUBLE_CONF_OPTS = $(FFTW_CONF_OPTS)
+FFTW_PRECISION_LONG_DOUBLE_CONF_OPTS += --enable-long-double
+
+FFTW_PRECISION_LONG_DOUBLE_CFLAGS = $(FFTW_CFLAGS)
+
+$(eval $(autotools-package))
diff --git a/package/fftw/fftw-quad/Config.in b/package/fftw/fftw-quad/Config.in
new file mode 100644
index 0000000000..827fff1240
--- /dev/null
+++ b/package/fftw/fftw-quad/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FFTW_PRECISION_QUAD
+	bool "fftw-quad"
+	# quad-precision needs to have a gcc with libquadmath
+	depends on (BR2_i386 || BR2_x86_64) && BR2_USE_WCHAR
+	help
+	  Compile fftw in quadruple precision, i.e. use '__float128' for
+	  floating point type.
diff --git a/package/fftw/fftw-quad/fftw-quad.hash b/package/fftw/fftw-quad/fftw-quad.hash
new file mode 120000
index 0000000000..3ee7ecb3ba
--- /dev/null
+++ b/package/fftw/fftw-quad/fftw-quad.hash
@@ -0,0 +1 @@
+../fftw.hash
\ No newline at end of file
diff --git a/package/fftw/fftw-quad/fftw-quad.mk b/package/fftw/fftw-quad/fftw-quad.mk
new file mode 100644
index 0000000000..8acbd40d21
--- /dev/null
+++ b/package/fftw/fftw-quad/fftw-quad.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# fftw-quad
+#
+################################################################################
+
+FFTW_PRECISION_QUAD_VERSION = $(FFTW_VERSION)
+FFTW_PRECISION_QUAD_SOURCE = fftw-$(FFTW_VERSION).tar.gz
+FFTW_PRECISION_QUAD_SITE = $(FFTW_SITE)
+FFTW_PRECISION_QUAD_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
+FFTW_PRECISION_QUAD_LICENSE = $(FFTW_LICENSE)
+FFTW_PRECISION_QUAD_LICENSE_FILES = $(FFTW_LICENSE_FILES)
+
+FFTW_PRECISION_QUAD_CONF_ENV = $(FFTW_CONF_ENV)
+
+FFTW_PRECISION_QUAD_CONF_OPTS = $(FFTW_CONF_OPTS)
+FFTW_PRECISION_QUAD_CONF_OPTS += --enable-quad-precision
+
+FFTW_PRECISION_QUAD_CFLAGS = $(FFTW_CFLAGS)
+
+$(eval $(autotools-package))
diff --git a/package/fftw/fftw-single/Config.in b/package/fftw/fftw-single/Config.in
new file mode 100644
index 0000000000..43c91012ff
--- /dev/null
+++ b/package/fftw/fftw-single/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_FFTW_PRECISION_SINGLE
+	bool "fftw-single"
+	help
+	  Compile fftw in single precision, i.e. use 'float'
+	  for floating point type.
diff --git a/package/fftw/fftw-single/fftw-single.hash b/package/fftw/fftw-single/fftw-single.hash
new file mode 120000
index 0000000000..3ee7ecb3ba
--- /dev/null
+++ b/package/fftw/fftw-single/fftw-single.hash
@@ -0,0 +1 @@
+../fftw.hash
\ No newline at end of file
diff --git a/package/fftw/fftw-single/fftw-single.mk b/package/fftw/fftw-single/fftw-single.mk
new file mode 100644
index 0000000000..cff7a5de32
--- /dev/null
+++ b/package/fftw/fftw-single/fftw-single.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# fftw-single
+#
+################################################################################
+
+FFTW_PRECISION_SINGLE_VERSION = $(FFTW_VERSION)
+FFTW_PRECISION_SINGLE_SOURCE = fftw-$(FFTW_VERSION).tar.gz
+FFTW_PRECISION_SINGLE_SITE = $(FFTW_SITE)
+FFTW_PRECISION_SINGLE_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
+FFTW_PRECISION_SINGLE_LICENSE = $(FFTW_LICENSE)
+FFTW_PRECISION_SINGLE_LICENSE_FILES = $(FFTW_LICENSE_FILES)
+
+FFTW_PRECISION_SINGLE_CONF_ENV = $(FFTW_CONF_ENV)
+
+FFTW_PRECISION_SINGLE_CONF_OPTS = $(FFTW_CONF_OPTS)
+FFTW_PRECISION_SINGLE_CONF_OPTS += --enable-single
+
+FFTW_PRECISION_SINGLE_CFLAGS = $(FFTW_CFLAGS)
+
+# x86 optimisations
+FFTW_PRECISION_SINGLE_CONF_OPTS += $(if $(BR2_X86_CPU_HAS_SSE),--enable,--disable)-sse
+FFTW_PRECISION_SINGLE_CONF_OPTS += $(if $(BR2_X86_CPU_HAS_SSE2),--enable,--disable)-sse2
+
+# ARM optimisations
+ifeq ($(BR2_ARM_CPU_HAS_NEON):$(BR2_ARM_SOFT_FLOAT),y:)
+FFTW_PRECISION_SINGLE_CONF_OPTS += --enable-neon
+FFTW_PRECISION_SINGLE_CFLAGS += -mfpu=neon
+else
+FFTW_PRECISION_SINGLE_CONF_OPTS += --disable-neon
+endif
+
+$(eval $(autotools-package))
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index b167a2f6f7..ec300242b0 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -18,23 +18,11 @@ else
 FFTW_CONF_OPTS += --disable-fortran
 endif
 
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-single
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision
-
 FFTW_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_PACKAGE_FFTW_FAST),y)
 FFTW_CFLAGS += -O3 -ffast-math
 endif
 
-# x86 optimisations
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE),--enable,--disable)-sse
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
-
-# ARM optimisations
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),--enable,--disable)-neon
-FFTW_CFLAGS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),-mfpu=neon)
-
 # Generic optimisations
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 FFTW_CONF_OPTS += --enable-threads
@@ -46,4 +34,4 @@ FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
 
 FFTW_CONF_OPTS += CFLAGS="$(FFTW_CFLAGS)"
 
-$(eval $(autotools-package))
+include $(sort $(wildcard package/fftw/*/*.mk))
-- 
2.19.2
