From: Paul Jones <paul@pauljones.id.au>
Date: Wed, 18 Aug 2010 22:11:34 +1000
Subject: [Buildroot] [PATCH] QT: Bump to 4.6.3
Message-ID: <1282133494-13795-1-git-send-email-paul@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add option to build example and demo code

Signed-off-by: Paul Jones <paul@pauljones.id.au>
---
 package/qt/Config.in                          |    5 ++++
 package/qt/qt-4.6.2-fix-qt-uclibc-build.patch |   27 -------------------------
 package/qt/qt.mk                              |   14 ++++++++----
 3 files changed, 14 insertions(+), 32 deletions(-)
 delete mode 100644 package/qt/qt-4.6.2-fix-qt-uclibc-build.patch

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 93a8ab1..50c2929 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -16,6 +16,11 @@ config BR2_PACKAGE_QT_DEBUG
 	help
 	  If unsure, say N.
 
+config BR2_PACKAGE_QT_DEMOS
+	bool "Compile and install demos and examples (with code)"
+	help
+	  If unsure, say N.
+
 choice
 	prompt "Library type"
 	default BR2_PACKAGE_QT_SHARED
diff --git a/package/qt/qt-4.6.2-fix-qt-uclibc-build.patch b/package/qt/qt-4.6.2-fix-qt-uclibc-build.patch
deleted file mode 100644
index a76774b..0000000
--- a/package/qt/qt-4.6.2-fix-qt-uclibc-build.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From http://bugreports.qt.nokia.com/browse/QTBUG-8365
-
-Starting a QtEmbedded-4.6.2 application linked against uClibc 0.9.30.1 results
-in an immediate segmentation fault.
-This is due to an incompatibility of the uClibc with the standard libc about
-the "realpath" function. The man of the function clearly specifies that
-"if resolved path (the second argument) is NULL, then realpath uses malloc to
-allocate a buffer ...". However, uClibc doesn't support this functionality and
-issues a warning at compile-time when the function is called with a NULL
-argument. 
----
-diff -aurp -x '*.o' qt-everywhere-opensource-src-4.6.2-old/src/corelib/io/qfsfileengine.cpp qt-everywhere-opensource-src-4.6.2/src/corelib/io/qfsfileengine.cpp
---- qt-everywhere-opensource-src-4.6.2-old/src/corelib/io/qfsfileengine.cpp	2010-02-11 16:55:23.000000000 +0100
-+++ qt-everywhere-opensource-src-4.6.2/src/corelib/io/qfsfileengine.cpp	2010-02-19 14:57:06.000000000 +0100
-@@ -145,10 +145,9 @@ QString QFSFileEnginePrivate::canonicali
- #endif
-     // Mac OS X 10.5.x doesn't support the realpath(X,0) extenstion we use here.
- #if defined(Q_OS_LINUX) || defined(Q_OS_SYMBIAN)
--    char *ret = realpath(path.toLocal8Bit().constData(), (char*)0);
--    if (ret) {
-+    char ret[PATH_MAX];
-+    if (realpath(path.toLocal8Bit().constData(), ret)) {
-         QString canonicalPath = QDir::cleanPath(QString::fromLocal8Bit(ret));
--        free(ret);
-         return canonicalPath;
-     }
- #endif
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index baf6539..854eae7 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -12,7 +12,7 @@
 #
 ######################################################################
 
-QT_VERSION:=4.6.2
+QT_VERSION:=4.6.3
 QT_SOURCE:=qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE:=http://get.qt.nokia.com/qt/source
 QT_CAT:=$(ZCAT)
@@ -48,6 +48,12 @@ else
 QT_CONFIGURE+= -no-qt3support
 endif
 
+ifeq ($(BR2_PACKAGE_QT_DEMOS),y)
+QT_CONFIGURE+= -examplesdir $(TARGET_DIR)/usr/share/qt/examples -demosdir $(TARGET_DIR)/usr/share/qt/demos
+else
+QT_CONFIGURE+= -nomake examples -nomake demos
+endif
+
 # ensure glib is built first if enabled for Qt's glib support
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 QT_DEP_LIBS+=libglib2
@@ -472,8 +478,8 @@ qt-source: $(DL_DIR)/$(QT_SOURCE)
 $(QT_TARGET_DIR)/.unpacked: $(DL_DIR)/$(QT_SOURCE)
 	$(QT_CAT) $(DL_DIR)/$(QT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(QT_TARGET_DIR) package/qt/ \
-		qt-$(QT_VERSION)-\*.patch \
-		qt-$(QT_VERSION)-\*.patch.$(ARCH)
+		*.patch \
+		*.patch.$(ARCH)
 	touch $@
 
 $(QT_TARGET_DIR)/.configured: $(QT_TARGET_DIR)/.unpacked
@@ -520,8 +526,6 @@ endif
 		-hostprefix $(STAGING_DIR)/usr \
 		-fast \
 		-no-rpath \
-		-nomake examples \
-		-nomake demos \
 	)
 	touch $@
 
-- 
1.7.1
