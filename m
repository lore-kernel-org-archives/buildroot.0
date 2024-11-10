Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751FAD12D4F
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 18:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DC8660655;
	Sun, 10 Nov 2024 18:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygxUF69bYpnk; Sun, 10 Nov 2024 18:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61D1660639
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61D1660639;
	Sun, 10 Nov 2024 18:44:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7707FD8F
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 18:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66468808D8
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 18:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rw-11BFE9CfI for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 18:44:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82D18808AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82D18808AD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82D18808AD
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 18:44:49 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:812c:23ef:fa95:555a])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 51E1F6012F;
 Sun, 10 Nov 2024 19:44:45 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Sun, 10 Nov 2024 19:43:24 +0100
Message-ID: <20241110184324.50580-2-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241110184324.50580-1-vjardin@free.fr>
References: <20241110184324.50580-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731264287;
 bh=3JuOSt6tougoPkGtG0v1q+gMCdAW5NLa9aGLCMKfAto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HhsFksv0xxCKFHZydZlJwQMPRs7HgUSLBCKFPsAo65RdxiI1mZ+4Nbo8Gt6OEnTOa
 HaqxmP27M4pG/CySedx5nBmooajxROrRWDn/RTKRDUR+kB5HnaO6S//arWKYmQ9iMN
 X//6y1BKXgOq6u3g/FypwDP1oNah+fI6o0jg/WsVERXJtbOgLl/s0OxsY3urS3ewYM
 uie2ypSt0qeWXvviUQJH7TvQFroQVsJk4jR8TSXp/+YtdQGSbhM/QdWGXiL5WkcTOU
 qARgyGw7tV2mbndw8DGui5t+RTvKD0sFy2ZOU/Tu/w179t1qWFKlFWXPINe4yVRUC3
 S1dDgySPdnbEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HhsFksv0
Subject: [Buildroot] [PATCH v1 1/1] board/nvidia/bf3: set eth names
 according to doc
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

Set the names of the Ethernet interfaces that are exposed from a first
boot so they are aligned with those described by Mellanox/NVIDIA
documentation for the BF3.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 .../bf3/rootfs_overlay/etc/init.d/S04ifnames  | 61 +++++++++++++++++++
 configs/nvidia_bf3_defconfig                  |  3 +
 2 files changed, 64 insertions(+)
 create mode 100755 board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames

diff --git a/board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames b/board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames
new file mode 100755
index 0000000000..adb43f1e2c
--- /dev/null
+++ b/board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames
@@ -0,0 +1,61 @@
+#!/bin/sh
+# Rename the board's interfaces according to Mellanox/NVIDIA's documentation
+
+rename_interface() {
+    bus_info=$1
+    new_name=$2
+    alt_name=$3
+
+    # Find the current interface name based on bus-info
+    iface=$(find /sys/class/net -type l -exec sh -c '
+        for i; do
+            [ "$(basename "$(readlink -f "$i"/device)")" = "$0" ] && basename "$i"
+        done
+    ' "$bus_info" {} +)
+
+    # Rename the interface if found
+    if [ -n "$iface" ]; then
+        ip link set "$iface" name "$new_name"
+        printf "%s to %s" "$iface" "$new_name"
+
+        # Set altname if provided
+        if [ -n "$alt_name" ]; then
+            ip link property add dev "$new_name" altname "$alt_name"
+            printf "/%s" "$alt_name"
+        fi
+        printf "; "
+    else
+        echo "$bus_info not found"
+    fi
+}
+
+case "$1" in
+    start)
+        printf "Starting interface renaming:"
+        # Initialize success flag
+        rename_allok=0
+        rename_interface "0000:03:00.0" "p0" "enp3s0f0np0" || rename_allok=1
+        rename_interface "0000:03:00.1" "p1" "enp3s0f1np1" || rename_allok=1
+        rename_interface "MLNXBF17:00" "oob_net0" "enamlnxbf17i0" || rename_allok=1
+        rename_interface "virtio1" "tmfifo_net0" || rename_allok=1
+
+	if [ "$rename_allok" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+        ;;
+    stop)
+        ;;
+    restart)
+        # Optional: Handle restart by calling start after stop
+        $0 stop
+        $0 start
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/configs/nvidia_bf3_defconfig b/configs/nvidia_bf3_defconfig
index 3f958c0062..c5b00aae83 100644
--- a/configs/nvidia_bf3_defconfig
+++ b/configs/nvidia_bf3_defconfig
@@ -10,3 +10,6 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/nvidia/bf3/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_OVERLAY="board/nvidia/bf3/rootfs_overlay"
+BR2_PACKAGE_LIBMNL=y
+BR2_PACKAGE_IPROUTE2=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
