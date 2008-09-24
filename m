From: Matt Wood <mattwood2000@gmx.net>
Date: Wed, 24 Sep 2008 16:05:33 +0200
Subject: [Buildroot] AT91SAM9263 JFFS2 problems
Message-ID: <20080924140533.7230@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, has anyone seen problems booting an AT91SAM9263-EK board with the JFFS2 filesystem created by buildroot?  I used to be able to boot no problem with an older version of buildroot, but not with the latest.  I'm getting the following kernel panic:

VFS: Mounted root (jffs2 filesystem).                                           
Freeing init memory: 136K                                                       
Warning: unable to open an initial console.                                     
Kernel panic - not syncing: No init found.  Try passing init= option to kernel.

I've loaded the NAND flash as follows:

0x00000000 - at91bootstrap
0x00020000 - u-boot
0x00200000 - kernel
0x00400000 - JFFS2

My bootargs are "mem=64M console=ttyS0,115200 root=/dev/mtdblock1 rw rootfstype=jffs2"

The strange thing is if I change the bootargs to root=/dev/mtdblock0, I get a ton of jffs2 oob and ecc errors, but after a while, it gives me the login prompt.

My JFFS2 memory type options are:
Page Size:  0x800
Erase Block Size:  0x20000
Not using clean marker.

These options never gave me a problem before.

The only other thing I can think of is a message I get after a build of buildroot about skipping dev, tmp, and etc while creating the RFS:

table='target/device/Atmel/root/device_table.txt'
mkfs.jffs2: skipping device_table entry '/dev': no parent directory!
mkfs.jffs2: skipping device_table entry '/tmp': no parent directory!
mkfs.jffs2: skipping device_table entry '/etc': no parent directory!
-rw-r--r-- 1 root root 7098064 Sep 23 09:47 /usr/arm/buildroot/binaries/at91sam9263ek/rootfs.arm-20080923.jffs2
rm -f /usr/arm/buildroot/project_build_arm/at91sam9263ek/.fakeroot*

Something very strange is going on.  Anyone else see this or have any suggestions?

Thanks, Matt.


-- 
Psssst! Schon vom neuen GMX MultiMessenger geh?rt? Der kann`s mit allen: http://www.gmx.net/de/go/multimessenger
