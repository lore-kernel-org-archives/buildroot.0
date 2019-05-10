From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 10 May 2019 16:37:20 +0200
Subject: [Buildroot] [git commit] package/qt5enginio: needs ssl
Message-ID: <20190510145751.CE527814A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac38d6ce9c2d00623661806650807e14d4731e52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5enginio needs Qt5 with ssl support, a dependency could be added on
BR2_PACKAGE_QT5BASE_OPENSSL but this proposal was rejected in the first
iteration of this patch.

Qt5 has ssl support through libressl on Qt 5.6 or openssl in latest Qt
however we can't select libressl without adding a circular dependency as
some packages (such as sqlcipher) force openssl through
BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL.

Any solution at the Kconfig level that tries to select libressl will
lead to circular dependencies. Since Qt 5.6 is more or less deprecated
anyway, and since it is not tested in the autobuilders, solve this with
a comment. The comment is only shown for Qt 5.6, when libressl is not
selected. Note that it is also shown when qt5enginio is not selected.

Fixes:
 - http://autobuild.buildroot.org/results/60678cab68ec9aa17184b8417b64b3b79adf428a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5enginio/Config.in | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
index 102058e7c5..ac2d13b3ab 100644
--- a/package/qt5/qt5enginio/Config.in
+++ b/package/qt5/qt5enginio/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_QT5ENGINIO
 	bool "qt5enginio"
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_NETWORK
+	select BR2_PACKAGE_OPENSSL
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -15,3 +14,10 @@ config BR2_PACKAGE_QT5ENGINIO
 	  5.6 and not recommended for new design.
 
 	  http://doc.qt.io/archives/qt-5.5/enginio-index.html
+
+# Forcibly selecting libressl is not possible because it is from a choice, and
+# depending on it is also not possible because we select openssl. So just a
+# a warning.
+comment "qt5enginio needs libressl for Qt5.6"
+	depends on BR2_PACKAGE_QT5_VERSION_5_6
+	depends on !BR2_PACKAGE_LIBRESSL
