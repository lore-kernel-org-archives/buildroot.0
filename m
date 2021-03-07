From: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Date: Sun, 7 Mar 2021 10:29:35 +0100
Subject: [Buildroot] [PATCH] configs/qemu_arm_vexpress_tz: bump versions
 and update
In-Reply-To: <CAN5uoS969h-Ea063R0CpRgJVSREUKvzeA_8-PA1yO=54SLEFWw@mail.gmail.com>
References: <20210306210048.24399-1-vincent.stehle@laposte.net>
 <CAN5uoS969h-Ea063R0CpRgJVSREUKvzeA_8-PA1yO=54SLEFWw@mail.gmail.com>
Message-ID: <YESc/7MpZkLtU1n2@romuald.bergerie>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 06, 2021 at 11:22:14PM +0100, Etienne Carriere wrote:

 Salut Etienne,

Thanks for the review!

..
> > diff --git a/board/qemu/arm-vexpress-tz/u-boot.config b/board/qemu/arm-vexpress-tz/u-boot.config
> > index fd74bf1fe7..9f54f806ce 100644
> > --- a/board/qemu/arm-vexpress-tz/u-boot.config
> > +++ b/board/qemu/arm-vexpress-tz/u-boot.config
> > @@ -1,7 +1,8 @@
> >  CONFIG_SYS_TEXT_BASE=0x60000000
> > -CONFIG_BOOTCOMMAND="fdt addr ${fdt_addr} && fdt resize 1000 && smhload zImage ${kernel_addr_r} && smhload rootfs.cpio.gz ${ramdisk_addr_r} ramdisk_addr_end &&  setenv bootargs console=ttyAMA0,115200 earlyprintk=serial,ttyAMA0,115200 && fdt chosen ${ramdisk_addr_r} ${ramdisk_addr_end} && bootz ${kernel_addr_r} - ${fdt_addr}"
> > +CONFIG_BOOTCOMMAND="smhload output/images/zImage ${kernel_addr_r} && smhload output/images/rootfs.cpio.uboot ${ramdisk_addr_r} && setenv bootargs console=ttyAMA0,115200 earlyprintk=serial,ttyAMA0,115200 && bootz ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr}"
> 
> This is the part i don't really like.
> Here, "smhload output/images/zImage" enforces in u-boot config that
> buildroot output dir is  output/.
> I often use make some_board_defconfig O=output/some_board
> Maybe you could change to run Qemu at least from <output-dir>, and
> have u-boot command "smhload images/<target-file> ..."
> The other places where output/ is referenced are  in readme.txt.

You are completely right. I forgot about O=, which I seldom use.
Let's keep the paths as they are and still cd into the images dir then.
I will post a v2.

> No other comment for the change, LGTM aside this path thing.

Thanks!

Best regards,
Vincent.
