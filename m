From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 17:37:06 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/gstreamer1/gst1-plugins-bad: require dynamic library for decklink
 plugin
Message-ID: <20190606154048.5EBC87F881@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d667bd7e2e0164fe9451403078128129719a8ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The decklink plugin uses <dlfcn.h> functions: dlopen(), dlsym(), etc.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e49d5e946de1f5f5f50412671f917d19842702a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index a2ceeb9035..f0a8461165 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -332,11 +332,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DASH
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DECKLINK
 	bool "decklink"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # <dlfcn.h>
 	help
 	  Blackmagic Decklink plugin
 
-comment "decklink needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "decklink needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP  || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
 	bool "directfb"
