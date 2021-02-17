From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Wed, 17 Feb 2021 20:49:59 +0100
Subject: [Buildroot] [PATCH v3] package/log4qt: new package
Message-ID: <20210217194959.1708700-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Log4Qt is a C++ port of the Apache Software Foundation
Log4j package using the Qt Framework.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
Changes v2 -> v3:
 - use cmake pkg infra
 - rework database logging support

Changes v1 -> v2:
 - bump version to 1.5.1
 - use qmake pkg infra
 - propagate dependencies from qt5 package
 - improve commit message

 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/log4qt/Config.in   | 19 +++++++++++++++++++
 package/log4qt/log4qt.hash |  3 +++
 package/log4qt/log4qt.mk   | 23 +++++++++++++++++++++++
 5 files changed, 47 insertions(+)
 create mode 100644 package/log4qt/Config.in
 create mode 100644 package/log4qt/log4qt.hash
 create mode 100644 package/log4qt/log4qt.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 12e1f83cf7..3f122d436b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -261,6 +261,7 @@ F:	package/python-canopen/
 N:	Bartosz Bilas <b.bilas@grinn-global.com>
 F:	board/stmicroelectronics/stm32mp157a-dk1/
 F:	configs/stm32mp157a_dk1_defconfig
+F:	package/log4qt/
 F:	package/python-esptool/
 F:	package/python-pyaes/
 F:	package/ttyd/
diff --git a/package/Config.in b/package/Config.in
index 5304ab141c..54102e0509 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1659,6 +1659,7 @@ menu "Logging"
 	source "package/log4cplus/Config.in"
 	source "package/log4cpp/Config.in"
 	source "package/log4cxx/Config.in"
+	source "package/log4qt/Config.in"
 	source "package/opentracing-cpp/Config.in"
 	source "package/spdlog/Config.in"
 	source "package/zlog/Config.in"
diff --git a/package/log4qt/Config.in b/package/log4qt/Config.in
new file mode 100644
index 0000000000..1b716bbc51
--- /dev/null
+++ b/package/log4qt/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LOG4QT
+	bool "log4qt"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_QT5
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # c++11 qt5base
+	depends on !BR2_STATIC_LIBS
+	help
+	  Log4Qt is a C++ port of the Apache Software Foundation
+	  Log4j package using the Qt Framework. It is intended to be
+	  used by open source and commercial Qt projects.
+
+	  https://github.com/MEONMedical/Log4Qt
+
+comment "Log4Qt needs qt5, a toolchain w/ gcc >= 5.0, wchar, NPTL, C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_PACKAGE_QT5
diff --git a/package/log4qt/log4qt.hash b/package/log4qt/log4qt.hash
new file mode 100644
index 0000000000..757bab1a25
--- /dev/null
+++ b/package/log4qt/log4qt.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  ff17b794ca7d5290a150a53f6272e6a30a7f4d942aa58298a8328bf10a65858a  log4qt-1.5.1.tar.gz
+sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  LICENSE
diff --git a/package/log4qt/log4qt.mk b/package/log4qt/log4qt.mk
new file mode 100644
index 0000000000..57bf5c9ab0
--- /dev/null
+++ b/package/log4qt/log4qt.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# log4qt
+#
+################################################################################
+
+LOG4QT_VERSION = 1.5.1
+LOG4QT_SITE = $(call github,MEONMedical,Log4Qt,v$(LOG4QT_VERSION))
+LOG4QT_DEPENDENCIES += qt5base
+LOG4QT_LICENSE = Apache-2.0
+LOG4QT_LICENSE_FILES = LICENSE
+LOG4QT_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_SQLITE_QT),y)
+LOG4QT_CONF_OPTS += -DBUILD_WITH_DB_LOGGING=ON
+else ifeq ($(BR2_PACKAGE_SQLITE)$(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),yy)
+LOG4QT_CONF_OPTS += -DBUILD_WITH_DB_LOGGING=ON
+LOG4QT_DEPENDENCIES += sqlite
+else
+LOG4QT_CONF_OPTS += -DBUILD_WITH_DB_LOGGING=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.30.1
