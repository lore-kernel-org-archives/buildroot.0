From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 15:41:24 +0100
Subject: [Buildroot] [git commit] package/qtuio: remove package
Message-ID: <20190206145217.008AA7F98D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e228a9fe93ce05c89488375cf7a19ce759930e6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The qtuio package uses the obsolete qt4 package, which we are about to
remove, so remove qtuio as well.

CC: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                                   |  6 ++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 .../0001-TuioServer.cpp-add-missing-include.patch  | 28 ---------
 package/qtuio/0002-dont-append-_d-for-debug.patch  | 29 ---------
 package/qtuio/Config.in                            | 22 -------
 package/qtuio/qtuio.hash                           |  2 -
 package/qtuio/qtuio.mk                             | 72 ----------------------
 8 files changed, 6 insertions(+), 155 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 64f5d58bd7..9c38abdc41 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.02"
 
+config BR2_PACKAGE_QTUIO
+	bool "qtuio package removed"
+	select BR2_LEGACY
+	help
+	  The qtuio package was removed.
+
 config BR2_PACKAGE_PINENTRY_QT4
 	bool "pinentry-qt4 option removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index cc21364fb3..e0340e851d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2015,7 +2015,6 @@ F:	package/cache-calibrator/
 F:	package/gtest/
 F:	package/mtdev/
 F:	package/mtdev2tuio/
-F:	package/qtuio/
 
 N:	Steve Calfee <stevecalfee@gmail.com>
 F:	package/python-pymysql/
diff --git a/package/Config.in b/package/Config.in
index 9907221b68..250dbe7f0e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -321,7 +321,6 @@ comment "QT libraries and helper libraries"
 	source "package/grantlee/Config.in"
 	source "package/qextserialport/Config.in"
 	source "package/qjson/Config.in"
-	source "package/qtuio/Config.in"
 	source "package/quazip/Config.in"
 	source "package/qwt/Config.in"
 endif
diff --git a/package/qtuio/0001-TuioServer.cpp-add-missing-include.patch b/package/qtuio/0001-TuioServer.cpp-add-missing-include.patch
deleted file mode 100644
index 99337026df..0000000000
--- a/package/qtuio/0001-TuioServer.cpp-add-missing-include.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 4dd7cad8c95484a882eaa2aeaa74595a3dd93a07 Mon Sep 17 00:00:00 2001
-From: Stephan Hoffmann <sho@relinux.de>
-Date: Sun, 2 Dec 2012 13:36:41 +0100
-Subject: [PATCH] TuioServer.cpp: add missing include
-
-If usleep() is used the header <unistd.h> has to be included
-
-Signed-off-by: Stephan Hoffmann <sho@relinux.de>
----
- src/3rdparty/tuio/TuioServer.cpp |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
-
-diff --git a/src/3rdparty/tuio/TuioServer.cpp b/src/3rdparty/tuio/TuioServer.cpp
-index f17bef9..851144c 100644
---- a/src/3rdparty/tuio/TuioServer.cpp
-+++ b/src/3rdparty/tuio/TuioServer.cpp
-@@ -25,6 +25,8 @@ using namespace TUIO;
- using namespace osc;
- 
- #ifndef WIN32
-+#include <unistd.h>
-+
- static void* ThreadFunc( void* obj )
- #else
- static DWORD WINAPI ThreadFunc( LPVOID obj )
--- 
-1.7.0.4
-
diff --git a/package/qtuio/0002-dont-append-_d-for-debug.patch b/package/qtuio/0002-dont-append-_d-for-debug.patch
deleted file mode 100644
index fbaaf19222..0000000000
--- a/package/qtuio/0002-dont-append-_d-for-debug.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-[PATCH] don't append _d to library name when Qt is built with debug support
-
-qtuio appends _d to the library name when Qt was built with debug support,
-breaking linking step for examples and staging/target install.
-
-There's no real advantage to the _d suffix, so simply fix it by removing
-the logic appending _d.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/qTUIO.pro |    5 -----
- 1 file changed, 5 deletions(-)
-
-Index: qtuio-abe4973ff6/src/qTUIO.pro
-===================================================================
---- qtuio-abe4973ff6.orig/src/qTUIO.pro
-+++ qtuio-abe4973ff6/src/qTUIO.pro
-@@ -16,11 +16,6 @@
- win32:LIBS += ws2_32.lib \
-     winmm.lib
- 
--# Changes the name of the target, when is debug mode
--CONFIG( debug, debug|release ) { 
--    TARGET = $${TARGET}_d
--    BUILD_NAME = debug
--}
- CONFIG( release, debug|release ):BUILD_NAME = release
- 
- # Temporary folders for the auxiliar files
diff --git a/package/qtuio/Config.in b/package/qtuio/Config.in
deleted file mode 100644
index f46f1dd407..0000000000
--- a/package/qtuio/Config.in
+++ /dev/null
@@ -1,22 +0,0 @@
-config BR2_PACKAGE_QTUIO
-	bool "qtuio"
-	depends on BR2_PACKAGE_QT
-	depends on BR2_PACKAGE_QT_GUI_MODULE
-	help
-	  Implementation of an interface connecting TUIO messages
-	  and QT events
-
-	  https://github.com/x29a/qTUIO
-
-if BR2_PACKAGE_QTUIO
-
-config BR2_QTUIO_EXAMPLES
-	bool "qtuio examples"
-	help
-	  Build and install qtuio examples
-
-endif
-
-comment "qtuio depends on QT gui module"
-	depends on BR2_PACKAGE_QT
-	depends on !BR2_PACKAGE_QT_GUI_MODULE
diff --git a/package/qtuio/qtuio.hash b/package/qtuio/qtuio.hash
deleted file mode 100644
index bb9bdb1848..0000000000
--- a/package/qtuio/qtuio.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  65308adb59e910d552d4885772c7f99c7d19dec5e924d852a5a39a1972f8d223  qtuio-abe4973ff60654aad9df7037c4ca15c45f811d24.tar.gz
diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
deleted file mode 100644
index 6b90a2c06f..0000000000
--- a/package/qtuio/qtuio.mk
+++ /dev/null
@@ -1,72 +0,0 @@
-################################################################################
-#
-# qtuio
-#
-################################################################################
-
-QTUIO_VERSION = abe4973ff60654aad9df7037c4ca15c45f811d24
-QTUIO_SITE = $(call github,x29a,qTUIO,$(QTUIO_VERSION))
-QTUIO_INSTALL_STAGING = YES
-QTUIO_DEPENDENCIES = qt
-
-QTUIO_LICENSE = GPL-3.0+
-QTUIO_LICENSE_FILES = COPYING
-
-# The pong example needs QtOpenGL support, which might become available
-# some time in the future. Then add pong to the list of examples.
-QTUIO_EXAMPLES = dials fingerpaint knobs pinchzoom
-
-ifeq ($(BR2_QTUIO_EXAMPLES),y)
-define QTUIO_CONFIGURE_EXAMPLES
-	for example in $(QTUIO_EXAMPLES) ; do \
-		(cd $(@D)/examples/$${example} && $(TARGET_MAKE_ENV) $(QT_QMAKE)) || exit 1; \
-	done
-endef
-endif
-
-define QTUIO_CONFIGURE_CMDS
-	cd $(@D)/src && $(TARGET_MAKE_ENV) $(QT_QMAKE)
-	$(QTUIO_CONFIGURE_EXAMPLES)
-endef
-
-ifeq ($(BR2_QTUIO_EXAMPLES),y)
-define QTUIO_BUILD_EXAMPLES
-	for example in $(QTUIO_EXAMPLES) ; do \
-		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/examples/$${example} || exit 1; \
-	done
-endef
-endif
-
-define QTUIO_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src
-	$(QTUIO_BUILD_EXAMPLES)
-endef
-
-# Unfortunately, there is no working "install" target available
-ifeq ($(BR2_QTUIO_EXAMPLES),y)
-define QTUIO_INSTALL_EXAMPLES
-	for example in $(QTUIO_EXAMPLES) ; do \
-		$(INSTALL) -D -m 0755 $(@D)/examples/$${example}/$${example} $(TARGET_DIR)/usr/share/qtuio/$${example} || exit 1 ; \
-	done
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT_STATIC),y)
-QTUIO_LIBRARY = libqTUIO.a
-else
-QTUIO_LIBRARY = libqTUIO.so*
-define QTUIO_INSTALL_TARGET_LIBRARY
-	cp -dpf $(@D)/lib/$(QTUIO_LIBRARY) $(TARGET_DIR)/usr/lib
-endef
-endif
-
-define QTUIO_INSTALL_TARGET_CMDS
-	$(QTUIO_INSTALL_TARGET_LIBRARY)
-	$(QTUIO_INSTALL_EXAMPLES)
-endef
-
-define QTUIO_INSTALL_STAGING_CMDS
-	cp -dpf $(@D)/lib/$(QTUIO_LIBRARY) $(STAGING_DIR)/usr/lib
-endef
-
-$(eval $(generic-package))
