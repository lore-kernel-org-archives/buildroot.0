From: Will Newton <will.newton@gmail.com>
Date: Thu, 19 Aug 2010 18:58:14 +0100
Subject: [Buildroot] package/hotplug
In-Reply-To: <0D753D10438DA54287A00B0270842697643E630222@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B0270842697643E62F9E6@AUSP01VMBX24.collaborationhost.net>
	<AANLkTimjH2b85z1bjeC+naxRFiMO4+puoLRKJ7B5TZb-@mail.gmail.com>
	<0D753D10438DA54287A00B0270842697643E630222@AUSP01VMBX24.collaborationhost.net>
Message-ID: <AANLkTikvuz8Fc5kiwEXdQ8WFSAnD87egOWpvtyLx=yLm@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 19, 2010 at 6:10 PM, H Hartley Sweeten
<hartleys@visionengravers.com> wrote:

> I have already tried 'echo /sbin/mdev > /proc/sys/kernel/hotplug' from
> a command line. ?When I insert the USB memory stick it is detected but
> not mounted (same result without the command above).
>
> I just tried adding the line above to my inittab and I get the same
> result.
>
> usb 2-1.4: new high speed USB device using fsl-ehci and address 4
> usb 2-1.4: configuration #1 chosen from 1 choice
> scsi0 : SCSI emulation for USB Mass Storage devices
> scsi 0:0:0:0: Direct-Access ? ? USB ? ? ?Flash Disk ? ? ? 4.00 PQ: 0 ANSI: 2
> sd 0:0:0:0: [sda] 499071 2048-byte logical blocks: (1.02 GB/974 MiB)
> sd 0:0:0:0: [sda] Write Protect is off
> sd 0:0:0:0: [sda] Assuming drive cache: write through
> sd 0:0:0:0: [sda] 499071 2048-byte logical blocks: (1.02 GB/974 MiB)
> sd 0:0:0:0: [sda] Assuming drive cache: write through
> ?sda:
> sd 0:0:0:0: [sda] 499071 2048-byte logical blocks: (1.02 GB/974 MiB)
> sd 0:0:0:0: [sda] Assuming drive cache: write through
> sd 0:0:0:0: [sda] Attached SCSI removable disk
>
> My buildroot setup is pretty much a generic arm config. ?This config
> uses the device table from target/generic/device_table.txt so the
> /dev/sda nodes actually exist even before the USB memory stick is
> connected. ?I assume mdev would create them if then were not there.
>
> I can mount the drive manually:
>
> # cat /proc/partitions ?| grep sda
> ? 8 ? ? ? ?0 ? ? 998142 sda
> # ls /mnt
> # mount -t vfat /dev/sda /mnt
> # ls /mnt
> test_file.txt
> # mount | grep sda
> /dev/sda on /mnt type vfat (rw,relatime,fmask=0022,dmask=0022,codepage=cp437,iocharset=iso8859-1,errors=remount-ro)
>
> But, how to I get mdev to mount the drive after it's detected?

it may be possible with the mdev config file. It seems to only be
documented in the source:

http://git.busybox.net/busybox/tree/util-linux/mdev.c

See the section that mentions executing a command.
