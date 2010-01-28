From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jan 2010 17:07:11 +0100
Subject: [Buildroot] [git commit master] libglib2: bump to 2.22.4
Message-ID: <20100128160908.B3EEE776F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=862b4ca144c34115d451d9fa44afb3d4bd0a75ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: updated to 2.22.4 instead which is so far only on ftp.gnome.org,
 fixed build without IPv6 support]
Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                       |    2 +-
 package/libglib2/libglib2-optional-ipv6.patch |   53 +++++++++++++++++++++++++
 package/libglib2/libglib2.mk                  |    6 +-
 3 files changed, 57 insertions(+), 4 deletions(-)
 create mode 100644 package/libglib2/libglib2-optional-ipv6.patch

diff --git a/CHANGES b/CHANGES
index 4ced83b..1dd027b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,7 +7,7 @@
 	Updated/fixed packages: at, autoconf, bash, bind, binutils, bootutils,
 	busybox, directfb, dnsmasq, e2fsprogs, gstreamer, gperf,
 	gst-plugins-bad, flex, hal, iptables, iw, jpeg, kismet, libfuse,
-	libpcap, libungif, lighttpd, mesa, mpg123, mtd-utils, neon,
+	libglib2, libpcap, libungif, lighttpd, mesa, mpg123, mtd-utils, neon,
 	netstat-nat, openvpn, pcre, qt, rpm, sdl, sdl_ttf, ser2net, sqlite,
 	sshfs, tremor, u-boot, usb_modeswitch, usbutils, webkit,
 	wpa_supplicant, xfsprogs
diff --git a/package/libglib2/libglib2-optional-ipv6.patch b/package/libglib2/libglib2-optional-ipv6.patch
new file mode 100644
index 0000000..7c511a3
--- /dev/null
+++ b/package/libglib2/libglib2-optional-ipv6.patch
@@ -0,0 +1,53 @@
+[PATCH]: fix build on uClibc without IPv6 support
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ gio/ginetaddress.c |    9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+Index: glib-2.22.4/gio/ginetaddress.c
+===================================================================
+--- glib-2.22.4.orig/gio/ginetaddress.c
++++ glib-2.22.4/gio/ginetaddress.c
+@@ -21,6 +21,7 @@
+  *          Samuel Cormier-Iijima <sciyoshi@gmail.com>
+  */
+ 
++#include <features.h>
+ #include <config.h>
+ 
+ #include <string.h>
+@@ -435,7 +436,11 @@ g_inet_address_new_from_string (const gc
+   return NULL;
+ }
+ 
++#if defined(__UCLIBC__) && !defined(__UCLIBC_HAS_IPV6__)
++#define G_INET_ADDRESS_FAMILY_IS_VALID(family) ((family) == AF_INET)
++#else
+ #define G_INET_ADDRESS_FAMILY_IS_VALID(family) ((family) == AF_INET || (family) == AF_INET6)
++#endif
+ 
+ /**
+  * g_inet_address_new_from_bytes:
+@@ -484,8 +489,10 @@ g_inet_address_new_loopback (GSocketFami
+ 
+       return g_inet_address_new_from_bytes (addr, family);
+     }
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_IPV6__))
+   else
+     return g_inet_address_new_from_bytes (in6addr_loopback.s6_addr, family);
++#endif
+ }
+ 
+ /**
+@@ -511,8 +518,10 @@ g_inet_address_new_any (GSocketFamily fa
+ 
+       return g_inet_address_new_from_bytes (addr, family);
+     }
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_IPV6__))
+   else
+     return g_inet_address_new_from_bytes (in6addr_any.s6_addr, family);
++#endif
+ }
+ 
+ 
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 5ef7e25..6e110f6 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -3,11 +3,11 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION_MAJOR = 2.20
-LIBGLIB2_VERSION_MINOR = 5
+LIBGLIB2_VERSION_MAJOR = 2.22
+LIBGLIB2_VERSION_MINOR = 4
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
-LIBGLIB2_SITE = http://ftp.gtk.org/pub/glib/$(LIBGLIB2_VERSION_MAJOR)
+LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 
 LIBGLIB2_AUTORECONF = NO
 LIBGLIB2_LIBTOOL_PATCH = NO
-- 
1.6.3.3
