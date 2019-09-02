From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 14:27:26 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/qt5/qt5enginio:
 switch to a depends on for SSL support
Message-ID: <20190902122641.8604189034@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d52d81fe595cd21d9ab100fc373ed7c1cbe39859
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

qt5enginio requires SSL support in qt5base. However, the SSL support
in qt5base is a bit annoying: while it can be provided by either
openssl or libressl for Qt latest, it can only be provided by
libressl for Qt 5.6.

Fabrice Fontaine initially proposed [0] a dependency on
BR2_PACKAGE_QT5BASE_OPENSSL, and a long discussion
followed. Ultimately, we found the dependency to not be nice, as it
required users to know that they need to enable some SSL
implementation to be able to enable qt5enginio.

The current solution enables BR2_PACKAGE_OPENSSL (the virtual
package), which can be either openssl or libressl. This choice was
done under the assumption that we anyway don't test Qt 5.6 in the
autobuilders. However, this is incorrect: Qt latest needs gcc >= 4.8
on host and target, and we have configurations in the autobuilders
that don't meet this requirement, and therefore build Qt 5.6, and face
a build issue due to OpenSSL being used instead of LibreSSL.

After additional thinking, this commit simply gets back to the
original solution proposed by Fabrice: a "depends on". We simply add
Config.in comments to help the user in knowing what is missing to
enable qt5enginio.

An alternate solution would have been to disallow selecting qt5enginio
when Qt 5.6 is used. But fixing the qt5enginio build is also needed
for the LTS branch, and we can't drop qt5enginio on Qt 5.6 in the LTS
branch, as that could bother users.

Fixes:

  http://autobuild.buildroot.net/results/227d4b9e2b48c5b3f2dcf0fad9eefa2816c1eb0c/

[0] https://patchwork.ozlabs.org/patch/1053883/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 035540b64acd920f75cdab22585590ed22d640f8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5enginio/Config.in | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
index ac2d13b3ab..e5b4782040 100644
--- a/package/qt5/qt5enginio/Config.in
+++ b/package/qt5/qt5enginio/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_QT5ENGINIO
 	bool "qt5enginio"
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_NETWORK
-	select BR2_PACKAGE_OPENSSL
+	depends on BR2_PACKAGE_QT5BASE_OPENSSL
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -15,9 +15,12 @@ config BR2_PACKAGE_QT5ENGINIO
 
 	  http://doc.qt.io/archives/qt-5.5/enginio-index.html
 
-# Forcibly selecting libressl is not possible because it is from a choice, and
-# depending on it is also not possible because we select openssl. So just a
-# a warning.
-comment "qt5enginio needs libressl for Qt5.6"
+# When Qt 5.6 is removed, replace the depends on
+# BR2_PACKAGE_QT5BASE_OPENSSL above by a select BR2_PACKAGE_OPENSSL.
+comment "qt5enginio needs libressl"
 	depends on BR2_PACKAGE_QT5_VERSION_5_6
-	depends on !BR2_PACKAGE_LIBRESSL
+	depends on !BR2_PACKAGE_QT5BASE_OPENSSL
+
+comment "qt5enginio needs openssl"
+	depends on BR2_PACKAGE_QT5_VERSION_LATEST
+	depends on !BR2_PACKAGE_QT5BASE_OPENSSL
