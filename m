From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Aug 2016 13:07:13 +0200
Subject: [Buildroot] [PATCHv2] package/qt: webkit needs gst-plugins-base
Message-ID: <1471259233-1711-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

QtWebkit needs gstreamer-0.10 and the 'app' plugins, so we depend on
gstreamer and select the required plugins.

We can't select gstreamer or that would cause circular dependencies in
kconfig:

    package/kodi/Config.in:37:error: recursive dependency detected!
    package/kodi/Config.in:37:      symbol BR2_PACKAGE_KODI depends on BR2_PACKAGE_KODI_EGL_GLES
    package/kodi/Config.in:16:      symbol BR2_PACKAGE_KODI_EGL_GLES depends on BR2_PACKAGE_HAS_LIBEGL
    package/opengl/libegl/Config.in:1:      symbol BR2_PACKAGE_HAS_LIBEGL is selected by BR2_PACKAGE_MESA3D_OPENGL_EGL
    package/mesa3d/Config.in:150:   symbol BR2_PACKAGE_MESA3D_OPENGL_EGL is selected by BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
    package/mesa3d/Config.in:92:    symbol BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL depends on BR2_PACKAGE_MESA3D
    package/mesa3d/Config.in:1:     symbol BR2_PACKAGE_MESA3D is selected by BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
    package/x11r7/xdriver_xf86-video-imx-viv/Config.in:1:   symbol BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
    package/freescale-imx/imx-gpu-viv/Config.in:34: symbol BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 is part of choice <choice>
    package/freescale-imx/imx-gpu-viv/Config.in:27: choice <choice> contains symbol <choice>
    package/freescale-imx/imx-gpu-viv/Config.in:27: choice <choice> contains symbol BR2_PACKAGE_FREESCALE_IMX
    package/freescale-imx/Config.in:1:      symbol BR2_PACKAGE_FREESCALE_IMX is selected by BR2_PACKAGE_GST_FSL_PLUGINS
    package/gstreamer/gst-fsl-plugins/Config.in:8:  symbol BR2_PACKAGE_GST_FSL_PLUGINS depends on BR2_PACKAGE_GSTREAMER
    package/gstreamer/gstreamer/Config.in:5:        symbol BR2_PACKAGE_GSTREAMER is selected by BR2_PACKAGE_QT_WEBKIT
    package/qt/Config.in:464:       symbol BR2_PACKAGE_QT_WEBKIT depends on BR2_PACKAGE_QT
    package/qt/Config.in:5: symbol BR2_PACKAGE_QT is selected by BR2_PACKAGE_PYTHON_PYQT
    package/python-pyqt/Config.in:5:        symbol BR2_PACKAGE_PYTHON_PYQT depends on BR2_PACKAGE_PYTHON
    package/python/Config.in:5:     symbol BR2_PACKAGE_PYTHON is selected by BR2_PACKAGE_KODI

This one is fairly complicated to fix properly, so it is easier to just
depend on gstreamer.

Also rework the comment when QtWebkit is not available.

Fixes:
    http://autobuild.buildroot.org/results/84d/84d338b70c8ce3f21dd202de387326f18526aa63/
    http://autobuild.buildroot.org/results/379/379ad4eadf5af7e1d5b977bc229d3fcaba25b4fe/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - fix circular dependency in kconfig
---
 package/qt/Config.in | 16 ++++++++++++----
 package/qt/qt.mk     |  1 +
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index b9752d3..fa5235d 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -469,15 +469,23 @@ config BR2_PACKAGE_QT_WEBKIT
 	depends on BR2_PACKAGE_QT_NETWORK
 	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # needs pthread_getattr_np()
+	depends on BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
 	help
 	  Build the WebKit module.
 	  If unsure, say n.
 
-comment "WebKit needs shared library/NPTL toolchain/script/gui/network support"
-	depends on !(BR2_PACKAGE_QT_SCRIPT && BR2_PACKAGE_QT_SHARED && \
-		BR2_PACKAGE_QT_GUI_MODULE && BR2_PACKAGE_QT_NETWORK)
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+comment "WebKit needs a toolchain w/ dynamic library, NPTL"
 	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIB
+
+comment "WebKit needs QtShared/Script/Gui/Network and Gstreamer 0.10"
+	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL && !BR2_STATIC_LIB
+	depends on !BR2_PACKAGE_QT_SCRIPT     || !BR2_PACKAGE_QT_SHARED   \
+		|| !BR2_PACKAGE_QT_GUI_MODULE || !BR2_PACKAGE_QT_NETWORK  \
+		|| !BR2_PACKAGE_GSTREAMER
 
 config BR2_PACKAGE_QT_STL
 	bool "STL support"
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index c2d2e9c..09b8dc2 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -429,6 +429,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT_WEBKIT),y)
 QT_CONFIGURE_OPTS += -webkit
+QT_DEPENDENCIES += gstreamer gst-plugins-base
 else
 QT_CONFIGURE_OPTS += -no-webkit
 endif
-- 
2.7.4
