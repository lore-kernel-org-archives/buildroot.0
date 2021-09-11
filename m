Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3259C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:26:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DC9B61153
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DC9B61153
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D5674079B;
	Sat, 11 Sep 2021 13:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TPdcMaXsP-cD; Sat, 11 Sep 2021 13:26:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9598840754;
	Sat, 11 Sep 2021 13:26:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B1C51BF2B0
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A188607CF
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KGgSfSqOIzFE for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 13:25:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 786D7607CB
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:25:59 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id t19so10176370ejr.8
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 06:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+4QqgzCL0CngOMo32jGjQKM7dLs87n5zgVZFq2k3z7Y=;
 b=PUzqNnOC5HMqp3HWyVlTrih8osFrzGz3WmVSC9tljBm/FlDY5KFQU/ljkgqkzXZHgC
 El8Gphti0wbF5uIfLi6IvxM6O+nnNTwXe30xjFeS29kzUR+LlSQ7HncYW504XUeWchzX
 Yo/us8x92Z++P5VrihsfD6bvPZHzvue54JZFnAs+Zi/dQtpcGL2gg6xL409ac3DpKZj6
 zyKBi3pRU1e4ybTCKUYw26+U0J9Qrx2w5xLZ1lmPAWPiVpyx+MqLxAbzDmrY/UL7uBS3
 6OmibMR4vXPDe4Qcz+QlGAlgTyEzAXgAIxTkdoO+tXQJ2OLdkaRS7FocAkEMQ9qa5sEz
 3wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+4QqgzCL0CngOMo32jGjQKM7dLs87n5zgVZFq2k3z7Y=;
 b=AN1vbSBvf6UyGIGv6JyWZEXHTmIxjU8/0Bx50hRvSL6BMK2yN4J+eGoClEdchni0N/
 ljm6tUbhFunqT8ZnUlV8xTs22YtTgDFJ9/KhFpMzUsuD+6zasP2EOgythrr3RNnyrqmM
 NLldvBl6NgomyV5RnmfNuwtja/PAilawL3MIbpIeW2jrogXU44xnTqpu6t3j1ufyAmEP
 4fsTaZluPJdBgqftL2iaDIZcj9xfqMlnRKh/ly8OubeD6Fd187DFvo6HA/Q8I2HqUSP+
 0RRuepxXbEb1YMkIVFW2bOGlmxFjT6rKkhAd6P0Ad5rT/40+/DukkXr0t8ssxbLNN/XK
 yikA==
X-Gm-Message-State: AOAM5336ciBmVUGPQICQ/yoYNHqj3dCpgpxZ7tt6mmd2B2n/fkHqo89c
 IDsaQiM7bi1pGWTJKulDJJZOlUopMxcsuA==
X-Google-Smtp-Source: ABdhPJx29Mq3cSIZgTeIwHEvTZGCwwylvAar0C3TA2fHtSoy+z8VxwYNP/r7XkA64muWiX7ENo9vRQ==
X-Received: by 2002:a17:906:3159:: with SMTP id
 e25mr2798815eje.549.1631366757719; 
 Sat, 11 Sep 2021 06:25:57 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t20sm773148ejc.105.2021.09.11.06.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 06:25:57 -0700 (PDT)
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20210828084001.673394-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <cb2b460c-aa29-1b02-83f9-a8b21d8a72df@mind.be>
Date: Sat, 11 Sep 2021 15:25:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210828084001.673394-1-bernd.kuhls@t-online.de>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH/next 1/3]
 package/kodi-audiodecoder-nosefart: bump version to 19.0.0-Matrix
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 28/08/2021 10:39, Bernd Kuhls wrote:
> Release notes:
> https://github.com/xbmc/audiodecoder.nosefart/releases/tag/19.0.0-Matrix
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 All three applied to master, thanks.

 Regards,
 Arnout

> ---
>  .../kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash  | 2 +-
>  .../kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
> index 9f929d9f82..61507e8229 100644
> --- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
> +++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  a4be5f6efc46841c9b1689c91b06f69cd695220b583e62ed2948768fa93d09a2  kodi-audiodecoder-nosefart-3.0.0-Matrix.tar.gz
> +sha256  4975c65b5acd002cf772707170e54bcbcc48d7898dd2e6b4239bab56636b44e7  kodi-audiodecoder-nosefart-19.0.0-Matrix.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
> index 377f6b7ef1..91be43c580 100644
> --- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
> +++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_AUDIODECODER_NOSEFART_VERSION = 3.0.0-Matrix
> +KODI_AUDIODECODER_NOSEFART_VERSION = 19.0.0-Matrix
>  KODI_AUDIODECODER_NOSEFART_SITE = $(call github,xbmc,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
>  KODI_AUDIODECODER_NOSEFART_LICENSE = GPL-2.0+
>  KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = LICENSE.md
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
