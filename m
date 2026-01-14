Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379C6D39014
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEE1240AE5;
	Wed, 14 Jan 2026 19:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSWyOS_Q7wDd; Wed, 14 Jan 2026 19:54:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A68CB40AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420499;
	bh=aMAZMtfnwYh9QnXiyFzTZ9ET/koBIwScmPvWUq2kpXA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IVk6Mkj1ZPxL7Q8ycQLmq2yh//ZWpT+fAvAwqqoSU0e5tmk6BM1G298EBHMp+EfMV
	 wttCMZTMHkqxCtWMscXFA2RAsC4flHPHk3G1VEwytxcGgKLfjMcJjpVjm59n7n4Znj
	 fyIfWcIfukU3SMKiB3FhTOQoqHqeCkFS2KOtCGvqUV3Bzh2T+MqbKkE+bm5fYdyDFa
	 b4JoJJBa6CeC9NlU4QeNW4JvvE9jgTcwM6PS1870a4Oax2LMrN6VpCJODYPmqPshc5
	 v/KKsgqHH27wQXEohvRBf4RTS+qZEs8hcC2qTn0rxRqJOS3626YPEdDHVoM/SMDSrK
	 IB2xYS5xN7DFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A68CB40AE8;
	Wed, 14 Jan 2026 19:54:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FD6B232
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 516018112B
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUuabjBHB8DM for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:54:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B93281117
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B93281117
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B93281117
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:56 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6xAvBAQ9wf0Dg6xDvzgcH; Wed, 14 Jan 2026 20:54:55 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:54:41 +0100
Message-ID: <20260114195451.3978704-9-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPAbAqtF48MySqi5n2QEtKiZOfdDNaQ5g6jwTJE/tUu4+rn7SYvPaRNfgU20jx2lI1U8eiOHdbZKpXYhRDLGnHQREdUKQk5Ai99R+OdHqZgmO9MKGKRg
 ogPDJNLXMyrhwZhNeGk2INZeQoWn3TdwkQ06KwQY5h7Uu1tJw/HPBHZ+Y5Ybwg0o9ZLzjq219dISiPMUMvUA8B42/+hTw70fOJ/nEjjd/zcVGFp9yLK6cwWL
 8F1w3K3Iv1ndZZHUpCMxkgdi/rKMm5fer8eV2zY9iH5hQh04QDPgGQ2mJK89G8uvO81RLWQbg7EfFQmTeaLTvBxqk1JA5o4OC/U3r8nhmft5RsEdKQ/7zEsr
 vIVftwXbdMCus1bZieJKzq6/CJxCYqKThzh91ODxcxawsLtTu/PaMgrcuacQIIBpt4YzpjQ6+RP8ki2Dder3l9WsZ0J1u4CXEyo4qXvsjYPW7AyTd35BjX+R
 DXQBHIGvWfncIkx0QjgsC53d6I87sWlC/rLdUgpumGZmir3s2wAqUqgllUNYALtaoxwk3JAqwDfwXorE
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768420495; bh=599+dW0XvHNHzaoN7bch9TtGpMSO8J/6h3S0aVGRnvM=;
 h=From:To:Subject:Date:MIME-Version;
 b=C6NOMf+vPEWOnYxkx7tN0cHk4xPYHcWSNfrJ7ifKEfFmuRm0rlmKMzuoKQAeWvMSy
 rSZjwbQ87K/u5D85SX7NakKs8cCvi4C54M6FIrvXYvtjKxX9p2YaJtxyQPJJJU7EkW
 +0A9/QT0pzq5ezLw+JNVn25vwlfwiT/JdxlIT/fiC9IC1dB369bibDqGdh+htR9AEe
 uoZr+BEmhgOa4s5jznxVCZj7GyWMOV1k3ArSzd4FNjDBI/PWg2FCOs/Xw/lJHe5xqz
 xL7Ht7etLfI//c+i+EnH+Ub7vPFjupZZ4mSOy+ylWRYctUutYpawq/d2ZkngDSexU1
 QR6XJ0l+8VTCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=C6NOMf+v
Subject: [Buildroot] [PATCH 08/17] configs/mangopi_mq1rdw2: bump Linux to
 6.18.5 and U-Boot to 2026.01
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
* bumps Linux kernel to version 6.18.5
* bumps U-Boot to version 2026.01
* forces check hashes
* switches to extlinux

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../mq1rdw2/patches/linux-headers/linux-headers.hash     | 1 +
 board/mangopi/mq1rdw2/patches/linux/linux.hash           | 2 ++
 board/mangopi/mq1rdw2/patches/uboot/uboot.hash           | 2 ++
 configs/mangopi_mq1rdw2_defconfig                        | 9 ++++++---
 4 files changed, 11 insertions(+), 3 deletions(-)
 create mode 120000 board/mangopi/mq1rdw2/patches/linux-headers/linux-headers.hash
 create mode 100644 board/mangopi/mq1rdw2/patches/linux/linux.hash
 create mode 100644 board/mangopi/mq1rdw2/patches/uboot/uboot.hash

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
index 0000000000..9f5d285c35
--- /dev/null
+++ b/board/mangopi/mq1rdw2/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  189d1f409cef8d0d234210e04595172df392f8cb297e14b447ed95720e2fd940  linux-6.18.5.tar.xz
diff --git a/board/mangopi/mq1rdw2/patches/uboot/uboot.hash b/board/mangopi/mq1rdw2/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/mangopi/mq1rdw2/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/mangopi_mq1rdw2_defconfig b/configs/mangopi_mq1rdw2_defconfig
index 2249fa4be5..68cd82e1a8 100644
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
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.5"
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
