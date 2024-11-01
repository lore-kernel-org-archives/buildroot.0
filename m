Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA40E6F096
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 23:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3A5A607EB;
	Fri,  1 Nov 2024 23:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hm9TBx24ArKF; Fri,  1 Nov 2024 23:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAA446082B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAA446082B;
	Fri,  1 Nov 2024 23:47:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 87CFF979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 23:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 691A640265
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 23:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAoJMEeGGxNO for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 23:46:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E00BF40250
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E00BF40250
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E00BF40250
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 23:46:58 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:9151:10df:85d4:61aa])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7FE015FF3F;
 Sat,  2 Nov 2024 00:46:54 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Sat,  2 Nov 2024 00:45:19 +0100
Message-ID: <20241101234519.10954-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730504815;
 bh=N/BHWB04Es1JD7sremyW5yfaR1x2UBL758u2FN8dsgI=;
 h=From:To:Cc:Subject:Date:From;
 b=exe6ZFSCftTNx3YVNpe1fsw5voIPQ1Gi/qRd0JiubOgohWGO6o0wG4xwX62yOgYtb
 mqD3WbhbdmYzmmAUfav9VCmbTxvJv5zxeGk+U9CCKw3Tn2my049rt2UoX0pcjGf3Xc
 qxknduJrYUiMrzizT6SARgNwSyHxYQ7ByJXpWxBAfnC1gAqs8YabKoxGu1Nyv5dq+z
 lzKzpkxR3GJ2UoT+2q0ZNH7LS5s/JGCYgSLeNPJxqvdj4BbXlrpYDqoscFx/gj7Vhe
 ygDjcUVGERUaLAQCoNzRexP9QX+7LGoll1xpXS8OHaA0d+rSqzX+gaVmjg1wCLHjTZ
 6GPYXbTeajW/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=exe6ZFSC
Subject: [Buildroot] [PATCH v0 1/1] board/nvidia/bf3: new DPU board
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a basic support for the Bluefied3 board from
Mellanox/NVIDIA:
  - https://www.nvidia.com/en-us/networking/products/data-processing-unit/

  Brief summary of the board features:
  - multicore ARM
      - 16 Core ARM Processor
  - DDR4: 16GB/32GB
  - 2x embedded CX7

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                    |   1 +
 board/nvidia/bf3/linux.config | 163 ++++++++++++++++++++++++++++++++++
 board/nvidia/bf3/readme.txt   |  10 +++
 configs/nvidia_bf3_defconfig  |  11 +++
 4 files changed, 185 insertions(+)
 create mode 100644 board/nvidia/bf3/linux.config
 create mode 100644 board/nvidia/bf3/readme.txt
 create mode 100644 configs/nvidia_bf3_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 76f15f708a..0df4b3d2e4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3271,6 +3271,7 @@ F:	support/testing/tests/core/test_root_password.py
 
 N:	Vincent Jardin <vjardin@free.fr>
 F:	package/dpdk/
+F:	board/nvidia/bf3/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
diff --git a/board/nvidia/bf3/linux.config b/board/nvidia/bf3/linux.config
new file mode 100644
index 0000000000..5dce565481
--- /dev/null
+++ b/board/nvidia/bf3/linux.config
@@ -0,0 +1,163 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_TASKSTATS=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_PROFILING=y
+CONFIG_ARCH_VEXPRESS=y
+CONFIG_COMPAT=y
+CONFIG_ACPI=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_BLK_DEV_BSGLIB=y
+CONFIG_BINFMT_MISC=y
+CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_PACKET_DIAG=y
+CONFIG_UNIX=y
+CONFIG_NET_KEY=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_BRIDGE=y
+CONFIG_NET_SCHED=y
+CONFIG_VSOCKETS=y
+CONFIG_PCI=y
+CONFIG_PCI_HOST_GENERIC=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_FW_CFG_SYSFS=y
+CONFIG_FW_CFG_SYSFS_CMDLINE=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_SCSI_CONSTANTS=y
+CONFIG_SCSI_LOGGING=y
+CONFIG_SCSI_SCAN_ASYNC=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_NETDEVICES=y
+CONFIG_DUMMY=y
+CONFIG_MACVLAN=y
+CONFIG_VIRTIO_NET=y
+CONFIG_NLMON=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_TCG_TPM=y
+CONFIG_TCG_TIS=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_PL031=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_MAILBOX=y
+CONFIG_PL320_MBOX=y
+CONFIG_ARM_SMMU_V3=y
+CONFIG_EXT4_FS=y
+CONFIG_FUSE_FS=y
+CONFIG_VIRTIO_FS=y
+CONFIG_OVERLAY_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_RAS=y
+CONFIG_EDAC=y
+CONFIG_EDAC_LEGACY_SYSFS=y
+CONFIG_EDAC_BLUEFIELD=y
+CONFIG_I2C=y
+CONFIG_MELLANOX_PLATFORM=y
+CONFIG_REGMAP_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_GPIO_MLXBF2=y
+CONFIG_GPIO_MLXBF3=y
+CONFIG_GPIO_MLXBF=y
+CONFIG_I2C_MLXBF=y
+CONFIG_I2C_MLXCPLD=y
+CONFIG_I2C_MUX=y
+CONFIG_I2C_MUX_MLXCPLD=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_MLXCPLD=y
+CONFIG_LEDS_MLXREG=y
+CONFIG_NET_SWITCHDEV=y
+CONFIG_MLX5_BRIDGE=y
+CONFIG_NET_CLS_ACT=y
+CONFIG_NET_TC_SKB_EXT=y
+CONFIG_CONFIG_NET_CLS_ACT=y
+CONFIG_MLX5_CLS_ACT=y
+CONFIG_DCB=y
+CONFIG_MLX5_CORE_EN_DCB=y
+CONFIG_MLX5_CORE_EN=y
+CONFIG_MLX5_CORE=y
+CONFIG_MLX5_DPLL=y
+CONFIG_MLX5_EN_ARFS=y
+CONFIG_INET_ESP=y
+CONFIG_INET6_ESP=y
+CONFIG_XFRM_OFFLOAD=y
+CONFIG_INET_ESP_OFFLOAD=y
+CONFIG_INET6_ESP_OFFLOAD=y
+CONFIG_MLX5_EN_IPSEC=y
+CONFIG_MLX5_EN_RXNFC=y
+CONFIG_TLS_DEVICE=y
+CONFIG_TLS=y
+CONFIG_MLX5_EN_TLS=y
+CONFIG_MLX5_ESWITCH=y
+CONFIG_MLX5_FPGA_IPSEC=y
+CONFIG_MLX5_FPGA_TLS=y
+CONFIG_MLX5_FPGA=y
+CONFIG_MLX5_IPSEC=y
+CONFIG_MACSEC=y
+CONFIG_MLX5_MACSEC=y
+CONFIG_MLX5_MPFS=y
+CONFIG_MLX5_SF_MANAGER=y
+CONFIG_MLX5_SF=y
+CONFIG_MLX5_SW_STEERING=y
+CONFIG_NETFILTER=y
+CONFIG_NETFILTER_INGRESS=y
+CONFIG_NF_CONNTRACK=y
+CONFIG_NF_TABLES=y
+CONFIG_NF_FLOW_TABLE=y
+CONFIG_NET_ACT_CT=y
+CONFIG_MLX5_TC_CT=y
+CONFIG_MLX5_TC_SAMPLE=y
+CONFIG_MLX5_TLS=y
+CONFIG_VDPA=y
+CONFIG_VHOST_IOTLB=y
+CONFIG_MLX5_VDPA_NET=y
+CONFIG_MLX5_VDPA_STEERING_DEBUG=y
+CONFIG_MLX5_VDPA=y
+CONFIG_IOMMUFD=y
+CONFIG_IOMMU_SUPPORT=y
+CONFIG_VFIO=y
+CONFIG_MLX5_VFIO_PCI=y
+CONFIG_MLXBF_BOOTCTL=y
+CONFIG_MLXBF_GIGE=y
+CONFIG_MLXBF_PMC=y
+CONFIG_MLXBF_TMFIFO=y
+CONFIG_MLXFW=y
+CONFIG_MLXREG_HOTPLUG=y
+CONFIG_MLXREG_IO=y
+CONFIG_WATCHDOG=y
+CONFIG_MLX_WDT=y
+CONFIG_MMC=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_BLUEFIELD=y
+CONFIG_NET_VENDOR_MELLANOX=y
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_MLXBF3=y
+CONFIG_POWER_MLXBF=y
+CONFIG_SENSORS_MLXREG_FAN=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_RD_GZIP=y
+CONFIG_INITRAMFS_COMPRESSION_GZIP=y
diff --git a/board/nvidia/bf3/readme.txt b/board/nvidia/bf3/readme.txt
new file mode 100644
index 0000000000..993c8ec82f
--- /dev/null
+++ b/board/nvidia/bf3/readme.txt
@@ -0,0 +1,10 @@
+The BlueField 3 board is provided as-is without official support from NVIDIA.
+
+Please note that the following kernel modules are missing because they are not available
+in the Linux upstream repository:
+  - CONFIG_MLXBF_PTM (module: mlxbf-ptm)
+  - CONFIG_MLXBF_PKA (module: mlxbf-pka)
+
+For further details on these kernel modules and their usage, please refer to the NVIDIA
+documentation:
+  https://docs.nvidia.com/networking/display/bluefielddpuosv470/installing+popular+linux+distributions+on+bluefield)
diff --git a/configs/nvidia_bf3_defconfig b/configs/nvidia_bf3_defconfig
new file mode 100644
index 0000000000..ddb8caab8b
--- /dev/null
+++ b/configs/nvidia_bf3_defconfig
@@ -0,0 +1,11 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.5"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/nvidia/bf3/linux.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
