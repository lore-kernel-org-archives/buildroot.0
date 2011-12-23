From: Sergio Prado <sergiosiena@gmail.com>
Date: Fri, 23 Dec 2011 20:02:18 -0200
Subject: [Buildroot] [PATCH] Xorg and Tslib
Message-ID: <CAKm6Z3Vnevex7hjJo7DxQRX_pnS6L1foeih=m=cQgttG7ZeaNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello guys!

First of all, congratulations for the great work you have been doing
on the Buildroot project!

That's my first message on the group. I have been using Buildroot
professionally for some time now.

Nowadays I have a training company here in Brazil, and guess what I am
using to teach embedded Linux? Buildroot, of course! :)

OK, so now that I have introduced myself, I would like to talk about
about a problem I was having here with X11 and touch screen devices.

I have generated a rootfs with X11 and Matchbox support. Everything
but the touchscreen works fine. I could use the ts_calibrate and
ts_test tools to test the TS device. But when I started X11/Matchbox,
the cursor was not calibrated.

Then I discovered that for X11 to talk directly to TS devices, it
needs the xf86-input-tslib driver. And we don't have it on Buildroot
(as far as I understood, it was developed by the Ubuntu team, not the
xorg team).

I integrated this package to the Buildoot build system, compiled and
tested. Everything is working now.

Here is the patch to include the xf86-input-tslib driver:

---
 package/x11r7/Config.in                            |    1 +
 package/x11r7/xdriver_xf86-input-tslib/Config.in   |    8 ++++++++
 .../xdriver_xf86-input-tslib.mk                    |   13 +++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-input-tslib/Config.in
 create mode 100644
package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 50816f2..af55939 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -176,6 +176,7 @@ endmenu
 		source package/x11r7/xdriver_xf86-input-synaptics/Config.in
 		source package/x11r7/xdriver_xf86-input-vmmouse/Config.in
 		source package/x11r7/xdriver_xf86-input-void/Config.in
+		source package/x11r7/xdriver_xf86-input-tslib/Config.in
 		source package/x11r7/xdriver_xf86-video-apm/Config.in
 		source package/x11r7/xdriver_xf86-video-ark/Config.in
 		source package/x11r7/xdriver_xf86-video-ast/Config.in
diff --git a/package/x11r7/xdriver_xf86-input-tslib/Config.in
b/package/x11r7/xdriver_xf86-input-tslib/Config.in
new file mode 100644
index 0000000..4c3f719
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
+	bool "xf86-input-tslib"
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Touch screen library input driver
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
new file mode 100644
index 0000000..b6455e7
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xdriver_xf86-input-tslib -- Touch screen library input driver
+#
+################################################################################
+
+XDRIVER_XF86_INPUT_TSLIB_VERSION = 0.0.6
+XDRIVER_XF86_INPUT_TSLIB_SOURCE =
xf86-input-tslib_$(XDRIVER_XF86_INPUT_TSLIB_VERSION).orig.tar.gz
+XDRIVER_XF86_INPUT_TSLIB_SITE =
http://ftp.de.debian.org/debian/pool/main/x/xf86-input-tslib/
+XDRIVER_XF86_INPUT_TSLIB_AUTORECONF = NO
+XDRIVER_XF86_INPUT_TSLIB_DEPENDENCIES = xproto_inputproto
xserver_xorg-server xproto_randrproto xproto_xproto
+
+$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-tslib))
-- 
1.7.1

--
Sergio Prado
www.sergioprado.org
Twitter @sergioprado
