Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76775F436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FCA160E22;
	Fri, 17 Apr 2026 15:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMGq3OWve83x; Fri, 17 Apr 2026 15:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A91F60E8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439542;
	bh=azBQopvAS9INA62Rv/zZBZXcf761uUiIH1lWX7EJO0Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gfCV9mogllMoRjFloyql90bFquaXhwj8+raEEW2X8XPoTyqq8PIH17R2bXhGpDpAO
	 Gz/QNDiURBYKVAUx8lLMM1/L2HSyvlP26xCHWbGaX/WejxIhvHumtJLDYJyEJUOYpG
	 swr1fhfittr3wlcRcED4pBGzRo+X+dMgXjdDJRbWXDh/PyqhxvGdwmVQrNXgLXlF7N
	 qx6YsLdkz3KnWYsf7IphzBh07QsAVrccpm0SvAfKxuf8HXGXFxkPi9m8ll7WmYPwPr
	 pobt4C9UgO45lOD05+NzhFeGp+imiiX5AWdB+aDVjjdKa4c6sw7USOnkgKf1LW4jkt
	 U401/XOVAfa4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A91F60E8D;
	Fri, 17 Apr 2026 15:25:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C59CA396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7F2D40DDB
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXvu5ixZhPxQ for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:25:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A32BB40DCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A32BB40DCD
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A32BB40DCD
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:34 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso9567035e9.2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439532; x=1777044332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wF9QtLgjIjuhROsul8Ut0DLbtgpW6OrdntDJvw2vqOc=;
 b=qV6I7yRPnYhG0osWx8PAzio8FShoZYU3F3lrVyqBOG6hVIp0D/meZ/aVTkDypudmlR
 5x/iYXwdckjF1FeVrkvbn4dS8ZWH2WD0VGSZDxMWol74quKHfVEvLrtKBL6CMeAmae8p
 QwM7r8VjSMjbB8aNishNzFaa+bPsIiBsjZSO8N0IMztktqQn5GMFg/qa5PN1gKhZ9QRp
 b73EvaPk0EgzXbuZ59wA85anwNL1tkU7E8vI1uXJ3Frs8n4gdDC0BOMZtod2780wEonb
 vBh2qrPXLp7BQbyaNgWV4QcD0XccwyQmFwBzv3u8teOs9U0GjfISvdd9aTQEAWA2GC5q
 WDxA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+vRG39nmRygM4N2/qCqF1mRMOy6R5DWRUYoy42jdx//zCc1WwIAJEF1QIwur9yj+ungJYzXzRQBp8=@buildroot.org
X-Gm-Message-State: AOJu0YyRb6KVn1x5bBOVkFGkd0srO8Mxyp9znXZAQi4rrfZLuo8g7kta
 zXQ3c92uIpk6xqbYZn9T+u0E/vZ7qbZpsiCkPcoKjG+pWOmi7VSDZJj9xQDVUw3/TMEqncU7TVs
 VTASg
X-Gm-Gg: AeBDieuI5/Zo7T7rdGIQ/QvRbZFiDoXY8cplLJxqjp2CANn95MZ3mjrtX1qYzYVwdv3
 Fcj1n6znZ+cOQ0cjNRFZ9nn2DiHYupdwPR4tvT5xJrDIvlgNoqdo2allCcl4lEiu8lCdEVElQab
 j/6gn2IOBAXPS3OR1aWDxAAgUePJz/44QOK1Fc3zjkPmorQIBE/FcSa4FShgqbtmg7iR9mvKHRh
 agExXCCwbxBT/NR1lnOv3o7sQq6z7vAn3aCje7LB5zzvJaIgcxMLIqz+6tWYToubde8vWhQ/jEn
 UQg1gBNSez6+9yI0fHm+e/kHtfcfzZ0EihcCjI5EKnx/uY7jfl+DtiV6Hz1yDsYD5vCP+hiUU1S
 0Nx1Bfo9uonT2J2gB38dRZareoQN9r2xxBiCGrDCGGCNYLnLThsUs3njcYRipte7ntFA+cUKOJm
 6sclY+jcHa4swiDa0eyh4RdVKwb3c=
X-Received: by 2002:a05:600c:c4a2:b0:488:c078:bfda with SMTP id
 5b1f17b1804b1-488fb78eebdmr47579705e9.26.1776439532611; 
 Fri, 17 Apr 2026 08:25:32 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f8188sm59401925e9.2.2026.04.17.08.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:25:32 -0700 (PDT)
To: Gary Bisson <bisson.gary@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:25:31 +0200
Message-ID: <20260417152531.314383-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410-nitrogentoolchain-v1-1-deeeb6d014d5@gmail.com>
References: <20260410-nitrogentoolchain-v1-1-deeeb6d014d5@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439532; x=1777044332; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wF9QtLgjIjuhROsul8Ut0DLbtgpW6OrdntDJvw2vqOc=;
 b=YC0TzixEUJtxVCV2aNS67wxNyTC5ZxBvBFPmRWOk1JLjgA/cZpBeRKBnwfFTJM0Isp
 nB52T5eDndqa8Qboaa0x/sjanfCt8u5ovuM4UjVtb0OGuNo0j6qlFAG6hxjeeWZ1SSE7
 T5XqfvDHIAYMJDYnMKpdk0eE6f3P9OUC4IeTlRC9YJ3ooKlH9bAMihinzF6qU3QwH8C7
 hb+qzZjZCYGo4yWMsNP856PP3Dsz+xuNf3nUUXkDij5qFHZHbJfpt4xh2HJKHF4ysxdG
 iHWsuh1IA2e1u6la68KzjigzXJ5EQggbG4u2UmqadaLLJFkP4EMlreyGpVBJ7I0DIW4m
 4Www==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YC0TzixE
Subject: Re: [Buildroot] [PATCH] configs/nitrogen*: switch to bootlin
 toolchain
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
> As recommended by Julien[1].
> 
> [1] https://lists.buildroot.org/pipermail/buildroot/2026-April/800059.html
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  configs/nitrogen6sx_defconfig | 4 +++-
>  configs/nitrogen6x_defconfig  | 4 +++-
>  configs/nitrogen7_defconfig   | 4 +++-
>  configs/nitrogen8m_defconfig  | 4 +++-
>  configs/nitrogen8mm_defconfig | 4 +++-
>  configs/nitrogen8mn_defconfig | 4 +++-
>  configs/nitrogen8mp_defconfig | 4 +++-
>  7 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
> index 03103567e9..1c68810aa9 100644
> --- a/configs/nitrogen6sx_defconfig
> +++ b/configs/nitrogen6sx_defconfig
> @@ -3,7 +3,9 @@ BR2_cortex_a9=y
>  BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_ARM_FPU_VFPV3=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
> diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
> index 4d5408a474..50f769ac23 100644
> --- a/configs/nitrogen6x_defconfig
> +++ b/configs/nitrogen6x_defconfig
> @@ -3,7 +3,9 @@ BR2_cortex_a9=y
>  BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_ARM_FPU_VFPV3=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
> diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
> index 65aff36860..7e5f8dd4f6 100644
> --- a/configs/nitrogen7_defconfig
> +++ b/configs/nitrogen7_defconfig
> @@ -1,7 +1,9 @@
>  BR2_arm=y
>  BR2_cortex_a7=y
>  BR2_ARM_FPU_NEON_VFPV4=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
> diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
> index 9a90cdae54..48ecf4b201 100644
> --- a/configs/nitrogen8m_defconfig
> +++ b/configs/nitrogen8m_defconfig
> @@ -1,5 +1,7 @@
>  BR2_aarch64=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
> diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
> index db4af070a8..b984acd604 100644
> --- a/configs/nitrogen8mm_defconfig
> +++ b/configs/nitrogen8mm_defconfig
> @@ -1,5 +1,7 @@
>  BR2_aarch64=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
> diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
> index dc54d24008..4c63fdf9d3 100644
> --- a/configs/nitrogen8mn_defconfig
> +++ b/configs/nitrogen8mn_defconfig
> @@ -1,5 +1,7 @@
>  BR2_aarch64=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
> diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
> index 72884d97fd..b6c1264e77 100644
> --- a/configs/nitrogen8mp_defconfig
> +++ b/configs/nitrogen8mp_defconfig
> @@ -1,5 +1,7 @@
>  BR2_aarch64=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
> 
> ---
> base-commit: 52ee2f5644da5389634b2465f1dc31deb5a4807c
> change-id: 20260410-nitrogentoolchain-733e215d9fdd
> 
> Best regards,
> -- 
> Gary Bisson <bisson.gary@gmail.com>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
