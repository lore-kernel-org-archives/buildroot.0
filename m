From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 20:51:54 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: Really use host-dtc
In-Reply-To: <CAD6XyYyrv809pmGMg3M_9wFekQ2c1JfnKRQ3w8bvqFhG4tVYeA@mail.gmail.com>
References: <20180726103630.8643-1-david.degrave@mind.be>
 <20180726103630.8643-2-david.degrave@mind.be>
 <20180728214834.3496b200@windsurf>
 <CAD6XyYyrv809pmGMg3M_9wFekQ2c1JfnKRQ3w8bvqFhG4tVYeA@mail.gmail.com>
Message-ID: <20180731205154.62967de8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 Jul 2018 20:12:29 +0200, David De Grave wrote:

> So, to reproduce that problem, I did the following:
> 
> mkdir test && cd test
> git clone git://git.buildroot.net/buildroot.git buildroot
> cd buildroot && git checkout 2018.05-1 && cd ..
> 
> make -C buildroot O=$PWD/output defconfig
> BR2_DEFCONFIG=../beaglebone_defconfig
> make -C buildroot O=$PWD/output menuconfig
> 
> changed:
> BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_boneblack"
> BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="../uboot.fragment"
> 
> uboot.fragment:
> CONFIG_MULTI_DTB_FIT=y
> CONFIG_OF_LIST="am335x-boneblack"
> 
> make -C buildroot O=$PWD/output uboot
> make: Entering directory '/home/ddg/test/buildroot'
> /usr/bin/make -j1 O=/home/ddg/test/output HOSTCC="/usr/lib64/ccache/gcc"
> HOSTCXX="/usr/lib64/ccache/g++" silentoldconfig
>   GEN     /home/ddg/test/output/Makefile
> >>> host-skeleton  Extracting  
> [...]
> >>> uboot 2018.01 Extracting  
> [...]
> >>> uboot 2018.01 Building  
> [...]
>   CC      spl/lib/libfdt/fdt_overlay.o
>   CC      spl/lib/libfdt/fdt_ro.o
>   OBJCOPY u-boot-nodtb.bin
>   CC      spl/lib/linux_compat.o
> make[3]: *** No rule to make target 'arch/arm/dts/unset.dts', needed by
> 'arch/arm/dts/unset.dtb'.  Stop.
> make[3]: *** Waiting for unfinished jobs....
>   DTC     arch/arm/dts/am335x-boneblack.dtb
>   CC      spl/drivers/core/fdtaddr.o
> /bin/sh: ./scripts/dtc/dtc: No such file or directory
> make[4]: *** [scripts/Makefile.lib:329: arch/arm/dts/am335x-boneblack.dtb]
> Error 127
> make[3]: *** [dts/Makefile:62: arch-dtbs] Error 2
> make[2]: *** [Makefile:876: dts/dt.dtb] Error 2
> make[2]: *** Waiting for unfinished jobs....
>   CC      spl/drivers/gpio/gpio-uclass.o
>   CC      spl/lib/libfdt/fdt_rw.o
>   CC      spl/drivers/gpio/omap_gpio.o
>   CC      spl/drivers/core/lists.o
> make[1]: *** [package/pkg-generic.mk:226:
> /home/ddg/test/output/build/uboot-2018.01/.stamp_built] Error 2
> make: *** [Makefile:79: _all] Error 2
> make: Leaving directory '/home/ddg/test/buildroot'
> 
> ls output/build/uboot-2018.01/scripts/dtc/dtc
> ls: cannot access 'output/build/uboot-2018.01/scripts/dtc/dtc': No such
> file or directory

Thanks for the detailed instructions, I'll try to reproduce.

> If I remove the uboot.fragment, all is building well up to the end.
> Moreover, why do he use ./scripts/dtc/dtc ? It should use
> $(HOST_DIR)/bin/dtc at the moment host-dtc is build, no ?

I think the optional dependency on host-dtc depends from a time where
U-Boot did not have its own copy of DTC. I'm not sure it makes a lot of
sense now.

If U-Boot tries to use ./scripts/dtc/dtc, then it should have built it.
If it didn't build it but tries to use it nonetheless, it sounds like a
bug in U-Boot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
