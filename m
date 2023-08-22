Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EC8EE4996
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 11:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5594A60B31;
	Tue, 22 Aug 2023 11:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5594A60B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w_9z5hOueLmV; Tue, 22 Aug 2023 11:52:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2347F6119B;
	Tue, 22 Aug 2023 11:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2347F6119B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB9A91BF3DA
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 11:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2988402E8
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 11:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2988402E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pjRUTrk1xXc1 for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 11:52:22 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C78C40139
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 11:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C78C40139
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bcb0b973a5so41884671fa.3
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 04:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692705140; x=1693309940;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AhBjt9SEGudPGCO7egdhYpizQ4ltmyuElIYIx/yrC9w=;
 b=XSDqAh8TFLrN/wUG5R9cV3XGEjbeUh+UN4o7gl5kyKbZG7YgZRpO7ZKu3C6Aq/f4OF
 wQ9S2PXuenyX2D25zzo9p1IJIt2YFvKTWt4anGtgbv9mfaNQqEKmvQPbo6H2FSe+3VxD
 iJKPlOn7tqYDN4QyHaZrJ5DH9zTGcCv3B+ZoR7A8bRGMEiDMntiiBYGvGoYMgrG/d1Nx
 //WqMf+mifDEM8V8QX7LlHem0tA86a47brtWFqK702Uh9ItsxOrjDbJOucx826TUz/0t
 /XtilFoH1fwwnV+IQX3i1nUSsLxa9SxSu9W0sb5CDdoHEaSDJwyUi1pOJfNPgApiEIJO
 29HQ==
X-Gm-Message-State: AOJu0YxRlqluVQU45eMz8wJlMeou9J8YUJYr58nqHziz3s7P04aDoFMI
 Ps6ID+YyUu/jVYuFYMha17YnR5dt/7AaLQ==
X-Google-Smtp-Source: AGHT+IH/5lSc4OiThEN2tNQUeskvBqQhnpi5J3d1kx/EnMOEmeaKEu6LrDG199pNsepaoB+Uzj+pjQ==
X-Received: by 2002:a2e:9796:0:b0:2bc:c51d:daa1 with SMTP id
 y22-20020a2e9796000000b002bcc51ddaa1mr3261851lji.39.1692705139384; 
 Tue, 22 Aug 2023 04:52:19 -0700 (PDT)
Received: from stuudio.localdomain ([94.246.216.57])
 by smtp.googlemail.com with ESMTPSA id
 v6-20020a2e9606000000b002b9af8422a8sm2702146ljh.130.2023.08.22.04.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 04:52:19 -0700 (PDT)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 14:52:16 +0300
Message-Id: <20230822115216.19926-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692705140; x=1693309940;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AhBjt9SEGudPGCO7egdhYpizQ4ltmyuElIYIx/yrC9w=;
 b=BctF6I6P/II5H/EpVvidMcDg7SeuVSw2gnSqp4YNtpktqV/gc6M+54kuP8uCfBQjkp
 Mr5zPq6AeROVPLKdE3pTIRJ1nnjGfkhfYGGE+lVJK23FG2nKkKUaQTRrcItVlPQaePPM
 ZGqrbSVH0wukeRgwPozloj5XwyyQCrMMhi9PLM0+HMnb303lp1x+EJmdwepb82+qUbpj
 ogcwzDqEhWmOLYssjIElw6MxTz+owAtr3lX5YAFh4pdArCDLg2xf7ktzb9PScCHYGKIN
 UOTaH/AwHCH+7yWjjSLPNwixTz2PtyuFWPz31vxcT5l9Gvm4O1UM5UDMZbI6Vr5eMPBd
 lztg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=BctF6I6P
Subject: [Buildroot] [PATCH v3 1/1] configs/mangopi_mangopi_mq_d1s: new
 defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Indrek Kruusa <indrek.kruusa@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Indrek Kruusa <indrek.kruusa@gmail.com>
---
Changes v2 -> v3:
- resend without line wrapping

Changes v1 -> v2:
- using "mangopi" as a vendor string, so creating the boards/mangopi/ folder
 - renaming board's config accordingly
 - updating DEVELOPERS' entry
 - updating readme.txt
- using custom defconfig for linux kernel instead of linux.fragment
- linux kernel version bump to 6.4.11
- renaming custom uboot config file to uboot.config
- custom uboot version points to a certain commit now

 DEVELOPERS                                    |   4 +
 board/mangopi/mangopi-mq-d1s/genimage.cfg     |  20 ++
 board/mangopi/mangopi-mq-d1s/linux.config     | 226 ++++++++++++++++++
 .../overlay/boot/extlinux/extlinux.conf       |   4 +
 .../overlay/etc/network/interfaces            |   6 +
 .../overlay/etc/wpa_supplicant.conf           |   8 +
 board/mangopi/mangopi-mq-d1s/readme.txt       |  48 ++++
 board/mangopi/mangopi-mq-d1s/uboot.config     |  10 +
 configs/mangopi_mangopi_mq_d1s_defconfig      |  47 ++++
 9 files changed, 373 insertions(+)
 create mode 100644 board/mangopi/mangopi-mq-d1s/genimage.cfg
 create mode 100644 board/mangopi/mangopi-mq-d1s/linux.config
 create mode 100644 board/mangopi/mangopi-mq-d1s/overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/mangopi/mangopi-mq-d1s/overlay/etc/network/interfaces
 create mode 100644 board/mangopi/mangopi-mq-d1s/overlay/etc/wpa_supplicant.conf
 create mode 100644 board/mangopi/mangopi-mq-d1s/readme.txt
 create mode 100644 board/mangopi/mangopi-mq-d1s/uboot.config
 create mode 100644 configs/mangopi_mangopi_mq_d1s_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b500f3701..94ec57b95e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1335,6 +1335,10 @@ F:	package/keepalived/
 N:	Ilya Averyanov <averyanovin@gmail.com>
 F:	package/exempi/
 
+N:	Indrek Kruusa <indrek.kruusa@gmail.com>
+F:	configs/mangopi_mangopi_mq_d1s_defconfig
+F:	board/mangopi/mangopi-mq-d1s/
+
 N:	Ismael Luceno <ismael@iodev.co.uk>
 F:	package/axel/
 F:	package/mawk/
diff --git a/board/mangopi/mangopi-mq-d1s/genimage.cfg b/board/mangopi/mangopi-mq-d1s/genimage.cfg
new file mode 100644
index 0000000000..3acf78a3ab
--- /dev/null
+++ b/board/mangopi/mangopi-mq-d1s/genimage.cfg
@@ -0,0 +1,20 @@
+# Minimal SD card image for the MangoPi MQ F133 D1s
+# https://mangopi.org/mangopi_mq
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = false
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		bootable = "true"
+		offset = 1M
+	}
+}
diff --git a/board/mangopi/mangopi-mq-d1s/linux.config b/board/mangopi/mangopi-mq-d1s/linux.config
new file mode 100644
index 0000000000..8bdf6134e4
--- /dev/null
+++ b/board/mangopi/mangopi-mq-d1s/linux.config
@@ -0,0 +1,226 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_PREEMPT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_RT_GROUP_SCHED=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_BPF=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
+CONFIG_EXPERT=y
+# CONFIG_SYSFS_SYSCALL is not set
+CONFIG_PERF_EVENTS=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_NONPORTABLE=y
+# CONFIG_EFI is not set
+CONFIG_PM=y
+CONFIG_CPU_IDLE=y
+CONFIG_RISCV_SBI_CPUIDLE=y
+CONFIG_JUMP_LABEL=y
+# CONFIG_STACKPROTECTOR is not set
+# CONFIG_GCC_PLUGINS is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
+# CONFIG_BLK_DEBUG_FS is not set
+# CONFIG_MQ_IOSCHED_DEADLINE is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set
+# CONFIG_IOSCHED_BFQ is not set
+# CONFIG_SWAP is not set
+CONFIG_PAGE_REPORTING=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_XFRM_USER=m
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_INET_ESP=m
+CONFIG_NETFILTER=y
+CONFIG_BRIDGE_NETFILTER=m
+CONFIG_NF_CONNTRACK=m
+CONFIG_NF_CONNTRACK_FTP=m
+CONFIG_NF_CONNTRACK_TFTP=m
+CONFIG_NETFILTER_XT_MARK=m
+CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
+CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
+CONFIG_NETFILTER_XT_MATCH_IPVS=m
+CONFIG_IP_VS=m
+CONFIG_IP_VS_PROTO_TCP=y
+CONFIG_IP_VS_PROTO_UDP=y
+CONFIG_IP_VS_RR=m
+CONFIG_IP_VS_NFCT=y
+CONFIG_NF_LOG_ARP=m
+CONFIG_NF_LOG_IPV4=m
+CONFIG_IP_NF_IPTABLES=m
+CONFIG_IP_NF_FILTER=m
+CONFIG_IP_NF_TARGET_REJECT=m
+CONFIG_IP_NF_NAT=m
+CONFIG_IP_NF_TARGET_MASQUERADE=m
+CONFIG_IP_NF_TARGET_REDIRECT=m
+CONFIG_IP_NF_MANGLE=m
+CONFIG_NF_LOG_IPV6=m
+CONFIG_IP6_NF_IPTABLES=m
+CONFIG_IP6_NF_MATCH_IPV6HEADER=m
+CONFIG_IP6_NF_FILTER=m
+CONFIG_IP6_NF_TARGET_REJECT=m
+CONFIG_IP6_NF_MANGLE=m
+CONFIG_BRIDGE=m
+CONFIG_BRIDGE_VLAN_FILTERING=y
+CONFIG_VLAN_8021Q=m
+CONFIG_NET_SCHED=y
+CONFIG_NET_CLS_CGROUP=m
+CONFIG_NETLINK_DIAG=y
+CONFIG_CGROUP_NET_PRIO=y
+CONFIG_CFG80211=y
+CONFIG_MAC80211=y
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCI_HOST_GENERIC=y
+CONFIG_PCIE_XILINX=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_SUN50I_DE2_BUS=y
+CONFIG_SUNXI_RSB=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_NETDEVICES=y
+CONFIG_DUMMY=m
+CONFIG_MACVLAN=m
+CONFIG_IPVLAN=m
+CONFIG_VXLAN=m
+CONFIG_VETH=m
+CONFIG_VIRTIO_NET=y
+# CONFIG_ETHERNET is not set
+CONFIG_MDIO_DEVICE=y
+# CONFIG_USB_NET_DRIVERS is not set
+# CONFIG_WLAN is not set
+CONFIG_INPUT_MOUSEDEV=y
+CONFIG_KEYBOARD_SUN4I_LRADC=m
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_LEGACY_TIOCSTI is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_SERIAL_8250_PCI is not set
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_I2C_MV64XXX=m
+CONFIG_PINCTRL=y
+CONFIG_GPIO_GENERIC_PLATFORM=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_WATCHDOG=y
+CONFIG_SUNXI_WATCHDOG=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_DRM=m
+CONFIG_DRM_I2C_CH7006=m
+CONFIG_DRM_I2C_SIL164=m
+CONFIG_DRM_SUN4I=m
+CONFIG_FB=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=m
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_MUSB_HDRC=m
+CONFIG_USB_MUSB_SUNXI=m
+CONFIG_NOP_USB_XCEIV=m
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_CADENCE=y
+CONFIG_MMC_SUNXI=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_SUN6I=y
+CONFIG_RTC_DRV_GOLDFISH=y
+CONFIG_DMADEVICES=y
+CONFIG_DMA_SUN6I=m
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+CONFIG_SUN8I_DE2_CCU=m
+CONFIG_SUN50I_IOMMU=y
+CONFIG_RPMSG_CHAR=y
+CONFIG_RPMSG_CTRL=y
+CONFIG_RPMSG_VIRTIO=y
+CONFIG_PHY_SUN4I_USB=m
+CONFIG_NVMEM_SUNXI_SID=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
+CONFIG_BTRFS_FS=m
+CONFIG_BTRFS_FS_POSIX_ACL=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_OVERLAY_FS=m
+CONFIG_ISO9660_FS=y
+CONFIG_JOLIET=y
+CONFIG_ZISOFS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_PROC_CHILDREN=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_HUGETLBFS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V4=y
+CONFIG_NFS_V4_1=y
+CONFIG_NFS_V4_2=y
+CONFIG_ROOT_NFS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=m
+CONFIG_SECURITY=y
+CONFIG_SECURITY_SELINUX=y
+CONFIG_SECURITY_APPARMOR=y
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_CRYPTO_USER_API_HASH=y
+CONFIG_CRYPTO_DEV_VIRTIO=y
+# CONFIG_RAID6_PQ_BENCHMARK is not set
+CONFIG_CRC_ITU_T=y
+CONFIG_CRC7=y
+CONFIG_XZ_DEC=y
+CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_PAGEALLOC=y
+CONFIG_SCHED_STACK_END_CHECK=y
+CONFIG_DEBUG_VM=y
+CONFIG_DEBUG_VM_PGFLAGS=y
+CONFIG_DEBUG_MEMORY_INIT=y
+CONFIG_SOFTLOCKUP_DETECTOR=y
+CONFIG_WQ_WATCHDOG=y
+CONFIG_DEBUG_TIMEKEEPING=y
+CONFIG_DEBUG_RT_MUTEXES=y
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_MUTEXES=y
+CONFIG_DEBUG_RWSEMS=y
+CONFIG_DEBUG_ATOMIC_SLEEP=y
+CONFIG_DEBUG_LIST=y
+CONFIG_DEBUG_PLIST=y
+CONFIG_DEBUG_SG=y
+# CONFIG_RCU_TRACE is not set
+CONFIG_RCU_EQS_DEBUG=y
+# CONFIG_FTRACE is not set
+# CONFIG_RUNTIME_TESTING_MENU is not set
+CONFIG_MEMTEST=y
diff --git a/board/mangopi/mangopi-mq-d1s/overlay/boot/extlinux/extlinux.conf b/board/mangopi/mangopi-mq-d1s/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..c825ad4667
--- /dev/null
+++ b/board/mangopi/mangopi-mq-d1s/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /boot/Image
+  # use devicetree from u-boot
+  append console=ttyS3,115200 root=/dev/mmcblk0p1 ro rootwait
diff --git a/board/mangopi/mangopi-mq-d1s/overlay/etc/network/interfaces b/board/mangopi/mangopi-mq-d1s/overlay/etc/network/interfaces
new file mode 100644
index 0000000000..89e7d74aff
--- /dev/null
+++ b/board/mangopi/mangopi-mq-d1s/overlay/etc/network/interfaces
@@ -0,0 +1,6 @@
+auto lo
+iface lo inet loopback
+
+auto wlan0
+iface wlan0 inet dhcp
+wpa-conf /etc/wpa_supplicant.conf
diff --git a/board/mangopi/mangopi-mq-d1s/overlay/etc/wpa_supplicant.conf b/board/mangopi/mangopi-mq-d1s/overlay/etc/wpa_supplicant.conf
new file mode 100644
index 0000000000..b43292b0a7
--- /dev/null
+++ b/board/mangopi/mangopi-mq-d1s/overlay/etc/wpa_supplicant.conf
@@ -0,0 +1,8 @@
+ap_scan=1
+
+network={
+        ssid="YOURSSID"
+        scan_ssid=1
+        key_mgmt=WPA-PSK
+        psk="YOURPASSWD"
+}
diff --git a/board/mangopi/mangopi-mq-d1s/readme.txt b/board/mangopi/mangopi-mq-d1s/readme.txt
new file mode 100644
index 0000000000..8af5e0a804
--- /dev/null
+++ b/board/mangopi/mangopi-mq-d1s/readme.txt
@@ -0,0 +1,48 @@
+MangoPi MQ D1s (RISC-V)
+=======================
+
+MangoPi MQ D1s (board model MQ1W) is a tiny (4x4cm) RISC-V based single board computer. It's built around
+Allwinner D1s (also referred as F133) single core 1GHz CPU with integrated 64MB DDR2 RAM.
+Board features:
+- USB-OTG Type-C socket
+- USB-HOST Type-C socket
+- 2x 22 pin GPIO headers 
+- TF card slot
+- RTL8189FTV WiFi module with ext. antenna connector 
+- 15 pin DSI FPC connector
+- 40 pin RGB FPC connector
+- 6 pin CTP FPC connector
+- 24 pin DVP FPC connector
+- onboard mic
+- onboard audio amplifier
+- FEL,reset button
+
+There is no HDMI connector.
+
+How to build
+============
+
+$ make mangopi_mangopi_mq_d1s_defconfig
+$ make
+
+Wifi
+==========
+
+Edit  board/mangopi/mangopi-mq-d1s/overlay/etc/wpa_supplicant.conf or
+/etc/wpa_supplicant.conf once connected to the board:
+
+* Replace YOURSSID with your AP ssid
+* Replace YOURPASSWD with your AP password
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Connect a TTL UART to the UART3 on P8 header (unpopulated), insert the microSD card and
+plug in a USB-C cable to the OTG or HOST connector to boot the system.
diff --git a/board/mangopi/mangopi-mq-d1s/uboot.config b/board/mangopi/mangopi-mq-d1s/uboot.config
new file mode 100644
index 0000000000..0a3d8ded01
--- /dev/null
+++ b/board/mangopi/mangopi-mq-d1s/uboot.config
@@ -0,0 +1,10 @@
+CONFIG_RISCV=y
+CONFIG_DEFAULT_DEVICE_TREE="sun20i-d1s-mangopi-mq"
+CONFIG_TARGET_SUN20I_D1=y
+CONFIG_ARCH_RV64I=y
+CONFIG_RISCV_SMODE=y
+# CONFIG_SPL_SMP is not set
+CONFIG_SYS_SPL_MALLOC=y
+CONFIG_SPL_OPENSBI_SCRATCH_OPTIONS=0x0
+# CONFIG_SYS_I2C_MVTWSI is not set
+CONFIG_DM_REGULATOR_FIXED=y
diff --git a/configs/mangopi_mangopi_mq_d1s_defconfig b/configs/mangopi_mangopi_mq_d1s_defconfig
new file mode 100644
index 0000000000..ee0da2446d
--- /dev/null
+++ b/configs/mangopi_mangopi_mq_d1s_defconfig
@@ -0,0 +1,47 @@
+BR2_riscv=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_ROOTFS_OVERLAY="board/mangopi/mangopi-mq-d1s/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/mangopi/mangopi-mq-d1s/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.11"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mangopi/mangopi-mq-d1s/linux.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1s-mangopi-mq"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_RTL8189FS=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
+BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
+BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_PLAT="generic"
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
+BR2_TARGET_OPENSBI_LATEST_VERSION=y
+# BR2_TARGET_OPENSBI_CUSTOM_VERSION is not set
+BR2_TARGET_OPENSBI_VERSION="1.3"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,3f3b76b3749e796edd4b8cac9081c55574be49c7)/uboot-3f3b76b3749e796edd4b8cac9081c55574be49c7.tar.gz"
+# BR2_TARGET_UBOOT_USE_DEFCONFIG is not set
+BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE="board/mangopi/mangopi-mq-d1s/uboot.config"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
