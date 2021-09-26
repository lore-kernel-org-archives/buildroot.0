Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA887C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:51:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A028460EFF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A028460EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79C3481A5F;
	Sun, 26 Sep 2021 19:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XfJCMe_Pfog2; Sun, 26 Sep 2021 19:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2C718196E;
	Sun, 26 Sep 2021 19:51:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C20621BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2358606DA
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fgjFkwm-Ka5f for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:51:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA30260590
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:51:26 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id dm26so25853845edb.12
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=/WfSAi3XaGGanzkogKMBGRkLu3Sl/FDXm4TQTmuAK4k=;
 b=Z8z9Hq2G61O2ZLsj6GNuKndC6DNKasJuCF28DMZZ+be1HGydzBlFlyCYtmxkoM+A+B
 gh4lYnYV8l5/3QLiU2N+bH22GaO+0v9JAaEtakYhkrq0vFDplLSOtItBPk8zwIrKx4Of
 5diW24RCu3OODSo81G4mdqkw3MoMe2FbsNzXRXMML4fmLtePdVvlxWeLhd/uStOqAPc0
 8YR5+vlOmpM64LOAqJJ8mfKbM768yXbsVX0wnL3U5jr56teHzABB7Y40h6fA0133vpOV
 DBhQHr50Zue22aC3WvdHnkGQM0VXAxbL+4aHUOrJLu/UvuMROyCoEe3xHAkaVZOzstCf
 YeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/WfSAi3XaGGanzkogKMBGRkLu3Sl/FDXm4TQTmuAK4k=;
 b=rhBp2p4esjr8NQKMJPEobaAiA3W6COBA9HpgrAwyeLroU0GHUqooSYFqxdbjKMJ03S
 CiEfSq6IYl0mUJuig+4y+YKJW8E1wX5/UVxv/Cv7fcklfToOKnEF3ug81+eTMiJwsivy
 MZUgQNRFnqVj/0zcC0UoVeU1p+2jRSmcgAhmFCx1RT8u9yHzn1sTXIHs//3mkrk4P3Lr
 NEjoycSYs3eWbxmwLLw+ZRnYkNPWCJePTYinX/idrEOItyfv2J8vjq/9PdgdbXUAZ8GL
 +wnqAvyJ6ruNNWY40gjDTBm1GQGLikWnGGV5YOrb1I5Fv0SH5y7gALqIhhsvF7PfgfTv
 VgDQ==
X-Gm-Message-State: AOAM5327+sd1p2oZvb7sjcTZ3ANfMZmmQfrqfmNi/93TcEO0UVzuqrDh
 BugjKkA18rtqvcGKyi+vV04FPzkKjIVsRA==
X-Google-Smtp-Source: ABdhPJyikH5G8ExGwLQRmp9r3aK9eGkFrzANgG28LfYOHN6SBpMSH4Q7zwpfDB3UDeASpYw8tc3EdQ==
X-Received: by 2002:aa7:c78f:: with SMTP id n15mr19632781eds.338.1632685884984; 
 Sun, 26 Sep 2021 12:51:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y23sm527289edu.93.2021.09.26.12.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:51:24 -0700 (PDT)
Message-ID: <545ec38d-4498-c825-50f9-5913da583842@mind.be>
Date: Sun, 26 Sep 2021 21:51:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20210926115717.1687968-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210926115717.1687968-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 01/42] package/kodi-audiodecoder-snesapu:
 bump version to 19.0.0-Matrix
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



On 26/09/2021 13:56, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  All 42 applied to master, thanks (v2 of the shadertoy bump).

  Regards,
  Arnout

> ---
>   .../kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash    | 2 +-
>   package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
> index b82c5b36a1..714f2f8719 100644
> --- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
> +++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  3537b735acfbbacaada2aa1d2035acbc698f37cc7626375f408e967ca612b2d0  kodi-audiodecoder-snesapu-3.0.0-Matrix.tar.gz
> +sha256  8b4c75ccfbcf829922e9dbf10d9ec75c4312ac6ad1837d3cf39833395fb036be  kodi-audiodecoder-snesapu-19.0.0-Matrix.tar.gz
>   sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
> index 7cd2fe588c..ac77f76f14 100644
> --- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
> +++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KODI_AUDIODECODER_SNESAPU_VERSION = 3.0.0-Matrix
> +KODI_AUDIODECODER_SNESAPU_VERSION = 19.0.0-Matrix
>   KODI_AUDIODECODER_SNESAPU_SITE = $(call github,xbmc,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
>   KODI_AUDIODECODER_SNESAPU_LICENSE = GPL-2.0+
>   KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = LICENSE.md
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
