From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 22 Nov 2018 19:07:46 +0100
Subject: [Buildroot] [PATCH 1/1] usb_modeswitch: disable parallel build
Message-ID: <20181122180746.24616-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build of package will sometime fails because of the following issue:
install-static target has two dependencies: dispatcher-static and
install-common

Because dispatcher-static is not a file but only a target, it will
always be called to build usb_modeswitch_dispatcher.
So, even if install-common depends on usb_modeswitch_dispatcher, in some
rare cases, install-static won't be able to install
usb_modeswitch_dispatcher because it is being rebuild by
dispatcher-static

To fix this issue, disable parallel build

Fixes:
 - http://autobuild.buildroot.org/results/8297be35725b816ff5afaf909605ceb41223efb6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usb_modeswitch/usb_modeswitch.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index d0c33cc187..bb0d6ab1bf 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -10,6 +10,8 @@ USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
 USB_MODESWITCH_LICENSE = GPL-2.0+
 USB_MODESWITCH_LICENSE_FILES = COPYING
+#?Package does not build in parallel due to improper make rules
+USB_MODESWITCH_MAKE = $(MAKE1)
 
 USB_MODESWITCH_BUILD_TARGETS = static
 USB_MODESWITCH_INSTALL_TARGETS = install-static
-- 
2.14.1
