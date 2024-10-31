Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852DDE67485
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 21:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F9EC408AC;
	Thu, 31 Oct 2024 21:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KH7L7xUHO9DZ; Thu, 31 Oct 2024 21:34:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31C67408BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31C67408BB;
	Thu, 31 Oct 2024 21:34:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B63BE5B1E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A59A58169E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K29FYotbQeEr for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 21:34:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A732C80EAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A732C80EAB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A732C80EAB
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:31 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2F33AB00565;
 Thu, 31 Oct 2024 22:34:22 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Romain Naour <romain.naour@smile.fr>
Date: Thu, 31 Oct 2024 22:33:41 +0100
Message-ID: <20241031213348.2057705-2-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031213348.2057705-1-ju.o@free.fr>
References: <20241031213348.2057705-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730410470;
 bh=Yalx5EHkEFpsZA9YakdoMFilCyKdeuhqsmRyEqamrJA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NEj78M3trBd8fyMPQ8XsM0dHWk+wmIQZhTG+SSneQPE8kHKF99/NyUR0OLgXoUB4F
 ytnXSroz1MbVx9fzlSuuMt8YJUa606NJiT8dmid+BqC4KOh4mK25x6mnk+L6M+bL4E
 CxKoocGglbFVNC77dHBC8qAQ4bO9qiZo+V5MpZ8v5AdK4BmLMHgG39REdBA4yAOnQB
 u3jUUkuUo66ENviv/5H8lRKg/pSDkRB8KIEi/1XnYRHaN9JPx4yzd2dlbmmd/RORTY
 /pcU+fnm6F+YfJRSE+cdF7qqaR/ZQlqHDslZBibkEOd8F1HZpxZ90jY+VeGUl8QUzB
 H9yV86Fxj8nsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NEj78M3t
Subject: [Buildroot] [PATCH v3 1/8] configs/qemu_aarch64_sbsa_defconfig:
 update ATF to v2.11
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

From: Romain Naour <romain.naour@smile.fr>

qemu_aarch64_sbsa_defconfig doesn't boot since the qemu version bump to
9.0 [1]. Sync the ATF version with the one (v2.11) used by Qemu tests
[2].

Since we use a released version of ATF, we switch to ATF custom version
to use the official ATF repository instead of the read-only mirror on
ARM-software's github.

This doesn't fix yet this defconfig due to a bug in edk2 as mentioned
in the qemu commit log [2].

With the edk2 version bump applied, this defconfig doesn't boot with
ATF v2.10-lts but boot successfully with ATF v2.11.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/103a55028c75dace312470ba05a197886c6b6100
[2] https://gitlab.com/qemu-project/qemu/-/commit/24a7cd6a7c21f82f1ce9bd5ecf6fb54eb7bf4602

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 1 +
 configs/qemu_aarch64_sbsa_defconfig                          | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 5632db01f8..4a0534d1ba 100644
--- a/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,4 @@
 # Locally computed:
 sha256  c9f0d0bf967d690edbf34b621728a6271856f2e26ed46081a285b6d627a358c5  arm-trusted-firmware-v2.7-git4.tar.gz
 sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 8da4331b30..23d274b529 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -17,9 +17,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_EDK2=y
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
