Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F052FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CFCF60FCB;
	Mon, 21 Mar 2022 21:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0_57mrme4KX6; Mon, 21 Mar 2022 21:33:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABF1A60FB5;
	Mon, 21 Mar 2022 21:33:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 104081BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2D1784292
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N1rS8cR5G30u for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:33:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F0DD84291
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:33:26 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id h1so19473822edj.1
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 14:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JcWjDCp0Dyals7qWezOBcv+zDve9S5ZQ2fcGiwxfPbs=;
 b=hOchVYWq8foAptW1uBQg9EOyx7pZHtCCcTLpsY2PD4GcU5j45SmsVjCZzb+TCUm2wl
 mxZyG65X/eN6ao7Ad7LwZlItg+V6xXqxSNJ65WPuSoH2/Tr9pN6gZnENOXo0xL0b6+iS
 /7KG/EE/5U3ztnA2GoEHKoWjRahpg2heoVYFU25d5CqUHiJyBYEPK9U/IDCdxn6iRNtv
 E2RsV9LjPBNruhly3NHM6oKb+AOWdfNOz79CoWVl/1N3KXusNGX9sKP3G/99WhLuMs7L
 vLCZMxEH3Y5iXoTY7XDkaZWYL2x1EceRJtzeolPdlbC+SYoH3NIkfVVvePOgMETrMZqV
 RlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JcWjDCp0Dyals7qWezOBcv+zDve9S5ZQ2fcGiwxfPbs=;
 b=5Ya0jOl0yPFuEiX29qRiKknrzFJfwmMAzVDw0OCmLdqwt0049m6ihSnAoXiGJwjq18
 xJ3h2yHWYWNuW+dU3v1d8tL6Ya+V1366aAvoOmrKT4ID4/ZM8Gm+IEaIA/xrnLtnwh4a
 kjS09lwj8703eET6NM8b1nefdZ1lCUh1ffczk+ua0mnhR7HWNY5Y3HRGwfjXwWMDkYc5
 Wp0X8+QhpF4xQxu9LPu/SFBCmqhWSaVjtss2UZVC8zzP2PpZ6EHkE4xbwwI27ufgLt50
 QP/9dbl6dLoqjpht148y9mTQXbq1qgu1gXRrcaiACrO72VSczsMTMFmaWcUsmcnsqHdS
 +ugQ==
X-Gm-Message-State: AOAM533k+p22s/aMm3YD70OgsDLe66N7mcI57giYSkqLbj+F7dkfdX55
 dU9+hZ8nVe+RV538iFixxtOeZ+HXZNRzeA==
X-Google-Smtp-Source: ABdhPJyqJGwlVuCV8grJpC2l8/IG5fklsgArUnUeNcG/Bw104MdLjFLUJOTyLPboqDhqBU4ji9BnuA==
X-Received: by 2002:a05:6402:d05:b0:416:a67f:18ee with SMTP id
 eb5-20020a0564020d0500b00416a67f18eemr25257012edb.120.1647898405339; 
 Mon, 21 Mar 2022 14:33:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hd35-20020a17090796a300b006dfbfc80ce1sm4392143ejc.128.2022.03.21.14.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 14:33:24 -0700 (PDT)
Message-ID: <8ff7a156-e970-919e-9dd9-3876dfc724f4@mind.be>
Date: Mon, 21 Mar 2022 22:33:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220314185945.2823356-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220314185945.2823356-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: fix libgsasl support
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/03/2022 19:59, Bernd Kuhls wrote:
> Contrary to the helptext
> https://github.com/curl/curl/blob/master/configure.ac#L152
> 
> the configure option is called --with-libgsasl:
> https://github.com/curl/curl/blob/master/configure.ac#L1989
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libcurl/libcurl.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 0db0c088cb..a6e5b06b8f 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -128,9 +128,9 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_LIBGSASL),y)
>   LIBCURL_DEPENDENCIES += libgsasl
> -LIBCURL_CONF_OPTS += --with-gsasl
> +LIBCURL_CONF_OPTS += --with-libgsasl
>   else
> -LIBCURL_CONF_OPTS += --without-gsasl
> +LIBCURL_CONF_OPTS += --without-libgsasl
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBCURL_COOKIES_SUPPORT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
