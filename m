From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  5 May 2019 14:47:31 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/qt5enginio: needs ssl
Message-ID: <20190505124731.18275-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5enginio needs Qt5 with ssl support, a dependency could be added on
BR2_PACKAGE_QT5BASE_OPENSSL but this proposal was rejected in the first
iteration of this patch

Qt5 has ssl support through libressl on Qt 5.6 or openssl in latest Qt
however we can't select libressl without adding a circular dependency as
some packages (such as sqlcipher) force openssl through
BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL

So, as suggested by Arnout:
 - add a hidden BR2_PACKAGE_QT5ENGINIO_SELECT_OPENSSL option that
   selects BR2_PACKAGE_OPENSSL if qt5enginio is selected
 - remove select on BR2_PACKAGE_QT5BASE to avoid a circular dependency
   and because it's not needed as BR2_PACKAGE_QT5 already selects
   BR2_PACKAGE_QT5BASE
 - add dependencies of BR2_PACKAGE_LIBRESSL if Qt 5.6 is selected (but
   don't select libressl to avoid a circular dependency)

Fixes:
 - http://autobuild.buildroot.org/results/60678cab68ec9aa17184b8417b64b3b79adf428a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni and Arnout
Vandecappelle):
 - Remove dependency on BR2_PACKAGE_QT5BASE_OPENSSL

 package/qt5/qt5enginio/Config.in | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
index 102058e7c5..94bf295396 100644
--- a/package/qt5/qt5enginio/Config.in
+++ b/package/qt5/qt5enginio/Config.in
@@ -1,7 +1,15 @@
+# This is a hack to avoid circular dependencies when selecting OPENSSL
+config BR2_PACKAGE_QT5ENGINIO_SELECT_OPENSSL
+	bool
+	default y if BR2_PACKAGE_QT5ENGINIO
+	select BR2_PACKAGE_OPENSSL
+
 config BR2_PACKAGE_QT5ENGINIO
 	bool "qt5enginio"
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_QT5BASE
+	depends on !BR2_PACKAGE_QT5_VERSION_5_6 || \
+		(BR2_PACKAGE_QT5_VERSION_5_6 && \
+		(!BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL && \
+		!(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)))
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_NETWORK
 	help
-- 
2.20.1
