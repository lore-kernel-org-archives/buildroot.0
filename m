Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11183C77B7C
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 15:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83EB9408A5;
	Sun, 28 May 2023 15:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83EB9408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x9terZw355rg; Sun, 28 May 2023 15:32:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E151408F1;
	Sun, 28 May 2023 15:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E151408F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D67E1BF2A1
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 15:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 468F560B03
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 15:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 468F560B03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnNEgoo7T3MR for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 15:32:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3C7160AE3
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3C7160AE3
 for <buildroot@buildroot.org>; Sun, 28 May 2023 15:32:07 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-96f818c48fbso464763166b.0
 for <buildroot@buildroot.org>; Sun, 28 May 2023 08:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685287925; x=1687879925;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1VcQYSjcSBU3C3t7vcFpiDmFIrQF//R5UBMe16Itn6s=;
 b=BxTt17vg7e5fJWmsQU3/rfO5I+aUNjntu/ca8qwBVlps8fbJkrMlCLrDpoSzZnLszg
 lGCJfnBWO0OjblxOZ2+h3lKHb2/cC6qDrvxth1mM2KyoliOHz6iRei2tuqZCYSIam0lN
 a9MG3TYDlCjjrxa7Q5XIwzbK09DW/KX6s9xKq3ULAiRjKa77l/lHj0s02moNhYdxhQ5h
 SodEW6MqIhbe/CZCYKr7RHQbErf+sRxWMF50OLVqwzoh8HbGX/vqp8j2zuh7sDYrjn36
 jM51myfOialm7729Ab06tQ6FOXMHyBi8QLPFyoOzhS4QE74sMzfDyjYghkcnW+6lz/T4
 qq8g==
X-Gm-Message-State: AC+VfDwypTscKh06FD3wWfYfzxH7Cearck8wFWe50BwJTbEgj1JO1bzR
 qYoE9HZ8EUe1zUO4VRhqwJ2h0QIxtL1q0sDVq6pwnw==
X-Google-Smtp-Source: ACHHUZ4FNCMx7SomMLHQrlAv0ns/+X8gbOI9WP+RRNZlklSjVUlBX40XoxxJCnp9d6VRiEGuG3hJiA==
X-Received: by 2002:a17:907:31c5:b0:966:3de0:8998 with SMTP id
 xf5-20020a17090731c500b009663de08998mr8381725ejb.73.1685287925589; 
 Sun, 28 May 2023 08:32:05 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-31-38-128.retail.telecomitalia.it. [79.31.38.128])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a17090648cc00b00965e9a23f2bsm4769235ejt.134.2023.05.28.08.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 May 2023 08:32:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 28 May 2023 17:31:56 +0200
Message-Id: <20230528153156.1685512-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685287925; x=1687879925;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1VcQYSjcSBU3C3t7vcFpiDmFIrQF//R5UBMe16Itn6s=;
 b=BHBMq6n9xCwlMt63MLikZRdLs67zijgINrwczJGJORdoUL/InTw4qnW3Dtu6XmMac1
 XWs/Qd1sQVwavNjvWIO1znxCkuFaTBA2InjLd7DhVIpuD4x5798e/mMpr/qg93MHL703
 XzM7ZcP9QBzGISX0jxbDN5AeHiq9qYqCFMjw8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BHBMq6n9
Subject: [Buildroot] [PATCH 1/1] configs/stm32f4xx_defconfig: off network
 utils from busybox
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kernel is built without network support, so network utils are useless.
This has a positive impact on the size of busybox and xipImage, making
them smaller.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../common/stm32f4xx/busybox.fragment         | 21 +++++++++++++++++++
 .../common/stm32f4xx/stm32-post-build.sh      |  3 +++
 configs/stm32f429_disco_xip_defconfig         |  1 +
 configs/stm32f469_disco_sd_defconfig          |  1 +
 configs/stm32f469_disco_xip_defconfig         |  1 +
 5 files changed, 27 insertions(+)
 create mode 100644 board/stmicroelectronics/common/stm32f4xx/busybox.fragment

diff --git a/board/stmicroelectronics/common/stm32f4xx/busybox.fragment b/board/stmicroelectronics/common/stm32f4xx/busybox.fragment
new file mode 100644
index 000000000000..d0bf2cb99dbb
--- /dev/null
+++ b/board/stmicroelectronics/common/stm32f4xx/busybox.fragment
@@ -0,0 +1,21 @@
+# CONFIG_FEATURE_HWIB is not set
+# CONFIG_HOSTNAME is not set
+# CONFIG_DNSDOMAINNAME is not set
+# CONFIG_FEATURE_HTTPD_PORT_DEFAULT is not set
+# CONFIG_IFCONFIG is not set
+# CONFIG_FEATURE_IFCONFIG_HW is not set
+# CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS is not set
+# CONFIG_IFUP is not set
+# CONFIG_IFDOWN is not set
+# CONFIG_IP is not set
+# CONFIG_IPADDR is not set
+# CONFIG_IPLINK is not set
+# CONFIG_IPROUTE is not set
+# CONFIG_NC is not set
+# CONFIG_NETSTAT is not set
+# CONFIG_PING is not set
+# CONFIG_ROUTE is not set
+# CONFIG_TC is not set
+# CONFIG_TELNET is not set
+# CONFIG_WGET is not set
+# CONFIG_UDHCPC is not set
diff --git a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
index 2ac9c653c327..4fcce6150071 100755
--- a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
+++ b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
@@ -1,4 +1,7 @@
 #!/bin/sh
 
+# Busybox is built without network support
+sed -i '/hostname/d' ${TARGET_DIR}/etc/inittab
+
 # Kernel is built without devpts support
 sed -i '/^devpts/d' ${TARGET_DIR}/etc/fstab
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 5640d9dc4d32..d4e000487a80 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f429-disco"
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 662ce3b3d068..8b10bc674176 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index ae2780556ad1..e362a9985116 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
