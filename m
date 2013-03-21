From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Mar 2013 18:25:54 +0100
Subject: [Buildroot] Creating JFFS2 rootfs to SPI flash,
 and mounting it from kernel
In-Reply-To: <CAF-Ht3xbVBXzdjL5Jc9eC6XrswaA8MjQ2Jy9apFG29tMJNEs_w@mail.gmail.com>
References: <CAF-Ht3xbVBXzdjL5Jc9eC6XrswaA8MjQ2Jy9apFG29tMJNEs_w@mail.gmail.com>
Message-ID: <514B42A2.6090808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/03/13 07:45, Juha Lumme wrote:
> 1) My board is described in dtb file, so is it correct to assume that I
> should also describe my flash layout there under the SPI section for the
> flash ?

  It's either in the DTB or you can pass it along as boot arguments, 
something like:
mtdparts=dataflash0:128k(u-boot),4m(kernel),12m(rootfs),-(home)

> My planned layout is something like this (please ignore the addresses
> themselves):
> 0x0 - 0x9 u-boot
> 0x10 - 0x19 kernel
> 0x20 - 0x29 root fs
> 0x30 - 0x39 /home
>
> 2) Currently I am passing the partition info on the memory card to the
> kernel from u-boot (noinitrd console=ttyAMA0,115200 root=/dev/mmcblk0p2
> rw rootwait).
> Can I now change this to: "noinitrd console=ttyAMA0,115200
> root=/dev/mtdblock2 rootfstype=jffs2 ro rootwait" ?
> I'm thinking the block2 is since block 0 is u-boot and 1 would be kernel
> ? ro instead of rw since I don't want to write to root fs.
> Or does that make any sense ? What would you recommend me to do ? Is
> JFFS2 a good idea ? Should I consider RAMFS for root file system ?

  JFFS2 as a read-only rootfs works perfectly. If you want to explore 
alternatives, consider UBI/UBIFS, but that's a bit more complex to set up.


> 3) Where can I tell my kernel to mount /home as a separate file system ?
> I would like that one to be read write, but I only rarely need to save
> configuration files there... What would be a good idea with this ?

  In /etc/fstab. Create a target rootfs overlay with a custom fstab that 
specifies to mount /dev/mtdblok3 on /home.

  Note that you'll have to manually create a (supposedly empty) jffs2 
filesystem on /dev/mtdblock3.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
