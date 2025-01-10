Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1240DE7719A
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 00:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C50A4076A;
	Fri, 10 Jan 2025 00:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTd1MOD-iCfH; Fri, 10 Jan 2025 00:17:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5D6440773
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5D6440773;
	Fri, 10 Jan 2025 00:17:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AE88940
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 00:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D701740689
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 00:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3k7rfrjwRLHE for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 00:17:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE62740753
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE62740753
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE62740753
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 00:17:22 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a8ed4c8647so8599735ab.1
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 16:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736468241; x=1737073041;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Yk0rLOfc1X9dm8JKr3zrWz3RbGf6IiEPAa50epRYLy8=;
 b=dc/KUQx4C1CswEU7h6j/bcgySWoRq7GRJdluVHu+m1CQyBFbiASgxk/u3G19ercjkI
 BDuGrgtQvjimw64dio7yE+nxVVY2HH1xS3tRAgYcHXkcAZOtcCr+tpCf5p2PDoc+zOh+
 by4aoiEeGFXgL+r0YQzvsfyECfFJEi8bO+Ph78LQx0cgYT0MzKR2v7e7q74utc0lyy43
 Lpke1UcVbpd5EeDf2rAg0OB2bhq2+N7M3e8lZ11XLy41ahkhQO5ighwYiflukxm1pmqY
 NQBcoeQiqBg/1E02pMVMaSXQcgIXJeplPIVEpMAKzmT1coSJwVT+/COQdxKCjIsUvGMJ
 2qfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRdZsNFcB4c9EwFFG6el0YrCnneMZZtUe+NHoR5KUVS2lwXyvdX7qTHX3rfVmAEJRduWWXYRl4/NI=@buildroot.org
X-Gm-Message-State: AOJu0YzuqczxmAuY6MWK/7gGsQ/pRMHPrOCjymW43p/30DRZ/ur5FCwQ
 HBY9Zj0fgHVZ7GmML/YngYmefVj6xmj/ppLN7y84zz76FqopktiV
X-Gm-Gg: ASbGncsTgSvDWRZE6Mi5SQu/WJaLnnkCLWrti/s2mnPAkO+okGzM/qV8QL4i7wcWunR
 DvWCr8C4dv2OTGW8E2mi3DVMMkYuQT0r1WE6cqFAvDrOQjjCBJDlPN9QGVUIdYPH1wpijVhlhyQ
 QxZHhYa53DYR9HZun0mn2aPEB+jXRhg7L9QeSHEX9YPr6d3YHj9rZFOPycksS70hlBjcLKDy3+g
 tAQsYSdZlfEZanz/KY6WjWH3HCLPJR1mLXXeF/vkAtN/GyAMSZ9q407H3cWsigTMfR9Cdz26joA
 GUD/7h2Rl+IhN6KQJfTs1gl3mZXdO1Y=
X-Google-Smtp-Source: AGHT+IE4sKpFPdL9GwFtRltCJiwy+WqyBBsZvxxGezfo+3niSqaqZikah7Lg8sEtcTsom5Exg+qk0w==
X-Received: by 2002:a05:6e02:1c41:b0:3a7:dfe4:bd33 with SMTP id
 e9e14a558f8ab-3ce3a87a5cemr70615645ab.6.1736468241580; 
 Thu, 09 Jan 2025 16:17:21 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4adef357sm6596485ab.46.2025.01.09.16.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 16:17:21 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 09 Jan 2025 18:17:20 -0600
Message-Id: <D6XYM8SA9LAT.2AJ2ZNB87XKBW@gmail.com>
To: "Neal Frager" <neal.frager@amd.com>, <buildroot@buildroot.org>
Cc: <ibai.erkiaga-elorza@amd.com>, <luca.ceresoli@bootlin.com>,
 <brandon.maier@collins.com>, <ju.o@free.fr>,
 <thomas.petazzoni@bootlin.com>, <romain.naour@smile.fr>,
 <michal.simek@amd.com>
From: "Brandon Maier" <brandon.maier@gmail.com>
X-Mailer: aerc 0.18.2
References: <20250107151521.1655280-1-neal.frager@amd.com>
 <20250107151521.1655280-2-neal.frager@amd.com>
In-Reply-To: <20250107151521.1655280-2-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736468241; x=1737073041; darn=buildroot.org;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yk0rLOfc1X9dm8JKr3zrWz3RbGf6IiEPAa50epRYLy8=;
 b=Ji6N1FN0xhclVNJATPCXeWNjmE3Wu1Hq3qeT4iyRzFBHglJ7uV8pIjjfxvQEg7KZGd
 RQKPXbokve9/FnsC8A/2xvgRc1hQaRYLq/g6NNvxG9a7/TTebJGLgYi3qHrbCqps+2lh
 ANMFo2CLGbDZaFFphv815Y49cQkmi2sunkkP9ffCmN13VT30dTbXewfcZjdJzuAOPFX1
 VsswUUc9X8WDQ3ROZI4z8qvA3bW9C4IW1Co1TEqgmCEw7DrIzCxPf3QO1VO362dNeuUE
 bc07qnI+B0HcOfAKedSgG9Hkrx1n9/ooVLKOM39YGX3wQMHoJAu2PoW6jhAQQCZvqdvv
 oqXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ji6N1FN0
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp|versal: bump
 xilinx-prebuilt to xilinx_v2024.2_update1
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

On Tue Jan 7, 2025 at 9:15 AM CST, Neal Frager via buildroot wrote:
> Bump the zynqmp and versal defconfigs to use the xilinx-prebuilt
> xilinx_v2024.2_update1 release tag instead of the xilinx_v2024.2 release tag.
>
> The zynqmp_kria defconfigs were still using the old default xilinx_v2024.1
> release tag, so they have automatically updated to the new
> xilinx_v2024.2_update1 release.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Brandon Maier <brandon.maier@gmail.com>

> ---
>  board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash | 2 +-
>  configs/versal_vck190_defconfig                           | 1 -
>  configs/versal_vek280_defconfig                           | 1 -
>  configs/versal_vpk180_defconfig                           | 1 -
>  configs/zynqmp_zcu102_defconfig                           | 1 -
>  configs/zynqmp_zcu104_defconfig                           | 1 -
>  configs/zynqmp_zcu106_defconfig                           | 1 -
>  7 files changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> index fe6963872c..ea072378a8 100644
> --- a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> +++ b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  ef61a4b249ecbf632a25cc34c3b03b8290be44397ff739467ac92ec1701e23bf  xilinx-prebuilt-xilinx_v2024.2.tar.gz
> +sha256  86ee9629366aa8c0d70b87202152a793804ed4090e3a6fdac4eaf855bcc4d458  xilinx-prebuilt-xilinx_v2024.2_update1.tar.gz
> diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
> index 21fc202b30..165b67ec3a 100644
> --- a/configs/versal_vck190_defconfig
> +++ b/configs/versal_vck190_defconfig
> @@ -35,7 +35,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
>  BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
>  BR2_TARGET_XILINX_PREBUILT=y
> -BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
>  BR2_TARGET_XILINX_PREBUILT_VERSAL=y
>  BR2_PACKAGE_HOST_BOOTGEN=y
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
> diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
> index e90408e6b4..832788219d 100644
> --- a/configs/versal_vek280_defconfig
> +++ b/configs/versal_vek280_defconfig
> @@ -35,7 +35,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
>  BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
>  BR2_TARGET_XILINX_PREBUILT=y
> -BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
>  BR2_TARGET_XILINX_PREBUILT_VERSAL=y
>  BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
>  BR2_PACKAGE_HOST_BOOTGEN=y
> diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
> index 604e5f69c7..3db3be23ec 100644
> --- a/configs/versal_vpk180_defconfig
> +++ b/configs/versal_vpk180_defconfig
> @@ -35,7 +35,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
>  BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
>  BR2_TARGET_XILINX_PREBUILT=y
> -BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
>  BR2_TARGET_XILINX_PREBUILT_VERSAL=y
>  BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
>  BR2_PACKAGE_HOST_BOOTGEN=y
> diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
> index 1ad2a064fc..d2700d4ea1 100644
> --- a/configs/zynqmp_zcu102_defconfig
> +++ b/configs/zynqmp_zcu102_defconfig
> @@ -38,7 +38,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
>  BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
>  BR2_TARGET_XILINX_PREBUILT=y
> -BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
> index 4856c9b958..3d08d40cf0 100644
> --- a/configs/zynqmp_zcu104_defconfig
> +++ b/configs/zynqmp_zcu104_defconfig
> @@ -38,7 +38,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
>  BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu104-revC"
>  BR2_TARGET_XILINX_PREBUILT=y
> -BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
>  BR2_TARGET_XILINX_PREBUILT_BOARD="zcu104"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
> diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
> index 4c5ac16f0c..e91d88f05f 100644
> --- a/configs/zynqmp_zcu106_defconfig
> +++ b/configs/zynqmp_zcu106_defconfig
> @@ -38,7 +38,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
>  BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
>  BR2_TARGET_XILINX_PREBUILT=y
> -BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
>  BR2_TARGET_XILINX_PREBUILT_BOARD="zcu106"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
