From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 May 2019 18:51:59 +0000
Subject: [Buildroot] [Bug 11876] New: automount using host mount/umount
Message-ID: <bug-11876-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11876

            Bug ID: 11876
           Summary: automount using host mount/umount
           Product: buildroot
           Version: 2019.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: todd.valentic at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

In buildroot, the autofs package is finding the path to the host
mount/umount/fsck programs instead of the locations on the target in the
autoconf stage. These paths are used by automount and therefore fail to mount
when running on the target. You can see the this by looking at the autoconf
output puts in config.log or include/config.h for the values of the PATH_MOUNT
variables.

The autofs.mk file mentions this problem with modprobe but doesn't set the path
for the other programs. The solution is to add the target paths to
AUTOFS_CONF_ENV in autofs.mk:

# autofs looks on the build machine for the path of modprobe, so tell
# it explicitly where it will be located on the target.
AUTOFS_CONF_ENV = \
        ac_cv_path_KRB5_CONFIG=no \
        ac_cv_path_MODPROBE=/sbin/modprobe \
+       ac_cv_path_E2FSCK=/usr/sbin/fsck.ext2 \
+       ac_cv_path_E3FSCK=/usr/sbin/fsck.ext3 \
+       ac_cv_path_E4FSCK=/usr/sbin/fsck.ext4 \
+       ac_cv_path_MOUNT_NFS=/usr/sbin/mount.nfs \
+       ac_cv_path_MOUNT=/bin/mount \
+       ac_cv_path_UMOUNT=/bin/umount \
        ac_cv_linux_procfs=yes

-- 
You are receiving this mail because:
You are on the CC list for the bug.
