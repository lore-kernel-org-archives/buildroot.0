Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69428D10BF6
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C2664007B;
	Sat, 26 Oct 2024 11:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3EofgDb3Hl7; Sat, 26 Oct 2024 11:01:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3EFB40087
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3EFB40087;
	Sat, 26 Oct 2024 11:01:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B10145C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9006D605EA
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MxwZlRxUlhqF for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:01:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 48D1560619
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48D1560619
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48D1560619
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:01:07 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-431695fa98bso27132805e9.3
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 04:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729940466; x=1730545266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Fw8ACJHMP2QVjF+fa4GPg5jUq8mnrEq52pK4QrBH0k=;
 b=kURfYfQJI7F8vJ1TjaXopdaJdjbv3qiaxnqUM/XMgXOjiqsMfAtme2u+UVkD9cfQKF
 7A2evKIheypNXDaUjNUg3GjMMWtRPB3zZLYmHLxV2xwJsvgiFqWF6xlA2RAjmEkrJ/8I
 i2jte2Y71gaGbtUsgzoPOvL1d5LXQN/S2qWbAqzBwDygaQeK6SSb0Y/mUcA5NEx/ToAR
 HB5nkD9E3P79GLUakIqIFXI/6HJ7UWfojPF5NYKp5vTJt64xjN+G2+i4Cu5tyajzUSLK
 b2U9E9caL5D7fAHWbIcLZ9QKSGV3rwv4oeAD227k9oj69ySgCrex4KZ3sM5ET4en5vgO
 NVIg==
X-Gm-Message-State: AOJu0Yx06y37cKwGZnH5O3po08LEpmzLXKT8BUoiFaos+qph0264ibHV
 yGOi5ffsGoUtIcwZ0tXEkTgsAOWFv0gk/3qUYkLWe49gMZoU4tqT7WWML9Hc4+X+JOM4nemA3Ul
 l
X-Google-Smtp-Source: AGHT+IFOhaPS9jis7ozIlqkJsMA2kUOvFEx8ZCHX1YkN4aYTOy+nV9bcrCK/Dx/dX1SF6YjNmI64vQ==
X-Received: by 2002:a05:600c:4fcb:b0:425:7bbf:fd07 with SMTP id
 5b1f17b1804b1-4319ac6fb93mr18748985e9.5.1729940465875; 
 Sat, 26 Oct 2024 04:01:05 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43193573cf8sm44846235e9.7.2024.10.26.04.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 04:01:05 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 13:00:59 +0200
Message-ID: <20241026110059.3204413-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241026110059.3204413-1-romain.naour@smile.fr>
References: <20241026110059.3204413-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1729940466; x=1730545266; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Fw8ACJHMP2QVjF+fa4GPg5jUq8mnrEq52pK4QrBH0k=;
 b=lyd+XW5P2OHqwufNhPz2Tqu98buNBFRrD9+EF6AGr5Xn/R/HGELTsCs/b1jY3HBjjs
 XTghXEu5yCNpqYybTPFXCNdhhM49hM+GSsqrHn/5bEU59/gjsE1CtMON1/o9G8ekevHB
 GUSmmcLEw26tpc/9WqyjRgBfJqpTQwTP1agoI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=lyd+XW5P
Subject: [Buildroot] [PATCH v3 5/5] board/qemu/riscv{32,
 64}-virt: remove virtio-blk-device, drive=hd0
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

Qemu 9.1 recently fixed the RISC-V virt target by adding the missing
default type for block devices [1].

We no longer need to specify virtio-blk-device on the qemu command line
since it's already the default.

[1] https://gitlab.com/qemu-project/qemu/-/commit/4406ba2b5efce6af64905f827ca244f699db8170

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Waldemar Brodkorb <wbx@openadk.org>
---
 board/qemu/riscv32-virt/readme.txt     | 4 ++--
 board/qemu/riscv64-virt-efi/readme.txt | 3 +--
 board/qemu/riscv64-virt/readme.txt     | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/board/qemu/riscv32-virt/readme.txt b/board/qemu/riscv32-virt/readme.txt
index 048306cd54..c2ac27121f 100644
--- a/board/qemu/riscv32-virt/readme.txt
+++ b/board/qemu/riscv32-virt/readme.txt
@@ -1,7 +1,7 @@
 Run Linux in emulation with:
 
-  qemu-system-riscv32 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0,if=none -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv32_virt_defconfig
+  qemu-system-riscv32 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv32_virt_defconfig
 
-  qemu-system-riscv32 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0,if=none -device virtio-blk-device,drive=hd0 -nographic -cpu rv32,mmu=off -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 # qemu_riscv32_nommu_virt_defconfig
+  qemu-system-riscv32 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw -nographic -cpu rv32,mmu=off -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 # qemu_riscv32_nommu_virt_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/board/qemu/riscv64-virt-efi/readme.txt b/board/qemu/riscv64-virt-efi/readme.txt
index c7b3177af1..10d4ed966f 100644
--- a/board/qemu/riscv64-virt-efi/readme.txt
+++ b/board/qemu/riscv64-virt-efi/readme.txt
@@ -22,8 +22,7 @@ Run the emulation with:
         -blockdev node-name=pflash0,driver=file,read-only=on,filename=output/images/RISCV_VIRT_CODE.fd \
         -blockdev node-name=pflash1,driver=file,filename=output/images/RISCV_VIRT_VARS.fd \
         \
-        -drive file=output/images/disk.img,format=raw,id=hd0,if=none \
-        -device virtio-blk-device,drive=hd0 \
+        -drive file=output/images/disk.img,format=raw \
         \
         -netdev user,id=net0 \
         -device virtio-net-device,netdev=net0 # qemu_riscv64_virt_efi_defconfig
diff --git a/board/qemu/riscv64-virt/readme.txt b/board/qemu/riscv64-virt/readme.txt
index 5b3bb85b4b..d7b198842b 100644
--- a/board/qemu/riscv64-virt/readme.txt
+++ b/board/qemu/riscv64-virt/readme.txt
@@ -1,7 +1,7 @@
 Run Linux in emulation with:
 
-  qemu-system-riscv64 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0,if=none -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv64_virt_defconfig
+  qemu-system-riscv64 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv64_virt_defconfig
 
-  qemu-system-riscv64 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0,if=none -device virtio-blk-device,drive=hd0 -nographic -cpu rv64,mmu=off -netdev user,id=net0 -device virtio-net-device,netdev=net0 # qemu_riscv64_nommu_virt_defconfig
+  qemu-system-riscv64 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw -nographic -cpu rv64,mmu=off -netdev user,id=net0 -device virtio-net-device,netdev=net0 # qemu_riscv64_nommu_virt_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
