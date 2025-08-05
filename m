Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0A3C87FD1
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 19:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0D23840B2;
	Tue,  5 Aug 2025 19:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpLh-xvvO2xW; Tue,  5 Aug 2025 19:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6E4E840AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6E4E840AB;
	Tue,  5 Aug 2025 19:07:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D590113C
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 19:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EF5041C3D
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 19:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NII7MSqLVa9S for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 19:07:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::235;
 helo=relay15.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BAA7C40830
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAA7C40830
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAA7C40830
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 19:07:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 677A4442FF;
 Tue,  5 Aug 2025 19:07:29 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Tue,  5 Aug 2025 21:07:26 +0200
Message-ID: <20250805190727.1696620-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudehleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdduleejleetieefffethfevheekjeevffegleejveeggeeffeevueelleegvdfhnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpt
 hhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754420849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SatV2uiFhwDNWbNCfBUDJ4m2WztZRvkaz8KfOQzbF64=;
 b=RW/lzE1CO+JZKB/DDvhRM0gagPK5G6yZO/s4d9JNjOjHdwZYGPesSwsZdRRt3RAOn62r6G
 laEIOx1Qpt9xTe8UE3LSirnKBmZnUym4t1/5fAcaOcxohPjyEOOTHZChbxqaDiXuldKDxG
 8BjSNbIQU9AmxIJKCUkuO+NKiTLtD18uPPKIuAL0b4otN6ElY8SnBnAwEH8biExLGUt5g2
 uX0OpiMeBz91DQmIiRVTPcbC9jtUTmeYJWhITC+5dGjCcU0kcVDFcJGyFIwuhoQ2qHc5rV
 0pdtssEpeS+Y4W2uKwVnnNFu/hDwE17tKHQy2cX0rXimztZd6Mz028qt+tpVhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RW/lzE1C
Subject: [Buildroot] [PATCH] configs/qemu_sh4*: switch back to disk emulation
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Back in commit
44a6b7866c95ca5459a53a50eab5ab1d38b6b8e1 ("configs/qemu_sh4*: switch
to initramfs"), the Qemu SuperH defconfigs were switched to initramfs
due to a bug in the Qemu disk emulation.

However, the initramfs solution has an issue: if the initramfs is
slightly too large (like just 6 MB!), the system no longer boots.

Since the disk emulation problem has apparently been resolved in Qemu
10 (according to testing), let's switch back to this.

In addition to essentially reverting
44a6b7866c95ca5459a53a50eab5ab1d38b6b8e1, we also need to adjust the
kernel configuration so that the kernel takes its command line for the
bootloader (in our case from the Qemu -append option). Otherwise an
hardcoded command line is used, which doesn't mount /dev/sda as the
root filesystem.

This update has been tested on Gitlab CI:

  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1968267919

Thanks to Romain Naour for pointing to the initramfs size as being the
issue.

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/sh4-r2d/linux.config   | 1 +
 board/qemu/sh4-r2d/readme.txt     | 2 +-
 board/qemu/sh4eb-r2d/linux.config | 1 +
 board/qemu/sh4eb-r2d/readme.txt   | 2 +-
 configs/qemu_sh4_r2d_defconfig    | 2 +-
 configs/qemu_sh4eb_r2d_defconfig  | 2 +-
 6 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/board/qemu/sh4-r2d/linux.config b/board/qemu/sh4-r2d/linux.config
index a3d6544549..dd4bf5204f 100644
--- a/board/qemu/sh4-r2d/linux.config
+++ b/board/qemu/sh4-r2d/linux.config
@@ -5,6 +5,7 @@ CONFIG_MEMORY_START=0x0c000000
 CONFIG_FLATMEM_MANUAL=y
 CONFIG_SH_RTS7751R2D=y
 CONFIG_RTS7751R2D_PLUS=y
+CONFIG_CMDLINE_FROM_BOOTLOADER=y
 CONFIG_HEARTBEAT=y
 CONFIG_PCI=y
 CONFIG_NET=y
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index 24c3676d8a..b0799e47a8 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-sh4 -M r2d -kernel output/images/zImage -append "console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user # qemu_sh4_r2d_defconfig
+  qemu-system-sh4 -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append "rootwait root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user # qemu_sh4_r2d_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
diff --git a/board/qemu/sh4eb-r2d/linux.config b/board/qemu/sh4eb-r2d/linux.config
index 6ead626c41..5f94bee77d 100644
--- a/board/qemu/sh4eb-r2d/linux.config
+++ b/board/qemu/sh4eb-r2d/linux.config
@@ -6,6 +6,7 @@ CONFIG_FLATMEM_MANUAL=y
 CONFIG_CPU_BIG_ENDIAN=y
 CONFIG_SH_RTS7751R2D=y
 CONFIG_RTS7751R2D_PLUS=y
+CONFIG_CMDLINE_FROM_BOOTLOADER=y
 CONFIG_HEARTBEAT=y
 CONFIG_PCI=y
 CONFIG_NET=y
diff --git a/board/qemu/sh4eb-r2d/readme.txt b/board/qemu/sh4eb-r2d/readme.txt
index 577c54cd9d..9f3dd8b20b 100644
--- a/board/qemu/sh4eb-r2d/readme.txt
+++ b/board/qemu/sh4eb-r2d/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-sh4eb -M r2d -kernel output/images/zImage -append "console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user # qemu_sh4eb_r2d_defconfig
+  qemu-system-sh4eb -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append "rootwait root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user # qemu_sh4eb_r2d_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 63b9fa1b29..628ca05543 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -12,7 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 97cbd6bd8a..4fd07775ed 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -12,7 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
