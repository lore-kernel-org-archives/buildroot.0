From: Matt Flax <flatmax@flatmax.org>
Date: Sun, 21 Aug 2016 11:57:49 +1000
Subject: [Buildroot] [PATCH 2/2] package/fftw : Allow all precisions to be
	installed at the same time.
Message-ID: <1471744669-19297-1-git-send-email-flatmax@flatmax.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This updates the current fftw package to allow the installation and selection
of one more of the fftw precisions onto the system. Previously, you could
only choose one prevision at a time, however there are many use cases where
different precisions are required on the same system. Further, various packages
selected BR2_PACKAGE_FFTW assuming the double precision version would be
compile, which was a buggy assumption.

Following previous suggestions and discussions, a common fftw mk file is used.
The hash file is symbolically linked against. To preserve the previous behavior,
if BR2_PACKAGE_FFTW is selected, this defaults to the double precision version.
Other available precisions are now BR2_PACKAGE_FFTWF, BR2_PACKAGE_FFTWL,
BR2_PACKAGE_FFTWQ which is the fftw standard for singe, long double and quad
precisions.

The following packages have been updated : liquid-dsp, gnuradio
These packages required single precision installations.
Other packages : libvips, pulseaudio, httping, imagemagick, alsa-utils
implicitly required double precision without enforcing it, merely assuming
this would happen by default. This was not the case when the user selected a
different precision.

Signed-off-by: Matt Flax <flatmax@flatmax.org>
---
 package/fftw/Config.in           | 69 +++++++---------------------------------
 package/fftw/fftw-common.mk      | 44 +++++++++++++++++++++++++
 package/fftw/fftw.mk             | 45 ++------------------------
 package/fftw/fftw/Config.in      |  7 ++++
 package/fftw/fftw/fftw.hash      |  1 +
 package/fftw/fftw/fftw.mk        | 21 ++++++++++++
 package/fftw/fftwf/Config.in     |  8 +++++
 package/fftw/fftwf/fftwf.hash    |  1 +
 package/fftw/fftwf/fftwf.mk      | 21 ++++++++++++
 package/fftw/fftwl/Config.in     |  8 +++++
 package/fftw/fftwl/fftwl.hash    |  1 +
 package/fftw/fftwl/fftwl.mk      | 21 ++++++++++++
 package/fftw/fftwq/Config.in     |  7 ++++
 package/fftw/fftwq/fftwq.hash    |  1 +
 package/fftw/fftwq/fftwq.mk      | 21 ++++++++++++
 package/gnuradio/Config.in       |  4 +--
 package/gnuradio/gnuradio.mk     |  2 +-
 package/liquid-dsp/liquid-dsp.mk | 10 ++++--
 18 files changed, 185 insertions(+), 107 deletions(-)
 create mode 100644 package/fftw/fftw-common.mk
 create mode 100644 package/fftw/fftw/Config.in
 create mode 120000 package/fftw/fftw/fftw.hash
 create mode 100644 package/fftw/fftw/fftw.mk
 create mode 100644 package/fftw/fftwf/Config.in
 create mode 120000 package/fftw/fftwf/fftwf.hash
 create mode 100644 package/fftw/fftwf/fftwf.mk
 create mode 100644 package/fftw/fftwl/Config.in
 create mode 120000 package/fftw/fftwl/fftwl.hash
 create mode 100644 package/fftw/fftwl/fftwl.mk
 create mode 100644 package/fftw/fftwq/Config.in
 create mode 120000 package/fftw/fftwq/fftwq.hash
 create mode 100644 package/fftw/fftwq/fftwq.mk

diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index ef11384..7f21344 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -1,66 +1,20 @@
-config BR2_PACKAGE_FFTW
-	bool "fftw"
-	help
-	  Library for computing Fast Fourier Transforms.
-
-	  This library computes Fast Fourier Transforms (FFT) in one
-	  or more dimensions. It is extremely fast. This package
-	  contains the shared library version of the fftw libraries in
-	  double precision.
+menu "FFTW precision and options"
 
-	  http://www.fftw.org
-
-if BR2_PACKAGE_FFTW
+source "package/fftw/fftw/Config.in"
+source "package/fftw/fftwf/Config.in"
+source "package/fftw/fftwl/Config.in"
+source "package/fftw/fftwq/Config.in"
 
 config BR2_PACKAGE_FFTW_USE_SSE
-	bool
+	bool "use SSE"
+	depends on BR2_X86_CPU_HAS_SSE
 
 config BR2_PACKAGE_FFTW_USE_SSE2
-	bool
+	bool "use SSE2"
+	depends on BR2_X86_CPU_HAS_SSE
 
 config BR2_PACKAGE_FFTW_USE_NEON
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
+	bool "use NEON"
 
 config BR2_PACKAGE_FFTW_FAST
 	bool "optimise for speed over accuracy"
@@ -74,5 +28,4 @@ config BR2_PACKAGE_FFTW_FAST
 	  This basically uses gcc's -Ofast optimisation level, which in
 	  turn is basically using gcc's -ffast-math. See the gcc manual
 	  for what this means.
-
-endif
+endmenu
diff --git a/package/fftw/fftw-common.mk b/package/fftw/fftw-common.mk
new file mode 100644
index 0000000..4d8deef
--- /dev/null
+++ b/package/fftw/fftw-common.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# fftw
+#
+################################################################################
+
+FFTW_COMMON_VERSION = 3.3.4
+FFTW_COMMON_SITE = http://www.fftw.org
+FFTW_COMMON_INSTALL_STAGING = YES
+FFTW_COMMON_LICENSE = GPLv2+
+FFTW_COMMON_LICENSE_FILES = COPYING
+
+# fortran support only enables generation and installation of fortran sources
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
+FFTW_COMMON_CONF_OPTS += --enable-fortran
+FFTW_COMMON_CONF_ENV += FLIBS="-lgfortran -lm"
+else
+FFTW_COMMON_CONF_OPTS += --disable-fortran
+endif
+
+FFTW_COMMON_CFLAGS = $(TARGET_CFLAGS)
+ifeq ($(BR2_PACKAGE_FFTW_COMMON_FAST),y)
+FFTW_COMMON_CFLAGS += -O3 -ffast-math
+endif
+
+# x86 optimisations
+FFTW_COMMON_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE),--enable,--disable)-sse
+FFTW_COMMON_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
+
+# ARM optimisations
+FFTW_COMMON_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),--enable,--disable)-neon
+FFTW_COMMON_CFLAGS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),-mfpu=neon)
+
+# Generic optimisations
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+FFTW_COMMON_CONF_OPTS += --enable-threads
+FFTW_COMMON_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--without,--with)-combined-threads
+else
+FFTW_COMMON_CONF_OPTS += --disable-threads
+endif
+FFTW_COMMON_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
+
+FFTW_COMMON_CONF_OPTS += CFLAGS="$(FFTW_COMMON_CFLAGS)"
+
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 5bd39a8..c33278f 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -4,46 +4,5 @@
 #
 ################################################################################
 
-FFTW_VERSION = 3.3.4
-FFTW_SITE = http://www.fftw.org
-FFTW_INSTALL_STAGING = YES
-FFTW_LICENSE = GPLv2+
-FFTW_LICENSE_FILES = COPYING
-
-# fortran support only enables generation and installation of fortran sources
-ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
-FFTW_CONF_OPTS += --enable-fortran
-FFTW_CONF_ENV += FLIBS="-lgfortran -lm"
-else
-FFTW_CONF_OPTS += --disable-fortran
-endif
-
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-single
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision
-
-FFTW_CFLAGS = $(TARGET_CFLAGS)
-ifeq ($(BR2_PACKAGE_FFTW_FAST),y)
-FFTW_CFLAGS += -O3 -ffast-math
-endif
-
-# x86 optimisations
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE),--enable,--disable)-sse
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
-
-# ARM optimisations
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),--enable,--disable)-neon
-FFTW_CFLAGS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),-mfpu=neon)
-
-# Generic optimisations
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-FFTW_CONF_OPTS += --enable-threads
-FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--without,--with)-combined-threads
-else
-FFTW_CONF_OPTS += --disable-threads
-endif
-FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
-
-FFTW_CONF_OPTS += CFLAGS="$(FFTW_CFLAGS)"
-
-$(eval $(autotools-package))
+include package/fftw/fftw-common.mk
+include $(sort $(wildcard package/fftw/*/*.mk))
diff --git a/package/fftw/fftw/Config.in b/package/fftw/fftw/Config.in
new file mode 100644
index 0000000..a91d519
--- /dev/null
+++ b/package/fftw/fftw/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FFTW
+	bool "fftw"
+	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
+	select BR2_PACKAGE_FFTW_USE_NEON if BR2_ARM_CPU_HAS_NEON && !BR2_ARM_SOFT_FLOAT && (BR2_cortex_a53 || BR2_aarch64)
+	help
+	  Compile fftw in double precision (the default), i.e. use 'double'
+	  for floating point type.
diff --git a/package/fftw/fftw/fftw.hash b/package/fftw/fftw/fftw.hash
new file mode 120000
index 0000000..3ee7ecb
--- /dev/null
+++ b/package/fftw/fftw/fftw.hash
@@ -0,0 +1 @@
+../fftw.hash
\ No newline at end of file
diff --git a/package/fftw/fftw/fftw.mk b/package/fftw/fftw/fftw.mk
new file mode 100644
index 0000000..f09d890
--- /dev/null
+++ b/package/fftw/fftw/fftw.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# fftw
+#
+################################################################################
+
+FFTW_VERSION = $(FFTW_COMMON_VERSION)
+FFTW_SOURCE = fftw-$(FFTW_VERSION).tar.gz
+FFTW_SITE = $(FFTW_COMMON_SITE)
+FFTW_INSTALL_STAGING = $(FFTW_COMMON_INSTALL_STAGING)
+FFTW_LICENSE = $(FFTW_COMMON_LICENSE)
+FFTW_LICENSE_FILES = $(FFTW_COMMON_LICENSE_FILES)
+
+FFTW_CONF_ENV = $(FFTW_COMMON_CONF_ENV)
+
+FFTW_CONF_OPTS=$(subst enable-neon, disable-neon, $(FFTW_COMMON_CONF_OPTS))
+
+FFTW_CFLAGS = $(FFTW_COMMON_CFLAGS)
+
+
+$(eval $(autotools-package))
diff --git a/package/fftw/fftwf/Config.in b/package/fftw/fftwf/Config.in
new file mode 100644
index 0000000..1995fd1
--- /dev/null
+++ b/package/fftw/fftwf/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FFTWF
+	bool "fftwf"
+	select BR2_PACKAGE_FFTW_USE_SSE if BR2_X86_CPU_HAS_SSE
+	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
+	select BR2_PACKAGE_FFTW_USE_NEON if BR2_ARM_CPU_HAS_NEON && !BR2_ARM_SOFT_FLOAT
+	help
+	  Compile fftw in single precision, i.e. use 'float' for floating
+	  point type.
diff --git a/package/fftw/fftwf/fftwf.hash b/package/fftw/fftwf/fftwf.hash
new file mode 120000
index 0000000..3ee7ecb
--- /dev/null
+++ b/package/fftw/fftwf/fftwf.hash
@@ -0,0 +1 @@
+../fftw.hash
\ No newline at end of file
diff --git a/package/fftw/fftwf/fftwf.mk b/package/fftw/fftwf/fftwf.mk
new file mode 100644
index 0000000..c4f5182
--- /dev/null
+++ b/package/fftw/fftwf/fftwf.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# fftwf
+#
+################################################################################
+
+FFTWF_VERSION = $(FFTW_COMMON_VERSION)
+FFTWF_SOURCE = fftw-$(FFTWF_VERSION).tar.gz
+FFTWF_SITE = $(FFTW_COMMON_SITE)
+FFTWF_INSTALL_STAGING = $(FFTW_COMMON_INSTALL_STAGING)
+FFTWF_LICENSE = $(FFTW_COMMON_LICENSE)
+FFTWF_LICENSE_FILES = $(FFTW_COMMON_LICENSE_FILES)
+
+FFTWF_CONF_ENV = $(FFTW_COMMON_CONF_ENV)
+
+FFTWF_CONF_OPTS = $(FFTW_COMMON_CONF_OPTS)
+FFTWF_CONF_OPTS += --enable-single
+
+FFTWF_CFLAGS = $(FFTW_COMMON_CFLAGS)
+
+$(eval $(autotools-package))
diff --git a/package/fftw/fftwl/Config.in b/package/fftw/fftwl/Config.in
new file mode 100644
index 0000000..2c791e1
--- /dev/null
+++ b/package/fftw/fftwl/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FFTWL
+	bool "fftwl"
+	# long-double precision require long-double trigonometric routines
+	depends on !(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && \
+		(BR2_arm || BR2_mips || BR2_mipsel))
+	help
+	  Compile fftw in long double precision, i.e. use 'long double'
+	  for floating point type.
diff --git a/package/fftw/fftwl/fftwl.hash b/package/fftw/fftwl/fftwl.hash
new file mode 120000
index 0000000..3ee7ecb
--- /dev/null
+++ b/package/fftw/fftwl/fftwl.hash
@@ -0,0 +1 @@
+../fftw.hash
\ No newline at end of file
diff --git a/package/fftw/fftwl/fftwl.mk b/package/fftw/fftwl/fftwl.mk
new file mode 100644
index 0000000..150a958
--- /dev/null
+++ b/package/fftw/fftwl/fftwl.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# fftwl
+#
+################################################################################
+
+FFTWL_VERSION = $(FFTW_COMMON_VERSION)
+FFTWL_SOURCE = fftw-$(FFTWL_VERSION).tar.gz
+FFTWL_SITE = $(FFTW_COMMON_SITE)
+FFTWL_INSTALL_STAGING = $(FFTW_COMMON_INSTALL_STAGING)
+FFTWL_LICENSE = $(FFTW_COMMON_LICENSE)
+FFTWL_LICENSE_FILES = $(FFTW_COMMON_LICENSE_FILES)
+
+FFTWL_CONF_ENV = $(FFTW_COMMON_CONF_ENV)
+
+FFTWL_CONF_OPTS=$(subst enable-neon, disable-neon, $(FFTW_COMMON_CONF_OPTS))
+FFTWL_CONF_OPTS += --enable-long-double
+
+FFTWL_CFLAGS = $(FFTW_COMMON_CFLAGS)
+
+$(eval $(autotools-package))
diff --git a/package/fftw/fftwq/Config.in b/package/fftw/fftwq/Config.in
new file mode 100644
index 0000000..2811701
--- /dev/null
+++ b/package/fftw/fftwq/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FFTWQ
+	bool "fftwq"
+	# quad-precision needs to have a gcc with libquadmath
+	depends on (BR2_i386 || BR2_x86_64) && BR2_USE_WCHAR
+	help
+	  Compile fftw in quadruple precision, i.e. use '__float128' for
+	  floating point type.
diff --git a/package/fftw/fftwq/fftwq.hash b/package/fftw/fftwq/fftwq.hash
new file mode 120000
index 0000000..3ee7ecb
--- /dev/null
+++ b/package/fftw/fftwq/fftwq.hash
@@ -0,0 +1 @@
+../fftw.hash
\ No newline at end of file
diff --git a/package/fftw/fftwq/fftwq.mk b/package/fftw/fftwq/fftwq.mk
new file mode 100644
index 0000000..a53a91d
--- /dev/null
+++ b/package/fftw/fftwq/fftwq.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# fftwq
+#
+################################################################################
+
+FFTWQ_VERSION = $(FFTW_COMMON_VERSION)
+FFTWQ_SOURCE = fftw-$(FFTWQ_VERSION).tar.gz
+FFTWQ_SITE = $(FFTW_COMMON_SITE)
+FFTWQ_INSTALL_STAGING = $(FFTW_COMMON_INSTALL_STAGING)
+FFTWQ_LICENSE = $(FFTW_COMMON_LICENSE)
+FFTWQ_LICENSE_FILES = $(FFTW_COMMON_LICENSE_FILES)
+
+FFTWQ_CONF_ENV = $(FFTW_COMMON_CONF_ENV)
+
+FFTWQ_CONF_OPTS=$(subst enable-neon, disable-neon, $(FFTW_COMMON_CONF_OPTS))
+FFTWQ_CONF_OPTS += --enable-quad-precision
+
+FFTWQ_CFLAGS = $(FFTW_COMMON_CFLAGS)
+
+$(eval $(autotools-package))
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 50f5e7f..b07831d 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -68,9 +68,9 @@ config BR2_PACKAGE_GNURADIO_UTILS
 	  Misc python utilities
 
 comment "gr-fft, -filter, -analog, -channels, -digital, -trellis, -pager, -qtgui depends fftw's single precision"
-	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
+	depends on !BR2_PACKAGE_FFTWF
 
-if BR2_PACKAGE_FFTW_PRECISION_SINGLE
+if BR2_PACKAGE_FFTWF
 
 config BR2_PACKAGE_GNURADIO_ANALOG
 	bool "gr-analog support"
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 972f7a4..045a112 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -95,7 +95,7 @@ GNURADIO_CONF_OPTS += -DENABLE_GR_FEC=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNURADIO_FFT),y)
-GNURADIO_DEPENDENCIES += fftw
+GNURADIO_DEPENDENCIES += fftwf
 GNURADIO_CONF_OPTS += -DENABLE_GR_FFT=ON
 else
 GNURADIO_CONF_OPTS += -DENABLE_GR_FFT=OFF
diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index b5fb44c..921d97d 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -30,7 +30,7 @@ LIQUID_DSP_CFLAGS += -ffast-math
 endif
 
 # use FFTW instead of built-in FFT
-ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
+ifeq ($(BR2_PACKAGE_FFTWF),y)
 LIQUID_DSP_LDFLAGS += -lfftw3f
 endif
 
@@ -39,14 +39,18 @@ ifeq ($(BR2_powerpc)$(BR2_powerpc64),y)
 LIQUID_DSP_CONF_OPTS += --enable-simdoverride
 endif
 
-ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
+ifeq ($(BR2_PACKAGE_FFTW),y)
 LIQUID_DSP_LDFLAGS += -lfftw3
 endif
 
-ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
+ifeq ($(BR2_PACKAGE_FFTWL),y)
 LIQUID_DSP_LDFLAGS += -lfftw3l
 endif
 
+ifeq ($(BR2_PACKAGE_FFTWQ),y)
+LIQUID_DSP_LDFLAGS += -lfftw3q
+endif
+
 LIQUID_DSP_CONF_OPTS += \
 	CFLAGS="$(LIQUID_DSP_CFLAGS)" \
 	LDFLAGS="$(LIQUID_DSP_LDFLAGS)"
-- 
2.7.4
