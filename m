From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 May 2010 09:02:07 +0200
Subject: [Buildroot] [git commit master] netplug: disable -Werror to fix
	build failure
Message-ID: <20100511070255.486F38D479@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c554cc2a2e62e4c383a20270b34a8d9b933ca6f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

netplug uses nested functions, and gcc generates a warning that
is turned into an error:

cc1: warnings being treated as errors
if_info.c: In function 'ifsm_scriptdone':
if_info.c:289: error: generating trampoline in object (requires executable stack)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    9 ++++---
 package/netplug/netplug-1.2.9-disable-werror.patch |   22 ++++++++++++++++++++
 2 files changed, 27 insertions(+), 4 deletions(-)
 create mode 100644 package/netplug/netplug-1.2.9-disable-werror.patch

diff --git a/CHANGES b/CHANGES
index 7dd7a5d..f305fd1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,10 +3,11 @@
 	Fixes all over the tree.
 
 	Updated/fixed packages: busybox, customize, hal, hostapd,
-	less, libxcb, mplayer, pciutils, xdriver_xf86-video-openchrome,
-	usb_modeswitch, usbutils, wpa_supplicant, xapp_bdftopcf,
-	xapp_mkfontdir, xfont_encodings, xlib_libX11, xlib_libXfont,
-	xlib_xtrans, xproto_fontcacheproto, xproto_fontsproto, xvkbd
+	less, libxcb, mplayer, netplug, pciutils,
+	xdriver_xf86-video-openchrome, usb_modeswitch, usbutils,
+	wpa_supplicant, xapp_bdftopcf, xapp_mkfontdir,
+	xfont_encodings, xlib_libX11, xlib_libXfont, xlib_xtrans,
+	xproto_fontcacheproto, xproto_fontsproto, xvkbd
 
 	Removed packages: vice
 
diff --git a/package/netplug/netplug-1.2.9-disable-werror.patch b/package/netplug/netplug-1.2.9-disable-werror.patch
new file mode 100644
index 0000000..d8a3e15
--- /dev/null
+++ b/package/netplug/netplug-1.2.9-disable-werror.patch
@@ -0,0 +1,22 @@
+netplug uses nested functions, and gcc generates a warning that
+is turned into an error:
+
+cc1: warnings being treated as errors
+if_info.c: In function 'ifsm_scriptdone':
+if_info.c:289: error: generating trampoline in object (requires executable stack)
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: netplug-1.2.9/Makefile
+===================================================================
+--- netplug-1.2.9.orig/Makefile	2010-05-09 21:07:40.000000000 +0200
++++ netplug-1.2.9/Makefile	2010-05-09 21:09:32.000000000 +0200
+@@ -9,7 +9,7 @@
+ 
+ install_opts :=
+ 
+-CFLAGS += -Wall -Werror -std=gnu99 -DNP_ETC_DIR='"$(etcdir)"' \
++CFLAGS += -Wall -std=gnu99 -DNP_ETC_DIR='"$(etcdir)"' \
+ 	-DNP_SCRIPT_DIR='"$(scriptdir)"' -ggdb3 -O3 -DNP_VERSION='"$(version)"'
+ 
+ netplugd: config.o netlink.o lib.o if_info.o main.o
-- 
1.6.3.3
