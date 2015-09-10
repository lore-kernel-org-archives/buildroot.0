From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 10 Sep 2015 13:30:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-input-vmmouse:
	dep on udev
Message-ID: <1441888256-15742-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/cd3/cd3730ed0272c3f335ee90e0cbc4027b07945db3/

The xdriver_xf86-input-vmmouse driver depends on udev.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
The driver requires udev, or an option to allow it to build without udev.
I followed the precedent set by libinput and evdev by adding the
dependency.
---
 package/x11r7/xdriver_xf86-input-vmmouse/Config.in                    | 4 ++++
 .../x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk    | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
index de989eb..73e1a29 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_VMMOUSE
 	bool "xf86-input-vmmouse"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_HAS_UDEV # libudev is configure dependency
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  VMWare mouse input driver
+
+comment "xf86-input-vmmouse requires udev to be enabled"
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
index 53ceec8..3b49c2d 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_INPUT_VMMOUSE_SOURCE = xf86-input-vmmouse-$(XDRIVER_XF86_INPUT_VMMO
 XDRIVER_XF86_INPUT_VMMOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_VMMOUSE_LICENSE = MIT
 XDRIVER_XF86_INPUT_VMMOUSE_LICENSE_FILES = COPYING
-XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
+XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto udev
 
 $(eval $(autotools-package))
-- 
2.4.3
