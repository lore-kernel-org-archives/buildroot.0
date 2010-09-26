From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Sep 2010 22:25:06 +0200
Subject: [Buildroot] [git commit master 1/1] dosfstools: convert to
	gentargets and bump to 3.0.10
Message-ID: <20100926202615.010C48B6B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3d840536ccbb99a134a762fc489897a91822c9e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: pass LDFLAGS, remove stripping]
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                          |   23 ++++----
 package/dosfstools/dosfstools.mk |  105 ++++++++++++--------------------------
 2 files changed, 44 insertions(+), 84 deletions(-)

diff --git a/CHANGES b/CHANGES
index 64f4b05..26c17e7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -19,17 +19,18 @@
 
 	Updated/fixed packages: alsa-lib, at, avahi, berkeleydb, bind,
 	bmon, boa, bridge-utils, bsdiff, busybox, dbus, dmraid,
-	docker, dropbear, e2fsprogs, expat, ezxml, fbset, freetype,
-	gawk, gvfs, haserl, hostapd, ifplugd, iperf, iproute2,
-	iptables, jpeg, kexec, kismet, less, libcurl, libdnet,
-	libevent, libglade, libgtk2, libiconv, libidn, libmms, libnl,
-	liboil, libpcap, libpng, libungif, libxml2, libxslt, lighttpd,
-	lite, m4, mdadm, metacity, mtd-utils, mysql_client, nano, nbd,
-	ncftp, neon, netperf, ntfsprogs, ntp, openntpd, openssh,
-	openvpn, oprofile, pango, pcre, php, prboom, radvd, qt, samba,
-	sdl_mixer, sdl_sound, shared-mime-info, speex, sqlite,
-	squashfs, strace, taglib, tcpdump, tiff, tn5250, udev,
-	udpcast, usbmount, usbutils, which, xlib_libX11, zlib
+	docker, dosfstools, dropbear, e2fsprogs, expat, ezxml, fbset,
+	freetype, gawk, gvfs, haserl, hostapd, ifplugd, iperf,
+	iproute2, iptables, jpeg, kexec, kismet, less, libcurl,
+	libdnet, libevent, libglade, libgtk2, libiconv, libidn,
+	libmms, libnl, liboil, libpcap, libpng, libungif, libxml2,
+	libxslt, lighttpd, lite, m4, mdadm, metacity, mtd-utils,
+	mysql_client, nano, nbd, ncftp, neon, netperf, ntfsprogs, ntp,
+	openntpd, openssh, openvpn, oprofile, pango, pcre, php,
+	prboom, radvd, qt, samba, sdl_mixer, sdl_sound,
+	shared-mime-info, speex, sqlite, squashfs, strace, taglib,
+	tcpdump, tiff, tn5250, udev, udpcast, usbmount, usbutils,
+	which, xlib_libX11, zlib
 
 	Deprecated packages: hotplug, lzma
 
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index a7f59f0..8e6cfc9 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -3,76 +3,35 @@
 # dosfstools
 #
 #############################################################
-DOSFSTOOLS_VERSION:=3.0.3
-DOSFSTOOLS_SOURCE:=dosfstools-$(DOSFSTOOLS_VERSION).tar.gz
-DOSFSTOOLS_SITE:=http://www.daniel-baumann.ch/software/dosfstools
-DOSFSTOOLS_DIR:=$(BUILD_DIR)/dosfstools-$(DOSFSTOOLS_VERSION)
-DOSFSTOOLS_CAT:=$(ZCAT)
-MKDOSFS_BINARY:=mkdosfs
-MKDOSFS_TARGET_BINARY:=sbin/mkdosfs
-DOSFSCK_BINARY:=dosfsck
-DOSFSCK_TARGET_BINARY:=sbin/dosfsck
-DOSFSLABEL_BINARY:=dosfslabel
-DOSFSLABEL_TARGET_BINARY:=sbin/dosfslabel
-
-$(DL_DIR)/$(DOSFSTOOLS_SOURCE):
-	 $(call DOWNLOAD,$(DOSFSTOOLS_SITE),$(DOSFSTOOLS_SOURCE))
-
-dosfstools-source: $(DL_DIR)/$(DOSFSTOOLS_SOURCE)
-
-$(DOSFSTOOLS_DIR)/.unpacked: $(DL_DIR)/$(DOSFSTOOLS_SOURCE) $(wildcard local/dosfstools/dosfstools*.patch)
-	$(DOSFSTOOLS_CAT) $(DL_DIR)/$(DOSFSTOOLS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(DOSFSTOOLS_DIR) package/dosfstools/ dosfstools\*.patch
-	touch $(DOSFSTOOLS_DIR)/.unpacked
-
-$(DOSFSTOOLS_DIR)/.built : $(DOSFSTOOLS_DIR)/.unpacked
-	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(DOSFSTOOLS_DIR)
-	$(STRIPCMD) $(DOSFSTOOLS_DIR)/$(MKDOSFS_BINARY)
-	$(STRIPCMD) $(DOSFSTOOLS_DIR)/$(DOSFSCK_BINARY)
-	$(STRIPCMD) $(DOSFSTOOLS_DIR)/$(DOSFSLABEL_BINARY)
-	touch $@
-
-$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY): $(DOSFSTOOLS_DIR)/.built
-	cp -a $(DOSFSTOOLS_DIR)/$(MKDOSFS_BINARY) $@
-	touch -c $@
-
-$(TARGET_DIR)/$(DOSFSCK_TARGET_BINARY): $(DOSFSTOOLS_DIR)/.built
-	cp -a $(DOSFSTOOLS_DIR)/$(DOSFSCK_BINARY) $@
-	touch -c $@
-
-$(TARGET_DIR)/$(DOSFSLABEL_TARGET_BINARY): $(DOSFSTOOLS_DIR)/.built
-	cp -a $(DOSFSTOOLS_DIR)/$(DOSFSLABEL_BINARY) $@
-	touch -c $@
-
-DOSFSTOOLS=
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKDOSFS),y)
-DOSFSTOOLS+=$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY)
-endif
-
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_DOSFSCK),y)
-DOSFSTOOLS+=$(TARGET_DIR)/$(DOSFSCK_TARGET_BINARY)
-endif
-
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL),y)
-DOSFSTOOLS+=$(TARGET_DIR)/$(DOSFSLABEL_TARGET_BINARY)
-endif
-
-dosfstools: $(DOSFSTOOLS)
-
-dosfstools-clean:
-	rm -f $(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY)
-	rm -f $(TARGET_DIR)/$(DOSFSCK_TARGET_BINARY)
-	rm -f $(TARGET_DIR)/$(DOSFSLABEL_TARGET_BINARY)
-	-$(MAKE) -C $(DOSFSTOOLS_DIR) clean
-
-dosfstools-dirclean:
-	rm -rf $(DOSFSTOOLS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS),y)
-TARGETS+=dosfstools
-endif
\ No newline at end of file
+DOSFSTOOLS_VERSION = 3.0.10
+DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.gz
+DOSFSTOOLS_SITE = http://www.daniel-baumann.ch/software/dosfstools
+MKDOSFS_BINARY = mkdosfs
+DOSFSCK_BINARY = dosfsck
+DOSFSLABEL_BINARY = dosfslabel
+
+define DOSFSTOOLS_BUILD_CMDS
+	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" \
+		CC="$(TARGET_CC)" -C $(@D)
+endef
+
+DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_MKDOSFS)+=$(MKDOSFS_BINARY)
+DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_DOSFSCK)+=$(DOSFSCK_BINARY)
+DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL)+=$(DOSFSLABEL_BINARY)
+
+define DOSFSTOOLS_INSTALL_TARGET_CMDS
+	test -z "$(DOSFSTOOLS_INSTALL_BIN_FILES_y)" || \
+	install -m 755 $(addprefix $(@D)/,$(DOSFSTOOLS_INSTALL_BIN_FILES_y)) $(TARGET_DIR)/sbin/
+endef
+
+define DOSFSTOOLS_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/sbin/$(MKDOSFS_BINARY)
+	rm -f $(TARGET_DIR)/sbin/$(DOSFSCK_BINARY)
+	rm -f $(TARGET_DIR)/sbin/$(DOSFSLABEL_BINARY)
+endef
+
+define DOSFSTOOLS_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS,package,dosfstools))
-- 
1.7.1
