From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 21:48:34 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: Really use host-dtc
In-Reply-To: <20180726103630.8643-2-david.degrave@mind.be>
References: <20180726103630.8643-1-david.degrave@mind.be>
 <20180726103630.8643-2-david.degrave@mind.be>
Message-ID: <20180728214834.3496b200@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jul 2018 12:36:30 +0200, David De Grave (Essensium/Mind)
wrote:
> U-Boot's build system (at least in 2018.01) does not use $(HOST_DIR)/bin/dtc to
> compile dts files. Instead it tries to use it's internal dtc who is not
> compiled by default and result in a build failure:
> 
>   DTC     arch/arm/dts/foo.dtb
> /bin/sh: ./scripts/dtc/dtc: No such file or directory
> make[4]: *** [scripts/Makefile.lib:329: arch/arm/dts/foo.dtb] Error 127
> 
> To reproduce this error, use a uboot config that contains the following:
> 
> CONFIG_MULTI_DTB_FIT=y
> CONFIG_OF_LIST="foo"
> 
> Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I just tested building dra7xx_evm on U-Boot 2018.07, and it builds
fine, scripts/dtc/dtc is used and has been built:

 mkdir -p arch/arm/dts/ ; (cat arch/arm/dts/dra72-evm.dts; echo '#include "omap5-u-boot.dtsi"') > arch/arm/dts/.dra72-evm.dtb.pre.tmp; /home/thomas/projets/buildroot/output/host/bin/arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/dts/.dra72-evm.dtb.d.pre.tmp -nostdinc -I./arch/arm/dts -I./arch/arm/dts/include -Iinclude -I./include -I./arch/arm/include -include ./include/linux/kconfig.h -D__ASSEMBLY__ -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/dts/.dra72-evm.dtb.dts.tmp arch/arm/dts/.dra72-evm.dtb.pre.tmp ; ./scripts/dtc/dtc -O dtb -o arch/arm/dts/dra72-evm.dtb -b 0 -i arch/arm/dts/  -Wno-unit_address_vs_reg -Wno-simple_bus_reg -Wno-unit_address_format -Wno-pci_bridge -Wno-pci_device_bus_num -Wno-pci_device_reg  -d arch/arm/dts/.dra72-evm.dtb.d.dtc.tmp arch/arm/dts/.dra72-evm.dtb.dts.tmp ; cat arch/arm/dts/.dra72-evm.dtb.d.pre.tmp arch/arm/dts/.dra72-evm.dtb.d.dtc.tmp > arch/arm/dts/.dra72-evm.dtb.d
  mkdir -p arch/arm/dts/ ; (cat arch/arm/dts/dra7-evm.dts; echo '#include "dra7-evm-u-boot.dtsi"') > arch/arm/dts/.dra7-evm.dtb.pre.tmp; /home/thomas/projets/buildroot/output/host/bin/arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/dts/.dra7-evm.dtb.d.pre.tmp -nostdinc -I./arch/arm/dts -I./arch/arm/dts/include -Iinclude -I./include -I./arch/arm/include -include ./include/linux/kconfig.h -D__ASSEMBLY__ -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/dts/.dra7-evm.dtb.dts.tmp arch/arm/dts/.dra7-evm.dtb.pre.tmp ; ./scripts/dtc/dtc -O dtb -o arch/arm/dts/dra7-evm.dtb -b 0 -i arch/arm/dts/  -Wno-unit_address_vs_reg -Wno-simple_bus_reg -Wno-unit_address_format -Wno-pci_bridge -Wno-pci_device_bus_num -Wno-pci_device_reg  -d arch/arm/dts/.dra7-evm.dtb.d.dtc.tmp arch/arm/dts/.dra7-evm.dtb.dts.tmp ; cat arch/arm/dts/.dra7-evm.dtb.d.pre.tmp arch/arm/dts/.dra7-evm.dtb.d.dtc.tmp > arch/arm/dts/.dra7-evm.dtb.d
  mkdir -p arch/arm/dts/ ; (cat arch/arm/dts/dra72-evm-revc.dts; echo '#include "dra72-evm-revc-u-boot.dtsi"') > arch/arm/dts/.dra72-evm-revc.dtb.pre.tmp; /home/thomas/projets/buildroot/output/host/bin/arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/dts/.dra72-evm-revc.dtb.d.pre.tmp -nostdinc -I./arch/arm/dts -I./arch/arm/dts/include -Iinclude -I./include -I./arch/arm/include -include ./include/linux/kconfig.h -D__ASSEMBLY__ -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/dts/.dra72-evm-revc.dtb.dts.tmp arch/arm/dts/.dra72-evm-revc.dtb.pre.tmp ; ./scripts/dtc/dtc -O dtb -o arch/arm/dts/dra72-evm-revc.dtb -b 0 -i arch/arm/dts/  -Wno-unit_address_vs_reg -Wno-simple_bus_reg -Wno-unit_address_format -Wno-pci_bridge -Wno-pci_device_bus_num -Wno-pci_device_reg  -d arch/arm/dts/.dra72-evm-revc.dtb.d.dtc.tmp arch/arm/dts/.dra72-evm-revc.dtb.dts.tmp ; cat arch/arm/dts/.dra72-evm-revc.dtb.d.pre.tmp arch/arm/dts/.dra72-evm-revc.dtb.d.dtc.tmp > arch/arm/dts/.dra72-evm-revc.dtb.d
  mkdir -p arch/arm/dts/ ; (cat arch/arm/dts/dra71-evm.dts; echo '#include "dra71-evm-u-boot.dtsi"') > arch/arm/dts/.dra71-evm.dtb.pre.tmp; /home/thomas/projets/buildroot/output/host/bin/arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/dts/.dra71-evm.dtb.d.pre.tmp -nostdinc -I./arch/arm/dts -I./arch/arm/dts/include -Iinclude -I./include -I./arch/arm/include -include ./include/linux/kconfig.h -D__ASSEMBLY__ -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/dts/.dra71-evm.dtb.dts.tmp arch/arm/dts/.dra71-evm.dtb.pre.tmp ; ./scripts/dtc/dtc -O dtb -o arch/arm/dts/dra71-evm.dtb -b 0 -i arch/arm/dts/  -Wno-unit_address_vs_reg -Wno-simple_bus_reg -Wno-unit_address_format -Wno-pci_bridge -Wno-pci_device_bus_num -Wno-pci_device_reg  -d arch/arm/dts/.dra71-evm.dtb.d.dtc.tmp arch/arm/dts/.dra71-evm.dtb.dts.tmp ; cat arch/arm/dts/.dra71-evm.dtb.d.pre.tmp arch/arm/dts/.dra71-evm.dtb.d.dtc.tmp > arch/arm/dts/.dra71-evm.dtb.d
  mkdir -p arch/arm/dts/ ; (cat arch/arm/dts/dra76-evm.dts; echo '#include "dra76-evm-u-boot.dtsi"') > arch/arm/dts/.dra76-evm.dtb.pre.tmp; /home/thomas/projets/buildroot/output/host/bin/arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/dts/.dra76-evm.dtb.d.pre.tmp -nostdinc -I./arch/arm/dts -I./arch/arm/dts/include -Iinclude -I./include -I./arch/arm/include -include ./include/linux/kconfig.h -D__ASSEMBLY__ -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/dts/.dra76-evm.dtb.dts.tmp arch/arm/dts/.dra76-evm.dtb.pre.tmp ; ./scripts/dtc/dtc -O dtb -o arch/arm/dts/dra76-evm.dtb -b 0 -i arch/arm/dts/  -Wno-unit_address_vs_reg -Wno-simple_bus_reg -Wno-unit_address_format -Wno-pci_bridge -Wno-pci_device_bus_num -Wno-pci_device_reg  -d arch/arm/dts/.dra76-evm.dtb.d.dtc.tmp arch/arm/dts/.dra76-evm.dtb.dts.tmp ; cat arch/arm/dts/.dra76-evm.dtb.d.pre.tmp arch/arm/dts/.dra76-evm.dtb.d.dtc.tmp > arch/arm/dts/.dra76-evm.dtb.d

$ ls -l output/build/uboot-2018.07/scripts/dtc/dtc
-rwxr-xr-x 1 thomas thomas 132704 Jul 28 21:37 output/build/uboot-2018.07/scripts/dtc/dtc

Could you provide more details about which configuration is causing
problem ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
