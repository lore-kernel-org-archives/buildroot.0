From: Pierre Ducroquet <pinaraf@pinaraf.info>
Date: Tue, 13 Feb 2018 22:35:31 +0100
Subject: [Buildroot] [PATCH 1/1] Add first KF5 packages
Message-ID: <20180213213531.22910-1-pinaraf@pinaraf.info>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

KDE Frameworks 5 is a set of libraries built on the Qt framework providing a
lot of powerfull classes and solutions for developers building Qt
applications.
Unlike the previous KDE libraries, they are split in tiny packages, reducing
dependencies as much as possible, making them usable even for embedded
projects.

This first commit introduce the kf5 packages folder and the first two KF5
packages:
- ecm - Extra CMake modules, addons for CMake used across the KF5 libraries
- NetworkManagerQt - a Qt wrapper for the NetworkManager DBus API

Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>
---
 package/Config.in                                  |  1 +
 package/kf5/Config.in                              | 12 ++++++++++++
 package/kf5/kf5.mk                                 | 11 +++++++++++
 package/kf5/kf5ecm/Config.in                       | 11 +++++++++++
 package/kf5/kf5ecm/kf5ecm.hash                     |  1 +
 package/kf5/kf5ecm/kf5ecm.mk                       | 16 ++++++++++++++++
 package/kf5/networkmanagerqt/Config.in             | 13 +++++++++++++
 package/kf5/networkmanagerqt/networkmanagerqt.hash |  1 +
 package/kf5/networkmanagerqt/networkmanagerqt.mk   | 17 +++++++++++++++++
 9 files changed, 83 insertions(+)
 create mode 100644 package/kf5/Config.in
 create mode 100644 package/kf5/kf5.mk
 create mode 100644 package/kf5/kf5ecm/Config.in
 create mode 100644 package/kf5/kf5ecm/kf5ecm.hash
 create mode 100644 package/kf5/kf5ecm/kf5ecm.mk
 create mode 100644 package/kf5/networkmanagerqt/Config.in
 create mode 100644 package/kf5/networkmanagerqt/networkmanagerqt.hash
 create mode 100644 package/kf5/networkmanagerqt/networkmanagerqt.mk

diff --git a/package/Config.in b/package/Config.in
index 9cd5d9c087..f9d7a6e190 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -302,6 +302,7 @@ comment "Graphic libraries"
 comment "Other GUIs"
 	source "package/qt/Config.in"
 	source "package/qt5/Config.in"
+	source "package/kf5/Config.in"
 if BR2_PACKAGE_QT || BR2_PACKAGE_QT5
 comment "QT libraries and helper libraries"
 	source "package/grantlee/Config.in"
diff --git a/package/kf5/Config.in b/package/kf5/Config.in
new file mode 100644
index 0000000000..a7b4fb765b
--- /dev/null
+++ b/package/kf5/Config.in
@@ -0,0 +1,12 @@
+menuconfig BR2_PACKAGE_KF5
+	bool "KF5"
+	depends on BR2_PACKAGE_QT5BASE
+	depends on BR2_PACKAGE_HOST_CMAKE
+	help
+	  This option enables the KF5 KDE Frameworks. Sub-options allow to
+	  select which modules should be built.
+
+if BR2_PACKAGE_KF5
+source "package/kf5/kf5ecm/Config.in"
+source "package/kf5/networkmanagerqt/Config.in"
+endif
diff --git a/package/kf5/kf5.mk b/package/kf5/kf5.mk
new file mode 100644
index 0000000000..485d7af175
--- /dev/null
+++ b/package/kf5/kf5.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# kf5
+#
+################################################################################
+
+KF5_VERSION_MAJOR = 5.41
+KF5_VERSION = $(KF5_VERSION_MAJOR).0
+KF5_SITE = https://download.kde.org/stable/frameworks/$(KF5_VERSION_MAJOR)
+
+include $(sort $(wildcard package/kf5/*/*.mk))
diff --git a/package/kf5/kf5ecm/Config.in b/package/kf5/kf5ecm/Config.in
new file mode 100644
index 0000000000..fe03f3b804
--- /dev/null
+++ b/package/kf5/kf5ecm/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_KF5ECM
+	bool "kf5ecm"
+	help
+	  KF5 is a set of Qt framework addons, extending Qt in
+	  various ways, not only restricted in helping integration
+	  in KDE.
+	  
+	  This package corresponds to the extra CMake modules, required
+	  for most KF5 libraries.
+
+	  https://api.kde.org/frameworks/extra-cmake-modules/html/index.html
diff --git a/package/kf5/kf5ecm/kf5ecm.hash b/package/kf5/kf5ecm/kf5ecm.hash
new file mode 100644
index 0000000000..4f510c152a
--- /dev/null
+++ b/package/kf5/kf5ecm/kf5ecm.hash
@@ -0,0 +1 @@
+sha256 baaf60940b9ff883332629ba2800090bb86722ba49a85cc12782e4ee5b169f67 extra-cmake-modules-5.41.0.tar.xz
diff --git a/package/kf5/kf5ecm/kf5ecm.mk b/package/kf5/kf5ecm/kf5ecm.mk
new file mode 100644
index 0000000000..4f6fea0b1b
--- /dev/null
+++ b/package/kf5/kf5ecm/kf5ecm.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# kf5ecm
+#
+################################################################################
+
+KF5ECM_VERSION = $(KF5_VERSION)
+KF5ECM_SITE = $(KF5_SITE)
+KF5ECM_SOURCE = extra-cmake-modules-$(KF5ECM_VERSION).tar.xz
+
+KF5ECM_DEPENDENCIES = host-pkgconf
+KF5ECM_INSTALL_STAGING = YES
+KF5ECM_INSTALL_TARGET = NO
+KF5ECM_CONF_OPTS = 
+
+$(eval $(cmake-package))
diff --git a/package/kf5/networkmanagerqt/Config.in b/package/kf5/networkmanagerqt/Config.in
new file mode 100644
index 0000000000..59f3b4222c
--- /dev/null
+++ b/package/kf5/networkmanagerqt/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_NETWORKMANAGERQT
+	bool "networkmanagerqt"
+	depends on BR2_PACKAGE_KF5ECM
+	depends on BR2_PACKAGE_NETWORK_MANAGER
+	help
+	  KF5 is a set of Qt framework addons, extending Qt in
+	  various ways, not only restricted in helping integration
+	  in KDE.
+	  
+	  This package contains the NetworkManager Qt5 bindings from the
+	  KF5 project.
+
+	  https://api.kde.org/frameworks/networkmanager-qt/html/index.html
diff --git a/package/kf5/networkmanagerqt/networkmanagerqt.hash b/package/kf5/networkmanagerqt/networkmanagerqt.hash
new file mode 100644
index 0000000000..ac4013efeb
--- /dev/null
+++ b/package/kf5/networkmanagerqt/networkmanagerqt.hash
@@ -0,0 +1 @@
+sha256 9bc26e42d27f829af1b1779cd10a4bb5639aebeeab80086a35b7ccaab85bb96d  networkmanager-qt-5.41.0.tar.xz
diff --git a/package/kf5/networkmanagerqt/networkmanagerqt.mk b/package/kf5/networkmanagerqt/networkmanagerqt.mk
new file mode 100644
index 0000000000..8cba1e29a7
--- /dev/null
+++ b/package/kf5/networkmanagerqt/networkmanagerqt.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# networkmanagerqt
+#
+################################################################################
+
+NETWORKMANAGERQT_VERSION = $(KF5_VERSION)
+NETWORKMANAGERQT_SITE = $(KF5_SITE)
+NETWORKMANAGERQT_SOURCE = networkmanager-qt-$(KF5ECM_VERSION).tar.xz
+NETWORKMANAGERQT_LICENSE = LGPL-2.1+
+
+NETWORKMANAGERQT_DEPENDENCIES = host-pkgconf kf5ecm network-manager
+NETWORKMANAGERQT_INSTALL_STAGING = YES
+NETWORKMANAGERQT_INSTALL_TARGET = YES
+NETWORKMANAGERQT_CONF_OPTS = 
+
+$(eval $(cmake-package))
-- 
2.16.1
