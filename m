Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CC7D5B158
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6268180B5C;
	Mon, 28 Oct 2024 21:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYAyo3ZesGl4; Mon, 28 Oct 2024 21:38:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FAEC8113D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FAEC8113D;
	Mon, 28 Oct 2024 21:38:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E1715C1E
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F564607FA
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sI0xI_wtgsyo for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83DCF607FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83DCF607FE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C41484553; Mon, 28 Oct 2024 21:38:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 22:32:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c2f3c9039deb7e285e76391fdb28258c7312f9b
X-Git-Newrev: e47726a50a3421262b6cb472e58d987d407f3e5e
X-Patchwork-Hint: ignore
Message-Id: <20241028213823.6C41484553@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu/riscv{32,
 64}-virt: do not use the default bus implicitly
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e47726a50a3421262b6cb472e58d987d407f3e5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qemu 9.1 recently fixed the RISC-V virt target by adding the missing
default type for block devices [1].

But the qemu command line we use for RISC-V virt is slightly incorrect:

  -drive file=rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0

With Qemu 9.1, this command line now rejected since it conflict with
the new default bus:

  qemu-system-riscv64: -drive file=rootfs.ext2,format=raw,id=hd0: Drive 'hd0' is already in use because it has been automatically connected to another device (did you need 'if=none' in the drive options?)

Since we are currently still using Qemu 9.0, apply the suggested change by
adding 'if=none'.

Note: '-drive file=rootfs.ext2,format=raw,id=hd0' can be removed
in a followup patch after the qemu version bump 9.1 is merged.

[1] https://gitlab.com/qemu-project/qemu/-/commit/4406ba2b5efce6af64905f827ca244f699db8170

[Romain: rework the commit log]
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/riscv32-virt/readme.txt     | 4 ++--
 board/qemu/riscv64-virt-efi/readme.txt | 2 +-
 board/qemu/riscv64-virt/readme.txt     | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/qemu/riscv32-virt/readme.txt b/board/qemu/riscv32-virt/readme.txt
index 555924f949..048306cd54 100644
--- a/board/qemu/riscv32-virt/readme.txt
+++ b/board/qemu/riscv32-virt/readme.txt
@@ -1,7 +1,7 @@
 Run Linux in emulation with:
 
-  qemu-system-riscv32 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv32_virt_defconfig
+  qemu-system-riscv32 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0,if=none -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv32_virt_defconfig
 
-  qemu-system-riscv32 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -nographic -cpu rv32,mmu=off -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 # qemu_riscv32_nommu_virt_defconfig
+  qemu-system-riscv32 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0,if=none -device virtio-blk-device,drive=hd0 -nographic -cpu rv32,mmu=off -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 # qemu_riscv32_nommu_virt_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/board/qemu/riscv64-virt-efi/readme.txt b/board/qemu/riscv64-virt-efi/readme.txt
index 6b9651a011..c7b3177af1 100644
--- a/board/qemu/riscv64-virt-efi/readme.txt
+++ b/board/qemu/riscv64-virt-efi/readme.txt
@@ -22,7 +22,7 @@ Run the emulation with:
         -blockdev node-name=pflash0,driver=file,read-only=on,filename=output/images/RISCV_VIRT_CODE.fd \
         -blockdev node-name=pflash1,driver=file,filename=output/images/RISCV_VIRT_VARS.fd \
         \
-        -drive file=output/images/disk.img,format=raw,id=hd0 \
+        -drive file=output/images/disk.img,format=raw,id=hd0,if=none \
         -device virtio-blk-device,drive=hd0 \
         \
         -netdev user,id=net0 \
diff --git a/board/qemu/riscv64-virt/readme.txt b/board/qemu/riscv64-virt/readme.txt
index f1c7bf41b5..5b3bb85b4b 100644
--- a/board/qemu/riscv64-virt/readme.txt
+++ b/board/qemu/riscv64-virt/readme.txt
@@ -1,7 +1,7 @@
 Run Linux in emulation with:
 
-  qemu-system-riscv64 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv64_virt_defconfig
+  qemu-system-riscv64 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0,if=none -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv64_virt_defconfig
 
-  qemu-system-riscv64 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -nographic -cpu rv64,mmu=off -netdev user,id=net0 -device virtio-net-device,netdev=net0 # qemu_riscv64_nommu_virt_defconfig
+  qemu-system-riscv64 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0,if=none -device virtio-blk-device,drive=hd0 -nographic -cpu rv64,mmu=off -netdev user,id=net0 -device virtio-net-device,netdev=net0 # qemu_riscv64_nommu_virt_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
