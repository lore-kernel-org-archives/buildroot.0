From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Oct 2017 16:17:08 +0000
Subject: [Buildroot] [Bug 10426] New: uboot-tools' fw_setenv does not update
 the redundant environment
Message-ID: <bug-10426-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10426

            Bug ID: 10426
           Summary: uboot-tools' fw_setenv does not update the redundant
                    environment
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jan.kundrat at cesnet.cz
                CC: buildroot at uclibc.org
  Target Milestone: ---

U-Boot supports two redundant copies of its environment as an optional feature.
This is typically configured in board-specific include/configs/foo-board-name.h
files. It seems that users are free to choose where to put these copies, and
there's no standard for this as far as I can tell.

Buildroot currently does not attempt to keep the real U-Boot's config and
uboot-tools' config in sync. In fact, there's no effort to keep their versions
synced, and probably for a good reason (one might not want to update the
bootloader, for example). Buildroot also attempts to patch out a dependency on
a "config.h" for uboot-tools
(package/uboot-tools/0001-drop-configh-from-tools.patch). Apparently, the idea
is to rely on a properly configured /etc/fw_env.config for env offsets, etc.

This is a problem because fw_putenv does not know that a redundant environment
is in use, and it only writes one copy. I checked with strace; fw_printenv
reads both copies, but then it only stores the primary one:

open("/etc/fw_env.config", O_RDONLY)    = 4
fstat64(4, {st_mode=S_IFREG|0644, st_size=70, ...}) = 0
read(4, "/dev/mmcblk0 0xf0000 0x10000 0x2"..., 4096) = 70
close(4)                                = 0
open("/dev/mmcblk0", O_RDONLY)          = 4
fstat64(4, {st_mode=S_IFBLK|0660, st_rdev=makedev(179, 0), ...}) = 0
close(4)                                = 0
open("/dev/mmcblk0", O_RDONLY)          = 4
fstat64(4, {st_mode=S_IFBLK|0660, st_rdev=makedev(179, 0), ...}) = 0
close(4)                                = 0
open("/dev/mmcblk0", O_RDONLY)          = 4
lseek(4, 983040, SEEK_SET)              = 983040
read(4, "\32\224!\324\"BOOT_A_LEFT=3\0BOOT_B_LEFT=2"..., 65536) = 65536     
<---- this is the primary copy
close(4)                                = 0
brk(0x69000)                            = 0x69000
open("/dev/mmcblk0", O_RDONLY)          = 4
lseek(4, 917504, SEEK_SET)              = 917504
read(4, "\226\37\326:#BOOT_A_LEFT=3\0BOOT_ORDER=B "..., 65536) = 65536      
<---- secondary environment
close(4)                                = 0
open("/dev/mmcblk0", O_RDWR)            = 4
open("/dev/mmcblk0", O_RDWR)            = 5
lseek(5, 983040, SEEK_SET)              = 983040
write(5, "Sgm[$BOOT_A_LEFT=3\0BOOT_ORDER=B "..., 65536) = 65536             
<---- this is the primary's address
close(5)                                = 0
close(4)                                = 0
brk(0x49000)                            = 0x49000
flock(3, LOCK_UN)                       = 0
close(3)                                = 0
exit_group(0)                           = ?
+++ exited with 0 +++

-- 
You are receiving this mail because:
You are on the CC list for the bug.
