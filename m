Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BABDC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:34:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB87460C49
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB87460C49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC66640772;
	Thu, 21 Oct 2021 20:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BSyr98QeYnoo; Thu, 21 Oct 2021 20:34:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 164EA40591;
	Thu, 21 Oct 2021 20:34:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5894C1BF318
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 490B6825E8
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oQuylPxQKQR0 for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:34:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD08D825DC
 for <buildroot@busybox.net>; Thu, 21 Oct 2021 20:34:20 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id g8so5602823edb.12
 for <buildroot@busybox.net>; Thu, 21 Oct 2021 13:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=INtKpZ3SRcM7mrNZELES/DiBF1HEbcnDfJPh6qzWSiQ=;
 b=BVB0D1+fh7pCt5GkdbbDAZOS4KoI1cuhGp1EaVtyy+WDHDgqVyo4VvZfm746YK5pZ9
 urYTkQ/30UB5CZY7/Ux4teRTDYtDMrDElcAZM6WWloArA7pYdzsy2MQKeG5psGqwtasB
 mGys0AZrHfwQXAOjFqdoQaNTY2xThuzj66gYeoOcmTZsZgig8o4Ujy7BuLAokGyIr8vQ
 gz0tF+KdISVJDl7WecwrcXHjvxmCd8d1Cein+rrlQcQEuSKYaWIpRLThGP6K4luC++p2
 QThK+XbvH7jtvHkAVB2hOifMT3lb8x1IJwaC98jtHo7X5qElsflMmJlRqXb9e4mWvzQ+
 NHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=INtKpZ3SRcM7mrNZELES/DiBF1HEbcnDfJPh6qzWSiQ=;
 b=VVIyN5xD9rFOSahw+LQkm+I06VM9/c/KiEz365lpEpjXDzLeVYJ2o/t4cPtFteNH17
 og7XidZitw3rxo4qfy4XxCRIBED6BZXfx+yiIc/w6/QXA63WN/xl4X6EkXDK5NBVg61e
 SEvfCR4/hVFfKYaLWIjQ4gp9Cs5PXwscS5XqxRM7/YHaX/G6TsFRviZziI3tzI9Fvb+D
 7PXWWa2cps0QBVChECWRkKNXNKrHmUHWTJbfL9HP6YHraY2ONBmil0V06Wd28DcYh/Q4
 tyF3pEbpSNkYWQXKiTWFaaaVnxQKyCQqZTGDEVXgiIQPCDSV4YN8iVx1EKd5vZcVeCxJ
 QAPQ==
X-Gm-Message-State: AOAM531kjeXenkxSr5lKIdTmA6FHlCMOmOh6oC9HUHeLS7ClAOIA+S6b
 dS5L2JBCwLRF34rPB24StrfrsA==
X-Google-Smtp-Source: ABdhPJyOz8FQZCrXfAaDoF9tla6JGbayUw7pTw1ccW8JCq6eneqvs+LNkcIqij7M0mt73bNIGvjh1w==
X-Received: by 2002:a17:906:34c3:: with SMTP id
 h3mr10322187ejb.10.1634848459130; 
 Thu, 21 Oct 2021 13:34:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f3sm3029463ejl.77.2021.10.21.13.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 13:34:18 -0700 (PDT)
Message-ID: <a3796a6b-b0bf-0afc-7329-d63e1da38071@mind.be>
Date: Thu, 21 Oct 2021 22:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20211012164847.234070-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211012164847.234070-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/lighttpd: bump to version 1.4.60
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



On 12/10/2021 18:48, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/lighttpd/lighttpd.hash | 4 ++--
>   package/lighttpd/lighttpd.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
> index cc192f1a9..b13c75ba3 100644
> --- a/package/lighttpd/lighttpd.hash
> +++ b/package/lighttpd/lighttpd.hash
> @@ -1,4 +1,4 @@
> -# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.59.sha256sum
> -sha256  fb953db273daef08edb6e202556cae8a3d07eed6081c96bd9903db957d1084d5  lighttpd-1.4.59.tar.xz
> +# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.60.sha256sum
> +sha256  4bb1dd859e541a3131e5be101557d2e1195b4129d3a849a3a6fbd21fe1c946f0  lighttpd-1.4.60.tar.xz
>   # Locally calculated
>   sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
> diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
> index fbbca00b0..1d9fc1ba8 100644
> --- a/package/lighttpd/lighttpd.mk
> +++ b/package/lighttpd/lighttpd.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIGHTTPD_VERSION_MAJOR = 1.4
> -LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).59
> +LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).60
>   LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
>   LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
>   LIGHTTPD_LICENSE = BSD-3-Clause
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
