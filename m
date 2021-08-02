Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF1BC4320A
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 12:40:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8014C60FC4
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 12:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8014C60FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52CEE835E0;
	Mon,  2 Aug 2021 12:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WuEWyDkIfmSG; Mon,  2 Aug 2021 12:40:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94724835A6;
	Mon,  2 Aug 2021 12:40:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC0B91BF402
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 12:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E920160809
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 12:40:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTZiVU0QHVtS for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 12:40:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3BC160804
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 12:40:08 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id yk17so22977254ejb.11
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 05:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yDY33CvQ3YnzdN7EJWBLlN5MIRoCkWpabGQdHBB51VM=;
 b=QanSxuk3k+s9ProRT4n8rZJPRk1UCMtomLI1D3poieE8MOgchb0zp1DASjv73myhQu
 TNWa3HhrCfRXlVKizwITx9Qi7+bvjw6WD1ydoqpIRpg71c0DCLhF8g6D0BeHwQ9mnGwz
 PFfJ18FoJER5xBmwVEtoV02q7gD+fBo7tLpzAmUk28fyNBLLRCkrDa9gQMkHYOVTngzv
 3kfPoA4TyvvAa7pSb6tNCwgPpPux9H0tBZ2Ns77jQcjyhsfd+gBEinQVooM4AbJTBYoB
 pFIIZ+SmwUBSSA2ilgpQeThc8UGW4xY7SOR99Vzb3Mu3J4ZEHZfRA+u+TR6Z5GLRBJwf
 QZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yDY33CvQ3YnzdN7EJWBLlN5MIRoCkWpabGQdHBB51VM=;
 b=QH9epa/pZ3G7px2yyIzKIhHyfX2q0yY8T7C92kEFkystB9ftEf5ke+9+jTPuhtxcQg
 m1e2WAoUYHj7O2v45rUBsM603vPTA0a5evnELmVHj/Y0pXr5gYrPlwvvliL7BF2YS36o
 q//rXbZlonAvAxkMi9MY5OMJ1rLSO4EE/nP2UAEnAHcjfosMtx1muCFsISC0ZxbdHV7c
 Bj76bzIV1K1IheqqR/kmT83A9AiOeKItCRTcMWMwatrIEC1KXaXmSHDEGKN+WJo0W5Mw
 45z6TPn84qxB65cgYNCq5uwgfBACEp8Y1qTT1Nt2zt/Mtg4okQWzhTHCGvjtlNv3iOyJ
 19Lw==
X-Gm-Message-State: AOAM533hAK1APvraqPz1GBrJRrjrNnOexyxv9OxKO6U8J72XdEd3vmGd
 G0onrdCXIsJb7LIcKI1yYGz90ycmA++ydZ20FKo=
X-Google-Smtp-Source: ABdhPJwlWk69cfrW8nrmU9u/3bkTiG7BVaq1ebmctxJFiGHUFl66MenZdvm94kJqcwTb8QSfpr4Jbw==
X-Received: by 2002:a17:906:1919:: with SMTP id
 a25mr15106726eje.161.1627908007276; 
 Mon, 02 Aug 2021 05:40:07 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id oz31sm4470170ejb.54.2021.08.02.05.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 05:40:06 -0700 (PDT)
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20210720172911.15840-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <497b8e46-c8ff-212a-d1cc-a790b5bed026@mind.be>
Date: Mon, 2 Aug 2021 14:40:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720172911.15840-1-bernd.kuhls@t-online.de>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: DRI drivers need either
 glx, egl or gbm
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 20/07/2021 19:29, Bernd Kuhls wrote:
> Fixes build error:
> ../output-1/build/mesa3d-21.1.5/meson.build:520:4:
>  ERROR: Problem encountered: building dri drivers require at least one windowing system
> 
> OSMesa is not seen as a valid windowing system for DRI drivers anymore:
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=21.1&id=ee802372180a2b4460cc7abb53438e45c6b6f1e4
> 
> Fixes:
> http://autobuild.buildroot.net/results/46e3a66ddc13a064e512aad0f3afd8655889ab9d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/mesa3d/Config.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index d1b3af2054..41c90c49af 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -63,8 +63,7 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER
>  	select BR2_PACKAGE_MESA3D_DRIVER
>  	select BR2_PACKAGE_MESA3D_GBM if \
>  		!BR2_PACKAGE_MESA3D_OPENGL_GLX && \
> -		!BR2_PACKAGE_MESA3D_OPENGL_EGL && \
> -		!BR2_PACKAGE_MESA3D_OSMESA_GALLIUM
> +		!BR2_PACKAGE_MESA3D_OPENGL_EGL
>  	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
>  		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
>  
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
