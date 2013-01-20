From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 20:53:29 +0100
Subject: [Buildroot] [git commit] fs/common.mk: delay evaluation of variables
Message-ID: <20130120202432.4508582750@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=847895d29524d81b64afb059b8649a77802a469b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes things easier to understand and more consistent with the pkg-infra.
For example, it removes the need for '$$@' in the CMD variables of fs/*/*.mk.

It also makes it possible to update the variables later, e.g. in the package
override file.

It also makes sure that the date will be recorded correctly in Yann E. Morin's
patch that logs the MESSAGE macros to a file.

The fs/*/*.mk must be updated as well because the '$@' shouldn't be quoted
anymore in the CMD variables or the hooks.

The $(eval ...) for the dependencies is redundant, because the $(ROOTFS_TARGET)
variable is already eval'd. Note that it is only redundant if the evaluation of
the uses of the variable is also delayed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/cloop/cloop.mk       |    2 +-
 fs/common.mk            |   44 ++++++++++++++++++++++----------------------
 fs/cpio/cpio.mk         |    2 +-
 fs/cramfs/cramfs.mk     |    2 +-
 fs/ext2/ext2.mk         |    2 +-
 fs/jffs2/jffs2.mk       |    8 ++++----
 fs/romfs/romfs.mk       |    2 +-
 fs/squashfs/squashfs.mk |    4 ++--
 fs/tar/tar.mk           |    2 +-
 fs/ubifs/ubi.mk         |    4 ++--
 fs/ubifs/ubifs.mk       |    2 +-
 11 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/fs/cloop/cloop.mk b/fs/cloop/cloop.mk
index c1d6abb..c918684 100644
--- a/fs/cloop/cloop.mk
+++ b/fs/cloop/cloop.mk
@@ -7,7 +7,7 @@
 ROOTFS_CLOOP_DEPENDENCIES = host-cloop host-cdrkit
 
 define ROOTFS_CLOOP_CMD
-	$(HOST_DIR)/usr/bin/genisoimage -r $(TARGET_DIR) | $(HOST_DIR)/usr/bin/create_compressed_fs - 65536 > $$@
+	$(HOST_DIR)/usr/bin/genisoimage -r $(TARGET_DIR) | $(HOST_DIR)/usr/bin/create_compressed_fs - 65536 > $@
 endef
 
 $(eval $(call ROOTFS_TARGET,cloop))
\ No newline at end of file
diff --git a/fs/common.mk b/fs/common.mk
index b1512dd..8b5b2f2 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -39,28 +39,28 @@ ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE)) \
 define ROOTFS_TARGET_INTERNAL
 
 # extra deps
-$(eval ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $(if $(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma))
+ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma)
 
-$(BINARIES_DIR)/rootfs.$(1): $(ROOTFS_$(2)_DEPENDENCIES)
-	@$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
-	$(foreach hook,$(ROOTFS_$(2)_PRE_GEN_HOOKS),$(call $(hook))$(sep))
-	rm -f $(FAKEROOT_SCRIPT)
-	rm -f $(TARGET_DIR_WARNING_FILE)
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
-ifneq ($(ROOTFS_DEVICE_TABLES),)
-	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
-ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
-	printf '$(subst $(sep),\n,$(PACKAGES_DEVICES_TABLE))' >> $(FULL_DEVICE_TABLE)
+$$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
+	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
+	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
+	rm -f $$(FAKEROOT_SCRIPT)
+	rm -f $$(TARGET_DIR_WARNING_FILE)
+	echo "chown -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
+ifneq ($$(ROOTFS_DEVICE_TABLES),)
+	cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
+ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
+	printf '$$(subst $$(sep),\n,$$(PACKAGES_DEVICES_TABLE))' >> $$(FULL_DEVICE_TABLE)
 endif
-	printf '$(subst $(sep),\n,$(PACKAGES_PERMISSIONS_TABLE))' >> $(FULL_DEVICE_TABLE)
-	echo "$(HOST_DIR)/usr/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+	printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >> $$(FULL_DEVICE_TABLE)
+	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 endif
-	echo "$(ROOTFS_$(2)_CMD)" >> $(FAKEROOT_SCRIPT)
-	chmod a+x $(FAKEROOT_SCRIPT)
-	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
-	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
-	- at rm -f $(FAKEROOT_SCRIPT) $(FULL_DEVICE_TABLE)
-	$(foreach hook,$(ROOTFS_$(2)_POST_GEN_HOOKS),$(call $(hook))$(sep))
+	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
+	chmod a+x $$(FAKEROOT_SCRIPT)
+	$$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
+	cp support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
+	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
+	$$(foreach hook,$$(ROOTFS_$(2)_POST_GEN_HOOKS),$$(call $$(hook))$$(sep))
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 	gzip -9 -c $$@ > $$@.gz
 endif
@@ -68,13 +68,13 @@ ifeq ($$(BR2_TARGET_ROOTFS_$(2)_BZIP2),y)
 	bzip2 -9 -c $$@ > $$@.bz2
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZMA),y)
-	$(LZMA) -9 -c $$@ > $$@.lzma
+	$$(LZMA) -9 -c $$@ > $$@.lzma
 endif
 
 rootfs-$(1)-show-depends:
-	@echo $(ROOTFS_$(2)_DEPENDENCIES)
+	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
 
-rootfs-$(1): $(BINARIES_DIR)/rootfs.$(1) $(ROOTFS_$(2)_POST_TARGETS)
+rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS += rootfs-$(1)
diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 5533322..5bcec13 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -28,7 +28,7 @@ endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
 ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
 
 define ROOTFS_CPIO_CMD
-	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $$@
+	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $@
 endef
 
 $(eval $(call ROOTFS_TARGET,cpio))
diff --git a/fs/cramfs/cramfs.mk b/fs/cramfs/cramfs.mk
index 55f6bdb..6549f39 100644
--- a/fs/cramfs/cramfs.mk
+++ b/fs/cramfs/cramfs.mk
@@ -10,7 +10,7 @@ CRAMFS_OPTS=-l
 endif
 
 define ROOTFS_CRAMFS_CMD
- $(HOST_DIR)/usr/bin/mkcramfs $(CRAMFS_OPTS) $(TARGET_DIR) $$@
+ $(HOST_DIR)/usr/bin/mkcramfs $(CRAMFS_OPTS) $(TARGET_DIR) $@
 endef
 
 ROOTFS_CRAMFS_DEPENDENCIES = host-cramfs
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index cc8da0e..7b71592 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -21,7 +21,7 @@ endif
 ROOTFS_EXT2_DEPENDENCIES = host-genext2fs
 
 define ROOTFS_EXT2_CMD
-	PATH=$(TARGET_PATH) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $$@
+	PATH=$(TARGET_PATH) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
 endef
 
 $(eval $(call ROOTFS_TARGET,ext2))
diff --git a/fs/jffs2/jffs2.mk b/fs/jffs2/jffs2.mk
index 2a69849..b5423a8 100644
--- a/fs/jffs2/jffs2.mk
+++ b/fs/jffs2/jffs2.mk
@@ -36,13 +36,13 @@ ROOTFS_JFFS2_DEPENDENCIES = host-mtd
 
 ifneq ($(BR2_TARGET_ROOTFS_JFFS2_SUMMARY),)
 define ROOTFS_JFFS2_CMD
-	$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $$@.nosummary && \
-	$(SUMTOOL) $(SUMTOOL_OPTS) -i $$@.nosummary -o $$@ && \
-	rm $$@.nosummary
+	$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $@.nosummary && \
+	$(SUMTOOL) $(SUMTOOL_OPTS) -i $@.nosummary -o $@ && \
+	rm $@.nosummary
 endef
 else
 define ROOTFS_JFFS2_CMD
-	$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $$@
+	$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $@
 endef
 endif
 
diff --git a/fs/romfs/romfs.mk b/fs/romfs/romfs.mk
index 9719478..1a9f499 100644
--- a/fs/romfs/romfs.mk
+++ b/fs/romfs/romfs.mk
@@ -9,7 +9,7 @@ ROMFS_TARGET=$(IMAGE).romfs
 ROOTFS_ROMFS_DEPENDENCIES = host-genromfs
 
 define ROOTFS_ROMFS_CMD
-	$(HOST_DIR)/usr/bin/genromfs -d $(TARGET_DIR) -f $$@
+	$(HOST_DIR)/usr/bin/genromfs -d $(TARGET_DIR) -f $@
 endef
 
 $(eval $(call ROOTFS_TARGET,romfs))
\ No newline at end of file
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index a680dae..d4b56f4 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -33,9 +33,9 @@ endif
 endif
 
 define ROOTFS_SQUASHFS_CMD
-	$(HOST_DIR)/usr/bin/mksquashfs $(TARGET_DIR) $$@ -noappend \
+	$(HOST_DIR)/usr/bin/mksquashfs $(TARGET_DIR) $@ -noappend \
 		$(ROOTFS_SQUASHFS_ARGS) && \
-	chmod 0644 $$@
+	chmod 0644 $@
 endef
 
 $(eval $(call ROOTFS_TARGET,squashfs))
diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 4d435cb..1d327fa 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -7,7 +7,7 @@
 TAR_OPTS:=$(BR2_TARGET_ROOTFS_TAR_OPTIONS)
 
 define ROOTFS_TAR_CMD
- tar -c$(TAR_OPTS)f $$@ -C $(TARGET_DIR) .
+ tar -c$(TAR_OPTS)f $@ -C $(TARGET_DIR) .
 endef
 
 $(eval $(call ROOTFS_TARGET,tar))
diff --git a/fs/ubifs/ubi.mk b/fs/ubifs/ubi.mk
index c88e336..51ab42d 100644
--- a/fs/ubifs/ubi.mk
+++ b/fs/ubifs/ubi.mk
@@ -14,9 +14,9 @@ ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs
 
 define ROOTFS_UBI_CMD
 	cp fs/ubifs/ubinize.cfg . ;\
-	echo "image=$$@fs" \
+	echo "image=$@fs" \
 		>> ./ubinize.cfg ;\
-	$(HOST_DIR)/usr/sbin/ubinize -o $$@ $(UBI_UBINIZE_OPTS) ubinize.cfg ;\
+	$(HOST_DIR)/usr/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) ubinize.cfg ;\
 	rm ubinize.cfg
 endef
 
diff --git a/fs/ubifs/ubifs.mk b/fs/ubifs/ubifs.mk
index 337180e..8506dbd 100644
--- a/fs/ubifs/ubifs.mk
+++ b/fs/ubifs/ubifs.mk
@@ -19,7 +19,7 @@ endif
 ROOTFS_UBIFS_DEPENDENCIES = host-mtd
 
 define ROOTFS_UBIFS_CMD
-	$(HOST_DIR)/usr/sbin/mkfs.ubifs -d $(TARGET_DIR) $(UBIFS_OPTS) -o $$@
+	$(HOST_DIR)/usr/sbin/mkfs.ubifs -d $(TARGET_DIR) $(UBIFS_OPTS) -o $@
 endef
 
 $(eval $(call ROOTFS_TARGET,ubifs))
\ No newline at end of file
