From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] gamin: fix build with
	!BR2_LARGEFILE and python enabled
Message-ID: <20091123120648.8BB1977782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a1deb18ba670d84257d9f6fecf579a9787e7449c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python binding support is broken for cross compilation, disable for now.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |   10 +++++-----
 package/gamin/gamin.mk |    5 +++--
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index c4779ac..5defd09 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,11 +21,11 @@
 	sdl_sound, swfdec, sysstat
 
 	Updated/fixed packages: alsamixergui, autoconf, bootutils, busybox,
-	gcc, directfb, dnsmasq, e2fsprogs, festival, gstreamer, gst-plugins-bad,
-	gst-plugins-base, gst-plugins-good, imagemagick, ipkg, iptables,
-	iw, kernel-headers, kismet, libelf, libevent, libglib2, libidn,
-	liblockfile, libmad, libpcap, libupnp, libuuid, lighttpd, ltrace,
-	lua, lzma, magiccube4d, matchbox, mdadm, nbd, ncftp, ncurses,
+	gcc, directfb, dnsmasq, e2fsprogs, festival, gamin, gstreamer,
+	gst-plugins-bad, gst-plugins-base, gst-plugins-good, imagemagick,
+	ipkg, iptables, iw, kernel-headers, kismet, libelf, libevent, libglib2,
+	libidn, liblockfile, libmad, libpcap, libupnp, libuuid, lighttpd,
+	ltrace, lua, lzma, magiccube4d, matchbox, mdadm, nbd, ncftp, ncurses,
 	netkittelnet, netsnmp, ntfs-3g, openntp, openssl, php, python, quagga,
 	radvd, rsync, rubix, samba, sawman, sdl, shared-mime-info, spawn-fcgi,
 	speech-tools, sqlite, squashfs, synergy, syslinux, target-binutils,
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index 90b215a..1aa5f8b 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -12,9 +12,8 @@ GAMIN_INSTALL_TARGET = YES
 
 GAMIN_CONF_OPT = --program-prefix="" --disable-debug
 
-ifneq ($(BR2_PACKAGE_PYTHON),y)
+# python support broken
 GAMIN_CONF_OPT += --without-python
-endif
 
 GAMIN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
@@ -22,6 +21,8 @@ GAMIN_CONF_ENV = have_abstract_sockets=no
 
 ifneq ($(BR2_LARGEFILE),y)
 GAMIN_CONF_ENV += CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
+# the above doesn't work with shared config.cache
+GAMIN_USE_CONFIG_CACHE = NO
 endif
 
 GAMIN_DEPENDENCIES = libglib2
-- 
1.6.3.3
