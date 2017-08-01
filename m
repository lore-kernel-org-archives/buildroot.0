From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 2 Aug 2017 00:52:23 +0200
Subject: [Buildroot] [PATCH v5 13/14] system: make systemd work on a
	read-only rootfs
In-Reply-To: <20170801225224.16899-1-arnout@mind.be>
References: <20170801225224.16899-1-arnout@mind.be>
Message-ID: <20170801225224.16899-14-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

When the rootfs is readonly, systemd will expect /var to be writable.
Because we do not really have a R/W filesystem to mount on /var, we make
it a tmpfs [*], and use the systemd-tmpfiles feature to populate it with
"factory" defaults.

We obtain those factory defaults by redirecting /var to that location at
build time, using a symlink /var -> /usr/share/factory which is the
location in which systemd-tmpfiles will look for when instructed to
"recursively copy" a directory.

With a line like:

    C /var/something - - - -

it will look for /usr/share/factory/something and copy it (recursively
if it is a directory) to /var/something, but only if it does not already
exist there.

We also mark this copy with the exclamation mark, as it is only safe to
copy on boot, not when changing targets.

To be noted: the real format for such lines are:

    C /var/something - - - - /from/where/to/copy/something

But if the source is not given, then it is implicitly taken from
/usr/share/factory (which in our case is as-good a location as whatever
else, so we use it, and thus we need not specify the source of the
copy).

Note that we treat symlinks a little bit specially, by creating symlinks
to the factory defaults rather than copying them.

Finally, /var at build time is a symlink, but at runtime, it must be a
directory (so we can mount the tmpfs over there). We can't change that
as a target-finalize hook, because:

  - some packages may want to set ownership and/or access rights on
    files or directories in /var, and that only happens while assembling
    the filesystem images; changing /var from a symlink to a (then
    empty) directory would break this;

  - /var would be a directory on sub-sequent builds (until the next
    "make clean").

Instead, we use the newly-introduce pre- and post-rootfs command hooks,
to turn /var into a directory before assembling the image, and back to a
symlink after assembling the image.

[*] People who want the factory-defaults only on first boot will have
    to tweak the fstab to mount something else than a tmpfs on /var.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v4 -> v5: (Arnout)
 - No changes

Changes v2 -> v3;
  - fix typoes in commit log  (Romain)
---
 package/skeleton-systemd/skeleton-systemd.mk | 50 ++++++++++++++++++++++++++--
 system/Config.in                             |  1 -
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/package/skeleton-systemd/skeleton-systemd.mk b/package/skeleton-systemd/skeleton-systemd.mk
index 384715e1c9..860ebea2cd 100644
--- a/package/skeleton-systemd/skeleton-systemd.mk
+++ b/package/skeleton-systemd/skeleton-systemd.mk
@@ -15,11 +15,57 @@ SKELETON_SYSTEMD_DEPENDENCIES = skeleton-common
 
 SKELETON_SYSTEMD_PROVIDES = skeleton
 
+ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
+
+define SKELETON_SYSTEMD_ROOT_RO_OR_RW
+	echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab
+	mkdir -p $(TARGET_DIR)/var
+endef
+
+else
+
+# On a R/O rootfs, /var is a tmpfs filesystem. So, at build time, we
+# redirect /var to the "factory settings" location. Just before the
+# filesystem gets created, the /var symlink will be replaced with
+# a real (but empty) directory, and the "factory files" will be copied
+# back there by the tmpfiles.d mechanism.
+define SKELETON_SYSTEMD_ROOT_RO_OR_RW
+	mkdir -p $(TARGET_DIR)/etc/systemd/tmpfiles.d
+	mkdir -p $(TARGET_DIR)/usr/share/factory/var
+	ln -s usr/share/factory/var $(TARGET_DIR)/var
+	echo "/dev/root / auto ro 0 1" >$(TARGET_DIR)/etc/fstab
+	echo "tmpfs /var tmpfs mode=1777 0 0" >>$(TARGET_DIR)/etc/fstab
+endef
+
+define SKELETON_SYSTEMD_PRE_ROOTFS_VAR
+	rm -f $(TARGET_DIR)/var
+	mkdir $(TARGET_DIR)/var
+	for i in $(TARGET_DIR)/usr/share/factory/var/*; do \
+		j="$${i#$(TARGET_DIR)/usr/share/factory}"; \
+		if [ -L "$${i}" ]; then \
+			printf "L+! %s - - - - %s\n" \
+				"$${j}" "../usr/share/factory/$${j}" \
+			|| exit 1; \
+		else \
+			printf "C! %s - - - -\n" "$${j}" \
+			|| exit 1; \
+		fi; \
+	done >$(TARGET_DIR)/etc/tmpfiles.d/var-factory.conf
+endef
+SKELETON_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_SYSTEMD_PRE_ROOTFS_VAR
+
+define SKELETON_SYSTEMD_POST_ROOTFS_VAR
+	rm -rf $(TARGET_DIR)/var
+	ln -s usr/share/factory/var $(TARGET_DIR)/var
+endef
+SKELETON_SYSTEMD_ROOTFS_POST_CMD_HOOKS += SKELETON_SYSTEMD_POST_ROOTFS_VAR
+
+endif
+
 define SKELETON_SYSTEMD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/home
 	mkdir -p $(TARGET_DIR)/srv
-	mkdir -p $(TARGET_DIR)/var
-	echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab
+	$(SKELETON_SYSTEMD_ROOT_RO_OR_RW)
 endef
 
 $(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 6d2d10269e..124d7f59d3 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -136,7 +136,6 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
-	select BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW if BR2_ROOTFS_SKELETON_DEFAULT
 
 comment "systemd needs a glibc toolchain, headers >= 3.10"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
-- 
2.13.3
