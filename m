From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2015 17:13:04 +0100
Subject: [Buildroot] [git commit] package/libv4l: v4l-utils need locale
Message-ID: <20151130164028.E3D9780096@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf5f3fcc5a1783229c5cb0f832f832f4f43d72f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libv4l/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
