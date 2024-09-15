Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EDCC35FE4
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 13:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 175768112F;
	Sun, 15 Sep 2024 13:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6HCsFWtubpV; Sun, 15 Sep 2024 13:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A523A81227
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A523A81227;
	Sun, 15 Sep 2024 13:00:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13CDD1BF841
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 13:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 013CD405A2
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 13:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wx_Of3Yrx1Dw for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 13:00:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A73E405A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A73E405A1
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A73E405A1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 13:00:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-374c84dcc90so2275378f8f.1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 06:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726405232; x=1727010032;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=djiLJv3BX6vyThp27xgLMr/rLJrFE/0nVLHpL6Aiqeo=;
 b=ozxz5k6ovMhHdP6AhVCmTk335+FZT7e2P48EekKcBLQJjbtGwE3bHyK72WlLAGAawm
 OcpVSyy07QZ9UbMY3MYZrLMutOHgUJKrPTvi9jZVyUkytKQ4Gf4xavDrLbgkKWIXG/Zv
 2KcsFvTOUgnqO7T8BEMPAeObWIrK2Oe8IepVLL83PNAFdwWh0/xmBcbMugErsDq7PIyj
 5SEvw+SsF/vhTw68rpbdF86l+1rg0tyYnulfMt5xJDT8Er97vcW65BqYH3+AMies8KhN
 Pzkzyt/xEef18kaRJU+KRYJom0u5lrbmtwX3Aasl2WOkzJ53T72aQecqEdaWzVghMeby
 tDHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMW/y8JDJ0TdTZgao0lZFxrHFw3pLNWZ9ve3/Gdf8lLVQofDGa7m6Sx5yQkGBox2HRtx6nGfcEJVQ=@buildroot.org
X-Gm-Message-State: AOJu0YwfYSd7hFllMxcxv8tqyjuqnYD7wUzyPHmkgdBPGNp+acO0TdAc
 //xds+VPZP4qqNJnYf9ISBpZAMG8qrKZyysyukmVH+XSdWBrX5WkY1e3l9ZrCOA=
X-Google-Smtp-Source: AGHT+IFHawHdX8xm/pXrHk96NM3q58EgyDRKOhJW6FEdpD4w1VpZkGziIlakoXAyfCGm8sVG5eAuGQ==
X-Received: by 2002:a5d:6610:0:b0:368:3717:10aa with SMTP id
 ffacd0b85a97d-378c2cd5e80mr6373187f8f.11.1726405232286; 
 Sun, 15 Sep 2024 06:00:32 -0700 (PDT)
Received: from [192.168.197.114] (92-184-112-92.mobile.fr.orangecustomers.net.
 [92.184.112.92]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e71f054asm4628116f8f.10.2024.09.15.06.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 06:00:31 -0700 (PDT)
Message-ID: <642f92fa-bfb7-411c-aeb3-b49504059912@mind.be>
Date: Sun, 15 Sep 2024 15:00:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20240812051058.2911075-1-neal.frager@amd.com>
Content-Language: en-GB
In-Reply-To: <20240812051058.2911075-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726405232; x=1727010032; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=djiLJv3BX6vyThp27xgLMr/rLJrFE/0nVLHpL6Aiqeo=;
 b=avkclmoagVyQDrrxO2MlztWb58EjlFRlwNe3HbpXd8PaQLLQJqA0x5WwquFGUI26O4
 K2MQuM4CQCjZt1gQ5l3n9rEOaMH4ux8SMGRkl+vgzVuvlYUNOBhg0umSgb2wfm66HAou
 PQng149g7yibCbxPV8usR9bmOP0grVkpp6eUl06lfYk89nR7jq647gOBqvQp2Cti/mGZ
 7TEcPWfgyrhi7MVRndIR7qx8LwZMdEFspXnnmoV3yjdRsNsVl5VlyiAWRJq7fBCF4ZoO
 wR+yiOf2LvO5MWvwEI8jEUJXqSKkkabPmrjcUui55UoITfjMbyUAz+9yMN8l4TbZw65E
 zeLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=avkclmoa
Subject: Re: [Buildroot] [PATCH v3 1/1] board/xilinx: bump to linux 6.6.40
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/08/2024 07:10, Neal Frager via buildroot wrote:
> This patch bumps all Xilinx board defconfigs to Linux 6.6.40.
> 
> Xilinx Evaluation Boards:
> configs/versal_vck190_defconfig
> configs/versal_vpk180_defconfig
> configs/zynq_microzed_defconfig
> configs/zynq_zc702_defconfig
> configs/zynq_zc706_defconfig
> configs/zynq_zed_defconfig
> configs/zynqmp_kria_kd240_defconfig
> configs/zynqmp_kria_kr260_defconfig
> configs/zynqmp_kria_kv260_defconfig
> configs/zynqmp_zcu102_defconfig
> configs/zynqmp_zcu104_defconfig
> configs/zynqmp_zcu106_defconfig
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> V1->V2:
> - Squashed bump of all Xilinx board defconfigs to single patch
> - Removed linux patch which is no longer necessary
> V2->V3:
> - Removed linux.hash for 2024.1
> ---
>   board/xilinx/patches/linux/linux.hash | 2 +-
>   configs/versal_vck190_defconfig       | 2 +-
>   configs/versal_vpk180_defconfig       | 2 +-
>   configs/zynq_microzed_defconfig       | 2 +-
>   configs/zynq_zc702_defconfig          | 2 +-
>   configs/zynq_zc706_defconfig          | 2 +-
>   configs/zynq_zed_defconfig            | 2 +-
>   configs/zynqmp_kria_kd240_defconfig   | 2 +-
>   configs/zynqmp_kria_kr260_defconfig   | 2 +-
>   configs/zynqmp_kria_kv260_defconfig   | 2 +-
>   configs/zynqmp_zcu102_defconfig       | 2 +-
>   configs/zynqmp_zcu104_defconfig       | 2 +-
>   configs/zynqmp_zcu106_defconfig       | 2 +-
>   13 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
> index d85f773478..b007db4303 100644
> --- a/board/xilinx/patches/linux/linux.hash
> +++ b/board/xilinx/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  ea85988e66b9a2e19ccd76d0f5f5e657988a873fed292160917712f45605a805  xlnx_rebase_v6.6_LTS_2024.1.tar.gz
> +sha256  6415cfcfd74e943d6ae44f6c1edcae09bf6cd89410b03c4290bf1464a8368f84  xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz
> diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
> index 21dfe2577a..58479c9f2d 100644
> --- a/configs/versal_vck190_defconfig
> +++ b/configs/versal_vck190_defconfig
> @@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
> diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
> index 253a6d2cff..4d3afc0e98 100644
> --- a/configs/versal_vpk180_defconfig
> +++ b/configs/versal_vpk180_defconfig
> @@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
> diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
> index f955a0c4ad..71a5d880b3 100644
> --- a/configs/zynq_microzed_defconfig
> +++ b/configs/zynq_microzed_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>   BR2_LINUX_KERNEL_UIMAGE=y
>   BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
> index 75ebc2a3ba..f3fc32145b 100644
> --- a/configs/zynq_zc702_defconfig
> +++ b/configs/zynq_zc702_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>   BR2_LINUX_KERNEL_UIMAGE=y
>   BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
> index ce539eefaf..f1c9bd6622 100644
> --- a/configs/zynq_zc706_defconfig
> +++ b/configs/zynq_zc706_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>   BR2_LINUX_KERNEL_UIMAGE=y
>   BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
> index 925faeac8e..cada3bbd47 100644
> --- a/configs/zynq_zed_defconfig
> +++ b/configs/zynq_zed_defconfig
> @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>   BR2_LINUX_KERNEL_UIMAGE=y
>   BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
> index dff49b9837..262e80a145 100644
> --- a/configs/zynqmp_kria_kd240_defconfig
> +++ b/configs/zynqmp_kria_kd240_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
> diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
> index 24fdea9c30..65bba693a0 100644
> --- a/configs/zynqmp_kria_kr260_defconfig
> +++ b/configs/zynqmp_kria_kr260_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
> diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
> index a16da66e38..22df2a4112 100644
> --- a/configs/zynqmp_kria_kv260_defconfig
> +++ b/configs/zynqmp_kria_kv260_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
> diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
> index 3f1726a13f..c2feb393de 100644
> --- a/configs/zynqmp_zcu102_defconfig
> +++ b/configs/zynqmp_zcu102_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
> diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
> index b6d943333f..c26210b49c 100644
> --- a/configs/zynqmp_zcu104_defconfig
> +++ b/configs/zynqmp_zcu104_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
> diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
> index c10ec70ed8..737a8454bb 100644
> --- a/configs/zynqmp_zcu106_defconfig
> +++ b/configs/zynqmp_zcu106_defconfig
> @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
