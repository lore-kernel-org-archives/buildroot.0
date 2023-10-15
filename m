Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F3DCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 19:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94B6F402D0;
	Sun, 15 Oct 2023 19:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94B6F402D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K0Em6pTBy3ur; Sun, 15 Oct 2023 19:57:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C14A414BF;
	Sun, 15 Oct 2023 19:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C14A414BF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDA421BF489
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 19:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B619C611A4
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 19:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B619C611A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uQ5yS8hfEQ7R for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 19:57:18 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F048611A3
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 19:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F048611A3
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-99de884ad25so619026666b.3
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 12:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697399837; x=1698004637;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y6mDDUSNUmnnA03PnagauKtDQMi59/szofXriCp3ccU=;
 b=YTAwwwQxiJxLk3oPPUxVJa8HyW9zBJXmWpuAK5YHVcXllLRdCfCH1GLSUbTGDVpHXP
 ChkXPH4GBjM6b+7QTulIbEA76IFmRxxC1fsywEMJA6q3bWvXSfH4EeMPY8ZiBDie0KYa
 5CNgDxCA6O/wWM9DJoy8TBRBmn9CZepwi1AWHhI1vaIbthn9IQJhcE2VYK3lTJi/UbR0
 9FAYw04qUbrRKQaBEr4ro69WcH2KPQTipA3exvQgSUongPfiNehhmxwp3BbUwlP5pEPu
 MwvHWOo/SwG6Zd20jfcPdLvjoTDsgRrntfNBCRnuTIxlfq5hkeM0/IFlPuG7CF6+s2Vu
 v0Eg==
X-Gm-Message-State: AOJu0YyenjiV5EsKDOobqDpZbLswlP8y6+NFq9pDkPPuWBl00EaGwctn
 D9ojVtxVaCdgMXVlaZj4pjXvJw==
X-Google-Smtp-Source: AGHT+IE4B+A9y9q6sAQ6uyJsx0OikK3cLceErSilFE3SqMTT63jXeND0l6bXZMElRzy4fSHe0E24CQ==
X-Received: by 2002:a17:907:940f:b0:9bf:2ddf:1bca with SMTP id
 dk15-20020a170907940f00b009bf2ddf1bcamr3286372ejc.62.1697399836489; 
 Sun, 15 Oct 2023 12:57:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 mm12-20020a170906cc4c00b009b2ca104988sm2682506ejb.98.2023.10.15.12.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 12:57:15 -0700 (PDT)
Message-ID: <7d5a6ceb-8945-6635-c3b6-7897645b61f5@mind.be>
Date: Sun, 15 Oct 2023 21:57:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20231015123504.189034-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20231015123504.189034-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697399837; x=1698004637; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y6mDDUSNUmnnA03PnagauKtDQMi59/szofXriCp3ccU=;
 b=f/RXKVy6VQ8jeu1grwO1y/1fOfVI0mW0n16+LGHcOIzEM9zJfy45NBYToDXwQI4iny
 VvR7IzpKacpr3zhguxixndr4vRKwvAOJ+mZtgc+/OHKpqILr7cyOiVUVWwtbCgO/f59Q
 nXzJ83Ud72VnMsAqcq+tbOX8hS2PQ5d2JSPHRNZlkHMXfI07JoLl6Dc88jYWoWHtD+h5
 xb9Ud5KvgPC0NpS5hgIrY+id0rOQ9Spz8opSpctD2xGlw0Utrv1xkVhpBiCqHJKlSU0F
 +W0W4gJixfAAVcQsyW4NUwiAFrlgfT9ddwr59RRN/bSdtEWDpjjIW81Dft1Cxf5UW0xk
 6hyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f/RXKVy6
Subject: Re: [Buildroot] [PATCH 1/1] package/ksmbd-tools: security bump to
 version 3.4.9
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/10/2023 14:35, Fabrice Fontaine wrote:
> Fix two security issues that reported by ZDI.
> 
> https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.7
> https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.8
> https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ksmbd-tools/ksmbd-tools.hash | 2 +-
>   package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
> index b31c66bbe7..6f7064c6eb 100644
> --- a/package/ksmbd-tools/ksmbd-tools.hash
> +++ b/package/ksmbd-tools/ksmbd-tools.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  09ab343e9bf10ddfdd3216f400b19740a391645bf3645fa6f136b8da36306559  ksmbd-tools-3.4.6.tar.gz
> +sha256  418c7d87e8359355d150bdde6784612cd2ebd48ec87765852169e289d9de67e6  ksmbd-tools-3.4.9.tar.gz
>   sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
> diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
> index c4f9c503e6..c758c17bf2 100644
> --- a/package/ksmbd-tools/ksmbd-tools.mk
> +++ b/package/ksmbd-tools/ksmbd-tools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KSMBD_TOOLS_VERSION = 3.4.6
> +KSMBD_TOOLS_VERSION = 3.4.9
>   KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
>   KSMBD_TOOLS_LICENSE = GPL-2.0+
>   KSMBD_TOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
