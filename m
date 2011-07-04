From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jul 2011 23:33:31 +0200
Subject: [Buildroot] [PATCH 14/28] grub: convert to AUTOTARGETS
In-Reply-To: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5da5d0add11c6fd2219ac914f12ff083817173c3.1309815048.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.500-build-fix.patch |   14 +++++
 boot/grub/grub.mk                  |  102 ++++++++++++++----------------------
 2 files changed, 53 insertions(+), 63 deletions(-)
 create mode 100644 boot/grub/grub.500-build-fix.patch

diff --git a/boot/grub/grub.500-build-fix.patch b/boot/grub/grub.500-build-fix.patch
new file mode 100644
index 0000000..b096b7b
--- /dev/null
+++ b/boot/grub/grub.500-build-fix.patch
@@ -0,0 +1,14 @@
+--- grub-0.97.orig/netboot/main.c       2004-05-21 00:19:33.000000000 +0200
++++ grub-0.97/netboot/main.c    2007-07-20 02:31:28.000000000 +0200
+@@ -54,9 +54,9 @@
+ 
+ static int vendorext_isvalid;
+ static unsigned long netmask;
+-static struct bootpd_t bootp_data;
++struct bootpd_t bootp_data;
+ static unsigned long xid;
+-static unsigned char *end_of_rfc1533 = NULL;
++unsigned char *end_of_rfc1533 = NULL;
+
+ #ifndef        NO_DHCP_SUPPORT
+ #endif /* NO_DHCP_SUPPORT */
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 9461d1c..4938416 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -3,23 +3,17 @@
 # grub
 #
 #############################################################
-GRUB_SOURCE:=grub_0.97.orig.tar.gz
-GRUB_PATCH:=grub_0.97-35.diff.gz
-GRUB_SITE:=http://snapshot.debian.org/archive/debian/20080329T000000Z/pool/main/g/grub/
-GRUB_PATCH_SITE:=$(GRUB_SITE)
-GRUB_CAT:=$(ZCAT)
-GRUB_DIR:=$(BUILD_DIR)/grub-0.97
-GRUB_BINARY:=grub/grub
-GRUB_TARGET_BINARY:=sbin/grub
-GRUB_SPLASHIMAGE=$(TOPDIR)/boot/grub/splash.xpm.gz
 
+GRUB_VERSION = 0.97
+GRUB_SOURCE = grub_$(GRUB_VERSION).orig.tar.gz
+GRUB_PATCH  = grub_$(GRUB_VERSION)-35.diff.gz
+GRUB_SITE   = http://snapshot.debian.org/archive/debian/20080329T000000Z/pool/main/g/grub/
 
 GRUB_CFLAGS=-DSUPPORT_LOOPDEV
 ifeq ($(BR2_LARGEFILE),)
 GRUB_CFLAGS+=-U_FILE_OFFSET_BITS
 endif
 
-
 GRUB_CONFIG-$(BR2_TARGET_GRUB_SPLASH) += --enable-graphics
 GRUB_CONFIG-$(BR2_TARGET_GRUB_DISKLESS) += --enable-diskless
 GRUB_CONFIG-$(BR2_TARGET_GRUB_3c595) += --enable-3c595
@@ -44,69 +38,51 @@ GRUB_CONFIG-$(BR2_TARGET_GRUB_undi) += --enable-undi
 GRUB_CONFIG-$(BR2_TARGET_GRUB_via_rhine) += --enable-via-rhine
 GRUB_CONFIG-$(BR2_TARGET_GRUB_w89c840) += --enable-w89c840
 
-$(DL_DIR)/$(GRUB_SOURCE):
-	 $(call DOWNLOAD,$(GRUB_SITE),$(GRUB_SOURCE))
-
-$(DL_DIR)/$(GRUB_PATCH):
-	 $(call DOWNLOAD,$(GRUB_PATCH_SITE),$(GRUB_PATCH))
+define GRUB_DEBIAN_PATCHES
+	# Apply the patches from the Debian patch
+	(cd $(@D) ; for f in `cat debian/patches/00list | grep -v ^#` ; do \
+		cat debian/patches/$$f | patch -p1 ; \
+	done)
+endef
 
-grub-source: $(DL_DIR)/$(GRUB_SOURCE) $(DL_DIR)/$(GRUB_PATCH)
+GRUB_POST_PATCH_HOOKS += GRUB_DEBIAN_PATCHES
 
-$(GRUB_DIR)/.unpacked: $(DL_DIR)/$(GRUB_SOURCE) $(DL_DIR)/$(GRUB_PATCH)
-	$(GRUB_CAT) $(DL_DIR)/$(GRUB_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	toolchain/patch-kernel.sh $(GRUB_DIR) $(DL_DIR) $(GRUB_PATCH)
-	for i in `grep -v "^#" $(GRUB_DIR)/debian/patches/00list`; do \
-		cat $(GRUB_DIR)/debian/patches/$$i | patch -p1 -d $(GRUB_DIR); \
-	done
-	toolchain/patch-kernel.sh $(GRUB_DIR) boot/grub grub.\*.patch{,.bz2}
-	touch $@
+GRUB_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) $(GRUB_CFLAGS)"
 
-$(GRUB_DIR)/.configured: $(GRUB_DIR)/.unpacked
-	(cd $(GRUB_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		CPPFLAGS="$(GRUB_CFLAGS)" \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/ \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--disable-auto-linux-mem-opt \
-		$(GRUB_CONFIG-y) \
-	)
-	touch $@
+GRUB_CONF_OPT = \
+	--disable-auto-linux-mem-opt \
+	$(GRUB_CONFIG-y)
 
-$(GRUB_DIR)/$(GRUB_BINARY): $(GRUB_DIR)/.configured
-	$(MAKE) CC="$(TARGET_CC)" -C $(GRUB_DIR)
-	rm -f $(GRUB_DIR)/$(GRUB_BINARY)
-	$(MAKE) CC="$(TARGET_CC)" CFLAGS+=-static -C $(GRUB_DIR)/grub grub
-	mkdir -p $(dir $(STAGING_DIR)/$(GRUB_TARGET_BINARY))
-	mv $(GRUB_DIR)/$(GRUB_BINARY) $(STAGING_DIR)/$(GRUB_TARGET_BINARY).static
-	$(MAKE) CC="$(TARGET_CC)" -C $(GRUB_DIR)/grub
+define GRUB_INSTALL_STAGING_CMDS
+	install -m 0755 -D $(@D)/grub/grub $(STAGING_DIR)/sbin/grub
+endef
 
-$(GRUB_DIR)/.installed: $(GRUB_DIR)/$(GRUB_BINARY)
-	cp $(GRUB_DIR)/$(GRUB_BINARY) $(TARGET_DIR)/$(GRUB_TARGET_BINARY)
-	test -d $(TARGET_DIR)/boot/grub || mkdir -p $(TARGET_DIR)/boot/grub
-	cp $(GRUB_DIR)/stage1/stage1 $(GRUB_DIR)/stage2/*1_5 $(GRUB_DIR)/stage2/stage2 $(TARGET_DIR)/boot/grub/
 ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
-	test -f $(TARGET_DIR)/boot/grub/$(GRUB_SPLASHIMAGE) || \
-		cp $(GRUB_SPLASHIMAGE) $(TARGET_DIR)/boot/grub/
+define GRUB_INSTALL_SPLASH
+	cp boot/grub/splash.xpm.gz $(TARGET_DIR)/boot/grub/
+endef
 endif
-	touch $@
 
-grub: $(GRUB_DIR)/.installed
+define GRUB_INSTALL_TARGET_CMDS
+	install -m 0755 -D $(@D)/grub/grub $(TARGET_DIR)/sbin/grub
+	mkdir -p $(TARGET_DIR)/boot/grub
+	cp $(@D)/stage1/stage1 $(TARGET_DIR)/boot/grub
+	cp $(@D)/stage2/*1_5   $(TARGET_DIR)/boot/grub
+	cp $(@D)/stage2/stage2 $(TARGET_DIR)/boot/grub
+	$(GRUB_INSTALL_SPLASH)
+endef
+
+define GRUB_UNINSTALL_STAGING_CMDS
+	rm -f $(STAGING_DIR)/sbin/grub
+endef
 
-grub-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(GRUB_DIR) uninstall
-	-$(MAKE) -C $(GRUB_DIR) clean
-	rm -f $(TARGET_DIR)/boot/grub/$(GRUB_SPLASHIMAGE) \
-		$(TARGET_DIR)/sbin/$(GRUB_BINARY) \
-		$(TARGET_DIR)/boot/grub/{stage{1,2},*1_5}
+define GRUB_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/sbin/grub
+	rm -rf $(TARGET_DIR)/boot/grub
+endef
 
-grub-dirclean:
-	rm -rf $(GRUB_DIR)
+$(eval $(call AUTOTARGETS,boot,grub))
 
 #############################################################
 #
-- 
1.7.4.1
