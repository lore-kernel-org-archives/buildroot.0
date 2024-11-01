Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE41FE6B27C
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 13:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7730660637;
	Fri,  1 Nov 2024 13:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPArF4aV3c-n; Fri,  1 Nov 2024 13:46:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C93660662
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C93660662;
	Fri,  1 Nov 2024 13:46:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A1E53B
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 13:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67ED781CC3
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 13:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mocQED1OfmHR for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 13:46:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 091D480C4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 091D480C4A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 091D480C4A
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 13:46:20 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4315baec69eso16958675e9.2
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 06:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730468779; x=1731073579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R6iq6UQMxKiOcQ+PSW4CN20i7CWKrYdX8TuTNlU/E9c=;
 b=L9gqf21fR/8KFrap/S5q0P42f8Tmd66bmbsnGUZZ6Pa/90vDiSraPJYeZH2yzawe0m
 JXlEGxqalzRXqPH5/hbyd234VQF7oR99Sxcnw98QcnUJnN+239J/Mpv/sSncs+1CRhf9
 M1+EqYh+sHNcQgLYDwfXaZ0uOKmhScFPIzjjLLR3HsEa32WLCIMRhGgOF54ATdAT89La
 fRG5XIv0pntJhpEdmP6MuQZMX0/4JcvYWvaJ5eLWTrP3ZgORpT/2vfRm+zn9Rs/lZ6ym
 VIe7z3EW/L3qUu7zDCYulzeCikt6AkXZwydqGeilsQ4cAhyQjBsw4rYU2cNyQad1nvTE
 gJDw==
X-Gm-Message-State: AOJu0YxbAFm3KALYqjaUBEQky6QealjGgSj8HrprqYMccWHnMBzXr0c7
 FIqooeteO+lQG25LPGAuNaboP3bWmBVDVtMNk5HBRttgIdCS3qbtM/OMv84CIPnh6iiozUQ8FDQ
 F
X-Google-Smtp-Source: AGHT+IEzMi39mxjP3+5SGTRfevlNjBC02dBRAmbVeq3GlaeZUmMtnu2wzgbA0yEgy/MM0G4vYZb3BQ==
X-Received: by 2002:a5d:47ae:0:b0:37d:43d2:d894 with SMTP id
 ffacd0b85a97d-381c7aa3eb3mr2236504f8f.37.1730468778777; 
 Fri, 01 Nov 2024 06:46:18 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7c13sm5404616f8f.13.2024.11.01.06.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 06:46:18 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri,  1 Nov 2024 14:46:15 +0100
Message-ID: <20241101134615.3295416-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730468779; x=1731073579; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R6iq6UQMxKiOcQ+PSW4CN20i7CWKrYdX8TuTNlU/E9c=;
 b=Z1ENW37m8247jNgn0AWCyBxPZXC9wqfYKJddpwuFY0P8ztjllXxi7q0o23tf6ZuZ7o
 uIRBapQfne/9blgf6eATIbwf8pg9bxtSjVrCj6Jg64NdmQb2l7oDReV68OcQwNdHMu/K
 GCaNuJp3/BqiuRbKJ9mOX0AQVjX4KdYzSstY4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Z1ENW37m
Subject: [Buildroot] [PATCH] board/qemu/riscv{32,
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
