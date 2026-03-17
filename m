Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EEAFED9E8
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 16:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33C64836F1;
	Tue, 17 Mar 2026 16:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNV-uMhunNSb; Tue, 17 Mar 2026 16:27:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AC5082207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773764829;
	bh=gqGa79IwBwCsBXkk5ZuVnuHKgWfGB93IQw1j2dQ7n0c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YyuJwCiSeaqlZpdx3zPuJxpRCtJAi7ilyDKiBDnW7ZuIQRgHUUbMmIs/jfZRw208T
	 i8L944OyvuGaJUpboGl/hb7MjETd+6d9FE5IYs66K5fRmg0nN+dfB8oO6mbrTNVhSW
	 omLhNJSte+iTapjIl2UJxpg4HQZtlZjzPqSh1kXbXBB09DgjLsEml1ZM1wOdkYaCUl
	 3lvkDXpoUmxNApzxwxkmanwyR+5ifLz7cjoJn9g9sdyHMnD7oCxyjgPbV4u0HcSYUH
	 DTPoK5cQaUdTDSU1rfYgUGI68T7x8UXBpfgCBacuzloR6v9NwZktYP7r/EQI8FEe3p
	 RI/gCgFnIt2nQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AC5082207;
	Tue, 17 Mar 2026 16:27:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id 52D98D3
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 16:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with UTF8SMTP id 50AFB613A3
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 16:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id M1f5B4n7xlih for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 16:27:07 +0000 (UTC)
X-Greylist: delayed 453 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 17 Mar 2026 16:27:06 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F1C3611FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F1C3611FE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.205.221.233;
 helo=out203-205-221-233.mail.qq.com; envelope-from=wangdong115@foxmail.com;
 receiver=<UNKNOWN> 
Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com
 [203.205.221.233])
 by smtp3.osuosl.org (Postfix) with UTF8SMTPS id 8F1C3611FE
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 16:27:06 +0000 (UTC)
Received: from DW-MiBook.lan ([240e:305:188b:e000:8bad:9e8a:6182:9856])
 by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
 id 4D9122CF; Wed, 18 Mar 2026 00:19:25 +0800
X-QQ-mid: xmsmtpt1773764379tl8em527s
Message-ID: <tencent_1DED7324378D3602186E5421849804FA3809@qq.com>
X-QQ-XMAILINFO: NkCoAnNrHf2NQPBHguDlYRH5twW2JAWQT+l+NPbHlPHdY1b//IiShdbeKNu/Cy
 rxKgp8PfN2X4mCWWWiLJ8FPTI9HxSv3cobOnFVS5NpOPqVcOk+zRhUntlD+4d3dwYd5bYwSIqqUB
 T6OLwlMMfx7hCKbOORTjYnaYf7jpLmdBXUQdJxqE9WxDZU1rZsZzUKoYkGS3MFk2fYaxuqJye0AA
 YiTGxZk/nEYng2Tahxuie5YTOcXLnIsQ15uuLvK+aYC3eDv2j8/lsUdOmU0OpV8qYOn+Pc5Dea+T
 oHWyreE7f2mTT9edAiY5lhCYGldUbozdebqvJDXnKBnLciP3BipdRYglfqPEa7mrlWiS0iIYJylt
 bsCzMrW1abxCvMtkqF2hMc5VRIpTA9YGwiTTCd3v8rAee6/+I/OeU1O6kAlY8bFgvtmsFx1uaa90
 H/qu4myVZ0AexWFX0dI6YnIt2BLRyv6whVgsIHtW9WH+tvKlHtcd3d+CiBajF7DsNHtafjCNgVpu
 PsQt/HJl1tgAcqebhpmVtlNySnwWI03ofpkNbuGTx9Eh1yrKXtrDXP81Du4vJ2PdU4B+g7mXFHx7
 Z+NLErBUamVW5TGWBWXdEN9QZHjaRijhEAjXE2hOkk0jxtfksG0riu8+69MLIrSyc26KybJGviJs
 LmGYxcqSzLgHS2Sg8zD3DmEz1U78Ik+Ruacxl/NbcxCF2lthf9wbHPcsA+25SXfB6E0JNXqBxlIq
 IIwo8fZaKDvFZwIhHye8AcqilUuiXdD6oRgFFZAu2+r3C/Q4ctBMZkgedZ+r6zvJGodq4yFmEReQ
 6OEa8iUS/dosb8qK6lzNwM2zlf6YztT7gQVNO+umQ+ohrdvLiyb2njwnVcA/XiUKdVvUTwNv4V7K
 Ydb2/ejFWG27tPu0tbhLuXcul+wOM7EavA3CQfhf0AZ1p+UwpUda91+ACLNQot4n3O4u5cRSJ32X
 aRFpFZmB6szm//Gha0Hdc/itwlRdItQ9P3W8dZDJd/I6S+YBp7N8NgGwX5aYPBXtPU/+tHy3F9EO
 ikWK6/6Y46lMxqD2ENQQo4rz2eOusNjQ8T+e/tn9eRwpzEwueY9Jt6fzcMa8nE5Nyag3k8SE/WTZ
 gJkTgUZNvQpVUqGgdOM+wzG8/ltM8riXb/ubJ2d0UkBLq5RLiTRNFvfDNH/SEvyyLoXnHq1HOLSj
 MYHa3jSNv2AADywg==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Dong Wang <wangdong115@foxmail.com>
To: buildroot@buildroot.org
Cc: Dong Wang <wangdong115@foxmail.com>, Gilles Talis <gilles.talis@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Mar 2026 00:17:59 +0800
X-OQ-MSGID: <20260317161759.36050-3-wangdong115@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317161759.36050-1-wangdong115@foxmail.com>
References: <20260317161759.36050-1-wangdong115@foxmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foxmail.com; s=s201512; t=1773764823;
 bh=tSKzCBLzri6BdGQVZ5xoRHfcolmHodUycgv9edFf61g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=zSjKpn55TvIWusQuG9b5WW7zMR8vSRJHeiScnNyKOT45iMvlwW+oDIlOMAqbu9NQP
 XzULKffF5UrfQNVcLbRLRQS3OGL/FdOxA6ZhZImAccaWorp2KBzSK5uQkgzJwvNZQT
 CPwdlBPbAlV/onZG8h08cdOe/9svFZBCzeX6H440=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foxmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=zSjKpn55
Subject: [Buildroot] [PATCH 2/2] configs/friendlyarm_nanopi_r2s: bump to
 kernel 6.18.18 and U-Boot 2026.01
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit:
- bumps the Linux kernel to 6.18.18
- bumps the U-Boot to 2026.01
- switches to a stable glibc Bootlin external toolchain
- enables force hashes check
- enlarge the rootfs size to 256M

The updated U-Boot should also fix the CI build of the board.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392713

Run-tested on the board.

Signed-off-by: Dong Wang <wangdong115@foxmail.com>
---
 .../friendlyarm/nanopi-r2s/patches/linux/linux.hash  |  2 ++
 board/friendlyarm/nanopi-r2s/patches/uboot.hash      |  2 ++
 configs/friendlyarm_nanopi_r2s_defconfig             | 12 ++++++++----
 3 files changed, 12 insertions(+), 4 deletions(-)
 create mode 100644 board/friendlyarm/nanopi-r2s/patches/linux/linux.hash
 create mode 100644 board/friendlyarm/nanopi-r2s/patches/uboot.hash

diff --git a/board/friendlyarm/nanopi-r2s/patches/linux/linux.hash b/board/friendlyarm/nanopi-r2s/patches/linux/linux.hash
new file mode 100644
index 0000000000..020dc72386
--- /dev/null
+++ b/board/friendlyarm/nanopi-r2s/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
diff --git a/board/friendlyarm/nanopi-r2s/patches/uboot.hash b/board/friendlyarm/nanopi-r2s/patches/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/friendlyarm/nanopi-r2s/patches/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/friendlyarm_nanopi_r2s_defconfig b/configs/friendlyarm_nanopi_r2s_defconfig
index 547d9d5f59..6250237707 100644
--- a/configs/friendlyarm_nanopi_r2s_defconfig
+++ b/configs/friendlyarm_nanopi_r2s_defconfig
@@ -1,6 +1,10 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-r2s/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="rk3328-nanopi-r2s"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Nanopi R2S RK3328"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-r2s/post-build.sh"
@@ -8,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-r2s/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3328-nanopi-r2s"
@@ -16,7 +20,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
@@ -26,7 +30,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-r2s-rk3328"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
