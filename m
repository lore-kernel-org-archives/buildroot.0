From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 May 2015 06:24:50 +0000 (UTC)
Subject: [Buildroot] [Bug 8106] New: mkfs.jffs2 uses the --pagesize
	parameter incorrectly
Message-ID: <bug-8106-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8106

           Summary: mkfs.jffs2 uses the --pagesize parameter incorrectly
           Product: buildroot
           Version: 2015.02
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mlesniew at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Buildbot is able to generate the output image in different formats, one of them
is JFFS2.  The image is created as usual using the mkfs.jffs2 tool.  As the
JFFS2 system is intended for use with mtd devices, the tool allows specifying
the parameters of the flash memory, to which the image will be written.

Now in buildroot's config one can choose the type of flash, for which the JFFS2
image will be generated.  This are the BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_*
configuration variables.  Selecting one of them sets
BR2_TARGET_ROOTFS_JFFS2_EBSIZE and BR2_TARGET_ROOTFS_JFFS2_PAGESIZE values.

BR2_TARGET_ROOTFS_JFFS2_EBSIZE is the erase block size.  It should match the
erase block size of the flash memory that will store the image.  This value is
later used as a parameter to mkfs.jffs2 (the --eraseblock option).  This one is
used correctly. 

The BR2_TARGET_ROOTFS_JFFS2_PAGESIZE variable is set to the flash memory page
size.  During the build it is used as the value of the --pagesize parameter for
mkfs.jffs2.

It turns out, that the --pagesize parameter of mkfs.jffs2 has nothing to do
with the NAND page size.  It should be set to the virtual memory management
page size of the target system.  In most cases this should be set to 4K, which
is the default value used if --pagesize is not supplied. 

Please consult the mkfs.jffs2 manual page (and the --help output) for details.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
