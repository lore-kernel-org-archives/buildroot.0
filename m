From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  8 Nov 2018 20:28:29 +0100
Subject: [Buildroot] [PATCH 1/1] qt: disable static build for qt-zlib
Message-ID: <20181108192829.17014-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Static build of applications using qt-zlib and zlib (such as mpv) will
fail because zlib and qt-zlib defines the same functions (inflateReset,
inflatePrime ...)

So add a dependency on !BR2_STATIC_LIBS on BR2_PACKAGE_QT_QTZLIB

Fixes:
 - http://autobuild.buildroot.org/results/0be6e359d46a8a701006305c32b514687854b035

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.17.1
