From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Nov 2013 12:11:01 +0100
Subject: [Buildroot] [git commit] qt: remove the
	BR2_PACKAGE_QT_JAVASCRIPTCORE option
Message-ID: <20131110113512.447DA9BB5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f9c04f618dc8c3e4b429655dff9d7ac01d5e02a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_PACKAGE_QT_JAVASCRIPTCORE option was available to force the
activation or disabling of the JIT compiler in the Qt Javascript
interpreter. However, the JIT compiler is not available for all
architectures, so forcing its activation does not always
work. Moreover, Qt knows by itself for which architectures JIT support
is possible, and will automatically enable it if possible.

Therefore, this option was in fact useless, and causing build problems
when enabled on architectures for which the JIT support was not
available. This commit removes this option and there is no
replacement: Qt will enable JIT at compile time when possible.

Fixes:

  http://autobuild.buildroot.org/results/aae/aaeb82753b7654eeca679ded5d0211ceebda3ea2/build-end.log
  http://autobuild.buildroot.org/results/367/3670e4f03ff0ce114c90bd7139243d82c427b52a/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy     |   18 ++++++++++++++++++
 package/qt/Config.in |    6 ------
 package/qt/qt.mk     |    6 ------
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 588cd8b..d02f0a6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,24 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2013.11"
 
+config BR2_PACKAGE_QT_JAVASCRIPTCORE
+	bool "qt javascriptcore option removed"
+	select BR2_LEGACY
+	help
+	  The BR2_PACKAGE_QT_JAVASCRIPTCORE option was available to
+	  force the activation or disabling of the JIT compiler in the
+	  Qt Javascript interpreter. However, the JIT compiler is not
+	  available for all architectures, so forcing its activation
+	  does not always work. Moreover, Qt knows by itself for which
+	  architectures JIT support is possible, and will
+	  automatically enable it if possible.
+
+	  Therefore, this option was in fact useless, and causing
+	  build problems when enabled on architectures for which the
+	  JIT support was not available. It has been removed, and
+	  there is no replacement: Qt will enable JIT at compile time
+	  when possible.
+
 config BR2_PACKAGE_MODULE_INIT_TOOLS
 	bool "module-init-tools replaced by kmod"
 	select BR2_PACKAGE_KMOD
diff --git a/package/qt/Config.in b/package/qt/Config.in
index ea9e787..b1a2207 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -365,12 +365,6 @@ comment "WebKit needs shared library/gui/network support"
 	depends on !(BR2_PACKAGE_QT_SHARED && BR2_PACKAGE_QT_GUI_MODULE && BR2_PACKAGE_QT_NETWORK)
 	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 
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
