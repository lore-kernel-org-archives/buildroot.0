Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9262DC27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 549ED41576;
	Wed, 19 Jun 2024 20:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1TZZAB9Y0eC; Wed, 19 Jun 2024 20:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2079A4036F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2079A4036F;
	Wed, 19 Jun 2024 20:18:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D61851BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C340284240
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frgWoITkAQfh for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:18:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BEF558423E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEF558423E
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEF558423E
 for <buildroot@busybox.net>; Wed, 19 Jun 2024 20:18:38 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42172ed3487so1618515e9.0
 for <buildroot@busybox.net>; Wed, 19 Jun 2024 13:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718828317; x=1719433117;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/XLd8Cs8qXXHGnbvRMirpa/ZQXffbc+qcsyVmpY7Q1s=;
 b=xUImL1d00woSp8AOggmFL6aH8Uv6eXJcHjgY6J2heUmOodEE1AsVegp+6RD0vWLoiC
 9ceGnd7mdQhK/jfaZj5JlyOO8Ysfpt7KO6fFEsScTtoSsj/9wycCDTnhdtWX3T5VJsGF
 sPr63Wctf+VrlqtfWq0/CMbyNFBdhHq72lmatfEAncjQHGC4wlNy+/fz7hG07gbQyqCj
 /8eXOaKU8K90LomEu3i4Jj0jPR8NalmowV8wR/9Id40u0ecc8wULznoEP9AXCA1LRrng
 tlMVTJLMjR58lL9vy4Ys8k/Uq4jWceRbwvGqEvQNIau0MXEYDWk3sBmtaFNRP2xWVS9n
 ptHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVWZ2FayIOyYDiUkuVct8Mrtgov+EhlKfGMq+E5tujksyzDnFEDjUlhoeQzWlklcFWXgZr5+/6EXGSVwGTa694yS3N3+c=
X-Gm-Message-State: AOJu0YxaoWEwa/BuhUlEzSsOGxxIw2dUB1JTNIEgz8BGbs6GznsoqJ9c
 HwkjY4zaXzb3Vv+MurP5clGU3/uvpG+qtlqx/bVdNQNWsiTGQ752xDfyXDt65KY=
X-Google-Smtp-Source: AGHT+IEzP9/UiGgvW5q0XfIDXHae1uFdlUZh54rmdpnkglPhRwbSw/kCiLiandpiXnGumM/Jbbg34Q==
X-Received: by 2002:a05:600c:2252:b0:424:798a:f7f2 with SMTP id
 5b1f17b1804b1-424798afd71mr16095135e9.3.1718828316501; 
 Wed, 19 Jun 2024 13:18:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0c0f03sm1395905e9.17.2024.06.19.13.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 13:18:36 -0700 (PDT)
Message-ID: <a15d48e8-b826-47ff-9e78-7ed92f040407@mind.be>
Date: Wed, 19 Jun 2024 22:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20240605081541.1181630-1-francois.perrad@gadz.org>
Content-Language: en-GB
In-Reply-To: <20240605081541.1181630-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718828317; x=1719433117; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/XLd8Cs8qXXHGnbvRMirpa/ZQXffbc+qcsyVmpY7Q1s=;
 b=hDCiw+6aojyFlUkdBWtpNBYsmAhJRJJdrpPXB7qyjILHnU1FtiBJuCzMWeHEFZrCPg
 7wXZf2Jzdb9m+4okP34kpHa4mwlvz05ZZqP74di/pIiQ3FBAqmpJqd5Cp+mZ6f6jX77+
 mGlwYPMpe3b/8GJIyj6BhMmelKueXvZdXgWaj+gk0h/tHChBHdAdxYePcxb4j4FbbKPe
 j2utHtU9rcTMSOQmsGVnlyKyXd5Va29+3yCu/8ju3QN7qf078uHqAZDp5LDjKiWxkNUm
 MeaS5SnTTpZprNqt0tM9Bo4sMPobM/qN/mn3I8kT3TPxhEERbO04RUHzcr4MagflaFmG
 j9mg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hDCiw+6a
Subject: Re: [Buildroot] [PATCH] package/iproute2: bump to version 6.9.0
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



On 05/06/2024 10:15, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/iproute2/iproute2.hash | 2 +-
>   package/iproute2/iproute2.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
> index d57a93de7..a716bf75a 100644
> --- a/package/iproute2/iproute2.hash
> +++ b/package/iproute2/iproute2.hash
> @@ -1,3 +1,3 @@
>   # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
> -sha256  03a6cca3d71a908d1f15f7b495be2b8fe851f941458dc4664900d7f45fcf68ce  iproute2-6.8.0.tar.xz
> +sha256  2f643d09ea11a4a2a043c92e2b469b5f73228cbf241ae806760296ed0ec413d0  iproute2-6.9.0.tar.xz
>   sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
> diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
> index 3db2ab925..525101aff 100644
> --- a/package/iproute2/iproute2.mk
> +++ b/package/iproute2/iproute2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -IPROUTE2_VERSION = 6.8.0
> +IPROUTE2_VERSION = 6.9.0
>   IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
>   IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
>   IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
