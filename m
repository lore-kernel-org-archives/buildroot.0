Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DB4C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:15:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E3BD610A6
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E3BD610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E19594058B;
	Wed, 27 Oct 2021 20:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nnSNix-pwUvq; Wed, 27 Oct 2021 20:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 503944058A;
	Wed, 27 Oct 2021 20:15:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 806211BF3D4
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 707F981D4F
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pKUv4qTD40dQ for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:15:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8727C80D13
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:15:34 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id h7so15703945ede.8
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 13:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2jqI/taOL6wwu8e5TMbxBkm+I+3culLmogNF+dwe9n0=;
 b=hgk3HD3yiAZO5DOB1MQCS1d2v3RjHyM8UgHzaam7b1qHCSdvX9IKJRIJaAq4Ua/Ig7
 H8SOVYKfr3mJLGAPxqnHtr0SVKXbE2kXYW3fUt73K6fnWRfp5XkaKYsL5zEyBjZgajD8
 93IJa8YYBilb3HSgK9W89aqf378YyW8fqfwQPraihWfU3NxztsLdPw65aXYNiPQUN9yi
 jKaq80ubqSlHoIbSQsjvUcng8xi2h65t+pwX2yajQ8Y+c9rsj1nhXbjvLxUP+X4Hj+Eg
 Urthket+bcMoBE1D0wtO42eMiiyLhoYZ13dODi4b67HnRFHPK9GqFrKi2uIUfQmN3VZN
 BUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2jqI/taOL6wwu8e5TMbxBkm+I+3culLmogNF+dwe9n0=;
 b=J7ZG+3hk656cQk/hTS/K8kw1oba4oVuesr7TCOu6efCaO9sweUwMqb0GfDMmvUkRGU
 8sEGZiTnv40YcUuDxEtjdJ5GzG4R0TrxlCv4wxnxZdGq7Mwejl+4Po81JH/xFhKmNs6d
 /TQ+ra9tkVoBXofGiIOKLoWu2Zx0ZIAkqe7Dlq08kratvLPzGapAxyP57HKpgehWa6Fj
 m9MGFMshBei3vpzWI4GhdXSfPpnhVMKTtEidhBMKiFg+OToHtmpDzjy9tjVhbB0bW7WC
 4R4oofHN8etthWHv2XjP2mRnYVJIQ9YAB5R+dx82TyvFkJfHJa0TJ+UinhoRWgz3meua
 uFHw==
X-Gm-Message-State: AOAM533m5UJNZo+jYCYz8zUP3qePyr5aUXmig7UGO+mjQQ7Wn04xHYnM
 5CxlkvsnOZAv4dCaaIgIkgcfOlfT5ijq0A==
X-Google-Smtp-Source: ABdhPJw+3zMCFMsDSnkmOoqhQezi7b8wpRNE9Vtwczi8MTJAHik2eiut2X2KrLrWF7+G8y+nG15qqQ==
X-Received: by 2002:a17:906:9241:: with SMTP id
 c1mr42972975ejx.125.1635365732817; 
 Wed, 27 Oct 2021 13:15:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hb12sm450396ejc.6.2021.10.27.13.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 13:15:32 -0700 (PDT)
Message-ID: <661aa442-0d48-7a52-ca05-afebcfe605cc@mind.be>
Date: Wed, 27 Oct 2021 22:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Ismael Luceno <ismael@iodev.co.uk>, buildroot@buildroot.org
References: <20211010191936.15090-1-ismael@iodev.co.uk>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211010191936.15090-1-ismael@iodev.co.uk>
Subject: Re: [Buildroot] [RESEND PATCH] package/x11r7/xserver_xorg-server:
 Add support for Xephyr
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/10/2021 21:19, Ismael Luceno wrote:
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/x11r7/xserver_xorg-server/Config.in              | 5 +++++
>   package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
> index 4dc15435a8aa..7f37f2f1acd4 100644
> --- a/package/x11r7/xserver_xorg-server/Config.in
> +++ b/package/x11r7/xserver_xorg-server/Config.in
> @@ -82,4 +82,9 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB
>   	help
>   	  Virtual frame buffer X server.
>   
> +config BR2_PACKAGE_XSERVER_XORG_SERVER_XEPHYR
> +	bool "Xephyr server"
> +	help
> +	  Xephyr nested X server; successor to Xnest.
> +
>   endif
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 2d276f90d56b..6d0876f1fdbe 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -47,12 +47,12 @@ XSERVER_XORG_SERVER_CONF_OPTS = \
>   	--disable-config-hal \
>   	--enable-record \
>   	--disable-xnest \
> -	--disable-xephyr \
>   	--disable-dmx \
>   	--disable-unit-tests \
>   	--with-builder-addr=buildroot@buildroot.org \
>   	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1 -O2" \
>   	--with-fontrootdir=/usr/share/fonts/X11/ \
> +	--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XEPHYR),en,dis)able-xephyr \
>   	--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
>   
>   ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
