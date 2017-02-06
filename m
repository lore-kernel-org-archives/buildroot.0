From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 6 Feb 2017 21:56:31 +0100
Subject: [Buildroot] [RFC 1/1] zynq-custom-fpga: new package
In-Reply-To: <1485273729-11541-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1485273729-11541-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <11a78ea4-0887-c3a1-6f2e-3902e8429ef3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Le 24/01/2017 ? 17:02, Matt Weber a ?crit :
> This package adds the support for custom ps init files from
> the Vivado hdf handoff file.
> 
> The package retrieves the hdf from a defconfig defined
> git/svn repository.
> 
> Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
> 
> The uboot patches below are actively being worked and we're planning
> to submit this patchset when they are no longer required.
> 
> We are at a point of encouraging any feedback from other Zynq users
> as this really unifies the workflow and we'd like to get it
> upstreamed/consistant.
> 
> ---
>  ...01-psu_init_gpl.c-Fixed-compilation-error.patch |  49 ++++++
>  ...zynqmp-Generate-handoff-structure-for-ATF.patch | 174 +++++++++++++++++++++
>  package/Config.in                                  |   1 +
>  package/zynq-custom-fpga/Config.in                 | 119 ++++++++++++++
>  package/zynq-custom-fpga/zynq-custom-fpga.mk       |  89 +++++++++++
>  5 files changed, 432 insertions(+)
>  create mode 100644 boot/uboot/xilinx-v2016.3/0001-psu_init_gpl.c-Fixed-compilation-error.patch
>  create mode 100644 boot/uboot/xilinx-v2016.3/uboot/0002-ARM64-zynqmp-Generate-handoff-structure-for-ATF.patch
>  create mode 100644 package/zynq-custom-fpga/Config.in
>  create mode 100644 package/zynq-custom-fpga/zynq-custom-fpga.mk
> 
> diff --git a/boot/uboot/xilinx-v2016.3/0001-psu_init_gpl.c-Fixed-compilation-error.patch b/boot/uboot/xilinx-v2016.3/0001-psu_init_gpl.c-Fixed-compilation-error.patch
> new file mode 100644
> index 0000000..b02c99b
> --- /dev/null
> +++ b/boot/uboot/xilinx-v2016.3/0001-psu_init_gpl.c-Fixed-compilation-error.patch
> @@ -0,0 +1,49 @@
> +From b1882cfa6a043c3483bf973e15adc77eed27d69c Mon Sep 17 00:00:00 2001
> +From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> +Date: Thu, 5 Jan 2017 14:47:43 -0600
> +Subject: [PATCH] psu_init_gpl.c: Fixed compilation error
> +
> +This patch removed sleep.h and prog_read function to fix
> +compilation error.
> +
> +NOTE: We have asked on Xilinx forum when they fix this issue in
> +Vivado so we can use psu_init_gpl.c/h files directly without any patch.
> +
> +Forum: https://forums.xilinx.com/t5/Zynq-All-Programmable-SoC/
> +Uboot-compilation-failed-with-vivado-2016-03-generated-psu-init/td-p/742740
> +
> +Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> +---
> + board/xilinx/zynqmp/xilinx_zynqmp_zcu102/psu_init_gpl.c | 9 ---------
> + 1 file changed, 9 deletions(-)
> +
> +diff --git a/board/xilinx/zynqmp/xilinx_zynqmp_zcu102/psu_init_gpl.c b/board/xilinx/zynqmp/xilinx_zynqmp_zcu102/psu_init_gpl.c
> +index fb55cdc..fa9b604 100644
> +--- a/board/xilinx/zynqmp/xilinx_zynqmp_zcu102/psu_init_gpl.c
> ++++ b/board/xilinx/zynqmp/xilinx_zynqmp_zcu102/psu_init_gpl.c
> +@@ -19,7 +19,6 @@
> + ******************************************************************************/ 
> + 
> + #include <xil_io.h>
> +-#include <sleep.h>
> + #include "psu_init_gpl.h"
> + 
> + int mask_pollOnValue(u32 add , u32 mask, u32 value );
> +@@ -39,14 +38,6 @@ static void PSU_Mask_Write (unsigned long offset, unsigned long mask, unsigned l
> + 	Xil_Out32 (offset, RegVal);
> + }
> + 
> +-	void prog_reg (unsigned long addr, unsigned long mask, unsigned long shift, unsigned long value) {
> +-	    int rdata =0;
> +-	    rdata  = Xil_In32(addr);
> +-	    rdata  = rdata & (~mask);
> +-	    rdata  = rdata | (value << shift);
> +-	    Xil_Out32(addr,rdata);
> +-	    } 
> +-
> + unsigned long psu_pll_init_data() {
> + 		// : RPLL INIT
> + 		/*Register : RPLL_CFG @ 0XFF5E0034</p>
> +-- 
> +1.9.1
> +
> diff --git a/boot/uboot/xilinx-v2016.3/uboot/0002-ARM64-zynqmp-Generate-handoff-structure-for-ATF.patch b/boot/uboot/xilinx-v2016.3/uboot/0002-ARM64-zynqmp-Generate-handoff-structure-for-ATF.patch
> new file mode 100644
> index 0000000..826d543
> --- /dev/null
> +++ b/boot/uboot/xilinx-v2016.3/uboot/0002-ARM64-zynqmp-Generate-handoff-structure-for-ATF.patch
> @@ -0,0 +1,174 @@
> +From 509d4b9545d82179d5854eddb928c0055702dc67 Mon Sep 17 00:00:00 2001
> +From: Michal Simek <michal.simek@xilinx.com>
> +Date: Mon, 9 Jan 2017 10:05:16 +0100
> +Subject: [PATCH] ARM64: zynqmp: Generate handoff structure for ATF
> +
> +Xilinx ATF extending options for passing images from BL2(FSBL)
> +to BL31. U-Boot SPL is FSBL replacement that's why it should generate
> +handoff structure the same. Support only one entry which is U-Boot in
> +EL2 itself. When FIT image is adopted structure generate should be data
> +driven.
> +
> +Currently ATF is placing this structure at the beggining of OCM which is
> +rewriting early parts of ATF which should be unused at that time.
> +
> +Upstream-Status: Submitted [ git://git.denx.de/u-boot-microblaze.git ]
> +
> +Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> +---
> + arch/arm/cpu/armv8/zynqmp/Makefile           |  2 +-
> + arch/arm/cpu/armv8/zynqmp/handoff.c          | 87 ++++++++++++++++++++++++++++
> + arch/arm/cpu/armv8/zynqmp/spl.c              |  2 +
> + arch/arm/include/asm/arch-zynqmp/hardware.h  |  9 +++
> + arch/arm/include/asm/arch-zynqmp/sys_proto.h |  2 +
> + 5 files changed, 101 insertions(+), 1 deletion(-)
> + create mode 100644 arch/arm/cpu/armv8/zynqmp/handoff.c
> +
> +diff --git a/arch/arm/cpu/armv8/zynqmp/Makefile b/arch/arm/cpu/armv8/zynqmp/Makefile
> +index be8673a..013f136 100644
> +--- a/arch/arm/cpu/armv8/zynqmp/Makefile
> ++++ b/arch/arm/cpu/armv8/zynqmp/Makefile
> +@@ -9,4 +9,4 @@ obj-y	+= clk.o
> + obj-y	+= cpu.o
> + obj-$(CONFIG_MP)	+= mp.o
> + obj-y	+= slcr.o
> +-obj-$(CONFIG_SPL_BUILD) += spl.o
> ++obj-$(CONFIG_SPL_BUILD) += spl.o handoff.o
> +diff --git a/arch/arm/cpu/armv8/zynqmp/handoff.c b/arch/arm/cpu/armv8/zynqmp/handoff.c
> +new file mode 100644
> +index 0000000..25d6ef3
> +--- /dev/null
> ++++ b/arch/arm/cpu/armv8/zynqmp/handoff.c
> +@@ -0,0 +1,87 @@
> ++/*
> ++ * Copyright 2016 - 2017 Xilinx, Inc.
> ++ *
> ++ * Michal Simek <michal.simek@xilinx.com>
> ++ *
> ++ * SPDX-License-Identifier:	GPL-2.0+
> ++ */
> ++
> ++#include <common.h>
> ++#include <asm/io.h>
> ++#include <asm/arch/hardware.h>
> ++#include <asm/arch/sys_proto.h>
> ++
> ++/*
> ++ * atfhandoffparams
> ++ * Parameter	bitfield	encoding
> ++ * -----------------------------------------------------------------------------
> ++ * Exec State	0	0 -> Aarch64, 1-> Aarch32
> ++ * endianness	1	0 -> LE, 1 -> BE
> ++ * secure (TZ)	2	0 -> Non secure, 1 -> secure
> ++ * EL		3:4	00 -> EL0, 01 -> EL1, 10 -> EL2, 11 -> EL3
> ++ * CPU#		5:6	00 -> A53_0, 01 -> A53_1, 10 -> A53_2, 11 -> A53_3
> ++ */
> ++
> ++#define FSBL_FLAGS_ESTATE_SHIFT		0
> ++#define FSBL_FLAGS_ESTATE_MASK		(1 << FSBL_FLAGS_ESTATE_SHIFT)
> ++#define FSBL_FLAGS_ESTATE_A64		0
> ++#define FSBL_FLAGS_ESTATE_A32		1
> ++
> ++#define FSBL_FLAGS_ENDIAN_SHIFT		1
> ++#define FSBL_FLAGS_ENDIAN_MASK		(1 << FSBL_FLAGS_ENDIAN_SHIFT)
> ++#define FSBL_FLAGS_ENDIAN_LE		0
> ++#define FSBL_FLAGS_ENDIAN_BE		1
> ++
> ++#define FSBL_FLAGS_TZ_SHIFT		2
> ++#define FSBL_FLAGS_TZ_MASK		(1 << FSBL_FLAGS_TZ_SHIFT)
> ++#define FSBL_FLAGS_NON_SECURE		0
> ++#define FSBL_FLAGS_SECURE		1
> ++
> ++#define FSBL_FLAGS_EL_SHIFT		3
> ++#define FSBL_FLAGS_EL_MASK		(3 << FSBL_FLAGS_EL_SHIFT)
> ++#define FSBL_FLAGS_EL0			0
> ++#define FSBL_FLAGS_EL1			1
> ++#define FSBL_FLAGS_EL2			2
> ++#define FSBL_FLAGS_EL3			3
> ++
> ++#define FSBL_FLAGS_CPU_SHIFT		5
> ++#define FSBL_FLAGS_CPU_MASK		(3 << FSBL_FLAGS_CPU_SHIFT)
> ++#define FSBL_FLAGS_A53_0		0
> ++#define FSBL_FLAGS_A53_1		1
> ++#define FSBL_FLAGS_A53_2		2
> ++#define FSBL_FLAGS_A53_3		3
> ++
> ++#define FSBL_MAX_PARTITIONS		8
> ++
> ++/* Structure corresponding to each partition entry */
> ++struct xfsbl_partition {
> ++	uint64_t entry_point;
> ++	uint64_t flags;
> ++};
> ++
> ++/* Structure for handoff parameters to ARM Trusted Firmware (ATF) */
> ++struct xfsbl_atf_handoff_params {
> ++	uint8_t magic[4];
> ++	uint32_t num_entries;
> ++	struct xfsbl_partition partition[FSBL_MAX_PARTITIONS];
> ++};
> ++
> ++#ifdef CONFIG_SPL_OS_BOOT
> ++void handoff_setup(void)
> ++{
> ++	struct xfsbl_atf_handoff_params *atfhandoffparams;
> ++
> ++	atfhandoffparams = (void *)CONFIG_SPL_TEXT_BASE;
> ++	atfhandoffparams->magic[0] = 'X';
> ++	atfhandoffparams->magic[1] = 'L';
> ++	atfhandoffparams->magic[2] = 'N';
> ++	atfhandoffparams->magic[3] = 'X';
> ++
> ++	atfhandoffparams->num_entries = 1;
> ++	atfhandoffparams->partition[0].entry_point = CONFIG_SYS_TEXT_BASE;
> ++	atfhandoffparams->partition[0].flags = FSBL_FLAGS_EL2 <<
> ++					       FSBL_FLAGS_EL_SHIFT;
> ++
> ++	writel(CONFIG_SPL_TEXT_BASE, &pmu_base->gen_storage6);
> ++}
> ++#endif
> +diff --git a/arch/arm/cpu/armv8/zynqmp/spl.c b/arch/arm/cpu/armv8/zynqmp/spl.c
> +index f5f550f..0a5f430 100644
> +--- a/arch/arm/cpu/armv8/zynqmp/spl.c
> ++++ b/arch/arm/cpu/armv8/zynqmp/spl.c
> +@@ -128,6 +128,8 @@ __weak void psu_init(void)
> + #ifdef CONFIG_SPL_OS_BOOT
> + int spl_start_uboot(void)
> + {
> ++	handoff_setup();
> ++
> + 	return 0;
> + }
> + #endif
> +diff --git a/arch/arm/include/asm/arch-zynqmp/hardware.h b/arch/arm/include/asm/arch-zynqmp/hardware.h
> +index 041b43c..cf187f3 100644
> +--- a/arch/arm/include/asm/arch-zynqmp/hardware.h
> ++++ b/arch/arm/include/asm/arch-zynqmp/hardware.h
> +@@ -144,4 +144,13 @@ struct csu_regs {
> + 
> + #define csu_base ((struct csu_regs *)ZYNQMP_CSU_BASEADDR)
> + 
> ++#define ZYNQMP_PMU_BASEADDR	0xFFD80000
> ++
> ++struct pmu_regs {
> ++	u32 reserved[18];
> ++	u32 gen_storage6; /* 0x48 */
> ++};
> ++
> ++#define pmu_base ((struct pmu_regs *)ZYNQMP_PMU_BASEADDR)
> ++
> + #endif /* _ASM_ARCH_HARDWARE_H */
> +diff --git a/arch/arm/include/asm/arch-zynqmp/sys_proto.h b/arch/arm/include/asm/arch-zynqmp/sys_proto.h
> +index 95fd91d..8c54fce 100644
> +--- a/arch/arm/include/asm/arch-zynqmp/sys_proto.h
> ++++ b/arch/arm/include/asm/arch-zynqmp/sys_proto.h
> +@@ -21,4 +21,6 @@ unsigned int zynqmp_get_silicon_version(void);
> + 
> + void psu_init(void);
> + 
> ++void handoff_setup(void);
> ++
> + #endif /* _ASM_ARCH_SYS_PROTO_H */
> +-- 
> +1.9.1
> +
> diff --git a/package/Config.in b/package/Config.in
> index 8c8c33e..69b1a7a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -341,6 +341,7 @@ menu "Firmware"
>  	source "package/ux500-firmware/Config.in"
>  	source "package/wilc1000-firmware/Config.in"
>  	source "package/zd1211-firmware/Config.in"
> +	source "package/zynq-custom-fpga/Config.in"
>  endmenu
>  	source "package/a10disp/Config.in"
>  	source "package/acpica/Config.in"
> diff --git a/package/zynq-custom-fpga/Config.in b/package/zynq-custom-fpga/Config.in
> new file mode 100644
> index 0000000..3b8e926
> --- /dev/null
> +++ b/package/zynq-custom-fpga/Config.in
> @@ -0,0 +1,119 @@
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA
> +	bool "zynq-custom-fpga"
> +	help
> +	  This package provides a method to take in a Xilinx Vivado FPGA
> +	  Hardware Definition File (.hdf) and use it to customize the U-Boot SPL
> +	  as well as include the FPGA BIT file as part of the build system output.
> +	  NOTE:Assumes that the hdf file is located in the root of the git/svn
> +	  repository path provided.
> +
> +if BR2_PACKAGE_ZYNQ_CUSTOM_FPGA
> +choice
> +	prompt "URL to HDF"
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_GIT
> +	bool "Custom Git repository"
> +	help
> +	  This option allows Buildroot to get the hdf file from a Git repository.
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_SVN
> +	bool "Custom SVN repository"
> +	help
> +	  This option allows Buildroot to get the hdf file from a Svn repository.
> +endchoice
> +
> +if BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_GIT || BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_SVN
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_REPO_URL
> +	string "URL of custom repository"
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_REPO_VERSION
> +	string "Custom repository version"
> +	help
> +	  Revision to use in the typical format used by Git/Svn
> +	  E.G. tag,branch, ...
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_NAME
> +	string "HDF name"
> +	default "zynq_custom"
> +	help
> +	  Name of the HDF file to use, without the trailing .hdf.
> +	  eg. If your hdf file name is different than default "zynq_custom"
> +	  on git/svn repo then change name.
> +	  (e.g If git repo. has 'test.hdf' then write 'test')
> +
> +	  Note: fpga bit file name should be same as hdf file.
> +endif
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_UBOOT_SPL
> +	bool "U-Boot SPL Support"
> +	help
> +	  This option enables the use of custom ps*_gpl* files within the
> +	  uboot build to create the uboot-spl image.
> +
> +if BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_UBOOT_SPL
> +choice
> +	prompt "Xilinx board"
> +	default BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZCU102
> +	help
> +	  Select the board to install the ps*_gpl* files for in uboot.
> +	  e.g. board/xilinx/[zynq|zynqmp]/${..}/
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZC1751_DC1
> +	bool "zynqmp-zc1751-xm015-dc1"
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZC1751_DC2
> +	bool "zynqmp-zc1751-xm016-dc2"
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZC1751_DC3
> +	bool "zynqmp-zc1751-xm017-dc3"
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZC1751_DC4
> +	bool "zynqmp-zc1751-xm018-dc4"
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZC1751_DC5
> +	bool "zynqmp-zc1751-xm019-dc5"
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZCU102
> +	bool "zynqmp-zcu102"
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZCU100
> +	bool "zynqmp-zcu100"
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_EP
> +	bool "zynqmp-ep"
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZC706
> +	bool "zynq-zc706"
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZED
> +	bool "zynq-zed"
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZYBO
> +	bool "zynq-zybo"
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_MICROZED
> +	bool "zynq-microzed"
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_CUSTOM_BOARD
> +	bool "Custom board"
> +
> +endchoice
> +if BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_CUSTOM_BOARD
> +
> +config BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_BOARD
> +	string "Custom board"
> +	default "[zynq|zynqmp]/custom-board"
> +	help
> +	  Path of the custom-board to install the ps*_gpl* files for in uboot.
> +	  (e.g. [zynq|zynqmp]/custom-board)
> +
> +	  NOTE: Please make sure that provided custom-board folder exists in uboot
> +	  source code (board/xilinx/[zynq|zynqmp]/custom-board).
> +	  (e.g: zynq soc board: Use "zynq/custom-board"
> +	        zynqmp soc board: Use "zynqmp/custom-board".)
> +
> +endif
> +
> +endif
> +
> +endif
> diff --git a/package/zynq-custom-fpga/zynq-custom-fpga.mk b/package/zynq-custom-fpga/zynq-custom-fpga.mk
> new file mode 100644
> index 0000000..e9b3f06
> --- /dev/null
> +++ b/package/zynq-custom-fpga/zynq-custom-fpga.mk
> @@ -0,0 +1,89 @@
> +###############################################################################
> +#
> +#	zynq-custom-fpga
> +#
> +###############################################################################
> +
> +
> +#
> +# Check Git repo options
> +#
> +ifeq ($(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_GIT),y)
> +ifeq ($(call qstrip,$(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_REPO_URL)),)
> +$(error No custom Zynq custom fpga hdf repository URL specified. Check your BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_REPO_URL setting)
> +endif #qstrip BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_REPO_URL
> +ifeq ($(call qstrip,$(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_REPO_VERSION)),)
> + $(error No custom Zynq custom fpga hdf repository URL specified. Check your BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_REPO_VERSION setting)
> +endif # qstrip BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_REPO_VERSION
> +endif # BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_GIT
> +
> +ifeq ($(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_GIT),y)
> +ZYNQ_CUSTOM_FPGA_SITE = $(call qstrip,$(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_REPO_URL))
> +ZYNQ_CUSTOM_FPGA_SITE_METHOD = git
> +ZYNQ_CUSTOM_FPGA_VERSION = $(call qstrip,$(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_REPO_VERSION))
> +else ifeq ($(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_SVN),y)
> +ZYNQ_CUSTOM_FPGA_SITE = $(call qstrip,$(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_REPO_URL))
> +ZYNQ_CUSTOM_FPGA_SITE_METHOD = svn
> +ZYNQ_CUSTOM_FPGA_VERSION = $(call qstrip,$(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_REPO_VERSION))
> +endif
> +
> +
> +ZYNQ_CUSTOM_FPGA_LICENSE = GPLv2+
> +ZYNQ_CUSTOM_FPGA_LICENSE_FILES = COPYING

Without any upsteam URL how can we check the license ?

> +ZYNQ_CUSTOM_FPGA_INSTALL_IMAGES = YES
> +
> +
> +define ZYNQ_CUSTOM_FPGA_EXTRACT_HDF
> +	unzip $(@D)/$(ZYNQ_CUSTOM_FPGA_HDF_FILE) -d $(@D)
> +endef
> +
> +ZYNQ_CUSTOM_FPGA_POST_EXTRACT_HOOKS += ZYNQ_CUSTOM_FPGA_EXTRACT_HDF
> +
> +define ZYNQ_CUSTOM_FPGA_COPY_INIT
> +	$(INSTALL) -m 0644 $(ZYNQ_CUSTOM_FPGA_DIR)/ps*_gpl* \
> +		$(@D)/board/xilinx/$(ZYNQ_CUSTOM_FPGA_BOARD_FOLDER)
> +endef
> +
> +ZYNQ_CUSTOM_FPGA_PREFIX = $(call qstrip,$(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_HDF_NAME))
> +ZYNQ_CUSTOM_FPGA_BIT_FILE = $(ZYNQ_CUSTOM_FPGA_PREFIX).bit
> +ZYNQ_CUSTOM_FPGA_HDF_FILE = $(ZYNQ_CUSTOM_FPGA_PREFIX).hdf
> +
> +ifeq  ($(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_UBOOT_SPL),y)
> +UBOOT_DEPENDENCIES += zynq-custom-fpga
> +UBOOT_POST_EXTRACT_HOOKS += ZYNQ_CUSTOM_FPGA_COPY_INIT

Modifying uboot dependencies and hooks in zynq-custom-fpga is not a good
practice actually.

I would recommend to create a u-boot fork for zynq FPGA providing all specific
uboot files instead of creating the zync-custom-fpga package.

Best regards,
Romain


> +ifeq ($(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZC1751_DC1), y)
> +ZYNQ_CUSTOM_FPGA_BOARD_FOLDER = zynqmp/xilinx_zynqmp_zc1751_xm015_dc1
> +else ifeq ($(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZC1751_DC2), y)
> +ZYNQ_CUSTOM_FPGA_BOARD_FOLDER = zynqmp/xilinx_zynqmp_zc1751_xm016_dc2
> +else ifeq ($(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZC1751_DC3), y)
> +ZYNQ_CUSTOM_FPGA_BOARD_FOLDER = zynqmp/xilinx_zynqmp_zc1751_xm017_dc3
> +else ifeq ($(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZC1751_DC4), y)
> +ZYNQ_CUSTOM_FPGA_BOARD_FOLDER = zynqmp/xilinx_zynqmp_zc1751_xm018_dc4
> +else ifeq ($(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZC1751_DC5), y)
> +ZYNQ_CUSTOM_FPGA_BOARD_FOLDER = zynqmp/xilinx_zynqmp_zc1751_xm019_dc5
> +else ifeq ($(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZCU102), y)
> +ZYNQ_CUSTOM_FPGA_BOARD_FOLDER = zynqmp/xilinx_zynqmp_zcu102
> +else ifeq ($(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZCU100), y)
> +ZYNQ_CUSTOM_FPGA_BOARD_FOLDER = zynqmp/xilinx_zynqmp_zcu100
> +else ifeq ($(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_EP), y)
> +ZYNQ_CUSTOM_FPGA_BOARD_FOLDER = zynqmp/xilinx_zynqmp_ep
> +else ifeq ($(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZC706), y)
> +ZYNQ_CUSTOM_FPGA_BOARD_FOLDER = zynq/zynq-zc706
> +else ifeq ($(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZED), y)
> +ZYNQ_CUSTOM_FPGA_BOARD_FOLDER = zynq/zynq-zed
> +else ifeq ($(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_ZYBO), y)
> +ZYNQ_CUSTOM_FPGA_BOARD_FOLDER = zynq/zynq-zybo
> +else ifeq ($(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_MICROZED), y)
> +ZYNQ_CUSTOM_FPGA_BOARD_FOLDER = zynq/zynq-microzed
> +else
> +ZYNQ_CUSTOM_FPGA_BOARD_FOLDER = $(call qstrip,$(BR2_PACKAGE_ZYNQ_CUSTOM_FPGA_BOARD))
> +endif
> +endif
> +
> +define ZYNQ_CUSTOM_FPGA_INSTALL_IMAGES_CMDS
> +	if test -f  $(@D)/$(ZYNQ_CUSTOM_FPGA_BIT_FILE) ; then \
> +		$(INSTALL) -m 0644 $(@D)/$(ZYNQ_CUSTOM_FPGA_BIT_FILE) $(BINARIES_DIR)/fpga.bit ; \
> +	fi
> +endef
> +
> +$(eval $(generic-package))
> 
