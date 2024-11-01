Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0226EE6F08E
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 21:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C29B40275;
	Fri,  1 Nov 2024 21:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNfcpCfb8v0S; Fri,  1 Nov 2024 21:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F033E40218
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F033E40218;
	Fri,  1 Nov 2024 21:21:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C86A27E1
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 598CA4012F
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81BhOYJzXQ3A for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 21:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C3DF400E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C3DF400E7
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:21:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 116F7856C2; Fri,  1 Nov 2024 21:21:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 1 Nov 2024 22:19:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9534b9c00c23cfd69a4e122c26fca9d3da93d329
X-Git-Newrev: e7cd3741b5a69d6a90cd00ee27e48367f5d0517a
X-Patchwork-Hint: ignore
Message-Id: <20241101212122.116F7856C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu/riscv{32,
 64}-virt: nommu: needs virtio-blk device
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7cd3741b5a69d6a90cd00ee27e48367f5d0517a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit [1] removed virtio-blk-device,drive=hd0 from the Qemu command
line since RISC-V virt target now define a default type for block
devices (virtio) [2].

While it's was working as expected using
qemu_riscv{32,64}_virt_defconfig, it doesn't work for nommu variant.

Without "-device virtio-blk-device,drive=hd0", the virtio block device
virtio0 is missing in dmesg:

Expected dmesg log:

  virtio_blk virtio0: 1/0/0 default/read/poll queues
  virtio_blk virtio0: [vda] 122880 512-byte logical blocks (62.9 MB/60.0 MiB)

Unlike qemu_riscv{32,64}_virt_defconfig, mmu variant doesn't use
opensbi (-bios none) and disable mmu (-cpu rv{32,64},mmu=off)
from the qemu command line...

Adding back "-device virtio-blk-device,drive=hd0" seems to help Qemu
to enable the virtio block device for nommu target.

This partially revert commit [1].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227503 (qemu_riscv32_nommu_virt_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227509 (qemu_riscv64_nommu_virt_defconfig)

[1] dba41736daeaf8065b44427316759e07c35545db
[2] https://gitlab.com/qemu-project/qemu/-/commit/4406ba2b5efce6af64905f827ca244f699db8170

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/qemu/riscv32-virt/readme.txt | 2 +-
 board/qemu/riscv64-virt/readme.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/riscv32-virt/readme.txt b/board/qemu/riscv32-virt/readme.txt
index c2ac27121f..b4336e9357 100644
--- a/board/qemu/riscv32-virt/readme.txt
+++ b/board/qemu/riscv32-virt/readme.txt
@@ -2,6 +2,6 @@ Run Linux in emulation with:
 
   qemu-system-riscv32 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv32_virt_defconfig
 
-  qemu-system-riscv32 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw -nographic -cpu rv32,mmu=off -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 # qemu_riscv32_nommu_virt_defconfig
+  qemu-system-riscv32 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0,if=none -device virtio-blk-device,drive=hd0 -nographic -cpu rv32,mmu=off -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 # qemu_riscv32_nommu_virt_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/board/qemu/riscv64-virt/readme.txt b/board/qemu/riscv64-virt/readme.txt
index d7b198842b..f9e920a88b 100644
--- a/board/qemu/riscv64-virt/readme.txt
+++ b/board/qemu/riscv64-virt/readme.txt
@@ -2,6 +2,6 @@ Run Linux in emulation with:
 
   qemu-system-riscv64 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv64_virt_defconfig
 
-  qemu-system-riscv64 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw -nographic -cpu rv64,mmu=off -netdev user,id=net0 -device virtio-net-device,netdev=net0 # qemu_riscv64_nommu_virt_defconfig
+  qemu-system-riscv64 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0,if=none -device virtio-blk-device,drive=hd0 -nographic -cpu rv64,mmu=off -netdev user,id=net0 -device virtio-net-device,netdev=net0 # qemu_riscv64_nommu_virt_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
