Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00CCC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A4D418EE;
	Thu, 14 Apr 2022 19:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xop4KiN1P6Li; Thu, 14 Apr 2022 19:59:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1EE5418EA;
	Thu, 14 Apr 2022 19:59:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B36EE1BF239
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEF0940A65
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dVn24KhVsNDo for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:59:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B35F840142
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:59:50 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z12so7721341edl.2
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I4CSErjLpZjzX+woygaOxHhb5Px5F6+YO8ZicQiwu+o=;
 b=KFecjBZLxS/+jiiIJz+GsnGOQxgHweuNWqt83BS0iiFXZ/BgpKbo709s7+nIyGVdKT
 ny7ljv1EOpuZTDggIuQSdwogcCHbs6Pf/tKI8S+4O2GDHcbDlfra4K6ma40sSIT5rhfu
 xycIzrB5RK5m2Q3Rf6Ccl3/+HE13qSJ/ISv3YuT5ZZ5D/SFZyK+PJUYfA1af+yVIxron
 RuWW3Ev++OrlKeD4WQJ4vSgaRTfOrUsjub7WNG6RFfQ3YoVye5LC+uNZo8VmU4eaAy5I
 SNrx6STHKMmIAiguCuAGToyx/p1GiB815mmCS2wDjueGVTubo563ZRRbh1jvUVjhldTM
 6BiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I4CSErjLpZjzX+woygaOxHhb5Px5F6+YO8ZicQiwu+o=;
 b=yOrfHJyJx3zL3CaLSD3nIcD3Em5kGXlMx4xolBQ0sYkV7P0u5SH6DGp9r3eNXUXKdy
 V0NV+oGSb4V7R/5WjNpY7+kIv798qsdwpElRq7f732a4H9ILqo13RaEUZiWsGRat9eo2
 gZstN92SRyG8V8cRuC9nJdWqwEZnHrQBGkq+T1xpPxbeuM60lTi7RTFHuYXhEDlLRAdz
 G7GsfOV1Iuw9N9KeX0diE4x9pMSmXmDsFq+GA2ZNOG49AerWwrKcizj0oD1eESgsvJW4
 vIph9xvNDKbI1xUqU9XIDH1W9+HKBsNP1sqJmqGr/pNs2NXRAXBcRY52LRdpFzjiJuMU
 KRPw==
X-Gm-Message-State: AOAM532lzXhvFWOUSkvKGGQeGvfdb42xfvzAO0Ab7jTdvNXQfKa1ONQg
 2OT57cMP+ptgeOxeikvJUxwtjQ==
X-Google-Smtp-Source: ABdhPJzNHL6s2F+x6Dwf2gxsUxvh9fIqekw6CaS9MbtPmIKjxN792No0qDH/P9FLjmkqsiVVUNqv9A==
X-Received: by 2002:a05:6402:354b:b0:419:4af8:c5c9 with SMTP id
 f11-20020a056402354b00b004194af8c5c9mr4854868edd.91.1649966388961; 
 Thu, 14 Apr 2022 12:59:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a50d75a000000b0041e84bb406fsm1535680edj.0.2022.04.14.12.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:59:48 -0700 (PDT)
Message-ID: <0013bb7d-ca34-dd99-7119-8dad8c74a819@mind.be>
Date: Thu, 14 Apr 2022 21:59:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20220408145531.1641356-1-neal.frager@amd.com>
 <20220408145531.1641356-2-neal.frager@amd.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220408145531.1641356-2-neal.frager@amd.com>
Subject: Re: [Buildroot] [PATCH v1 2/4] configs/zynq_zed_defconfig: bump to
 Xilinx 2021.2
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com, ju.o@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/04/2022 16:55, Neal Frager via buildroot wrote:
> This patch bumps configs/zynq_zed_defconfig to Xilinx software release 2021.2
> which includes the following updates:
>    - U-Boot bumped to 2021.01
>    - Linux bumped to 5.10
>    - rootfs changed from CPIO to EXT4
>    - extlinux.conf for distro boot support
> 
> This patch has been build tested only.
> This patch is dependent on the configs/zynq_zc706_defconfig patch.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>   board/zynq/zed/uboot.fragment |  1 +
>   configs/zynq_zed_defconfig    | 22 ++++++++++++----------
>   2 files changed, 13 insertions(+), 10 deletions(-)
>   create mode 100644 board/zynq/zed/uboot.fragment
> 
> diff --git a/board/zynq/zed/uboot.fragment b/board/zynq/zed/uboot.fragment
> new file mode 100644
> index 0000000000..d58fcd5439
> --- /dev/null
> +++ b/board/zynq/zed/uboot.fragment
> @@ -0,0 +1 @@
> +CONFIG_DEFAULT_DEVICE_TREE="zynq-zed"
> diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
> index a215695b54..c4d95f20b7 100644
> --- a/configs/zynq_zed_defconfig
> +++ b/configs/zynq_zed_defconfig
> @@ -2,26 +2,28 @@ BR2_arm=y
>   BR2_cortex_a9=y
>   BR2_ARM_ENABLE_NEON=y
>   BR2_ARM_ENABLE_VFP=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
> -BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>   BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16"
> -BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"

  We generally prefer to use the upstream kernel rather than a vendor kernel - 
if it works of course. Is the vendor kernel dramatically better than upstream?


> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"

  There's also a xilinx-v2021.2 tag, which sounds more like what we'd want to use.

  Regards,
  Arnout

> +BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>   BR2_LINUX_KERNEL_UIMAGE=y
>   BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zed"
> -BR2_TARGET_ROOTFS_CPIO=y
> -BR2_TARGET_ROOTFS_CPIO_GZIP=y
> -BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_GIT=y
>   BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2018.2"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zed"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2021.01_2021.2"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zed/uboot.fragment"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_FORMAT_IMG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
