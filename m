Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C05C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:03:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA0C2611BF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA0C2611BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A9DE40167;
	Sat, 11 Sep 2021 13:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8DHbkYN1iW9; Sat, 11 Sep 2021 13:03:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4F5540148;
	Sat, 11 Sep 2021 13:03:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A130B1BF31A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DF9B607BD
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ko7xw4zSRp2C for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 13:03:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75FB960757
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:03:27 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id n27so10112914eja.5
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 06:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+xw5712P6meO+0QFZywppKlCyTs3sgmEQXRGyFnT9p8=;
 b=RnGAJk6AkfISwgN1zm5fAF9WXa9H7iH8yaIRfUTb8ima2Wxw9vqvlFc153ZVg3kxqJ
 GUW80AU1peXLW6xKG7kTueTiAdhqOEeYw7cIYWMIy/RD0Bea9gpUTtwC9IAOLaEc0XI2
 YKZ6B9Jel/6P6cmOn/rrAS9dWomuaS/Wuklxkwi2peF7sbRI8BXFQcP6wuKKnlelW6LC
 fzoxlaC69PZbRnrnbHjxKwstZqLsE9iragn54o1EViZWMr6UbinXH87Rt5zmgaEBC7M2
 eHTT2qhbKCX6dY2eEgC4UDDYGnY9paOw1yGFajiP4uZgVi/48cS3ZPkM2KwexCUZZ6sL
 zB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+xw5712P6meO+0QFZywppKlCyTs3sgmEQXRGyFnT9p8=;
 b=b39hdIN8mWXii41d0UoW1GiBD7r023o9GEbncQrJyfuwAvQTi0aaFLkMaJ+rp4N5nY
 bT4bM34MyrBB9t7uNZEf0hWah3XioQ0scRRqJKOqDUd4XTLowJMK8d3XnToqSVkRE5iM
 XSYJV1on+ML1LRZSRT/v+hRJxUlThCmlWU6Jztqnh+3uqtVnT3CT0hAkJw2eT4u8hfXK
 lFsB428d8vbJAbCr4Fs2cj5RL9qdtEwzclpv6UkttjrCTUuR0nfVgriMA1ThaPPuLDLZ
 jJZ/8rVjU1yGtvplCXvx6LjnE9hUl6LRqWNUexyV07Y1Bm2gS8IZ3WEpBKuszEjOmH2K
 8FBQ==
X-Gm-Message-State: AOAM533cIcHEwkD4PdvbopIZfH6ye3Z7/7ovj9NjE2ge1oedaz4PNSIk
 4rcrQCdSX8S6eSyBN1padc1RLzFX/wohZw==
X-Google-Smtp-Source: ABdhPJyrRj8uPQPUXWqGK39I2d7pRHoemcd0hnUIhuI9nbTOiyniuk7PnoO6BDhqM3oEgi6vhTa9uQ==
X-Received: by 2002:a17:906:901:: with SMTP id
 i1mr2860127ejd.248.1631365405739; 
 Sat, 11 Sep 2021 06:03:25 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s26sm917891edt.41.2021.09.11.06.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 06:03:25 -0700 (PDT)
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20210828083207.670611-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <5ac4fd05-e902-1031-c8e7-1fc7b3d855c2@mind.be>
Date: Sat, 11 Sep 2021 15:03:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210828083207.670611-1-bernd.kuhls@t-online.de>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH/next 1/2] package/dovecot: bump version to
 2.3.16
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



On 28/08/2021 10:32, Bernd Kuhls wrote:
> Release notes:
> https://dovecot.org/pipermail/dovecot-news/2021-August/000463.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Both applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/dovecot/dovecot.hash | 2 +-
>  package/dovecot/dovecot.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
> index cd314cf0dd..c7cbf46e47 100644
> --- a/package/dovecot/dovecot.hash
> +++ b/package/dovecot/dovecot.hash
> @@ -1,5 +1,5 @@
>  # Locally computed after checking signature
> -sha256  21bbdd5d45957a99133de8b7e71813ecb73d9476c89dfc63479e9102b3553590  dovecot-2.3.15.tar.gz
> +sha256  03a71d53055bd9ec528d55e07afaf15c09dec9856cba734904bfd05acbc6cf12  dovecot-2.3.16.tar.gz
>  sha256  319a9830aab406109cd67cb45496587566a8123203d66d037b209ca3e13de02a  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
>  sha256  52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
> diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
> index 62499061f2..cd637f19a1 100644
> --- a/package/dovecot/dovecot.mk
> +++ b/package/dovecot/dovecot.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  DOVECOT_VERSION_MAJOR = 2.3
> -DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).15
> +DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).16
>  DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
>  DOVECOT_INSTALL_STAGING = YES
>  DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
