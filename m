Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FECC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:05:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9673611C4
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9673611C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A71D83684;
	Wed, 22 Sep 2021 21:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8eOymmkdU-2P; Wed, 22 Sep 2021 21:05:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5F0882D7C;
	Wed, 22 Sep 2021 21:05:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3399B1BF2F7
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 232A741580
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1W6IUIs8zBPQ for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 21:05:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3155F40311
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 21:05:45 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id x7so978062edd.6
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 14:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=t38JCzLc5MoTiAJD7iZ/G/4W3vb0eoqRla4bU//mMpY=;
 b=AVvs3SBE+s8igsF9RRde8ZLXkcRhWyjPwaAAqFigGEjGjj7wXHiXMSVrz/qAW8dEKd
 D0Fnc76nRFH+CDV8xhGAkukBMphkibYnwej/55dPFnoUZfNVYZ3dtQgPkx+QjWaZFJoL
 8+ei3IrWHSitmVd5nyEwoKY4UBx66fJhB19c/O4a6DTr6+DvHRaaagyLSYe818OZA3fx
 qrNz6ovQ0bYHfCmXX8wCrd2bYek0HL0qTw1VRqA46TMJSBNze+oGHqmbJ32w6pMxIF2G
 B9OPdzgFHqjRKaOZMdJ7yA/AWT+qh4SFlll3eh3JSxh93aDSSsZHqrbpjZEjCMn14CvG
 KXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=t38JCzLc5MoTiAJD7iZ/G/4W3vb0eoqRla4bU//mMpY=;
 b=3exEiF7wyXMY5leNFYU42XDmo6ALQNHuIDviRB6gngvHccEhT/ugSCL9hFgNe6hy5X
 I0T7zuEM86tXe0wuBtqFbFwCMMdM1rZSHoxNHcMLQDqZ9BqXu4cAul3ubQhNjXpyRJAB
 iVf98wRH6zdmHWDtOOOKotTleJNoFp1TWatmhl2z4VUkrXdAPYbJvpUzAcZEayeXi4s7
 Kncvd2eP7sq3OCbufy5pZ0H95Ma2PVMdmJAf6/3Q5DUzBTk2DKn7m6dWS2tyUDOpEcjP
 jNTV45VWXrbGTZ3IXTd5Kge12X9nu5FqvsWLboAvhJM2hEbKNy76G1LQLK/FjHzNh4mD
 Ijvg==
X-Gm-Message-State: AOAM531Ox8dXQK7pHA0XpW3Ye0HMBGowKPusgJ5ZhBYRLdWCqmI4ZtQo
 27ns+bAo+VdbaGTeb3qp96rlB47VedhvqA==
X-Google-Smtp-Source: ABdhPJwCAZ+SkXKuZ0is1bIqCoRgM0VOOa8mgD7UZPlXs8UJWAfHh27rmWzQdplcGMVRecuKCbqdpQ==
X-Received: by 2002:a17:906:2ed1:: with SMTP id
 s17mr1396593eji.261.1632344743332; 
 Wed, 22 Sep 2021 14:05:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ca4sm1615527ejb.1.2021.09.22.14.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 14:05:43 -0700 (PDT)
Message-ID: <58d66751-8c5f-7682-9f8a-3d476fb5de7c@mind.be>
Date: Wed, 22 Sep 2021 23:05:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210914161511.44400-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210914161511.44400-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mpv: disable vaapi with DRI
 driver
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 14/09/2021 18:15, Fabrice Fontaine wrote:
> Build of vaapi with BR2_PACKAGE_MESA3D_DRI_DRIVER is broken since commit
> 17a7abbafee9bf4a971e00da7870ae439910e47e because vaapi can only be
> enabled with x11, wayland or egl-drm
> (https://github.com/mpv-player/mpv/blob/ec0006bfa1aaf608a7141929f2871c89ac7a15d6/wscript#L632):
> 
> 'deps': 'libdl && (x11 || wayland || egl-drm)',
> 
> As a result, despite what is being displayed in the autobuilder log
> message, the build failure is not related to X11 but to the fact that
> we try to enable vaapi through a DRI driver but without egl.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/5ae706e94eb6e5a3aa69368f81c5d12e608b1a5a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mpv/Config.in | 2 +-
>   package/mpv/mpv.mk    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mpv/Config.in b/package/mpv/Config.in
> index 51c9799de8..81b1e24b5f 100644
> --- a/package/mpv/Config.in
> +++ b/package/mpv/Config.in
> @@ -1,6 +1,6 @@
>   config BR2_PACKAGE_MPV_SUPPORTS_VAAPI
>   	bool
> -	default y if BR2_PACKAGE_LIBDRM && BR2_PACKAGE_MESA3D_GBM
> +	default y if BR2_PACKAGE_LIBDRM && BR2_PACKAGE_MESA3D_OPENGL_EGL
>   	default y if BR2_PACKAGE_WAYLAND
>   	default y if BR2_PACKAGE_XORG7
>   
> diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
> index a71a4b3114..ff77f248e5 100644
> --- a/package/mpv/mpv.mk
> +++ b/package/mpv/mpv.mk
> @@ -184,7 +184,7 @@ endif
>   ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MPV_SUPPORTS_VAAPI),yy)
>   MPV_CONF_OPTS += --enable-vaapi
>   MPV_DEPENDENCIES += libva
> -ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_GBM),yy)
> +ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
>   MPV_CONF_OPTS += --enable-vaapi-drm
>   else
>   MPV_CONF_OPTS += --disable-vaapi-drm
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
