Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705A9C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 21:29:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC20613CD
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 21:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBC20613CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 816F4400CD;
	Mon, 23 Aug 2021 21:29:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HO_ZM_e3SmWB; Mon, 23 Aug 2021 21:29:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1E6F400F1;
	Mon, 23 Aug 2021 21:29:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A79DC1BF32D
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 21:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9735A80B33
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 21:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XHiARZjtfBmU for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 21:29:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E0A280CCD
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 21:29:16 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id u3so39906953ejz.1
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 14:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7AxY8PWt2wg9mkQ+sNrZqd7QIFkRiUgeDhD/kV9l+8k=;
 b=cdK7+9ATGX1H77+HeGFoOYTbBEUMJIvrK/cB5hXWr9lCdMpWd78Fnd71nkWD4pBIxP
 Suw19IAbLrong83Z1Ff86v0A6gBntIFBToSyq1WFKujDgXTGUJnPhKwS10g88IiQn1m7
 4sP3a3bof+yhp8zCSgtQ/30Ml8juesxCdzLALLChiYuOUbwUKT3ZeIaNmej6bLCl/sMB
 2r7rLYHkyDu/eMgn6QM/GSs3mq1KE4Wo4x6wjgF7C/wWsC0GA+9b4yjUTUXQ0R56S97X
 ejcBKwbfJlGIiKdckC0r+ziT9lVBriX2ou51M96HXZhXsKMk/PFmLyNarfOkP4L+43CU
 HK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7AxY8PWt2wg9mkQ+sNrZqd7QIFkRiUgeDhD/kV9l+8k=;
 b=aUDwGvGYGugIvrK8HE51JG1Y/UbrCvXD0Xe4ixFiQfbJKCKSl4UdXNbT9/y16yD+3T
 599Acc0FsZ50x00YxoguRQZRqGiOPv/nN8/i3m+sn1pO+8POiHQbnDX/PCCPOv85Qt8N
 PnsU3CmZoZFoNA+tA2aZ1EqPJz/gSInE8AW3RGJXoxIPBiJLjyP87iihsLb7aTjfitW1
 OJWxaQWims5M2NK34Ad88vNUOFrDT/vrUBEG0luaZXL19eZU2YtBiUF7kW7GGz85RLpM
 1Rz48iUsJeyRQHX4hadC79twWvddtrAtsSt6YCywxVCmbM38YZ1nQrYxYhaM3QBAc2cv
 ltbg==
X-Gm-Message-State: AOAM531a9UOzFz0X1fapZKDYs7z1P0Luh//3xiAKHP9i6gtH598bOHlY
 FmfqMicAq4j9LpxWuMH+xG0RjQW46My3eQ==
X-Google-Smtp-Source: ABdhPJzbl6r3fmw/ZXQ0SQCE9XM/126WYpDTJepA2aTN269OLPwmoXCUC6cmg5JCc6vUxUV4ce/rlg==
X-Received: by 2002:a17:906:704e:: with SMTP id
 r14mr37823676ejj.293.1629754154635; 
 Mon, 23 Aug 2021 14:29:14 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x9sm7956654edj.95.2021.08.23.14.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 14:29:14 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210821093908.677218-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a83167e6-31b9-e6a2-7015-f08b5254a5dc@mind.be>
Date: Mon, 23 Aug 2021 23:29:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210821093908.677218-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/2] package/sdl2: kmsdrm needs GBM
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
Cc: Michael Fischer <mf@go-sys.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 21/08/2021 11:39, Fabrice Fontaine wrote:
> kmsdrm needs GBM (and so mesa3d) since its addition in version 2.0.6:
> https://github.com/libsdl-org/SDL/commit/56363ebf6124b345e1cfbd14fb6c0e654837910c
> 
> If libgbm is not found, kmsdrm will be silently disabled
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

> ---
>  package/sdl2/Config.in | 5 +++++
>  package/sdl2/sdl2.mk   | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
> index f29b3c7c38..07de75a4d5 100644
> --- a/package/sdl2/Config.in
> +++ b/package/sdl2/Config.in
> @@ -32,10 +32,15 @@ comment "X11 video driver needs X.org"
>  config BR2_PACKAGE_SDL2_KMSDRM
>  	bool "KMS/DRM video driver"
>  	depends on BR2_PACKAGE_LIBDRM
> +	# requires libgbm from mesa3d
> +	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL

 Why this and not BR2_PACKAGE_MESA3D_GBM? I've applied as is but this is
something that maybe should be fixed.

>  
>  comment "KMS/DRM video driver needs libdrm"
>  	depends on !BR2_PACKAGE_LIBDRM
>  
> +comment "KMS/DRM video driver needs an OpenGL EGL backend provided by mesa3d"
> +	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL

 ... though this comment would of course be a lot more complicated because GBM
may also be provided by a DRI driver.

 Regards,
 Arnout

> +
>  config BR2_PACKAGE_SDL2_OPENGL
>  	bool "OpenGL (GLX)"
>  	depends on BR2_PACKAGE_HAS_LIBGL
> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
> index 5aad92eda8..ff6b29f29c 100644
> --- a/package/sdl2/sdl2.mk
> +++ b/package/sdl2/sdl2.mk
> @@ -152,7 +152,7 @@ SDL2_CONF_OPTS += --disable-alsa
>  endif
>  
>  ifeq ($(BR2_PACKAGE_SDL2_KMSDRM),y)
> -SDL2_DEPENDENCIES += libdrm
> +SDL2_DEPENDENCIES += libdrm mesa3d
>  SDL2_CONF_OPTS += --enable-video-kmsdrm
>  else
>  SDL2_CONF_OPTS += --disable-video-kmsdrm
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
