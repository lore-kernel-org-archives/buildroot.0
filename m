From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 23:06:28 +0200
Subject: [Buildroot] [git commit] package/kodi: remove imx support
Message-ID: <20180331210802.16EE6815B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=878716830bfbdf76b69f69a18b53ae56fdbf8365
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.buildroot.net/buildroot/commit/?id=266208972192f1e0869f89d7be941de6294a810a
broke imx support in Kodi because previously the G2D libraries were
part of the imx-gpu-viv package:

CMake Error at /usr/share/cmake-3.7/Modules/FindPackageHandleStandardArgs.cmake:138 (message):
  Could NOT find IMX (missing: G2D_LIBRARY)

Adjusting the Kodi package to use the imx-gpu-g2d as well still does
not provide a working build:

/home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/linux/imx/IMX.cpp: In member function 'void CIMX::Deinitialize()':
/home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/linux/imx/IMX.cpp:79:21: error: 'DCIC_IOC_STOP_VSYNC' was not declared in this scope
     ioctl(m_fddcic, DCIC_IOC_STOP_VSYNC, 0);
                     ^~~~~~~~~~~~~~~~~~~
/home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/linux/imx/IMX.cpp: In member function 'bool CIMX::UpdateDCIC()':
/home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/linux/imx/IMX.cpp:109:19: error: 'DCIC_IOC_STOP_VSYNC' was not declared in this scope
   ioctl(m_fddcic, DCIC_IOC_STOP_VSYNC, 0);
                   ^~~~~~~~~~~~~~~~~~~
/home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/linux/imx/IMX.cpp:115:21: error: 'DCIC_IOC_START_VSYNC' was not declared in this scope
     ioctl(m_fddcic, DCIC_IOC_START_VSYNC, 0);
                     ^~~~~~~~~~~~~~~~~~~~
/home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/linux/imx/IMX.cpp: In member function 'virtual void CIMX::Process()':
/home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/linux/imx/IMX.cpp:125:19: error: 'DCIC_IOC_START_VSYNC' was not declared in this scope
   ioctl(m_fddcic, DCIC_IOC_START_VSYNC, 0);
                   ^~~~~~~~~~~~~~~~~~~~
/home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/linux/imx/IMX.cpp:131:19: error: 'DCIC_IOC_STOP_VSYNC' was not declared in this scope
   ioctl(m_fddcic, DCIC_IOC_STOP_VSYNC, 0);
                   ^~~~~~~~~~~~~~~~~~~

Although it might be possible to fix these bugs with something like

	#define DCIC_IOC_CONFIG_DCIC    _IO('D', 12)
	#define DCIC_IOC_START_VSYNC    _IO('D', 15)
	#define DCIC_IOC_STOP_VSYNC     _IO('D', 16)

as done in
https://raw.githubusercontent.com/LibreELEC/LibreELEC.tv/libreelec-7.0/projects/imx6/patches/kodi/imx6-jarvis.patch

we would still try to ride a dead horse. The upcoming Kodi version
18.0-Leia will remove imx support completely, see upstream PR 12990.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
[Thomas: keep an explicit -DENABLE_IMX=OFF in CONF_OPTS.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi/kodi.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 93f4dd4b31..9d3b65ae91 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -71,7 +71,8 @@ KODI_CONF_OPTS += \
 	-DWITH_TEXTUREPACKER=$(HOST_DIR)/bin/TexturePacker \
 	-DLIBDVDCSS_URL=$(DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
 	-DLIBDVDNAV_URL=$(DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
-	-DLIBDVDREAD_URL=$(DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz
+	-DLIBDVDREAD_URL=$(DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz \
+	-DENABLE_IMX=OFF
 
 ifeq ($(BR2_ENABLE_LOCALE),)
 KODI_DEPENDENCIES += libiconv
@@ -191,12 +192,6 @@ KODI_DEPENDENCIES += libamcodec
 else
 KODI_CONF_OPTS += -DENABLE_AML=OFF
 endif
-ifeq ($(BR2_PACKAGE_IMX_VPUWRAP),y)
-KODI_CONF_OPTS += -DENABLE_IMX=ON
-KODI_DEPENDENCIES += imx-vpuwrap
-else
-KODI_CONF_OPTS += -DENABLE_IMX=OFF
-endif
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
