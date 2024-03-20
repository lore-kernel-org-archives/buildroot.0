Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD4CC54E58
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 20:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CE6381452;
	Wed, 20 Mar 2024 20:28:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WMpCgBvuJZ_v; Wed, 20 Mar 2024 20:28:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74EB481E2F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74EB481E2F;
	Wed, 20 Mar 2024 20:28:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDBC91BF5AE
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAA3A81E2F
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:28:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uhH1pH5lrzlL for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 20:28:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A266281452
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A266281452
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A266281452
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 20:28:08 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33ececeb19eso122852f8f.3
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 13:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710966486; x=1711571286;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B2HcAfyku7ng5t0DlehxzCRo/oK++FQtDWTD2KnzTLE=;
 b=vg0mqSYxmr692Mn1YdWTxPPiVsjveEu4QyETD0a8TE9/oX0Wpac+WPiQVZqW5eJDhK
 s0EGy5rqkJnnAJuij46oqlPiXyEMRlfN2N9zcuxs28CTuxRPfFbbFAnw0prGedK8DWzV
 BsEJLoImNWnJj/XhwQIUAdA0O1ur00+u+5469oqOowBgKeNKW+a3+AfNDFs+I5HwlFsd
 Gk0Kas8bnnCPdjJSwPTSLq2/FSpjb39XPql9ljoa/21yagLEe4XBwEhUBKP/EWP5Ogu1
 csJmoxrV83MeMn+3BFi2INqcUH9N9hF9fxNhgOkxCmoUM/1T3RcG0VchDnzXYGwWbmWu
 fl6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2lPGtdQfAyYk73maU7vjrZdN3yZ8neUnONIrpKWiLEZDsiuBDBD9w4psRxQpNXWN6xpIdX+SddtcAO9Bn5n5jWksZzK8pAQ==
X-Gm-Message-State: AOJu0YzLYIFTbmYpIGynGHZikXmBpcfBswaMcBfqcot5H1E6egMzy16L
 ZSyT6VWdh5yTc/v3xcNm9qMfyhfSWYeACR2yQgZltdfvokp1Kx4Zsjq8qUVwKDSl9BSRPyqqlkn
 v
X-Google-Smtp-Source: AGHT+IEiOcEVyTSHGOO0rAxBD+FeO+aQzdMUiyzcTGq+hxJptBVSr70NF9DJsVN0cWu+/LIu2PB0SQ==
X-Received: by 2002:adf:ab08:0:b0:33e:720e:4a4e with SMTP id
 q8-20020adfab08000000b0033e720e4a4emr88134wrc.19.1710966486343; 
 Wed, 20 Mar 2024 13:28:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4002000000b0033e93e00f68sm15436661wrp.61.2024.03.20.13.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 13:28:05 -0700 (PDT)
Message-ID: <77de926a-de52-437c-840c-02da0e39476a@mind.be>
Date: Wed, 20 Mar 2024 21:28:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240318203855.404507-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20240318203855.404507-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710966486; x=1711571286; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B2HcAfyku7ng5t0DlehxzCRo/oK++FQtDWTD2KnzTLE=;
 b=iFA7hWjDwyx92l8z+cdH3gwrQWZz3TC7xdoh+RUZ0LI370s5LVzREGBLU1cgSyBw0a
 7uTgrEuLJjbb4FJzrvJk5XD0KJDy8YkhgFCJgrTsTjK5JkCwE4JbPWi7Ba9E7Rt5M0/v
 Md8lVfverogrv0rRCbYgZw3VR7lnGtIfcuaohnooGt9V3+wKTg/IaZfyh3TFJ7g8n7kI
 sVCZOCSAPX4RHf0iAFqaZxcNrFc0kxQbz71p3Xfi+io8kNbVHRX/6QE//jNLWQgzA5OU
 gXUw5AlHFzMGLSDzoZo5qtcPF4VgxfZV8tFFxm8Lfo5WzZcVjWIgc2mbGYFDfv8Jms/L
 pkZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iFA7hWjD
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 8.3.1
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



On 18/03/2024 21:38, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/harfbuzz/harfbuzz.hash | 2 +-
>   package/harfbuzz/harfbuzz.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index fbe890910a..f107aee8c2 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  109501eaeb8bde3eadb25fab4164e993fbace29c3d775bcaa1c1e58e2f15f847  harfbuzz-8.3.0.tar.xz
> +sha256  f73e1eacd7e2ffae687bc3f056bb0c705b7a05aee86337686e09da8fc1c2030c  harfbuzz-8.3.1.tar.xz
>   sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index 599ea548d0..e3da4add43 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 8.3.0
> +HARFBUZZ_VERSION = 8.3.1
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
