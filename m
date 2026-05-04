Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F33CD342F
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 20:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 592D984746;
	Mon,  4 May 2026 20:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNydhr5qCcWs; Mon,  4 May 2026 20:31:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6812A84750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777926660;
	bh=fSazG3o0eMqoXddYfwKSdhoSDClLyoH/SAkNTtvT7xU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MCuk7H9XIMh9rOWTUkVTX1uHOckiJI3PIwnlicgG63KlFvqRud4V7/ilRR9Sjf2iw
	 bIB5rx7S8SkPsfSj6PX9uYbUm09r/BEpvNhHABZuExHYESH69pFZKOKIH86Fy/xR3I
	 vX0kG4bi7YH1w83nnhA9DepRfXOzCX16vpf2+LvcZEYPxDRnWKBURPNjfRHW8TkOLR
	 zc8do4WJWiFid/RSe4Y5Q0nqi6TZbwcsSGchXsOFMC4wF5eFV8MuXl6BgcMhL2MzB0
	 Qd09mpVdILJJj28odQcfsm74iCUSC7Jf89S39l8xJDVWj7y28+3nCcdGqcdAv26zcb
	 zazRRo2CGfKcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6812A84750;
	Mon,  4 May 2026 20:31:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C32947E
 for <buildroot@buildroot.org>; Mon,  4 May 2026 20:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71F9941BB9
 for <buildroot@buildroot.org>; Mon,  4 May 2026 20:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvUUAyj1IfjE for <buildroot@buildroot.org>;
 Mon,  4 May 2026 20:30:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5FE3F41B5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FE3F41B5A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FE3F41B5A
 for <buildroot@buildroot.org>; Mon,  4 May 2026 20:30:57 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 444475FFB1;
 Mon,  4 May 2026 22:30:51 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Cyril Bur <cyrilbur@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Julien Olivain <ju.o@free.fr>
Date: Mon,  4 May 2026 22:30:33 +0200
Message-ID: <20260504203035.1729184-2-ju.o@free.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504203035.1729184-1-ju.o@free.fr>
References: <20260504203035.1729184-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777926655;
 bh=hbhb53aDO/nIfsYlMAWlGMcFZuyepXQk3FFpe7gjo98=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=itX3V9RmtcsZ343Jxs4Q08LsouO/4flALGbx4IVgLAECg1m6VYvxqc7Veaht5Gz8j
 5AsjT+QF2sPePHtzxWKaICIB1bbwTMZy+BdQFkisz1QxquHFinda8unv6/bcLHACAN
 bXcQwGACs5NeIJK0QB1HdgODc3E09FylQVELaD7z0e6hGB7bG2k3sLe1cJnMUwu5zt
 1apL2uKkFHJ6EhTpYwyDx1yqKUDQcJYQ6lxKpRq/J4srplZXWdLlL0uO8mreC2USYo
 uPw36sGQwmdtebZYBbmyyQNPxcKLZ8ZX4wp+MfeQSPlthPVcMMMz6rvcUdEJpHZEa5
 vUgoGb01gKuvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=itX3V9Rm
Subject: [Buildroot] [PATCH 2/4] configs/qemu_ppc64le_powernv10: new
 defconfig
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Power10 CPU is supported by the Linux Kernel since v5.8
(see upstream commit [1]), and the Powernv10 machine is supported
in qemu since version v5.0.0 (see upstream commit [2]).

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a3ea40d5c7365e7e5c7c85b6f30b15142b397571
[2] https://gitlab.com/qemu-project/qemu/-/commit/2b548a4255ca07cf4d467b7fb3bdf2ab79b7dff5

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/qemu/ppc64le-powernv10/readme.txt  | 14 ++++++++++++++
 configs/qemu_ppc64le_powernv10_defconfig | 19 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 board/qemu/ppc64le-powernv10/readme.txt
 create mode 100644 configs/qemu_ppc64le_powernv10_defconfig

diff --git a/board/qemu/ppc64le-powernv10/readme.txt b/board/qemu/ppc64le-powernv10/readme.txt
new file mode 100644
index 0000000000..9ac60a2cae
--- /dev/null
+++ b/board/qemu/ppc64le-powernv10/readme.txt
@@ -0,0 +1,14 @@
+Run the emulation with:
+
+qemu-system-ppc64 \
+    -M powernv10 \
+    -kernel output/images/vmlinux \
+    -append "console=hvc0 rootwait root=/dev/nvme0n1" \
+    -device nvme,bus=pcie.3,addr=0x0,drive=drive0,serial=1234 \
+    -drive file=output/images/rootfs.ext2,if=none,id=drive0,format=raw,cache=none \
+    -device e1000e,netdev=net0,mac=C0:FF:EE:00:01:03,bus=pcie.1,addr=0x0 \
+    -netdev user,id=net0 \
+    -serial mon:stdio \
+    -nographic # qemu_ppc64le_powernv10_defconfig
+
+The login prompt will appear in the terminal window.
diff --git a/configs/qemu_ppc64le_powernv10_defconfig b/configs/qemu_ppc64le_powernv10_defconfig
new file mode 100644
index 0000000000..41765c2f17
--- /dev/null
+++ b/configs/qemu_ppc64le_powernv10_defconfig
@@ -0,0 +1,19 @@
+BR2_powerpc64le=y
+BR2_powerpc_power10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_DEFCONFIG="powernv"
+BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
