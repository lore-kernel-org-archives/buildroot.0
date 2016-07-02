From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  2 Jul 2016 10:51:13 +0200
Subject: [Buildroot] [PATCH] qt_eventdispatcher_libevent: New package
Message-ID: <1467449473-3454-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in                                  |  1 +
 .../0001-build.pro-Remove-tests.patch              | 26 +++++++++++++++
 package/qt_eventdispatcher_libevent/Config.in      |  7 ++++
 .../qt_eventdispatcher_libevent.mk                 | 39 ++++++++++++++++++++++
 4 files changed, 73 insertions(+)
 create mode 100644 package/qt_eventdispatcher_libevent/0001-build.pro-Remove-tests.patch
 create mode 100644 package/qt_eventdispatcher_libevent/Config.in
 create mode 100644 package/qt_eventdispatcher_libevent/qt_eventdispatcher_libevent.mk

diff --git a/package/Config.in b/package/Config.in
index 5779d04..99a4370 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -289,6 +289,7 @@ comment "QT libraries and helper libraries"
 	source "package/grantlee/Config.in"
 	source "package/qextserialport/Config.in"
 	source "package/qjson/Config.in"
+	source "package/qt_eventdispatcher_libevent/Config.in"
 	source "package/qtuio/Config.in"
 	source "package/quazip/Config.in"
 	source "package/qwt/Config.in"
diff --git a/package/qt_eventdispatcher_libevent/0001-build.pro-Remove-tests.patch b/package/qt_eventdispatcher_libevent/0001-build.pro-Remove-tests.patch
new file mode 100644
index 0000000..20875f2
--- /dev/null
+++ b/package/qt_eventdispatcher_libevent/0001-build.pro-Remove-tests.patch
@@ -0,0 +1,26 @@
+From d9d861e4685d9822cafb68e512b57d1e43403f82 Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Wed, 18 Nov 2015 19:51:00 +0100
+Subject: [PATCH] build.pro: Remove tests
+
+The tests are in a git submodules which we won't clone, so don't try to
+build them.
+---
+ build.pro | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/build.pro b/build.pro
+index f5f0400..685617f 100644
+--- a/build.pro
++++ b/build.pro
+@@ -1,7 +1,6 @@
+ TEMPLATE = subdirs
+ CONFIG  += ordered
+
+-SUBDIRS = src tests
++SUBDIRS = src
+
+ src.file   = src/eventdispatcher_libevent.pro
+-tests.file = tests/qt_eventdispatcher_tests/build.pro
+--
+2.6.2
diff --git a/package/qt_eventdispatcher_libevent/Config.in b/package/qt_eventdispatcher_libevent/Config.in
new file mode 100644
index 0000000..a30f061
--- /dev/null
+++ b/package/qt_eventdispatcher_libevent/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_QT_EVENTDISPATCHER_LIBEVENT
+	bool "qt_eventdispatcher_libevent"
+	select BR2_PACKAGE_LIBEVENT
+	help
+	  libevent-based event dispatcher for Qt
+
+	  https://github.com/sjinks/qt_eventdispatcher_libevent
diff --git a/package/qt_eventdispatcher_libevent/qt_eventdispatcher_libevent.mk b/package/qt_eventdispatcher_libevent/qt_eventdispatcher_libevent.mk
new file mode 100644
index 0000000..fda0bc0
--- /dev/null
+++ b/package/qt_eventdispatcher_libevent/qt_eventdispatcher_libevent.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# qt_eventdispatcher_libevent
+#
+################################################################################
+
+QT_EVENTDISPATCHER_LIBEVENT_VERSION = 8798b269654730fa179132ad9a44deedd81bb6b6
+QT_EVENTDISPATCHER_LIBEVENT_SITE = $(call github,sjinks,qt_eventdispatcher_libevent,$(QT_EVENTDISPATCHER_LIBEVENT_VERSION))
+QT_EVENTDISPATCHER_LIBEVENT_INSTALL_STAGING = YES
+QT_EVENTDISPATCHER_LIBEVENT_LICENSE = MIT
+QT_EVENTDISPATCHER_LIBEVENT_LICENSE_FILES = LICENSE
+QT_EVENTDISPATCHER_LIBEVENT_DEPENDENCIES = \
+	libevent \
+	$(if $(BR2_PACKAGE_QT),qt) \
+	$(if $(BR2_PACKAGE_QT5),qt5base)
+
+ifeq ($(BR2_PACKAGE_QT5),y)
+QT_EVENTDISPATCHER_LIBEVENT_QMAKE = $(QT5_QMAKE)
+else
+QT_EVENTDISPATCHER_LIBEVENT_QMAKE = $(QT_QMAKE)
+endif
+
+define QT_EVENTDISPATCHER_LIBEVENT_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT_EVENTDISPATCHER_LIBEVENT_QMAKE) PREFIX=/usr)
+endef
+
+define QT_EVENTDISPATCHER_LIBEVENT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT_EVENTDISPATCHER_LIBEVENT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(STAGING_DIR)
+endef
+
+define QT_EVENTDISPATCHER_LIBEVENT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
-- 
2.8.1
