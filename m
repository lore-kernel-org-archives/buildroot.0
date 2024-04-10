Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5215ECD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 19:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F4964170F;
	Wed, 10 Apr 2024 19:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKuM4GulhTmE; Wed, 10 Apr 2024 19:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17D954174C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17D954174C;
	Wed, 10 Apr 2024 19:43:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBB7E1BF59A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0D914174C
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAEXbUaiXrDD for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 19:43:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A36BE4170F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A36BE4170F
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A36BE4170F
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 19:42:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41550858cabso48746015e9.2
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 12:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712778178; x=1713382978;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t5cmZBzPKJJfUmiskyIEUjywhWHzFeU0x51v7WCWWN0=;
 b=KAFXSVcKM/s1sHnftO/mbrFetvJ+A18K2kMgHMtqM11eAufNRnIOREtL7ZdK1eMnLs
 zOfLmt+zjEIEOMWzSDT0jDQiDcuCheWCCE0I1KBI0W6up1/QnKk/p90bSdPh12mCBDpc
 KETl1wG1y8zAkfFkVa7ZFWysiIOZ6t4WfScIpkkh+t16jjBhxc/hmqYgXwlwlrSWDEYi
 +FIIOY5C3YN2It5+vFTUaFcvH510hMxJCqCzHXEJ2mMqQatHDo/k4gujObBUwSObUhp4
 RDS3VLvzNC9JeznYd+bJGl0+U9kuYP4z5UPFqNY4pdBPLKcHc7n4BGRHHqhRAyx458Mi
 8YZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDulnDdTzKSu2EqdTYzIAJ5ZB+2AFJ9R0dDZnTpzTJmMqQTDLMl14hXrcuATk3LWhxT6fuujJlqgNGOrfybfISmxxblZbtWg==
X-Gm-Message-State: AOJu0YybPXLQ7HTZXqhUYeAniCs52zSC3k83BqlJ8xpjiZDTxCN1nLPI
 At1mGmMaOX7m2JCvj63ErUVX+eH94XHIQnbZs2zNWORikPznX6A9Opmjrgu9Cmw=
X-Google-Smtp-Source: AGHT+IGED711kQduE0Hv5L/n8WAeNy0svL6IlzArbSedB6xHBeex9b3NwhJYbgVRUjNmMs2fv0W7kQ==
X-Received: by 2002:a05:600c:1c9e:b0:416:8152:8a70 with SMTP id
 k30-20020a05600c1c9e00b0041681528a70mr2368926wms.33.1712778177728; 
 Wed, 10 Apr 2024 12:42:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 gw7-20020a05600c850700b004146e58cc35sm3277123wmb.46.2024.04.10.12.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 12:42:57 -0700 (PDT)
Message-ID: <c13049ad-98fd-42a2-8421-4708758cd1bc@mind.be>
Date: Wed, 10 Apr 2024 21:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240408170811.9572-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240408170811.9572-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712778178; x=1713382978; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t5cmZBzPKJJfUmiskyIEUjywhWHzFeU0x51v7WCWWN0=;
 b=SXuPXwMjEJ2RLB38ykzpZXvjQcgVPLA7IQl17+ZTHNIhNm5tDxbT1hmMdWkDrgcs+H
 jwLLX2ifn4uC2jrtToQfuIV3W7Cjx1O2EEniK4ia1Qthez0SgEud3abVXtk0HLJ8GFRE
 X5+FkmPtthqvUkQPzgFWpbhenFRjexwqLtV17GbyyWW88fYejhDfvdI4LRxpI4ydF09Q
 NBMp3HirdykvGzuTwG1roNYw6L92R0H0G7bYbRTw/kdy24aXlof3LbCapdzylbmeGMdj
 oePa6V10emnOnhqstjM62sbOdzTE2CU99XzrvruPIEEuQGLeGJdNcGs6IzdZuQ/CYUao
 ghrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SXuPXwMj
Subject: Re: [Buildroot] [PATCH 1/1] package/opencsd: bump to version 1.5.2
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



On 08/04/2024 19:08, Julien Olivain wrote:
> For change log, see:
> https://github.com/Linaro/OpenCSD/blob/v1.5.2/README.md?plain=1#L323
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/opencsd/opencsd.hash | 2 +-
>   package/opencsd/opencsd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/opencsd/opencsd.hash b/package/opencsd/opencsd.hash
> index 6295f32051a..43a5a38683e 100644
> --- a/package/opencsd/opencsd.hash
> +++ b/package/opencsd/opencsd.hash
> @@ -1,3 +1,3 @@
>   # Locally Computed:
> -sha256  11ef93c0ee57203e620cf7c58b7b7cae00b267a2b57948a511da01c4161775e3  opencsd-1.5.1.tar.gz
> +sha256  ef27fe6afa6402b051aeae5c2827fa6d8c2d174170a5dc244f7f721db6908219  opencsd-1.5.2.tar.gz
>   sha256  980eef4b0744e63834e3ec0d50c2a4ff6d81d7ec62dd8ba8c66acae0ec5a2e88  LICENSE
> diff --git a/package/opencsd/opencsd.mk b/package/opencsd/opencsd.mk
> index cc3538ef281..8aafeeaad57 100644
> --- a/package/opencsd/opencsd.mk
> +++ b/package/opencsd/opencsd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENCSD_VERSION = 1.5.1
> +OPENCSD_VERSION = 1.5.2
>   OPENCSD_SITE = $(call github,Linaro,OpenCSD,v$(OPENCSD_VERSION))
>   OPENCSD_LICENSE = BSD-3-Clause
>   OPENCSD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
