From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 14 Mar 2020 18:56:08 +0100
Subject: [Buildroot] [PATCH v3] package/qt5xmlpatterns: enable qml module
Message-ID: <20200314175608.18557-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5declarative:
 - remove unneded dependency on qt5mlpatterns

qt5xmlpatterns:
 - add optional dependency on qt5declarative

Reported-by: Nimai Mahajan <nimaim@gmail.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add Reported-by
  - - s/=/+=/ for qt5declarative dependency
Changes v2 -> v3:
  - rebase on master, adjusted to qmake-package, adjusted commit message
---
 package/qt5/qt5declarative/Config.in         | 1 -
 package/qt5/qt5declarative/qt5declarative.mk | 1 -
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk | 4 ++++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index 32ea8f0d0c..476cf33f39 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QT5DECLARATIVE
 	bool "qt5declarative"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	select BR2_PACKAGE_QT5XMLPATTERNS
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	help
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 42024c4a13..3318cd24c8 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -7,7 +7,6 @@
 QT5DECLARATIVE_VERSION = $(QT5_VERSION)
 QT5DECLARATIVE_SITE = $(QT5_SITE)
 QT5DECLARATIVE_SOURCE = qtdeclarative-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5DECLARATIVE_VERSION).tar.xz
-QT5DECLARATIVE_DEPENDENCIES = qt5xmlpatterns
 QT5DECLARATIVE_INSTALL_STAGING = YES
 
 QT5DECLARATIVE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 8552869925..6845483327 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -11,6 +11,10 @@ QT5XMLPATTERNS_INSTALL_STAGING = YES
 QT5XMLPATTERNS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5XMLPATTERNS_DEPENDENCIES += qt5declarative
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5XMLPATTERNS_LICENSE += , BSD-3-Clause (examples)
 endif
-- 
2.25.1
