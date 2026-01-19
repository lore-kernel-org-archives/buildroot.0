Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FF4CCF2D5
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCD298077B;
	Mon, 19 Jan 2026 10:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJgxBRVvUqJP; Mon, 19 Jan 2026 10:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E56C807C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817374;
	bh=JcGPuc5wO+VlvshBhMgtybAAQRkCc1Pw5d13Ej37Fas=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Mfygd4nfUB6i0O9Hr0pmOxShzqZlmp1GzNf2Yzje7n2ibLFB8tsCKuzyscIGTpZ1N
	 lydkCOmyNPC49M54IVdjciQlhFxjT7OhVQpK/4KxJPZz14v9A257d24GSU+bG7aIkM
	 zboaywMNusJLSjNetvsEtwZS8y6XAY7Gy5fxfAHsQlllwvCVrgqzqzMccvl5KrjUhr
	 Xv4WGyRqGT6DJZNQfUVP3YHwmjOlAh2Y916tkxxZ5LaB5Kd6kqEbBVMPXDIMKRVTM0
	 8T8DCxLggPLsu54r0kh5S6wOG53ZHCcEDqKayanxftoJqGadCFfDj7s42IU4dBxSU7
	 4T/Hh0UIS5B5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E56C807C8;
	Mon, 19 Jan 2026 10:09:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B812160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8599B40D30
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eoJcf54wmTcD for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5159F4025B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5159F4025B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5159F4025B
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4EAFDB97A961; Mon, 19 Jan 2026 11:09:26 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:25 +0100
Message-ID: <20260119100925.13002-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108224855.2762464-1-bernd@kuhls.net>
References: <20260108224855.2762464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817366; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=coWNTgpa0OF2emwE1zwpsn0hQmiwSMNiMEUToRnb4u8=;
 b=csZHTUeDWHDyq95MbV64VNTIK2EmE1E+y4upuFak85CZlOg/y5Xfmiki4wln13n1eg9EpR
 S/+d68JXisPWoOkdusgo+o/7zKpPZKEAFZ32Vu/pVPrFfkQZOTZBeonvhIvhSyYumVvBHq
 zP9cVmgjZ4Iw3zJUioT7BN1cpxizplWSFHvQPyzldkXCqePUwm8c5h3VSza5C2AhxD6uS1
 yrLT+v9XRfkhOoLZhg6AUSqlCn8XFwuEAOOT8jyiOFpot0xIruKHlrXc72K++raVeVUeEo
 vGK+pwNij2+OqVnOkR+xAEhzgot654RaY3Xy7ntlhs4YK38kQze3Zg9E6K68fA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=csZHTUeD
Subject: Re: [Buildroot] [PATCH v2 1/1] linux: bump CIP kernel to version
 5.10.246-cip66
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Added Upstream: tag to patch.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
> v2: Added Upstream: tag to patch (Julien)
> 
>  .checkpackageignore                                       | 1 -
>  .../0001-arch-microblaze-mm-init.c-fix-build.patch        | 4 ++--
>  linux/Config.in                                           | 8 ++++----
>  linux/linux.hash                                          | 4 ++--
>  4 files changed, 8 insertions(+), 9 deletions(-)
>  rename linux/{5.10.162-cip24-rt10 => 5.10.246-cip66-rt29}/0001-arch-microblaze-mm-init.c-fix-build.patch (93%)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 99a864fd3f..2a09961f74 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -176,7 +176,6 @@ configs/uevm5432_defconfig lib_defconfig.ForceCheckHash
>  configs/visionfive_defconfig lib_defconfig.ForceCheckHash
>  configs/wandboard_defconfig lib_defconfig.ForceCheckHash
>  configs/warp7_defconfig lib_defconfig.ForceCheckHash
> -linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch lib_patch.Upstream
>  package/18xx-ti-utils/0001-plt.h-fix-build-with-gcc-10.patch lib_patch.Upstream
>  package/4th/0001-avoid-regen-during-install.patch lib_patch.Upstream
>  package/acl/0001-Build-with-old-GCC-versions.patch lib_patch.Upstream
> diff --git a/linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch b/linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
> similarity index 93%
> rename from linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch
> rename to linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
> index 4760d9e4fb..d1124f4cda 100644
> --- a/linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch
> +++ b/linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
> @@ -13,9 +13,9 @@ arch/microblaze/mm/init.c:71:2: error: #endif without #if
>  Fixes:
>   - http://autobuild.buildroot.org/results/27291870cf7539d26e45c45f34322d24a6dbca33
>  
> +Upstream: sent to Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: sent to
> -Sebastian Andrzej Siewior <bigeasy@linutronix.de>]
>  ---
>   arch/microblaze/mm/init.c | 1 +
>   1 file changed, 1 insertion(+)
> diff --git a/linux/Config.in b/linux/Config.in
> index 42214ccbda..14d644ecbc 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -35,7 +35,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
>  	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>  
>  config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> -	bool "Latest CIP SLTS version (5.10.162-cip24)"
> +	bool "Latest CIP SLTS version (5.10.246-cip66)"
>  	# Support was introduced in Linux 5.19
>  	depends on !BR2_loongarch64
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
> @@ -57,7 +57,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	  https://www.cip-project.org
>  
>  config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> -	bool "Latest CIP RT SLTS version (5.10.162-cip24-rt10)"
> +	bool "Latest CIP RT SLTS version (5.10.246-cip66-rt29)"
>  	# Support was introduced in Linux 5.19
>  	depends on !BR2_loongarch64
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
> @@ -142,8 +142,8 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>  config BR2_LINUX_KERNEL_VERSION
>  	string
>  	default "6.18.3" if BR2_LINUX_KERNEL_LATEST_VERSION
> -	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> -	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> +	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> +	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
>  		if BR2_LINUX_KERNEL_CUSTOM_VERSION
>  	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 45437f8796..11db3e59b6 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -7,8 +7,8 @@ sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-
>  sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
>  sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
>  # Locally computed
> -sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
> -sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
> +sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
> +sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
>  
>  # Licenses hashes
>  sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
