From: Matt Flax <flatmax@flatmax.org>
Date: Fri, 19 Aug 2016 16:29:52 +1000
Subject: [Buildroot] [PATCH 2/2] package/fftw: Enable multiple precision
	installation
Message-ID: <1471588192-2273-1-git-send-email-flatmax@flatmax.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit enables fftw to be installed for multiple precisions on the
same system. For example if one package requires single precision and another
package requires double precision, then both fftw and fftwf can now be
slected and installed at the same time. Before this commit that wasn't
possible.

The fftw site (http://www.fftw.org/fftw2_doc/fftw_6.html) states that to
install multiple precisions the procedure is a full clean and rebuild for
each desired precision. This patch achieves that by doing complete
builds (as required) for each of the required precisions.

Signed-off-by: Matt Flax <flatmax@flatmax.org>
---
 package/fftw/Config.in            | 61 ++++-----------------------------------
 package/fftw/fftw.mk              |  6 +---
 package/fftw/fftw/Config.in       | 19 ++++++++++++
 package/fftw/{ => fftw}/fftw.hash |  0
 package/fftw/fftw/fftw.mk         |  9 ++++++
 package/fftw/fftwf/Config.in      | 22 ++++++++++++++
 package/fftw/fftwf/fftwf.hash     |  2 ++
 package/fftw/fftwf/fftwf.mk       | 23 +++++++++++++++
 package/fftw/fftwl/Config.in      | 22 ++++++++++++++
 package/fftw/fftwl/fftwl.hash     |  2 ++
 package/fftw/fftwl/fftwl.mk       | 23 +++++++++++++++
 package/fftw/fftwq/Config.in      | 21 ++++++++++++++
 package/fftw/fftwq/fftwq.hash     |  2 ++
 package/fftw/fftwq/fftwq.mk       | 23 +++++++++++++++
 14 files changed, 174 insertions(+), 61 deletions(-)
 create mode 100644 package/fftw/fftw/Config.in
 rename package/fftw/{ => fftw}/fftw.hash (100%)
 create mode 100644 package/fftw/fftw/fftw.mk
 create mode 100644 package/fftw/fftwf/Config.in
 create mode 100644 package/fftw/fftwf/fftwf.hash
 create mode 100644 package/fftw/fftwf/fftwf.mk
 create mode 100644 package/fftw/fftwl/Config.in
 create mode 100644 package/fftw/fftwl/fftwl.hash
 create mode 100644 package/fftw/fftwl/fftwl.mk
 create mode 100644 package/fftw/fftwq/Config.in
 create mode 100644 package/fftw/fftwq/fftwq.hash
 create mode 100644 package/fftw/fftwq/fftwq.mk

diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index ef11384..be8f6cd 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -1,17 +1,3 @@
-config BR2_PACKAGE_FFTW
-	bool "fftw"
-	help
-	  Library for computing Fast Fourier Transforms.
-
-	  This library computes Fast Fourier Transforms (FFT) in one
-	  or more dimensions. It is extremely fast. This package
-	  contains the shared library version of the fftw libraries in
-	  double precision.
-
-	  http://www.fftw.org
-
-if BR2_PACKAGE_FFTW
-
 config BR2_PACKAGE_FFTW_USE_SSE
 	bool
 
@@ -21,47 +7,6 @@ config BR2_PACKAGE_FFTW_USE_SSE2
 config BR2_PACKAGE_FFTW_USE_NEON
 	bool
 
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
-	  Compile fftw in single precision, i.e. use 'float' for floating
-	  point type.
-
-config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
-	bool "double"
-	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
-	help
-	  Compile fftw in double precision (the default), i.e. use 'double'
-	  for floating point type.
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
-
 config BR2_PACKAGE_FFTW_FAST
 	bool "optimise for speed over accuracy"
 	help
@@ -75,4 +20,8 @@ config BR2_PACKAGE_FFTW_FAST
 	  turn is basically using gcc's -ffast-math. See the gcc manual
 	  for what this means.
 
-endif
+source "package/fftw/fftw/Config.in"
+source "package/fftw/fftwf/Config.in"
+source "package/fftw/fftwl/Config.in"
+source "package/fftw/fftwq/Config.in"
+
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 5bd39a8..216838a 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -18,10 +18,6 @@ else
 FFTW_CONF_OPTS += --disable-fortran
 endif
 
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-single
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision
-
 FFTW_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_PACKAGE_FFTW_FAST),y)
 FFTW_CFLAGS += -O3 -ffast-math
@@ -46,4 +42,4 @@ FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
 
 FFTW_CONF_OPTS += CFLAGS="$(FFTW_CFLAGS)"
 
-$(eval $(autotools-package))
+include package/fftw/*/*.mk
diff --git a/package/fftw/fftw/Config.in b/package/fftw/fftw/Config.in
new file mode 100644
index 0000000..51bd5eb
--- /dev/null
+++ b/package/fftw/fftw/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_FFTW
+	bool "fftw"
+	help
+	  Library for computing Fast Fourier Transforms in double precision.
+
+	  This library computes Fast Fourier Transforms (FFT) in one
+	  or more dimensions. It is extremely fast. This package
+	  contains the shared library version of the fftw libraries in
+	  double precision.
+
+	  http://www.fftw.org
+
+config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
+	bool "double"
+	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
+	help
+	  Compile fftw in double precision (the default), i.e. use 'double'
+	  for floating point type.
+
diff --git a/package/fftw/fftw.hash b/package/fftw/fftw/fftw.hash
similarity index 100%
rename from package/fftw/fftw.hash
rename to package/fftw/fftw/fftw.hash
diff --git a/package/fftw/fftw/fftw.mk b/package/fftw/fftw/fftw.mk
new file mode 100644
index 0000000..66a82ec
--- /dev/null
+++ b/package/fftw/fftw/fftw.mk
@@ -0,0 +1,9 @@
+################################################################################
+#
+# fftw
+#
+################################################################################
+
+$(eval $(autotools-package))
+
+
diff --git a/package/fftw/fftwf/Config.in b/package/fftw/fftwf/Config.in
new file mode 100644
index 0000000..7077086
--- /dev/null
+++ b/package/fftw/fftwf/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_FFTWF
+	bool "fftwf"
+	select BR2_PACKAGE_FFTW_PRECISION_SINGLE
+	help
+	  Library for computing Fast Fourier Transforms in single precision.
+
+	  This library computes Fast Fourier Transforms (FFT) in one
+	  or more dimensions. It is extremely fast. This package
+	  contains the shared library version of the fftw libraries in
+	  double precision.
+
+	  http://www.fftw.org
+
+config BR2_PACKAGE_FFTW_PRECISION_SINGLE
+	bool "single"
+	select BR2_PACKAGE_FFTW_USE_SSE if BR2_X86_CPU_HAS_SSE
+	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
+	select BR2_PACKAGE_FFTW_USE_NEON if BR2_ARM_CPU_HAS_NEON && !BR2_ARM_SOFT_FLOAT
+	help
+	  Compile fftw in single precision, i.e. use 'float' for floating
+	  point type.
+
diff --git a/package/fftw/fftwf/fftwf.hash b/package/fftw/fftwf/fftwf.hash
new file mode 100644
index 0000000..62b8f0f
--- /dev/null
+++ b/package/fftw/fftwf/fftwf.hash
@@ -0,0 +1,2 @@
+# From http://www.fftw.org/fftw-3.3.4.tar.gz.md5sum
+md5	2edab8c06b24feeb3b82bbb3ebf3e7b3	fftw-3.3.4.tar.gz
diff --git a/package/fftw/fftwf/fftwf.mk b/package/fftw/fftwf/fftwf.mk
new file mode 100644
index 0000000..a4184b5
--- /dev/null
+++ b/package/fftw/fftwf/fftwf.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# fftwf
+#
+################################################################################
+
+FFTWF_VERSION = $(FFTW_VERSION)
+FFTWF_SOURCE = fftw-$(FFTWF_VERSION).tar.gz
+FFTWF_SITE = $(FFTW_SITE)
+FFTWF_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
+FFTWF_LICENSE = $(FFTW_LICENSE)
+FFTWF_LICENSE_FILES = $(FFTW_LICENSE_FILES)
+
+FFTWF_CONF_ENV = $(FFTW_CONF_ENV)
+
+FFTWF_CONF_OPTS = $(FFTW_CONF_OPTS)
+FFTWF_CONF_OPTS += --enable-single
+
+FFTWF_CFLAGS = $(FFTW_CFLAGS)
+
+$(eval $(autotools-package))
+
+
diff --git a/package/fftw/fftwl/Config.in b/package/fftw/fftwl/Config.in
new file mode 100644
index 0000000..466a11e
--- /dev/null
+++ b/package/fftw/fftwl/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_FFTWL
+	bool "fftwl"
+	select BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
+	help
+	  Library for computing Fast Fourier Transforms in long double precision.
+
+	  This library computes Fast Fourier Transforms (FFT) in one
+	  or more dimensions. It is extremely fast. This package
+	  contains the shared library version of the fftw libraries in
+	  double precision.
+
+	  http://www.fftw.org
+
+config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
+	bool "long double"
+	# long-double precision require long-double trigonometric routines
+	depends on !(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && \
+		(BR2_arm || BR2_mips || BR2_mipsel))
+	help
+	  Compile fftw in long double precision, i.e. use 'long double'
+	  for floating point type.
+
diff --git a/package/fftw/fftwl/fftwl.hash b/package/fftw/fftwl/fftwl.hash
new file mode 100644
index 0000000..62b8f0f
--- /dev/null
+++ b/package/fftw/fftwl/fftwl.hash
@@ -0,0 +1,2 @@
+# From http://www.fftw.org/fftw-3.3.4.tar.gz.md5sum
+md5	2edab8c06b24feeb3b82bbb3ebf3e7b3	fftw-3.3.4.tar.gz
diff --git a/package/fftw/fftwl/fftwl.mk b/package/fftw/fftwl/fftwl.mk
new file mode 100644
index 0000000..2412590
--- /dev/null
+++ b/package/fftw/fftwl/fftwl.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# fftwl
+#
+################################################################################
+
+FFTL_VERSION = $(FFTW_VERSION)
+FFTL_SOURCE = fftw-$(FFTWL_VERSION).tar.gz
+FFTL_SITE = $(FFTW_SITE)
+FFTL_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
+FFTL_LICENSE = $(FFTW_LICENSE)
+FFTL_LICENSE_FILES = $(FFTW_LICENSE_FILES)
+
+FFTL_CONF_ENV = $(FFTW_CONF_ENV)
+
+FFTL_CONF_OPTS = $(FFTW_CONF_OPTS)
+FFTL_CONF_OPTS += --enable-long-double
+
+FFTL_CFLAGS = $(FFTW_CFLAGS)
+
+$(eval $(autotools-package))
+
+
diff --git a/package/fftw/fftwq/Config.in b/package/fftw/fftwq/Config.in
new file mode 100644
index 0000000..fc6f427
--- /dev/null
+++ b/package/fftw/fftwq/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_FFTWQ
+	bool "fftwq"
+	select BR2_PACKAGE_FFTW_PRECISION_QUAD
+	help
+	  Library for computing Fast Fourier Transforms in quad precision.
+
+	  This library computes Fast Fourier Transforms (FFT) in one
+	  or more dimensions. It is extremely fast. This package
+	  contains the shared library version of the fftw libraries in
+	  double precision.
+
+	  http://www.fftw.org
+
+config BR2_PACKAGE_FFTW_PRECISION_QUAD
+	bool "quad"
+	# quad-precision needs to have a gcc with libquadmath
+	depends on (BR2_i386 || BR2_x86_64) && BR2_USE_WCHAR
+	help
+	  Compile fftw in quadruple precision, i.e. use '__float128' for
+	  floating point type.
+
diff --git a/package/fftw/fftwq/fftwq.hash b/package/fftw/fftwq/fftwq.hash
new file mode 100644
index 0000000..62b8f0f
--- /dev/null
+++ b/package/fftw/fftwq/fftwq.hash
@@ -0,0 +1,2 @@
+# From http://www.fftw.org/fftw-3.3.4.tar.gz.md5sum
+md5	2edab8c06b24feeb3b82bbb3ebf3e7b3	fftw-3.3.4.tar.gz
diff --git a/package/fftw/fftwq/fftwq.mk b/package/fftw/fftwq/fftwq.mk
new file mode 100644
index 0000000..6130538
--- /dev/null
+++ b/package/fftw/fftwq/fftwq.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# fftwq
+#
+################################################################################
+
+FFTQ_VERSION = $(FFTW_VERSION)
+FFTQ_SOURCE = fftw-$(FFTWQ_VERSION).tar.gz
+FFTQ_SITE = $(FFTW_SITE)
+FFTQ_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
+FFTQ_LICENSE = $(FFTW_LICENSE)
+FFTQ_LICENSE_FILES = $(FFTW_LICENSE_FILES)
+
+FFTQ_CONF_ENV = $(FFTW_CONF_ENV)
+
+FFTQ_CONF_OPTS = $(FFTW_CONF_OPTS)
+FFTQ_CONF_OPTS += --enable-quad-precision
+
+FFTQ_CFLAGS = $(FFTW_CFLAGS)
+
+$(eval $(autotools-package))
+
+
-- 
2.7.4
