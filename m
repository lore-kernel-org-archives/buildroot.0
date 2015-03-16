From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 19:44:02 +0100
Subject: [Buildroot] [git commit] fftw: add compile precision option
Message-ID: <20150316184431.7E36A7FAEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a990ed296de3c021891373fa14f8789f4d7fa422
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fftw has options to select compile precision between single, long-double
and quad. These options are exclusives. This patch adds choice to select
precision option.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[yann.morin.1998 at free.fr: use --disable-XXX when not enabled; reword
 prompts (default is not 'none' but 'double')
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: guillaume william brs <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fftw/Config.in |   41 +++++++++++++++++++++++++++++++++++++++++
 package/fftw/fftw.mk   |    4 ++++
 2 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index 36f849f..4cefa28 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -9,3 +9,44 @@ config BR2_PACKAGE_FFTW
 	  double precision.
 
 	  http://www.fftw.org
+
+if BR2_PACKAGE_FFTW
+
+choice
+	prompt "fftw precision"
+	default BR2_PACKAGE_FFTW_PRECISION_DOUBLE
+	help
+	  Selects fftw precision
+
+config BR2_PACKAGE_FFTW_PRECISION_SINGLE
+	bool "single"
+	help
+	  Compile fftw in single precision, i.e. use 'float' for floating
+	  point type.
+
+config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
+	bool "double"
+	help
+	  Compile fftw in double precision (the default), i.e. use 'double'
+	  for floating point type.
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
+config BR2_PACKAGE_FFTW_PRECISION_QUAD
+	bool "quad"
+	# quad-precision needs to have a gcc with libquadmath
+	depends on (BR2_i386 || BR2_x86_64) && BR2_USE_WCHAR
+	help
+	  Compile fftw in quadruple precision, i.e. use '__float128' for
+	  floating point type.
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
