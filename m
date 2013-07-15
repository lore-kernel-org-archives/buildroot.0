From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:45 -0500
Subject: [Buildroot] [PATCH 62/67] gst1-plugins-base: libglib2 requires
	threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-63-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/gst1-plugins-base/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gst1-plugins-base/Config.in b/package/multimedia/gst1-plugins-base/Config.in
index 10561c1..e02d23a 100644
--- a/package/multimedia/gst1-plugins-base/Config.in
+++ b/package/multimedia/gst1-plugins-base/Config.in
@@ -130,12 +130,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # pango -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> libglib2
 	select BR2_PACKAGE_PANGO
 	help
 	  Pango-based text rendering and overlay
 
-comment "pango plugin requires a toolchain with C++ support"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "pango plugin requires a toolchain with C++, WCHAR and threading support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA
 	bool "theora (*.ogg video)"
-- 
1.8.1.2
