From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Sep 2014 05:15:57 +0000 (UTC)
Subject: [Buildroot] [Bug 7442] New: rootfs remount does not work as
 expected with sysvinit
Message-ID: <bug-7442-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7442

           Summary: rootfs remount does not work as expected with sysvinit
           Product: buildroot
           Version: 2014.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: joymarquis at hotmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Problem
=======
The rootfs can not do remount correctly, with the default sysvinit string:
 * rwmo::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW


Possible root cause
===================
The rootfs can do remount as expected, by removing the comment string and
changing the string to:
 * rwmo::sysinit:/bin/mount -o remount,rw /


Program information
===================
FYI: The manual execution for commands below are working as expected:
 * /bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
 * /bin/mount -o remount,rw

mount version (mount -V):
 * mount from util-linux 2.24.2 (libmount 2.24.0: debug, assert)
init version (strings /sbin/init | tail):
 * @(#) init 2.88  26-Mar-2010  miquels at cistron.nl



Debug method
============
The problem is debugged and observed by adding follow lines into /etc/inittab
tst1::sysinit:/bin/mount > /dev/tst1
rwmo::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
tst2::sysinit:/bin/mount > /dev/tst2
rwmt::sysinit:/bin/mount -o remount,rw /
tst3::sysinit:/bin/mount > /dev/tst3


Debug log
=========
After login, the three files proved the problem:
==> /dev/tst1 <==
none on /dev type devtmpfs (rw,relatime,size=516720k,nr_inodes=23632,mode=755)
/dev/sda1 on / type ext3
(ro,relatime,errors=continue,user_xattr,barrier=0,data=ordered)
proc on /proc type proc (rw,relatime)

==> /dev/tst2 <==
none on /dev type devtmpfs (rw,relatime,size=516720k,nr_inodes=23632,mode=755)
/dev/sda1 on / type ext3
(ro,relatime,errors=continue,user_xattr,barrier=0,data=ordered)
proc on /proc type proc (rw,relatime)

==> /dev/tst3 <==
none on /dev type devtmpfs (rw,relatime,size=516720k,nr_inodes=23632,mode=755)
/dev/sda1 on / type ext3
(rw,relatime,errors=continue,user_xattr,barrier=0,data=ordered)
proc on /proc type proc (rw,relatime)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
