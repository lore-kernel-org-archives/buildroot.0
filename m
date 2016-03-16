From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 16 Mar 2016 20:23:01 +0000
Subject: [Buildroot] [Bug 8806] New: Buildroot 2016.2 for Raspberry Pi
 requires that ext4 rootfs is selected. Otherwise the error is reported
Message-ID: <bug-8806-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8806

            Bug ID: 8806
           Summary: Buildroot 2016.2 for Raspberry Pi requires that ext4
                    rootfs is selected. Otherwise the error is reported
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: wzab01 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I often use Raspberry Pi in a configuration, where only Initramfs is used.
It makes my system resistant to random power cuts.
Unfortunately with Buildroot 2016.2 if I do not create the Ext4 image the
board/raspberrypi/post-image.sh script crashes and generates an error.
Probably this error can be ignored, as the essential files in the output/images
are already created, but the compilation finished with ERROR doesn't look good.

Steps to duplicate the problem:
$ wget https://buildroot.org/downloads/buildroot-2016.02.tar.bz2
$ tar -xjf buildroot-2016.02.tar.bz2
$ cd buildroot-2016.02
$ make raspberrypi_defconfig
$ make menuconfig
In section "Filesystem images" deselect "ext2/3/4 root filesystem"
Select "initial RAM filesystem linked into linux kernel"
Select (optionally) Compression method (gzip)
Save configuration and exit
$make

After some time, you'll get:
>>>   Executing post-image script board/raspberrypi/post-image.sh
Version: Linux version 4.1.15 (wzab at wzab) (gcc version 4.9.3 (Buildroot
2016.02) ) #3 PREEMPT Wed Mar 16 20:43:58 CET 2016
DT: y
DDT: n
283x: n
file(rootfs.ext4): stat(/tmp/mmm/buildroot-2016.02/output/images/rootfs.ext4)
failed: No such file or directory
hdimage(sdcard.img): could not setup rootfs.ext4
Makefile:667: recipe for target 'target-post-image' failed
make: *** [target-post-image] Error 1

That problem affects also those, who want to create ext2 rootfs or ext3 rootfs:
Even if you select "[*] ext2/3/4 root filesystem", the error will  occur if you
select version ext2 or ext3.

Best regards,
Wojtek

-- 
You are receiving this mail because:
You are on the CC list for the bug.
