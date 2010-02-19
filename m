From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 19 Feb 2010 11:44:45 +0000 (UTC)
Subject: [Buildroot] [Bug 1141] New: BusyBox based initramfs generation
Message-ID: <bug-1141-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1141

           Summary: BusyBox based initramfs generation
           Product: buildroot
           Version: 2009.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: serj.kalichev at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1141)
 --> (https://bugs.busybox.net/attachment.cgi?id=1141)
BusyBox based initramfs generation patch

Sometimes it's necessary to generate not rootfs only but both real rootfs and
initramfs. Initramfs is more simpler and don't need many different packages but
only specially configured busybox and some additional scripts.

There is a makefile initramfs.mk in package/busybox dir for BusyBox based
initramfs generation. But it was unfinished and commented in Config.in. I could
not use it for real project so I try to patch BuildRoot to make it work.

Now BuildRoot can use target dir for generation initramfs. I change
target/initramfs/Config.in file to select the initramfs generation way. They
can choose "none", "initramfs from target dir" and "BusyBox based initramfs".
When you choose "initramfs from target dir" - it's a traditional way to
generate initramfs.

When the choice is "BusyBox based initramfs" BuildRoot can generate two images
- one for initramfs (put it into the bzImage) and the second for real rootfs.
The user can specify the BusyBox config file, the filesystem skeleton and a dir
with customization files for initramfs generation.

The attached patch consist of 
* target/initramfs/Config.in - to configure initramfs generation parameters
* package/busybox/initramfs.mk - to build specially configured BusyBox and
generate the initramfs image. It depends on files in the
package/busybox/initramfs_custom (by default) directory. So user can change
custom files and the initramfs will be rebuild.
* package/busybox/busybox-initramfs.config - it's only the example of
minimalist BusyBox configuration for the initramfs.
* package/busybox/initramfs_custom - it's only the example of simple init
script for the initramfs. It can mount rootfs by the UUID and LABEL.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
