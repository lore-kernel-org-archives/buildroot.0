From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Sep 2010 22:53:22 +0200
Subject: [Buildroot] [git commit master 1/1] logrotate: convert to
	gentargets and bump to 3.7.9
Message-ID: <20100926205433.A250A8B6D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f09275968cac629ea964474b7184be2dad3f1a36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: pass LDFLAGS, remove manpages, get rid _BINARY vars only used once]
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    8 ++--
 package/logrotate/logrotate.mk |   62 ++++++++++++++++++----------------------
 2 files changed, 32 insertions(+), 38 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4f6ed1e..33299a0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -24,10 +24,10 @@
 	iproute2, iptables, jpeg, kexec, kismet, less, libcurl,
 	libdnet, libevent, libglade, libgtk2, libiconv, libidn,
 	libmms, libnl, liboil, libpcap, libpng, libungif, libxml2,
-	libxslt, lighttpd, lite, m4, mdadm, metacity, mtd-utils,
-	mysql_client, nano, nbd, ncftp, neon, netperf, ntfsprogs, ntp,
-	openntpd, openssh, openvpn, oprofile, pango, pcre, php,
-	prboom, radvd, qt, samba, sdl_mixer, sdl_sound,
+	libxslt, lighttpd, lite, logrotate, m4, mdadm, metacity,
+	mtd-utils, mysql_client, nano, nbd, ncftp, neon, netperf,
+	ntfsprogs, ntp, openntpd, openssh, openvpn, oprofile, pango,
+	pcre, php, prboom, radvd, qt, samba, sdl_mixer, sdl_sound,
 	shared-mime-info, speex, sqlite, squashfs, strace, taglib,
 	tcpdump, tiff, tn5250, udev, udpcast, usbmount, usbutils,
 	which, xlib_libX11, zlib
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 337fd8e..0e41d6a 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -1,42 +1,36 @@
-LOGROTATE_VERSION:=3.7.7
-LOGROTATE_SOURCE:=logrotate-$(LOGROTATE_VERSION).tar.gz
-LOGROTATE_SITE:=https://fedorahosted.org/releases/l/o/logrotate/
-LOGROTATE_DIR:=$(BUILD_DIR)/logrotate-$(LOGROTATE_VERSION)
-LOGROTATE_BINARY:=logrotate
-LOGROTATE_TARGET_BINARY:=usr/sbin/$(LOGROTATE_BINARY)
-
-$(DL_DIR)/$(LOGROTATE_SOURCE):
-	$(call DOWNLOAD,$(LOGROTATE_SITE),$(LOGROTATE_SOURCE))
-
-$(LOGROTATE_DIR)/.source: $(DL_DIR)/$(LOGROTATE_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(LOGROTATE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LOGROTATE_DIR) package/logrotate/ logrotate\*.patch
-	touch $@
-
-$(LOGROTATE_DIR)/$(LOGROTATE_BINARY): $(LOGROTATE_DIR)/.source
-	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" -C $(LOGROTATE_DIR)
-
-$(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY): $(LOGROTATE_DIR)/$(LOGROTATE_BINARY)
-	$(MAKE) PREFIX=$(TARGET_DIR) -C $(LOGROTATE_DIR) install
+#############################################################
+#
+# logrotate
+#
+#############################################################
+LOGROTATE_VERSION = 3.7.9
+LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.gz
+LOGROTATE_SITE = https://fedorahosted.org/releases/l/o/logrotate/
+
+LOGROTATE_DEPENDENCIES = popt
+
+define LOGROTATE_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" LDFLAGS="$(LDFLAGS)" -C $(@D)
+endef
+
+define LOGROTATE_INSTALL_TARGET_CMDS
+	$(MAKE) PREFIX=$(TARGET_DIR) -C $(@D) install
 	if [ ! -f $(TARGET_DIR)/etc/logrotate.conf ]; then \
 		$(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf; \
 	fi
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/logrotate.d
+endef
 
-logrotate: popt $(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY)
-
-logrotate-source: $(DL_DIR)/$(LOGROTATE_SOURCE)
-
-logrotate-clean:
-	rm -f $(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY)
+define LOGROTATE_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/logrotate
 	rm -f $(TARGET_DIR)/etc/logrotate.conf
-	-rmdir $(TARGET_DIR)/etc/logrotate.d
-	-$(MAKE) -C $(LOGROTATE_DIR) clean
-
-logrotate-dirclean:
-	rm -rf $(LOGROTATE_DIR)
+	rm -f $(TARGET_DIR)/usr/man/man5/logrotate.conf.5
+	rm -f $(TARGET_DIR)/usr/man/man8/logrotate.8
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/etc/logrotate.d
+endef
 
-ifeq ($(BR2_PACKAGE_LOGROTATE),y)
-TARGETS+=logrotate
-endif
+define LOGROTATE_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
 
+$(eval $(call GENTARGETS,package,logrotate))
-- 
1.7.1
