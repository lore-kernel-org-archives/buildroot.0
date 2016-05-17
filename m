From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 17 May 2016 17:54:00 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: fix build when
	BR2_PACKAGE_LIBFSLVPUWRAP=y
Message-ID: <1463500440-25200-1-git-send-email-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kodi now needs the following headers to sucessfully build on some i.MX
platforms:

* ipu.h and mxcfb.h from the kernel
* g2d.h from the imx-gpu-viv package

Add the missing dependencies.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
Note: I had to install .py files to test Kodi on my target (APF6D) with 
BR2_PACKAGE_PYTHON_PY_PYC otherwise Kodi complained that it couldn't find 
site.py and crashed at startup.

 package/kodi/Config.in | 1 +
 package/kodi/kodi.mk   | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index ff2e75c..f27f6ed 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -58,6 +58,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_GIFLIB
+	select BR2_PACKAGE_IMX_GPU_VIV_G2D if BR2_PACKAGE_LIBFSLVPUWRAP
 	select BR2_PACKAGE_JASPER
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBASS
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index e163c24..394b174 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -54,8 +54,10 @@ KODI_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFSLVPUWRAP),y)
-KODI_DEPENDENCIES += libfslvpuwrap
+# imx-lib needs access to imx-specific kernel headers
+KODI_DEPENDENCIES += imx-gpu-viv libfslvpuwrap linux
 KODI_CONF_OPTS += --enable-codec=imxvpu
+KODI_CONF_ENV += INCLUDES="-idirafter $(LINUX_DIR)/include/uapi"
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-- 
2.3.6
