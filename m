From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Sep 2010 23:24:11 +0200
Subject: [Buildroot] [git commit master 1/1] hdparm: convert to gentargets
	and bump to 9.32
Message-ID: <20100927212428.A72B88B6F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3a19ee499bec80d896c0e23c21ae206c6a2d91bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove stripping, get rid of _BINARY variables]
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                     |    2 +-
 package/hdparm/hdparm.mk    |   59 +++++++++++++++---------------------------
 package/hdparm/hdparm.patch |   12 --------
 3 files changed, 22 insertions(+), 51 deletions(-)
 delete mode 100644 package/hdparm/hdparm.patch

diff --git a/CHANGES b/CHANGES
index a446905..6e6539c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -25,7 +25,7 @@
 	bootutils, bridge-utils, bsdiff, busybox, dbus, dmraid,
 	docker, dosfstools, dropbear, e2fsprogs, expat, ezxml, fbset,
 	ffmpeg, freetype, gamin, gawk, gperf, gtk2-themes, gtkperf,
-	gvfs, haserl, hostapd, hwdata, ifplugd, iperf, iproute2,
+	gvfs, haserl, hdparm, hostapd, hwdata, ifplugd, iperf, iproute2,
 	iptables, jpeg, kexec, kismet, less, libcgi, libcurl, libdnet,
 	libevent, libglade, libgtk2, libiconv, libidn, libmms, libnl,
 	liboil, libpcap, libpng, libtool, libungif, libxml2, libxslt,
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index cc747eb..02d76a9 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -3,51 +3,34 @@
 # hdparm
 #
 #############################################################
-HDPARM_VERSION:=7.7
-HDPARM_SOURCE:=hdparm-$(HDPARM_VERSION).tar.gz
-HDPARM_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/hdparm
-HDPARM_CAT:=$(ZCAT)
-HDPARM_DIR:=$(BUILD_DIR)/hdparm-$(HDPARM_VERSION)
-HDPARM_BINARY:=hdparm
-HDPARM_TARGET_BINARY:=sbin/hdparm
+HDPARM_VERSION = 9.32
+HDPARM_SOURCE = hdparm-$(HDPARM_VERSION).tar.gz
+HDPARM_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/hdparm
 
-$(DL_DIR)/$(HDPARM_SOURCE):
-	 $(call DOWNLOAD,$(HDPARM_SITE),$(HDPARM_SOURCE))
-
-hdparm-source: $(DL_DIR)/$(HDPARM_SOURCE)
-
-$(HDPARM_DIR)/.unpacked: $(DL_DIR)/$(HDPARM_SOURCE)
-	$(HDPARM_CAT) $(DL_DIR)/$(HDPARM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(HDPARM_DIR) package/hdparm \*.patch
-	touch $@
-
-$(HDPARM_DIR)/$(HDPARM_BINARY): $(HDPARM_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(HDPARM_DIR) \
+define HDPARM_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)"
+endef
 
-$(TARGET_DIR)/$(HDPARM_TARGET_BINARY): $(HDPARM_DIR)/$(HDPARM_BINARY)
-	rm -f $(TARGET_DIR)/$(HDPARM_TARGET_BINARY)
-	$(INSTALL) -D -m 0755 $(HDPARM_DIR)/$(HDPARM_BINARY) $(TARGET_DIR)/$(HDPARM_TARGET_BINARY)
 ifeq ($(BR2_HAVE_DOCUMENTATION),y)
-	$(INSTALL) -D $(HDPARM_DIR)/hdparm.8 $(TARGET_DIR)/usr/share/man/man8/hdparm.8
+define HDPARM_INSTALL_DOCUMENTATION
+	$(INSTALL) -D $(@D)/hdparm.8 $(TARGET_DIR)/usr/share/man/man8/hdparm.8
+endef
 endif
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
 
-hdparm: $(TARGET_DIR)/$(HDPARM_TARGET_BINARY)
+define HDPARM_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/hdparm $(TARGET_DIR)/sbin/hdparm
+	$(HDPARM_INSTALL_DOCUMENTATION)
+endef
 
-hdparm-clean:
-	-$(MAKE) -C $(HDPARM_DIR) clean
-	rm -f $(TARGET_DIR)/$(HDPARM_TARGET_BINARY)
+define HDPARM_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/sbin/hdparm
+	rm -f $(TARGET_DIR)/usr/share/man/man8/hdparm.8
+endef
 
-hdparm-dirclean:
-	rm -rf $(HDPARM_DIR)
+define HDPARM_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_HDPARM),y)
-TARGETS+=hdparm
-endif
+$(eval $(call GENTARGETS,package,hdparm))
diff --git a/package/hdparm/hdparm.patch b/package/hdparm/hdparm.patch
deleted file mode 100644
index d271eb8..0000000
--- a/package/hdparm/hdparm.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -ur hdparm-7.6/Makefile hdparm-7.6-patched/Makefile
---- hdparm-7.6/Makefile	2007-06-07 12:39:24.000000000 -0500
-+++ hdparm-7.6-patched/Makefile	2007-07-19 12:11:03.000000000 -0500
-@@ -28,7 +28,7 @@
- 
- hdparm: hdparm.h $(OBJS)
- 	$(CC) $(LDFLAGS) -o hdparm $(OBJS)
--	strip hdparm
-+	$(STRIP) hdparm
-  
- install: all hdparm.8
- 	if [ ! -z $(DESTDIR) ]; then $(INSTALL_DIR) $(DESTDIR) ; fi
-- 
1.7.1
