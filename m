Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D1DE9D406
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 571D96067A;
	Wed,  4 Feb 2026 15:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCOe3IuCsn7d; Wed,  4 Feb 2026 15:53:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 692FE60D7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770220388;
	bh=iTwXlXkSFlvCNgHANZquNq/CmlBQAaa3sUTtk+Jx2MU=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eRRTdJPWvOhXYBQB4LPPTHIyF866wtW/6U39gXDPt/g0Or2ra37ByekNJilfJ3cV5
	 cSCQlxrGvT9U+Y89HYFPe3Qsy1ftr1n3/ldfzo0nSeCBmepxBiGsrWs6EDMmVrpsFx
	 HJsWIv2UMZwSIFhVwet6c2NGinpzd2Zysi6FBJghPPOraexyrxP2rNOvZxoIIKcODA
	 GNFGNaZ/ZhB54Zt7F+A9tqOTUh9T6SOo8ND/LkfD6PZi6UkcyO1QYRV+0W98McBMaO
	 pwgO3b+khN00zKTVCXjOrNkBGVyi3mANB5tGXdABdUNMQ0MFReVBl7OT+VtsaWRtr9
	 7Ge7ZTMXy4ULg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 692FE60D7E;
	Wed,  4 Feb 2026 15:53:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0336FF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D86FB401D4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YoTXv_tDDm6D for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:53:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.44;
 helo=mail-wm1-f44.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BFB3C4016A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFB3C4016A
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFB3C4016A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:53:05 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so75599955e9.2
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 07:53:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770220384; x=1770825184;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XzyzATlXM9f+tX8baYTzPKwWXKpguNGUk3twBBKDrkU=;
 b=xVmI8NHgF4sRv4p8oVVYEbT3IQXgASFHEO1T7aUuOHlbxA01oNKJrhlVeTTyDqo3rA
 X8hW4piijQK2aFjfjXPVymkwyjzT3cfaFtAdV6wrScvGv6GV8F91yDESLXWorVQOXaDZ
 W7wCjutPraPp6otEmi3yNj6QS+I7eEEGtUF0jh9EwPozalNRFiEyD8dhNcwuk1nhlwTM
 SDKST2dTu74GDMl9axa5fkRgB6yScqZp4KzwtDTU9jKdYom1ZPcMgjtt1DkfqFEf28c1
 q56w/Vww5z+FkU4mth9vakZEYRSV1xQbTpRHBncsxDN9hBFfRwOKTlLIpe+HG7CocvQO
 R1SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQJKZQNMIKAkVPYduvKkUofuRE6VsF5IWV1q3qBJrsHrCBm6FQIQvcowMLPwYhD6iX4iFrPPhFEUM=@buildroot.org
X-Gm-Message-State: AOJu0YwRVSD7eV3nGU4XrrU3DVDZ/39Nmdt1UYslZ8jazQNlTWF3PMx9
 VmzorCq5kTpv7bpwUTga4swbpexHw57kw7al1FA8Ky3HFZfq38P4R4RDN0nl1CbZ
X-Gm-Gg: AZuq6aKdaFhzm31gGQnnSQSlUjMqlv8N2mzk7KHhP5IIao17FYQZpNjssVJA1smNrYG
 zT+57+Ld+yLNYyfoioYOWBTJR65Dkp7FcH9WWBqlgRNHxkV1Jrkx2l15YteQK4iDUiPUSGFbbbT
 WbgXr/k6QUZ+6zeVlZAq34wvF2o83LTJI287z3wTr/7KTuQa+08n4b7r98iVkpUSznU4/vvz4QT
 bcdPukxYTeCLC5eFe4J1lTcIznWPPTtbNTU1nUZHAgQsnQkJpOromyDb2K9QIjgoAqVSFyTiJRo
 7Dq3FPDs5Zbc3eMjjllggzW4WrUlSalvWMISI0obeTzI9wB9LwFpOZ1xvGLUJ3cSr6sUXrhUika
 3mrtffAy2Wu5S+0LeXtXfVIj2+ZTMzWUxna0ajFcOxvgvgfSnvQTLnC4glz8iTino6/iIUCy8UF
 R82effGJJw+lCtszeZd4VBQerwy0isVBdfXxiMOqFmLV1mqyupgo/ozwjk/bjsy/7fr1vf42mpM
 q36KQU=
X-Received: by 2002:a05:600c:5250:b0:480:3bba:1ca9 with SMTP id
 5b1f17b1804b1-4830e922965mr42132915e9.4.1770220383460; 
 Wed, 04 Feb 2026 07:53:03 -0800 (PST)
Received: from [172.16.3.27] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4361805ebc4sm7335244f8f.31.2026.02.04.07.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 07:53:03 -0800 (PST)
Message-ID: <71e5f691-1c76-44d9-9d1a-3584b15ca130@devoogdt.com>
Date: Wed, 4 Feb 2026 16:53:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Preyas <preyas17@zohomail.in>, buildroot@buildroot.org
References: <20251214121359.610963-1-preyas17@zohomail.in>
Content-Language: en-US
From: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20251214121359.610963-1-preyas17@zohomail.in>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH] package/libwebsockets: bump to 4.5.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,


On 12/14/25 13:13, Preyas via buildroot wrote:
> From: Preyas Sharma <preyas17@zohomail.in>
>
> Signed-off-by: Preyas Sharma <preyas17@zohomail.in>
Tested-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
>   package/libwebsockets/libwebsockets.hash | 2 +-
>   package/libwebsockets/libwebsockets.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
> index 1466c8d9a2..16aa6f7522 100644
> --- a/package/libwebsockets/libwebsockets.hash
> +++ b/package/libwebsockets/libwebsockets.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  472e6cfa77b6f80ff2cc176bc59f6cb2856df7e30e8f31afcbd1fc94ffd2f828  libwebsockets-4.4.1.tar.gz
> +sha256  04244efb7a6438c8c6bfc79b21214db5950f72c9cf57e980af57ca321aae87b2  libwebsockets-4.5.2.tar.gz
>   sha256  6ff2868dd9d9e251de27574342663f4773a8c2f954128899eb6f3c2ba9d9a245  LICENSE
> diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
> index 7806b64bbc..395c869e83 100644
> --- a/package/libwebsockets/libwebsockets.mk
> +++ b/package/libwebsockets/libwebsockets.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBWEBSOCKETS_VERSION = 4.4.1
> +LIBWEBSOCKETS_VERSION = 4.5.2
>   LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
>   LIBWEBSOCKETS_LICENSE = MIT with exceptions
>   LIBWEBSOCKETS_LICENSE_FILES = LICENSE


Kr,

Thomas Devoogdt

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
