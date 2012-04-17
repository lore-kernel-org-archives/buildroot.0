From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 16:45:21 +0200
Subject: [Buildroot] [PATCH 09/22] Remove unused .fakeroot.* mechanism
In-Reply-To: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a5d1f43e9d123e5e8a7b6c44240b5d8928ea161d.1334673910.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There used to be a mechanism using which packages could leave a
.fakeroot.<something> file which could contain commands to be executed
within the fakeroot environment. Since this mechanism is no longer
used by any package, remove it from the common infrastructure.

The latest user was nfs-utils, which used this mechanism to do the
"make install" as root, since doing otherwise was not supported. But
since 16e7b8255c82815126a2c502c3787d442d254a86, nfs-utils has been
upgraded and converted to the package infrastructure, and this hack is
no longer necessary. Another past user was the ltp-testsuite package,
for the same reason, and since
a72a670489547a3ca645ff7c3a0d9c3fb66eab51, the fakeroot hack is no
longer needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile              |    6 ------
 fs/common.mk          |    2 --
 fs/iso9660/iso9660.mk |    2 --
 3 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index e03fed5..a65848d 100644
--- a/Makefile
+++ b/Makefile
@@ -301,8 +301,6 @@ endif
 
 include fs/common.mk
 
-TARGETS+=erase-fakeroots
-
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
@@ -391,7 +389,6 @@ $(BUILD_DIR)/.root:
 		if [ -d "$(TARGET_SKELETON)" ]; then \
 			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
 		fi; \
-		touch $(STAGING_DIR)/.fakeroot.00000; \
 	fi
 	-find $(TARGET_DIR) -type d -name CVS -print0 -o -name .svn -print0 | xargs -0 rm -rf
 	-find $(TARGET_DIR) -type f \( -name .empty -o -name '*~' \) -print0 | xargs -0 rm -rf
@@ -399,9 +396,6 @@ $(BUILD_DIR)/.root:
 
 $(TARGET_DIR): $(BUILD_DIR)/.root
 
-erase-fakeroots:
-	rm -f $(BUILD_DIR)/.fakeroot*
-
 target-finalize:
 ifeq ($(BR2_HAVE_DEVFILES),y)
 	( support/scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
diff --git a/fs/common.mk b/fs/common.mk
index d426f37..debf7db 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -45,8 +45,6 @@ $(BINARIES_DIR)/rootfs.$(1): $(ROOTFS_$(2)_DEPENDENCIES)
 	@$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	$(foreach hook,$(ROOTFS_$(2)_PRE_GEN_HOOKS),$(call $(hook))$(sep))
 	rm -f $(FAKEROOT_SCRIPT)
-	touch $(BUILD_DIR)/.fakeroot.00000
-	cat $(BUILD_DIR)/.fakeroot* > $(FAKEROOT_SCRIPT)
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 ifneq ($(ROOTFS_DEVICE_TABLES),)
 	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index afebafc..f51b6ee 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -25,8 +25,6 @@ $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-ext2 grub
 	cp $(BINARIES_DIR)/rootfs.ext2 $(ISO9660_TARGET_DIR)/initrd
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(FAKEROOT_SCRIPT)
-	touch $(BUILD_DIR)/.fakeroot.00000
-	cat $(BUILD_DIR)/.fakeroot* > $(FAKEROOT_SCRIPT)
 	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 	# Use fakeroot so mkisofs believes the previous fakery
 	echo "$(HOST_DIR)/usr/bin/genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot " \
-- 
1.7.4.1
