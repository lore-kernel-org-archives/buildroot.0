From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 May 2018 22:53:24 +0200
Subject: [Buildroot] ubi filesytem issue
In-Reply-To: <1525768603017-0.post@n4.nabble.com>
References: <1525768603017-0.post@n4.nabble.com>
Message-ID: <1d185052-8431-9398-581e-97a6e8ef4ac8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-05-18 10:36, nikh wrote:
> Hi,
> 
> I am nikh,
> 
> I am trying to build rootfs in ubi format using buildroot. I am using
> sama5d3_xplained board.
> I am using nand flash based booting.
> I build a root file system based on the information from the following site,
> http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRootBuild#How_to_build_Buildroot_for_AT91
> 
> I successfully got the ubi format rootfs image. I used a demo script to
> flash at91 bootstrap, u-boot, u-bootenv, device tree, zImage and root file
> system.

[snip]

> ubi0 error: 0xc041cd7c: bad VID header offset 512, expected 2048

 Looks like you created a UBI image with VID header offset 512 instead of 2048.
How did you create the UBI partition? The easiest way is to do it on the device
itself (after e.g. booting from SD card), then you can just ubiattach the empty
partition and a correct UBI will be automatically created in it. If you created
the UBI image from Buildroot, then the BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE option
is used. This defaults to 0x800 (512 bytes) but has to be 0x2000 (2048 bytes) in
your case.

 Actually, nowadays it's next to impossible to find a small-page flash (i.e.
with MINIOSIZE=512), so perhaps we should change the default.

 Regards,
 Arnout

> ubi0 error: 0xc041cd30: bad EC header
> Erase counter header dump:
>         magic          0x55424923
>         version        1
>         ec             0
>         vid_hdr_offset 512
>         data_offset    2048
>         image_seq      1825409418
>         hdr_crc        0x3358adb
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
