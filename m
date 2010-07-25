From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jul 2010 16:53:50 +0200
Subject: [Buildroot] [PATCH 2/4] tftpd: convert to autotargets
In-Reply-To: <cover.1280069623.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280069623.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5339f1411f2fe6dd04e08e999193b04106b2b44f.1280069623.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tftpd/tftpd.mk |   83 +++++------------------------------------------
 1 files changed, 9 insertions(+), 74 deletions(-)

diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 795aab6..c4242f1 100644
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
\ No newline at end of file
-- 
1.7.0.4
