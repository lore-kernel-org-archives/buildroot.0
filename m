Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D78C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D0E280F87;
	Fri, 28 Feb 2025 17:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5HRxZZ9F0ZL; Fri, 28 Feb 2025 17:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CF5B80FBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CF5B80FBA;
	Fri, 28 Feb 2025 17:09:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19D9468
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31864400AE
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XWu6PA85qyx for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE39542F2A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE39542F2A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA81C85E25; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 19:03:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2e8a600fea1f29fb4162ba6e2a2f9b62c1d6e50e
X-Git-Newrev: b77e4685595c81a25a05346e2074daed32d05651
X-Patchwork-Hint: ignore
Message-Id: <20250228163026.EA81C85E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/nvidia/bf3: set eth
 names according to doc
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b77e4685595c81a25a05346e2074daed32d05651
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Set the names of the Ethernet interfaces that are exposed from a first
boot so they are aligned with those described by Mellanox/NVIDIA
documentation for the BF3.

Those tmfifo and oob interface names are describeded at:
  https://docs.nvidia.com/networking/display/bluefielddpuosv460/host-side+interface+configuration

When running the native Ubuntu on the BF3 board, the following udev
rules are set:
$ cat /etc/udev/rules.d/91-tmfifo_net.rules
SUBSYSTEM=="net", ACTION=="add", DEVPATH=="/devices/platform/MLNXBF01:00/virtio1/net/eth[0-9]", NAME="tmfifo_net0"

$ cat /etc/udev/rules.d/92-oob_net.rules
SUBSYSTEM=="net", ACTION=="add", DEVPATH=="/devices/platform/MLNXBF17:00/net/e*", NAME="oob_net0", RUN+="/sbin/sysctl -w net.ipv4.conf.oob_net0.arp_notify=1"

The default CX ports of the BF3 are:
ubuntu@bf$ ip link show p0
4: p0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode
   DEFAULT group default qlen 1000
    link/ether a0:88:c2:xx:xx:xx brd ff:ff:ff:ff:ff:ff
    altname enp3s0f0np0
ubuntu@bf$ ip link show p1
5: p1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode
   DEFAULT group default qlen 1000
    link/ether a0:88:c2:xx:xx:xx brd ff:ff:ff:ff:ff:ff
    altname enp3s0f1np1

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../bf3/rootfs_overlay/etc/init.d/S04ifnames       | 66 ++++++++++++++++++++++
 configs/nvidia_bf3_defconfig                       |  3 +
 2 files changed, 69 insertions(+)

diff --git a/board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames b/board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames
new file mode 100755
index 0000000000..88c03fd044
--- /dev/null
+++ b/board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames
@@ -0,0 +1,66 @@
+#!/bin/sh
+# Rename the board's interfaces according to Mellanox/NVIDIA's documentation
+
+DESC="bf3 interface renaming"
+DAEMON=ifnames
+
+rename_interface() {
+	bus_info=$1
+	new_name=$2
+	alt_name=$3
+
+	# Find the current interface name based on bus-info
+	iface=$(find /sys/class/net -type l -exec sh -c '
+	for i; do
+		[ "$(basename "$(readlink -f "$i"/device)")" = "$0" ] && basename "$i"
+	done
+	' "$bus_info" {} +)
+
+	# Rename the interface if found
+	if [ -n "$iface" ]; then
+		ip link set "$iface" name "$new_name"
+		printf "%s to %s" "$iface" "$new_name"
+
+		# Set altname if provided
+		if [ -n "$alt_name" ]; then
+			ip link property add dev "$new_name" altname "$alt_name"
+			printf "/%s" "$alt_name"
+		fi
+		printf "; "
+	else
+		echo "$bus_info not found"
+	fi
+}
+
+case "$1" in
+	start)
+		printf "Starting %s [%s]: " "$DESC" "$DAEMON"
+		# Initialize success flag
+		rename_allok=0
+		rename_interface "0000:03:00.0" "p0" "enp3s0f0np0" || rename_allok=1
+		rename_interface "0000:03:00.1" "p1" "enp3s0f1np1" || rename_allok=1
+		rename_interface "MLNXBF17:00" "oob_net0" "enamlnxbf17i0" || rename_allok=1
+		rename_interface "virtio1" "tmfifo_net0" || rename_allok=1
+
+		if [ "$rename_allok" -eq 0 ]; then
+			echo "OK"
+		else
+			echo "FAIL"
+		fi
+		;;
+
+	stop)	;;
+
+	restart)
+		# Optional: Handle restart by calling start after stop
+		$0 stop
+		$0 start
+		;;
+
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+		;;
+esac
+
+exit 0
diff --git a/configs/nvidia_bf3_defconfig b/configs/nvidia_bf3_defconfig
index e44bb55a3a..42bcb1299d 100644
--- a/configs/nvidia_bf3_defconfig
+++ b/configs/nvidia_bf3_defconfig
@@ -3,11 +3,14 @@ BR2_cortex_a78=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
 BR2_GLOBAL_PATCH_DIR="board/nvidia/bf3/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_OVERLAY="board/nvidia/bf3/rootfs_overlay"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/nvidia/bf3/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_LIBMNL=y
+BR2_PACKAGE_IPROUTE2=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
