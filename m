From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 6 May 2010 23:27:58 +0200
Subject: [Buildroot] [git commit master] usbutils: fix recursive LIBUSB
	Kconfig issue and bump to 0.87
Message-ID: <20100506212939.454D08B86C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dfb503937df53cb1e43a33f264b561bc99acf6ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1699

[Peter: Use BR2_KERNEL_MIRROR]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    3 ++-
 package/usbutils/Config.in   |    1 +
 package/usbutils/usbutils.mk |    7 +++++--
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 19cb486..525db27 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,12 +3,13 @@
 	Fixes all over the tree.
 
 	Updated/fixed packages: hal, mplayer,
-	xdriver_xf86-video-openchrome, usb_modeswitch
+	xdriver_xf86-video-openchrome, usb_modeswitch, usbutils
 
 	Issues resolved (http://bugs.uclibc.org):
 
 	#985: Bump usb_modeswitch package to 1.1.0
 	#1525: Package hal deletes a whole <target>/etc/rc.d directory
+	#1699: Fix usbutils dependencies and bump
 
 2010.05-rc1, Released May 3rd, 2010:
 
diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index 6e54352..4273252 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
+	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  USB enumeration utilities
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 880a2c8..f095297 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-USBUTILS_VERSION = 0.86
-USBUTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/linux-usb/
+USBUTILS_VERSION = 0.87
+USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkg-config libusb-compat
 
 ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
@@ -25,4 +25,7 @@ ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
 else
 	rm -f $(TARGET_DIR)/usr/share/usb.ids.gz
 endif
+ifneq ($(BR2_HAVE_DEVFILES),y)
+	rm -f $(TARGET_DIR)/usr/bin/libusb-config
+endif
 	touch $@
-- 
1.6.3.3
