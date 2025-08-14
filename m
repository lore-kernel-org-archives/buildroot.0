Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7162CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E2AD80D9E;
	Thu, 14 Aug 2025 20:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DyhzYirN-SFR; Thu, 14 Aug 2025 20:31:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4DAC80DBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4DAC80DBA;
	Thu, 14 Aug 2025 20:31:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B52F1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6229F402F5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wq6VsCJsgKL1 for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 221DC40363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 221DC40363
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 221DC40363
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:26 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45a1b05fe23so7341735e9.1
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203485; x=1755808285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AoIuuMAI6SmIFv6dK8lYO/9c/pzQeME3KxXbDtZ2Hmw=;
 b=RB/z/3VtTNMIE6WxqqeIe2uIAZFmgYeG8yefqEUIUqmmtS/x3Bn9wg0MCsIAu6DHXy
 O42gIjh8SZfHBJsB7rdHEh1+GTDghQqYiBOzWZZY75sqCYG93Np0pjDzNGM2nmQk5Z2X
 2ehAOFmTHEBw2DtDpMvDYy9jrIVOh+p29h4BXpdgcI8omxptI3WJN4rhfQOxIR77MqDv
 VTfWJni3XPin0rpW8/1h03mQ4UIRZia3jJrMNyMOdXs4W90ydDCkY+dq/Hji4tMEp5Q2
 AaJ2aw00mmB9h1TZPJDrKY6CJIFP0WQQKVjgKbp8E8sYgHmF/OG09GJ7Mb8l8HSKlt4V
 UFAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM4OwzAaoHaFEcKO6WZvWJ5vQnal78CpmtQeZtg2lKsMt04lks1L6QCIU5bW/ybElwOJIbDowPHNU=@buildroot.org
X-Gm-Message-State: AOJu0YwQgIMoS0qipuE+zVHAACOOGQsMVp4scoei7gQJCv5x4yUT+pjU
 0RfYJy7VLajG/dZppshbQNai2Bz8IE4Li0TxiZxS+pPnxw5H6AvvlxPnI00a1zymccgsN0chyfV
 GDIdPTL4=
X-Gm-Gg: ASbGncuFGYVEnf4Au1bi8Zty3b6ciSf4ISKke9BIt15QpI/HnezfL5cEfcFeopJeWZV
 M1D5ZPTaz6fbjZ0yO6yhSgbt5lQh0Ba8zEpNfzfU7M9I8N5rixpAxCUdqt/BKbqfkiBBJLRSCfR
 JQ4SaSdT2EbO7lfgOSsetrymdvm53+dffxwlB3PhznDyDEatMegRomFPq6i4683lyi4LAymQowE
 PvA+7Y6PyON0zQtCU6bOgSGVDQGL8zwe3OVMblEYmfM28IRp9fN+19yh0Rn61CsYaetPZ7ZZ7e4
 w+8tfg4QAO0zE4woifH3FA1Qj2MNVT4docgkwwAPwNVgwdMEx0WMVrjSPza4yepzGfP2C6O5t6r
 vWa9CsxXQU2nlxA==
X-Google-Smtp-Source: AGHT+IFFT9nNTbVIY1zw1ta1F8DqZl9xQvxRwim/YmKBwi5lLaYLpnwHz1f8JCU33PPKeg1+MQmaww==
X-Received: by 2002:a05:600c:1d16:b0:459:94a7:220f with SMTP id
 5b1f17b1804b1-45a1b6577f9mr33244315e9.26.1755203484794; 
 Thu, 14 Aug 2025 13:31:24 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1fe2c019sm13255275e9.17.2025.08.14.13.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:24 -0700 (PDT)
To: Peter Seiderer <ps.report@gmx.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:24 +0200
Message-ID: <20250814203124.2814766-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803144208.195144-1-ps.report@gmx.net>
References: <20250803144208.195144-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203485; x=1755808285; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AoIuuMAI6SmIFv6dK8lYO/9c/pzQeME3KxXbDtZ2Hmw=;
 b=S+InBQqfVBW8XrN3VKq+hLs0KmVYNJ/jGu6/gdUBn3bkkxCfg6Ky3aIDFTmr5/FxnC
 DAk5v5XjKrwhmGSPcffoPriGkxfEhOgkC241w2+jPGUEXDsYLeOvLhq8Z2PFGGJWyuMU
 5wQ6OOxVtlQhEY+xcfWqxOXZ4bAhu8Tx171cofDOtz8Vpr2AJGgJo3rXXIvWfP+OhZyU
 hW+RVEfXChAycClDYmAKW8by95nvtw3bVA4UsOIV4eTqVmAbltquZISXm9FMGtmG1RoJ
 garAjEU4NqFoxXljsXhsXGvvsdpWauG5UPTmu8hCr3WP39LCizBd4eRVxc4/+YV1SC90
 fvPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S+InBQqf
Subject: Re: [Buildroot] [PATCH 1/3] configs/raspberrypi*: bump kernel
 version to ac69f09 (6.12.41)
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Now based on 6.12.41 (from 6.12.20)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to 2025.05.x. Thanks

> ---
>  board/raspberrypi/patches/linux/linux.hash | 2 +-
>  configs/raspberrypi0_defconfig             | 2 +-
>  configs/raspberrypi0w_defconfig            | 2 +-
>  configs/raspberrypi2_64_defconfig          | 2 +-
>  configs/raspberrypi2_defconfig             | 2 +-
>  configs/raspberrypi3_64_defconfig          | 2 +-
>  configs/raspberrypi3_defconfig             | 2 +-
>  configs/raspberrypi3_qt5we_defconfig       | 2 +-
>  configs/raspberrypi4_64_defconfig          | 2 +-
>  configs/raspberrypi4_defconfig             | 2 +-
>  configs/raspberrypi5_defconfig             | 2 +-
>  configs/raspberrypi_defconfig              | 2 +-
>  configs/raspberrypicm4io_64_defconfig      | 2 +-
>  configs/raspberrypicm4io_defconfig         | 2 +-
>  configs/raspberrypicm5io_defconfig         | 2 +-
>  configs/raspberrypizero2w_64_defconfig     | 2 +-
>  configs/raspberrypizero2w_defconfig        | 2 +-
>  17 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/board/raspberrypi/patches/linux/linux.hash b/board/raspberrypi/patches/linux/linux.hash
> index 3f278cb885..51b0684b20 100644
> --- a/board/raspberrypi/patches/linux/linux.hash
> +++ b/board/raspberrypi/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  e7b484dc66565e8ea7b2792eea864c7c5ba6d8d0f6ea65288e701e03befec33f  linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz
> +sha256  afc44e2899a3c32a1b968272a5816e5c90bea346341153807553396621e65dde  linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz
> diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
> index ffd1ef78c1..1be48c32dc 100644
> --- a/configs/raspberrypi0_defconfig
> +++ b/configs/raspberrypi0_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero"
> diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
> index 45dab555d3..c7803c5af6 100644
> --- a/configs/raspberrypi0w_defconfig
> +++ b/configs/raspberrypi0w_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0w/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0w/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero-w"
> diff --git a/configs/raspberrypi2_64_defconfig b/configs/raspberrypi2_64_defconfig
> index 211e8470b4..57f98c7396 100644
> --- a/configs/raspberrypi2_64_defconfig
> +++ b/configs/raspberrypi2_64_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2-64/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2-64/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-2-b"
> diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
> index d19a64ce11..60eb62b473 100644
> --- a/configs/raspberrypi2_defconfig
> +++ b/configs/raspberrypi2_defconfig
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2709-rpi-2-b broadcom/bcm2710-rpi-2-b"
> diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
> index 927f82a4cb..59b8b3fc6f 100644
> --- a/configs/raspberrypi3_64_defconfig
> +++ b/configs/raspberrypi3_64_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
> diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
> index 9342bc4b6a..3f7fdeb3ab 100644
> --- a/configs/raspberrypi3_defconfig
> +++ b/configs/raspberrypi3_defconfig
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
> diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
> index dc8160711d..8cbb8b0d41 100644
> --- a/configs/raspberrypi3_qt5we_defconfig
> +++ b/configs/raspberrypi3_qt5we_defconfig
> @@ -12,7 +12,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
> diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
> index 2e2c52e5c9..c0a33c3eb5 100644
> --- a/configs/raspberrypi4_64_defconfig
> +++ b/configs/raspberrypi4_64_defconfig
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400 broadcom/bcm2711-rpi-cm4 broadcom/bcm2711-rpi-cm4s"
> diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
> index d7229b66f2..75078a3c2c 100644
> --- a/configs/raspberrypi4_defconfig
> +++ b/configs/raspberrypi4_defconfig
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400 broadcom/bcm2711-rpi-cm4 broadcom/bcm2711-rpi-cm4s"
> diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
> index d18f2ff480..6928e2ba0f 100644
> --- a/configs/raspberrypi5_defconfig
> +++ b/configs/raspberrypi5_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi5/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi5/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
> index 90a5240bd8..00525e050e 100644
> --- a/configs/raspberrypi_defconfig
> +++ b/configs/raspberrypi_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-b-rev1 broadcom/bcm2708-rpi-b broadcom/bcm2708-rpi-b-plus broadcom/bcm2708-rpi-cm"
> diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
> index 1e5915c287..648740c273 100644
> --- a/configs/raspberrypicm4io_64_defconfig
> +++ b/configs/raspberrypicm4io_64_defconfig
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io-64/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io-64/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
> diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
> index 51400f9217..e5bbff76c1 100644
> --- a/configs/raspberrypicm4io_defconfig
> +++ b/configs/raspberrypicm4io_defconfig
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
> diff --git a/configs/raspberrypicm5io_defconfig b/configs/raspberrypicm5io_defconfig
> index 9bfde8f501..122a25ed92 100644
> --- a/configs/raspberrypicm5io_defconfig
> +++ b/configs/raspberrypicm5io_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm5io/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm5io/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/raspberrypizero2w_64_defconfig b/configs/raspberrypizero2w_64_defconfig
> index a3c5b586a3..7a00fa14ac 100644
> --- a/configs/raspberrypizero2w_64_defconfig
> +++ b/configs/raspberrypizero2w_64_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w-64/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w-64/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"
> diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
> index 4385c7bdd6..36e66676fa 100644
> --- a/configs/raspberrypizero2w_defconfig
> +++ b/configs/raspberrypizero2w_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
