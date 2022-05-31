Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB86BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 05:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ED8241834;
	Tue, 31 May 2022 05:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2_1cFmNCNnos; Tue, 31 May 2022 05:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C94A34182D;
	Tue, 31 May 2022 05:49:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57AFA1BF375
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 05:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E745E400A4
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 05:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com header.b="BPf9Zll5";
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.b="XGSg8qQV"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dgr9ba83NWYX for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 05:49:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F08DD40232
 for <buildroot@buildroot.org>; Tue, 31 May 2022 05:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653976173; x=1685512173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ss1H1SnnOBWDOAZXTwpipHdmDv59qxiwvyQwFmstenE=;
 b=BPf9Zll5/QKmZFRFzgnPBoLK5X2Ga6OI2p/WTG6CcOvR4tGvx4jVgkww
 VRRzqL3RbNcQ/oZKS6vOC+xkB/WE8EYu3Y1q/djEZGyCWHeVgu0IlZPmD
 CEK9tF8K2sSbRaZTyPCENJQS3VfxDbEolPo1BQe7QHFL/JG0VpPa3rCQK
 eKYGaipIALRCPQ22ZqxbYGwwup/prQU3apU3v0gyhx4FfRAaNGUuhoaWi
 Uo3UMfkWgOIiqKwDBZ0lPNEG5P1ql7oqLpsWSHL2wzOR4kMjYmoanxT3f
 rxuQBx0rYmaGEoJop1HoyIY1hYl1B24B21jRPfP4JftMyJiRMv47YA/KY w==;
X-IronPort-AV: E=Sophos;i="5.91,264,1647273600"; d="scan'208";a="306095076"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2022 13:49:32 +0800
IronPort-SDR: dPJCWhMfZyi5C4SofvSQQOUbyaDPmj5+qizbBZw9588t/rKHsE/1pq2xfItD6PThSefMj0xPkp
 X1iOBW/wbEF3pDq7fxeIdPLDHxmdUoAjnwzrcxVfIx0KDQEMhXe2H8soCU7Do3MG3S0k9hiYbf
 5sD7IVsZdz2jVz68e8yTTwVryhEfvU7AWTIKTBD4j06X7f6mX4Jz8CBW7rH0cFjmEHUfzMMOMt
 S4EqmENtU635i0gJt2g/tSpe2LeX6DOeE1UdSYswy78LBkNSXqduQaSajvFep+87z51d+6JrSO
 yzUJNOUQOrXdTRn6BMHZejs7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2022 22:13:18 -0700
IronPort-SDR: QSHIPHvcBRbew702O7jB/+39fz8itWTtbtEJhFGrk8VGZtwqIjcQM3USzcprmoicpgDk9HBw+G
 rqhRuPQlONYMbMQQiHthIb3GrmSPHjdGXVfcxLQFEqKV00gbq8NwuA/R9cGQB//CttOYo+1g6E
 4w8XsffMhFxoSCtoRwG74m8t6ThdD5rwzlwCDgNhFKZhBkO2qUoGSMV5MVxx11j1WCKFfiVdml
 LW0pcAvXJ9ZF3ZZPRZQHtVyhtSdJxDBMnxr+AnlUNRyTPOQfhnowDuzUrIMHmRKbAaY25nNR1U
 dc4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2022 22:49:33 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LC1Z429M4z1Rwrw
 for <buildroot@buildroot.org>; Mon, 30 May 2022 22:49:32 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653976170; x=1656568171; bh=ss1H1SnnOBWDOAZXTw
 pipHdmDv59qxiwvyQwFmstenE=; b=XGSg8qQVRUIcr5VjjKR3g2QGv/ac6xCW2C
 30g33KZRsswRNCWgyBNWe+VrlWVqIdnm3lVDQqynHhE8KYt44tBVyfdDs/tP28mh
 UTrhe5ebyMGQ0ROzO/U6KCVr9aaKvCEsO+Xyr1EPwTBQQwiuzo+eBXkWkcOSlQXJ
 zg8nHHBVPv+GJmTd4gXcE4SOM+u6+KfAKoeim8+ifnJOgHlVlLwRFK0Oeppw7yId
 xy3oVhxyVBi6Qm2ooFgmCXhGdo7ufdimv6RUJnDiJOX+rYkN+8VFHlxzLelKISOO
 TbKet3zom8XnYoVFxnKJWQIkLA5EOCxHLSJ+g8GW59nXaK1XveeA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UkXMUNbMNWYM for <buildroot@buildroot.org>;
 Mon, 30 May 2022 22:49:30 -0700 (PDT)
Received: from twashi.fujisawa.hgst.com (unknown [10.225.163.61])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LC1Z20WN8z1Rvlx;
 Mon, 30 May 2022 22:49:29 -0700 (PDT)
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 May 2022 14:49:20 +0900
Message-Id: <20220531054926.373713-2-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531054926.373713-1-damien.lemoal@opensource.wdc.com>
References: <20220531054926.373713-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/7] package/elf2flt: Remove Config.in.host
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is no need to have configuration files direbtly set the
BR2_PACKAGE_HOST_ELF2FLT option. The need for the elf2flt utility is
automatically determined by gcc build in package/gcc/gcc.mk according to
the BR2_BINFMT_FLAT option.

Accordingly, we can remove the file package/elf2flt/Config.in.host to
get rid of the BR2_PACKAGE_HOST_ELF2FLT option. BR2_STRIP_strip
dependency on this option is replaced with a dependency on
BR2_BINFMT_ELF.

To stay consistent with the fact that elf2flt supports only the arm, sh,
sparc, xtensa and riscv-64 architectures, a dependency on these
architectures is added to the BR2_BINFMT_FLAT option in arch/Config.in.

Board configuration files setting the BR2_PACKAGE_HOST_ELF2FLT option
are also updated.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 Config.in                                  |  2 +-
 arch/Config.in                             |  1 +
 configs/qemu_arm_versatile_nommu_defconfig |  1 -
 configs/qemu_riscv64_nommu_virt_defconfig  |  1 -
 configs/qemu_xtensa_lx60_nommu_defconfig   |  1 -
 package/elf2flt/Config.in.host             | 13 -------------
 toolchain/toolchain-buildroot/Config.in    |  1 -
 7 files changed, 2 insertions(+), 18 deletions(-)
 delete mode 100644 package/elf2flt/Config.in.host

diff --git a/Config.in b/Config.in
index f0cd6f48ed..7192292d10 100644
--- a/Config.in
+++ b/Config.in
@@ -432,7 +432,7 @@ config BR2_ENABLE_RUNTIME_DEBUG
 config BR2_STRIP_strip
 	bool "strip target binaries"
 	default y
-	depends on !BR2_PACKAGE_HOST_ELF2FLT
+	depends on BR2_BINFMT_ELF
 	help
 	  Binaries and libraries in the target filesystem will be
 	  stripped using the normal 'strip' command. This allows to save
diff --git a/arch/Config.in b/arch/Config.in
index 49e16fce38..e89a58ac3b 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -392,6 +392,7 @@ config BR2_BINFMT_ELF
 
 config BR2_BINFMT_FLAT
 	bool "FLAT"
+	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa || BR2_RISCV_64
 	depends on !BR2_USE_MMU
 	help
 	  FLAT binary is a relatively simple and lightweight executable
diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
index 0c49d1b67d..d88ade1fe9 100644
--- a/configs/qemu_arm_versatile_nommu_defconfig
+++ b/configs/qemu_arm_versatile_nommu_defconfig
@@ -3,7 +3,6 @@ BR2_arm=y
 BR2_arm926t=y
 
 # Toolchain
-BR2_PACKAGE_HOST_ELF2FLT=y
 # BR2_USE_MMU is not set
 
 # Patches
diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
index bfee9e710a..33fad50a3c 100644
--- a/configs/qemu_riscv64_nommu_virt_defconfig
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -6,7 +6,6 @@ BR2_RISCV_64=y
 BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
 
 # Toolchain
-BR2_PACKAGE_HOST_ELF2FLT=y
 # BR2_USE_MMU is not set
 
 # Busybox with hush
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 44fb81bd74..f107b7e73b 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -4,7 +4,6 @@ BR2_XTENSA_CUSTOM=y
 BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
 
 # Toolchain
-BR2_PACKAGE_HOST_ELF2FLT=y
 # BR2_USE_MMU is not set
 
 # Use minimal busybox with hush and networking tools
diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
deleted file mode 100644
index 2bab0095c2..0000000000
--- a/package/elf2flt/Config.in.host
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_HOST_ELF2FLT
-	bool "Enable elf2flt support?"
-	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa || BR2_RISCV_64
-	depends on !BR2_USE_MMU
-	help
-	  uCLinux uses a Binary Flat format commonly known as BFLT. It
-	  is a relatively simple and lightweight executable format
-	  based on the original a.out format.
-
-	  This option compiles the required tools and makes the required
-	  modifications on your toolchain (linker).
-
-	  https://github.com/uclinux-dev/elf2flt
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 8d9cf4cc68..9c80f22afa 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -114,5 +114,4 @@ source "package/uclibc/Config.in"
 source "package/glibc/Config.in"
 source "package/binutils/Config.in.host"
 source "package/gcc/Config.in.host"
-source "package/elf2flt/Config.in.host"
 endif
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
