From: Jens Maus <mail@jens-maus.de>
Date: Mon, 12 Jun 2017 23:11:44 +0200
Subject: [Buildroot] How to generate initrd for booting rootfs with
 root=LABEL= in kernel command line
In-Reply-To: <DBE2C4B1-2318-490E-A4EF-85DE8A8C0F10@openadk.org>
References: <A112705D-AEA2-495C-8717-A2FCC1142CBE@jens-maus.de>
 <DBE2C4B1-2318-490E-A4EF-85DE8A8C0F10@openadk.org>
Message-ID: <A6471057-728D-46AF-ACD0-5ECC801FBD47@jens-maus.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

> Am 10.06.2017 um 17:44 schrieb Waldemar Brodkorb <wbx@openadk.org>:
> 
>> Am 08.06.2017 um 09:34 schrieb Jens Maus <mail@jens-maus.de>:
>> 
>> I am currently working on a project that is using buildroot and generates system images (*.img) that a user should either be able to put on a SD card or on an external USB drive for booting. For convenience reasons I already modified my /etc/fstab and busybox setup within buildroot to mount the user partitions via ?LABEL=? statements so that a user doesn?t have to manually patch /etc/fstab himself in case he installs the *.img on a USB drive rather than on the SD card of, e.g. a RaspberryPi (/dev/sdaX vs. /dev/mmcblkpX). This already works flawlessly and quite smooth with my buildroot environment.
>> 
>> However, the only thing missing is to be able to actually boot the linux kernel with a command line where also ?root=LABEL=rootfs? is used rather than ?root=/dev/sdaX? or ?root=/dev/mmcblkpX? so that during boot up it identifies itself from where it should mount the root filesystem. This of course doesn?t work out-of-the-box since the linux kernel itself doesn?t seem to know anything about filesystem labels or how to query them. The only specifiers that can be directly used by the kernel (depending on the kernel version, of course) seems to be UUID= and PARTUUID= which both don?t seem to be solutions for my problem since these UUIDs are regenerated with every filesystem regeneration and PARTUUID is only available with a GUID partition table, which I don?t use. In addition, I even couldn?t get my test system with kernel 4.4.x properly booted with either UUID= or PARTUUID= specified.
> 
> I want to correct this statement.
> PARTUUID is possible without GUID.
> I have used this for the same use case for an embedded x86 board and grub in the past. (pc engines board)
> The usage was automated in this script:
> https://cgit.openadk.org/cgi/cgit/openadk.git/tree/scripts/install.sh
> 
> The script generates a MBR with a random NT signature, which is then passed to the kernel via root= with grub.
> 
> See the do_mount.c code in the kernel for this UUID use case.
> 
> It might work for Raspberry PI, but i didn't tried.

Thanks for this great hint. I tested it and it indeed works. After some more investigation on the ?genimage? tool that usually generates images in buildroot I found out that it already supports setting the disk signature of an image which then ends up in the system identifying it via PARTUUID. This can be performed by adding a ?disk-signature? config option to the genimage.cfg configuration file as followed:

? cut here ?
[?]
 image sdcard.img {
   hdimage {
     disk-signature = 0xDEEDBEEF
   }
[?]
? cut here ?

Upon mounting the ?sdcard.img? file one can add a kernel command line option like ?root=PARTUUID=deedbeef-02? so that the kernel tries to mount the second partition of the disk identified by ?deedbeef?. Thus, in my application I could solve my problem by using ?disk-signature? as a config option to genimage:

https://github.com/jens-maus/RaspberryMatic/commit/64f3c3b44b690a5344049ac50dc2d1e13c7a2728

Thanks again for this hint.

Regards,

Jens
-- 
Jens Maus, Dresden/Germany
http://jens-maus.de/

*** Content is authentic only with digital signature  ***

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 3745 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170612/2a4a63cd/attachment.p7s>
