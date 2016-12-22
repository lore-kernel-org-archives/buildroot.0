From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 22 Dec 2016 21:32:03 +0000
Subject: [Buildroot] [Bug 9496] New: mke2img fails during build on ntfs-3g
	host partition
Message-ID: <bug-9496-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9496

            Bug ID: 9496
           Summary: mke2img fails during build on ntfs-3g host partition
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: dcmay at copper.net
                CC: buildroot at uclibc.org
  Target Milestone: ---

mke2img is not able to complete successfully when the output image file is
located on an ntfs-3g partition.

The "Generating root filesystem image" step fails with fsck errors in the
generated image if the buildroot directory is on an ntfs-3g drive.

.../fakeroot -- /ntfs-3g-partition/buildroot/output/build/_fakeroot.fs
rootdir=/ntfs-3g-partition/buildroot/output/target
table='/ntfs-3g-partition/buildroot/output/build/_device_table.txt'
tune2fs 1.43.3 (04-Sep-2016)
tune2fs 1.43.3 (04-Sep-2016)

Please run e2fsck -f on the filesystem.

Creating journal inode: done
This filesystem will be automatically checked every 20 mounts or
0 days, whichever comes first.  Use tune2fs -c or -i to override.


/ntfs-3g-partition/buildroot/output/images/rootfs.ext2: UNEXPECTED
INCONSISTENCY; RUN fsck MANUALLY.
        (i.e., without -a or -p options)
mke2img: failed to run e2fsck on
'/ntfs-3g-partition/buildroot/output/images/rootfs.ext2' (ext4)
make[1]: *** [/ntfs-3g-partition/buildroot/output/images/rootfs.ext2] Error 4
make: *** [_all] Error 2

Running e2fsck manually yields hundreds of errors flagged as inode problems.

If the corrupted rootfs.ext2 file is deleted, and the buildroot directory tree
copied to an ext4 partition, 'make' runs this step again, and it completes
successfully.

Workaround - only build on an ext2/3/4 host filesystem.

All previous steps complete without errors when built on an ntfs-3g partition.

The ntfs-3g drive has a .NTFS-3G/UserMapping containing a map to Windows SIDs
in a dual boot environment. This problem is not due to issues with permissions.

Basic configuration - make beaglebone_defconfig
Host system - ubuntu trusty 14.04.5

-- 
You are receiving this mail because:
You are on the CC list for the bug.
