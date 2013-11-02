From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Nov 2013 17:17:04 +0100
Subject: [Buildroot] [PATCH 2/2] qt: don't allow building WebKit on some
	architectures
In-Reply-To: <1383409024-17839-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383409024-17839-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1383409024-17839-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WebKit has some architecture specific support, and therefore is not
necessarily available for all architectures. Make sure the Qt WebKit
option cannot be selected on those architectures that are not
supported.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 74b9461..b1a2207 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -344,17 +344,26 @@ config BR2_PACKAGE_QT_NETWORK
 	  Install the Network module.
 	  if unsure, say y
 
+config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
+	bool
+	# see src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h
+	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
+		BR2_mipsel || BR2_powerpc || BR2_sh4 || BR2_sh4eb || \
+		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64
+
 config BR2_PACKAGE_QT_WEBKIT
 	bool "WebKit Module"
 	depends on BR2_PACKAGE_QT_SHARED
 	depends on BR2_PACKAGE_QT_GUI_MODULE
 	depends on BR2_PACKAGE_QT_NETWORK
+	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	help
 	  Build the WebKit module.
 	  If unsure, say n.
 
 comment "WebKit needs shared library/gui/network support"
 	depends on !(BR2_PACKAGE_QT_SHARED && BR2_PACKAGE_QT_GUI_MODULE && BR2_PACKAGE_QT_NETWORK)
+	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 
 config BR2_PACKAGE_QT_STL
 	bool "STL support"
-- 
1.8.1.2
