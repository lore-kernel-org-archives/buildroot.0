From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 22:20:38 +0200
Subject: [Buildroot] [git commit] package/xbmc: add option to enable libva
Message-ID: <20140923202048.CAB049D74F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e68d91a8bb4bb2965cb0a1e0f88e2590867e246
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add the comment about the dynamic library dependency.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xbmc/Config.in |   10 ++++++++++
 package/xbmc/xbmc.mk   |    2 +-
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index ed0d4ed..54f8855 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -210,6 +210,16 @@ config BR2_PACKAGE_XBMC_LIBUSB
 	help
 	  Enable libusb support.
 
+config BR2_PACKAGE_XBMC_LIBVA
+	bool "va"
+	select BR2_PACKAGE_LIBVA
+	depends on !BR2_PREFER_STATIC_LIB
+	help
+	  Enable libva support.
+
+comment "libva support needs toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_XBMC_WAVPACK
 	bool "wavpack"
 	select BR2_PACKAGE_WAVPACK
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index a38128f..87c9d72 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -193,7 +193,7 @@ XBMC_DEPENDENCIES += libtheora
 endif
 
 # xbmc needs libva & libva-glx
-ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),yy)
+ifeq ($(BR2_PACKAGE_XBMC_LIBVA)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),yy)
 XBMC_DEPENDENCIES += mesa3d libva
 XBMC_CONF_OPT += --enable-vaapi
 else
