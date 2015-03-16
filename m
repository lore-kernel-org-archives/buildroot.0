From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 19:44:02 +0100
Subject: [Buildroot] [git commit] package/fftw: add option for fast maths
Message-ID: <20150316184431.864E77FA25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96336c624855e08b6c0ec9200e9784c2b9be1afb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use FFTW_CFLAGS as intermediate variable, since we're going to need it
in a later patch (about NEON optimisations).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[based on a patch by Guillaume]
Cc: guillaume william brs <guillaume.bressaix@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Tested-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fftw/Config.in |   13 +++++++++++++
 package/fftw/fftw.mk   |    7 +++++++
 2 files changed, 20 insertions(+), 0 deletions(-)

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
