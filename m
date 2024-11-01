Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A0EE6F08E
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 21:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 787E340204;
	Fri,  1 Nov 2024 21:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gno0n91CuZYH; Fri,  1 Nov 2024 21:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18663401F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18663401F9;
	Fri,  1 Nov 2024 21:22:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F33AF112A
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3CA6401F3
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wlty8njPcEu8 for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 21:21:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 74E1C401D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74E1C401D4
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74E1C401D4
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:21:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5FA042003C6;
 Fri,  1 Nov 2024 22:21:55 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57966])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 01 Nov 2024 22:21:55 +0100
MIME-Version: 1.0
Date: Fri, 01 Nov 2024 22:21:55 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241101134615.3295416-1-romain.naour@smile.fr>
References: <20241101134615.3295416-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <a9e7affe7c4342752cb1f7218e324917@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730496116;
 bh=qy3wXq/Vtd+Acg/f7/TCUyRGZCSptqTJPutdpRZGip4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nz0uXTDoOazRQ01H/UeAjdqNHQkys28CD90gB1yXtY3lNS478tn1y0NblOvoV8yC5
 a5hyfsKZEmOdsnLwsWwHbCOBadJS0/yA8XV56Xkxv0/swJ2ccErlmr/vtPUCASDUYf
 xxVA7iEe3Jj+7YLEBFLQV3xJwTxygLHBUTr0dl4tAozJnB1wcH/IePKzXQdGbaOBHV
 xaZdf3dAxQ1MatDz+XYQxaauEtcNH54QlcB7Nm40GulmqyFZ2IO8EAN/Svk2PSArbn
 w6azf5PS6B4gQJKS9YC3vi5oHXaZ98UqmvZ6Ys00QwXxZbiSlB1KQ5WCR1sNV75Uzf
 /0CX85ZFMgC3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nz0uXTDo
Subject: Re: [Buildroot] [PATCH] board/qemu/riscv{32,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 01/11/2024 14:46, Romain Naour via buildroot wrote:
> Commit [1] removed virtio-blk-device,drive=hd0 from the Qemu command
> line since RISC-V virt target now define a default type for block
> devices (virtio) [2].
> 
> While it's was working as expected using
> qemu_riscv{32,64}_virt_defconfig, it doesn't work for nommu variant.
> 
> Without "-device virtio-blk-device,drive=hd0", the virtio block device
> virtio0 is missing in dmesg:
> 
> Expected dmesg log:
> 
>   virtio_blk virtio0: 1/0/0 default/read/poll queues
>   virtio_blk virtio0: [vda] 122880 512-byte logical blocks (62.9 
> MB/60.0 MiB)
> 
> Unlike qemu_riscv{32,64}_virt_defconfig, mmu variant doesn't use
> opensbi (-bios none) and disable mmu (-cpu rv{32,64},mmu=off)
> from the qemu command line...
> 
> Adding back "-device virtio-blk-device,drive=hd0" seems to help Qemu
> to enable the virtio block device for nommu target.
> 
> This partially revert commit [1].
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227503 
> (qemu_riscv32_nommu_virt_defconfig)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227509 
> (qemu_riscv64_nommu_virt_defconfig)
> 
> [1] dba41736daeaf8065b44427316759e07c35545db
> [2] 
> https://gitlab.com/qemu-project/qemu/-/commit/4406ba2b5efce6af64905f827ca244f699db8170
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master. Thanks!

> ---
>  board/qemu/riscv32-virt/readme.txt | 2 +-
>  board/qemu/riscv64-virt/readme.txt | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/qemu/riscv32-virt/readme.txt 
> b/board/qemu/riscv32-virt/readme.txt
> index c2ac27121f..b4336e9357 100644
> --- a/board/qemu/riscv32-virt/readme.txt
> +++ b/board/qemu/riscv32-virt/readme.txt
> @@ -2,6 +2,6 @@ Run Linux in emulation with:
> 
>    qemu-system-riscv32 -M virt -bios output/images/fw_jump.elf -kernel 
> output/images/Image -append "rootwait root=/dev/vda ro" -drive 
> file=output/images/rootfs.ext2,format=raw -netdev user,id=net0 -device 
> virtio-net-device,netdev=net0 -nographic # qemu_riscv32_virt_defconfig
> 
> -  qemu-system-riscv32 -M virt -bios none -kernel output/images/Image 
> -append "rootwait root=/dev/vda ro" -drive 
> file=output/images/rootfs.ext2,format=raw -nographic -cpu rv32,mmu=off 
> -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 # 
> qemu_riscv32_nommu_virt_defconfig
> +  qemu-system-riscv32 -M virt -bios none -kernel output/images/Image 
> -append "rootwait root=/dev/vda ro" -drive 
> file=output/images/rootfs.ext2,format=raw,id=hd0,if=none -device 
> virtio-blk-device,drive=hd0 -nographic -cpu rv32,mmu=off -netdev 
> user,id=eth0 -device virtio-net-device,netdev=eth0 # 
> qemu_riscv32_nommu_virt_defconfig
> 
>  The login prompt will appear in the terminal that started Qemu.
> diff --git a/board/qemu/riscv64-virt/readme.txt 
> b/board/qemu/riscv64-virt/readme.txt
> index d7b198842b..f9e920a88b 100644
> --- a/board/qemu/riscv64-virt/readme.txt
> +++ b/board/qemu/riscv64-virt/readme.txt
> @@ -2,6 +2,6 @@ Run Linux in emulation with:
> 
>    qemu-system-riscv64 -M virt -bios output/images/fw_jump.elf -kernel 
> output/images/Image -append "rootwait root=/dev/vda ro" -drive 
> file=output/images/rootfs.ext2,format=raw -netdev user,id=net0 -device 
> virtio-net-device,netdev=net0 -nographic # qemu_riscv64_virt_defconfig
> 
> -  qemu-system-riscv64 -M virt -bios none -kernel output/images/Image 
> -append "rootwait root=/dev/vda ro" -drive 
> file=output/images/rootfs.ext2,format=raw -nographic -cpu rv64,mmu=off 
> -netdev user,id=net0 -device virtio-net-device,netdev=net0 # 
> qemu_riscv64_nommu_virt_defconfig
> +  qemu-system-riscv64 -M virt -bios none -kernel output/images/Image 
> -append "rootwait root=/dev/vda ro" -drive 
> file=output/images/rootfs.ext2,format=raw,id=hd0,if=none -device 
> virtio-blk-device,drive=hd0 -nographic -cpu rv64,mmu=off -netdev 
> user,id=net0 -device virtio-net-device,netdev=net0 # 
> qemu_riscv64_nommu_virt_defconfig
> 
>  The login prompt will appear in the terminal that started Qemu.
> --
> 2.45.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
