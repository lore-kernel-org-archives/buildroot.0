From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 11:28:57 +0200
Subject: [Buildroot] [git commit] filesystems: also chown symlinks
Message-ID: <20140609093214.8D6169CDF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3fbd9887b324f7b64a583243bf0a770527cb5f61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the symlinks in the generated filesystems will have the
UID of the user running the build, because 'chown' does not change
the ownership of symlinks, by default.

Although the implications are limited, some may not want that UID
to leak in the generated filesystems.

So, use 'chown -h' so even symlinks get properly chowned.

Reported-by: Angelo Dureghello <angelo@barix.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk            |    2 +-
 fs/iso9660/iso9660.mk   |    2 +-
 support/scripts/mkusers |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 2adaf8c..45f88b2 100644
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
 
