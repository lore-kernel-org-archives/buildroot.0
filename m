From: Daniel Nicoletti <dantti12@gmail.com>
Date: Tue, 17 Jul 2018 17:46:13 -0300
Subject: [Buildroot] [PATCH] cutelyst: new package
Message-ID: <20180717204613.22028-1-dantti12@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A C++ Web Framework built on top of Qt, using
the simple approach of Catalyst (Perl) framework.

Signed-off-by: Daniel Nicoletti <dantti12@gmail.com>
---
 package/Config.in              |  1 +
 package/cutelyst/Config.in     |  9 +++++++++
 package/cutelyst/cutelyst.hash |  3 +++
 package/cutelyst/cutelyst.mk   | 36 ++++++++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 package/cutelyst/Config.in
 create mode 100644 package/cutelyst/cutelyst.hash
 create mode 100644 package/cutelyst/cutelyst.mk

diff --git a/package/Config.in b/package/Config.in
index eedce83616..08a3eac48a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ comment "Other GUIs"
 	source "package/kf5/Config.in"
 if BR2_PACKAGE_QT || BR2_PACKAGE_QT5
 comment "QT libraries and helper libraries"
+	source "package/cutelyst/Config.in"
 	source "package/grantlee/Config.in"
 	source "package/qextserialport/Config.in"
 	source "package/qjson/Config.in"
diff --git a/package/cutelyst/Config.in b/package/cutelyst/Config.in
new file mode 100644
index 0000000000..6b78e48cea
--- /dev/null
+++ b/package/cutelyst/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_CUTELYST
+	bool "cutelyst"
+	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_GUI
+	help
+	  A C++ Web Framework built on top of Qt, using
+	  the simple approach of Catalyst (Perl) framework.
+
+	  https://cutelyst.org
diff --git a/package/cutelyst/cutelyst.hash b/package/cutelyst/cutelyst.hash
new file mode 100644
index 0000000000..58645e50c2
--- /dev/null
+++ b/package/cutelyst/cutelyst.hash
@@ -0,0 +1,3 @@
+# Locally calculated after checking pgp signature
+sha256  a5d40c5e0027982181529449ffa807492f5759c2c604cdc467e748445721ff28    cutelyst-2.5.1.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551    COPYING
diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
new file mode 100644
index 0000000000..6653675352
--- /dev/null
+++ b/package/cutelyst/cutelyst.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# cutelyst
+#
+################################################################################
+
+CUTELYST_VERSION = 2.5.1
+CUTELYST_SITE = https://github.com/cutelyst/cutelyst/archive/v$(CUTELYST_VERSION)
+CUTELYST_INSTALL_STAGING = YES
+CUTELYST_SUPPORTS_IN_SOURCE_BUILD = NO
+CUTELYST_LICENSE = LGPL-2.1+
+CUTELYST_LICENSE_FILES = COPYING
+CUTELYST_DEPENDENCIES = qt5base
+
+CUTELYST_CONF_OPTS += \
+	-DPLUGIN_CSRFPROTECTION=ON
+
+$(eval $(cmake-package))
+
+ifeq ($(BR2_PACKAGE_GRANTLEE),y)
+CUTELYST_CONF_OPTS += -DPLUGIN_VIEW_GRANTLEE=ON
+else
+CUTELYST_CONF_OPTS += -DPLUGIN_VIEW_GRANTLEE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPWQUALITY),y)
+CUTELYST_CONF_OPTS += -DPLUGIN_VALIDATOR_PWQUALITY=ON
+else
+CUTELYST_CONF_OPTS += -DPLUGIN_VALIDATOR_PWQUALITY=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_JEMALLOC),y)
+CUTELYST_CONF_OPTS += -DUSE_JEMALLOC=ON
+else
+CUTELYST_CONF_OPTS += -DUSE_JEMALLOC=OFF
+endif
-- 
2.17.1
