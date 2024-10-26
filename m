Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2059D10BF0
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C0B5810CE;
	Sat, 26 Oct 2024 11:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WcRkzrJSdXEc; Sat, 26 Oct 2024 11:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2635780F23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2635780F23;
	Sat, 26 Oct 2024 11:01:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CEF55C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9871480F23
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5fwWdrHZJsX for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:01:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E41CA80E16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E41CA80E16
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E41CA80E16
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:01:05 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43155abaf0bso28519225e9.0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 04:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729940464; x=1730545264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VBr+Zyn6s90mkeVpub2U/H/xWOLW/grUGC4nexnEQR4=;
 b=I+hXXjKzTBqKtv8wrGjCx433THm8EJKFjLAcYdcW4XKIZFL2rp9/VARDCX6YlnUmgP
 t6dn78MWhGtXRscACQNaeJo9z8LFicrrAuiw86Ad8bfMRcGd/IA+EIGPXehP8wEK85Kv
 sY+yzmg3keZMEgJxziDk/lBjv1lGo3iCeEVlPidHzJtOOvIkAqnxsfrB5Ck3QCBKneGa
 vgbzCln6PzGRdOpHwJwQXzTlJ65cjU1tsomL/4euPmRsBW6wVDDzCM5Ixy7qixXYxVD3
 LsXy+b3af6fLNeoXWQedSCZ1mT2DdHHsiVG5p6LVFSadFuIspcbZBapBrNR7GheH7YZc
 IJzg==
X-Gm-Message-State: AOJu0YzmojqG8HTyAHrbwvOdgdenqgr9yq1kjKzw2Qyzznr95BhPeQkf
 ayxkCvKjkmS39fZ3ylOAXb3uyhAITK7dSpkXc6McHWID/88WnBcRw5FWRBo375OHR4Ks1G6bLs2
 c
X-Google-Smtp-Source: AGHT+IFe6S/LmJiJbm38NPGMZn2pafYHwsa842Bs9ZNJ+opCtt8iX1BZTpYLWPrfTc2WpjPYxQateg==
X-Received: by 2002:a05:600c:3b86:b0:431:9397:9ace with SMTP id
 5b1f17b1804b1-4319ac95708mr18854065e9.10.1729940463737; 
 Sat, 26 Oct 2024 04:01:03 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43193573cf8sm44846235e9.7.2024.10.26.04.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 04:01:03 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 13:00:55 +0200
Message-ID: <20241026110059.3204413-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1729940464; x=1730545264; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VBr+Zyn6s90mkeVpub2U/H/xWOLW/grUGC4nexnEQR4=;
 b=U8Rt1mj2cQ+jfarr90eZK4WMEbXpbc6eIQqDzaa46+P9fAbu2xy+XM5rJm5gC4aQuh
 MCODryBsNDunvHE80D+Aa1l/7MNou8loF7jU7nVRtB9WlRCAvFSPlgrKaa9SNPyoJsHC
 x8Rqgm26/v31YU+k4SBOGyD8NB+Nbd2sEPs9Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=U8Rt1mj2
Subject: [Buildroot] [PATCH v3 1/5] board/qemu/riscv{32,
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Waldemar Brodkorb <wbx@openadk.org>

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
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
