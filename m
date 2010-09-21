From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 21 Sep 2010 22:35:52 +0200
Subject: [Buildroot] [git commit master 1/1] libmms: bump version,
	add patch for architectures without unaligned access
Message-ID: <20100921203712.1A10F832D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e09414034418ef3ef6a6bb3af54c77c5599f79e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2581

Signed-off-by: Paul Burton <Paul.Burton@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |   20 +++--
 .../libmms-prevent-unaligned-dereferences.patch    |   84 ++++++++++++++++++++
 package/multimedia/libmms/libmms.mk                |    4 +-
 3 files changed, 98 insertions(+), 10 deletions(-)
 create mode 100644 package/multimedia/libmms/libmms-prevent-unaligned-dereferences.patch

diff --git a/CHANGES b/CHANGES
index 7f94a0f..404b454 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,20 +21,24 @@
 	bmon, bridge-utils, busybox, dbus, dmraid, docker, dropbear,
 	e2fsprogs, expat, freetype, gawk, gvfs, haserl, hostapd,
 	ifplugd, iptables, jpeg, kexec, kismet, less, libcurl,
-	libdnet, libevent, libglade, libgtk2, libiconv, libidn, libnl,
-	liboil, libpcap, libpng, libungif, libxml2, libxslt, lighttpd,
-	lite, m4, mdadm, metacity, mysql_client, nano, nbd, ncftp,
-	neon, netperf, ntfsprogs, ntp, openntpd, openssh, openvpn,
-	oprofile, pango, pcre, php, prboom, radvd, qt, samba, sdl_sound,
-	shared-mime-info, speex, sqlite, squashfs, strace, taglib,
-	tcpdump, tiff, tn5250, udev, udpcast, usbmount, usbutils,
-	which, xlib_libX11, zlib
+	libdnet, libevent, libglade, libgtk2, libiconv, libidn,
+	libmms, libnl, liboil, libpcap, libpng, libungif, libxml2,
+	libxslt, lighttpd, lite, m4, mdadm, metacity, mysql_client,
+	nano, nbd, ncftp, neon, netperf, ntfsprogs, ntp, openntpd,
+	openssh, openvpn, oprofile, pango, pcre, php, prboom, radvd,
+	qt, samba, sdl_sound, shared-mime-info, speex, sqlite,
+	squashfs, strace, taglib, tcpdump, tiff, tn5250, udev,
+	udpcast, usbmount, usbutils, which, xlib_libX11, zlib
 
 	Deprecated packages: lzma
 
 	Removed packages: dillo, libglib12, libgtk12, microwin,
 	pcmcia
 
+	Issues resolved (http://bugs.uclibc.org):
+
+	#2581: libmms: Update to 0.6, and patch to work on architectures...
+
 2010.08: Released August 31th, 2010:
 
 	Fixes all over the tree.
diff --git a/package/multimedia/libmms/libmms-prevent-unaligned-dereferences.patch b/package/multimedia/libmms/libmms-prevent-unaligned-dereferences.patch
new file mode 100644
index 0000000..9c606eb
--- /dev/null
+++ b/package/multimedia/libmms/libmms-prevent-unaligned-dereferences.patch
@@ -0,0 +1,84 @@
+From 4fd16633a8c379971425f7fd482152f163b09158 Mon Sep 17 00:00:00 2001
+From: Paul Burton <Paul.Burton@imgtec.com>
+Date: Fri, 17 Sep 2010 14:08:57 +0100
+Subject: [PATCH] Endianness macros should not dereference unaligned pointers
+
+The LE_*/BE_* macros previously worked by casting the pointer passed to them to a pointer to the correct integer type, then dereferencing it. This will not work on architectures which don't allow unaligned data access. Instead, access one byte at a time and shift to form the value.
+---
+ src/bswap.h |   59 +++++++++++++++++++++++++++++++++++++++++++----------------
+ 1 files changed, 43 insertions(+), 16 deletions(-)
+
+diff --git a/src/bswap.h b/src/bswap.h
+index b731da7..59e8716 100644
+--- a/src/bswap.h
++++ b/src/bswap.h
+@@ -21,23 +21,50 @@
+  */
+ 
+ 
+-/* Go cheap now, will rip out glib later. *Sigh* */
+-#include <glib.h>
+-
+-/* NOTE:
+- * Now, to clear up confusion: LE_XX means "from LE to native, XX bits wide"
+- * I know it's not very clear naming (tell me about it, I
+- * misinterpreted in first version and caused bad nasty bug, *sigh*),
+- * but that's inherited code, will clean up as things go
+- * Oh, and one more thing -- they take *pointers*, not actual ints
+- */
++#include <stdint.h>
++
++#define SWAP_ENDIAN_16(val) \
++	(val[1] | (val[0] << 8))
++#define SWAP_ENDIAN_32(val) \
++	(val[3] | (val[2] << 8) | (val[1] << 16) | (val[0] << 24))
++#define SWAP_ENDIAN_64(val) \
++	(val[7] | (val[6] << 8) | (val[5] << 16) | (val[4] << 24) | \
++	((uint64_t)val[3] << 32) | ((uint64_t)val[2] << 40) | \
++	((uint64_t)val[1] << 48) | ((uint64_t)val[0] << 56))
++
++#define SAME_ENDIAN_16(val) \
++	(val[0] | (val[1] << 8))
++#define SAME_ENDIAN_32(val) \
++	(val[0] | (val[1] << 8) | (val[2] << 16) | (val[3] << 24))
++#define SAME_ENDIAN_64(val) \
++	(val[0] | (val[1] << 8) | (val[2] << 16) | (val[3] << 24) | \
++	((uint64_t)val[4] << 32) | ((uint64_t)val[5] << 40) | \
++	((uint64_t)val[6] << 48) | ((uint64_t)val[7] << 56))
++
++#ifndef WORDS_BIGENDIAN
++
++/* Little endian */
++
++#define LE_16(val) SAME_ENDIAN_16(((uint8_t *)(val)))
++#define LE_32(val) SAME_ENDIAN_32(((uint8_t *)(val)))
++#define LE_64(val) SAME_ENDIAN_64(((uint8_t *)(val)))
++#define BE_16(val) SWAP_ENDIAN_16(((uint8_t *)(val)))
++#define BE_32(val) SWAP_ENDIAN_32(((uint8_t *)(val)))
++#define BE_64(val) SWAP_ENDIAN_64(((uint8_t *)(val)))
++
++#elif WORDS_BIGENDIAN == 1
++
++/* Big endian */
+ 
+-#define LE_16(val) (GINT16_FROM_LE (*((u_int16_t*)(val))))
+-#define BE_16(val) (GINT16_FROM_BE (*((u_int16_t*)(val))))
+-#define LE_32(val) (GINT32_FROM_LE (*((u_int32_t*)(val))))
+-#define BE_32(val) (GINT32_FROM_BE (*((u_int32_t*)(val))))
++#define LE_16(val) SWAP_ENDIAN_16(((uint8_t *)(val)))
++#define LE_32(val) SWAP_ENDIAN_32(((uint8_t *)(val)))
++#define LE_64(val) SWAP_ENDIAN_64(((uint8_t *)(val)))
++#define BE_16(val) SAME_ENDIAN_16(((uint8_t *)(val)))
++#define BE_32(val) SAME_ENDIAN_32(((uint8_t *)(val)))
++#define BE_64(val) SAME_ENDIAN_64(((uint8_t *)(val)))
+ 
+-#define LE_64(val) (GINT64_FROM_LE (*((u_int64_t*)(val))))
+-#define BE_64(val) (GINT64_FROM_BE (*((u_int64_t*)(val))))
++#else
++#error Unknown endianness!
++#endif
+ 
+ #endif /* BSWAP_H_INCLUDED */
+-- 
+1.7.2.2
+
diff --git a/package/multimedia/libmms/libmms.mk b/package/multimedia/libmms/libmms.mk
index 489bf0d..a8f4527 100644
--- a/package/multimedia/libmms/libmms.mk
+++ b/package/multimedia/libmms/libmms.mk
@@ -3,9 +3,9 @@
 # libmms
 #
 #############################################################
-LIBMMS_VERSION = 0.4
+LIBMMS_VERSION = 0.6
 LIBMMS_SOURCE = libmms-$(LIBMMS_VERSION).tar.gz
-LIBMMS_SITE = http://launchpad.net/libmms/trunk/$(LIBMMS_VERSION)/+download
+LIBMMS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libmms
 
 LIBMMS_AUTORECONF = NO
 LIBMMS_LIBTOOL_PATCH = NO
-- 
1.7.1
