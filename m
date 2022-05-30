Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F6AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 03:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C30540C19;
	Mon, 30 May 2022 03:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VTaebb9UxdN7; Mon, 30 May 2022 03:39:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29BCC40C08;
	Mon, 30 May 2022 03:39:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A6381BF834
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 03:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 474BC4000B
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 03:38:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i7-3cQw6Mtlm for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 03:38:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD24040C01
 for <buildroot@buildroot.org>; Mon, 30 May 2022 03:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653881926; x=1685417926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jmMAcQBfLNFNafZL9/7xkN8pQnZdbFKuzCRGuzQFkwc=;
 b=QNLswWtUhQ6AJ5OsnZOtNFK1Xagu33lf84WzCMWlLL+4cyNglRbkL6P3
 kLJToJwbUfq5oGuGeE84kMZgt9/fnpPeq/BUric7ZToR54CXjIZI1OoqN
 6ju06xzq5g+RCA1o1c0zWWiocT/iOJMgEWI82czMkBtiLVHAR9RHPXQ95
 nXUBmAQv4+HUg8HTVeKivLijIeA/EoJ3aEAy6NXKHix1AuGuxxkk4t1pE
 zMh5t+VXz9iFXZxZitSZDgxD52M/zlp3XDmcO/fEIQVMayQa3xx/HI/IQ
 CoFQLtBpWX+hjXHtxq0t24bAJXY+yrcU/6ePuLT/Q3aqohuA0AxPrTtTA Q==;
X-IronPort-AV: E=Sophos;i="5.91,261,1647273600"; d="scan'208";a="313781121"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 May 2022 11:38:46 +0800
IronPort-SDR: nHn89zUSSZDgEUX1iRDlC7ywIq7+4uMEUpDx0eSSl1/FD6Q+3h+6xrlGBEuCxj6k1nQe1Opp2M
 W4NYlT7SeHSUl9o/mYF+ngsAyc3WNvZkoDxgkb3IQ5aLgD9EGbwfQo44s1G2n2Forl++/f9GnC
 7v901YI3d5vrYSxRAe6f1jRl9h9aJ/c8ykg40V2+ReWMnh6vZmboya7yvNFunr4fJiCPAOeWaL
 6N4YlmkyidHEx/1XWE9QUMXjA/Qc5rzyTUF9d02NgoM8S5dEN5skXnSCHnAmWXSW26TJTvBEzG
 ffavjKZ2Kv3bWkE+ECCv8OqK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2022 19:58:11 -0700
IronPort-SDR: jWpvLIktquYdEwcl3UPUqE69T4Ikfl0eNfXJXHnT1kFbs7X07wX+NeFIjP/xNnjM0ngNDVWfuc
 WSKdOJEUJYgAN2GetXHjctqaVAU+6fkTsNRfoEtXZoATTZqxmCjDoqX6nx2Uv8/awqpmy5cn3/
 wB3vU9KLpDHhiY027YbW0EAjlt2ruYWjHH+PU+M/ZJp3mNuhkepRVwkGLhyPi1zNQDkG567JNW
 vReJQFKb2SmBETWTP9QuTZQzOFcXKPlpj+PlU5kgOzTgavAmpWwQ4WT4VtcUWaH7v3ByhSPT4R
 28M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2022 20:38:46 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LBLjd73V1z1SHwl
 for <buildroot@buildroot.org>; Sun, 29 May 2022 20:38:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653881924; x=1656473925; bh=jmMAcQBfLNFNafZL9/
 7xkN8pQnZdbFKuzCRGuzQFkwc=; b=P4ymxBweQqyKYvfs4nhcqA0Qjt+KpzSF1T
 v5NnsfKwEeXexANz36Ob3V8gDz8co1xsTYNiLHo9YY0Obb5ba51nQW8rAcgK849q
 SFWneN5eTgLdh/MZLYifHnHqiqOF6K7jCo+G/IMhTroOODuuqPtJDPI0ugiiucF1
 79vMLNwsDK6d62t/W1mL5MALL+q5z2w8VEFKS2nSHUK/u39R2G7TAyrCx8ND7Qwm
 T5BY6Kz4ODuifUKc9jHln0ysNT32R7HAfXhUs2HzUuv4W++mNEShA2bbpyThsEUz
 N5LlxOyn1hzN/SJc9+6QZyjzBFW5daUfZfxIlX03sUc8SYN5O5ug==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kyLAL10GZ2BG for <buildroot@buildroot.org>;
 Sun, 29 May 2022 20:38:44 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com
 [10.149.53.254])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LBLjb4gsPz1Rvlx;
 Sun, 29 May 2022 20:38:43 -0700 (PDT)
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 May 2022 12:38:29 +0900
Message-Id: <20220530033836.474926-5-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
References: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 04/11]
 configs/qemu_riscv64_nommu_virt_defconfig: new defconfig
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Niklas Cassel <niklas.cassel@wdc.com>

Add RISC-V 64-bit nommu defconfig for QEMU virt machine with MMU
disabled.

Unlike qemu_riscv64_virt, qemu_riscv64_nommu_virt does not use OpenSBI,
since the kernel is running in machine mode (M-mode).

After the build is complete, you can start QEMU using the launcher
script:
$ output/images/start-qemu.sh

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 board/qemu/riscv64-virt/readme.txt        |  2 ++
 configs/qemu_riscv64_nommu_virt_defconfig | 35 +++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 configs/qemu_riscv64_nommu_virt_defconfig

diff --git a/board/qemu/riscv64-virt/readme.txt b/board/qemu/riscv64-virt/readme.txt
index 747a9ea674..9e4cfc8c55 100644
--- a/board/qemu/riscv64-virt/readme.txt
+++ b/board/qemu/riscv64-virt/readme.txt
@@ -2,4 +2,6 @@ Run Linux in emulation with:
 
   qemu-system-riscv64 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv64_virt_defconfig
 
+  qemu-system-riscv64 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -nographic -cpu rv64,mmu=off # qemu_riscv64_nommu_virt_defconfig
+
 The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
new file mode 100644
index 0000000000..2bb6993fbf
--- /dev/null
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -0,0 +1,35 @@
+# Architecture
+BR2_riscv=y
+BR2_RISCV_64=y
+
+# Toolchain
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+
+# Busybox with hush
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+
+# System
+BR2_TARGET_GENERIC_GETTY=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_PATCH="board/riscv/nommu/kernel_patches"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_virt"
+BR2_LINUX_KERNEL_IMAGE=y
+
+# Disable network scripts
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
