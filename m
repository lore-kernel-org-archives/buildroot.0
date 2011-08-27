From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Sat, 27 Aug 2011 06:26:22 +0200
Subject: [Buildroot] [PATCH] mdev: Add auto-mounting support for USB and SD
	card
Message-ID: <1314419182-21753-1-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this will mount the device in /media as
/media/${MDEV}

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 fs/skeleton/etc/fstab        |    1 +
 package/busybox/automount.sh |   33 +++++++++++++++++++++++++++++++++
 package/busybox/busybox.mk   |    3 +++
 package/busybox/mdev.conf    |    4 ++++
 4 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 fs/skeleton/media/.empty
 create mode 100644 package/busybox/automount.sh

diff --git a/fs/skeleton/etc/fstab b/fs/skeleton/etc/fstab
index a2f56ff..821287a 100644
--- a/fs/skeleton/etc/fstab
+++ b/fs/skeleton/etc/fstab
@@ -6,4 +6,5 @@ proc		/proc	       proc     defaults	  0	 0
 devpts		/dev/pts       devpts   defaults,gid=5,mode=620	  0	 0
 tmpfs           /dev/shm       tmpfs    mode=0777         0      0
 tmpfs           /tmp           tmpfs    defaults          0      0
+tmpfs           /media         tmpfs    defaults          0      0
 sysfs		/sys	       sysfs    defaults	  0	 0
diff --git a/fs/skeleton/media/.empty b/fs/skeleton/media/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/package/busybox/automount.sh b/package/busybox/automount.sh
new file mode 100644
index 0000000..adaa37c
--- /dev/null
+++ b/package/busybox/automount.sh
@@ -0,0 +1,33 @@
+#!/bin/sh
+
+destdir=/media
+
+eumount()
+{
+	if grep -qs "^/dev/$1 " /proc/mounts ; then
+		umount "${destdir}/$1";
+	fi
+
+	[ -d "${destdir}/$1" ] && rmdir "${destdir}/$1"
+}
+
+emount()
+{
+	mkdir -p "${destdir}/$1" || exit 1
+
+	if ! mount -t auto -o sync "/dev/$1" "${destdir}/$1"; then
+		# failed to mount, clean up mountpoint
+		rmdir "${destdir}/$1"
+		exit 1
+	fi
+}
+
+case "${ACTION}" in
+add|"")
+	eumount ${MDEV}
+	emount ${MDEV}
+	;;
+remove)
+	eumount ${MDEV}
+	;;
+esac
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1782a73..f0d61f3 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -37,6 +37,9 @@ define BUSYBOX_INSTALL_MDEV_CONF
 	[ -f $(TARGET_DIR)/etc/mdev.conf ] || \
 		install -D -m 0644 package/busybox/mdev.conf \
 			$(TARGET_DIR)/etc/mdev.conf
+	[ -f $(TARGET_DIR)/etc/automount.sh ] || \
+		install -D -m 0644 package/busybox/automount.sh \
+			$(TARGET_DIR)/lib/mdev/automount.sh
 endef
 define BUSYBOX_SET_MDEV
 	$(call KCONFIG_ENABLE_OPT,CONFIG_MDEV,$(BUSYBOX_BUILD_CONFIG))
diff --git a/package/busybox/mdev.conf b/package/busybox/mdev.conf
index 247c0ed..298249c 100644
--- a/package/busybox/mdev.conf
+++ b/package/busybox/mdev.conf
@@ -33,3 +33,7 @@ event[0-9]+	root:root 640 =input/
 mice		root:root 640 =input/
 mouse[0-9]	root:root 640 =input/
 ts[0-9]		root:root 600 =input/
+
+# block devices
+sd[a-z][0-9]*		root:root 0660 */lib/mdev/automount.sh
+mmcblk[0-9]p[0-9]	root:root 0660 */lib/mdev/automount.sh
-- 
1.7.5.4
