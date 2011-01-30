From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Sun, 30 Jan 2011 11:30:54 +0100
Subject: [Buildroot] rootfs.ubifs not able to mount by kernel
In-Reply-To: <20110130014541.ed0f21fc085cea67a12906c6b8e6fb44.9d3b1440ba.wbe@email10.secureserver.net>
References: <20110130014541.ed0f21fc085cea67a12906c6b8e6fb44.9d3b1440ba.wbe@email10.secureserver.net>
Message-ID: <4D453DDE.7000007@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 30.01.2011 09:45, schrieb nataraj at vaaraahi.com:
> Hi Jacmet, Kos_tom & friends
>
> I am trying to boot from a ubifs file system from u-boot. I am able to
> write my "rootfs.ubifs" onto nand flash, and then, mount and list
> using 'ubimount' and 'ubifsls' commands, in u-boot. But getting kernel
> panic when kernel tries to mount the rootfs.I am using arm-linux
> kernel on at91sam9263 Soc gadget having 256M Nand flash.
Hi,

Writing a ubiFS on NAND (with RAW u-boot command) and mounting 
afterwards is not possible. The produced ubiFS must be ubinized to a UBI 
image.
I must admit, that I did not exactly understand the diffrence between 
ubifs and ubi, but as explained on the mtd-utils page, the ubifs is the 
FS layer to the kernel in a traditional sense (like ext2FS) and ubi is a 
technical layer between RAW NAND and FS.
http://www.linux-mtd.infradead.org/doc/ubi.html
http://www.linux-mtd.infradead.org/doc/ubifs.html

I already used ubifs and ubiimages on my target device and can confirm, 
that you have to create the ubifs image AND afterwards you have to 
UBINIZE it BEFORE writing it on NAND.

Excerpt from 
http://gitorious.org/dockstar/emdebian-multistrap/blobs/master/mkubi-img.sh
..
echo "Generating UBIFS out of target dir: $ROOTFS"
mkfs.ubifs -r $ROOTFS $UBIFS_OPTS -o $UBIFS_IMAGEFILE
echo "Generating UBI image out of file $UBIFS_IMAGEFILE"
ubinize $UBINIZE_OPTS ubinize.cfg -o $UBI_IMAGEFILE
..

I wrote the ubinized image on the NAND flash and the linux kernel could 
be read via u-boot ubifsload from that nand partition without problems. 
Furthermore the kernel accepted the ubifs on the ubi parition as rootfs.

>
> Specific errors being:-
> UBIFS error (pid 1): ubifs_get_sb: cannot open "ubi0:rootfs", error -19
> VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0)
I guess, the ubifs on the UBI(without fs) parition could not be loaded 
(because you didn't create one ;-) ).

I think it is possible to write a ubifs image onto a formerly created 
ubi parition with mtd-utils (this would preserve the write counters of 
the ubi layer). But I never tried that (because I didn't bookmark the 
site where I found that information...).

May be it is possible to "format" or better prepare the ubi parition 
with some u-boot command and write the ubiFS image on it... But I was 
happy with my ubi image and since it worked, I didn't have a deeper look 
into u-boot commands...

Regards,
Marcus
