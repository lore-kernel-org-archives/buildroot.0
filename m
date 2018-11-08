From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 21:00:49 +0100
Subject: [Buildroot] [git commit] qt: disable static build for qt-zlib
Message-ID: <20181108195838.AB04D8172D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=112667fd120d136bcacef7e4a78f16a4ac92178a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Static build of applications using qt-zlib and zlib (such as mpv) will
fail because zlib and qt-zlib defines the same functions (inflateReset,
inflatePrime ...)

So add a dependency on !BR2_STATIC_LIBS on BR2_PACKAGE_QT_QTZLIB

Fixes:
 - http://autobuild.buildroot.org/results/0be6e359d46a8a701006305c32b514687854b035

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 0ecfafada5..a1218ecf39 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -309,9 +309,13 @@ choice
 
 config BR2_PACKAGE_QT_QTZLIB
 	bool "Qt zlib"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Use the zlib bundled with Qt.
 
+comment "Qt zlib needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_QT_SYSTEMZLIB
 	bool "System zlib"
 	select BR2_PACKAGE_ZLIB
