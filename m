From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 30 Nov 2015 06:01:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/libv4l: v4l-utils need locale
Message-ID: <1448859698-20684-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To reproduce the setlocale-related build error use this minimal
defconfig:

BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_LIBV4L=y
BR2_PACKAGE_LIBV4L_UTILS=y

After enabling locale support the build error is fixed:

BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_LIBV4L=y
BR2_PACKAGE_LIBV4L_UTILS=y

Fixes
http://autobuild.buildroot.net/results/f2e/f2e4e34fb14ce355a6e92afc83024b0445f52513/
http://autobuild.buildroot.net/results/fe5/fe56063ddd2232fea7699f5117497beb3deca11e/
http://autobuild.buildroot.net/results/1be/1be55f096ddef2aa38fdba681ed97cf74905477a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libv4l/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 16dc6bb..8d7eca1 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -23,6 +23,7 @@ comment "libv4l JPEG support not enabled"
 
 config BR2_PACKAGE_LIBV4L_UTILS
 	bool "v4l-utils tools"
+	depends on BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  v4l-utils is a collection of various video4linux and DVB utilities.
@@ -38,6 +39,9 @@ config BR2_PACKAGE_LIBV4L_UTILS
 	  - rds-ctl
 	  - qv4l2 (if Qt is enabled)
 
+comment "libv4l-utils tools need a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
+
 endif
 
 comment "libv4l needs an uClibc or (e)glibc toolchain w/ threads, dynamic library, C++ and headers >= 3.0"
-- 
2.6.2
