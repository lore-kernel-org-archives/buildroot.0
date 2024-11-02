Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96D4E67807
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 17:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3477C423BA;
	Sat,  2 Nov 2024 17:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2_c0DtkY_f1; Sat,  2 Nov 2024 17:12:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBB184238A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBB184238A;
	Sat,  2 Nov 2024 17:12:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 165C427E1
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 17:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11EB040572
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 17:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DftvfDhRVYVE for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 17:12:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F6AD4063C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F6AD4063C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F6AD4063C
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 17:12:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 26C0EB00583;
 Sat,  2 Nov 2024 18:12:00 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58638])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 02 Nov 2024 18:12:00 +0100
MIME-Version: 1.0
Date: Sat, 02 Nov 2024 18:12:00 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241101234519.10954-1-vjardin@free.fr>
References: <20241101234519.10954-1-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <8a19a60a3bc7fd38df4859c55ffdb7f9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730567521;
 bh=WvsHkwsYwdYFPMbwIDx5l3nzBocMxl1v4BP9d+u04Lo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oLLu9HLd0foWkmvN/HhkNG6FwPcSWFqDiORG/fdFcX3NvmrhIfNr+4hmVntmNkd2w
 DIYWEsdQQ+9QReLs+k2ovMdJoAyY/X7KJTT5HnaL18gaVF3j++ND3gTrlxQBCpN3j4
 0BTfC3oa/rL4mLRBMqc0Yj9FBav/p41vomPZlhcLVMK2GOaeIDGtJxSDCPIqScyNwK
 QSAjBbcXPydANhxGFnQWrD6mIZUKXWMRAEUDBeyD246IpQHjGKc8sbSbxhVricZWL9
 nBp2EPYJC+BxTkFJL7mMmDt9uaYVk7iT89gkHozy/H3c7RtSe4xS9y+NkXbwsLq02W
 UWRlc9BfuyW7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oLLu9HLd
Subject: Re: [Buildroot] [PATCH v0 1/1] board/nvidia/bf3: new DPU board
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

Thanks for this interesting submission!

I have few comments on it (it's a good idea you started at v0 ;)).

First, about the commit title one-liner: to follow the Buildroot commit
log "standards", the one liner should be:

configs/nvidia_bf3: new defconfig

See for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/54be84cb5f7c1d9788a645baba0f600912325bfe

Or see other examples with the command:

     git log --grep ": new defconfig" configs/

On 02/11/2024 00:45, Vincent Jardin wrote:
> This patch adds a basic support for the Bluefied3 board from
> Mellanox/NVIDIA:
>   - 
> https://www.nvidia.com/en-us/networking/products/data-processing-unit/

Having the link to the board page in the commit log is good.
I think it should also be present in the "readme.txt". See
my comment below.

>   Brief summary of the board features:
>   - multicore ARM
>       - 16 Core ARM Processor
>   - DDR4: 16GB/32GB
>   - 2x embedded CX7
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  DEVELOPERS                    |   1 +
>  board/nvidia/bf3/linux.config | 163 ++++++++++++++++++++++++++++++++++
>  board/nvidia/bf3/readme.txt   |  10 +++
>  configs/nvidia_bf3_defconfig  |  11 +++
>  4 files changed, 185 insertions(+)
>  create mode 100644 board/nvidia/bf3/linux.config
>  create mode 100644 board/nvidia/bf3/readme.txt
>  create mode 100644 configs/nvidia_bf3_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 76f15f708a..0df4b3d2e4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3271,6 +3271,7 @@ 
> F:	support/testing/tests/core/test_root_password.py
> 
>  N:	Vincent Jardin <vjardin@free.fr>
>  F:	package/dpdk/
> +F:	board/nvidia/bf3/

In DEVELOPERS entries, we try to keep all entries sorted
alphabetically. So, this "board/" line should go before "package/".

Since you also add a defconfig, you should also add an entry for it.
configs/nvidia_bf3_defconfig (while keeping at the same time the
alphabetical ordering).

>  N:	Vincent Prince <vincent.prince.fr@gmail.com>
>  F:	package/nss-myhostname/
> diff --git a/board/nvidia/bf3/linux.config 
> b/board/nvidia/bf3/linux.config
> new file mode 100644
> index 0000000000..5dce565481
> --- /dev/null
> +++ b/board/nvidia/bf3/linux.config
> @@ -0,0 +1,163 @@
> +CONFIG_SYSVIPC=y
> +CONFIG_POSIX_MQUEUE=y
> +CONFIG_NO_HZ_IDLE=y
> +CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_TASKSTATS=y
> +CONFIG_MEMCG=y
> +CONFIG_BLK_CGROUP=y
> +CONFIG_CPUSETS=y
> +CONFIG_CGROUP_DEVICE=y
> +CONFIG_CGROUP_CPUACCT=y
> +CONFIG_SCHED_AUTOGROUP=y
> +CONFIG_PROFILING=y
> +CONFIG_ARCH_VEXPRESS=y
> +CONFIG_COMPAT=y
> +CONFIG_ACPI=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +CONFIG_BLK_DEV_BSGLIB=y
> +CONFIG_BINFMT_MISC=y
> +CONFIG_TRANSPARENT_HUGEPAGE=y
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_PACKET_DIAG=y
> +CONFIG_UNIX=y
> +CONFIG_NET_KEY=y
> +CONFIG_INET=y
> +CONFIG_IP_MULTICAST=y
> +CONFIG_IP_ADVANCED_ROUTER=y
> +CONFIG_BRIDGE=y
> +CONFIG_NET_SCHED=y
> +CONFIG_VSOCKETS=y
> +CONFIG_PCI=y
> +CONFIG_PCI_HOST_GENERIC=y
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
> +CONFIG_FW_CFG_SYSFS=y
> +CONFIG_FW_CFG_SYSFS_CMDLINE=y
> +CONFIG_VIRTIO_BLK=y
> +CONFIG_BLK_DEV_SD=y
> +CONFIG_CHR_DEV_SG=y
> +CONFIG_SCSI_CONSTANTS=y
> +CONFIG_SCSI_LOGGING=y
> +CONFIG_SCSI_SCAN_ASYNC=y
> +CONFIG_SCSI_VIRTIO=y
> +CONFIG_ATA=y
> +CONFIG_NETDEVICES=y
> +CONFIG_DUMMY=y
> +CONFIG_MACVLAN=y
> +CONFIG_VIRTIO_NET=y
> +CONFIG_NLMON=y
> +CONFIG_INPUT_EVDEV=y
> +CONFIG_SERIAL_AMBA_PL011=y
> +CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
> +CONFIG_VIRTIO_CONSOLE=y
> +CONFIG_HW_RANDOM=y
> +CONFIG_HW_RANDOM_VIRTIO=y
> +CONFIG_TCG_TPM=y
> +CONFIG_TCG_TIS=y
> +CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_PL031=y
> +CONFIG_VIRTIO_PCI=y
> +CONFIG_VIRTIO_INPUT=y
> +CONFIG_VIRTIO_MMIO=y
> +CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
> +CONFIG_MAILBOX=y
> +CONFIG_PL320_MBOX=y
> +CONFIG_ARM_SMMU_V3=y
> +CONFIG_EXT4_FS=y
> +CONFIG_FUSE_FS=y
> +CONFIG_VIRTIO_FS=y
> +CONFIG_OVERLAY_FS=y
> +CONFIG_TMPFS=y
> +CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_RAS=y
> +CONFIG_EDAC=y
> +CONFIG_EDAC_LEGACY_SYSFS=y
> +CONFIG_EDAC_BLUEFIELD=y
> +CONFIG_I2C=y
> +CONFIG_MELLANOX_PLATFORM=y
> +CONFIG_REGMAP_I2C=y
> +CONFIG_I2C_CHARDEV=y
> +CONFIG_GPIO_MLXBF2=y
> +CONFIG_GPIO_MLXBF3=y
> +CONFIG_GPIO_MLXBF=y
> +CONFIG_I2C_MLXBF=y
> +CONFIG_I2C_MLXCPLD=y
> +CONFIG_I2C_MUX=y
> +CONFIG_I2C_MUX_MLXCPLD=y
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_MLXCPLD=y
> +CONFIG_LEDS_MLXREG=y
> +CONFIG_NET_SWITCHDEV=y
> +CONFIG_MLX5_BRIDGE=y
> +CONFIG_NET_CLS_ACT=y
> +CONFIG_NET_TC_SKB_EXT=y
> +CONFIG_CONFIG_NET_CLS_ACT=y
> +CONFIG_MLX5_CLS_ACT=y
> +CONFIG_DCB=y
> +CONFIG_MLX5_CORE_EN_DCB=y
> +CONFIG_MLX5_CORE_EN=y
> +CONFIG_MLX5_CORE=y
> +CONFIG_MLX5_DPLL=y
> +CONFIG_MLX5_EN_ARFS=y
> +CONFIG_INET_ESP=y
> +CONFIG_INET6_ESP=y
> +CONFIG_XFRM_OFFLOAD=y
> +CONFIG_INET_ESP_OFFLOAD=y
> +CONFIG_INET6_ESP_OFFLOAD=y
> +CONFIG_MLX5_EN_IPSEC=y
> +CONFIG_MLX5_EN_RXNFC=y
> +CONFIG_TLS_DEVICE=y
> +CONFIG_TLS=y
> +CONFIG_MLX5_EN_TLS=y
> +CONFIG_MLX5_ESWITCH=y
> +CONFIG_MLX5_FPGA_IPSEC=y
> +CONFIG_MLX5_FPGA_TLS=y
> +CONFIG_MLX5_FPGA=y
> +CONFIG_MLX5_IPSEC=y
> +CONFIG_MACSEC=y
> +CONFIG_MLX5_MACSEC=y
> +CONFIG_MLX5_MPFS=y
> +CONFIG_MLX5_SF_MANAGER=y
> +CONFIG_MLX5_SF=y
> +CONFIG_MLX5_SW_STEERING=y
> +CONFIG_NETFILTER=y
> +CONFIG_NETFILTER_INGRESS=y
> +CONFIG_NF_CONNTRACK=y
> +CONFIG_NF_TABLES=y
> +CONFIG_NF_FLOW_TABLE=y
> +CONFIG_NET_ACT_CT=y
> +CONFIG_MLX5_TC_CT=y
> +CONFIG_MLX5_TC_SAMPLE=y
> +CONFIG_MLX5_TLS=y
> +CONFIG_VDPA=y
> +CONFIG_VHOST_IOTLB=y
> +CONFIG_MLX5_VDPA_NET=y
> +CONFIG_MLX5_VDPA_STEERING_DEBUG=y
> +CONFIG_MLX5_VDPA=y
> +CONFIG_IOMMUFD=y
> +CONFIG_IOMMU_SUPPORT=y
> +CONFIG_VFIO=y
> +CONFIG_MLX5_VFIO_PCI=y
> +CONFIG_MLXBF_BOOTCTL=y
> +CONFIG_MLXBF_GIGE=y
> +CONFIG_MLXBF_PMC=y
> +CONFIG_MLXBF_TMFIFO=y
> +CONFIG_MLXFW=y
> +CONFIG_MLXREG_HOTPLUG=y
> +CONFIG_MLXREG_IO=y
> +CONFIG_WATCHDOG=y
> +CONFIG_MLX_WDT=y
> +CONFIG_MMC=y
> +CONFIG_MMC_DW=y
> +CONFIG_MMC_DW_BLUEFIELD=y
> +CONFIG_NET_VENDOR_MELLANOX=y
> +CONFIG_PINCTRL=y
> +CONFIG_PINCTRL_MLXBF3=y
> +CONFIG_POWER_MLXBF=y
> +CONFIG_SENSORS_MLXREG_FAN=y
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_RD_GZIP=y
> +CONFIG_INITRAMFS_COMPRESSION_GZIP=y
> diff --git a/board/nvidia/bf3/readme.txt b/board/nvidia/bf3/readme.txt
> new file mode 100644
> index 0000000000..993c8ec82f
> --- /dev/null
> +++ b/board/nvidia/bf3/readme.txt
> @@ -0,0 +1,10 @@
> +The BlueField 3 board is provided as-is without official support from 
> NVIDIA.

This readme.txt lacks of some information. I would expect for such a
readme to be the entry point to quickly boot a Buildroot Linux.

You should add the board product URL in this readme.
Other links to board documents also helps, if available.

Basically:

make nvidia_bf3_defconfig
make

Then, the file should be the info to basic questions like:

- How to prepare the boot media?
(which output/images file to use?  on what media?)

- How to prepare the board? Is there specific things to know?
(power supply? boot switches? specific flashing tools? where
is the UART where we will see the Buildroot login?).

- How the board boots?  Is there some board config/sw pre-requisite?
(is there a vendor bootloader? etc.)

- Is there other specific things to know?
(specific technique to unbrick the board? pitfalls?)

See for example a short example:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/board/freescale/imx8mpevk/readme.txt

> +Please note that the following kernel modules are missing because they 
> are not available
> +in the Linux upstream repository:
> +  - CONFIG_MLXBF_PTM (module: mlxbf-ptm)
> +  - CONFIG_MLXBF_PKA (module: mlxbf-pka)
> +
> +For further details on these kernel modules and their usage, please 
> refer to the NVIDIA
> +documentation:
> +  
> https://docs.nvidia.com/networking/display/bluefielddpuosv470/installing+popular+linux+distributions+on+bluefield)

This link is broken. There is possibly a spurious parenthesis ")" at the 
end.

> diff --git a/configs/nvidia_bf3_defconfig 
> b/configs/nvidia_bf3_defconfig
> new file mode 100644
> index 0000000000..ddb8caab8b
> --- /dev/null
> +++ b/configs/nvidia_bf3_defconfig
> @@ -0,0 +1,11 @@
> +BR2_aarch64=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y

Here, you set BR2_DOWNLOAD_FORCE_CHECK_HASHES=y, but a board
defconfig should store its own hashes in a BR2_GLOBAL_PATCH_DIR.

See for example a commit adding its hashes:
https://gitlab.com/buildroot.org/buildroot/-/commit/53911500e41db62002732bee0c583ccccb6c614c

The reason is that, without your global patch dir, you are using
the hashes from:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/linux/linux.hash

This means, the default Buildroot kernels and your defconfig will not
bump version at the same time. When one of those two will bump to
another version, the hash check will fail. There is also a helper
script in:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/utils/add-custom-hashes

So you need to add your own hash file.

Since you are using an upstream Kernel, you can also use hashes 
published
by upstream, in:
https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
(instead of calculating those locally).

> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.5"

Since you'll need to respin this patch, there is already a Kernel
6.11.6 available. Maybe you could update?

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/nvidia/bf3/linux.config"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ROOTFS_INITRAMFS=y
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
