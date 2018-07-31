From: David De Grave <david.degrave@mind.be>
Date: Tue, 31 Jul 2018 20:12:29 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: Really use host-dtc
In-Reply-To: <20180728214834.3496b200@windsurf>
References: <20180726103630.8643-1-david.degrave@mind.be>
 <20180726103630.8643-2-david.degrave@mind.be>
 <20180728214834.3496b200@windsurf>
Message-ID: <CAD6XyYyrv809pmGMg3M_9wFekQ2c1JfnKRQ3w8bvqFhG4tVYeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for your reply.
I'm working on a beagle bone black wireless board with a custom config
based on "beaglebone_defconfig".

Indeed, I was not able to reproduce it from the buildroot directory also...
It seems the problem comes only when I build outside of it.
To avoid changing something in the buildroot tree and make it easier to
update it later, I made a wrapper script that change to buildroot dir and
use all the configs/packages/... a directory level below it.

A short example:

root-project
|- buildroot/
|  |- arch/
|  |- configs/
|  |- ...
|- output/
|- beaglebone_defconfig
|- uboot.fragment
....

So, to reproduce that problem, I did the following:

mkdir test && cd test
git clone git://git.buildroot.net/buildroot.git buildroot
cd buildroot && git checkout 2018.05-1 && cd ..

make -C buildroot O=$PWD/output defconfig
BR2_DEFCONFIG=../beaglebone_defconfig
make -C buildroot O=$PWD/output menuconfig

changed:
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_boneblack"
BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="../uboot.fragment"

uboot.fragment:
CONFIG_MULTI_DTB_FIT=y
CONFIG_OF_LIST="am335x-boneblack"

make -C buildroot O=$PWD/output uboot
make: Entering directory '/home/ddg/test/buildroot'
/usr/bin/make -j1 O=/home/ddg/test/output HOSTCC="/usr/lib64/ccache/gcc"
HOSTCXX="/usr/lib64/ccache/g++" silentoldconfig
  GEN     /home/ddg/test/output/Makefile
>>> host-skeleton  Extracting
[...]
>>> uboot 2018.01 Extracting
[...]
>>> uboot 2018.01 Building
[...]
  CC      spl/lib/libfdt/fdt_overlay.o
  CC      spl/lib/libfdt/fdt_ro.o
  OBJCOPY u-boot-nodtb.bin
  CC      spl/lib/linux_compat.o
make[3]: *** No rule to make target 'arch/arm/dts/unset.dts', needed by
'arch/arm/dts/unset.dtb'.  Stop.
make[3]: *** Waiting for unfinished jobs....
  DTC     arch/arm/dts/am335x-boneblack.dtb
  CC      spl/drivers/core/fdtaddr.o
/bin/sh: ./scripts/dtc/dtc: No such file or directory
make[4]: *** [scripts/Makefile.lib:329: arch/arm/dts/am335x-boneblack.dtb]
Error 127
make[3]: *** [dts/Makefile:62: arch-dtbs] Error 2
make[2]: *** [Makefile:876: dts/dt.dtb] Error 2
make[2]: *** Waiting for unfinished jobs....
  CC      spl/drivers/gpio/gpio-uclass.o
  CC      spl/lib/libfdt/fdt_rw.o
  CC      spl/drivers/gpio/omap_gpio.o
  CC      spl/drivers/core/lists.o
make[1]: *** [package/pkg-generic.mk:226:
/home/ddg/test/output/build/uboot-2018.01/.stamp_built] Error 2
make: *** [Makefile:79: _all] Error 2
make: Leaving directory '/home/ddg/test/buildroot'

ls output/build/uboot-2018.01/scripts/dtc/dtc
ls: cannot access 'output/build/uboot-2018.01/scripts/dtc/dtc': No such
file or directory

If I remove the uboot.fragment, all is building well up to the end.
Moreover, why do he use ./scripts/dtc/dtc ? It should use
$(HOST_DIR)/bin/dtc at the moment host-dtc is build, no ?

Regards,
David

On Sat, Jul 28, 2018 at 9:48 PM, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Thu, 26 Jul 2018 12:36:30 +0200, David De Grave (Essensium/Mind)
> wrote:
> > U-Boot's build system (at least in 2018.01) does not use
> $(HOST_DIR)/bin/dtc to
> > compile dts files. Instead it tries to use it's internal dtc who is not
> > compiled by default and result in a build failure:
> >
> >   DTC     arch/arm/dts/foo.dtb
> > /bin/sh: ./scripts/dtc/dtc: No such file or directory
> > make[4]: *** [scripts/Makefile.lib:329: arch/arm/dts/foo.dtb] Error 127
> >
> > To reproduce this error, use a uboot config that contains the following:
> >
> > CONFIG_MULTI_DTB_FIT=y
> > CONFIG_OF_LIST="foo"
> >
> > Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
> > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> I just tested building dra7xx_evm on U-Boot 2018.07, and it builds
> fine, scripts/dtc/dtc is used and has been built:
>
>  mkdir -p arch/arm/dts/ ; (cat arch/arm/dts/dra72-evm.dts; echo '#include
> "omap5-u-boot.dtsi"') > arch/arm/dts/.dra72-evm.dtb.pre.tmp;
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gnueabihf-gcc -E
> -Wp,-MD,arch/arm/dts/.dra72-evm.dtb.d.pre.tmp -nostdinc -I./arch/arm/dts
> -I./arch/arm/dts/include -Iinclude -I./include -I./arch/arm/include
> -include ./include/linux/kconfig.h -D__ASSEMBLY__ -undef -D__DTS__ -x
> assembler-with-cpp -o arch/arm/dts/.dra72-evm.dtb.dts.tmp
> arch/arm/dts/.dra72-evm.dtb.pre.tmp ; ./scripts/dtc/dtc -O dtb -o
> arch/arm/dts/dra72-evm.dtb -b 0 -i arch/arm/dts/  -Wno-unit_address_vs_reg
> -Wno-simple_bus_reg -Wno-unit_address_format -Wno-pci_bridge
> -Wno-pci_device_bus_num -Wno-pci_device_reg  -d
> arch/arm/dts/.dra72-evm.dtb.d.dtc.tmp arch/arm/dts/.dra72-evm.dtb.dts.tmp
> ; cat arch/arm/dts/.dra72-evm.dtb.d.pre.tmp arch/arm/dts/.dra72-evm.dtb.d.dtc.tmp
> > arch/arm/dts/.dra72-evm.dtb.d
>   mkdir -p arch/arm/dts/ ; (cat arch/arm/dts/dra7-evm.dts; echo '#include
> "dra7-evm-u-boot.dtsi"') > arch/arm/dts/.dra7-evm.dtb.pre.tmp;
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gnueabihf-gcc -E
> -Wp,-MD,arch/arm/dts/.dra7-evm.dtb.d.pre.tmp -nostdinc -I./arch/arm/dts
> -I./arch/arm/dts/include -Iinclude -I./include -I./arch/arm/include
> -include ./include/linux/kconfig.h -D__ASSEMBLY__ -undef -D__DTS__ -x
> assembler-with-cpp -o arch/arm/dts/.dra7-evm.dtb.dts.tmp
> arch/arm/dts/.dra7-evm.dtb.pre.tmp ; ./scripts/dtc/dtc -O dtb -o
> arch/arm/dts/dra7-evm.dtb -b 0 -i arch/arm/dts/  -Wno-unit_address_vs_reg
> -Wno-simple_bus_reg -Wno-unit_address_format -Wno-pci_bridge
> -Wno-pci_device_bus_num -Wno-pci_device_reg  -d
> arch/arm/dts/.dra7-evm.dtb.d.dtc.tmp arch/arm/dts/.dra7-evm.dtb.dts.tmp ;
> cat arch/arm/dts/.dra7-evm.dtb.d.pre.tmp arch/arm/dts/.dra7-evm.dtb.d.dtc.tmp
> > arch/arm/dts/.dra7-evm.dtb.d
>   mkdir -p arch/arm/dts/ ; (cat arch/arm/dts/dra72-evm-revc.dts; echo
> '#include "dra72-evm-revc-u-boot.dtsi"') > arch/arm/dts/.dra72-evm-revc.dtb.pre.tmp;
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gnueabihf-gcc -E
> -Wp,-MD,arch/arm/dts/.dra72-evm-revc.dtb.d.pre.tmp -nostdinc
> -I./arch/arm/dts -I./arch/arm/dts/include -Iinclude -I./include
> -I./arch/arm/include -include ./include/linux/kconfig.h -D__ASSEMBLY__
> -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/dts/.dra72-evm-revc.dtb.dts.tmp
> arch/arm/dts/.dra72-evm-revc.dtb.pre.tmp ; ./scripts/dtc/dtc -O dtb -o
> arch/arm/dts/dra72-evm-revc.dtb -b 0 -i arch/arm/dts/
> -Wno-unit_address_vs_reg -Wno-simple_bus_reg -Wno-unit_address_format
> -Wno-pci_bridge -Wno-pci_device_bus_num -Wno-pci_device_reg  -d
> arch/arm/dts/.dra72-evm-revc.dtb.d.dtc.tmp arch/arm/dts/.dra72-evm-revc.dtb.dts.tmp
> ; cat arch/arm/dts/.dra72-evm-revc.dtb.d.pre.tmp
> arch/arm/dts/.dra72-evm-revc.dtb.d.dtc.tmp > arch/arm/dts/.dra72-evm-revc.
> dtb.d
>   mkdir -p arch/arm/dts/ ; (cat arch/arm/dts/dra71-evm.dts; echo '#include
> "dra71-evm-u-boot.dtsi"') > arch/arm/dts/.dra71-evm.dtb.pre.tmp;
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gnueabihf-gcc -E
> -Wp,-MD,arch/arm/dts/.dra71-evm.dtb.d.pre.tmp -nostdinc -I./arch/arm/dts
> -I./arch/arm/dts/include -Iinclude -I./include -I./arch/arm/include
> -include ./include/linux/kconfig.h -D__ASSEMBLY__ -undef -D__DTS__ -x
> assembler-with-cpp -o arch/arm/dts/.dra71-evm.dtb.dts.tmp
> arch/arm/dts/.dra71-evm.dtb.pre.tmp ; ./scripts/dtc/dtc -O dtb -o
> arch/arm/dts/dra71-evm.dtb -b 0 -i arch/arm/dts/  -Wno-unit_address_vs_reg
> -Wno-simple_bus_reg -Wno-unit_address_format -Wno-pci_bridge
> -Wno-pci_device_bus_num -Wno-pci_device_reg  -d
> arch/arm/dts/.dra71-evm.dtb.d.dtc.tmp arch/arm/dts/.dra71-evm.dtb.dts.tmp
> ; cat arch/arm/dts/.dra71-evm.dtb.d.pre.tmp arch/arm/dts/.dra71-evm.dtb.d.dtc.tmp
> > arch/arm/dts/.dra71-evm.dtb.d
>   mkdir -p arch/arm/dts/ ; (cat arch/arm/dts/dra76-evm.dts; echo '#include
> "dra76-evm-u-boot.dtsi"') > arch/arm/dts/.dra76-evm.dtb.pre.tmp;
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gnueabihf-gcc -E
> -Wp,-MD,arch/arm/dts/.dra76-evm.dtb.d.pre.tmp -nostdinc -I./arch/arm/dts
> -I./arch/arm/dts/include -Iinclude -I./include -I./arch/arm/include
> -include ./include/linux/kconfig.h -D__ASSEMBLY__ -undef -D__DTS__ -x
> assembler-with-cpp -o arch/arm/dts/.dra76-evm.dtb.dts.tmp
> arch/arm/dts/.dra76-evm.dtb.pre.tmp ; ./scripts/dtc/dtc -O dtb -o
> arch/arm/dts/dra76-evm.dtb -b 0 -i arch/arm/dts/  -Wno-unit_address_vs_reg
> -Wno-simple_bus_reg -Wno-unit_address_format -Wno-pci_bridge
> -Wno-pci_device_bus_num -Wno-pci_device_reg  -d
> arch/arm/dts/.dra76-evm.dtb.d.dtc.tmp arch/arm/dts/.dra76-evm.dtb.dts.tmp
> ; cat arch/arm/dts/.dra76-evm.dtb.d.pre.tmp arch/arm/dts/.dra76-evm.dtb.d.dtc.tmp
> > arch/arm/dts/.dra76-evm.dtb.d
>
> $ ls -l output/build/uboot-2018.07/scripts/dtc/dtc
> -rwxr-xr-x 1 thomas thomas 132704 Jul 28 21:37 output/build/uboot-2018.07/
> scripts/dtc/dtc
>
> Could you provide more details about which configuration is causing
> problem ?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


-- 

*David De Grave*
Senior Embedded Software Developer
Gsm : +32(0)496.364.960 | Tel : +32-16-28.65.00 | Fax : +32-16-28a.65.01
Essensium-Mind <https://www.mind.be/> - Gaston Geenslaan 9, B-3001 Leuven,
Belgium
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180731/b7611036/attachment.html>
