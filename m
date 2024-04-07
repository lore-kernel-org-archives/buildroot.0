Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0436BCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C785941E72;
	Sun,  7 Apr 2024 10:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fx8MjEsLf_ev; Sun,  7 Apr 2024 10:36:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83F9E416E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83F9E416E0;
	Sun,  7 Apr 2024 10:36:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13BC71BF575
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F251D417D0
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgYHxXWJ3sNI for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:35:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57C0441712
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57C0441712
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57C0441712
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:35:24 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d68651e253so41355871fa.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486122; x=1713090922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JQhknu/gZcrkS17syAC4uTGFlEZTHXMKIn7uf2phKFY=;
 b=f0QF9IZlAxnv1caH03ka2V60Cty0uo7QNXIRerMJN+5oyMxlQh9UL6Fuzg4+myBvpU
 WQgJFmOZHF+SiJ1OtLQhwoWpWV+OYIcp2lWbJxX6L3dhoOIuAKIrq9dN8NDBKKGFXu6V
 9dIWAE0D+m9CFZuWgOsc+sZ5Ew+iEx0CmZgtONKg5f5MbNmRW7PkgF5X4j+Bw8Y0rgpO
 9AX7FPRfABspvxsV+qXsnM44U+oNX8a4LGJyg8YfJWIuf56GltmHpVzXb1LAyfQ6dzAc
 Eo4IWWClro9XW7TIjNiCHlSo05LstkVN3OwVLEcTr8nyO2T5dpOt38qxMD2ksTMEbQjJ
 e1WQ==
X-Gm-Message-State: AOJu0YwFDW869EDPqlRk1uzCuKQ8SIoFbpVAJ6nfL6rm7TfyADvbOIWO
 3NdVe/vtG256NClqysXjQ6ZZSjO19O0dV1q1Dujlg6zIWaCrpG27rwx6WQmkaMom4N0z3uy1uDg
 C
X-Google-Smtp-Source: AGHT+IFyph6QQXMK2v3yLy0eVaE+Iwi4ssndGUPnsrwZvpGe0jaH96cmriyvE/cH7T75MG5vwKGSmA==
X-Received: by 2002:a2e:b61b:0:b0:2d8:70a6:9575 with SMTP id
 r27-20020a2eb61b000000b002d870a69575mr2884571ljn.7.1712486122168; 
 Sun, 07 Apr 2024 03:35:22 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b004149536479esm9486542wmb.12.2024.04.07.03.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:35:21 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:35:05 +0200
Message-ID: <20240407103512.1112712-13-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240407103512.1112712-1-romain.naour@smile.fr>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712486122; x=1713090922;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JQhknu/gZcrkS17syAC4uTGFlEZTHXMKIn7uf2phKFY=;
 b=E5zai18Ny7mStF4K6mLpuKzwdUZ4UxomPOh1hiBy/IomNPYfo+DQD/kiSvlCEWqFJw
 jzPIOb0P0wULV3RrugvMCDxXMB7HRmwozNx/OmEKfdmpgAq0XInThnG4lHbYXSrMaiET
 d1HgxDhMmWoLOp9cEHNHS1HkymDJZtZ8WE4JPRCG0U8h2qyZVS0ZHTYw7QoPAh2636Go
 NhhYsqAh0EKJs1PHckImHFNUnfMMPpSV11zNt+PmGnB4vKaUQHkzi1Il2MFiedf1A6BJ
 VZ6bYscQoG+SY6mffrYpJ5ED7KtgjlpknR/ASMew+QYAQceVsrw6sI+srvDO5uJh1LwS
 lbyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=E5zai18N
Subject: [Buildroot] [PATCH v12 12/16] configs/ti_am64x_sk_defconfig: bump
 Linux version to 6.6.18
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v11:
- add BR2_DOWNLOAD_FORCE_CHECK_HASHES=y

Added in v8
---
 board/ti/am64x-sk/patches/linux-headers/linux-headers.hash | 1 +
 board/ti/am64x-sk/patches/linux/linux.hash                 | 2 ++
 configs/ti_am64x_sk_defconfig                              | 5 +++--
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 120000 board/ti/am64x-sk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/ti/am64x-sk/patches/linux/linux.hash

diff --git a/board/ti/am64x-sk/patches/linux-headers/linux-headers.hash b/board/ti/am64x-sk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/ti/am64x-sk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/ti/am64x-sk/patches/linux/linux.hash b/board/ti/am64x-sk/patches/linux/linux.hash
new file mode 100644
index 0000000000..cedae67f33
--- /dev/null
+++ b/board/ti/am64x-sk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index eaeccde316..56e1b23335 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,13 +1,14 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am64x-sk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
 BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am642-sk.dtb -l am64x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am64x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
