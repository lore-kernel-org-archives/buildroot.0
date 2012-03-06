From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 6 Mar 2012 10:48:10 -0600
Subject: [Buildroot] u-boot .img rootfs
In-Reply-To: <20120306114825.353855b8@skate>
References: <ADE657CA350FB648AAC2C43247A983F001F41FF555E5@AUSP01VMBX24.collaborationhost.net>
 <20120306114825.353855b8@skate>
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F41FF55761@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, March 06, 2012 3:48 AM, Thomas Petazzoni wrote:
> Le Mon, 5 Mar 2012 20:00:57 -0600, H Hartley Sweeten <hartleys@visionengravers.com> a ?crit :
>
>> I have been using Buildroot to create a rootfs.ext2.gz that works
>> great with RedBoot.
>> 
>> I have a new board that uses U-Boot as the bootloader and it wants
>> some kind of .img file for the rootfs.  Can this be created using
>> Buildroot? Do I need to do something after the rootfs.ext2.gz is
>> created to make the .img file?
>
> Do you have more details, because .img is very generic. Do you have a
> pointer to your specific U-Boot configuration? Can you just show why
> you think U-Boot needs such as file?

This is the first U-Boot system I have worked with so I don't have a lot
of details.

I know that that this works:

SIM.ONE> tftp c0200000 uImage
TFTP from server 192.168.0.84; our IP address is 192.168.0.79
Filename 'uImage'.
Load address: 0xc0200000
Loading: #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         ###################################################
done
Bytes transferred = 1923792 (1d5ad0 hex)
SIM.ONE> iminfo

## Checking Image at c0200000 ...
   Image Name:   Linux-3.2.5
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1923728 Bytes =  1.8 MB
   Load Address: c0008000
   Entry Point:  c0008000
   Verifying Checksum ... OK

But, when I try the ramdisk.gz file (rootfs.ext2.gz) I get this:

SIM.ONE> tftp c8000000 ramdisk.gz
TFTP from server 192.168.0.84; our IP address is 192.168.0.79
Filename 'ramdisk.gz'.
Load address: 0xc8000000
Loading: #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #####################################################
done
Bytes transferred = 2266236 (22947c hex)
SIM.ONE> iminfo

## Checking Image at c8000000 ...
   Bad Magic Number

The only things I have found about the U-Boot image file mentions using 'mkimage' to create
the file using a command like these examples:

mkimage -T ramdisk -C gzip -n 'Test Ramdisk Image' -d ramdisk.img.gz uRamdisk
mkimage -A sh -O linux -T ramdisk -a 0x8C800000 -n "ST40 Linux ramdisk" -d initrd.img /export/ramdisk.ub

My guess the uRamdisk file is the same format as the uImage file used for the kernel. But,
I'm not sure what the format of the ramdisk.img.gz or initrd.img files are.

I do see there is a uboot-mkimage package available in Debian. It says this about it:

---

This package contains the mkimage utility, which encapsulates a compressed "uImage"
Linux kerel image with header information, CRC32 checksum, etc, for use with the
U-Boot bootloader.
 
mkimage can also be used to create ramdisk images for use with U-Boot, either separated
from the Linux kernel image, or combined into one file. mkimage encapsulates the images
with a 64 byte header containing information about target architecture, operating system,
image type, compression method, entry points, time stamp, CRC32 checksums, etc.

---

Regards,
Hartley
