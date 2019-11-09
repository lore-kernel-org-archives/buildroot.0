From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sat,  9 Nov 2019 15:56:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/log4qt: new package
Message-ID: <20191109145648.348739-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Logging for the Qt cross-platform application framework

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/log4qt/Config.in   | 13 +++++++++++
 package/log4qt/log4qt.hash |  3 +++
 package/log4qt/log4qt.mk   | 47 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 65 insertions(+)
 create mode 100644 package/log4qt/Config.in
 create mode 100644 package/log4qt/log4qt.hash
 create mode 100644 package/log4qt/log4qt.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c0863aabc6..f8ebd8e0d7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -258,6 +258,7 @@ F:	package/orbit/
 N:	Bartosz Bilas <b.bilas@grinn-global.com>
 F:	package/qt5/qt5scxml/
 F:	package/qt5/qt5webview/
+F:	package/log4qt/
 
 N:	Bartosz Golaszewski <brgl@bgdev.pl>
 F:	package/autoconf-archive/
diff --git a/package/Config.in b/package/Config.in
index f72c77b416..9149f3b733 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1523,6 +1523,7 @@ menu "Logging"
 	source "package/log4cplus/Config.in"
 	source "package/log4cpp/Config.in"
 	source "package/log4cxx/Config.in"
+	source "package/log4qt/Config.in"
 	source "package/opentracing-cpp/Config.in"
 	source "package/spdlog/Config.in"
 	source "package/zlog/Config.in"
diff --git a/package/log4qt/Config.in b/package/log4qt/Config.in
new file mode 100644
index 0000000000..1193d4d6d4
--- /dev/null
+++ b/package/log4qt/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LOG4QT
+	bool "log4qt"
+	depends on BR2_PACKAGE_QT5BASE
+	depends on BR2_PACKAGE_QT5_VERSION_LATEST
+	help
+	  Log4Qt is a C++ port of the Apache Software Foundation
+	  Log4j package using the Qt Framework. It is intended to be
+	  used by open source and commercial Qt projects.
+
+	  https://github.com/MEONMedical/Log4Qt
+
+comment "log4qt needs a qt5base, qt >= 5.7"
+	depends on !BR2_PACKAGE_QT5BASE || !BR2_PACKAGE_QT5_VERSION_LATEST
diff --git a/package/log4qt/log4qt.hash b/package/log4qt/log4qt.hash
new file mode 100644
index 0000000000..e324e324d8
--- /dev/null
+++ b/package/log4qt/log4qt.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 d35d08ae72523284f6d0f209734861241d5dac576678bb89e7f6f23a8762d243  log4qt-v1.5.0.tar.gz
+sha256 c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  LICENSE
diff --git a/package/log4qt/log4qt.mk b/package/log4qt/log4qt.mk
new file mode 100644
index 0000000000..74c78c102d
--- /dev/null
+++ b/package/log4qt/log4qt.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# log4qt
+#
+################################################################################
+
+LOG4QT_VERSION = v1.5.0
+LOG4QT_SITE = $(call github,MEONMedical,Log4Qt,$(LOG4QT_VERSION))
+LOG4QT_DEPENDENCIES += qt5base
+LOG4QT_LICENSE = Apache-2.0
+LOG4QT_LICENSE_FILES = LICENSE
+LOG4QT_INSTALL_STAGING = YES
+
+define LOG4QT_CONFIGURE_CMDS
+	cd $(@D) && $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(LOG4QT_CONFIGURE_OPTS)
+endef
+
+define LOG4QT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define LOG4QT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(STAGING_DIR)/usr/
+endef
+
+ifneq ($(BR2_STATIC_LIBS),y)
+define LOG4QT_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/liblog4qt.so* $(TARGET_DIR)/usr/lib
+endef
+endif
+
+define LOG4QT_INSTALL_TARGET_CMDS
+	$(LOG4QT_INSTALL_TARGET_LIBS)
+endef
+
+ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
+ifeq ($(BR2_PACKAGE_QT5BASE_SQLITE_QT),y)
+LOG4QT_CONFIGURE_OPTS += "QT += sql"
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),y)
+LOG4QT_CONFIGURE_OPTS += "QT += sql"
+LOG4QT_DEPENDENCIES   += sqlite
+endif
+endif
+
+$(eval $(generic-package))
-- 
2.24.0
