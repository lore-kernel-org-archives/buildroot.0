From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 29 May 2019 13:19:08 -0400
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 require dynamic library for decklink plugin
Message-ID: <20190529171908.103008-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The decklink plugin uses dlfcn.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index ac77836312..7b788c59b6 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -351,11 +351,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DASH
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DECKLINK
 	bool "decklink"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # uses dlfcn
 	help
 	  Blackmagic Decklink plugin
 
-comment "decklink needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "decklink needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP  || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
 	bool "directfb"
-- 
2.21.0
