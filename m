From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Mon, 1 Feb 2016 12:24:22 +0000
Subject: [Buildroot] [RESEND] [PATCH v7] board: add support for ARM Juno
 Development Board
In-Reply-To: <20160201122047.GR1194@e106497-lin.cambridge.arm.com>
References: <b132a8d9bc9e51f56f7b4a5c0e4c02404aaabd8a.1444647414.git.jpinto@synopsys.com>
 <20160201122047.GR1194@e106497-lin.cambridge.arm.com>
Message-ID: <56AF4E76.3060404@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Liviu,

Thanks for your comments. We had 7 iterations for the patch to achieve the
desired kernel defconfig and buildroot defconfig.
I tested this configuration in Juno r1 only. Maybe we should change the
descriptions and support Juno r1 only for now? What's your opinion?

Joao


On 2/1/2016 12:20 PM, Liviu.Dudau at arm.com wrote:
> On Mon, Feb 01, 2016 at 11:55:07AM +0000, Joao Pinto wrote:
>> The Juno ARM Development Platform (ADP) is a software development
>> platform for ARMv8-A, it includes the Juno Versatile Express board 
>> and an ARMv8-A reference software port available through Linaro.
>>
>> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> 
> Hi Joao,
> 
> Thanks for Cc-ing me on this patch, it is the first version I'm seeing even
> if it seem to have reached v7.
> 
> I'm guessing you have tested this patch on a Juno r1 only because ...
> 
>> ---
>>
>> Changes v6 -> v7 (Arnout Vandecappelle):
>>  - Commit id was updated 
>>  - Custom image name was removed from buildroot' defconfig
>> Changes v5 -> v6 (Arnout Vandecappelle):
>>  - replace Juno r1 for Juno (applicable to r0 and r1)
> 
> ... there is no way for Juno r0 to work with juno-r1.dtb. There are a couple
> of issues on r0 that will freeze the kernel boot if you attempt to use juno-r1.dtb
> (architected timers and PCIe), so please, don't skip on this. If it were possible
> to use the same dtb on both boards, believe me, we would've done that in the kernel
> in the first place.
> 
> I don't know how hard it is to implement this in buildroot, but the Linaro u-boot
> can be configured in such a way that you can copy both the juno.dtb and the r1a57a53.dtb
> files in the SOFTWARE directory and the board setup will pick up the correct one to
> flash.
> 
> Best regards,
> Liviu
> 
>>  - some configs were removed from defconfig
>> Changes v4 -> v5:
>>  -Added changelog to the patch
>> Changes v3 -> v4(Thomas Petazzoni):
>>  -The kernel' arm64 defconfig lacks a considerable amount of 
>>  configuration items regarding the Juno board, and that is the reason
>>  of this custom kernel configuration file.
>>  -The ARM Juno needs a kernel image called Image, and that 
>>  it the reason why BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is being used.
>>  -A new readme.txt was produced.
>>
>>  board/arm/juno/linux-juno-defconfig | 176 ++++++++++++++++++++++++++++++++
>>  board/arm/juno/readme.txt |76 ++++++++++++++
>>  configs/arm_juno_defconfig|16 +++
>>  3 files changed, 268 insertions(+)
>>  create mode 100644 board/arm/juno/linux-juno-defconfig
>>  create mode 100644 board/arm/juno/readme.txt
>>  create mode 100644 configs/arm_juno_defconfig
>>
>> diff --git a/board/arm/juno/linux-juno-defconfig b/board/arm/juno/linux-juno-defconfig
>> new file mode 100644
>> index 0000000..b216d3e
>> --- /dev/null
>> +++ b/board/arm/juno/linux-juno-defconfig
>> @@ -0,0 +1,161 @@
>> +CONFIG_SYSVIPC=y
>> +CONFIG_POSIX_MQUEUE=y
>> +CONFIG_FHANDLE=y
>> +CONFIG_AUDIT=y
>> +CONFIG_NO_HZ_IDLE=y
>> +CONFIG_HIGH_RES_TIMERS=y
>> +CONFIG_BSD_PROCESS_ACCT=y
>> +CONFIG_BSD_PROCESS_ACCT_V3=y
>> +CONFIG_TASKSTATS=y
>> +CONFIG_TASK_DELAY_ACCT=y
>> +CONFIG_TASK_XACCT=y
>> +CONFIG_TASK_IO_ACCOUNTING=y
>> +CONFIG_IKCONFIG=y
>> +CONFIG_IKCONFIG_PROC=y
>> +CONFIG_LOG_BUF_SHIFT=14
>> +CONFIG_MEMCG=y
>> +CONFIG_MEMCG_SWAP=y
>> +CONFIG_MEMCG_KMEM=y
>> +CONFIG_CGROUP_HUGETLB=y
>> +CONFIG_SCHED_AUTOGROUP=y
>> +CONFIG_BLK_DEV_INITRD=y
>> +CONFIG_KALLSYMS_ALL=y
>> +CONFIG_PROFILING=y
>> +CONFIG_JUMP_LABEL=y
>> +CONFIG_MODULES=y
>> +CONFIG_MODULE_UNLOAD=y
>> +CONFIG_ARCH_VEXPRESS=y
>> +CONFIG_PCI=y
>> +CONFIG_PCI_MSI=y
>> +CONFIG_PCI_HOST_GENERIC=y
>> +CONFIG_PCIEPORTBUS=y
>> +CONFIG_HOTPLUG_PCI_PCIE=y
>> +CONFIG_HOTPLUG_PCI=y
>> +CONFIG_NR_CPUS=6
>> +CONFIG_PREEMPT=y
>> +CONFIG_KSM=y
>> +CONFIG_TRANSPARENT_HUGEPAGE=y
>> +CONFIG_CMA=y
>> +CONFIG_CMDLINE="console=ttyAMA0"
>> +CONFIG_COMPAT=y
>> +CONFIG_CPU_IDLE=y
>> +CONFIG_ARM_CPUIDLE=y
>> +CONFIG_CPU_FREQ=y
>> +CONFIG_CPU_FREQ_GOV_USERSPACE=y
>> +CONFIG_CPU_FREQ_GOV_ONDEMAND=y
>> +CONFIG_CPU_FREQ_GOV_INTERACTIVE=y
>> +CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
>> +CONFIG_ARM_DT_BL_CPUFREQ=y
>> +CONFIG_ARM_SCPI_CPUFREQ=y
>> +CONFIG_NET=y
>> +CONFIG_PACKET=y
>> +CONFIG_UNIX=y
>> +CONFIG_INET=y
>> +CONFIG_IP_PNP=y
>> +CONFIG_IP_PNP_DHCP=y
>> +CONFIG_IP_PNP_BOOTP=y
>> +CONFIG_BPF_JIT=y
>> +CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>> +CONFIG_DEVTMPFS=y
>> +CONFIG_DEVTMPFS_MOUNT=y
>> +CONFIG_BLK_DEV_LOOP=y
>> +CONFIG_BLK_DEV_RAM=y
>> +CONFIG_BLK_DEV_SD=y
>> +CONFIG_ATA=y
>> +CONFIG_SATA_AHCI=y
>> +CONFIG_SATA_AHCI_PLATFORM=y
>> +CONFIG_AHCI_XGENE=y
>> +CONFIG_PATA_PLATFORM=y
>> +CONFIG_PATA_OF_PLATFORM=y
>> +CONFIG_NETDEVICES=y
>> +CONFIG_TUN=y
>> +CONFIG_SKY2=y
>> +CONFIG_SMC91X=y
>> +CONFIG_SMSC911X=y
>> +CONFIG_INPUT_EVDEV=y
>> +CONFIG_SERIO_AMBAKMI=y
>> +CONFIG_LEGACY_PTY_COUNT=16
>> +CONFIG_SERIAL_8250=y
>> +CONFIG_SERIAL_8250_CONSOLE=y
>> +CONFIG_SERIAL_AMBA_PL011=y
>> +CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
>> +CONFIG_SERIAL_OF_PLATFORM=y
>> +CONFIG_SERIAL_XILINX_PS_UART=y
>> +CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y
>> +CONFIG_I2C_CHARDEV=y
>> +CONFIG_I2C_DESIGNWARE_PLATFORM=y
>> +CONFIG_I2C_SLAVE=y
>> +CONFIG_SPI=y
>> +CONFIG_SPI_PL022=y
>> +CONFIG_PTP_1588_CLOCK=m
>> +CONFIG_GPIO_PL061=y
>> +CONFIG_GPIO_XGENE=y
>> +CONFIG_POWER_RESET_XGENE=y
>> +CONFIG_POWER_RESET_SYSCON=y
>> +CONFIG_REGULATOR=y
>> +CONFIG_REGULATOR_FIXED_VOLTAGE=y
>> +CONFIG_REGULATOR_VEXPRESS=m
>> +CONFIG_DRM=y
>> +CONFIG_DRM_I2C_NXP_TDA998X=y
>> +CONFIG_DRM_ARM=y
>> +CONFIG_DRM_HDLCD=y
>> +CONFIG_DRM_VIRTUAL_HDLCD=y
>> +CONFIG_FB_ARMCLCD=y
>> +CONFIG_LOGO=y
>> +CONFIG_USB=y
>> +CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
>> +CONFIG_USB_EHCI_HCD=y
>> +CONFIG_USB_EHCI_HCD_PLATFORM=y
>> +CONFIG_USB_OHCI_HCD=y
>> +CONFIG_USB_OHCI_HCD_PLATFORM=y
>> +CONFIG_USB_STORAGE=y
>> +CONFIG_USB_ISP1760=y
>> +CONFIG_NOP_USB_XCEIV=y
>> +CONFIG_USB_ULPI=y
>> +CONFIG_MMC=y
>> +CONFIG_MMC_ARMMMCI=y
>> +CONFIG_MMC_SDHCI=y
>> +CONFIG_MMC_SDHCI_PLTFM=y
>> +CONFIG_MMC_SPI=y
>> +CONFIG_RTC_CLASS=y
>> +CONFIG_RTC_DRV_EFI=y
>> +CONFIG_RTC_DRV_PL030=y
>> +CONFIG_RTC_DRV_PL031=y
>> +CONFIG_DMADEVICES=y
>> +CONFIG_PL330_DMA=y
>> +CONFIG_COMMON_CLK_SCPI=y
>> +CONFIG_ARM_TIMER_SP804=y
>> +CONFIG_MAILBOX=y
>> +CONFIG_ARM_MHU=y
>> +CONFIG_PHY_XGENE=y
>> +CONFIG_ARM_SCPI_PROTOCOL=y
>> +CONFIG_EXT2_FS=y
>> +CONFIG_EXT3_FS=y
>> +CONFIG_FANOTIFY=y
>> +CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
>> +CONFIG_QUOTA=y
>> +CONFIG_AUTOFS4_FS=y
>> +CONFIG_FUSE_FS=y
>> +CONFIG_CUSE=y
>> +CONFIG_VFAT_FS=y
>> +CONFIG_TMPFS=y
>> +CONFIG_HUGETLBFS=y
>> +CONFIG_EFIVAR_FS=y
>> +CONFIG_NLS_CODEPAGE_437=y
>> +CONFIG_NLS_ISO8859_1=y
>> +CONFIG_VIRTUALIZATION=y
>> +CONFIG_KVM=y
>> +CONFIG_DYNAMIC_DEBUG=y
>> +CONFIG_DEBUG_INFO=y
>> +CONFIG_DEBUG_FS=y
>> +CONFIG_MAGIC_SYSRQ=y
>> +CONFIG_DEBUG_KERNEL=y
>> +CONFIG_LOCKUP_DETECTOR=y
>> +CONFIG_SECURITY=y
>> +CONFIG_CRYPTO_ANSI_CPRNG=y
>> +CONFIG_ARM64_CRYPTO=y
>> +CONFIG_CRYPTO_SHA1_ARM64_CE=y
>> +CONFIG_CRYPTO_SHA2_ARM64_CE=y
>> +CONFIG_CRYPTO_GHASH_ARM64_CE=y
>> +CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
>> +CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
>> +CONFIG_CRYPTO_AES_ARM64_NEON_BLK=y
>> diff --git a/board/arm/juno/readme.txt b/board/arm/juno/readme.txt
>> new file mode 100644
>> index 0000000..2b3ebf5
>> --- /dev/null
>> +++ b/board/arm/juno/readme.txt
>> @@ -0,0 +1,74 @@
>> +ARM Juno r1
>> +
>> +Intro
>> +=====
>> +
>> +These instructions apply to all models of the ARM Juno:
>> +  - Juno r0 (does not support PCIe)
>> +  - Juno r1 (supports PCIe)
>> +
>> +Buildroot will generate the kernel image, device tree blob and a
>> +minimal root filesystem.
>> +
>> +How to build it
>> +===============
>> +
>> +Configure Buildroot
>> +-------------------
>> +
>> +Configuring Buildroot is pretty simple, just execute:
>> +
>> +  $ make arm_juno_defconfig
>> +
>> +Build the rootfs, kernel and DTB
>> +--------------------------------
>> +
>> +Note: you will need to have access to the network, since Buildroot will
>> +download the packages' sources.
>> +
>> +You may now build your rootfs with:
>> +
>> +  $ make
>> +
>> +(This may take a while)
>> +
>> +Result of the build
>> +-------------------
>> +
>> +After building, you should obtain this tree:
>> +
>> +    output/images/
>> +    +-- rootfs.tar
>> +    +-- juno-r1.dtb (also valid for r0)
>> +    +-- Image
>> +
>> +Preparing your rootfs
>> +======================
>> +Format your pen drive as a ext3 filesystem by executing:
>> +
>> +   $ mkfs.ext3 /dev/<your device>
>> +
>> +Installing your rootfs
>> +======================
>> +After mounting the pen drive please execute the following:
>> +
>> +   $ sudo tar -xvf output/images/rootfs.tar -C <pen drive mount path>
>> +
>> +When completed make sure to unmount the device:
>> +
>> +   $ umount <pen drive mount path>
>> +
>> +Insert the pen drive in one of the ARM Juno' USB type A connectors.
>> +
>> +Installing kernel image and DTB
>> +===============================
>> +1. Connect to the ARM Juno UART0 and execute USB_ON in the terminal
>> +2. Connect a USB cable between your PC and ARM Juno USB type B connector
>> +   A mass storage device should appear in your desktop.
>> +3. Open the software/ folder
>> +4. Copy the 'Image' file to software/
>> +5. Copy the 'juno-r1.dtb' file to software/ and rename it to r1a57a53.dtb
>> +6. Press the red button in the front pannel of ARM Juno
>> +
>> +At this time, the board will erase the Flash entry for each new item and
>> +replace it with the lastest ones.
>> +When finished, the board will boot and mount the root filesystem at /dev/sda1.
>> diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
>> new file mode 100644
>> index 0000000..3987293
>> --- /dev/null
>> +++ b/configs/arm_juno_defconfig
>> @@ -0,0 +1,14 @@
>> +BR2_aarch64=y
>> +BR2_KERNEL_HEADERS_VERSION=y
>> +BR2_DEFAULT_KERNEL_VERSION="4.2.2"
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
>> +BR2_TARGET_GENERIC_HOSTNAME="juno-buildroot"
>> +BR2_TARGET_GENERIC_ISSUE="Welcome to SNPS Juno by Buildroot"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="http://git.linaro.org/landing-teams/working/arm/kernel.git"
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="0d752ce2de3057e12e220d104beb02744147be4f"
>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arm/juno/linux-juno-defconfig"
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/juno-r1"
>> -- 
>> 1.8.1.5
>>
> 
