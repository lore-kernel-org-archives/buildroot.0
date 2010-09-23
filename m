From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 23 Sep 2010 14:12:42 +0200
Subject: [Buildroot] [git commit master 1/1] mtd: bump version
Message-ID: <20100923124922.3B25F8B654@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a9b783379271eccf0f9745a31cfa8cbbadf51c53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                               |   10 ++++----
 package/mtd/mtd-utils-largefile.patch |   35 ---------------------------------
 package/mtd/mtd.mk                    |    2 +-
 3 files changed, 6 insertions(+), 41 deletions(-)
 delete mode 100644 package/mtd/mtd-utils-largefile.patch

diff --git a/CHANGES b/CHANGES
index 404b454..290af3a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -23,11 +23,11 @@
 	ifplugd, iptables, jpeg, kexec, kismet, less, libcurl,
 	libdnet, libevent, libglade, libgtk2, libiconv, libidn,
 	libmms, libnl, liboil, libpcap, libpng, libungif, libxml2,
-	libxslt, lighttpd, lite, m4, mdadm, metacity, mysql_client,
-	nano, nbd, ncftp, neon, netperf, ntfsprogs, ntp, openntpd,
-	openssh, openvpn, oprofile, pango, pcre, php, prboom, radvd,
-	qt, samba, sdl_sound, shared-mime-info, speex, sqlite,
-	squashfs, strace, taglib, tcpdump, tiff, tn5250, udev,
+	libxslt, lighttpd, lite, m4, mdadm, metacity, mtd-utils,
+	mysql_client, nano, nbd, ncftp, neon, netperf, ntfsprogs, ntp,
+	openntpd, openssh, openvpn, oprofile, pango, pcre, php,
+	prboom, radvd, qt, samba, sdl_sound, shared-mime-info, speex,
+	sqlite,	squashfs, strace, taglib, tcpdump, tiff, tn5250, udev,
 	udpcast, usbmount, usbutils, which, xlib_libX11, zlib
 
 	Deprecated packages: lzma
diff --git a/package/mtd/mtd-utils-largefile.patch b/package/mtd/mtd-utils-largefile.patch
deleted file mode 100644
index 91ef7b4..0000000
--- a/package/mtd/mtd-utils-largefile.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 90be45c82fa8c54ceb202619024142ed3db11c14 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Wed, 3 Feb 2010 09:23:19 +0100
-Subject: [PATCH] mtd-utils: add option to not force largefile support
-
-Not all systems have largefile support (E.G. uClibc depending on config),
-so unconditionally enforcing largefile breaks the build.
-
-Work around it by adding a WITHOUT_LARGEFILE flag, similar to the existing
-WITHOUT_XATTR.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- common.mk |    5 ++++-
- 1 files changed, 4 insertions(+), 1 deletions(-)
-
-diff --git a/common.mk b/common.mk
-index 5e92b07..d704b44 100644
---- a/common.mk
-+++ b/common.mk
-@@ -12,7 +12,10 @@ WFLAGS := -Wall \
- 	$(call cc-option,-Wwrite-strings) \
- 	$(call cc-option,-Wno-sign-compare)
- CFLAGS += $(WFLAGS)
--CPPFLAGS += -D_FILE_OFFSET_BITS=64
-+
-+ifneq ($(WITHOUT_LARGEFILE), 1)
-+  CPPFLAGS += -D_FILE_OFFSET_BITS=64
-+endif
- 
- DESTDIR ?= /usr/local
- PREFIX=/usr
--- 
-1.6.5
-
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index c573849..58ecc87 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -3,7 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION:=1.3.1
+MTD_VERSION:=1.4.0
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
 ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
-- 
1.7.1
