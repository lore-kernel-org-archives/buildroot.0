Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C47C54E68
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 21:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD07040589;
	Sun, 17 Mar 2024 21:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMT7_Xt3rdJF; Sun, 17 Mar 2024 21:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BC084058A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BC084058A;
	Sun, 17 Mar 2024 21:47:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48D7D1BF3FB
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3578B4058A
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0SJWu8-J6tWo for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 21:47:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C938940589
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C938940589
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C938940589
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 21:47:26 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4141129bf14so1021255e9.3
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 14:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710712045; x=1711316845;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q9QsEIR605Dzd+QnNMekM24cIl5qlYE9C2SrzrGKokc=;
 b=M5+/ZTYu4Msz48PTFRdBpjYzEuYOCniQnXfyr+joZEoKG038/V5unAjt3vGlnhGnmn
 h0Lcgq9mAe7hKd/TGqtqapWGMpAS6IxFJaklfXxCRFjgTKam2Vtd7NcKOW+Z2CTYoVEF
 1F86DKZ1moXKGmgBf9REtFHP/kRDxyksjOH8zTdt30oM+jm7Z0wXkhnbluW3ht8zrXA/
 hkKcwt0GlYZYcbyhOonF6tnczfbK+6C73gHnh6Nd9fz2i56Jax8Ah/Jq3eyOIXCQ8+XE
 7KpJecczea1lwOfMYqO3Mh8V4pHzTSaAT0s7WJQ3P/emPZAfj3fBcJQRwB7dPeFUApO0
 3SSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvpkCdFHv9+p1R9Jrx3LhUCIarlBcYdMy7ztpsmcY+uaSAErypAlOUN4zQc5q4DgDl9wG25oPG7QA334dDvH9vfzYmtFOIZg==
X-Gm-Message-State: AOJu0YyU4ekGh2wnjUo/s4onF2jn+KDssWpKNGxlt18BXAuPwULznelo
 4Gf3p/pOHuJ9rABkJMS3AGzfWkPKA2zpoNmWR3XWVxp6q5Jdvyr1ng1f2Q43DQo=
X-Google-Smtp-Source: AGHT+IG9jeQa5HICFnDfXlRRysBUUxCmhEN9IOXt3Z8f9c8/tUiDZbyq7FtG2ImZLbgFKqURJ7W3gA==
X-Received: by 2002:a05:600c:a02:b0:414:9fa:1da2 with SMTP id
 z2-20020a05600c0a0200b0041409fa1da2mr2818080wmp.15.1710712044744; 
 Sun, 17 Mar 2024 14:47:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fb4-20020a05600c520400b00413e4ff2884sm15912323wmb.40.2024.03.17.14.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Mar 2024 14:47:24 -0700 (PDT)
Message-ID: <57d14ffb-b884-45f5-8cd7-92eafa841d81@mind.be>
Date: Sun, 17 Mar 2024 22:47:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240317105901.157006-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20240317105901.157006-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710712045; x=1711316845; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q9QsEIR605Dzd+QnNMekM24cIl5qlYE9C2SrzrGKokc=;
 b=Wwbxy5hdA/I8ZekXALq02s1bAvS5iHVQh5NKhAIiZGbM9X/MAYjoz84JS8zKBExpvu
 YxNCeDc9xaVBO15DLGUCv0GVAZhFam9p6MTCtv0W3DVVrmU+rMdGliSbVOJGalHjVd/W
 jGqs4hezxPTGO0giZJEblah8VqN9P9vKHkLNs8BYO0Vsi+DnqUA17rFPljJy2mlkpqE9
 3iRMxHwkmORVKgDRqq4Og+YoHU5hIZwLkAlmOjO2xMAv4ZKdr1BtUFMVUv5sg7xMUEwe
 /iy/fxhAUcZoPA3XuUFC61N7GRkXxrZ0zITpaW7ho9l9ssDZ9rYKryp3ne4NMc9BeP3K
 fXhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Wwbxy5hd
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.99
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/03/2024 11:59, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/libnss/libnss.hash | 4 ++--
>   package/libnss/libnss.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 51701724ed..8c7c807f79 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_98_RTM/src/SHA256SUMS
> -sha256  f549cc33d35c0601674bfacf7c6ad683c187595eb4125b423238d3e9aa4209ce  nss-3.98.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_99_RTM/src/SHA256SUMS
> +sha256  5cd5c2c8406a376686e6fa4b9c2de38aa280bea07bf927c0d521ba07c88b09bd  nss-3.99.tar.gz
>   # Locally calculated
>   sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 21b1f17b25..0d8b4dc592 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNSS_VERSION = 3.98

  The bump to 3.98 wasn't committed yet. Please base your patches on master :-)

  I fixed it up and applied to master, thanks.

  Regards,
  Arnout

> +LIBNSS_VERSION = 3.99
>   LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>   LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
