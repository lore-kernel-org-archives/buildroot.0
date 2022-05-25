Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B8DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 13:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84C5F41C32;
	Wed, 25 May 2022 13:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OxTReTzj_uSK; Wed, 25 May 2022 13:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 485A941C15;
	Wed, 25 May 2022 13:36:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 134361BF31F
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEFFA61307
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFMMfnanKewu for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 13:34:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2D0B612F5
 for <buildroot@buildroot.org>; Wed, 25 May 2022 13:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653485685; x=1685021685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uGks6EMPltVzNUhg9wnXUF9xEdEE64b7Nt1grwGFDs8=;
 b=kucbO/CupeY89v5YPmOyg94spzUqO6L1uevfUiGnZbtzkzKb5Xc28L8V
 4asBA3gM+x1NkzHjuuyW0zP1aAbbLHk2Qyi1FUrJfooSFH0U8yh8sPjGM
 JeCZtsP2ojgioEVzc3xUZqaGUCeDtzjmEVlvJIIaulEmgDAL+dyeP95+v
 IpAKaeNXOLbdjl6z3ZZT7lieent8fZEFjmoHPpWsbwuzI7ycXV+7CstID
 a3pC2srDbu8u0JNeSjahBVpDsDjWNrDErUrvtOgRNZLUN9PzlAyZx3Rfv
 gfMa7AEdhlQ/opg6XMy6Dr1cXgEKvwD00M4e9IhCtAc3VGGDkzgZh2Gpu Q==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305635101"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 21:27:39 +0800
IronPort-SDR: L487wrfyewXChRCqZyhp5/vzVtE01H2WaVtBCxF43ya5mwKzBaJ9dxPgh8RiicNlA0wCMjYysz
 LbGK5eKziQuRlLG4J8E7RgB/ZYdODFrMBmHSVv4VakP72hDPIJELKGR/wIfaUfS6B2F4Sgmhan
 8ZURImQL4c8z/MNN81qbnDvjNqVP/TusIeKrp+e7EnkNPpMi60W/QppSYOu2Y5lS5yGn5L0lEQ
 OGjd85+0i4Bylfwx8xSN1BlFklfGkxo/CvN597zYWFMIlZtVrAj63BBlJqlp6WrIilHEmaAuJe
 JkrcGhgp0L8fxF+MTBcidGKb
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 05:51:35 -0700
IronPort-SDR: A6Qfk4NACfzENSKn3ZGS9U3hQCGMPXgwQmXBbKcEpEATS9xRuKelVZWEQ/oLqM64ZWV5Lo4khq
 qhk0v7dIzQuMHBPIrw0Y2VNH0aeVcUB+MGLNsoJ4ZLKsyvdKUKTgt0YBiRO5iNa9Sr67Dzgd1D
 oLWZHw1XXpOcdKQxoaxo/2pf39re4UtVNTY5VZl2loMrnBhTsN677ClyKNK3Mk6YASOTj/z08u
 GkiVUzhZqkIlIUMK15/wcVRxN3s30PhCocrrnEuA7PfWZlpJF/o2looxrU5ZyTeRRtDO7Ge6ol
 R4I=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.54])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 May 2022 06:27:37 -0700
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 May 2022 22:27:24 +0900
Message-Id: <20220525132729.2349105-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525132729.2349105-1-damien.lemoal@wdc.com>
References: <20220525132729.2349105-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 06/11] board: Add common support for Canaan K210
 SoC-based boards
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <damien.lemoal@wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Damien Le Moal <damien.lemoal@opensource.wdc.com>

The Linux environment for all boards using the Canaan Kendryte K210 SoC
can be built with the same process, using configurations that differ
only by the device tree used for the build. This patch add the
shared configurations, rootfs overlay and scripts used for all
K210-based boards.

Since the K210 SoC only has 8 MB of SRAM, a special busybox
configuration and rootfs overlay are added to save memory at runtime:
* For configurations using direct kernel boot (no boot loader), the
  default busybox configuration busybox-minimal.config is modified
  using the fragment file board/canaan/k210-soc/busybox-tiny.config.
  This reduces the size of the busybox executable to save memory when
  executing shell commands.
* Busybox init system is not used and a special init scripts is provided
  using the rootfs_overlay root file system overlay. This init script
  simply mounts devtmpfs, /proc and /sys, and exec an interactive shell
  after printing a logo. This avoids (1) boot failures due to large
  memory allocations by the regular busybox init system (these
  allocations fail on the K210 for lack of enough memory) and avoids
  (2) keeping the init process sleeping in the background (wasted
  memory).

The board/canaan/k210-soc/busybox-tiny.config and the rootfs overlay
files in board/canaan/k210-soc/rootfs_overlay are used for all Canaan
K210 SoC based boards.

For board configurations booting using the U-Boot boot loader, a common
set of linux kernel configuration parameters is provided by the file
board/canaan/k210-soc/linux-sdcard.config. In addition, the post build
script board/canaan/k210-soc/post-build.sh file and U-Boot image
generation configuration file board/canaan/k210-soc/genimage.cfg are
provided. The post-build script creates a generic "k210.dtb" symlink to
the compiled device tree file for the target board. This symlink is used
by the genimage.cfg configuration, making this file common for all
boards.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 DEVELOPERS                                    |   3 +
 board/canaan/k210-soc/busybox-tiny.config     | 231 ++++++++++++++++++
 board/canaan/k210-soc/genimage.cfg            |  30 +++
 board/canaan/k210-soc/linux-sdcard.config     |   4 +
 board/canaan/k210-soc/post-build.sh           |  28 +++
 board/canaan/k210-soc/rootfs_overlay/init     |   1 +
 .../canaan/k210-soc/rootfs_overlay/sbin/init  |  41 ++++
 board/canaan/k210-soc/uboot.config            |   1 +
 8 files changed, 339 insertions(+)
 create mode 100644 board/canaan/k210-soc/busybox-tiny.config
 create mode 100644 board/canaan/k210-soc/genimage.cfg
 create mode 100644 board/canaan/k210-soc/linux-sdcard.config
 create mode 100755 board/canaan/k210-soc/post-build.sh
 create mode 120000 board/canaan/k210-soc/rootfs_overlay/init
 create mode 100755 board/canaan/k210-soc/rootfs_overlay/sbin/init
 create mode 100644 board/canaan/k210-soc/uboot.config

diff --git a/DEVELOPERS b/DEVELOPERS
index c33959fa45..5b99946f11 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -630,6 +630,9 @@ N:	Damien Lanson <damien@kal-host.com>
 F:	package/libvdpau/
 F:	package/log4cpp/
 
+N:	Damien Le Moal <damien.lemoal@wdc.com>
+F:	board/canaan/
+
 N:	Daniel Nicoletti <dantti12@gmail.com>
 F:	package/cutelyst/
 
diff --git a/board/canaan/k210-soc/busybox-tiny.config b/board/canaan/k210-soc/busybox-tiny.config
new file mode 100644
index 0000000000..9db12b560a
--- /dev/null
+++ b/board/canaan/k210-soc/busybox-tiny.config
@@ -0,0 +1,231 @@
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
diff --git a/board/canaan/k210-soc/genimage.cfg b/board/canaan/k210-soc/genimage.cfg
new file mode 100644
index 0000000000..da7d5dbafb
--- /dev/null
+++ b/board/canaan/k210-soc/genimage.cfg
@@ -0,0 +1,30 @@
+image boot.vfat {
+	vfat {
+		file uImage {
+			image = "uImage"
+		}
+
+		file k210.dtb {
+			image = "k210.dtb"
+		}
+	}
+	size = 4M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		image = "boot.vfat"
+		bootable = "true"
+		offset = 4M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 64M
+	}
+}
diff --git a/board/canaan/k210-soc/linux-sdcard.config b/board/canaan/k210-soc/linux-sdcard.config
new file mode 100644
index 0000000000..4b0ead78a7
--- /dev/null
+++ b/board/canaan/k210-soc/linux-sdcard.config
@@ -0,0 +1,4 @@
+CONFIG_BUILTIN_DTB=n
+CONFIG_SOC_CANAAN_K210_DTB_BUILTIN=n
+CONFIG_SOC_CANAAN_K210_DTB_SOURCE=""
+CONFIG_CMDLINE="earlycon console=ttySIF0 root=/dev/mmcblk0p2 rootwait ro"
diff --git a/board/canaan/k210-soc/post-build.sh b/board/canaan/k210-soc/post-build.sh
new file mode 100755
index 0000000000..5b6f56a2c5
--- /dev/null
+++ b/board/canaan/k210-soc/post-build.sh
@@ -0,0 +1,28 @@
+#!/bin/sh
+
+MKIMAGE=${HOST_DIR}/bin/mkimage
+
+# Generate u-Boot kernel image
+${MKIMAGE} -A riscv -O linux -T kernel -C none \
+	-a 0x80000000 -e 0x80000000 \
+	-n Linux -d ${BINARIES_DIR}/loader.bin ${BINARIES_DIR}/uImage
+
+# Link the kernel-built board dtb file to using the k210.dtb generic
+# name for use by genimage.cfg
+BOARDDTBKPATH="$(grep BR2_LINUX_KERNEL_INTREE_DTS_NAME ${BR2_CONFIG} | cut -d'=' -f2 | tr -d \")"
+
+BOARDDTB="$(basename ${BOARDDTBKPATH})"
+if [ -z "${BOARDDTB}" ]; then
+	echo "Board DTB file not specified"
+	exit 1
+fi
+
+BOARDDTB="${BINARIES_DIR}/${BOARDDTB}.dtb"
+if [ ! -f "${BOARDDTB}" ]; then
+        echo "Board DTB file not found in ${BINARIES_DIR}"
+        exit 1
+fi
+
+TARGETDTB=${BINARIES_DIR}/k210.dtb
+rm -f ${TARGETDTB}
+ln -s ${BOARDDTB} ${TARGETDTB}
diff --git a/board/canaan/k210-soc/rootfs_overlay/init b/board/canaan/k210-soc/rootfs_overlay/init
new file mode 120000
index 0000000000..a0b71977c0
--- /dev/null
+++ b/board/canaan/k210-soc/rootfs_overlay/init
@@ -0,0 +1 @@
+/sbin/init
\ No newline at end of file
diff --git a/board/canaan/k210-soc/rootfs_overlay/sbin/init b/board/canaan/k210-soc/rootfs_overlay/sbin/init
new file mode 100755
index 0000000000..d4bf53d452
--- /dev/null
+++ b/board/canaan/k210-soc/rootfs_overlay/sbin/init
@@ -0,0 +1,41 @@
+#!/bin/sh
+
+# This script replaces the default busybox init process to avoid having that
+# process staying alive and sleeping in the background, (uselessly) consuming
+# precious memory.
+
+# Mount procfs and sysfs
+/bin/mount -t proc proc /proc
+/bin/mount -t sysfs sysfs /sys
+
+# When the kernel is directly booted, devtmpfs is not automatically mounted.
+# Manually mount it if needed.
+devmnt=$(mount | grep -c devtmpfs)
+if [ ${devmnt} -eq 0 ]; then
+    /bin/mount -t devtmpfs devtmpfs /dev
+fi
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
+# Clear memory to reduce page fragmentation
+echo 3 > /proc/sys/vm/drop_caches
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
+# Finally, let's start an interactive shell
+exec /bin/sh
diff --git a/board/canaan/k210-soc/uboot.config b/board/canaan/k210-soc/uboot.config
new file mode 100644
index 0000000000..159085f802
--- /dev/null
+++ b/board/canaan/k210-soc/uboot.config
@@ -0,0 +1 @@
+# CONFIG_WATCHDOG_AUTOSTART is not set
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
