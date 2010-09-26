From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Sep 2010 22:25:06 +0200
Subject: [Buildroot] [git commit master 1/1] bsdiff: convert to gentargets
Message-ID: <20100926202614.8F88D8B6B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d4f1332110075f7c1eca5e333c906cb274f89407
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: cleanup build, install and uninstall targets]
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |   24 +++++++-------
 package/bsdiff/bsdiff.mk |   75 ++++++++++++++++------------------------------
 2 files changed, 38 insertions(+), 61 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4a0ed4f..3d9f738 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,18 +18,18 @@
 	New packages: xz
 
 	Updated/fixed packages: alsa-lib, at, avahi, berkeleydb, bind,
-	bmon, boa, bridge-utils, busybox, dbus, dmraid, docker, dropbear,
-	e2fsprogs, expat, ezxml, fbset, freetype, gawk, gvfs, haserl,
-	hostapd, ifplugd, iperf, iproute2, iptables, jpeg, kexec,
-	kismet, less, libcurl, libdnet, libevent, libglade, libgtk2,
-	libiconv, libidn, libmms, libnl, liboil, libpcap, libpng,
-	libungif, libxml2, libxslt, lighttpd, lite, m4, mdadm,
-	metacity, mtd-utils, mysql_client, nano, nbd, ncftp, neon,
-	netperf, ntfsprogs, ntp, openntpd, openssh, openvpn, oprofile,
-	pango, pcre, php, prboom, radvd, qt, samba, sdl_mixer,
-	sdl_sound, shared-mime-info, speex, sqlite, squashfs, strace,
-	taglib, tcpdump, tiff, tn5250, udev, udpcast, usbmount,
-	usbutils, which, xlib_libX11, zlib
+	bmon, boa, bridge-utils, bsdiff, busybox, dbus, dmraid,
+	docker, dropbear, e2fsprogs, expat, ezxml, fbset, freetype,
+	gawk, gvfs, haserl, hostapd, ifplugd, iperf, iproute2,
+	iptables, jpeg, kexec, kismet, less, libcurl, libdnet,
+	libevent, libglade, libgtk2, libiconv, libidn, libmms, libnl,
+	liboil, libpcap, libpng, libungif, libxml2, libxslt, lighttpd,
+	lite, m4, mdadm, metacity, mtd-utils, mysql_client, nano, nbd,
+	ncftp, neon, netperf, ntfsprogs, ntp, openntpd, openssh,
+	openvpn, oprofile, pango, pcre, php, prboom, radvd, qt, samba,
+	sdl_mixer, sdl_sound, shared-mime-info, speex, sqlite,
+	squashfs, strace, taglib, tcpdump, tiff, tn5250, udev,
+	udpcast, usbmount, usbutils, which, xlib_libX11, zlib
 
 	Deprecated packages: lzma
 
diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index 62608e9..276c6be 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -3,52 +3,29 @@
 # bsdiff
 #
 #############################################################
-BSDIFF_VERSION:=4.3
-BSDIFF_SOURCE:=bsdiff-$(BSDIFF_VERSION).tar.gz
-BSDIFF_SITE:=http://www.daemonology.net/bsdiff
-BSDIFF_DIR:=$(BUILD_DIR)/bsdiff-$(BSDIFF_VERSION)
-BSDIFF_BINARY:=bsdiff
-BSDIFF_TARGET_BINARY:=usr/bin/bsdiff
-BSDIFF_ZCAT=$(ZCAT)
-
-$(DL_DIR)/$(BSDIFF_SOURCE):
-	$(call DOWNLOAD,$(BSDIFF_SITE),$(BSDIFF_SOURCE))
-
-$(BSDIFF_DIR)/.source: $(DL_DIR)/$(BSDIFF_SOURCE)
-	$(BSDIFF_ZCAT) $(DL_DIR)/$(BSDIFF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(BSDIFF_DIR)/.source
-
-$(BSDIFF_DIR)/$(BSDIFF_BINARY): $(BSDIFF_DIR)/.source
-	(cd $(BSDIFF_DIR); \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CC) -L $(STAGING_DIR)/lib -lbz2 \
-			$(TARGET_CFLAGS) bsdiff.c -o bsdiff; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CC) -L $(STAGING_DIR)/lib -lbz2 \
-			$(TARGET_CFLAGS) bspatch.c -o bspatch; \
-	)
-
-$(TARGET_DIR)/$(BSDIFF_TARGET_BINARY): $(BSDIFF_DIR)/$(BSDIFF_BINARY)
-	cp -dpf $(BSDIFF_DIR)/bsdiff $(TARGET_DIR)/usr/bin/.
-	cp -dpf $(BSDIFF_DIR)/bspatch $(TARGET_DIR)/usr/bin/.
-
-bsdiff: bzip2 $(TARGET_DIR)/$(BSDIFF_TARGET_BINARY)
-
-bsdiff-source: $(DL_DIR)/$(BSDIFF_SOURCE)
-
-bsdiff-clean:
-	-rm $(TARGET_DIR)/usr/bin/{bsdiff,bspatch}
-	-rm $(BSDIFF_DIR)/{bsdiff,bspatch}
-
-bsdiff-dirclean:
-	rm -rf $(BSDIFF_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_BSDIFF),y)
-TARGETS+=bsdiff
-endif
+BSDIFF_VERSION = 4.3
+BSDIFF_SOURCE = bsdiff-$(BSDIFF_VERSION).tar.gz
+BSDIFF_SITE = http://www.daemonology.net/bsdiff
+BSDIFF_DEPENDENCIES = bzip2
+
+define BSDIFF_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -lbz2 \
+		$(@D)/bsdiff.c -o $(@D)/bsdiff
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -lbz2 \
+		$(@D)/bspatch.c -o $(@D)/bspatch
+endef
+
+define BSDIFF_INSTALL_TARGET_CMDS
+	install -D -m 755 $(@D)/bsdiff $(TARGET_DIR)/usr/bin/bsdiff
+	install -D -m 755 $(@D)/bspatch $(TARGET_DIR)/usr/bin/bspatch
+endef
+
+define BSDIFF_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/bsdiff $(TARGET_DIR)/usr/bin/bspatch
+endef
+
+define BSDIFF_CLEAN_CMDS
+	rm -f $(@D)/bsdiff $(@D)/bspatch
+endef
+
+$(eval $(call GENTARGETS,package,bsdiff))
-- 
1.7.1
