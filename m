Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32080C19F32
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 10:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1E9860EED;
	Wed,  5 Mar 2025 10:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wkpfzl3UPzxL; Wed,  5 Mar 2025 10:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C51C460EF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C51C460EF3;
	Wed,  5 Mar 2025 10:33:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1093A95F
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 10:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDC8160EF3
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 10:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2oZdUGl1opaM for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 10:33:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C933760EED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C933760EED
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C933760EED
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 10:33:40 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30b9b1979b9so56250121fa.1
 for <buildroot@buildroot.org>; Wed, 05 Mar 2025 02:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741170818; x=1741775618;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1MW/bubI12cj42SxD9BOxgAtknEwDQjqxWZWf3juF2c=;
 b=n9ctVSRLVvknwRaGfH4ir1O0goQ89Hys/R4o90j2lheoq9CaATbhq2RUHru6pOwdA8
 uDnWDhATZWdELwtY9bzjvK4qA0/5w3OD23xTffC67zEE0IljMGwuZlh6UBTYYuN+ju1C
 hBo0qClMTnDJIoNA8z/vZl84HYoQU+79Vtc3t28GsrGW56a1RUi8dxHAFQwKiPnpcZc2
 wTZ1Nmpt4HNoPBHnsWUwMtUY0Jw9ZLsnQLpklvjL74KnbL8I5KBilNbUkXeD83Y5MuBC
 gOGWEH3yUod/Jpr9OJlR0YVS7tgJXfJx+N/zkn7yg38xk72l3+iaw/mHoX/Y2N8yxfFZ
 21gA==
X-Gm-Message-State: AOJu0Yz5MId5LhlUqd5xW0V4V1eYZNz9eTVPUpLuClt1ogSd+BVCU19q
 3jr77ZiByzqYl08lZrqso+C0xBvyDkr7lM4oLFwXdzXaRpFNn8KvMQHR/ukzh8M+7J6NyWSC9jA
 EZKhoLxSP52sjBOnMJw4aqZs4SfhlVFtQ
X-Gm-Gg: ASbGncuLmyQi1RpMftx5wdnBb8VkwBAONNldJYQDbAYSagaIyo2gBZHjGyUlZz7eE+4
 Cm8ixEvIFcCthWZ8ejpdPrFEPWPKUROdPA4zE1v3iEM8KByYg2e12ANqcdz9+EuPMr7aFyqDlQI
 csMQn8kUa+MaIckYS+WUY/XS5TL24=
X-Google-Smtp-Source: AGHT+IHfFJ6jLP/XFMHKOt26TblxbvELADVgaPZdARnme5r08eFBUde95T033wzlii8FLOJ/MzrzDwaYNl7zcpoTAiw=
X-Received: by 2002:a05:651c:2116:b0:30b:a8c2:cbd3 with SMTP id
 38308e7fff4ca-30bd7af1ab6mr10188281fa.28.1741170818116; Wed, 05 Mar 2025
 02:33:38 -0800 (PST)
MIME-Version: 1.0
References: <20250305101240.87571-2-meena.murthy@amarulasolutions.com>
In-Reply-To: <20250305101240.87571-2-meena.murthy@amarulasolutions.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 5 Mar 2025 11:33:25 +0100
X-Gm-Features: AQ5f1JpuVbkO5uJDKNSOBvoq6k-FlFiaoz-iNM06RYrVb33t_pha11m2XD3UqFE
Message-ID: <CAEyMn7YGT=Cu-W-AYrb3BU8fG-vUPT33usg7q8KN2KHa+E1Dkg@mail.gmail.com>
To: Meena Murthy <meena.murthy@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741170818; x=1741775618; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1MW/bubI12cj42SxD9BOxgAtknEwDQjqxWZWf3juF2c=;
 b=KKdymClBnLymZliG1Jw1ejOnUuRoLEnP64L6tdrS9b2za+LO5IAJGrN2p+BrcySd04
 EbaKXaEV6iB2+9h5GB48SlePy5BM97OERzYsOPs1dALReuK5k8od2Wqgk5rLTUaQ1eky
 t5731Sdq0OtdIetNx7gqzPdyKu+rZXjf0kcaxJfL3wGbqgsYxMaRY5C1I7miyDsBsoX5
 dnoacRfgwXzIFKAlwjwxLKTMdkovuwn41tR63v2v3jaYAf1pf/0fj3nCtZOa/CdtqM/+
 1FWcLHbKue+w4cq9IZGyCKSNAu003wsEboZZi5kd4DtytOOXOjPmX0/ntbTKNADS7J+u
 qndw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KKdymClB
Subject: Re: [Buildroot] [PATCH v2] board: Add support for Engicam PX30 SOM
 board
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

Hi,


> +++ b/configs/engicam_px30_core_defconfig
> @@ -0,0 +1,49 @@
> +BR2_aarch64=y
> +BR2_cortex_a72_a53=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
> +BR2_GNU_MIRROR="http://ftpmirror.gnu.org"
> +BR2_GLOBAL_PATCH_DIR="board/engicam/px30core/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_TARGET_GENERIC_HOSTNAME=""
> +BR2_TARGET_GENERIC_ISSUE=""
> +BR2_ROOTFS_MERGED_USR=y
> +BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/engicam/px30core./post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/px30core/genimage.cfg"

This BR2_ROOTFS_POST_SCRIPT_ARGS value is common and passed to
BR2_ROOTFS_POST_BUILD_SCRIPT and to BR2_ROOTFS_POST_IMAGE_SCRIPT. To
make it a little bit cleaner you could use
BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS that is only passed to
BR2_ROOTFS_POST_IMAGE_SCRIPT. But it is only a small nitpick.

> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/px30-engicam-px30-core-ctouch2-of10"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="150M"
> +BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O 64bit"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.9"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="px30"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="px30-core-ctouch2-of10-px30"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
> +BR2_TARGET_UBOOT_USE_BINMAN=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> --
> 2.43.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

BR
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
