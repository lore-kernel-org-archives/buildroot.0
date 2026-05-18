Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9808CD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74C81606D6;
	Mon, 18 May 2026 18:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h04cmMStW2yO; Mon, 18 May 2026 18:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A988606C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779129214;
	bh=qsEnEXnHB8XQS+PuuhwKiuEHlcKRCzgVjFCGv+S6sOE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q9swaVSKG1BomHv5h7IVYrgdAXjwfsw0aEsEXxG5PSSXNyLfLMJTYYHVz9ZrPeAVH
	 sIAzFJxikVOBS0fXQQHghwqyO4yyX+Vl8jpRjgvkTrcHEaKIFmlgbkTRe58QaQ0vQg
	 rFXcDD6FukDnX7H6vaArKCg7pBdMtPk1ibyaDAxeQn/Gz0ncEKGCLsUfNxRDvikepR
	 z1QIrS5IbK/ckWpVGxhunNvNHb6kAyQH5zZBccNHMLaWO3ZEnPto7K9Xu5cNfOmAyr
	 YsgTVGNH4ciZ0X6gdr4ElviWLosud5Z02IX0bkQjgsL+B9jpURTRmWW2kCWsphL3st
	 41OgDpi4tjKmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A988606C1;
	Mon, 18 May 2026 18:33:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CAA3282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 423EE8101A
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNPAHhQzrmPb for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:33:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26A4C8104D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26A4C8104D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26A4C8104D
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:33:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EDE93B97C0CC; Mon, 18 May 2026 20:33:29 +0200 (CEST)
Message-ID: <544dccc5-538c-4aa2-b1e3-284607958c82@rnout.be>
Date: Mon, 18 May 2026 20:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
References: <20260517085341.1338094-1-thomas.devoogdt@barco.com>
 <20260517085341.1338094-2-thomas.devoogdt@barco.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260517085341.1338094-2-thomas.devoogdt@barco.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779129210; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=n1nafA24wZUrd7FvF3M2XnynNUDFR+ETwkfmm7PZoGg=;
 b=i4QOm7gn1a5xCMeDzmWskmUuznZsDZzZAOM4ixgLSgURFV7YED3a4UfQXU6+EWsl5GTpS6
 gfnJqPxd1j6Lm/Jr6b1LfVzhQJzJBShUon9c0WAhrBevRpDzt7FP8UWqtIGhIgGTkZZ2zS
 qTPK9+M2TEqYlmn21Jm3m6Ai3bTILFLmyLDwKwf/LT1XIgXECUzLc2n7KYHTR3PtSHr3Yl
 5rgL0Zd3tUkZ3GIcvZfGbODAadk1Tv5Wn0nUHDc6Y4CvnMd5/sNkuT9C/pqK/MUzkaOGCe
 9sjXiRmsK5mDieGfxsbpg8SMtERbWxp6qHlHPhjE7hhbf6oCbRqFnYbXN9Bqog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=i4QOm7gn
Subject: Re: [Buildroot] [PATCH v1 2/2] package/mesa3d: add option to enable
 patent video codecs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/05/2026 10:53, Thomas Devoogdt wrote:
> By default, mesa uses -Dvideo-codecs=all_free which only includes
> royalty-free codecs (AV1, VP9, MPEG-1/2, JPEG).
> 
> Add a new BR2_PACKAGE_MESA3D_VIDEO_CODECS option to set
> -Dvideo-codecs=all, which additionally enables patent-encumbered
> codecs (H.264, H.265, VC-1) for both Gallium VA-API and Vulkan
> video decode/encode.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>   package/mesa3d/Config.in | 14 ++++++++++++++
>   package/mesa3d/mesa3d.mk |  6 ++++++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index bfd072d6d0..851faeae0a 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -474,6 +474,20 @@ comment "Gallium VA-API needs a gallium driver, incompatible with GLX w/o libglv
>   	depends on !BR2_PACKAGE_MESA3D_GALLIUM_DRIVER || \
>   		(BR2_PACKAGE_MESA3D_OPENGL_GLX && !BR2_PACKAGE_LIBGLVND)
>   
> +config BR2_PACKAGE_MESA3D_VIDEO_CODECS

  I've changed the symbol name to BR2_PACKAGE_MESA3D_PATENTED_VIDEO_CODECS 
(sorry that that creates more work for you...).

> +	bool "patent video codecs (H.264, H.265)"

  I think the proper term here is "patented".

  Applied to next with those changes, thanks.

  Regards,
  Arnout

> +	depends on BR2_PACKAGE_MESA3D_GALLIUM_VA || BR2_PACKAGE_MESA3D_VULKAN_DRIVER
> +	help
> +	  Enable patent-encumbered video codec support (H.264, H.265,
> +	  VC-1 decode/encode) for Gallium VA-API and/or Vulkan video.
> +
> +	  Without this, only royalty-free codecs are supported
> +	  (AV1, VP9, MPEG-1/2, JPEG).
> +
> +comment "patent video codecs need Gallium VA-API or a Vulkan driver"
> +	depends on !BR2_PACKAGE_MESA3D_GALLIUM_VA && \
> +		!BR2_PACKAGE_MESA3D_VULKAN_DRIVER
> +
>   config BR2_PACKAGE_PROVIDES_LIBGBM
>   	default "mesa3d" if BR2_PACKAGE_MESA3D_GBM
>   
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 98f1c6c2bb..8734176c45 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -189,6 +189,12 @@ else
>   MESA3D_CONF_OPTS += -Dgallium-va=disabled
>   endif
>   
> +ifeq ($(BR2_PACKAGE_MESA3D_VIDEO_CODECS),y)
> +MESA3D_CONF_OPTS += -Dvideo-codecs=all
> +else
> +MESA3D_CONF_OPTS += -Dvideo-codecs=all_free
> +endif
> +
>   # libGL is only provided for a full xorg stack, without libglvnd
>   ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
>   MESA3D_PROVIDES += $(if $(BR2_PACKAGE_LIBGLVND),,libgl)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
