From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  1 Aug 2014 19:32:39 +0200
Subject: [Buildroot] [PATCH v16 3/3] xbmc: Add VA-API support
In-Reply-To: <1406914359-31106-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406914359-31106-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1406914359-31106-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 920d731..880b3d4 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -52,7 +52,6 @@ XBMC_CONF_OPT +=  \
 	--disable-projectm \
 	--disable-pulse \
 	--disable-ssh \
-	--disable-vaapi \
 	--disable-vdpau \
 	--disable-vtbdecoder \
 	--enable-optimizations
@@ -186,6 +185,14 @@ ifeq ($(BR2_PACKAGE_XBMC_LIBTHEORA),y)
 XBMC_DEPENDENCIES += libtheora
 endif
 
+# xbmc needs libva & libva-glx
+ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),yy)
+XBMC_DEPENDENCIES += mesa3d libva
+XBMC_CONF_OPT += --enable-vaapi
+else
+XBMC_CONF_OPT += --disable-vaapi
+endif
+
 # Add HOST_DIR to PATH for codegenerator.mk to find swig
 define XBMC_BOOTSTRAP
 	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
-- 
1.7.10.4
