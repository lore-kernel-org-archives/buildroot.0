From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 May 2020 11:05:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/usb_modeswitch: fix parallel install
Message-ID: <20200517090528.1724124-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extract from bug report:

"In usb_modeswitch Makefile dispatcher-script, dispatcher-dynlink and
dispatcher-statlink are .PHONY targets. The result is that sources are
compiled also when install targets are called.
USB_MODESWITCH_INSTALL_TARGET_CMDS calls $(MAKE) which is a call to
parallel make eg. make -j9. So the install phase can install empty
usb_modeswitch binary (happened once) if the compiler have just cleared
the binary and install command installs it before compiler writes the
binary. USB_MODESWITCH_INSTALL_TARGET_CMDS should call $(MAKE1)."

Instead of disabling parellel install, use install-common target instead
of install-{dyn,stat}link targets. Indeed, the dynamic or static
usb_modeswitch_dispatcher binary will be built by
all-with-{dyn,stat}link-dispatcher targets, there is no need to rebuild
it during the install step

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=12911

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usb_modeswitch/usb_modeswitch.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 7e9ed422b6..064e1960b0 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -17,12 +17,11 @@ USB_MODESWITCH_BUILD_TARGETS = all
 USB_MODESWITCH_INSTALL_TARGETS = install-script
 else
 USB_MODESWITCH_DEPENDENCIES += jimtcl
+USB_MODESWITCH_INSTALL_TARGETS = install-common
 ifeq ($(BR2_STATIC_LIBS),y)
 USB_MODESWITCH_BUILD_TARGETS = all-with-statlink-dispatcher
-USB_MODESWITCH_INSTALL_TARGETS = install-statlink
 else
 USB_MODESWITCH_BUILD_TARGETS = all-with-dynlink-dispatcher
-USB_MODESWITCH_INSTALL_TARGETS = install-dynlink
 endif
 endif
 
-- 
2.26.2
