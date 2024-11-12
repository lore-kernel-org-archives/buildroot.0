Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7289D32D97
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 19:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 526E140177;
	Tue, 12 Nov 2024 19:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-IV3qE24lh1; Tue, 12 Nov 2024 19:55:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34FA240296
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34FA240296;
	Tue, 12 Nov 2024 19:55:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 14736DB1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 19:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 022FB6078A
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 19:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MaZfUuYJqSQG for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 19:55:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EAE5860631
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAE5860631
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAE5860631
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 19:55:09 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-37d47eff9acso3704115f8f.3
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 11:55:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731441307; x=1732046107;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B1D6X3UZpn0HdSrj5AybUKZpGsVSo/cHxgjDqfS0ZP4=;
 b=VF8SuIagkil/X1b7Myg7D9+2ZZnvZ3/Yyr2ipLtOn1UQgTgsgvSAx6tr/DdcP1TFRN
 1EvEgLettfOvZC1QRjL0KdJTORuGAeo4BULPi7tdmvdPiE4tTLdcOH2I4/Q1AQ1rLfaV
 V0lFNF9f4jeetDUt4p9foHNjOUF6SIGUU/2PCY4wiHVvS9ficDBmGh83d/7u9v/Oiq4I
 spdLfg03g8nbaqgSKyk2Z84OhStV7H6yxiIHv5fFXkQIjw8GF6IaNgWHq4MU6hcq0JJq
 2OuF8yiiuK3N6ncDdHl0GJ4pPx84PAGAprLz/cAaWJ8nyWsXwZQkdFqHW8l2Ex8Rn8aG
 RWLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfmV13z2cfxnMGdt6IFkbkGhgt9lGc4KP1xy5YsDhzbHWGzQ/PWpEYD4HuMoKxr9NlXKd5BxpAm7w=@buildroot.org
X-Gm-Message-State: AOJu0Yx5IPmv1BgijzDDiM9xuXCX3EOeKBqerG/Dj1PB2+4zWzwQ7KVe
 4yYFXkg1vxtjxawV97aFMqDgEq8jAYNhgaB+oZSqzFR/dzqti9tZiMzTKNGYJfc=
X-Google-Smtp-Source: AGHT+IHWkJ6GEj/CNA+Y98sLFYBK/WPyOl5XgAY6/fjr8f+WcerhJSHngXYT4Iu/5b+XbjWhioL24Q==
X-Received: by 2002:a05:6000:1fa4:b0:371:9360:c4a8 with SMTP id
 ffacd0b85a97d-381f1862d88mr15546820f8f.6.1731441307515; 
 Tue, 12 Nov 2024 11:55:07 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed997313sm16098516f8f.53.2024.11.12.11.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 11:55:07 -0800 (PST)
Message-ID: <4f3e5676-2c19-4e16-a746-24df4baf3e60@mind.be>
Date: Tue, 12 Nov 2024 20:55:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
References: <20241031221535.338325-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20241031221535.338325-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1731441307; x=1732046107; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B1D6X3UZpn0HdSrj5AybUKZpGsVSo/cHxgjDqfS0ZP4=;
 b=MwscDA3C/rdnFYf9lmr65lKfbqlgwYAi+AEOTrvYm6TtAeCIT9Fp7DdD6Fx87g8C2+
 CrcIIUEcXBari+lfaWgNyfNRQm9HwY1GlP2/bVxVDl142XNVmSHkKx9cd7NyHmK86FH7
 vgOnUGPCaRocaMhg45psJ90d/uzqRArN6sY4lLNb/tkkeZSyg4lZEIpFt2cJQtXK5/K9
 LPLB2XXeQfNlYBnB98Vh/4Mm34IswY0uIYOqXupFWKAr8+nxYM252YmpzISE75UFUhm8
 hgYkSAOM1z4vwpMme4JimFuH7r/AeXg6VJ0+okyC3WBQS+2TedpSNlefA1bpVGdWdDUo
 0kpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=MwscDA3C
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: fix webp
 DependencyException
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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



On 31/10/2024 23:15, James Hilliard wrote:
> As of baa3db0c34e826cc1c6469fd8ecbfbc5c2ef2e2c webp mux/demux are no
> longer optional for webp support in python-pillow.
> 
> Fixes:
> DependencyException:
> The headers or library files could not be found for webp,
> which was requested by the option flag --enable-webp

  I added:

Fixes: baa3db0c34e826cc1c6469fd8ecbfbc5c2ef2e2c

  I don't think Peter uses this information at the moment but it could be useful.

  Applied to master, thanks.


> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-pillow/python-pillow.mk | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
> index e87c817c68..ed2668f03c 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -58,16 +58,11 @@ else
>   PYTHON_PILLOW_BUILD_OPTS += -Ctiff=disable
>   endif
>   
> -ifeq ($(BR2_PACKAGE_WEBP),y)
> +ifeq ($(BR2_PACKAGE_WEBP)$(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yyy)

  It would also be possible to add to Config.in:

	select BR2_PACKAGE_WEBP_DEMUX if BR2_PACKAGE_WEBP
	select BR2_PACKAGE_WEBP_MUX if BR2_PACKAGE_WEBP

  We do that for a few other packages. But either way works.

  Regards,
  Arnout

>   PYTHON_PILLOW_DEPENDENCIES += webp
>   PYTHON_PILLOW_BUILD_OPTS += -Cwebp=enable
> -ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
> -PYTHON_PILLOW_BUILD_OPTS += -Cwebpmux=enable
>   else
> -PYTHON_PILLOW_BUILD_OPTS += -Cwebpmux=disable
> -endif
> -else
> -PYTHON_PILLOW_BUILD_OPTS += -Cwebp=disable -Cwebpmux=disable
> +PYTHON_PILLOW_BUILD_OPTS += -Cwebp=disable
>   endif
>   
>   $(eval $(python-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
