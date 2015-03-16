From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 17:31:21 +0100
Subject: [Buildroot] [PATCH 2/7 v7] package/fftw: add option for fast maths
In-Reply-To: <cover.1426523417.git.yann.morin.1998@free.fr>
References: <cover.1426523417.git.yann.morin.1998@free.fr>
Message-ID: <a7f2136328e2beb43f96d9511dc39c80cd9f8b27.1426523417.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use FFTW_CFLAGS as intermediate variable, since we're going to need it
in a later patch (about NEON optimisations).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[based on a patch by Guillaume]
Cc: guillaume william brs <guillaume.bressaix@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Tested-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

---
Changes v6 -> v7:
  - use intermediate FFTW_CFLAGS
  - reorder patch
---
 package/fftw/Config.in | 13 +++++++++++++
 package/fftw/fftw.mk   |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index 4cefa28..4a0706a 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -49,4 +49,17 @@ config BR2_PACKAGE_FFTW_PRECISION_QUAD
 
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
index 78d36e9..c05012a 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -14,4 +14,11 @@ FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision
 
+FFTW_CFLAGS = $(TARGET_CFLAGS)
+ifeq ($(BR2_PACKAGE_FFTW_FAST),y)
+FFTW_CFLAGS += -Ofast
+endif
+
+FFTW_CONF_OPTS += CFLAGS="$(FFTW_CFLAGS)"
+
 $(eval $(autotools-package))
-- 
1.9.1
