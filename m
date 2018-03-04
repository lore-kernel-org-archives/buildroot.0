From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Mar 2018 20:35:30 +0100
Subject: [Buildroot] [git commit] package/skeleton-systemd: invert factory
 logic
Message-ID: <20180304202312.9539280DE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e5df928539efd424a381f3434fe5b9da1f2dffa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we handle the factory by redirectoring /var with a symlink at
build time, and with some trickery during the filesystem generation,
depending on whether we need to remount the filesystem read-write or
not.

However, this is causing quite some pain with the latest systemd, now that
they have moved their dbus socket to /run instead of /var/run.

As such, trying to play tricks with /var/run as a symlink is difficult,
because at times it is in .usr/share/factory/var/run (during build) and
then it is in /var/run (at runtime). So a relative symlink is not
possible. But an absolute symlink is not possible either, because we are
installing out-of-tree.

Oh the joys of cross-compilation... :-)

We fix all this mess by making /var a real directory from the onset, so
that we can use the runtime-expected layout even during the build.

Then, during filesystem generation, we move /var away to the factory,
and populate it as we used to do. This still requires a post-fs hook to
restore /var after the filesystem generation.

This leaves a situation that, should the filesystem generation fails,
/var will be left in an inconsistent state. But that is not worse than
what we already had anyway.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Trent Piepho <tpiepho@impinj.com>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/skeleton-init-systemd/skeleton-init-systemd.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index 6a0527fde2..ff64205cbe 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -19,7 +19,6 @@ ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 
 define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
 	echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab
-	mkdir -p $(TARGET_DIR)/var
 endef
 
 else
@@ -31,15 +30,14 @@ else
 # back there by the tmpfiles.d mechanism.
 define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
 	mkdir -p $(TARGET_DIR)/etc/systemd/tmpfiles.d
-	mkdir -p $(TARGET_DIR)/usr/share/factory/var
-	ln -s usr/share/factory/var $(TARGET_DIR)/var
 	echo "/dev/root / auto ro 0 1" >$(TARGET_DIR)/etc/fstab
 	echo "tmpfs /var tmpfs mode=1777 0 0" >>$(TARGET_DIR)/etc/fstab
 endef
 
 define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
-	rm -f $(TARGET_DIR)/var
-	mkdir $(TARGET_DIR)/var
+	rm -rf $(TARGET_DIR)/usr/share/factory/var
+	mv $(TARGET_DIR)/var $(TARGET_DIR)/usr/share/factory/var
+	mkdir -p $(TARGET_DIR)/var
 	for i in $(TARGET_DIR)/usr/share/factory/var/* \
 		 $(TARGET_DIR)/usr/share/factory/var/lib/* \
 		 $(TARGET_DIR)/usr/share/factory/var/lib/systemd/*; do \
@@ -59,7 +57,7 @@ SKELETON_INIT_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_INIT_SYSTEMD_PRE_ROOTFS_V
 
 define SKELETON_INIT_SYSTEMD_POST_ROOTFS_VAR
 	rm -rf $(TARGET_DIR)/var
-	ln -s usr/share/factory/var $(TARGET_DIR)/var
+	mv $(TARGET_DIR)/usr/share/factory/var $(TARGET_DIR)/var
 endef
 SKELETON_INIT_SYSTEMD_ROOTFS_POST_CMD_HOOKS += SKELETON_INIT_SYSTEMD_POST_ROOTFS_VAR
 
@@ -68,6 +66,8 @@ endif
 define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/home
 	mkdir -p $(TARGET_DIR)/srv
+	mkdir -p $(TARGET_DIR)/var
+	ln -s ../run $(TARGET_DIR)/var/run
 	$(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
 endef
 
