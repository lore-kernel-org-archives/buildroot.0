Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B57E94623
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 00:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D12DF83C92;
	Tue, 10 Feb 2026 00:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtFjFcbGRSgt; Tue, 10 Feb 2026 00:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA9C383C96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770682073;
	bh=FnQs3j7ZBFBL3wtrjzbRc/9jbnz7+DPqk98KV1S2LaU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Fv5pQtMwqryPJrWferZpTCGcVMd+kx+Ll4/zrClEvQFQVEJbEMofOW1f/pJr6nU34
	 mgfbgcM8vEBb4EjNiBs3rsNZIV+jEkgJV6a2R1oRPtLPoANhNh10FwNdAmdloLbZWN
	 H3Fsq8PcK9uG8TakK3zjZUfvLTPSM6CFiQ70iOIhNORGejTPPJlDmkvD6zF9oJWS+s
	 7m4ZFG9Q0KJNUddqOpyw6zhPmCFzhn4UK0/TLioD1YpxMFjdKjnP7Mn/pPLc7Xmg8e
	 /StV7GMZ2PBS48IiS+8xkil3pu+3+3t5h7dTNlxHXv8oPti81Qdlp2XKYjs86kD21V
	 1CKMqJi65vUfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA9C383C96;
	Tue, 10 Feb 2026 00:07:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4757D219
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4187383C55
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6JDx-10mQ7U for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 00:07:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F7A0827FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F7A0827FD
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F7A0827FD
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:48 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id pbI7vTZGv5gYjpbIAvmsh8; Tue, 10 Feb 2026 01:07:46 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Feb 2026 01:07:33 +0100
Message-ID: <20260210000739.3810940-8-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
References: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEMHzqnfwX4o+wGyNUavrHrAz7QNqxD2sgNCmUlM817Jta96G9gDhpfmzCD6GTE8XWRjkrvhP0huF4XXSWNI0k28fudFCh340C9z74XGS4iO8oCOb3lD
 VbiF8MTxxyBoZtmjLlZP4J+QfRrB8g0bW8jb4h37qlIAjI50sLAn04KFqJf2QrudKqcVswrujVZSiAhs0a/3RGSQaVTtEI8bHH0RxitvZRyiquxILlmtDcsv
 Ib2f9s0woVRWJKpveHowrBFC3dEIqofyPKEW6ZbkSqsGK5rgGUIFolbDSP77FoKBDjMB2JHttMXQMnAvQMnujmaklUuWRzrpiS+XY4MIjlNlyjk7X3i4hv60
 XorX7ty+vA5yzNyrRQYDNjT077YEV6D9yS06Br4C3pSOGA0RPhRawlfT7gEWMuuG9yWMdlMmTT2jUG0WgRYBITV5Cy8YlJLTL9tuHI/Gx43OWxmtexG+Poid
 fSXwJe1KOnJ1+2kRv5HPXOfekG/G85HweI3R5X27GUxRv8OJ2xdAtdXFM9FGxdQ7v7P/TPxscRfGxXV7FKQmGzNCsy281eJvi/6EsXzZVzERmHWEdTvMcnRJ
 R78=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770682066; bh=VRM+OIPRQYNXTsDCI7WIeokq9y/hKP9x2POcraHQZQE=;
 h=From:To:Subject:Date:MIME-Version;
 b=LeBEcutxJ60A7uuOEBt5sfBBfPfT9axnaJdCTIbLVJHaftfMS8y8LvLLVw6j5/5Pf
 LiHnkd3gEXxk7TbryCM0PMF8FzaKVN/0MjJlhAYOm8SzWhEjb16TJXLPKf+EAm8LkQ
 tQXm1WEcikzs+yAtTP8X0xN+d5B1F8khv2x+uB5Fws/k3eJt00ZExpo78Y3vO8Lnch
 XsrFMwghCcfmo/NAiyQJY0HORHczfpd3p5Bs1c9DOgWHJRXFh3YoGZ+AHM5v4VFbFM
 Gm3DOGDfRRwIP1vo6kAJ4bmM2gsuGbGjZfADB4wSdXPEVawEW2f6Wj/oz5aKS8YKfK
 vyGVNSXCZ4DbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=LeBEcutx
Subject: [Buildroot] [PATCH v2 07/13] configs/mangopi_mq1rdw2: bump Linux to
 6.18.8 and U-Boot to 2026.01
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
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch:
* bumps Linux kernel to version 6.18.8
* bumps U-Boot to version 2026.01
* forces check hashes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .checkpackageignore                                      | 1 -
 .../mq1rdw2/patches/linux-headers/linux-headers.hash     | 1 +
 board/mangopi/mq1rdw2/patches/linux/linux.hash           | 2 ++
 board/mangopi/mq1rdw2/patches/uboot/uboot.hash           | 2 ++
 configs/mangopi_mq1rdw2_defconfig                        | 9 ++++++---
 5 files changed, 11 insertions(+), 4 deletions(-)
 create mode 120000 board/mangopi/mq1rdw2/patches/linux-headers/linux-headers.hash
 create mode 100644 board/mangopi/mq1rdw2/patches/linux/linux.hash
 create mode 100644 board/mangopi/mq1rdw2/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index f30e2c0792..469d053292 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -112,7 +112,6 @@ configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
 configs/khadas_vim3_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_smarc_sal28_defconfig lib_defconfig.ForceCheckHash
-configs/mangopi_mq1rdw2_defconfig lib_defconfig.ForceCheckHash
 configs/mender_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sam9x60ek_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sam9x60ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/mangopi/mq1rdw2/patches/linux-headers/linux-headers.hash b/board/mangopi/mq1rdw2/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/mangopi/mq1rdw2/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/mangopi/mq1rdw2/patches/linux/linux.hash b/board/mangopi/mq1rdw2/patches/linux/linux.hash
new file mode 100644
index 0000000000..b1a0042a91
--- /dev/null
+++ b/board/mangopi/mq1rdw2/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/mangopi/mq1rdw2/patches/uboot/uboot.hash b/board/mangopi/mq1rdw2/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/mangopi/mq1rdw2/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/mangopi_mq1rdw2_defconfig b/configs/mangopi_mq1rdw2_defconfig
index 2249fa4be5..469a45b967 100644
--- a/configs/mangopi_mq1rdw2_defconfig
+++ b/configs/mangopi_mq1rdw2_defconfig
@@ -1,7 +1,9 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/mangopi/mq1rdw2/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="mangopi-mq1rdw2"
 BR2_TARGET_GENERIC_ISSUE="Welcome to MangoPI MQ1RDW2"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
@@ -12,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/mangopi/mq1rdw2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-t113s-mangopi-mq-r-t113"
@@ -31,11 +33,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01-rc4"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mangopi_mq_r"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
