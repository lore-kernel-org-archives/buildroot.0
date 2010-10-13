From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 13 Oct 2010 14:07:15 -0500
Subject: [Buildroot] mkfs.jffs2 image is not usable
In-Reply-To: <4CB5A0BB.2040106@zacarias.com.ar>
References: <0D753D10438DA54287A00B02708426976450A64C87@AUSP01VMBX24.collaborationhost.net>
	<4CB5A0BB.2040106@zacarias.com.ar>
Message-ID: <0D753D10438DA54287A00B02708426976450B0AF44@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, October 13, 2010 5:06 AM, Gustavo Zacarias wrote:
> On 10/13/10 01:53, H Hartley Sweeten wrote:
>> I also tried installing the mtd utils locally on my Debian system and then
>> created the jffs2 image using /usr/sbin/mkfs.jffs2.  This image is the
>> same size as the one manually created using the $(HOST_DIR) one, but the
>> files are very different.  When I boot with that image I don't get any
>> error messages by the kernel boot hangs after:
>> 
>> Freeing init memory: 208K
>> 
>> Can anyone offer some ideas of suggestions?
>
> Did you check that the flash geometry (page size / erase size) match the
> flash device on your board? That would make the jffs2 image different in
> content but not much in size as you see.
> It's the "flash type" option in buildroot.
> Parallel flash = NOR.
> AT45 = SPI DataFlash from Atmel.
> NAND flash = the usual these days.
> Or you can go the custom way if one of the predetermined values doesn't
> match your flash device.

The flash geometry settings should be the same as when I made the jffs2 image
that does work.  But, for the record, the flash is a parallel 4kB pagesize
and 128 kB erase size.

Buildroot makes my jffs2 image with the basically the following command
passed top fakeroot:

$(HOST_DIR)/usr/sbin/mkfs.jffs2 -e 0x20000 -l -s 0x1000 -d $(TARGET_DIR) -o $(BINARIES_DIR)/rootfs.jffs2

I manually used the same commands with both the mkfs.jffs2 in the $(HOST_DIR)
and the one installed locally in my /usr/sbin/.  All three make repeatable
images, but all three are different sizes.  The two created with the
$(HOST_DIR) mkfs.jffs2 hang the boot with the error messages then a Kernel
canic and the one created from mu local mkfs.jffs2 hangs the kernel after
Freeing init memory.

I re-pulled the latest buildroot this morning and tried building everything
from scratch with the same results.

One other item, I can manually mount the rootfs.jffs2 created by my local
mkfs.jffs2 on my host machine but the other two give me the error messages.

I mounted the images with the following:

sudo modprobe mtd
sudo modprobe jffs2
sudo modprobe mtdram totalsize=32768 erase_size=256
sudo modprobe mtdchar
sudo modprobe mtdblock
sudo dd if=rootfs.jffs2 of=/dev/mtd0
mkdir temp
sudo mount -t jffs2 /dev/mtdblock0 temp

Suggestions?

Regards,
Hartley
