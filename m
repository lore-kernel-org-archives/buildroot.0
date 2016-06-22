From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jun 2016 21:07:45 +0200
Subject: [Buildroot] [PATCH 23/24 v2] system: make systemd work on a
	read-only rootfs
In-Reply-To: <cover.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <f70403a971adf75668e702cb93d242bc07ede270.1466622379.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the rootfs is readonly, systemd will expect /var to be writable.
Because we do not really have a R/W filesystem to mount on /var, we make
it a tmpfs, and use the systemd-tmpfiles feautre to populate it with
"factory" defaults.

We obtain those factory defaults by redirecting /var to that location at
build time, usign a symlink /var -> /usr/share/factory which is the
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

  - some packages may want to set ownership and/or acces rights on files
    or directoris in /var, and that only happens while assemblig the
    filesystem images; changing /var from a symlink to a (then empty)
    directory would break this;

  - /var would be a directory on sub-sequent builds (until the next
    "make clean").

Instead, we use the newly-introduce pre- and post-rootfs command hooks,
to turn /var into a directory before assembling the image, and back to a
symlink after assembling the image.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note: I haven't seen any symlinks installed in the factory so far, but I
haven't build a lot of packages yet... So, I'm not sure what to do with
the symlinks, especially when a package install relative symlinks...
---
 package/skeleton-systemd/skeleton-systemd.mk | 51 ++++++++++++++++++++++++++--
 system/Config.in                             |  1 -
 2 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/package/skeleton-systemd/skeleton-systemd.mk b/package/skeleton-systemd/skeleton-systemd.mk
index b45bbde..c7c2e26 100644
--- a/package/skeleton-systemd/skeleton-systemd.mk
+++ b/package/skeleton-systemd/skeleton-systemd.mk
@@ -36,12 +36,59 @@ ifeq ($(SKELETON_SYSTEM_LOCALTIME),)
 SKELETON_SYSTEM_LOCALTIME = Etc/UTC
 endif
 
+ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
+
+define SKELETON_SYSTEMD_ROOT_RW
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
+define SKELETON_SYSTEMD_ROOT_RO
+	mkdir -p $(TARGET_DIR)/etc/systemd/tmpfiles.d
+	mkdir -p $(TARGET_DIR)/usr/share/factory
+	ln -s usr/share/factory $(TARGET_DIR)/var
+	echo "/dev/root / auto ro 0 1" >$(TARGET_DIR)/etc/fstab
+	echo "tmpfs /var tmpfs mode=1777 0 0" >>$(TARGET_DIR)/etc/fstab
+endef
+
+define SKELETON_SYSTEMD_VAR_PRE_FS
+	rm -f $(TARGET_DIR)/var
+	mkdir $(TARGET_DIR)/var
+	for i in $(TARGET_DIR)/usr/share/factory/*; do \
+		j="$${i##*/}"; \
+		if [ -L "$${i}" ]; then \
+			printf "L+! /var/%s - - - - %s\n" \
+				"$${j}" "../usr/share/factory/$${j}" \
+			|| exit 1; \
+		else \
+			printf "C! /var/%s - - - -\n" "$${j}" \
+			|| exit 1; \
+		fi; \
+	done >$(TARGET_DIR)/etc/systemd/tmpfiles.d/var-factory.conf
+endef
+SKELETON_SYSTEMD_FS_PRE_CMD_HOOKS += SKELETON_SYSTEMD_VAR_PRE_FS
+
+define SKELETON_SYSTEMD_VAR_POST_FS
+	rm -rf $(TARGET_DIR)/var
+	ln -s usr/share/factory $(TARGET_DIR)/var
+endef
+SKELETON_SYSTEMD_FS_POST_CMD_HOOKS += SKELETON_SYSTEMD_VAR_POST_FS
+
+endif
+
 define SKELETON_SYSTEMD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/etc
 	mkdir -p $(TARGET_DIR)/home
 	mkdir -p $(TARGET_DIR)/srv
-	mkdir -p $(TARGET_DIR)/var
-	echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab
+	$(SKELETON_SYSTEMD_ROOT_RO)
+	$(SKELETON_SYSTEMD_ROOT_RW)
 	ln -sf ../usr/share/zoneinfo/$(SKELETON_SYSTEMD_LOCALTIME) \
 		$(TARGET_DIR)/etc/localtime
 	$(SKELETON_SYSTEMD_RSYNC_NETWORK)
diff --git a/system/Config.in b/system/Config.in
index 07af2e0..32d6542 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -129,7 +129,6 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
-	select BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 	select BR2_TARGET_TZ_INFO
 
 comment "systemd needs (e)glibc toolchain, headers >= 3.10"
-- 
2.7.4
