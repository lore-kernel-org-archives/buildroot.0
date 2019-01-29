From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 23:01:23 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/usb_modeswitch:
 avoid overriding variables
Message-ID: <20190129220037.A34A9827FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a59efaf6dcd4d092483edc25fe0b4990a510a9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Overriding variables in packages recipes is an error-prone practice.

Current behavior of installing either only as a script or only as a
binary is intended, as describe in the commit log of "d3e4db4e34
usb_modeswitch: bump to version 1.2.6" from 2013.

Rewrite the code to keep the same behavior while replacing variable
override [1] by conditional assignments [2].

[1]
VAR = ...
if ...
VAR = ...

[2]
if ...
VAR = ...
else
VAR = ...

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e25040d31a8d50c3c523f78f43ba1f557269b3bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usb_modeswitch/usb_modeswitch.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 389ed1f422..0b7eb171dd 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -13,13 +13,13 @@ USB_MODESWITCH_LICENSE_FILES = COPYING
 # Package does not build in parallel due to improper make rules
 USB_MODESWITCH_MAKE = $(MAKE1)
 
-USB_MODESWITCH_BUILD_TARGETS = static
-USB_MODESWITCH_INSTALL_TARGETS = install-static
-
 ifeq ($(BR2_PACKAGE_TCL)$(BR2_PACKAGE_TCL_SHLIB_ONLY),y)
 USB_MODESWITCH_DEPENDENCIES += tcl
 USB_MODESWITCH_BUILD_TARGETS = script
 USB_MODESWITCH_INSTALL_TARGETS = install-script
+else
+USB_MODESWITCH_BUILD_TARGETS = static
+USB_MODESWITCH_INSTALL_TARGETS = install-static
 endif
 
 # build system of embedded jimtcl doesn't use autotools, but does use
