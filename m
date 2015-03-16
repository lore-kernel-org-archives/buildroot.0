From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 14:54:05 +0100
Subject: [Buildroot] [PATCH 7/7 v6] package/fftw: add option for fast maths
In-Reply-To: <cover.1426513949.git.yann.morin.1998@free.fr>
References: <cover.1426513949.git.yann.morin.1998@free.fr>
Message-ID: <0842316b8be377f09daf4c2f6a8d05fd303237d8.1426513949.git.yann.morin.1998@free.fr>
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
index a0f353c..f088b4c 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -58,4 +58,17 @@ config BR2_PACKAGE_FFTW_PRECISION_QUAD
 
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
index c6fe6f0..6ba4806 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -27,4 +27,8 @@ FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),--enable,--disable)-neon
 FFTW_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable,--disable)-threads
 FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable-openmp,--disable-openmp)
 
+ifeq ($(BR2_PACKAGE_FFTW_FAST),y)
+FFTW_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS) -Ofast"
+endif
+
 $(eval $(autotools-package))
-- 
1.9.1
