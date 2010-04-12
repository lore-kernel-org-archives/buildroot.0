From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Apr 2010 15:11:29 +0200
Subject: [Buildroot] [PATCH 17/21] findutils: convert to the autotools
	infrastructure
In-Reply-To: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
Message-ID: <74385f57801a5de56c8610d586a8ae031d4e5be5.1271077873.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/findutils/findutils.mk |   75 +---------------------------------------
 1 files changed, 1 insertions(+), 74 deletions(-)

diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 96e2682..a1893ad 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -5,79 +5,6 @@
 #############################################################
 FINDUTILS_VERSION:=4.2.31
 FINDUTILS_SOURCE:=findutils-$(FINDUTILS_VERSION).tar.gz
-#FINDUTILS_SITE:=ftp://alpha.gnu.org/gnu/findutils
 FINDUTILS_SITE:=$(BR2_GNU_MIRROR)/findutils/
-FINDUTILS_CAT:=$(ZCAT)
-FINDUTILS_DIR:=$(BUILD_DIR)/findutils-$(FINDUTILS_VERSION)
-FINDUTILS_BINARY:=find/find
-FINDUTILS_TARGET_BINARY:=usr/bin/find
 
-$(DL_DIR)/$(FINDUTILS_SOURCE):
-	 $(call DOWNLOAD,$(FINDUTILS_SITE),$(FINDUTILS_SOURCE))
-
-findutils-source: $(DL_DIR)/$(FINDUTILS_SOURCE)
-
-$(FINDUTILS_DIR)/.unpacked: $(DL_DIR)/$(FINDUTILS_SOURCE)
-	$(FINDUTILS_CAT) $(DL_DIR)/$(FINDUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(FINDUTILS_DIR)
-	touch $@
-
-$(FINDUTILS_DIR)/.configured: $(FINDUTILS_DIR)/.unpacked
-	(cd $(FINDUTILS_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_func_setvbuf_reversed=no \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib/locate \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var/lib \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
-
-$(FINDUTILS_DIR)/$(FINDUTILS_BINARY): $(FINDUTILS_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(FINDUTILS_DIR)
-
-# This stuff is needed to work around GNU make deficiencies
-findutils-target_binary: $(FINDUTILS_DIR)/$(FINDUTILS_BINARY)
-	@if [ -L $(TARGET_DIR)/$(FINDUTILS_TARGET_BINARY) ]; then \
-		rm -f $(TARGET_DIR)/$(FINDUTILS_TARGET_BINARY); \
-	fi
-	@if [ ! -f $(FINDUTILS_DIR)/$(FINDUTILS_BINARY) \
-		-o $(TARGET_DIR)/$(FINDUTILS_TARGET_BINARY) \
-		-ot $(FINDUTILS_DIR)/$(FINDUTILS_BINARY) ]; then \
-		set -x; \
-		$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FINDUTILS_DIR) install-strip; \
-		$(STRIPCMD) $(TARGET_DIR)/usr/lib/locate/* > /dev/null 2>&1; \
-	fi
-	rm -rf $(TARGET_DIR)/share/locale
-
-findutils: findutils-target_binary
-
-findutils-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FINDUTILS_DIR) uninstall
-	-$(MAKE) -C $(FINDUTILS_DIR) clean
-
-findutils-dirclean:
-	rm -rf $(FINDUTILS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_FINDUTILS),y)
-TARGETS+=findutils
-endif
+$(eval $(call AUTOTARGETS,package,findutils))
-- 
1.6.3.3
