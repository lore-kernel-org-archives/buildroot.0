From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:03:37 +0200
Subject: [Buildroot] About i386 Architecture and Grub2
In-Reply-To: <1408588309.32587.YahooMailNeo@web141705.mail.bf1.yahoo.com>
References: <1408534632.82498.YahooMailNeo@web141703.mail.bf1.yahoo.com>
 <20140820141013.24de59df@free-electrons.com>
 <1408588309.32587.YahooMailNeo@web141705.mail.bf1.yahoo.com>
Message-ID: <20140821150337.3bc770ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear lee choon gay,

On Wed, 20 Aug 2014 19:31:49 -0700, lee choon gay wrote:

> I build the code with settings below.
> menuconfig -> Filesystem images -> ext4.
> menuconfig -> Filesystem images -> tar the root filesystem.
> menuconfig -> System configuration -> Init system with Busybox (default).
> menuconfig -> Toolchain -> Buildroot toolchain (default).
> menuconfig -> Toolchain -> C library uClibc (default).
> 
> Steps to build the partitions.
> 1) I use sudo dd if=/dev/zero bs=1M count=1 of=/dev/sdb to wipe out the original partition in my pendrive.
> 2) sudo fdisk -l will shows /dev/sdb doesn't contain
>  a valid partition table.
> 3) To recreate the partition, I use sudo fdisk /dev/sdb.
> 4) I enter n for new partition, p for primary, label partition as 1, default minimum for first sector, 5000000 for last sector.
> 5) Then enter n again to create second partition, p for primary, label partition as 2, 5000001 for first sector, default maximum for last sector.
> 6) Then enter w to write the partition table.
> 7) Power cycle the pendrive.
> 8) I format the partitions using sudo mkfs.ext4 /dev/sdb1 and sudo mkfs.ext4 /dev/sdb2.
> 9) I sudo mount /dev/sdb1 /home/leecgy/temp1 and sudo chmod a+rw /home/leecgy/temp1 to enable writing to partition 1.
> 10) Then sudo mount /dev/sdb2 /home/leecgy/temp2 and sudo chmod a+rw /home/leecgy/temp2 to enable writing to partition 2.
> 11) I right click and create new folder called boot in partition 1, then right click and copy paste the bzImage into boot folder.
> 12) Then right click and create new folder
>  called grub in boot folder, then right click and copy paste the grub.cfg into grub folder.
> 13) I sudo grub-install --boot-directory=/home/leecgy/temp1/boot /dev/sdb to install grub.

You may want to follow the instructions available in the help text of
the Grub 2 option, which have been tested.

> 14) I right click and extract the rootfs.tar, then right click and copy paste the contents inside rootfs into partition 2.

Make sure you extract things as root:

	sudo tar -C /home/leecgy/temp2 -xf output/images/rootfs.tar

> When trying to boot up, the code dump a lot of?error and stuck. I cannot shift+page up to see the top of the error.

Please give the errors that you see. For now, we still have no idea
whether it's a bootloader problem, a kernel problem, or a root
filesystem problem. Without the boot log, there's not much we can do.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
