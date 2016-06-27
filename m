From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jun 2016 13:39:05 +0200
Subject: [Buildroot] [PATCH] Add support for Digilent Zybo (Xilinx
 Zynq-7000)
In-Reply-To: <f38581f1-c8ca-d8ac-0630-065bea29dc01@gmail.com>
References: <526113c1-b1c6-f391-4c9f-1e84b4f2d6d1@gmail.com>
 <f38581f1-c8ca-d8ac-0630-065bea29dc01@gmail.com>
Message-ID: <20160627133905.435b0f16@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sebastien,

On Mon, 27 Jun 2016 12:09:16 +0200, Sebastien Van Cauwenberghe wrote:


> > Also, why do you use an initramfs for the rootfs rather than the more
> > traditional ext4 partition next to the FAT partition? This would be the
> > preferred method for the defconfig in Buildroot.
> >  
> I will go to ext4 but (as a beginner), I'll first investigate what is wrong with ext4
> not booting (maybe mmc/ext4 compiled as a module).
> 
> In this case, I guess a board specific defconfig should be used ?

You mean the defconfig for your platform does not have ext4 support
built-in? That would be weird.

But if that's really the case, don't add a board specific defconfig.
Instead, use the existing defconfig, and provide a defconfig fragment
(option BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES) to enable ext4/mmc as
needed.

> > All of this can be simplified once you generate a complete SD card
> > image with genimage.
> >  
> Done genimage is really easier to prepare sd afterwards :)

Indeed, that's the whole point of genimage!

> >> +There is a patch attached that redefines the U-Boot's environment
> >> +to work with Buildroot out-of-the-box.  
> > 
> > Why do you patch the U-Boot built-in environment instead of providing
> > an uEnv.txt file?
> >   
> I saw loading uEnv.txt was a board specific stuff and should be subject to patch anyways
> so I added the environment in there so I can use the board without sd card but with 
> the flash memory.

So the default environment is not already loading a uEnv.txt file or
executing some default script from the MMC ?

If that's the case, then indeed, you need to patch the default
environment.

> >> +The serial console is accessible on the host on /dev/ttyUSB1 at 115200 bauds.  
> > 
> > Saying it's on /dev/ttyUSB1 on the host is wrong. It might be on your
> > machine, but it might be on ttyUSB0 on mine, or on ttyUSB2. There is no
> > point in giving this information, since you don't know.
> >   
> Wrong phrasing, USB connection exposes two USB-to-serial interfaces (one for JTAG and one for UART), to get the console you need
> to use the second one. I'll correct this explanation.

OK.

> >> +BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
> >> +BR2_LINUX_KERNEL=y  
> > 
> > Please use a fixed kernel version.
> >   
> You mean, not "Use the latest kernel" option but "Specific version" and provide a version number ?

Yes.

> >> +BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
> >> +BR2_LINUX_KERNEL_UIMAGE=y
> >> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"  
> > 
> > Can you try to use zImage instead, which is now the standard format on
> > ARM?
> >  
> Apparently the uImage is all I can use easily with the Zynq, maybe with another
> defconfig in U-boot for this board, I'll be able to use zImages ?

Hum, you really don't have the "bootz" command in U-Boot? For a modern
U-Boot, this seems weird.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
