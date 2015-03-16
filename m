From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 14:53:59 +0100
Subject: [Buildroot] [PATCH 1/7 v6] fftw: add compile precision option
In-Reply-To: <cover.1426513949.git.yann.morin.1998@free.fr>
References: <cover.1426513949.git.yann.morin.1998@free.fr>
Message-ID: <9082dcdcb396eba585a19ec7ebd543bd69e0e47f.1426513949.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

fftw has options to select compile precision between single, long-double
and quad. These options are exclusives. This patch adds choice to select
precision option.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[yann.morin.1998 at free.fr: use --disable-XXX when not enabled]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: guillaume william brs <guillaume.bressaix@gmail.com>
---
 package/fftw/Config.in | 38 ++++++++++++++++++++++++++++++++++++++
 package/fftw/fftw.mk   |  4 ++++
 2 files changed, 42 insertions(+)

diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index 36f849f..7fa2c4c 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -9,3 +9,41 @@ config BR2_PACKAGE_FFTW
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
+	# long-double precision require long-double trigonometric routines
+	depends on !(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && \
+		(BR2_arm || BR2_mips || BR2_mipsel))
+
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
index 3b302df..78d36e9 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -10,4 +10,8 @@ FFTW_INSTALL_STAGING = YES
 FFTW_LICENSE = GPLv2+
 FFTW_LICENSE_FILES = COPYING
 
+FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-single
+FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double
+FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision
+
 $(eval $(autotools-package))
-- 
1.9.1
