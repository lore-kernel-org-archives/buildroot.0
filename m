From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] udev: convert to generic package
	infrastructure
Message-ID: <20091216153100.EDD2477738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=eebdec351aa6ad14389d6e58588ff57d5f67165e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/udev/udev.mk |  273 ++++++++++++++++---------------------------------
 1 files changed, 89 insertions(+), 184 deletions(-)

diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index ace9ae4..e74adb1 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -10,10 +10,7 @@ UDEV_VOLUME_ID_REVISION:=0
 UDEV_VOLUME_ID_VERSION:=$(UDEV_VOLUME_ID_CURRENT).$(UDEV_VOLUME_ID_AGE).$(UDEV_VOLUME_ID_REVISION)
 UDEV_SOURCE:=udev-$(UDEV_VERSION).tar.bz2
 UDEV_SITE:=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
-UDEV_CAT:=$(BZCAT)
-UDEV_DIR:=$(BUILD_DIR)/udev-$(UDEV_VERSION)
-UDEV_TARGET_BINARY:=sbin/udevd
-UDEV_BINARY:=udevd
+UDEV_INSTALL_STAGING=YES
 
 # 094 had _GNU_SOURCE set
 BR2_UDEV_CFLAGS:= -D_GNU_SOURCE $(TARGET_CFLAGS)
@@ -24,205 +21,113 @@ endif
 # UDEV_ROOT is /dev so we can replace devfs, not /udev for experiments
 UDEV_ROOT:=/dev
 
-$(DL_DIR)/$(UDEV_SOURCE):
-	 $(call DOWNLOAD,$(UDEV_SITE),$(UDEV_SOURCE))
+UDEV_EXTRAS=
+ifeq ($(BR2_PACKAGE_UDEV_VOLUME_ID),y)
+UDEV_EXTRAS+=volume_id
+endif
+ifeq ($(BR2_PACKAGE_UDEV_SCSI_ID),y)
+UDEV_EXTRAS+=scsi_id
+UDEV_EXTRAS+=usb_id
+endif
+ifeq ($(BR2_PACKAGE_UDEV_PATH_ID),y)
+UDEV_EXTRAS+=path_id
+endif
+ifeq ($(BR2_PACKAGE_UDEV_FIRMWARE_SH),y)
+UDEV_EXTRAS+=firmware
+endif
 
-$(UDEV_DIR)/.unpacked: $(DL_DIR)/$(UDEV_SOURCE)
-	$(UDEV_CAT) $(DL_DIR)/$(UDEV_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(UDEV_DIR) package/udev \*.patch
-	touch $@
+UDEV_BUILD_EXTRAS=$(addprefix extras/,$(UDEV_EXTRAS))
 
-$(UDEV_DIR)/$(UDEV_BINARY): $(UDEV_DIR)/.unpacked
+#
+# Build
+#
+define UDEV_BUILD_CMDS
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) CC=$(TARGET_CC) LD=$(TARGET_CC)\
 		CFLAGS="$(BR2_UDEV_CFLAGS)" \
 		USE_LOG=false USE_SELINUX=false \
-		udevdir=$(UDEV_ROOT) -C $(UDEV_DIR)
-	touch -c $@
-
-$(TARGET_DIR)/$(UDEV_TARGET_BINARY): $(UDEV_DIR)/$(UDEV_BINARY)
-	mkdir -p $(TARGET_DIR)/sys
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		DESTDIR=$(TARGET_DIR) \
-		CFLAGS="$(BR2_UDEV_CFLAGS)" \
-		LDFLAGS="-warn-common" \
-		USE_LOG=false USE_SELINUX=false \
-		udevdir=$(UDEV_ROOT) -C $(UDEV_DIR) install
-	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d
-	$(INSTALL) -m 0644 $(UDEV_DIR)/etc/udev/frugalware/* $(TARGET_DIR)/etc/udev/rules.d
-	( grep udev_root $(TARGET_DIR)/etc/udev/udev.conf > /dev/null 2>&1 || echo 'udev_root=/dev' >> $(TARGET_DIR)/etc/udev/udev.conf )
-	install -m 0755 -D $(UDEV_DIR)/udevstart $(TARGET_DIR)/sbin/udevstart
-	rm -rf $(TARGET_DIR)/usr/share/man
-ifneq ($(BR2_PACKAGE_UDEV_UTILS),y)
-	rm -f $(TARGET_DIR)/usr/sbin/udevmonitor
-	rm -f $(TARGET_DIR)/usr/bin/udevinfo
-	rm -f $(TARGET_DIR)/usr/bin/udevtest
-endif
-
-#####################################################################
-.PHONY: udev-source udev udev-clean udev-dirclean
-
-udev: $(TARGET_DIR)/$(UDEV_TARGET_BINARY)
+		udevdir=$(UDEV_ROOT) EXTRAS="$(UDEV_BUILD_EXTRAS)" -C $(@D)
+endef
 
-udev-source: $(DL_DIR)/$(UDEV_SOURCE)
-
-udev-clean: $(UDEV_CLEAN_DEPS)
-	rm -f $(TARGET_DIR)/etc/init.d/S10udev $(TARGET_DIR)/sbin/udev*
-	rm -f $(TARGET_DIR)/usr/sbin/udevmonitor $(TARGET_DIR)/usr/bin/udev*
-	rm -fr $(TARGET_DIR)/sys
-	-$(MAKE) -C $(UDEV_DIR) clean
-
-
-udev-dirclean: $(UDEV_DIRCLEAN_DEPS)
-	rm -rf $(UDEV_DIR)
-
-#####################################################################
+#
+# Staging installation
+#
 ifeq ($(BR2_PACKAGE_UDEV_VOLUME_ID),y)
-.PHONY: udev-volume_id udev-volume_id-clean udev-volume_id-dirclean
-
-$(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION):
-	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
-		CFLAGS="$(BR2_UDEV_CFLAGS)" \
-		USE_LOG=false USE_SELINUX=false \
-		udevdir=$(UDEV_ROOT) EXTRAS="extras/volume_id" -C $(UDEV_DIR)
+define UDEV_VOLUME_ID_STAGING_INSTALL_CMDS
 	$(INSTALL) -m 0644 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.h $(STAGING_DIR)/usr/include/libvolume_id.h
 	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $@
-	-ln -sf libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(STAGING_DIR)/usr/lib/libvolume_id.so.0
-	-ln -sf libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(STAGING_DIR)/usr/lib/libvolume_id.so
-
-$(STAGING_DIR)/usr/lib/libvolume_id.la: $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
-	$(INSTALL) -m 0755 -D package/udev/libvolume_id.la.tmpl $@
-	$(SED) 's/REPLACE_CURRENT/$(UDEV_VOLUME_ID_CURRENT)/g' $@
-	$(SED) 's/REPLACE_AGE/$(UDEV_VOLUME_ID_AGE)/g' $@
-	$(SED) 's/REPLACE_REVISION/$(UDEV_VOLUME_ID_REVISION)/g' $@
-	$(SED) 's,REPLACE_LIB_DIR,$(STAGING_DIR)/usr/lib,g' $@
-
-$(TARGET_DIR)/lib/udev/vol_id: $(STAGING_DIR)/usr/lib/libvolume_id.la
-	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(TARGET_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
-	-ln -sf libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(TARGET_DIR)/usr/lib/libvolume_id.so.0
-	-ln -sf libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(TARGET_DIR)/usr/lib/libvolume_id.so
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
-	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/volume_id/vol_id $@
-
-udev-volume_id: udev $(TARGET_DIR)/lib/udev/vol_id
-
-udev-volume_id-clean:
-	rm -f $(STAGING_DIR)/usr/include/libvolume_id.h
-	rm -f $(STAGING_DIR)/usr/lib/libvolume_id.so*
-	rm -f $(STAGING_DIR)/usr/lib/libvolume_id.la
-	rm -f $(TARGET_DIR)/usr/lib/libvolume_id.so.0*
-	rm -f $(TARGET_DIR)/lib/udev/vol_id
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/lib/udev
-
-udev-volume_id-dirclean:
-	-$(MAKE) EXTRAS="extras/volume_id" -C $(UDEV_DIR) clean
-
-UDEV_CLEAN_DEPS+=udev-volume_id-clean
-UDEV_DIRCLEAN_DEPS+=udev-volume_id-dirclean
-endif
-
-#####################################################################
-ifeq ($(BR2_PACKAGE_UDEV_SCSI_ID),y)
-.PHONY: udev-scsi_id udev-scsi_id-clean udev-scsi_id-dirclean
-
-$(TARGET_DIR)/lib/udev/scsi_id: $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
-	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
-		CFLAGS="$(BR2_UDEV_CFLAGS)" \
-		USE_LOG=false USE_SELINUX=false \
-		udevdir=$(UDEV_ROOT) EXTRAS="extras/scsi_id" -C $(UDEV_DIR)
-	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/scsi_id/scsi_id $@
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
-
-$(TARGET_DIR)/lib/udev/usb_id: $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
-	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
-		CFLAGS="$(BR2_UDEV_CFLAGS)" \
-		USE_LOG=false USE_SELINUX=false \
-		udevdir=$(UDEV_ROOT) EXTRAS="extras/usb_id" -C $(UDEV_DIR)
-	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/usb_id/usb_id $@
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
-
-udev-scsi_id: udev $(TARGET_DIR)/lib/udev/scsi_id $(TARGET_DIR)/lib/udev/usb_id
-
-udev-scsi_id-clean:
-	rm -f $(TARGET_DIR)/lib/udev/scsi_id
-	rm -f $(TARGET_DIR)/lib/udev/usb_id
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/lib/udev
-
-udev-scsi_id-dirclean:
-	-$(MAKE) EXTRAS="extras/scsi_id" -C $(UDEV_DIR) clean
-
-UDEV_CLEAN_DEPS+=udev-scsi_id-clean
-UDEV_DIRCLEAN_DEPS+=udev-scsi_id-dirclean
+	-ln -sf libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(STAGING_DIR)/lib/libvolume_id.so.0
+	-ln -sf libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(STAGING_DIR)/lib/libvolume_id.so
+	$(INSTALL) -m 0755 -D package/udev/libvolume_id.la.tmpl $(STAGING_DIR)/lib/libvolume_id.la
+	$(SED) 's/REPLACE_CURRENT/$(UDEV_VOLUME_ID_CURRENT)/g' $(STAGING_DIR)/lib/libvolume_id.la
+	$(SED) 's/REPLACE_AGE/$(UDEV_VOLUME_ID_AGE)/g' $(STAGING_DIR)/lib/libvolume_id.la
+	$(SED) 's/REPLACE_REVISION/$(UDEV_VOLUME_ID_REVISION)/g' $(STAGING_DIR)/lib/libvolume_id.la
+	$(SED) 's,REPLACE_LIB_DIR,$(STAGING_DIR)/usr/lib,g' $(STAGING_DIR)/lib/libvolume_id.la
+endef
 endif
 
-#####################################################################
-ifeq ($(BR2_PACKAGE_UDEV_PATH_ID),y)
-.PHONY: udev-path_id udev-path_id-clean udev-path_id-dirclean
-
-$(TARGET_DIR)/lib/udev/path_id: $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
-	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
-		CFLAGS="$(BR2_UDEV_CFLAGS)" \
-		USE_LOG=false USE_SELINUX=false \
-		udevdir=$(UDEV_ROOT) EXTRAS="extras/path_id" -C $(UDEV_DIR)
-	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/path_id/path_id $@
-
-udev-path_id: udev $(TARGET_DIR)/lib/udev/path_id
-
-udev-path_id-clean:
-	rm -f $(TARGET_DIR)/lib/udev/path_id
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/lib/udev
-
-udev-path_id-dirclean:
-	-$(MAKE) EXTRAS="extras/path_id" -C $(UDEV_DIR) clean
+define UDEV_INSTALL_STAGING_CMDS
+$(UDEV_VOLUME_ID_STAGING_INSTALL_CMDS)
+endef
 
-UDEV_CLEAN_DEPS+=udev-path_id-clean
-UDEV_DIRCLEAN_DEPS+=udev-path_id-dirclean
+#
+# Target installation
+#
+ifneq ($(BR2_PACKAGE_UDEV_UTILS),y)
+define UDEV_UTILS_REMOVAL
+	rm -f $(TARGET_DIR)/usr/sbin/udevmonitor
+	rm -f $(TARGET_DIR)/usr/bin/udevinfo
+	rm -f $(TARGET_DIR)/usr/bin/udevtest
+endef
 endif
 
-#####################################################################
-ifeq ($(BR2_PACKAGE_UDEV_FIRMWARE_SH),y)
-.PHONY: udev-firmware_sh udev-firmware_sh-clean udev-firmware_sh-dirclean
-
-$(TARGET_DIR)/lib/udev/firmware.sh: $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
-	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
+define UDEV_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/sys
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(TARGET_DIR) \
 		CFLAGS="$(BR2_UDEV_CFLAGS)" \
+		LDFLAGS="-warn-common" \
 		USE_LOG=false USE_SELINUX=false \
-		udevdir=$(UDEV_ROOT) EXTRAS="extras/firmware" -C $(UDEV_DIR)
-	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/firmware/firmware.sh $@
-
-udev-firmware_sh: udev $(TARGET_DIR)/lib/udev/firmware.sh
-
-udev-firmware_sh-clean:
-	rm -f $(TARGET_DIR)/lib/udev/firmware.sh
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/lib/udev
-
-udev-firmware_sh-dirclean:
-	-$(MAKE) EXTRAS="extras/firmware" -C $(UDEV_DIR) clean
-
-UDEV_CLEAN_DEPS+=udev-firmware_sh-clean
-UDEV_DIRCLEAN_DEPS+=udev-firmware_sh-dirclean
-endif
+		udevdir=$(UDEV_ROOT) EXTRAS="$(UDEV_BUILD_EXTRAS)" -C $(@D) install
+	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0644 $(@D)/etc/udev/frugalware/* $(TARGET_DIR)/etc/udev/rules.d
+	( grep udev_root $(TARGET_DIR)/etc/udev/udev.conf > /dev/null 2>&1 || echo 'udev_root=/dev' >> $(TARGET_DIR)/etc/udev/udev.conf )
+	install -m 0755 -D $(@D)/udevstart $(TARGET_DIR)/sbin/udevstart
+	for i in $(TARGET_DIR)/sbin/udev* $(TARGET_DIR)/usr/bin/udev* ; do \
+		$(STRIPCMD) $(STRIP_STRIP_ALL) $$i ; \
+	done
+	for i in scsi_id usb_id vol_id ; do \
+		if test -e $(TARGET_DIR)/lib/udev/$$i ; then \
+			$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/lib/udev/$$i ; \
+		fi \
+	done
+	$(UDEV_UTILS_REMOVAL)
+endef
 
-#############################################################
 #
-# Toplevel Makefile options
+# Clean
 #
-#############################################################
-ifeq ($(BR2_PACKAGE_UDEV),y)
-TARGETS+=udev
-endif
-
-ifeq ($(BR2_PACKAGE_UDEV_VOLUME_ID),y)
-TARGETS+=udev-volume_id
-endif
+define UDEV_CLEAN_CMDS
+	-$(MAKE) EXTRAS="$(UDEV_BUILD_EXTRAS)" -C $(@D) clean
+endef
 
-ifeq ($(BR2_PACKAGE_UDEV_SCSI_ID),y)
-TARGETS+=udev-scsi_id
-endif
+#
+# Staging uninstall
+#
+define UDEV_UNINSTALL_STAGING_CMDS
+	rm -f $(STAGING_DIR)/usr/include/libvolume_id.h
+	rm -f $(STAGING_DIR)/lib/libvolume_id.so*
+	rm -f $(STAGING_DIR)/lib/libvolume_id.la
+endef
 
-ifeq ($(BR2_PACKAGE_UDEV_PATH_ID),y)
-TARGETS+=udev-path_id
-endif
+#
+# Target uninstall
+#
+define UDEV_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/etc/init.d/S10udev $(TARGET_DIR)/sbin/udev*
+	rm -f $(TARGET_DIR)/usr/sbin/udevmonitor $(TARGET_DIR)/usr/bin/udev*
+	rm -fr $(TARGET_DIR)/sys
+	rm -f $(TARGET_DIR)/lib/libvolume_id.so.0*
+	rm -rf $(TARGET_DIR)/lib/udev
+endef
 
-ifeq ($(BR2_PACKAGE_UDEV_FIRMWARE_SH),y)
-TARGETS+=udev-firmware_sh
-endif
+$(eval $(call GENTARGETS,package,udev))
-- 
1.6.3.3
