Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF7AC432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:08:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AAED610C8
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AAED610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B20E40231;
	Wed, 25 Aug 2021 20:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SBvZ3Hffd_5R; Wed, 25 Aug 2021 20:08:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 941A240237;
	Wed, 25 Aug 2021 20:08:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B3FB1BF335
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B2F180F95
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0db5wSWwx1d0 for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 20:08:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 442FD80D7B
 for <buildroot@busybox.net>; Wed, 25 Aug 2021 20:08:36 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id e21so863653ejz.12
 for <buildroot@busybox.net>; Wed, 25 Aug 2021 13:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SKTQY7wLGw4HXJoQEh146oODE7O5T4XwbbPQtxWPHfY=;
 b=CO748dNcBvOhoo9WVr70QJ0lsCQ+y5FXZE8utZQlaTzgoeGujOJF3HvHGgbLaZPFZZ
 01al+OGVIvDpEu3cD2GpRmPY8Hte9ZgKm4OFsEkqzncU6uXmH8kDcACo4v8N0zSaNoyi
 eTsHrBNnchyIlzsJ4hkfwVKHVpZAY3nIhls3CxEl4Ey8c7ZWeo9R9q9P37hIm2V25HjG
 955vCXuJZs57w75vE/ZyblRH2CaWh3i7j2Hc0WlDPd/YpQzmRMfbymQfSYzFIKPDr1OY
 vjUyf3EWpydPbO7nC3Uv6kR3IeoEbPPjDEj9Tk66Aw7lCn45bPgxiqv7xGFKilI3vGYf
 U+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SKTQY7wLGw4HXJoQEh146oODE7O5T4XwbbPQtxWPHfY=;
 b=jqObZf0/kNMuF+xMCRmZ9Rpmf9yKTz1k0vVK31B87d94NpXPb5kp/oM+zW2M2oCGrb
 /rpPDnb3Wpb8Qwbqvej6d6jr8vyCnSRAEiy1qWY1IpTRZ2xHGCqujPgd8SeZep4kI7Zy
 ua/wB6loK4sPwktVIvUOt/lhoso6CS0Eh4rttr/fYKqLnEnjOyL8mp+YMLFbeOOOk63Z
 zNvTll7dWToE5CId+njmMv1o2zXtKlX8/rJGRKdcltyNZ6KgQsHLyk1cnzYbpMqvQpme
 ESmeWPZzhPHMUqIYnGezwcU83nX66Ht/8CleP1zYkd/Bp/W2++HOkRyVUrLv/3psoWy3
 NBrg==
X-Gm-Message-State: AOAM533SIURC8WEiLekjNDXEW6a9Sf8sxhY6V7mNyO2vMk7/F6TsUAyp
 9JrLfrPOK+Ir3U38/SxCtvmOtXBUwcbTog==
X-Google-Smtp-Source: ABdhPJx2MiHxOUy/XDb1+ZuD5tdDetA38smODI5yAOdKPULcRgLRzzKcc8GVc4KhbI9ZSkoQaT+7Og==
X-Received: by 2002:a17:907:3f91:: with SMTP id
 hr17mr387839ejc.496.1629922114545; 
 Wed, 25 Aug 2021 13:08:34 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id lm21sm285214ejb.58.2021.08.25.13.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 13:08:34 -0700 (PDT)
To: Michael Fischer <mf@go-sys.de>, buildroot@busybox.net
References: <20210825090040.13145-1-mf@go-sys.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <3dd98168-4c16-2a98-9476-3b3513c4a39e@mind.be>
Date: Wed, 25 Aug 2021 22:08:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825090040.13145-1-mf@go-sys.de>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump
 version to 1.1.1l
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 25/08/2021 11:00, Michael Fischer wrote:
> Signed-off-by: Michael Fischer <mf@go-sys.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index 585486ffbe..93c688d9dd 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://www.openssl.org/source/openssl-1.1.1k.tar.gz.sha256
> -sha256  892a0875b9872acd04a9fde79b1f943075d5ea162415de3047c327df33fbaee5  openssl-1.1.1k.tar.gz
> +# From https://www.openssl.org/source/openssl-1.1.1l.tar.gz.sha256
> +sha256  0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1  openssl-1.1.1l.tar.gz
>  
>  # License files
>  sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 389a0a8b32..f139213315 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 1.1.1k
> +LIBOPENSSL_VERSION = 1.1.1l
>  LIBOPENSSL_SITE = https://www.openssl.org/source
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = OpenSSL or SSLeay
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
