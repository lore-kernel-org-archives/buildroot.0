From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  2 Mar 2013 09:32:20 +0000 (UTC)
Subject: [Buildroot] [Bug 6014] New: Building rootfs stops at copying device
 table when not using static tables
Message-ID: <bug-6014-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6014

           Summary: Building rootfs stops at copying device table when not
                    using static tables
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: broot at monkster.hopto.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


2013.02 (works OK in 2012.11)

Using dynamic dev management (e.g. BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV) 
stops rootfs building waiting for keyboard:

cat   > /home/user/panda/buildroot-2013.02/output/build/_device_table.txt

Notice extra space following cat.

Following fixes issue (but probabably not solution, I don't know what is the
purpose of those double $ that appeared in 2013.02)

diff --git a/fs/common.mk b/fs/common.mk
index 8b5b2f2..eb8a648 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -47,7 +47,7 @@ $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
        rm -f $$(FAKEROOT_SCRIPT)
        rm -f $$(TARGET_DIR_WARNING_FILE)
        echo "chown -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
-ifneq ($$(ROOTFS_DEVICE_TABLES),)
+ifneq ($(ROOTFS_DEVICE_TABLES),)
        cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
 ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
        printf '$$(subst $$(sep),\n,$$(PACKAGES_DEVICES_TABLE))' >>
$$(FULL_DEVICE_TABLE)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
