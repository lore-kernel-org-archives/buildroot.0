From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Oct 2012 17:23:56 +0200
Subject: [Buildroot] Creating initrd
In-Reply-To: <1349968569.14474.10.camel@Homeserver>
References: <1349964303.8392.39.camel@Homeserver>
 <20121011164826.753f8312@skate>
 <1349968569.14474.10.camel@Homeserver>
Message-ID: <20121011172356.6af76f39@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thu, 11 Oct 2012 11:16:09 -0400, Chris Wilkinson wrote:
> The .config is here
> 
> http://pastebin.com/84LqnBXS

Are you sure you did a "make clean; make" after doing all your
configuration changes? Your configuration has almost no packages
enabled, the generated root filesystem definitely shouldn't be that big.

> This shows what I'm trying to achieve.
> 
> http://d-i.alioth.debian.org/manual/en.armel/ch05s01.html#boot-firmware. 
> 
> The output on the serial console goes like this on power up.
> 
> >>
> No network interfaces found
> 
> EM-7210 ver.T04 2005-12-12 (For ver.AA)
> == Executing boot script in 1.000 seconds - enter ^C to abort
> 
> At this point, hit Control-C to interrupt the boot loader[4]. This
> will give you the RedBoot prompt. Enter the following commands:
> 
> > load -v -r -b 0x01800000 -m ymodem ramdisk.gz
> > load -v -r -b 0x01008000 -m ymodem zImage
> > exec -c "console=ttyS0,115200 rw root=/dev/ram mem=256M at 0xa0000000" -r 0x01800000

You have two choices:

 1 Use an initramfs embedded inside the kernel image. This is what
   Buildroot does when you enable the BR2_TARGET_ROOTFS_INITRAMFS
   option. In that case, you only need to load zImage to RAM, and
   execute it, it already contains the initramfs.

 2 Use an initramfs outside the kernel image. In that case, don't
   enable the BR2_TARGET_ROOTFS_INITRAMFS Buildroot option, and simply
   generated a compressed cpio archive for the root filesystem, thanks
   to BR2_TARGET_ROOTFS_CPIO + BR2_TARGET_ROOTFS_CPIO_GZIP. Then, make
   sure your kernel as the support for initramfs enabled.

I am quite familiar with choice 1, but I haven't tested choice 2 with
Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
