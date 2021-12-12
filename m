Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD71BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 13:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DEC140553;
	Sun, 12 Dec 2021 13:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xKam1FzcVop3; Sun, 12 Dec 2021 13:46:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C95040289;
	Sun, 12 Dec 2021 13:46:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC3421BF36C
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 13:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B73C84F16
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 13:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jct-OeBQn53a for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 13:46:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD57084F10
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 13:46:27 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id x15so44963141edv.1
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 05:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=9ArdBl3+cDuvBOfWrLdBMZRJ7OylHEiJ+EKhdUCmTUE=;
 b=Up+NBH1GNP8jXY+1at44pyxkTslvakEdpxmL5TG2MpmKIE/2RatxS9OFzRD4v/LMrH
 XRRPxyeLbfl6lJjSTa/PL36Z462P8q1B06ySnE/h6vsP/fSGZGMNY+okx9SCuQ/oWK9I
 owYQ8UgsC/QK9VC9OOqqXQeCsXYcS2dga3RJz5O2BWulZ+5EUem6paOGbkbKpkoCWYgb
 nEepmx4LUemlH3NpVrO9Xz6nWKRszNJw72nDMv6or9+NoSsiDZHSPjZfxeUN19nN62O3
 dYm8GHxVdos2qV7ghY13xjsiJV1m1Fh/7+hcwOXN9AJxJ2taKr6wJzPtKNOTcKYfbsvZ
 Wfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9ArdBl3+cDuvBOfWrLdBMZRJ7OylHEiJ+EKhdUCmTUE=;
 b=zBtkfsjKb0IwemFtm8jvXIDuwXFA4SewzKB2mnvWIlI0E9xT6ex6eNyB1aDBbMBb2r
 cPjh1zB7FQG0R0doXX09lf7RgF1EU2T/9XY+6xtsEANDCcRtnCGhiGOIPxmhKIld/N3z
 HPIaUBeLH13JG4CFNLpd5nqSXopalhg0Z+QvGn0Q5LIA5Uukjs6jrP+l08V94e2/agnf
 cIgIFCjnNrIAhwYaVIAOlBfyJFs+7SsoJAG9fLVxdTlZsy0eCeq8kqDElK9Bw01oD0Iw
 2ZMCPSH4EA6BNfJ5JDv/dUJ44l+CNK75DM/q+2Mpwx4T0X/P7eA9plZUazIZGjthqoDc
 2tuQ==
X-Gm-Message-State: AOAM531J2xznuaLB06dP9IzVK1kz9HiTZuu0Gs3MbY+whjsHPMEyISCM
 nwFXPH10zxh92OaNkVsBnv8+Zw==
X-Google-Smtp-Source: ABdhPJzdg1rHE0ryL5dNth9UYQXJkgqf3QwuAw+fQnrFNHf4XgSL1JDiVfqezMaJ3k+ooEpPxtTA4w==
X-Received: by 2002:a05:6402:f:: with SMTP id
 d15mr54934133edu.331.1639316786123; 
 Sun, 12 Dec 2021 05:46:26 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id yd13sm4428885ejb.39.2021.12.12.05.46.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 05:46:25 -0800 (PST)
Message-ID: <b1cfcf29-3fda-46ed-e58e-f7b66c628943@mind.be>
Date: Sun, 12 Dec 2021 14:46:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
References: <20211208212901.2323564-1-festevam@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211208212901.2323564-1-festevam@gmail.com>
Subject: Re: [Buildroot] [PATCH] configs/mx6udoo: bump the kernel version
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/12/2021 22:29, Fabio Estevam wrote:
> Bump the kernel version to 5.10.84.

  I took the liberty of moving this into the subject line and keeping the body 
empty.

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>   configs/mx6udoo_defconfig | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
> index 60436e8616c1..5092ef0fd148 100644
> --- a/configs/mx6udoo_defconfig
> +++ b/configs/mx6udoo_defconfig
> @@ -4,8 +4,8 @@ BR2_ARM_ENABLE_NEON=y
>   BR2_ARM_ENABLE_VFP=y
>   BR2_ARM_FPU_VFPV3=y
>   BR2_GLOBAL_PATCH_DIR="board/udoo/mx6qdl/patches"
> -# Linux headers same as kernel, a 5.8 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
> +# Linux headers same as kernel, a 5.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/common/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
> @@ -20,7 +20,7 @@ BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="SPL"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.84"
>   BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-udoo imx6dl-udoo"
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
