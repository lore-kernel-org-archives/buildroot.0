From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 22:47:23 +0100
Subject: [Buildroot] [git commit] package/log4qt: new package
Message-ID: <20210316213949.04ADF881F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9eede622dde4d322cb84bd96bc58faa847ed6cbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Log4Qt is a C++ port of the Apache Software Foundation
Log4j package using the Qt Framework.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/log4qt/Config.in   | 12 ++++++++++++
 package/log4qt/log4qt.hash |  3 +++
 package/log4qt/log4qt.mk   | 20 ++++++++++++++++++++
 5 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 450dd84043..6a7e88039e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -262,6 +262,7 @@ F:	package/python-canopen/
 N:	Bartosz Bilas <b.bilas@grinn-global.com>
 F:	board/stmicroelectronics/stm32mp157a-dk1/
 F:	configs/stm32mp157a_dk1_defconfig
+F:	package/log4qt/
 F:	package/python-esptool/
 F:	package/python-pyaes/
 F:	package/ttyd/
diff --git a/package/Config.in b/package/Config.in
index 7e2e8430fb..d278e78b68 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1663,6 +1663,7 @@ menu "Logging"
 	source "package/log4cplus/Config.in"
 	source "package/log4cpp/Config.in"
 	source "package/log4cxx/Config.in"
+	source "package/log4qt/Config.in"
 	source "package/opentracing-cpp/Config.in"
 	source "package/spdlog/Config.in"
 	source "package/zlog/Config.in"
diff --git a/package/log4qt/Config.in b/package/log4qt/Config.in
new file mode 100644
index 0000000000..25cc6f0708
--- /dev/null
+++ b/package/log4qt/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LOG4QT
+	bool "log4qt"
+	depends on BR2_PACKAGE_QT5
+	help
+	  Log4Qt is a C++ port of the Apache Software Foundation
+	  Log4j package using the Qt Framework. It is intended to be
+	  used by open source and commercial Qt projects.
+
+	  https://github.com/MEONMedical/Log4Qt
+
+comment "log4qt needs qt5"
+	depends on !BR2_PACKAGE_QT5
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
index 0000000000..b01d9c6611
--- /dev/null
+++ b/package/log4qt/log4qt.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# log4qt
+#
+################################################################################
+
+LOG4QT_VERSION = 1.5.1
+LOG4QT_SITE = $(call github,MEONMedical,Log4Qt,v$(LOG4QT_VERSION))
+LOG4QT_DEPENDENCIES = qt5base
+LOG4QT_LICENSE = Apache-2.0
+LOG4QT_LICENSE_FILES = LICENSE
+LOG4QT_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_SQLITE_QT)$(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),y)
+LOG4QT_CONF_OPTS += -DBUILD_WITH_DB_LOGGING=ON
+else
+LOG4QT_CONF_OPTS += -DBUILD_WITH_DB_LOGGING=OFF
+endif
+
+$(eval $(cmake-package))
