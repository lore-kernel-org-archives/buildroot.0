Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A49C3814E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 08:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51231848ED;
	Fri,  5 Jul 2024 08:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKKWWMA0qsPL; Fri,  5 Jul 2024 08:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 356218488C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 356218488C;
	Fri,  5 Jul 2024 08:50:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 627CF1BF28A
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 08:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FAE860E8C
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 08:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWJ0jrqcltpe for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 08:50:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 425AF60BA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 425AF60BA9
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 425AF60BA9
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 08:50:14 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id C70E835363BC; Fri,  5 Jul 2024 10:50:06 +0200 (CEST)
Date: Fri, 5 Jul 2024 10:50:06 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZoezviRQPTNSgdCL@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1720169407; bh=TPFkIg6MAYgqgn0yB+cf362WdN4dRkGzIzNJBzRWgew=;
 h=Date:From:To:Subject:From;
 b=j51wEMdhKoJlDDsy8oAE/gxMVtU34rNxNkhiSltvlTxIfsnOASZJKei6Yd4CVEux7
 M+dmQ0X+9y1982GJV1MXWMXlqnuGtW8h2t3mD8M83XBmF48eUgSc08TDRXwVgZEKIK
 a6NIK/8lmjIHNA95BNOOXxvY5DHZt0T6sS4oHNSwD0axFYPlsafvfxtEcZs13INNz8
 KW116C00YJxayju/arfRN6Sr83rhkDvILP+tpsK/PSloD8egh4LTWf9jOnNcrEchyA
 zzHeLCG/8ewKRfT0jufo7Ozlfx74FJwDAQxyFsKhW4vKWLqjXaqmYaMPH7yHPAuWO6
 ssf/69OWGbCSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=j51wEMdh
Subject: [Buildroot] [PATCH v3 1/2] configs/qemu_sh4*: switch to initramfs
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

Qemu 9.0.0/9.0.1 has introduced a Bug in sh4/sh4eb emulation so
that the system doesn't boot anymore.
The issue is already reported by Guenter Roeck:
https://lists.nongnu.org/archive/html/qemu-devel/2024-05/msg00606.html

Switch to initramfs for sh4/sh4eb emulation.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v2->v3:
 - separate sh4 switch to initramfs from kernel update
---
 board/qemu/sh4-r2d/readme.txt    | 2 +-
 board/qemu/sh4eb-r2d/readme.txt  | 2 +-
 configs/qemu_sh4_r2d_defconfig   | 2 +-
 configs/qemu_sh4eb_r2d_defconfig | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index b0799e47a8..24c3676d8a 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-sh4 -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append "rootwait root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user # qemu_sh4_r2d_defconfig
+  qemu-system-sh4 -M r2d -kernel output/images/zImage -append "console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user # qemu_sh4_r2d_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
diff --git a/board/qemu/sh4eb-r2d/readme.txt b/board/qemu/sh4eb-r2d/readme.txt
index 9f3dd8b20b..577c54cd9d 100644
--- a/board/qemu/sh4eb-r2d/readme.txt
+++ b/board/qemu/sh4eb-r2d/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-sh4eb -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append "rootwait root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user # qemu_sh4eb_r2d_defconfig
+  qemu-system-sh4eb -M r2d -kernel output/images/zImage -append "console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user # qemu_sh4eb_r2d_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index e5570dcbab..8d3e96c9c5 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -7,7 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 
 # Filesystem
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Image
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 468d6567ae..10c547e0c4 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -6,7 +6,7 @@ BR2_sh4eb=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 
 # Filesystem
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Image
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
