From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 10 Apr 2013 23:23:37 -0500
Subject: [Buildroot] [PATCH 1/1] fftwf: Add fftwf package for single
	precision fft
Message-ID: <1365654219-15272-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Spenser Gilliland <Spenser309@gmail.com>

The current fftw package only produces double precision floating point
libraries.  This package recompiles the library for single precision and
uses the neon extensions if available.

Signed-off-by: Spenser Gilliland <Spenser309@gmail.com>
---
 package/Config.in       |    1 +
 package/fftwf/Config.in |   14 ++++++++++++++
 package/fftwf/fftwf.mk  |   19 +++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/fftwf/Config.in
 create mode 100644 package/fftwf/fftwf.mk

diff --git a/package/Config.in b/package/Config.in
index 69d87f0..b1bbfea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -550,6 +550,7 @@ source "package/libcofi/Config.in"
 source "package/classpath/Config.in"
 source "package/elfutils/Config.in"
 source "package/fftw/Config.in"
+source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
 source "package/boost/Config.in"
diff --git a/package/fftwf/Config.in b/package/fftwf/Config.in
new file mode 100644
index 0000000..243be02
--- /dev/null
+++ b/package/fftwf/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_FFTWF
+	bool "fftwf"
+	depends on BR2_PACKAGE_FFTW
+	help
+	  Library for computing Fast Fourier Transforms using the ARM Neon
+	  instruction set.
+
+	  This library computes Fast Fourier Transforms (FFT) in one 
+	  or more dimensions.  It is extremely fast. This package 
+	  contains the shared library version of the fftw libraries in 
+	  single precision.
+	
+	  http://www.fftw.org
+           
diff --git a/package/fftwf/fftwf.mk b/package/fftwf/fftwf.mk
new file mode 100644
index 0000000..b798244
--- /dev/null
+++ b/package/fftwf/fftwf.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# fftwf
+#
+################################################################################
+
+FFTWF_VERSION = $(FFTW_VERSION) 
+FFTWF_SITE = $(FFTW_SITE) 
+FFTWF_SOURCE = fftw-$(FFTWF_VERSION).tar.gz
+FFTWF_INSTALL_STAGING = YES
+
+ifeq ($(BR2_ARM_ENABLE_NEON),y)
+FFTWF_CONF_OPT = --enable-single --enable-neon
+else
+FFTWF_CONF_OPT = --enable-single
+endif
+
+$(eval $(autotools-package))
+
-- 
1.7.9.5
