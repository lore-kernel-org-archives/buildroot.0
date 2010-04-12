From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Apr 2010 15:11:15 +0200
Subject: [Buildroot] [PATCH 03/21] udpcast: convert to the autotools
	infrastructure
In-Reply-To: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b7fe41a1f4c9fc78ea89fe332a7d98d2922ed83f.1271077873.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/udpcast/udpcast.mk |   93 +++++++-------------------------------------
 1 files changed, 14 insertions(+), 79 deletions(-)

diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 3e0823a..5ec749d 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -6,90 +6,25 @@
 UDPCAST_VERSION:=20071228
 UDPCAST_SOURCE:=udpcast-$(UDPCAST_VERSION).tar.gz
 UDPCAST_SITE:=http://www.udpcast.linux.lu/download
-UDPCAST_CAT:=$(ZCAT)
-UDPCAST_DIR:=$(BUILD_DIR)/udpcast-$(UDPCAST_VERSION)
+UDPCAST_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
+UDPCAST_CONF_ENV = ac_cv_type_stat64=yes
 
-BR2_UDPCAST_CFLAGS:=
-
-$(DL_DIR)/$(UDPCAST_SOURCE):
-	 $(call DOWNLOAD,$(UDPCAST_SITE),$(UDPCAST_SOURCE))
-
-udpcast-source: $(DL_DIR)/$(UDPCAST_SOURCE)
-
-$(UDPCAST_DIR)/.unpacked: $(DL_DIR)/$(UDPCAST_SOURCE)
-	$(UDPCAST_CAT) $(DL_DIR)/$(UDPCAST_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(UDPCAST_DIR) package/udpcast udpcast\*.patch
-	$(CONFIG_UPDATE) $(UDPCAST_DIR)
-	touch $(UDPCAST_DIR)/.unpacked
-
-$(UDPCAST_DIR)/.configured: $(UDPCAST_DIR)/.unpacked
-	(cd $(UDPCAST_DIR); rm -rf config.cache; \
-		$(if $(BR_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no) \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS="$(TARGET_CFLAGS) $(BR2_UDPCAST_CFLAGS)" \
-		./configure $(QUIET) \
-		--target=$(REAL_GNU_TARGET_NAME) \
-		--host=$(REAL_GNU_TARGET_NAME) \
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
-		$(DISABLE_NLS) \
-	)
-	touch $(UDPCAST_DIR)/.configured
-
-UDPCAST_BINARIES:=udp-sender udp-receiver
-
-UDPCAST_BUILD_TARGETS:=$(addprefix $(UDPCAST_DIR)/,$(UDPCAST_BINARIES))
-
-$(UDPCAST_BUILD_TARGETS): $(UDPCAST_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(UDPCAST_DIR)
-
-UDPCAST_PROGS:=$(addprefix $(TARGET_DIR)/usr/sbin/,$(UDPCAST_BINARIES))
-
-UDPCAST_INSTALL_MANPAGES=$(addprefix $(TARGET_DIR)/usr/man/, $(addsuffix .1,$(UDPCAST_BINARIES)))
-
-UDPCAST_INSTALL_FILES:=$(UDPCAST_PROGS) $(UDPCAST_INSTALL_MANPAGES)
-
-$(UDPCAST_PROGS): $(UDPCAST_BUILD_TARGETS)
-	$(MAKE) -C $(UDPCAST_DIR) DESTDIR=$(TARGET_DIR) install
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(REMOVE_SECTION_COMMENT) \
-	  $(REMOVE_SECTION_NOTE) \
-	  $(UDPCAST_PROGS)
-ifneq ($(BR2_PACKAGE_UDPCAST_SENDER),y)
+define UDPCAST_REMOVE_UDP_SENDER
 	rm -f $(TARGET_DIR)/usr/sbin/udp-sender
 	rm -f $(TARGET_DIR)/usr/sbin/udp-sender.1
+endef
+
+ifneq ($(BR2_PACKAGE_UDPCAST_SENDER),y)
+UDPCAST_HOOK_POST_INSTALL_TARGET_HOOKS += UDPCAST_REMOVE_UDP_SENDER
 endif
-ifneq ($(BR2_PACKAGE_UDPCAST_RECEIVER),y)
+
+define UDPCAST_REMOVE_UDP_RECEIVER
 	rm -f $(TARGET_DIR)/usr/sbin/udp-receiver
 	rm -f $(TARGET_DIR)/usr/sbin/udp-receiver.1
-endif
-
-udpcast: $(UDPCAST_PROGS)
-
-udpcast-clean:
-	rm -f $(UDPCAST_INSTALL_FILES)
-	$(MAKE) -C $(UDPCAST_DIR) clean
-	rm -f $(UDPCAST_DIR)/.configured
-
-udpcast-dirclean:
-	rm -rf $(UDPCAST_DIR)
-
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_UDPCAST),y)
-TARGETS+=udpcast
+ifneq ($(BR2_PACKAGE_UDPCAST_RECEIVER),y)
+UDPCAST_HOOK_POST_INSTALL_TARGET_HOOKS += UDPCAST_REMOVE_UDP_RECEIVER
 endif
+
+$(eval $(call AUTOTARGETS,package,udpcast))
\ No newline at end of file
-- 
1.6.3.3
