From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Nov 2013 17:17:03 +0100
Subject: [Buildroot] [PATCH 1/2] qt: remove the
	BR2_PACKAGE_QT_JAVASCRIPTCORE option
Message-ID: <1383409024-17839-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_PACKAGE_QT_JAVASCRIPTCORE option was incorrectly used in
Buildroot: it's help text and name was pretending it's here to
enable/disable the JavaScriptCore, but what it did in fact is force
enable or force disable the usage of the JIT mechanism for the
JavaScript support in Qt.

However, the JIT mechanism is architecture-specific, and therefore not
available for all architectures, and Qt already knows on which
architectures it is appropriate to enable JIT and on which
architectures it is not.

Therefore, this commit simply removes the
BR2_PACKAGE_QT_JAVASCRIPTCORE option. We don't add it to
Config.in.legacy, because the feature is still available, it's just
that Qt will know automatically decide whether JIT should be used or
not.

Fixes:

  http://autobuild.buildroot.org/results/aae/aaeb82753b7654eeca679ded5d0211ceebda3ea2/build-end.log
  http://autobuild.buildroot.org/results/367/3670e4f03ff0ce114c90bd7139243d82c427b52a/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in | 6 ------
 package/qt/qt.mk     | 6 ------
 2 files changed, 12 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 8801308..74b9461 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -356,12 +356,6 @@ config BR2_PACKAGE_QT_WEBKIT
 comment "WebKit needs shared library/gui/network support"
 	depends on !(BR2_PACKAGE_QT_SHARED && BR2_PACKAGE_QT_GUI_MODULE && BR2_PACKAGE_QT_NETWORK)
 
-config BR2_PACKAGE_QT_JAVASCRIPTCORE
-	bool "JavaScriptCore JIT compiler"
-	help
-	  Build the JavaScriptCore JIT compiler
-	  If unsure, say y
-
 config BR2_PACKAGE_QT_STL
 	bool "STL support"
 	help
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 48d39fc..82ce51d 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -415,12 +415,6 @@ else
 QT_CONFIGURE_OPTS += -no-scripttools
 endif
 
-ifeq ($(BR2_PACKAGE_QT_JAVASCRIPTCORE),y)
-QT_CONFIGURE_OPTS += -javascript-jit
-else
-QT_CONFIGURE_OPTS += -no-javascript-jit
-endif
-
 ifeq ($(BR2_PACKAGE_QT_STL),y)
 QT_CONFIGURE_OPTS += -stl
 else
-- 
1.8.1.2
