Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D660E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 23:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCCDD60A89;
	Mon, 30 Dec 2024 23:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdGD1zpvqcEV; Mon, 30 Dec 2024 23:12:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C14806070E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C14806070E;
	Mon, 30 Dec 2024 23:12:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81B5DE0F
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 23:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6204D60A8A
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 23:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThlTzHNuL9sW for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 23:12:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 322CD6070E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 322CD6070E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 322CD6070E
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 23:11:59 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CC459B0053E;
 Tue, 31 Dec 2024 00:11:55 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 31 Dec 2024 00:11:44 +0100
Message-ID: <20241230231144.254849-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735600317;
 bh=ggKykSdc3akkfm+ZdESS/hfUJWjoqRnQ6CDPapT7cwQ=;
 h=From:To:Cc:Subject:Date:From;
 b=LrCVXZiXBuSOFhuOs2C4afBNTQFu+jzf6lvJrbT/yjQIFTt7w3K09TO2mkLzAT7/P
 hNlaHb9NJVa7F/KyFxjIlGj20aS+g5TnLGgmjNRZvH5OaKEipL6DjoOJgIxCmqfKZ9
 2hSUjgmAolaiiqthYBHz2WEKp6p2/WY74DV/y84swOkrXhtTnkAR/maDlqqrzmEm6M
 KUJBbJQ/NVl8h8BvcO95M3XrcnsMCTgDoEVG3Vr0oBG+klK6MBOHTsf6W9acSYpTe7
 Y1iIYHPF6G43IHn+hKAQi4rXUdxCgoGh5nvC5fzGJ6zn0dx0+Pq8pT6cBIz6vY3POD
 FotXHLOeoPAfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LrCVXZiX
Subject: [Buildroot] [PATCH 1/1] configs/spike_riscv{32,
 64}: bump opensbi to v1.6
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

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1606807486
---
 board/spike/riscv32/patches/opensbi/opensbi.hash | 2 +-
 board/spike/riscv64/patches/opensbi/opensbi.hash | 2 +-
 configs/spike_riscv32_defconfig                  | 2 +-
 configs/spike_riscv64_defconfig                  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/spike/riscv32/patches/opensbi/opensbi.hash b/board/spike/riscv32/patches/opensbi/opensbi.hash
index bc4058abe6..d7893a1dee 100644
--- a/board/spike/riscv32/patches/opensbi/opensbi.hash
+++ b/board/spike/riscv32/patches/opensbi/opensbi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  319b62a4186fbce9b81a0c5f0ec9f003a10c808397a72138bc9745d9b87b1eb1  opensbi-1.4.tar.gz
+sha256  d11702103f177a2914e94eec57ce5ed820296d874f6b6525c4482e55d71a3667  opensbi-1.6.tar.gz
diff --git a/board/spike/riscv64/patches/opensbi/opensbi.hash b/board/spike/riscv64/patches/opensbi/opensbi.hash
index bc4058abe6..d7893a1dee 100644
--- a/board/spike/riscv64/patches/opensbi/opensbi.hash
+++ b/board/spike/riscv64/patches/opensbi/opensbi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  319b62a4186fbce9b81a0c5f0ec9f003a10c808397a72138bc9745d9b87b1eb1  opensbi-1.4.tar.gz
+sha256  d11702103f177a2914e94eec57ce5ed820296d874f6b6525c4482e55d71a3667  opensbi-1.6.tar.gz
diff --git a/configs/spike_riscv32_defconfig b/configs/spike_riscv32_defconfig
index 6ea12dc1fb..a73f335f34 100644
--- a/configs/spike_riscv32_defconfig
+++ b/configs/spike_riscv32_defconfig
@@ -11,7 +11,7 @@ BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.4"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
 BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
 BR2_PACKAGE_HOST_RISCV_ISA_SIM=y
diff --git a/configs/spike_riscv64_defconfig b/configs/spike_riscv64_defconfig
index 913830e38e..7b698737e2 100644
--- a/configs/spike_riscv64_defconfig
+++ b/configs/spike_riscv64_defconfig
@@ -10,7 +10,7 @@ BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.4"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
 BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
 BR2_PACKAGE_HOST_RISCV_ISA_SIM=y
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
