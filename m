Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EE1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 05:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C96BA60B9D;
	Tue, 31 May 2022 05:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5bhwNEgvGDp; Tue, 31 May 2022 05:50:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63F9E61110;
	Tue, 31 May 2022 05:50:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5ACDD1BF375
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 05:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53B2740232
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 05:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com header.b="SuhHc1HC";
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.b="IJ5meFu0"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L6nzuLAQJu6U for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 05:49:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D4D54023F
 for <buildroot@buildroot.org>; Tue, 31 May 2022 05:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653976174; x=1685512174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2kTGs8ul4ilIgxtHDyuT82YTBVhCgeHXvYjiXAqmzpQ=;
 b=SuhHc1HCx+9QhQfunRy25aguUP/kMHqbdsVo5FD6OtS04+mpGOC2MQ5g
 KOhFxYzA5561E5MDhcL/ljl2z9lERfL+Y7ygFs1WWq3VfLnSZEeTBVpt2
 +cAEweh2NyM/vlMGETDwWjNih7fBNTMXftmxQMRng1mNIeRv/uiwCcTfz
 TvjbBuV+1uOjI/PZC07328zmOvgVSqTN7Y1xWCNRJTmE1/1D6pBuAjQ5n
 52YmagCN8fyxKsbkvXPt7CnGv2ONQ5OCBGTQDdSpXfYWqSlnog7CRv+GE
 h2WW0DvwR0F0u67yOURR8mMVkHNVmx1RcmWkhDAOmhgHhalo6kRnR52WF w==;
X-IronPort-AV: E=Sophos;i="5.91,264,1647273600"; d="scan'208";a="306095078"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2022 13:49:33 +0800
IronPort-SDR: luHamoWxV6g/O0fHnaq6Go14I6KfPhP0OvJpzRw5GiVV7mz4XXxbl0NGsOVDnNWMxtoZhujz1D
 2WiH4qlN6CZK29bQGv5pXOKPkBiEyOfyE9u10VOLU+1MXQhZ5UQvFid5+0D7aIQxbwSXiyam0I
 ma9xMWnjHzypXNz2/3mms1ZxrBlkpK2P35lQiJlRM6cRU4Q+DTLIe1oUq/ksfp1JLdNhS4N1zP
 s+iLobdgVyRgDmZlxjlM1qDcBz8p8UTqO39+Sq0rHfn9sf/vO982jnlAy+Za2l+vPN9iK75CWq
 zpKwpJCP16QyICaXA1ruc/i4
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2022 22:13:19 -0700
IronPort-SDR: yG2mUeHFwm0jp0dJwwfMrrR8KPkcCqcCtfAu/qbbnxi86X4FIx/uGr3Lwpa6YaUTcvCkaPeSba
 OSWnRNNZw4W5a2XBg+GXvh0dgEnAMs0XgUooKQomBvIUCAJz+uFoBs2HsB9KhA33WYwr0mPUKT
 riHCQpCFTYubfATUX45E9kIsZeG5rwEfkoCTPG068HRxFgPvV7QIG7C62S+TsLbEe2PU59T9z1
 0fd1C5f21dGhy7N12I4W4gww97K7PvcwC+SOSSnGV3YBCBT0OeGYD7oUm3Z6nK11P0mSavW0JZ
 QV4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2022 22:49:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LC1Z52gkcz1SVp0
 for <buildroot@buildroot.org>; Mon, 30 May 2022 22:49:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653976172; x=1656568173; bh=2kTGs8ul4ilIgxtHDy
 uT82YTBVhCgeHXvYjiXAqmzpQ=; b=IJ5meFu0yb5lOpdPdUKWn9pxwfN+PV9MUo
 h9FpWwUZF29vm63yLhvHPrhAdMfW1RuD4NT6sHXjFOqMG7BxsyKqOL3xQ2bkUy64
 3/Md7dWZ2gSBn1pXMJc4DfbRM1nQyrs2OJbDuaxSeNz4zGB4hvAG+eickOhqa4Wb
 +CETqICFh4BGoiGoe8oHpFcnGoY3v5gP5W1IcKdkG4ZEYatXoTl4c7CO5SKz8aXY
 YRtXEHpo3GNl5pP1Jvl4SbIZS1QL19QyoHqp6kj3HGS4QhF1bgDLwisJ1RIkN6r5
 20nCpXm9U3xaYd8ErWkqFHnM58nhMk7bRdlnxQApXdMWOtqYe50A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Frw-9prKzdev for <buildroot@buildroot.org>;
 Mon, 30 May 2022 22:49:32 -0700 (PDT)
Received: from twashi.fujisawa.hgst.com (unknown [10.225.163.61])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LC1Z32JjDz1Rvlc;
 Mon, 30 May 2022 22:49:31 -0700 (PDT)
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 May 2022 14:49:21 +0900
Message-Id: <20220531054926.373713-3-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531054926.373713-1-damien.lemoal@opensource.wdc.com>
References: <20220531054926.373713-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/7] board: Add common support for Canaan
 K210 SoC-based boards
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
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
 DEVELOPERS                                    |   1 +
 board/canaan/k210-soc/busybox-tiny.config     | 231 ++++++++++++++++++
 board/canaan/k210-soc/genimage.cfg            |  30 +++
 board/canaan/k210-soc/linux-sdcard.config     |   4 +
 board/canaan/k210-soc/post-build.sh           |  28 +++
 board/canaan/k210-soc/rootfs_overlay/init     |   1 +
 .../canaan/k210-soc/rootfs_overlay/sbin/init  |  41 ++++
 board/canaan/k210-soc/uboot.config            |   1 +
 8 files changed, 337 insertions(+)
 create mode 100644 board/canaan/k210-soc/busybox-tiny.config
 create mode 100644 board/canaan/k210-soc/genimage.cfg
 create mode 100644 board/canaan/k210-soc/linux-sdcard.config
 create mode 100755 board/canaan/k210-soc/post-build.sh
 create mode 120000 board/canaan/k210-soc/rootfs_overlay/init
 create mode 100755 board/canaan/k210-soc/rootfs_overlay/sbin/init
 create mode 100644 board/canaan/k210-soc/uboot.config

diff --git a/DEVELOPERS b/DEVELOPERS
index 096ca94f4e..972c5de380 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -632,6 +632,7 @@ F:	package/log4cpp/
 
 N:	Damien Le Moal <damien.lemoal@wdc.com>
 F:	package/python-kflash/
+F:	board/canaan/
 
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
