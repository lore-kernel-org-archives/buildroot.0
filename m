Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14E2C27C55
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 13:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E49A4069F;
	Thu,  6 Jun 2024 13:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHfE0qC_AFH2; Thu,  6 Jun 2024 13:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DFB5408A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DFB5408A7;
	Thu,  6 Jun 2024 13:37:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 283D11BF32B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 13:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14625841E0
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 13:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDjX9UDGkxVi for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 13:37:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EEECA841DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEECA841DE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEECA841DE
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 13:37:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 567F813F8A7;
 Thu,  6 Jun 2024 15:36:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 15:36:56 +0200
Date: Thu, 6 Jun 2024 15:36:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Neal Frager <neal.frager@amd.com>
Message-ID: <ZmG7eEwBqTg8PplX@landeda>
References: <20240606120756.953582-1-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606120756.953582-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717681023;
 bh=rR0PXym4HyxDKGol7PMA7pFBWthIWKdFbhX6yqePj3s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FaD4WO/MaTaEtV3+shTqBrxLKzNaiMuAsDciOtn6vn6kQKp9XWpTiTIvjIvw4zv1F
 QVWTQW3FVToFbermS9JoNsyMDFEuj7hnfuIoSdaISEAkKrd19h9zctISjH4E9icewk
 zhoPMw1dhGFHke4qZZMqA1DYjGvJCCPp1UG7Dt2zhgpL5NkxwU5sGedfMY33AIUWRj
 xFk/Zce7qxjjO3lsVNDpGxN1xobM1libLFY6KuO5CsXDVushNbw7IGfdPK5Ec0Pz2u
 7eEio/jJCd/5C4F3/6C9J99L4OIFZEqTiIzVB8doqGVu2NK7o25tVc3yoGgMor9WKq
 9J8BPToJhtU7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FaD4WO/M
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig: add
 hashes
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal, All,

On 2024-06-06 13:07 +0100, Neal Frager via buildroot spake thusly:
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

As that uses the new patch dir for Xilinx-based boards, I've applied to
next, thanks.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                                             | 1 -
>  .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 ++
>  board/xilinx/patches/versal-firmware/versal-firmware.hash       | 2 ++
>  configs/versal_vck190_defconfig                                 | 2 ++
>  4 files changed, 6 insertions(+), 1 deletion(-)
>  create mode 100644 board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
>  create mode 100644 board/xilinx/patches/versal-firmware/versal-firmware.hash
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index c3de61111f..eea412d01d 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -358,7 +358,6 @@ configs/ts4900_defconfig lib_defconfig.ForceCheckHash
>  configs/ts5500_defconfig lib_defconfig.ForceCheckHash
>  configs/ts7680_defconfig lib_defconfig.ForceCheckHash
>  configs/uevm5432_defconfig lib_defconfig.ForceCheckHash
> -configs/versal_vck190_defconfig lib_defconfig.ForceCheckHash
>  configs/visionfive_defconfig lib_defconfig.ForceCheckHash
>  configs/wandboard_defconfig lib_defconfig.ForceCheckHash
>  configs/warp7_defconfig lib_defconfig.ForceCheckHash
> diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> new file mode 100644
> index 0000000000..e300398541
> --- /dev/null
> +++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  c3369c89eab4e452bbc76c630e5dccb6c0ae588c0175b6c8549aa0241deb06ef  xlnx_rebase_v2.10_2024.1.tar.gz
> diff --git a/board/xilinx/patches/versal-firmware/versal-firmware.hash b/board/xilinx/patches/versal-firmware/versal-firmware.hash
> new file mode 100644
> index 0000000000..c4d745f22c
> --- /dev/null
> +++ b/board/xilinx/patches/versal-firmware/versal-firmware.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  versal-firmware-xilinx_v2024.1.tar.gz
> diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
> index ecfc10cc91..69272e721c 100644
> --- a/configs/versal_vck190_defconfig
> +++ b/configs/versal_vck190_defconfig
> @@ -39,3 +39,5 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
>  BR2_PACKAGE_HOST_BOOTGEN=y
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
