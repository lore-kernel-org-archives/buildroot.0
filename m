Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80F5C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:42:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9499360F6C
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9499360F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FBED4042D;
	Mon, 30 Aug 2021 04:42:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 697Fi_pqqrzJ; Mon, 30 Aug 2021 04:42:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 613C04042F;
	Mon, 30 Aug 2021 04:42:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B0931BF2F4
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 186DB60759
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uVqgxXX8aveR for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 04:41:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AFD36075E
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 04:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630298467; x=1661834467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ufSQony0zqmx+kP9Z93SMQbjYcuQou6KPlgm+ONHA3Y=;
 b=UacxWCpsGMaD1/fa6W/G8iqfIwK6LvQQopmLtpR38Jvtye7u01iJE/Gz
 e7Yb7jtVpsj8gbNAyWvJN800M1rP/17xyj8hiIhH4Q/C9vrB8d+xMEyFu
 5G7nBuRPdJz7vOecxb7mHPsGsHqF2y1p8UWBt7PnNI9Z3TRwM5pxdiU2S
 CBXtcJNGNoi/Ex9sUun4CXenu6nqMDbVRewOG/tK1nq1AXZVylEfqiglB
 ox3FWMsPLsXxIOUxkuKvlJeGhOpL5CFZDqWXXhoxwoA4L6Pe5VQPO3Qbm
 uYfko5eVfDEmBQFwkoA9tQcArcqFAyBXso4u4+i956sMRGTpKBoIm9lhO g==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="177842496"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 12:41:06 +0800
IronPort-SDR: cSXQ9qEJsfTBGroe4nIJ88+F3VISgr4lG537KJxn6oCnX/1MFrry0EBaKae9mu6PxZgr9d0A1k
 mwifo2oJQVcYne6BzkEg5NAr79bLKpEV73AZhDGcNfoa7fFTuUHLwFJyEYYy9aLeosfvgPSIZC
 2wL3xvOh1P7f0aCpDUqnHwEINYSR45B1qcQQB/69koj3J5lKAjoKM8QopQJSlrR2amaidDNBiY
 BMtFbjqs8owPshIu4NtMyZMSS/y6KoHlkkcxYl9LLD9eIdRXsDZlTf+wd5OAJHMyL3tueh1V1E
 CNlY5iMGQhiMSXEqh9bt+Kjv
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 21:17:57 -0700
IronPort-SDR: KOTaZgf0PS5gxmv5/bEFpv4VRpjqY41TsNh/6gadea1qDPzadFDsmXsFYchMj7W2ZKktVWoaJo
 Z6/QqqaGuT4ZvUZV40bYyLROL1+rA7ERFWmVI0PnyiQDptF+gRszB5TLR0DjHVtSl8jv5FXOMT
 /4OUssExguWgMA/cCs9AxP7Lgw1hxj8CPPBKGlzzSIiL2aUgaaHwdLx51dWivN6gp3C+MYqfgM
 KrJq+TXEb6v8/5iVyado56YcdrEfEfabMOKMf7F5UTcNR6C2wLyg8PZ/N/fg5v9xANF6BNgHM8
 VIE=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.119])
 by uls-op-cesaip02.wdc.com with ESMTP; 29 Aug 2021 21:41:06 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Aug 2021 13:40:55 +0900
Message-Id: <20210830044100.260173-5-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830044100.260173-1-damien.lemoal@wdc.com>
References: <20210830044100.260173-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 4/9] board: Add Sipeed MAIX-bit support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Add two configuration files to support the dual-core RV64 Canaan K210
SoC based Sipeed MAIX-bit board.

The first configuration file, sipeed_maix_bit_defconfig, enables
building a bootable kernel 5.13 image with the root file system
initramfs linked with the kernel. This configuration modifies the
default busybox configuration busybox-minimal.config using the fragment
file board/canaan/k210-common/busybox-tiny.config. This reduces the
size of the busybox executable to save memory when executing shell
commands.

The second configuration file (sipeed_maix_bit_sdcard_defconfig) builds
a bootable kernel 5.13 image that uses the board SD card for the root
file system. This configuration uses the default busybox minimal
configuration.

Both configurations share the same device tree which is provided by and
built-in the kernel. This configuration is set with the kernel
configuration snippet provided by the configuration file
board/sipeed/maix-bit/linux-dtb.config.

Both configurations also share the same init script provided using the
rootfs_overlay root file system overlay. This provides the /sbin/init
script which replaces the default init process as it causes failures
due to excessive memory usage.

busybox-tiny.config and the rootfs overlay will be reused for all
Canaan K210 SoC based boards. These 2 files are thus placed in the
directory board/canaan/k210-common while the Sipeed MAIX-bit board
specific kernel config snippet is added under the directory
board/sipeed/maix-bit.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 board/canaan/k210-common/busybox-tiny.config  | 243 ++++++++++++++++++
 board/canaan/k210-common/rootfs_overlay/init  |   1 +
 .../k210-common/rootfs_overlay/sbin/init      |  27 ++
 board/sipeed/maix-bit/linux-dtb.config        |   2 +
 configs/sipeed_maix_bit_defconfig             |  15 ++
 configs/sipeed_maix_bit_sdcard_defconfig      |  14 +
 6 files changed, 302 insertions(+)
 create mode 100644 board/canaan/k210-common/busybox-tiny.config
 create mode 120000 board/canaan/k210-common/rootfs_overlay/init
 create mode 100755 board/canaan/k210-common/rootfs_overlay/sbin/init
 create mode 100644 board/sipeed/maix-bit/linux-dtb.config
 create mode 100644 configs/sipeed_maix_bit_defconfig
 create mode 100644 configs/sipeed_maix_bit_sdcard_defconfig

diff --git a/board/canaan/k210-common/busybox-tiny.config b/board/canaan/k210-common/busybox-tiny.config
new file mode 100644
index 0000000000..f78b837b2a
--- /dev/null
+++ b/board/canaan/k210-common/busybox-tiny.config
@@ -0,0 +1,243 @@
+#
+# Additional config changes for busybox-minimal.config
+# to reduce the size of the busybox executable.
+#
+
+#
+# Settings
+#
+# CONFIG_INCLUDE_SUSv2 is not set
+# CONFIG_LONG_OPTS is not set
+# CONFIG_LFS is not set
+# CONFIG_FEATURE_DEVPTS is not set
+# CONFIG_FEATURE_SYSLOG_INFO is not set
+# CONFIG_FEATURE_SYSLOG is not set
+
+#
+# Build Options
+#
+CONFIG_NOMMU=y
+CONFIG_EXTRA_CFLAGS="-Os -fPIC"
+CONFIG_EXTRA_LDFLAGS="-Os -static -Wl,-elf2flt=-r"
+# CONFIG_STACK_OPTIMIZATION_386 is not set
+
+#
+# Library Tuning
+#
+# CONFIG_FEATURE_RTMINMAX is not set
+# CONFIG_FEATURE_RTMINMAX_USE_LIBC_DEFINITIONS is not set
+# CONFIG_FEATURE_BUFFERS_USE_MALLOC is not set
+CONFIG_FEATURE_BUFFERS_GO_ON_STACK=y
+# CONFIG_FEATURE_EDITING_VI is not set
+# CONFIG_FEATURE_EDITING_SAVEHISTORY is not set
+# CONFIG_FEATURE_REVERSE_SEARCH is not set
+# CONFIG_FEATURE_EDITING_WINCH is not set
+# CONFIG_FEATURE_HWIB is not set
+
+#
+# Applets
+#
+
+#
+# Archival Utilities
+#
+# CONFIG_ZCAT is not set
+# CONFIG_BZCAT is not set
+# CONFIG_LZCAT is not set
+# CONFIG_XZCAT is not set
+# CONFIG_UNLZOP is not set
+# CONFIG_LZOPCAT is not set
+
+#
+# Coreutils
+#
+# CONFIG_CKSUM is not set
+# CONFIG_DOS2UNIX is not set
+# CONFIG_UNIX2DOS is not set
+# CONFIG_DU is not set
+# CONFIG_FACTOR is not set
+# CONFIG_FOLD is not set
+# CONFIG_HEAD is not set
+# CONFIG_INSTALL is not set
+# CONFIG_LINK is not set
+# CONFIG_LOGNAME is not set
+# CONFIG_MD5SUM is not set
+# CONFIG_SHA1SUM is not set
+# CONFIG_SHA256SUM is not set
+# CONFIG_SHA512SUM is not set
+# CONFIG_SHA3SUM is not set
+# CONFIG_MKFIFO is not set
+# CONFIG_NICE is not set
+# CONFIG_NL is not set
+# CONFIG_NOHUP is not set
+# CONFIG_OD is not set
+# CONFIG_PASTE is not set
+# CONFIG_SHRED is not set
+# CONFIG_SORT is not set
+# CONFIG_TAIL is not set
+# CONFIG_TEE is not set
+# CONFIG_TIMEOUT is not set
+# CONFIG_TR is not set
+# CONFIG_UNIQ is not set
+# CONFIG_UUDECODE is not set
+# CONFIG_BASE32 is not set
+# CONFIG_UUENCODE is not set
+# CONFIG_WC is not set
+# CONFIG_WHOAMI is not set
+# CONFIG_WHO is not set
+# CONFIG_W is not set
+# CONFIG_USERS is not set
+# CONFIG_YES is not set
+
+#
+# Common options
+#
+# CONFIG_FEATURE_VERBOSE is not set
+
+#
+# Debian Utilities
+#
+# CONFIG_RUN_PARTS is not set
+# CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS is not set
+# CONFIG_FEATURE_RUN_PARTS_FANCY is not set
+# CONFIG_START_STOP_DAEMON is not set
+# CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS is not set
+# CONFIG_FEATURE_START_STOP_DAEMON_FANCY is not set
+# CONFIG_WHICH is not set
+
+#
+# klibc-utils
+#
+# CONFIG_NUKE is not set
+# CONFIG_RESUME is not set
+# CONFIG_RUN_INIT is not set
+
+#
+# Editors
+#
+# CONFIG_SED is not set
+CONFIG_VI=y
+CONFIG_FEATURE_VI_MAX_LEN=4096
+CONFIG_FEATURE_VI_COLON=y
+CONFIG_FEATURE_VI_YANKMARK=y
+CONFIG_FEATURE_VI_USE_SIGNALS=y
+CONFIG_FEATURE_VI_DOT_CMD=y
+CONFIG_FEATURE_VI_READONLY=y
+CONFIG_FEATURE_VI_SETOPTS=y
+CONFIG_FEATURE_VI_SET=y
+CONFIG_FEATURE_VI_WIN_RESIZE=y
+CONFIG_FEATURE_VI_ASK_TERMINAL=y
+CONFIG_FEATURE_VI_UNDO=y
+
+#
+# Finding Utilities
+#
+CONFIG_GREP=y
+# CONFIG_EGREP is not set
+# CONFIG_FGREP is not set
+# CONFIG_XARGS is not set
+
+#
+# Init Utilities
+#
+# CONFIG_HALT is not set
+# CONFIG_POWEROFF is not set
+# CONFIG_FEATURE_WAIT_FOR_INIT is not set
+# CONFIG_FEATURE_CALL_TELINIT is not set
+# CONFIG_INIT is not set
+# CONFIG_LINUXRC is not set
+
+#
+# Login/Password Management Utilities
+#
+# CONFIG_FEATURE_SHADOWPASSWDS is not set
+# CONFIG_USE_BB_CRYPT is not set
+# CONFIG_USE_BB_CRYPT_SHA is not set
+# CONFIG_ADDUSER is not set
+# CONFIG_GETTY is not set
+# CONFIG_LOGIN is not set
+# CONFIG_PASSWD is not set
+
+#
+# Linux System Utilities
+#
+# CONFIG_FALLOCATE is not set
+# CONFIG_FREERAMDISK is not set
+# CONFIG_FSFREEZE is not set
+# CONFIG_GETOPT is not set
+# CONFIG_XXD is not set
+# CONFIG_MESG is not set
+# CONFIG_MKE2FS is not set
+# CONFIG_MKDOSFS is not set
+# CONFIG_FEATURE_MOUNT_CIFS is not set
+# CONFIG_FEATURE_MOUNT_FSTAB is not set
+# CONFIG_FEATURE_MOUNT_OTHERTAB is not set
+# CONFIG_NOLOGIN is not set
+# CONFIG_LINUX32 is not set
+# CONFIG_LINUX64 is not set
+# CONFIG_SETPRIV is not set
+
+#
+# Common options for mount/umount
+#
+# CONFIG_FEATURE_MOUNT_LOOP is not set
+# CONFIG_FEATURE_MOUNT_LOOP_CREATE is not set
+
+#
+# Miscellaneous Utilities
+#
+# CONFIG_BC is not set
+# CONFIG_HEXEDIT is not set
+# CONFIG_I2CTRANSFER is not set
+# CONFIG_LSSCSI is not set
+# CONFIG_MIM is not set
+# CONFIG_PARTPROBE is not set
+# CONFIG_SETFATTR is not set
+# CONFIG_SETSERIAL is not set
+# CONFIG_TS is not set
+
+#
+# Networking Utilities
+#
+# CONFIG_HOSTNAME is not set
+# CONFIG_DNSDOMAINNAME is not set
+# CONFIG_IFCONFIG is not set
+# CONFIG_IFUP is not set
+# CONFIG_IFDOWN is not set
+# CONFIG_IP is not set
+# CONFIG_IPADDR is not set
+# CONFIG_IPLINK is not set
+# CONFIG_IPROUTE is not set
+# CONFIG_NC is not set
+# CONFIG_NETSTAT is not set
+# CONFIG_PING is not set
+# CONFIG_ROUTE is not set
+# CONFIG_TC is not set
+# CONFIG_TELNET is not set
+# CONFIG_WGET is not set
+# CONFIG_UDHCPC is not set
+
+#
+# Process Utilities
+#
+# CONFIG_KILLALL is not set
+# CONFIG_KILLALL5 is not set
+
+#
+# Runit Utilities
+#
+# CONFIG_SVC is not set
+# CONFIG_SVOK is not set
+
+#
+# Shells
+#
+CONFIG_BASH_IS_HUSH=y
+# CONFIG_BASH_IS_NONE is not set
+# CONFIG_HUSH_SAVEHISTORY is not set
+
+#
+# Options common to all shells
+#
+# CONFIG_FEATURE_SH_READ_FRAC is not set
+# CONFIG_FEATURE_SH_EMBEDDED_SCRIPTS is not set
diff --git a/board/canaan/k210-common/rootfs_overlay/init b/board/canaan/k210-common/rootfs_overlay/init
new file mode 120000
index 0000000000..a0b71977c0
--- /dev/null
+++ b/board/canaan/k210-common/rootfs_overlay/init
@@ -0,0 +1 @@
+/sbin/init
\ No newline at end of file
diff --git a/board/canaan/k210-common/rootfs_overlay/sbin/init b/board/canaan/k210-common/rootfs_overlay/sbin/init
new file mode 100755
index 0000000000..6ec4748c03
--- /dev/null
+++ b/board/canaan/k210-common/rootfs_overlay/sbin/init
@@ -0,0 +1,27 @@
+#!/bin/sh
+
+# Mount sysfs and procfs
+/bin/mount -t sysfs sysfs /sys
+/bin/mount -t proc proc /proc
+
+# Use the /dev/console device node from devtmpfs if possible to not
+# confuse glibc's ttyname_r().
+# This may fail (E.G. booted with console=), and errors from exec will
+# terminate the shell, so use a subshell for the test
+if (exec 0</dev/console) 2>/dev/null; then
+    exec 0</dev/console
+    exec 1>/dev/console
+    exec 2>/dev/console
+fi
+
+# Print a fun logo :)
+echo "          __  _"
+echo "         / / (_) ____   _   _ __  __"
+echo "        / /  | ||  _ \\ | | | |\\ \\/ /"
+echo "       / /___| || | | || |_| | >  < "
+echo "      /_____/|_||_| |_| \\____|/_/\\_\\"
+echo "    64-bits RISC-V Kendryte K210 NOMMU"
+echo ""
+
+# Start interactive shell
+exec /bin/sh
diff --git a/board/sipeed/maix-bit/linux-dtb.config b/board/sipeed/maix-bit/linux-dtb.config
new file mode 100644
index 0000000000..de2f8fd074
--- /dev/null
+++ b/board/sipeed/maix-bit/linux-dtb.config
@@ -0,0 +1,2 @@
+CONFIG_SOC_CANAAN_K210_DTB_BUILTIN=y
+CONFIG_SOC_CANAAN_K210_DTB_SOURCE="sipeed_maix_bit"
diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
new file mode 100644
index 0000000000..1d3934e927
--- /dev/null
+++ b/configs/sipeed_maix_bit_defconfig
@@ -0,0 +1,15 @@
+BR2_riscv=y
+BR2_KERNEL_HEADERS_5_13=y
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+BR2_INIT_NONE=y
+BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-dtb.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-common/busybox-tiny.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
new file mode 100644
index 0000000000..0c787143a8
--- /dev/null
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -0,0 +1,14 @@
+BR2_riscv=y
+BR2_KERNEL_HEADERS_5_13=y
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+BR2_INIT_NONE=y
+BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-dtb.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+BR2_TARGET_ROOTFS_EXT2=y
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
