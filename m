From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 May 2010 09:02:07 +0200
Subject: [Buildroot] [git commit master] libnl: include limits.h to fix
	build failure
Message-ID: <20100511070255.759C78D479@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c488481e9caf7717f50d89b952a27cbcc6343639
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the ULONG_MAX definition problem:

In file included from cache.c:43:
../include/netlink-local.h: In function '__str2type':../include/netlink-local.h:218: error: 'ULONG_MAX' undeclared (first use in this function)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                         |    2 +-
 package/libnl/libnl-1.1-netlink-local-fix.patch |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletions(-)
 create mode 100644 package/libnl/libnl-1.1-netlink-local-fix.patch

diff --git a/CHANGES b/CHANGES
index f305fd1..03eed65 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,7 @@
 	Fixes all over the tree.
 
 	Updated/fixed packages: busybox, customize, hal, hostapd,
-	less, libxcb, mplayer, netplug, pciutils,
+	less, libnl, libxcb, mplayer, netplug, pciutils,
 	xdriver_xf86-video-openchrome, usb_modeswitch, usbutils,
 	wpa_supplicant, xapp_bdftopcf, xapp_mkfontdir,
 	xfont_encodings, xlib_libX11, xlib_libXfont, xlib_xtrans,
diff --git a/package/libnl/libnl-1.1-netlink-local-fix.patch b/package/libnl/libnl-1.1-netlink-local-fix.patch
new file mode 100644
index 0000000..79cda28
--- /dev/null
+++ b/package/libnl/libnl-1.1-netlink-local-fix.patch
@@ -0,0 +1,19 @@
+Fixes the ULONG_MAX definition problem:
+
+In file included from cache.c:43:
+../include/netlink-local.h: In function '__str2type':../include/netlink-local.h:218: error: 'ULONG_MAX' undeclared (first use in this function)
+
+Patch borrowed from OpenEmbedded, recipes/libnl/files/netlink-local-fix.patch.
+
+Index: libnl-1.1/include/netlink-local.h
+===================================================================
+--- libnl-1.1.orig/include/netlink-local.h	2009-06-18 15:28:32.614209645 +0400
++++ libnl-1.1/include/netlink-local.h	2009-06-18 15:28:44.094190518 +0400
+@@ -26,6 +26,7 @@
+ #include <sys/socket.h>
+ #include <inttypes.h>
+ #include <assert.h>
++#include <limits.h>
+ 
+ #include <arpa/inet.h>
+ #include <netdb.h>
-- 
1.6.3.3
