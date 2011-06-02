From: Cam Hutchison <cam@camh.ch>
Date: Thu, 02 Jun 2011 04:10:54 -0000
Subject: [Buildroot] [Bug 3811] New: Added auto-mount for USB and SD
	Card (mdev) (for 2011.05)
References: <bug-3811-163@https.bugs.busybox.net/>
Message-ID: <2b45.4de70d4e.b3842@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some comments on your automount.sh changes:

>+#! /bin/sh

No space after #!

>+mounted=`mount | grep $1 | wc -l`

mounted=$(grep -c "^/dev/$1 " /proc/mounts)

$() is clearer than ``.
Less processes is better than more.
Use a full pattern so you don't accidently match sda against /dev/sda1 or
other sub-matches (sda1 vs sda11).

>+# mounted, assume we umount
>+if [ $mounted -ge 1 ]; then
>+        if ! umount "/dev/$1"; then
>+                exit 1
>+        fi

If something is mounted more than once, you unmount it only once. So why
it it necessary to know how many times it is mounted?

if grep -qs "^/dev/$1 " /proc/mounts ; then

is simplier and more idiomatic. You can then get rid of mounted=...
above.

>+
>+        if ! rmdir "/media/$1"; then
>+                exit 1
>+        fi
>+# not mounted, lets mount under /media
>+else
>+        if ! mkdir -p "/media/$1"; then
>+                exit 1
>+        fi

Why remove the directory, only to re-create it again?

>+
>+        if ! mount -o sync "/dev/$1" "/media/$1"; then
>+                # failed to mount, clean up mountpoint
>+                if ! rmdir "/media/$1"; then
>+                        exit 1
>+                fi
>+                exit 1

Why test the result of rmdir if you are just going to exit 1 anyway?

rmdir "/media/$1"
exit 1

>+        fi
>+fi
>+
>+exit 0
>+
>diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
>index 711d11b..bbe5c39 100644
>--- a/package/busybox/busybox.mk
>+++ b/package/busybox/busybox.mk
>@@ -32,6 +32,8 @@ endif
> ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
> define BUSYBOX_INSTALL_MDEV_SCRIPT
>     install -m 0755 package/busybox/S10mdev $(TARGET_DIR)/etc/init.d
>+    install -m 0755 package/busybox/mdev.conf $(TARGET_DIR)/etc
>+    install -m 0755 package/busybox/automount.sh $(TARGET_DIR)/sbin

Since automount.sh is a helper program for mdev, not a general-purpose
program, it should probably live in /lib/mdev and not /sbin.

> endef
> define BUSYBOX_SET_MDEV
>     $(call KCONFIG_ENABLE_OPT,CONFIG_MDEV,$(BUSYBOX_BUILD_CONFIG))
>diff --git a/package/busybox/mdev.conf b/package/busybox/mdev.conf
>new file mode 100644
>index 0000000..08d915c
>--- /dev/null
>+++ b/package/busybox/mdev.conf
>@@ -0,0 +1,2 @@
>+sd[a-z][0-9]* 0:0 0660 *(/sbin/automount.sh $MDEV)
>+mmcblk[0-9]p[0-9] 0:0 0660 *(/sbin/automount.sh $MDEV)
