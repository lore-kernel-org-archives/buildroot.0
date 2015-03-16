From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 01:31:47 +0100
Subject: [Buildroot] [PATCH 7/7 v5] package/fftw: add option for fast maths
In-Reply-To: <cover.1426465664.git.yann.morin.1998@free.fr>
References: <cover.1426465664.git.yann.morin.1998@free.fr>
Message-ID: <984522fc4ea6415f68d5a560cc3a56e5cca08694.1426465664.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[based on a patch by Guillaume]
Cc: guillaume william brs <guillaume.bressaix@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/fftw/Config.in | 13 +++++++++++++
 package/fftw/fftw.mk   |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index 7fa2c4c..365cbb4 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -46,4 +46,17 @@ config BR2_PACKAGE_FFTW_PRECISION_QUAD
 
 endchoice
 
+config BR2_PACKAGE_FFTW_FAST
+	bool "optimise for speed over accuracy"
+	help
+	  Optimise for fast math functions, at the expense of accuracy.
+
+	  Say 'y' if you need speed and can live with inaccuracies in
+	  the results. Say 'n' (the default) if accuracy is of utmost
+	  importance.
+
+	  This basically uses gcc's -Ofast optimisation level, which in
+	  turn is basically using gcc's -ffast-math. See the gcc manual
+	  for what this means.
+
 endif
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 8ae0824..ecf3e76 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -27,4 +27,8 @@ FFTW_CONF_OPTS += $(if $(BR2_ARM_CPU_HAS_NEON),--enable,--disable)-neon
 FFTW_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-threads,--disable-threads)
 FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable-openmp,--disable-openmp)
 
+ifeq ($(BR2_PACKAGE_FFTW_FAST),y)
+FFTW_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS) -Ofast"
+endif
+
 $(eval $(autotools-package))
-- 
1.9.1
