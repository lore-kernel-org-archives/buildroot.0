Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CA0C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 06:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B133B60D62;
	Mon, 27 Nov 2023 06:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B133B60D62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O2Zh9tOFOPUt; Mon, 27 Nov 2023 06:43:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E787C60E09;
	Mon, 27 Nov 2023 06:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E787C60E09
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D5791BF41B
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 06:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2384140169
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 06:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2384140169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6g3iypYLSzto for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 06:43:47 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A1E4400AB
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 06:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A1E4400AB
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1cf89df1eecso23913715ad.3
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 22:43:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701067426; x=1701672226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DtKfW5Ddyz0ywa/PPJmB7wJNsFXIoRGLesB6zo7JHHk=;
 b=XErwlwZJQxME04c7eUIRJPdqaNNNDd0jE93WE7lU7XpcrNd9+0c3z/WN13IYxZhuot
 2mYRH8vCrhIT4752LRlHnuWdgxIjd2FaouhP9qxhXywVaIQIG/UYSfEwKjQPY/t8uTJ9
 rouusycU7AiII+4J6A26iQPiiXInBnH1OW4oy48WPIyjzC/3GdJ8bG7Y87qZH/kEkiZS
 TYGN6RQhlXDTtVP4sNczFmAncVMfPra93my/PfYN/Zg7wgtB1HhvRMMUqM6h5qjJq3QX
 RkrPWfI+e093GxL9amf7weo5A84HQSbQ0mCsGZrulW2tUKFnuLggPEzRdtJ8vIn7Sgn/
 5qMQ==
X-Gm-Message-State: AOJu0Yxs7v72k5OcpYFeT/WtL58unY/VuDSbhIJXjZjtCCX5IgBjIcqN
 Skye5Eoua03cmx+7j3mfHjpRrRX/TPgXlQ==
X-Google-Smtp-Source: AGHT+IEZz04tKli1CG87F+1yw8axoPN1ojmPK89qv0+LRTp7qRSJbrjWWwlf9pitqbgeZ50p08GeWA==
X-Received: by 2002:a17:902:e5c3:b0:1cf:64c0:638e with SMTP id
 u3-20020a170902e5c300b001cf64c0638emr13210405plf.8.1701067425923; 
 Sun, 26 Nov 2023 22:43:45 -0800 (PST)
Received: from localhost.localdomain (211-72-129-103.hinet-ip.hinet.net.
 [211.72.129.103]) by smtp.gmail.com with ESMTPSA id
 jb6-20020a170903258600b001cfc19c2d01sm2476581plb.296.2023.11.26.22.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 22:43:45 -0800 (PST)
From: nigel_wang <asd617140123@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Nov 2023 14:43:49 +0800
Message-Id: <20231127064349.12099-2-asd617140123@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231127064349.12099-1-asd617140123@gmail.com>
References: <20231127064349.12099-1-asd617140123@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701067426; x=1701672226; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DtKfW5Ddyz0ywa/PPJmB7wJNsFXIoRGLesB6zo7JHHk=;
 b=LIifvA95m2M1sGkQHtoOvPqSEvhQNnKBa5I/s1x/2eBuXyhCwyMdv88uExJyUYWnc0
 6ZQ8Ze0ptxxfEBjAh9diPR8xFySVwM+HmtmTPBqkwJYRvUzflCFNmcsifUXdKsVsXWWJ
 JGIT86vQbLRzdJ6KWaMWs0GF4stoIYth0bsU+hVP6VJkYST3OpU6cAw7sdlNXTyQZY6l
 66yQce6fIcDces/NkMoxqgYvDSwp/K45uME8xz/pg9KkmdteZB+d4NNnp9FazjN5b6fx
 98LjYGYM44NAuBzDqwItPBXUw+27V+CE+/FDqo5+M0BUl7950WRmJMQ+o0gOg/AvIbuK
 BrJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LIifvA95
Subject: [Buildroot] [PATCH 2/2] configs/cubieboard4_defconfig : add
 *_defconfig for cubieboard4.
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
Cc: thomas.petazzoni@free-electrons.com, nigel_wang <asd617140123@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: nigel_wang <asd617140123@gmail.com>
---
 configs/cubieboard4_defconfig | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 configs/cubieboard4_defconfig

diff --git a/configs/cubieboard4_defconfig b/configs/cubieboard4_defconfig
new file mode 100644
index 0000000000..6a5f9e3fce
--- /dev/null
+++ b/configs/cubieboard4_defconfig
@@ -0,0 +1,42 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
+BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun9i-a80-cubieboard4"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard4"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/cubietech/cubieboard4/boot.cmd"
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="Cubieboard4"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard4!"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard4/post-image.sh"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
