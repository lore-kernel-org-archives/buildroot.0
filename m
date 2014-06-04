From: psnsilva <psnsilva.stuff+nabble@gmail.com>
Date: Wed, 4 Jun 2014 09:02:36 -0700 (PDT)
Subject: [Buildroot] Check root file system at boot time
Message-ID: <1401897756168-71600.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all.
I am facing a problem with checking my root file system at boot time and I
don't know what I am missing here.
The target device is a Raspberry Pi and my intention is to check the SD card
at boot time.

I have the following configuration to e2fsck:
# cat /etc/e2fsck.conf
[options]
        log_dir = /var/log/e2fsck
        log_filename = %D%T-e2fsck-%N.%h.log
        log_dir_wait = true
        accept_time_fudge = true
        *broken_system_clock = true*     (as the rPi has no RTC)

And I defined the verification to occur on each boot (at this development
phase): *tune2fs -C 2 -c 1 /dev/mmcblk0p2*

However, in every boot I get the message:
[    2.431923] EXT4-fs (mmcblk0p2): *warning: maximal mount count reached,
running e2fsck is recommended*
[    2.467516] EXT4-fs (mmcblk0p2): recovery complete
[    2.477056] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data
mode. Opts: (null)

and running "*e2fsck -n /dev/mmcblk0p2*" I get:
e2fsck -n /dev/mmcblk0p2
e2fsck 1.42.9 (28-Dec-2013)
Warning!  /dev/mmcblk0p2 is mounted.
Warning: skipping journal recovery because doing a read-only filesystem
check.
*/dev/mmcblk0p2 has been mounted 4 times without being checked, check
forced.*
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
Free blocks count wrong (1791665, counted=1791658).
Fix? no

/dev/mmcblk0p2: 3451/467712 files (0.2% non-contiguous), 79183/1870848
blocks

My /etc/fstab as the following entries (among others):
/dev/mmcblk0p1          /boot                        vfat      noatime                   
0       2
/dev/mmcblk0p2         /                               ext4     
defaults,noatime       0       1

In addition, running e2fsck to the SD card, but using my Linux PC is
working. At the next rPi boot the messages does not appear. Reappearing
again on the the second and following boots.

Am I missing some needed scripts at /etc/init.d/ (e.g., SXXcheckroot)?

Thank you in advance by your time.
Kind regards,
Pedro Silva



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Check-root-file-system-at-boot-time-tp71600.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
