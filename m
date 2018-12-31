From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:30:14 +0100
Subject: [Buildroot] [PATCH v3 01/17] package/fftw: prepare for splitting
 into multiple packages
In-Reply-To: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181231133030.25991-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for splitting into multiple packages, this commit
changes the fftw.mk package to use FFTW_COMMON_CONF_OPTS,
FFTW_COMMON_CONF_ENV and FFTW_COMMON_CFLAGS, which will be re-used by
the soon-to-be-introduced per-precision packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fftw/fftw.mk | 40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index b167a2f6f7..8b76b7c190 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -12,38 +12,40 @@ FFTW_LICENSE_FILES = COPYING
 
 # fortran support only enables generation and installation of fortran sources
 ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
-FFTW_CONF_OPTS += --enable-fortran
-FFTW_CONF_ENV += FLIBS="-lgfortran -lm"
+FFTW_COMMON_CONF_OPTS += --enable-fortran
+FFTW_COMMON_CONF_ENV += FLIBS="-lgfortran -lm"
 else
-FFTW_CONF_OPTS += --disable-fortran
+FFTW_COMMON_CONF_OPTS += --disable-fortran
 endif
 
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-single
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision
-
-FFTW_CFLAGS = $(TARGET_CFLAGS)
+FFTW_COMMON_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_PACKAGE_FFTW_FAST),y)
-FFTW_CFLAGS += -O3 -ffast-math
+FFTW_COMMON_CFLAGS += -O3 -ffast-math
 endif
 
 # x86 optimisations
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE),--enable,--disable)-sse
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
+FFTW_COMMON_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE),--enable,--disable)-sse
+FFTW_COMMON_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
 
 # ARM optimisations
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),--enable,--disable)-neon
-FFTW_CFLAGS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),-mfpu=neon)
+FFTW_COMMON_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),--enable,--disable)-neon
+FFTW_COMMON_CFLAGS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),-mfpu=neon)
 
 # Generic optimisations
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-FFTW_CONF_OPTS += --enable-threads
-FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--without,--with)-combined-threads
+FFTW_COMMON_CONF_OPTS += --enable-threads
+FFTW_COMMON_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--without,--with)-combined-threads
 else
-FFTW_CONF_OPTS += --disable-threads
+FFTW_COMMON_CONF_OPTS += --disable-threads
 endif
-FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
-
-FFTW_CONF_OPTS += CFLAGS="$(FFTW_CFLAGS)"
+FFTW_COMMON_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
+
+FFTW_CONF_ENV = $(FFTW_COMMON_CONF_ENV)
+FFTW_CONF_OPTS += \
+	$(FFTW_COMMON_CONF_OPTS) \
+	$(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-single \
+	$(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double \
+	$(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision \
+	CFLAGS="$(FFTW_COMMON_CFLAGS)"
 
 $(eval $(autotools-package))
-- 
2.20.1
