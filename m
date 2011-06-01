From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  1 Jun 2011 13:28:36 +0000 (UTC)
Subject: [Buildroot] [Bug 3811] New: Added auto-mount for USB and SD Card
 (mdev) (for 2011.05)
Message-ID: <bug-3811-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3811

           Summary: Added auto-mount for USB and SD Card (mdev) (for
                    2011.05)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: tkazmierczak at eurofunk.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Works great for me :)

diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
index d2643d0..47c46f5 100644
--- a/package/busybox/S10mdev
+++ b/package/busybox/S10mdev
@@ -6,6 +6,7 @@
 case "$1" in
   start)
     echo "Starting mdev..."
+    /bin/echo /sbin/mdev > /proc/sys/kernel/hotplug
     /sbin/mdev -s
     ;;
   stop)
diff --git a/package/busybox/automount.sh b/package/busybox/automount.sh
new file mode 100755
index 0000000..5ae2b97
--- /dev/null
+++ b/package/busybox/automount.sh
@@ -0,0 +1,34 @@
+#! /bin/sh
+
+if [ "$1" == "" ]; then
+        exit 1
+fi
+
+mounted=`mount | grep $1 | wc -l`
+
+# mounted, assume we umount
+if [ $mounted -ge 1 ]; then
+        if ! umount "/dev/$1"; then
+                exit 1
+        fi
+
+        if ! rmdir "/media/$1"; then
+                exit 1
+        fi
+# not mounted, lets mount under /media
+else
+        if ! mkdir -p "/media/$1"; then
+                exit 1
+        fi
+
+        if ! mount -o sync "/dev/$1" "/media/$1"; then
+                # failed to mount, clean up mountpoint
+                if ! rmdir "/media/$1"; then
+                        exit 1
+                fi
+                exit 1
+        fi
+fi
+
+exit 0
+
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 711d11b..bbe5c39 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -32,6 +32,8 @@ endif
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
 define BUSYBOX_INSTALL_MDEV_SCRIPT
     install -m 0755 package/busybox/S10mdev $(TARGET_DIR)/etc/init.d
+    install -m 0755 package/busybox/mdev.conf $(TARGET_DIR)/etc
+    install -m 0755 package/busybox/automount.sh $(TARGET_DIR)/sbin
 endef
 define BUSYBOX_SET_MDEV
     $(call KCONFIG_ENABLE_OPT,CONFIG_MDEV,$(BUSYBOX_BUILD_CONFIG))
diff --git a/package/busybox/mdev.conf b/package/busybox/mdev.conf
new file mode 100644
index 0000000..08d915c
--- /dev/null
+++ b/package/busybox/mdev.conf
@@ -0,0 +1,2 @@
+sd[a-z][0-9]* 0:0 0660 *(/sbin/automount.sh $MDEV)
+mmcblk[0-9]p[0-9] 0:0 0660 *(/sbin/automount.sh $MDEV)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
