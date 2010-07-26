From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Jul 2010 00:52:13 +0200
Subject: [Buildroot] [git commit master 1/1] tftpd: convert to autotargets
Message-ID: <20100726225418.D0E6282DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5ca30174bff85592d3f4f2636b54ca5155671afe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    4 +-
 package/tftpd/tftpd.mk |   83 +++++------------------------------------------
 2 files changed, 11 insertions(+), 76 deletions(-)

diff --git a/CHANGES b/CHANGES
index abaa7af..d03b434 100644
--- a/CHANGES
+++ b/CHANGES
@@ -28,8 +28,8 @@
 	linux-fusion, lmbench, lrzsz, ltrace, make, module-init-tools,
 	mplayer, mysql_client, nbd, ncurses, neon, netcat, netperf,
 	ntfsprogs, openssl, php, qt, quagga, sqlite, sdl, sdl_mixer,
-	sdl_sound, sdl_ttf, squashfs, swfdec, thttpd, tn5250, tremor,
-	usbutils, webif, wireless_tools, xkeyboard-config,
+	sdl_sound, sdl_ttf, squashfs, swfdec, tftpd, thttpd, tn5250,
+	tremor, usbutils, webif, wireless_tools, xkeyboard-config,
 	xserver_xorg-server, xvkbd
 
 	Removed packages: modutils, portage, rxvt
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 795aab6..c3b9e1d 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -3,79 +3,14 @@
 # tftpd
 #
 #############################################################
-TFTP_HPA_VERSION:=0.40
-TFTP_HPA_SOURCE:=tftp-hpa-$(TFTP_HPA_VERSION).tar.bz2
-TFTP_HPA_SITE:=$(BR2_KERNEL_MIRROR)/software/network/tftp/
-TFTP_HPA_DIR:=$(BUILD_DIR)/tftp-hpa-$(TFTP_HPA_VERSION)
-TFTP_HPA_CAT:=$(BZCAT)
-TFTP_HPA_BINARY:=tftpd/tftpd
-TFTP_HPA_TARGET_BINARY:=usr/sbin/in.tftpd
+TFTPD_VERSION  = 5.0
+TFTPD_SOURCE   = tftp-hpa-$(TFTPD_VERSION).tar.bz2
+TFTPD_SITE     = $(BR2_KERNEL_MIRROR)/software/network/tftp/
+TFTPD_CONF_OPT = --without-tcpwrappers
 
-$(DL_DIR)/$(TFTP_HPA_SOURCE):
-	 $(call DOWNLOAD,$(TFTP_HPA_SITE),$(TFTP_HPA_SOURCE))
+define TFTPD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/tftpd/tftpd $(TARGET_DIR)/usr/sbin/tftpd
+	$(INSTALL) -D package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d/
+endef
 
-tftpd-source: $(DL_DIR)/$(TFTP_HPA_SOURCE)
-
-$(TFTP_HPA_DIR)/.unpacked: $(DL_DIR)/$(TFTP_HPA_SOURCE)
-	$(TFTP_HPA_CAT) $(DL_DIR)/$(TFTP_HPA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(TFTP_HPA_DIR) package/tftpd/ tftpd\*.patch
-	touch $(TFTP_HPA_DIR)/.unpacked
-
-$(TFTP_HPA_DIR)/.configured: $(TFTP_HPA_DIR)/.unpacked
-	(cd $(TFTP_HPA_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(DISABLE_LARGEFILE) \
-		--without-tcpwrappers \
-	)
-	touch $(TFTP_HPA_DIR)/.configured
-
-$(TFTP_HPA_DIR)/$(TFTP_HPA_BINARY): $(TFTP_HPA_DIR)/.configured
-	$(MAKE) -C $(TFTP_HPA_DIR)
-
-# This stuff is needed to work around GNU make deficiencies
-$(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY): $(TFTP_HPA_DIR)/$(TFTP_HPA_BINARY)
-	@if [ -L $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY) ]; then \
-		rm -f $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY); fi
-	@if [ ! -f $(TFTP_HPA_DIR)/$(TFTP_HPA_BINARY) -o $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY) \
-	-ot $(TFTP_HPA_DIR)/$(TFTP_HPA_BINARY) ]; then \
-	    set -x; \
-	    rm -f $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY); \
-	    cp -a $(TFTP_HPA_DIR)/$(TFTP_HPA_BINARY) $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY); fi
-	@if [ ! -f $(TARGET_DIR)/etc/init.d/S80tftpd-hpa ]; then \
-		$(INSTALL) -m 0755 package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d; \
-	fi
-
-tftpd: $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY)
-
-tftpd-clean:
-	rm -f $(TARGET_DIR)/etc/init.d/S80tftpd-hpa
-	rm -f $(TARGET_DIR)/usr/sbin/in.tftpd
-	-$(MAKE) -C $(TFTP_HPA_DIR) clean
-
-tftpd-dirclean:
-	rm -rf $(TFTP_HPA_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_TFTPD),y)
-TARGETS+=tftpd
-endif
+$(eval $(call AUTOTARGETS,package,tftpd))
-- 
1.7.1
