From: Oleksandr G Zhadan <oleks@arcturusnetworks.com>
Date: Tue, 12 Jul 2016 09:12:38 -0400
Subject: [Buildroot] [PATCH v2 1/1] Arcturus uCP1020 BSP support.
In-Reply-To: <1468247442-6923-1-git-send-email-arcsupport@arcturusnetworks.com>
References: <1468247442-6923-1-git-send-email-arcsupport@arcturusnetworks.com>
Message-ID: <175f7bda-dca6-c61d-75db-3e746f9a8c99@arcturusnetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tomas,

Thank you you for your previous comments and suggestions.
This new fixed version is the "minimalist" patch we can do :).

Oleks


On 07/11/2016 10:30 AM, Oleksandr G Zhadan wrote:
> From: Oleksandr G Zhadan <oleks@arcturusnetworks.com>
>
> The uCP1020 product family (ucp1020) is an Arcturus Networks Inc.
> System on Modules product featuring a Freescale P1020 CPU,
> optionally populated with 1 or 2 Gig-Ethernet PHYs,
> DDR3, NOR Flash, eMMC NAND Flash and/or SPI Flash.
>
> Signed-off-by: Oleksandr Zhadan <arcsupport@arcturusnetworks.com>
> Signed-off-by: Michael Durrant <arcsupport@arcturusnetworks.com>
> ---
>   .../ppc-ucp1020/configs/linux-4.1.x.config         | 269 ++++++++++++
>   .../linux/0001-Arcturus-uCP1020-BSP-support.patch  | 469 +++++++++++++++++++++
>   .../0002-sdhci-esdhc-fix-wrong-definition.patch    |  28 ++
>   board/arcturus/ppc-ucp1020/readme.txt              |  73 ++++
>   configs/arcturus_ucp1020_defconfig                 |  29 ++
>   5 files changed, 868 insertions(+)
>   create mode 100644 board/arcturus/ppc-ucp1020/configs/linux-4.1.x.config
>   create mode 100644 board/arcturus/ppc-ucp1020/patches/linux/0001-Arcturus-uCP1020-BSP-support.patch
>   create mode 100644 board/arcturus/ppc-ucp1020/patches/linux/0002-sdhci-esdhc-fix-wrong-definition.patch
>   create mode 100644 board/arcturus/ppc-ucp1020/readme.txt
>   create mode 100644 configs/arcturus_ucp1020_defconfig
>
> diff --git a/board/arcturus/ppc-ucp1020/configs/linux-4.1.x.config b/board/arcturus/ppc-ucp1020/configs/linux-4.1.x.config
> new file mode 100644
> index 0000000..a371df8
> --- /dev/null
> +++ b/board/arcturus/ppc-ucp1020/configs/linux-4.1.x.config
> @@ -0,0 +1,269 @@
> +CONFIG_PPC_85xx=y
> +CONFIG_SMP=y
> +CONFIG_NR_CPUS=2
> +CONFIG_CROSS_COMPILE="powerpc-linux-"
> +CONFIG_LOCALVERSION="-ANI-uCP1020-64EE512"
> +# CONFIG_LOCALVERSION_AUTO is not set
> +CONFIG_DEFAULT_HOSTNAME="uCP1020-64EE512"
> +# CONFIG_SWAP is not set
> +CONFIG_SYSVIPC=y
> +CONFIG_POSIX_MQUEUE=y
> +CONFIG_AUDIT=y
> +CONFIG_NO_HZ_IDLE=y
> +CONFIG_BSD_PROCESS_ACCT=y
> +CONFIG_IKCONFIG=y
> +CONFIG_IKCONFIG_PROC=y
> +CONFIG_LOG_BUF_SHIFT=14
> +CONFIG_LOG_CPU_MAX_BUF_SHIFT=14
> +CONFIG_SYSFS_DEPRECATED=y
> +CONFIG_BLK_DEV_INITRD=y
> +# CONFIG_RD_BZIP2 is not set
> +# CONFIG_RD_LZMA is not set
> +# CONFIG_RD_XZ is not set
> +# CONFIG_RD_LZO is not set
> +# CONFIG_RD_LZ4 is not set
> +CONFIG_SYSCTL_SYSCALL=y
> +CONFIG_EMBEDDED=y
> +# CONFIG_SLUB_DEBUG is not set
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_JUMP_LABEL=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +CONFIG_MODULE_FORCE_UNLOAD=y
> +# CONFIG_BLK_DEV_BSG is not set
> +CONFIG_PARTITION_ADVANCED=y
> +CONFIG_MAC_PARTITION=y
> +# CONFIG_EFI_PARTITION is not set
> +# CONFIG_IOSCHED_CFQ is not set
> +CONFIG_UCP1020_SOM=y
> +CONFIG_HIGHMEM=y
> +CONFIG_PREEMPT=y
> +# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> +CONFIG_MATH_EMULATION=y
> +CONFIG_MATH_EMULATION_HW_UNIMPLEMENTED=y
> +CONFIG_SWIOTLB=y
> +# CONFIG_COMPACTION is not set
> +CONFIG_PCI=y
> +CONFIG_PCIEPORTBUS=y
> +# CONFIG_PCIEAER is not set
> +# CONFIG_PCIEASPM is not set
> +CONFIG_PCI_MSI=y
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_XFRM_USER=y
> +CONFIG_NET_KEY=y
> +CONFIG_INET=y
> +CONFIG_IP_MULTICAST=y
> +CONFIG_SYN_COOKIES=y
> +# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> +# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> +# CONFIG_INET_XFRM_MODE_BEET is not set
> +# CONFIG_INET_LRO is not set
> +# CONFIG_IPV6 is not set
> +CONFIG_NETFILTER=y
> +CONFIG_BRIDGE_NETFILTER=y
> +CONFIG_NF_CONNTRACK=y
> +CONFIG_NF_CONNTRACK_FTP=y
> +CONFIG_NETFILTER_XT_TARGET_CONNMARK=y
> +CONFIG_NETFILTER_XT_TARGET_MARK=y
> +CONFIG_NETFILTER_XT_MATCH_COMMENT=y
> +CONFIG_NETFILTER_XT_MATCH_CONNMARK=y
> +CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
> +CONFIG_NETFILTER_XT_MATCH_HELPER=y
> +CONFIG_NETFILTER_XT_MATCH_MARK=y
> +CONFIG_NETFILTER_XT_MATCH_MULTIPORT=y
> +CONFIG_NETFILTER_XT_MATCH_STATE=y
> +CONFIG_NF_CONNTRACK_IPV4=y
> +CONFIG_IP_NF_IPTABLES=y
> +CONFIG_IP_NF_FILTER=y
> +CONFIG_IP_NF_TARGET_REJECT=y
> +CONFIG_IP_NF_NAT=y
> +CONFIG_IP_NF_TARGET_MASQUERADE=y
> +CONFIG_IP_NF_TARGET_NETMAP=y
> +CONFIG_IP_NF_TARGET_REDIRECT=y
> +CONFIG_IP_NF_MANGLE=y
> +CONFIG_BRIDGE=y
> +CONFIG_VLAN_8021Q=y
> +CONFIG_NET_SCHED=y
> +CONFIG_NET_SCH_HTB=y
> +CONFIG_CFG80211=y
> +# CONFIG_CFG80211_DEFAULT_PS is not set
> +CONFIG_MAC80211=y
> +# CONFIG_MAC80211_RC_MINSTREL is not set
> +CONFIG_UEVENT_HELPER_PATH="/bin/hotplug"
> +CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
> +CONFIG_MTD=y
> +CONFIG_MTD_CMDLINE_PARTS=y
> +CONFIG_MTD_BLOCK=y
> +CONFIG_FTL=y
> +CONFIG_MTD_CFI=y
> +CONFIG_MTD_CFI_INTELEXT=y
> +CONFIG_MTD_CFI_AMDSTD=y
> +CONFIG_MTD_PHYSMAP_OF=y
> +CONFIG_MTD_M25P80=y
> +CONFIG_MTD_SST25L=y
> +CONFIG_MTD_NAND=y
> +CONFIG_MTD_NAND_PLATFORM=y
> +CONFIG_MTD_NAND_FSL_ELBC=y
> +CONFIG_MTD_NAND_FSL_UPM=y
> +CONFIG_MTD_SPI_NOR=y
> +CONFIG_BLK_DEV_LOOP=y
> +CONFIG_BLK_DEV_RAM=y
> +CONFIG_BLK_DEV_RAM_SIZE=131072
> +CONFIG_EEPROM_AT25=y
> +CONFIG_SCSI=y
> +CONFIG_BLK_DEV_SD=y
> +CONFIG_CHR_DEV_ST=y
> +CONFIG_BLK_DEV_SR=y
> +CONFIG_CHR_DEV_SG=y
> +CONFIG_SCSI_LOGGING=y
> +CONFIG_NETDEVICES=y
> +# CONFIG_NET_VENDOR_3COM is not set
> +# CONFIG_NET_VENDOR_ADAPTEC is not set
> +# CONFIG_NET_VENDOR_AGERE is not set
> +# CONFIG_NET_VENDOR_ALTEON is not set
> +# CONFIG_NET_VENDOR_AMD is not set
> +# CONFIG_NET_VENDOR_ARC is not set
> +# CONFIG_NET_VENDOR_ATHEROS is not set
> +# CONFIG_NET_CADENCE is not set
> +# CONFIG_NET_VENDOR_BROADCOM is not set
> +# CONFIG_NET_VENDOR_BROCADE is not set
> +# CONFIG_NET_VENDOR_CHELSIO is not set
> +# CONFIG_NET_VENDOR_CISCO is not set
> +# CONFIG_NET_VENDOR_DEC is not set
> +# CONFIG_NET_VENDOR_DLINK is not set
> +# CONFIG_NET_VENDOR_EMULEX is not set
> +# CONFIG_NET_VENDOR_EXAR is not set
> +CONFIG_GIANFAR=y
> +# CONFIG_NET_VENDOR_HP is not set
> +# CONFIG_NET_VENDOR_INTEL is not set
> +# CONFIG_NET_VENDOR_MARVELL is not set
> +# CONFIG_NET_VENDOR_MELLANOX is not set
> +# CONFIG_NET_VENDOR_MICREL is not set
> +# CONFIG_NET_VENDOR_MICROCHIP is not set
> +# CONFIG_NET_VENDOR_MYRI is not set
> +# CONFIG_NET_VENDOR_NATSEMI is not set
> +# CONFIG_NET_VENDOR_NVIDIA is not set
> +# CONFIG_NET_VENDOR_OKI is not set
> +# CONFIG_NET_PACKET_ENGINE is not set
> +# CONFIG_NET_VENDOR_QLOGIC is not set
> +# CONFIG_NET_VENDOR_QUALCOMM is not set
> +# CONFIG_NET_VENDOR_REALTEK is not set
> +# CONFIG_NET_VENDOR_RDC is not set
> +# CONFIG_NET_VENDOR_ROCKER is not set
> +# CONFIG_NET_VENDOR_SAMSUNG is not set
> +# CONFIG_NET_VENDOR_SEEQ is not set
> +# CONFIG_NET_VENDOR_SILAN is not set
> +# CONFIG_NET_VENDOR_SIS is not set
> +# CONFIG_NET_VENDOR_SMSC is not set
> +# CONFIG_NET_VENDOR_STMICRO is not set
> +# CONFIG_NET_VENDOR_SUN is not set
> +# CONFIG_NET_VENDOR_TEHUTI is not set
> +# CONFIG_NET_VENDOR_TI is not set
> +# CONFIG_NET_VENDOR_VIA is not set
> +# CONFIG_NET_VENDOR_WIZNET is not set
> +# CONFIG_NET_VENDOR_XILINX is not set
> +CONFIG_MICREL_PHY=y
> +CONFIG_IWLWIFI=m
> +# CONFIG_INPUT_MOUSEDEV is not set
> +# CONFIG_INPUT_KEYBOARD is not set
> +# CONFIG_INPUT_MOUSE is not set
> +CONFIG_SERIO_LIBPS2=y
> +CONFIG_LEGACY_PTY_COUNT=16
> +CONFIG_NOZOMI=y
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_NR_UARTS=2
> +CONFIG_SERIAL_8250_RUNTIME_UARTS=2
> +CONFIG_SERIAL_8250_MANY_PORTS=y
> +CONFIG_SERIAL_8250_DETECT_IRQ=y
> +CONFIG_SERIAL_8250_RSA=y
> +CONFIG_NVRAM=y
> +CONFIG_I2C_CHARDEV=y
> +CONFIG_I2C_MPC=y
> +CONFIG_SPI=y
> +CONFIG_SPI_BITBANG=y
> +CONFIG_SPI_FSL_ESPI=y
> +CONFIG_SPI_SPIDEV=y
> +CONFIG_GPIOLIB=y
> +CONFIG_GPIO_MPC8XXX=y
> +CONFIG_SENSORS_LM90=y
> +CONFIG_THERMAL=y
> +CONFIG_WATCHDOG=y
> +CONFIG_BOOKE_WDT=y
> +CONFIG_BOOKE_WDT_DEFAULT_TIMEOUT=36
> +CONFIG_MEDIA_SUPPORT=y
> +CONFIG_MEDIA_CAMERA_SUPPORT=y
> +CONFIG_MEDIA_CONTROLLER=y
> +CONFIG_VIDEO_V4L2_SUBDEV_API=y
> +CONFIG_MEDIA_USB_SUPPORT=y
> +CONFIG_USB_VIDEO_CLASS=y
> +CONFIG_USB_GSPCA=y
> +CONFIG_USB_PWC=y
> +CONFIG_USB_ZR364XX=y
> +CONFIG_USB_STKWEBCAM=y
> +CONFIG_VIDEO_EM28XX=y
> +CONFIG_VIDEO_EM28XX_V4L2=y
> +# CONFIG_HID is not set
> +# CONFIG_USB_HID is not set
> +CONFIG_USB=y
> +CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
> +CONFIG_USB_DYNAMIC_MINORS=y
> +CONFIG_USB_MON=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_EHCI_FSL=y
> +CONFIG_USB_ACM=y
> +CONFIG_USB_WDM=y
> +CONFIG_USB_TMC=y
> +CONFIG_USB_STORAGE=y
> +CONFIG_USB_STORAGE_DEBUG=y
> +CONFIG_USB_MDC800=y
> +CONFIG_MMC=y
> +CONFIG_MMC_SDHCI=y
> +CONFIG_MMC_SDHCI_PLTFM=y
> +CONFIG_MMC_SDHCI_OF_ESDHC=y
> +CONFIG_DMADEVICES=y
> +CONFIG_FSL_DMA=y
> +CONFIG_ASYNC_TX_DMA=y
> +# CONFIG_IOMMU_SUPPORT is not set
> +CONFIG_EXT2_FS=y
> +CONFIG_EXT3_FS=y
> +# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
> +# CONFIG_EXT3_FS_XATTR is not set
> +CONFIG_EXT4_FS=y
> +CONFIG_XFS_FS=y
> +CONFIG_MSDOS_FS=y
> +CONFIG_VFAT_FS=y
> +CONFIG_NTFS_FS=y
> +CONFIG_PROC_KCORE=y
> +CONFIG_TMPFS=y
> +CONFIG_JFFS2_FS=y
> +CONFIG_JFFS2_FS_WBUF_VERIFY=y
> +CONFIG_JFFS2_SUMMARY=y
> +CONFIG_JFFS2_FS_XATTR=y
> +CONFIG_JFFS2_COMPRESSION_OPTIONS=y
> +CONFIG_JFFS2_LZO=y
> +CONFIG_JFFS2_RUBIN=y
> +CONFIG_CRAMFS=y
> +CONFIG_NFS_FS=y
> +CONFIG_NFS_V4=y
> +CONFIG_NFSD=y
> +CONFIG_CIFS=y
> +CONFIG_NLS_CODEPAGE_437=y
> +CONFIG_NLS_ISO8859_1=y
> +CONFIG_CRC_T10DIF=y
> +CONFIG_CRC_ITU_T=y
> +# CONFIG_SCHED_DEBUG is not set
> +# CONFIG_DEBUG_PREEMPT is not set
> +# CONFIG_DEBUG_BUGVERBOSE is not set
> +CONFIG_RCU_CPU_STALL_TIMEOUT=60
> +# CONFIG_RCU_CPU_STALL_INFO is not set
> +# CONFIG_FTRACE is not set
> +CONFIG_CRYPTO_CBC=y
> +CONFIG_CRYPTO_PCBC=y
> +CONFIG_CRYPTO_SHA1=y
> +CONFIG_CRYPTO_SHA1_PPC=y
> +CONFIG_CRYPTO_DEFLATE=y
> +# CONFIG_CRYPTO_ANSI_CPRNG is not set
> +CONFIG_CRYPTO_DEV_TALITOS=y
> diff --git a/board/arcturus/ppc-ucp1020/patches/linux/0001-Arcturus-uCP1020-BSP-support.patch b/board/arcturus/ppc-ucp1020/patches/linux/0001-Arcturus-uCP1020-BSP-support.patch
> new file mode 100644
> index 0000000..709322d
> --- /dev/null
> +++ b/board/arcturus/ppc-ucp1020/patches/linux/0001-Arcturus-uCP1020-BSP-support.patch
> @@ -0,0 +1,469 @@
> +From c27eeadb6c6cecbc07b330030c494c226643dcd1 Mon Sep 17 00:00:00 2001
> +From: Oleksandr G Zhadan <arcsupport@arcturusnetworks.com>
> +Date: Fri, 8 Jul 2016 11:02:59 -0400
> +Subject: [PATCH] Arcturus uCP1020 BSP support
> +
> +The uCP1020 product family (ucp1020) is an Arcturus Networks Inc.
> +System on Modules product featuring a NXP QorIQ P1020 CPU,
> +optionally populated with 1 or 2 Gig-Ethernet PHYs,
> +DDR3, NOR Flash, eMMC NAND Flash and/or SPI Flash.
> +
> +Signed-off-by: Oleksandr G Zhadan <arcsupport@arcturusnetworks.com>
> +Signed-off-by: Michael Durrant <arcsupport@arcturusnetworks.com>
> +---
> + arch/powerpc/boot/dts/ucp1020.dts         |  87 ++++++++++++
> + arch/powerpc/boot/dts/ucp1020.dtsi        | 218 ++++++++++++++++++++++++++++++
> + arch/powerpc/platforms/85xx/Kconfig       |   7 +
> + arch/powerpc/platforms/85xx/Makefile      |   1 +
> + arch/powerpc/platforms/85xx/ucp1020_som.c |  92 +++++++++++++
> + 5 files changed, 405 insertions(+)
> + create mode 100644 arch/powerpc/boot/dts/ucp1020.dts
> + create mode 100644 arch/powerpc/boot/dts/ucp1020.dtsi
> + create mode 100644 arch/powerpc/platforms/85xx/ucp1020_som.c
> +
> +diff --git a/arch/powerpc/boot/dts/ucp1020.dts b/arch/powerpc/boot/dts/ucp1020.dts
> +new file mode 100644
> +index 0000000..815533c
> +--- /dev/null
> ++++ b/arch/powerpc/boot/dts/ucp1020.dts
> +@@ -0,0 +1,87 @@
> ++/*
> ++ * uCP1020 Tree Source (32-bit address map)
> ++ *
> ++ * Copyright 2013,2014,2015 Arcturus Networks Inc.
> ++ *
> ++ * Redistribution and use in source and binary forms, with or without
> ++ * modification, are permitted provided that the following conditions are met:
> ++ *     * Redistributions of source code must retain the above copyright
> ++ *       notice, this list of conditions and the following disclaimer.
> ++ *     * Redistributions in binary form must reproduce the above copyright
> ++ *       notice, this list of conditions and the following disclaimer in the
> ++ *       documentation and/or other materials provided with the distribution.
> ++ *     * Neither the name of Freescale Semiconductor nor the
> ++ *       names of its contributors may be used to endorse or promote products
> ++ *       derived from this software without specific prior written permission.
> ++ *
> ++ *
> ++ * ALTERNATIVELY, this software may be distributed under the terms of the
> ++ * GNU General Public License ("GPL") as published by the Free Software
> ++ * Foundation, either version 2 of that License or (at your option) any
> ++ * later version.
> ++ *
> ++ * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor ``AS IS'' AND ANY
> ++ * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
> ++ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
> ++ * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
> ++ * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
> ++ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> ++ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
> ++ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> ++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
> ++ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> ++ */
> ++
> ++/include/ "fsl/p1020si-pre.dtsi"
> ++/ {
> ++	model = "arcturus,uCP1020";
> ++	compatible = "arcturus,uCP1020";
> ++
> ++	memory {
> ++		device_type = "memory";
> ++	};
> ++
> ++	lbc: localbus at ffe05000 {
> ++		reg = <0 0xffe05000 0 0x1000>;
> ++
> ++		/* NOR Flash */
> ++		ranges = <0x0 0x0 0x0 0xec000000 0x04000000>;
> ++	};
> ++
> ++	soc: soc at ffe00000 {
> ++		ranges = <0x0 0x0 0xffe00000 0x100000>;
> ++	};
> ++
> ++	pci0: pcie at ffe09000 {
> ++		ranges = <0x2000000 0x0 0xa0000000 0 0xa0000000 0x0 0x20000000
> ++			  0x1000000 0x0 0x00000000 0 0xffc10000 0x0 0x10000>;
> ++		reg = <0 0xffe09000 0 0x1000>;
> ++		pcie at 0 {
> ++			ranges = <0x2000000 0x0 0xa0000000
> ++				  0x2000000 0x0 0xa0000000
> ++				  0x0 0x20000000
> ++
> ++				  0x1000000 0x0 0x0
> ++				  0x1000000 0x0 0x0
> ++				  0x0 0x100000>;
> ++		};
> ++	};
> ++
> ++	pci1: pcie at ffe0a000 {
> ++		reg = <0 0xffe0a000 0 0x1000>;
> ++		ranges = <0x2000000 0x0 0x80000000 0 0x80000000 0x0 0x20000000
> ++			  0x1000000 0x0 0x00000000 0 0xffc00000 0x0 0x10000>;
> ++		pcie at 0 {
> ++			ranges = <0x2000000 0x0 0x80000000
> ++				  0x2000000 0x0 0x80000000
> ++				  0x0 0x20000000
> ++
> ++				  0x1000000 0x0 0x0
> ++				  0x1000000 0x0 0x0
> ++				  0x0 0x100000>;
> ++		};
> ++	};
> ++};
> ++
> ++/include/ "ucp1020.dtsi"
> ++/include/ "fsl/p1020si-post.dtsi"
> +diff --git a/arch/powerpc/boot/dts/ucp1020.dtsi b/arch/powerpc/boot/dts/ucp1020.dtsi
> +new file mode 100644
> +index 0000000..0bd2868
> +--- /dev/null
> ++++ b/arch/powerpc/boot/dts/ucp1020.dtsi
> +@@ -0,0 +1,218 @@
> ++/*
> ++ * uCP1020 Device Tree Source stub (no addresses or top-level ranges)
> ++ *
> ++ * Copyright 2013,2014,2015 Arcturus Networks Inc.
> ++ *
> ++ * Redistribution and use in source and binary forms, with or without
> ++ * modification, are permitted provided that the following conditions are met:
> ++ *     * Redistributions of source code must retain the above copyright
> ++ *       notice, this list of conditions and the following disclaimer.
> ++ *     * Redistributions in binary form must reproduce the above copyright
> ++ *       notice, this list of conditions and the following disclaimer in the
> ++ *       documentation and/or other materials provided with the distribution.
> ++ *     * Neither the name of Freescale Semiconductor nor the
> ++ *       names of its contributors may be used to endorse or promote products
> ++ *       derived from this software without specific prior written permission.
> ++ *
> ++ *
> ++ * ALTERNATIVELY, this software may be distributed under the terms of the
> ++ * GNU General Public License ("GPL") as published by the Free Software
> ++ * Foundation, either version 2 of that License or (at your option) any
> ++ * later version.
> ++ *
> ++ * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor ``AS IS'' AND ANY
> ++ * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
> ++ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
> ++ * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
> ++ * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
> ++ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> ++ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
> ++ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> ++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
> ++ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> ++ */
> ++
> ++&lbc {
> ++	nor at 0,0 {
> ++		#address-cells = <1>;
> ++		#size-cells = <1>;
> ++		compatible = "cfi-flash";
> ++		reg = <0x0 0x0 0x04000000>;
> ++		bank-width = <2>;
> ++		device-width = <1>;
> ++
> ++		partition at 100000 {
> ++			/* 7MB - PART 0 */
> ++			reg = <0x00100000 0x00700000>;
> ++			label = "0";
> ++		};
> ++
> ++		partition at 800000 {
> ++			/* 32MB - PART 1 */
> ++			reg = <0x0800000 0x02000000>;
> ++			label = "1";
> ++		};
> ++
> ++		partition at 2800000 {
> ++			/* 8MB - PART 2 */
> ++			reg = <0x02800000 0x00800000>;
> ++			label = "2";
> ++		};
> ++
> ++		partition at 3000000 {
> ++			/* (16MB - 512K) - PART 3 JFFS 2 */
> ++			reg = <0x03000000 0x00f80000>;
> ++			label = "3";
> ++		};
> ++
> ++		partition at 0 {
> ++			/* 512KB - bootloader[u-boot, uCbootloader] */
> ++			reg = <0x0 0x00080000>;
> ++			label = "BOOT_SPI";
> ++		};
> ++
> ++		partition at 3f80000 {
> ++			/* 512KB - bootloade NOR r[u-boot, uCbootloader] */
> ++			reg = <0x03f80000 0x00080000>;
> ++			label = "B";
> ++		};
> ++
> ++		partition at 80000 {
> ++			/* 256KB - bootloaders environment (uCenv) */
> ++			reg = <0x00080000 0x00040000>;
> ++	
> ++			label = "E";
> ++		};
> ++
> ++		partition at C0000 {
> ++			/* 256KB - bootloaders environment (u-boot) */
> ++			reg = <0x000C0000 0x00040000>;
> ++			label = "UENV";
> ++		};
> ++	};
> ++};
> ++
> ++&soc {
> ++	i2c at 3000 {
> ++		spoc at 14 {
> ++			compatible = "conexant,cx2070x";
> ++			reg = <0x14>;
> ++		};
> ++	};
> ++
> ++	i2c at 3100 {
> ++			dtt at 4C {
> ++				compatible = "national,lm90";
> ++				reg = <0x4C>;
> ++			};
> ++	};
> ++
> ++	spi at 7000 {
> ++		flash at 0 {
> ++			#address-cells = <1>;
> ++			#size-cells = <1>;
> ++			compatible = "winbond,w25q80bl";
> ++			reg = <0>;
> ++			spi-max-frequency = <40000000>; /* input clock */
> ++
> ++			partition at 0 {
> ++				label = "SPI MBR";
> ++				reg = <0x00000000 0x00002000>;
> ++				read-only;
> ++			};
> ++			partition at 2000 {
> ++				label = "SPI ENV";
> ++				reg = <0x00002000 0x00006000>;
> ++				read-only;
> ++			};
> ++			partition at 8000 {
> ++				label = "SPI FS";
> ++				reg = <0x00008000 0x000F8000>;
> ++			};
> ++		};
> ++		flash at 3 {
> ++			#address-cells = <1>;
> ++			#size-cells = <1>;
> ++			compatible = "spansion,s25fl008k";
> ++			reg = <3>;
> ++			spi-max-frequency = <40000000>; /* input clock */
> ++			partition at 0 {
> ++				label = "SPI USER";
> ++				reg = <0x00000000 0x00100000>;
> ++			};
> ++		};
> ++	};
> ++
> ++	usb at 22000 {
> ++		phy_type = "ulpi";
> ++		dr_mode = "host";
> ++	};
> ++
> ++	mdio at 24000 {
> ++		phy0: ethernet-phy at 4 {
> ++			interrupt-parent = <&mpic>;
> ++			interrupts = <4 1>;
> ++			reg = <0x04>;
> ++		};
> ++
> ++		phy1: ethernet-phy at 6 {
> ++			interrupt-parent = <&mpic>;
> ++			interrupts = <8 1>;
> ++			reg = <0x6>;
> ++		};
> ++	};
> ++
> ++	enet0: ethernet at b0000 {
> ++		phy-handle = <&phy0>;
> ++		phy-connection-type = "rgmii-id";
> ++	};
> ++
> ++	enet1: ethernet at b1000 {
> ++		status = "disabled";
> ++	};
> ++
> ++	enet2: ethernet at b2000 {
> ++		phy-handle = <&phy1>;
> ++		phy-connection-type = "rgmii-id";
> ++	};
> ++
> ++	gpio0: gpio at f000 {
> ++		compatible = "fsl,mpc8572-gpio", "fsl,pq3-gpio";
> ++		reg = <0xf000 0x1000>;
> ++		interrupts = <47 2>;
> ++		interrupt-parent = <&mpic>;
> ++		#gpio-cells = <2>;
> ++		gpio-controller;
> ++	};
> ++
> ++	gpio-leds {
> ++		compatible = "gpio-leds";
> ++		gpio5 {
> ++			label = "led1";		/* LED15 */
> ++			gpios = <&gpio0 5 0>;
> ++		};
> ++		gpio12 {
> ++			label = "led2";		/* LED16 */
> ++			gpios = <&gpio0 12 0>;
> ++		};
> ++		gpio13 {
> ++			label = "led3";		/* LED17 */
> ++			gpios = <&gpio0 13 0>;
> ++		};
> ++		gpio7 {
> ++			label = "led4";		/* LED18 */
> ++			gpios = <&gpio0 7 0>;
> ++		};
> ++		gpio6 {
> ++			label = "led5";		/* LED19 */
> ++			gpios = <&gpio0 6 0>;
> ++		};
> ++	};
> ++/**********
> ++	sdhc at 2e000 {
> ++		cd-gpios = <&gpio0 8 0>;	* card detect *
> ++		wp-gpios = <&gpio0 9 0>;	* write protect *
> ++		wp-inverted;			* WP active high *
> ++	};
> ++***********/
> ++};
> +diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
> +index 2fb4b24..81a944f 100644
> +--- a/arch/powerpc/platforms/85xx/Kconfig
> ++++ b/arch/powerpc/platforms/85xx/Kconfig
> +@@ -241,6 +241,13 @@ config SGY_CTS1000
> + 	help
> + 	  Enable this to support functionality in Servergy's CTS-1000 systems.
> +
> ++config UCP1020_SOM
> ++	bool "Arcturus uCP1020 Rev.1.3 System on Module"
> ++	select DEFAULT_UIMAGE
> ++	help
> ++	  This option enables support for the Arcturus Networks Inc.
> ++	  uCP1020 System on Module.
> ++
> + config MVME2500
> + 	bool "Artesyn MVME2500"
> + 	select DEFAULT_UIMAGE
> +diff --git a/arch/powerpc/platforms/85xx/Makefile b/arch/powerpc/platforms/85xx/Makefile
> +index 1fe7fb9..84f2b9a 100644
> +--- a/arch/powerpc/platforms/85xx/Makefile
> ++++ b/arch/powerpc/platforms/85xx/Makefile
> +@@ -31,4 +31,5 @@ obj-$(CONFIG_XES_MPC85xx) += xes_mpc85xx.o
> + obj-$(CONFIG_GE_IMP3A)	  += ge_imp3a.o
> + obj-$(CONFIG_PPC_QEMU_E500) += qemu_e500.o
> + obj-$(CONFIG_SGY_CTS1000) += sgy_cts1000.o
> ++obj-$(CONFIG_UCP1020_SOM) += ucp1020_som.o
> + obj-$(CONFIG_MVME2500)	  += mvme2500.o
> +diff --git a/arch/powerpc/platforms/85xx/ucp1020_som.c b/arch/powerpc/platforms/85xx/ucp1020_som.c
> +new file mode 100644
> +index 0000000..8b72a01
> +--- /dev/null
> ++++ b/arch/powerpc/platforms/85xx/ucp1020_som.c
> +@@ -0,0 +1,92 @@
> ++/*
> ++ * Arcturus Networks Inc. uCP1020 module Setup
> ++ *
> ++ * Copyright 2014-2015 Arcturus Networks Inc.
> ++ *
> ++ * by Oleksandr G Zhadan & Michael Durrant (www.ArcturusNetworks.com)
> ++ *
> ++ * This program is free software; you can redistribute  it and/or modify it
> ++ * under  the terms of  the GNU General  Public License as published by the
> ++ * Free Software Foundation;  either version 2 of the  License, or (at your
> ++ * option) any later version.
> ++ */
> ++
> ++#include <linux/stddef.h>
> ++#include <linux/kernel.h>
> ++#include <linux/pci.h>
> ++#include <linux/kdev_t.h>
> ++#include <linux/delay.h>
> ++#include <linux/seq_file.h>
> ++#include <linux/interrupt.h>
> ++#include <linux/of_platform.h>
> ++
> ++#include <asm/time.h>
> ++#include <asm/machdep.h>
> ++#include <asm/pci-bridge.h>
> ++#include <mm/mmu_decl.h>
> ++#include <asm/prom.h>
> ++#include <asm/udbg.h>
> ++#include <asm/mpic.h>
> ++#include <asm/fsl_guts.h>
> ++
> ++#include <sysdev/fsl_soc.h>
> ++#include <sysdev/fsl_pci.h>
> ++#include "smp.h"
> ++
> ++#include "mpc85xx.h"
> ++
> ++void __init ucp1020_som_pic_init(void)
> ++{
> ++	struct mpic *mpic = mpic_alloc(NULL, 0, MPIC_BIG_ENDIAN |
> ++	  MPIC_SINGLE_DEST_CPU,
> ++	  0, 256, " OpenPIC  ");
> ++
> ++	BUG_ON(mpic == NULL);
> ++
> ++	mpic_init(mpic);
> ++}
> ++
> ++/*
> ++ * Setup the architecture
> ++ */
> ++static void __init ucp1020_som_setup_arch(void)
> ++{
> ++	if (ppc_md.progress)
> ++		ppc_md.progress("uCP1020_SoM_setup_arch()", 0);
> ++
> ++	mpc85xx_smp_init();
> ++
> ++	fsl_pci_assign_primary();
> ++	pr_info("\n\t%s (http://www.arcturusnetworks.com)\n", ppc_md.name);
> ++}
> ++
> ++machine_arch_initcall(ucp1020, mpc85xx_common_publish_devices);
> ++machine_arch_initcall(ucp1020, swiotlb_setup_bus_notifier);
> ++
> ++/*
> ++ * Called very early, device-tree isn't unflattened
> ++ */
> ++static int __init ucp1020_probe(void)
> ++{
> ++	unsigned long root = of_get_flat_dt_root();
> ++
> ++	if (of_flat_dt_is_compatible(root, "arcturus,uCP1020"))
> ++		return 1;
> ++	return 0;
> ++}
> ++
> ++define_machine(ucp1020) {
> ++	.name			= "uCP1020 SoM - Arcturus Networks Inc.",
> ++	.probe			= ucp1020_probe,
> ++	.setup_arch		= ucp1020_som_setup_arch,
> ++	.init_IRQ		= ucp1020_som_pic_init,
> ++#ifdef CONFIG_PCI
> ++	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
> ++#endif
> ++	.get_irq		= mpic_get_irq,
> ++	.restart		= fsl_rstcr_restart,
> ++	.calibrate_decr		= generic_calibrate_decr,
> ++#ifdef DEBUG
> ++	.progress		= udbg_progress,
> ++#endif
> ++};
> +--
> +2.7.0
> +
> diff --git a/board/arcturus/ppc-ucp1020/patches/linux/0002-sdhci-esdhc-fix-wrong-definition.patch b/board/arcturus/ppc-ucp1020/patches/linux/0002-sdhci-esdhc-fix-wrong-definition.patch
> new file mode 100644
> index 0000000..f7b305b
> --- /dev/null
> +++ b/board/arcturus/ppc-ucp1020/patches/linux/0002-sdhci-esdhc-fix-wrong-definition.patch
> @@ -0,0 +1,28 @@
> +From 7407038fa977c2ff7ec691ecc2bbed5137745818 Mon Sep 17 00:00:00 2001
> +From: Oleksandr G Zhadan <arcsupport@arcturusnetworks.com>
> +Date: Fri, 8 Jul 2016 10:21:09 -0400
> +Subject: [PATCH] sdhci-esdhc fix wrong definition.
> +
> +Without this fix SD/MMC cards doesn't work on p1020.
> +
> +Signed-off-by: Oleksandr G Zhadan <arcsupport@arcturusnetworks.com>
> +Signed-off-by: Michael Durrant <arcsupport@arcturusnetworks.com>
> +---
> + drivers/mmc/host/sdhci-esdhc.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/drivers/mmc/host/sdhci-esdhc.h b/drivers/mmc/host/sdhci-esdhc.h
> +index a870c42..b45de0a 100644
> +--- a/drivers/mmc/host/sdhci-esdhc.h
> ++++ b/drivers/mmc/host/sdhci-esdhc.h
> +@@ -45,6 +45,6 @@
> + #define ESDHC_DMA_SYSCTL	0x40c
> + #define ESDHC_DMA_SNOOP		0x00000040
> +
> +-#define ESDHC_HOST_CONTROL_RES	0x01
> ++#define ESDHC_HOST_CONTROL_RES	(SDHCI_CTRL_HISPD)
> +
> + #endif /* _DRIVERS_MMC_SDHCI_ESDHC_H */
> +--
> +2.7.0
> +
> diff --git a/board/arcturus/ppc-ucp1020/readme.txt b/board/arcturus/ppc-ucp1020/readme.txt
> new file mode 100644
> index 0000000..c46fd80
> --- /dev/null
> +++ b/board/arcturus/ppc-ucp1020/readme.txt
> @@ -0,0 +1,73 @@
> +Arcturus uCP1020 SoM
> +====================
> +
> +This tutorial describes how to use the predefined Buildroot
> +configuration for the Arcturus uCP1020 SoM platform.
> +
> +Additional information about this module can be found at
> +<www.arcturusnetworks.com/products/ucp1020>
> +
> +Building
> +--------
> +
> +  make arcturus_ucp1020_defconfig
> +  make
> +
> +Result of the build
> +-------------------
> +
> +After building, you should obtain this tree:
> +
> +    output/images/
> +    +-- rootfs.jffs2
> +    +-- rootfs.tar
> +    +-- u-boot.bin
> +    +-- ucp1020.dtb
> +    +-- uImage
> +
> +Flashing
> +--------
> +
> +You'll need to program the files created by buildroot into the NOR flash.
> +
> +1. Program the new U-Boot binary (optional)
> +    If you don't feel confident upgrading your bootloader then don't do it,
> +    it's unnecessary most of the time.
> +
> +    B$ tftp u-boot.bin
> +    B$ protect off 0xeff80000 +$filesize
> +    B$ erase 0xeff80000 +$filesize
> +    B$ cp.b $loadaddr 0xeff80000 $filesize
> +
> +2. Program the kernel
> +
> +    B$ tftp uImage
> +    B$ erase 0xec140000 +$filesize
> +    B$ cp.b $loadaddr 0xec140000 $filesize
> +
> +3. Program the DTB
> +
> +    B$ tftp ucp1020.dtb
> +    B$ erase 0xec100000 +$filesize
> +    B$ cp.b $loadaddr 0xec100000 $filesize
> +
> +4. Program the jffs2 root filesystem
> +
> +    B$ tftp rootfs.jffs2
> +    B$ erase 0xec800000 0xee8fffff
> +    B$ cp.b $loadaddr 0xec800000 $filesize
> +
> +5. Booting your new system
> +
> +    B$ setenv norboot 'setenv bootargs root=/dev/mtdblock1 rootfstype=jffs2 console=$consoledev,$baudrate;bootm 0xec140000 - 0xec100000'
> +
> +    If you want to set this boot option as default:
> +
> +    B$ setenv bootcmd 'run norboot'
> +    B$ saveenv
> +
> +    ...or for a single boot:
> +
> +    B$ run norboot
> +
> +Good Luck !
> diff --git a/configs/arcturus_ucp1020_defconfig b/configs/arcturus_ucp1020_defconfig
> new file mode 100644
> index 0000000..e9d04b2
> --- /dev/null
> +++ b/configs/arcturus_ucp1020_defconfig
> @@ -0,0 +1,29 @@
> +# Architecture
> +BR2_powerpc=y
> +BR2_powerpc_8548=y
> +
> +# Linux headers same as kernel, a 4.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
> +
> +# System settings
> +BR2_TARGET_GENERIC_HOSTNAME="UCP1020"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Arcturus uCP1020 System on Module"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_SYSTEM_DHCP="eth0"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.27"
> +BR2_LINUX_KERNEL_PATCH="board/arcturus/ppc-ucp1020/patches/linux"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arcturus/ppc-ucp1020/configs/linux-4.1.x.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="ucp1020"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_JFFS2=y
> +
> +# U-boot
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="UCP1020"


-- 
Oleksandr Zhadan
Arcturus Networks
T 416 621-0125 x235
F 416 621-0190
