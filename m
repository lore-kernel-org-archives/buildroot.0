Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB1EC25B75
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 16:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 614EE40300;
	Tue, 14 May 2024 16:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywfJnDvwWHzf; Tue, 14 May 2024 16:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D47640639
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D47640639;
	Tue, 14 May 2024 16:18:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82FE11BF3CD
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 16:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F15181EAC
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 16:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qw3WIqNTKwGQ for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 16:18:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C87F81E8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C87F81E8A
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C87F81E8A
 for <buildroot@buildroot.org>; Tue, 14 May 2024 16:18:38 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 8137E3521100; Tue, 14 May 2024 18:18:36 +0200 (CEST)
Date: Tue, 14 May 2024 18:18:36 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZkOO3O+OwNALpA/H@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715703516; bh=gK4Ts7ASPqyszyIVZoifmTro3g9TZ+MX97mKu62a2XI=;
 h=Date:From:To:Subject:From;
 b=X4xo78zFfPrj+StKpBLdoz1TyhARd9M4c6gF/wRNnVgQ7Tki+Fbej9L3lrn5fAYQo
 JQbQ1jdh2dKl3OFIjffYHggCqHTvlwhhdJEsCvMdBYd+SlkP/0ui741CS5UbnXKZ7P
 ngsmghy23WJ4cqAaYeO6q+x5q+Y5e6IBn2FeQC9WlZ55oBCxW/mIWjydBuz2iy0dZl
 Pzq3/X+62EV8liJ0lUjsI+nNsB283kOGUN1okeI0f1+CPSEXQSGW/wqcsUKt7uM9HR
 zp7/JwaLsSw8jn6zUrGQ7LUj7p5tx4IX6DgZMzINoeV51wIYqYmHIj8zfEmx4xKuik
 A71eCqxSscJDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=X4xo78zF
Subject: [Buildroot] [PATCHv2 3/3] configs/qemu_loongarch64: new defconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
 - add me to DEVELOPERS file as requested by Thomas P.
 - add the missing readme.txt file requested by Thomas P.
---
 DEVELOPERS                                    |  2 ++
 .../patches/linux-headers/linux-headers.hash  |  2 ++
 .../qemu/loongarch64/patches/linux/linux.hash |  2 ++
 board/qemu/loongarch64/readme.txt             | 11 ++++++++
 configs/qemu_loongarch64_defconfig            | 27 +++++++++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 board/qemu/loongarch64/patches/linux-headers/linux-headers.hash
 create mode 100644 board/qemu/loongarch64/patches/linux/linux.hash
 create mode 100644 board/qemu/loongarch64/readme.txt
 create mode 100644 configs/qemu_loongarch64_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e299e7e66..fa933b8742 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3204,7 +3204,9 @@ F:	package/ngrep/
 
 N:	Waldemar Brodkorb <wbx@openadk.org>
 F:	arch/Config.in.loongarch64
+F:	board/qemu/loongarch64/
 F:	board/qemu/riscv32-virt/
+F:	configs/qemu_loongarch64_defconfig
 F:	configs/qemu_riscv32_nommu_virt_defconfig
 F:	package/asterisk/
 F:	package/libjwt/
diff --git a/board/qemu/loongarch64/patches/linux-headers/linux-headers.hash b/board/qemu/loongarch64/patches/linux-headers/linux-headers.hash
new file mode 100644
index 0000000000..f3d9c1186a
--- /dev/null
+++ b/board/qemu/loongarch64/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
diff --git a/board/qemu/loongarch64/patches/linux/linux.hash b/board/qemu/loongarch64/patches/linux/linux.hash
new file mode 100644
index 0000000000..f3d9c1186a
--- /dev/null
+++ b/board/qemu/loongarch64/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
diff --git a/board/qemu/loongarch64/readme.txt b/board/qemu/loongarch64/readme.txt
new file mode 100644
index 0000000000..3d49ba57f4
--- /dev/null
+++ b/board/qemu/loongarch64/readme.txt
@@ -0,0 +1,11 @@
+Qemu does not bundle the BIOS file QEMU_EFI.fd. You need to build it:
+https://github.com/tianocore/edk2-platforms/tree/master/Platform/Loongson/LoongArchQemuPkg#readme
+
+For a binary you can download it from here:
+https://debug.openadk.org/QEMU_EFI.fd
+
+Run the emulation with:
+
+ qemu-system-loongarch64 -M virt -bios QEMU_EFI.fd -append "console=ttyS0,115200" -kernel output/images/vmlinux.efi -nographic # qemu_loongarch64_defconfig
+
+The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_loongarch64_defconfig b/configs/qemu_loongarch64_defconfig
new file mode 100644
index 0000000000..025e9907e2
--- /dev/null
+++ b/configs/qemu_loongarch64_defconfig
@@ -0,0 +1,27 @@
+# Architecture
+BR2_loongarch64=y
+
+# Filesystem
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
+BR2_LINUX_KERNEL_DEFCONFIG="loongson3"
+BR2_LINUX_KERNEL_VMLINUX_EFI=y
+
+# Disable network scripts
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
