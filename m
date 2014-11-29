From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Nov 2014 21:54:37 +0100
Subject: [Buildroot] [PATCH 2/2] package/gnuplot: fix static linking with
	libiconv
In-Reply-To: <1417294477-12145-1-git-send-email-bernd.kuhls@t-online.de>
References: <1417294477-12145-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1417294477-12145-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Second of two patches to fix
http://autobuild.buildroot.net/results/238/2386edb7f95920e84a35811a33f4333ee0a7a860/
http://autobuild.buildroot.net/results/57e/57ef313d3bd3da2b3e13f7fadb91006eb3f03a17/
http://autobuild.buildroot.net/results/a45/a45048a9b93d36aac0f5dd493f669a2dbd545744/
http://autobuild.buildroot.net/results/b6e/b6ee5d8f30601e37cb786eb7732c05117894851f/
http://autobuild.buildroot.net/results/7f3/7f392abeb7a058c9263c107b1640356e2583987a/
http://autobuild.buildroot.net/results/8d8/8d8cb2f2d5946f5342b96bb0ec4a3c9ffce88024/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gnuplot/gnuplot.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 238da68..45e33eb 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -26,8 +26,9 @@ GNUPLOT_CONF_OPTS = --without-x \
 
 ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
 GNUPLOT_CONF_OPTS += --with-gd
-GNUPLOT_DEPENDENCIES += gd
+GNUPLOT_DEPENDENCIES += gd $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 GNUPLOT_CONF_ENV += \
+	$(if $(BR2_PACKAGE_LIBICONV),LIBS="-liconv") \
 	ac_cv_path_GDLIB_CONFIG=$(STAGING_DIR)/usr/bin/gdlib-config
 else
 GNUPLOT_CONF_OPTS += --without-gd
-- 
1.7.10.4
