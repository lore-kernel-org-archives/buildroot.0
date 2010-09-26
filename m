From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Sep 2010 22:25:06 +0200
Subject: [Buildroot] [git commit master 1/1] fbset: convert to gentargets
Message-ID: <20100926202614.187318B6B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b850ce811fa6749cc14123fe72bb20a85e6f8bd5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |   22 +++++++++---------
 package/fbset/fbset.mk |   59 +++++++++++++----------------------------------
 2 files changed, 28 insertions(+), 53 deletions(-)

diff --git a/CHANGES b/CHANGES
index fc5dad8..82e2bd1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -19,17 +19,17 @@
 
 	Updated/fixed packages: alsa-lib, at, avahi, berkeleydb, bind,
 	bmon, bridge-utils, busybox, dbus, dmraid, docker, dropbear,
-	e2fsprogs, expat, ezxml, freetype, gawk, gvfs, haserl, hostapd,
-	ifplugd, iperf, iproute2, iptables, jpeg, kexec, kismet, less,
-	libcurl, libdnet, libevent, libglade, libgtk2, libiconv, libidn,
-	libmms, libnl, liboil, libpcap, libpng, libungif, libxml2,
-	libxslt, lighttpd, lite, m4, mdadm, metacity, mtd-utils,
-	mysql_client, nano, nbd, ncftp, neon, netperf, ntfsprogs, ntp,
-	openntpd, openssh, openvpn, oprofile, pango, pcre, php,
-	prboom, radvd, qt, samba, sdl_mixer, sdl_sound,
-	shared-mime-info, speex, sqlite, squashfs, strace, taglib,
-	tcpdump, tiff, tn5250, udev, udpcast, usbmount, usbutils,
-	which, xlib_libX11, zlib
+	e2fsprogs, expat, ezxml, fbset, freetype, gawk, gvfs, haserl,
+	hostapd, ifplugd, iperf, iproute2, iptables, jpeg, kexec,
+	kismet, less, libcurl, libdnet, libevent, libglade, libgtk2,
+	libiconv, libidn, libmms, libnl, liboil, libpcap, libpng,
+	libungif, libxml2, libxslt, lighttpd, lite, m4, mdadm,
+	metacity, mtd-utils, mysql_client, nano, nbd, ncftp, neon,
+	netperf, ntfsprogs, ntp, openntpd, openssh, openvpn, oprofile,
+	pango, pcre, php, prboom, radvd, qt, samba, sdl_mixer,
+	sdl_sound, shared-mime-info, speex, sqlite, squashfs, strace,
+	taglib, tcpdump, tiff, tn5250, udev, udpcast, usbmount,
+	usbutils, which, xlib_libX11, zlib
 
 	Deprecated packages: lzma
 
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 32ab4b8..748920d 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -3,49 +3,24 @@
 # fbset
 #
 #############################################################
-FBSET_VERSION:=2.1
-FBSET_SOURCE:=fbset-$(FBSET_VERSION).tar.gz
-FBSET_SITE:=http://users.telenet.be/geertu/Linux/fbdev
-FBSET_DIR:=$(BUILD_DIR)/fbset-$(FBSET_VERSION)
-FBSET_CAT:=$(ZCAT)
-FBSET_BINARY:=fbset
-FBSET_TARGET_BINARY:=usr/sbin/$(FBSET_BINARY)
-
-$(DL_DIR)/$(FBSET_SOURCE):
-	$(call DOWNLOAD,$(FBSET_SITE),$(FBSET_SOURCE))
-
-$(FBSET_DIR)/.unpacked: $(DL_DIR)/$(FBSET_SOURCE)
-	$(FBSET_CAT) $(DL_DIR)/$(FBSET_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(FBSET_DIR) package/fbset/ \
-		fbset-$(FBSET_VERSION)\*.patch \
-		fbset-$(FBSET_VERSION)\*.patch.$(ARCH)
-	touch $@
-
-$(FBSET_DIR)/$(FBSET_BINARY): $(FBSET_DIR)/.unpacked
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(FBSET_DIR)
-	touch -c $@
-
-$(TARGET_DIR)/$(FBSET_TARGET_BINARY): $(FBSET_DIR)/$(FBSET_BINARY)
-	$(INSTALL) -m 755 $(FBSET_DIR)/$(FBSET_BINARY) $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
+FBSET_VERSION = 2.1
+FBSET_SOURCE = fbset-$(FBSET_VERSION).tar.gz
+FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
+FBSET_BINARY = fbset
+FBSET_TARGET_BINARY = usr/sbin/$(FBSET_BINARY)
+
+define FBSET_BUILD_CMDS
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define FBSET_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 $(@D)/$(FBSET_BINARY) $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
-	touch -c $@
-
-fbset: $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
-
-fbset-source: $(DL_DIR)/$(FBSET_SOURCE)
+endef
 
-fbset-clean:
+define FBSET_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
-	-$(MAKE) -C $(FBSET_DIR) clean
+	-$(MAKE) -C $(@D) clean
+endef
 
-fbset-dirclean:
-	rm -rf $(FBSET_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_FBSET),y)
-TARGETS+=fbset
-endif
+$(eval $(call GENTARGETS,package,fbset))
-- 
1.7.1
