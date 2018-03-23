From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 23 Mar 2018 13:39:57 +0300
Subject: [Buildroot] "BR2_TARGET_ROOTFS_INITRAMFS" with U-Boot?
In-Reply-To: <11934B5C-E5F2-4D66-B522-DC095DFFCA26@jens-maus.de>
References: <11934B5C-E5F2-4D66-B522-DC095DFFCA26@jens-maus.de>
Message-ID: <20180323103957.xbnkj6lwwwls7kob@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jens,

On Fri, Mar 23, 2018 at 11:05:24AM +0100, Jens Maus wrote:
> I am currently developing a buildroot-driven system (for RaspberryPi HW) 
> which uses U-Boot together with BR2_TARGET_ROOTFS_CPIO and 
> BR2_TARGET_ROOTFS_CPIO_UIMAGE in buildroot to generate a zImage and initrd 
> file which I can then boot via
> 
> load mmc 0:1 ${kernel_addr_r} /zImage
> load mmc 0:1 ${ramdisk_addr_r} /initrd
> setenv bootargs ?root=/dev/ram0?
> bootz ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr}
> 
> in U-Boot. This works perfectly fine.
> 
> However, I am currently evaluating the possibilities to directly embed the 
> initramfs into the kernel by switching to BR2_TARGET_ROOTFS_INITRAMFS. But I 
> am not able to boot the generated zImage via
> 
> load mmc 0:1 ${kernel_addr_r} /zImage
> setenv bootargs ??
> bootz ${kernel_addr_r} - ${fdt_addr}
> 
> It simply hangs at ?Starting kernel?? 
> 
> Unfortunately I don?t have any idea why this kernel with the embedded 
> initramfs doesn?t boot at all? It doesn?t even output any kernel 
> information/debug on the console.
> 
> Any idea what might be wrong here or how I could debug the situation to get 
> that zImage booted?

Your bigger kernel image, or its boot-time decompressed image, might be 
overwriting the DT. See section 4b in Documentation/arm/Booting of the kernel 
source.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
