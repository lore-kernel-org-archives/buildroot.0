From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Jun 2013 11:14:12 -0300
Subject: [Buildroot] [PATCH] qt: broken on avr32
Message-ID: <1372342452-25725-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt is broken for the avr32 architecture since it lacks TLS support.
Fixes:
http://autobuild.buildroot.net/results/56d/56d1d8f12a847f1ba49547a51d7a3605755a0bb8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/opencv/Config.in | 1 +
 package/qt/Config.in     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 6a47ac5..26bf5e7 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -167,6 +167,7 @@ config BR2_PACKAGE_OPENCV_WITH_PNG
 config BR2_PACKAGE_OPENCV_WITH_QT
 	bool "qt backend support"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_avr32 # qt
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
 	default y
diff --git a/package/qt/Config.in b/package/qt/Config.in
index fdbb598..9f6e54d 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -3,6 +3,7 @@ comment "qt requires a toolchain with C++ support enabled"
 
 menuconfig BR2_PACKAGE_QT
 	bool "Qt"
+	depends on !BR2_avr32 # lacks TLS
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Qt is a cross-platform application and UI framework for
-- 
1.8.1.5
