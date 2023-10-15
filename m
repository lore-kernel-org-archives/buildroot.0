Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C1FCDB485
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB658414BF;
	Sun, 15 Oct 2023 20:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB658414BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahFHWdaGEXv4; Sun, 15 Oct 2023 20:04:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC905414D5;
	Sun, 15 Oct 2023 20:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC905414D5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A83B71BF489
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C17B414D5
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C17B414D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MbMQ-XCqg3I1 for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:04:06 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94F50414BF
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94F50414BF
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9be3b66f254so247973266b.3
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 13:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697400244; x=1698005044;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q8b8B3U+PxcEvQLKmF7zGgUOJvvQHvSd+ViqznzH0lc=;
 b=Df1Odq9SqlgbE+rD9Y7CZq4uDbTUzlCyvIIK9j3aWkkDPrVp3YqVEmQBndstIh+FFj
 h1HbYjOznqdUbDC9X8Op0geUtGw9n/w08gow/dJ3Us6JfD1f/cCn43KR68G2hrpZznXr
 CrX9CjPCbUUzZ7pGy32wFof/m8n8BtaVnSj9e2QuiyD25nGcTI/uUPgIvSSRLnAfrISR
 VKeY6U44jU9jIjMi68HsGFApfZFkOKJxkc3P2URH1bx47SrqYSfUpYFwizMecwE4d0x4
 s5pjUI7tassWc3Y3P0TI1afEQ9hz/HV/fFC0+FaaYOxPFnWMaELjvq5eNhyukWLWqeT4
 mbbQ==
X-Gm-Message-State: AOJu0YxZqd91JxxmHit3jQZA8D9iV3B8Lp10In3TKLb4gRI5Q6iCAcoh
 c8i5qdc8IwNX5faqoOHRENfoo1adYRDop6Es6us=
X-Google-Smtp-Source: AGHT+IEyzxZMO5//27JIjyyqwBfpaYKmYfsOjLdqAC/Z/N+/FFIn4uLbQOoIz9BX07jPD8ffQsknIw==
X-Received: by 2002:a17:907:7253:b0:9c4:41c9:6ac6 with SMTP id
 ds19-20020a170907725300b009c441c96ac6mr575073ejc.33.1697400243789; 
 Sun, 15 Oct 2023 13:04:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a170906845100b009a168ab6ee2sm2660090ejy.164.2023.10.15.13.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 13:04:03 -0700 (PDT)
Message-ID: <e785c090-20d9-0154-f8c3-e1244a127690@mind.be>
Date: Sun, 15 Oct 2023 22:04:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Titouan Christophe <titouanchristophe@gmail.com>, buildroot@buildroot.org
References: <20231015114615.235625-1-titouanchristophe@gmail.com>
In-Reply-To: <20231015114615.235625-1-titouanchristophe@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697400244; x=1698005044; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q8b8B3U+PxcEvQLKmF7zGgUOJvvQHvSd+ViqznzH0lc=;
 b=h8eQ2znuDSHxT4PfCEe6BoNV/zhybNj/TtVEcpgyH57jvLEvAn394IbrTuI/xRThdd
 GZw+Jn2BpfYvR3erc8HE5oZffflC99lV8rO3LFhAAwM7WKb5Ywn/i/xihxKOwiZdHiD2
 /H1H4XlSzESybLNKRu585v3eeZnni5tNHMm4/zqGrOMmY9EFiMONMfO907ahYfg4w/Ha
 zmhsXVCromF2lQonoLyKbTe8co3do61ibia0AG0Br6Uk6ToJplQsUTutuqfnnewDCnPo
 aADfyglpMQs+Af1j/cWNRJujQPJXfIc4q9pr2BWg+ZmNWgbxHk+3Kz+HefL/hqzYw7d7
 4VuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=h8eQ2znu
Subject: Re: [Buildroot] [PATCH 1/1] package/waf: bump to v2.0.26
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



On 15/10/2023 13:46, Titouan Christophe wrote:
> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/waf/waf.hash | 6 +++---
>   package/waf/waf.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/waf/waf.hash b/package/waf/waf.hash
> index c8d464ebfb..1ad535febb 100644
> --- a/package/waf/waf.hash
> +++ b/package/waf/waf.hash
> @@ -1,7 +1,7 @@
>   # Locally computed
> -sha1  9cc6db88ecda57067024f368722ecbf48a3bba1a  waf-2.0.24
> -sha256  93909bca823a675f9f40af7c65b24887c3a3c0efdf411ff1978ba827194bdeb0  waf-2.0.24
> +sha1  e310e29a44f23f80591f2aa6c2d4c30e5f1a26a8  waf-2.0.26
> +sha256  dcec3e179f9c33a66544f1b3d7d91f20f6373530510fa6a858cddb6bfdcde14b  waf-2.0.26
>   
>   # The waf script also contains its license, but is renamed `waf` in the extract
>   # step, so this is a synonym for the above, to check WAF_LICENSE
> -sha256  93909bca823a675f9f40af7c65b24887c3a3c0efdf411ff1978ba827194bdeb0  waf
> +sha256  dcec3e179f9c33a66544f1b3d7d91f20f6373530510fa6a858cddb6bfdcde14b  waf
> diff --git a/package/waf/waf.mk b/package/waf/waf.mk
> index d98ab489ca..bffa27a926 100644
> --- a/package/waf/waf.mk
> +++ b/package/waf/waf.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WAF_VERSION = 2.0.24
> +WAF_VERSION = 2.0.26
>   WAF_SOURCE = waf-$(WAF_VERSION)
>   WAF_SITE = https://waf.io
>   WAF_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
