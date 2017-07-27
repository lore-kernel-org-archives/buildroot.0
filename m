From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 27 Jul 2017 21:24:31 +0200
Subject: [Buildroot] [PATCH v1] qt-webkit-kiosk: fix icu/qt5webkit dependecy
	propagation
Message-ID: <20170727192431.6896-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ICU depends on BR2_HOST_GCC_AT_LEAST_4_8 and BR2_TOOLCHAIN_GCC_AT_LEAST_4_8,
this dependencies are propagated to qt5webkit but where not propagated to
qt-webkit-kiosk.

Fixes [1]:

  The WebKit build was disabled for the following reasons:
      * ICU is required.
  [...]
  cp -dpf .../host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libQt5WebKit*.so.* .../target/usr/lib
  cp: cannot stat `.../host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libQt5WebKit*.so.*': No such file or directory

[1] http://autobuild.buildroot.net/results/2f3/2f381967c82775ad911a246a9607034ef489c1ce

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt-webkit-kiosk/Config.in | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
index 703f128373..c613a8e6d8 100644
--- a/package/qt-webkit-kiosk/Config.in
+++ b/package/qt-webkit-kiosk/Config.in
@@ -3,7 +3,9 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_STATIC_LIBS # qt5webkit
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
-	depends on !BR2_BINFMT_FLAT # qt5webkit
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu/qt5webkit
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu/qt5webkit
+	depends on !BR2_BINFMT_FLAT # icu/qt5webkit
 	depends on !BR2_MIPS_SOFT_FLOAT # qt5webkit
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_QT5BASE_GUI
@@ -21,3 +23,10 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS
 	  Deploy browser sound files on target
 
 endif
+
+comment "qt-webkit-kiosk needs a toolchain w/ dynamic library, gcc >= 4.8, host gcc >= 4.8"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_HOST_GCC_AT_LEAST_4_8
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	depends on !BR2_BINFMT_FLAT
+	depends on !BR2_MIPS_SOFT_FLOAT
-- 
2.11.0
