From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 18:57:16 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/usb_modeswitch:
 disable parallel build
Message-ID: <20181126175406.162798885C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa8d13d70e42c283e72fb34fb625bfcf7fccc315
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a554109af857b7b53598c5a9e0ee1d2729da73df)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usb_modeswitch/usb_modeswitch.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 8dd712f264..719e4fe33b 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -10,6 +10,8 @@ USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
 USB_MODESWITCH_LICENSE = GPL-2.0+
 USB_MODESWITCH_LICENSE_FILES = COPYING
+#??Package does not build in parallel due to improper make rules
+USB_MODESWITCH_MAKE = $(MAKE1)
 
 USB_MODESWITCH_BUILD_TARGETS = static
 USB_MODESWITCH_INSTALL_TARGETS = install-static
