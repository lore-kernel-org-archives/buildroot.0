From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Nov 2013 23:59:17 +0100
Subject: [Buildroot] [git commit] qt: don't allow building WebKit on some
	architectures
Message-ID: <20131104230139.13A7599526@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01f99d284fd51bd149e7a92d0e9e7fc368cd0e99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

WebKit has some architecture specific support, and therefore is not
necessarily available for all architectures. Make sure the Qt WebKit
option cannot be selected on those architectures that are not
supported.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/Config.in |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 8801308..ea9e787 100644
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
 
 config BR2_PACKAGE_QT_JAVASCRIPTCORE
 	bool "JavaScriptCore JIT compiler"
