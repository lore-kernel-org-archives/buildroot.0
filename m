From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  1 May 2014 22:53:53 +0200
Subject: [Buildroot] [PATCH] fs: also chown symlinks
Message-ID: <1398977633-5512-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

By default, chown does not change the ownership of symlinks.

In some cases, this can be seen by some as a leak from the building
environment into the generated filesystem (a small leak, but a leak
nonetheless.)

Change the way we call chown to tell it to not dereference symlinks.

[Thanks to Thomas for pointing out the -h option to chown.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Angelo Dureghello <angelo70@gmail.com>
---
 fs/common.mk            | 2 +-
 fs/iso9660/iso9660.mk   | 2 +-
 support/scripts/mkusers | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 831365e..479db94 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -70,7 +70,7 @@ $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
 	rm -f $$(FAKEROOT_SCRIPT)
 	rm -f $$(TARGET_DIR_WARNING_FILE)
 	rm -f $(USERS_TABLE)
-	echo "chown -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
+	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 ifneq ($$(ROOTFS_DEVICE_TABLES),)
 	cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
 ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 6c8ace0..b0e755d 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -29,7 +29,7 @@ else
 endif
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(FAKEROOT_SCRIPT)
-	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+	echo "chown -h -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 	# Use fakeroot so mkisofs believes the previous fakery
 	echo "$(HOST_DIR)/usr/bin/genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot " \
 		"-boot-load-size 4 -boot-info-table -o $@ $(ISO9660_TARGET_DIR)" \
diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index 3fa0fa8..ffd192d 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -342,7 +342,7 @@ add_one_user() {
     # (Note: stdout goes to the fakeroot-script)
     if [ "${home}" != "-" ]; then
         mkdir -p "${TARGET_DIR}/${home}"
-        printf "chown -R %d:%d '%s'\n" "${uid}" "${_gid}" "${TARGET_DIR}/${home}"
+        printf "chown -h -R %d:%d '%s'\n" "${uid}" "${_gid}" "${TARGET_DIR}/${home}"
     fi
 }
 
-- 
1.8.3.2
