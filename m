From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Sat, 14 Mar 2015 16:29:52 +0100
Subject: [Buildroot] [PATCH v3 1/1] fftw: add compile precision option
Message-ID: <1426346992-24724-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

fftw has options to select compile precision between single, long-double and
quad. These options are exclusives. This patch adds choice to select precision
option.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v2 -> v3:
 * add depends instruction for quad-precision. This option needs to have a
   toolchain with libquadmath enabled (only x86, x86_64 and Itanium).
Changes v1 -> v2:
 * FFTW_CONFIGURE_OPTS -> FFTW_CONF_OPTS
---
 package/fftw/Config.in | 34 ++++++++++++++++++++++++++++++++++
 package/fftw/fftw.mk   |  9 +++++++++
 2 files changed, 43 insertions(+)

diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index 36f849f..03acb56 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -9,3 +9,37 @@ config BR2_PACKAGE_FFTW
 	  double precision.
 
 	  http://www.fftw.org
+
+if BR2_PACKAGE_FFTW
+
+choice
+	prompt "fftw precision"
+	default BR2_PACKAGE_FFTW_PRECISION_NONE
+	help
+	  Selects fftw precision
+
+config BR2_PACKAGE_FFTW_PRECISION_NONE
+	bool "none"
+	help
+	  no compile precision selected
+
+config BR2_PACKAGE_FFTW_PRECISION_SINGLE
+	bool "single precision"
+	help
+	  compile fftw in single precision
+
+config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
+	bool "long double precision"
+	help
+	  compile fftw in long-double precision
+
+config BR2_PACKAGE_FFTW_PRECISION_QUAD
+	bool "quad precision"
+	# quad-precision needs to have a gcc with libquadmath
+	depends on (BR2_i386 || BR2_x86_64) && BR2_USE_WCHAR
+	help
+	  compile fftw in quadruple precision if available
+
+endchoice
+
+endif
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 3b302df..80cc0dc 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -10,4 +10,13 @@ FFTW_INSTALL_STAGING = YES
 FFTW_LICENSE = GPLv2+
 FFTW_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
+FFTW_CONF_OPTS = --enable-single
+endif
+ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
+FFTW_CONF_OPTS = --enable-long-double
+endif
+ifeq ($(BR2_PACKAGE_FFTW_PRECISION_QUAD),y)
+FFTW_CONF_OPTS = --enable-quad-precision
+endif
 $(eval $(autotools-package))
-- 
2.0.5
