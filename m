Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DD5CD3427
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 20:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3146984768;
	Mon,  4 May 2026 20:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sib9Emyo6KK0; Mon,  4 May 2026 20:31:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 928268474D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777926669;
	bh=1ETTM+MUBMdWmPmiQgIa2c33Kwdv9BrFs7ZGdfyIJVs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=czt6fLOcU5F+NYTcw5TYgNvxkCuwTQa0ePHc7UTWkqwIgrKJDAd0FhBlWeZxIXKW1
	 EnsAgM0uR7ejHOxXb0FPS2EJ9YeNUn1wZMaZMJy1WzCeZsECzILuoqnfdlXJ46qDDI
	 JOZZj1zpRIfQaRLfPdcFD9zUVDA7Ng3XCxw6iNU52SQZJghMvSFZyAlA+qz99KwAvH
	 WDubFZSRE0mxFTeojb+w0m6R+XeAy5vXNwsywawM3Q+Vre903606RAk3cUjcFrxVyH
	 +L2Gr+nbyPL0p1dpxeInOPRqqz2ZwkqBCDZ/q8sD59C8IQroeoKtTVCJGq9fjMYHFQ
	 geNTFb+SPQ2YA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 928268474D;
	Mon,  4 May 2026 20:31:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 025B147E
 for <buildroot@buildroot.org>; Mon,  4 May 2026 20:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E882D41BB9
 for <buildroot@buildroot.org>; Mon,  4 May 2026 20:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPxJvL85jzII for <buildroot@buildroot.org>;
 Mon,  4 May 2026 20:31:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E4F9341B5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4F9341B5A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4F9341B5A
 for <buildroot@buildroot.org>; Mon,  4 May 2026 20:31:06 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7ADC35FFBA;
 Mon,  4 May 2026 22:31:00 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Cyril Bur <cyrilbur@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Julien Olivain <ju.o@free.fr>
Date: Mon,  4 May 2026 22:30:35 +0200
Message-ID: <20260504203035.1729184-4-ju.o@free.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504203035.1729184-1-ju.o@free.fr>
References: <20260504203035.1729184-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777926665;
 bh=RQe7vklffT4HdjPgh8AnKwyh18H65ZqDaX9TKWhzYDU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tw6ZQVggaJVq70NNx9kCcJ+u65f8HRxajr+fY2rEb2yC3mPlN/Asiu1W5L+IJuRFF
 b9uwv4tbhwjDk1XSQqWhDHxbgYkWZyqRx1x6fur47vjXj+6q/OTQd4VD9Ka0jOVCTZ
 dzAMqkvj6llejoaf88LzxPIKKTGcwMxhNILlvwCHl1KpEpgUksaXQ657MhPeWmPSxM
 fa3JGrcbGarhj6N6a+Jk/MqQA7mBEmAcIwZjg4Bhj6KvP+7TOdfCW2bwkyzz+KxwCC
 t4ADgc2Ce7T6dQ8IrIhsw0UnxK4Y3AgivxejFGMK0pQ16vQrSK5DaYUaA53V5czMve
 8pV7n45KPvuBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tw6ZQVgg
Subject: [Buildroot] [PATCH 4/4] configs/qemu_ppc64le_powernv11: new
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

The Power11 CPU is supported by the Linux Kernel since v6.9
(see upstream commit [1]), and the Powernv11 machine is supported
in qemu since version v10.2.0 (see upstream commit [2]).

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=c2ed087ed35ca569d8179924ba560be248c758e5
[2] https://gitlab.com/qemu-project/qemu/-/commit/73a911e966acd8314e39a4ce4bc58e2254e68324

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/qemu/ppc64le-powernv11/readme.txt  | 14 ++++++++++++++
 configs/qemu_ppc64le_powernv11_defconfig | 19 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 board/qemu/ppc64le-powernv11/readme.txt
 create mode 100644 configs/qemu_ppc64le_powernv11_defconfig

diff --git a/board/qemu/ppc64le-powernv11/readme.txt b/board/qemu/ppc64le-powernv11/readme.txt
new file mode 100644
index 0000000000..368bad0264
--- /dev/null
+++ b/board/qemu/ppc64le-powernv11/readme.txt
@@ -0,0 +1,14 @@
+Run the emulation with:
+
+qemu-system-ppc64 \
+    -M powernv11 \
+    -kernel output/images/vmlinux \
+    -append "console=hvc0 rootwait root=/dev/nvme0n1" \
+    -device nvme,bus=pcie.3,addr=0x0,drive=drive0,serial=1234 \
+    -drive file=output/images/rootfs.ext2,if=none,id=drive0,format=raw,cache=none \
+    -device e1000e,netdev=net0,mac=C0:FF:EE:00:01:03,bus=pcie.1,addr=0x0 \
+    -netdev user,id=net0 \
+    -serial mon:stdio \
+    -nographic # qemu_ppc64le_powernv11_defconfig
+
+The login prompt will appear in the terminal window.
diff --git a/configs/qemu_ppc64le_powernv11_defconfig b/configs/qemu_ppc64le_powernv11_defconfig
new file mode 100644
index 0000000000..94266a22d5
--- /dev/null
+++ b/configs/qemu_ppc64le_powernv11_defconfig
@@ -0,0 +1,19 @@
+BR2_powerpc64le=y
+BR2_powerpc_power11=y
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
