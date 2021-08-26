Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA8E4C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:39:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7BCF60FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7BCF60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DDFF606CE;
	Thu, 26 Aug 2021 21:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UxqfnMgRFi8e; Thu, 26 Aug 2021 21:39:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1C4B61487;
	Thu, 26 Aug 2021 21:39:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF1ED1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECB3A80C54
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ve5Jhc712D5B for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 21:39:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 598F180C0B
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 21:39:20 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id h9so9354145ejs.4
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 14:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O0+0D8dJ+AoOI44RH2/Vekh48Wr96X/25e2HUJ0lgVE=;
 b=frUebHKIhyFCWW3jYCPaJXFGVPPAFaiuaa/7AFuRpr1BI6KMsIDB8LIfjSHWHTgW7H
 1gEBix9tsdi4WLbzLAkAaCMyXrN3+EST2rxLyZ4v+4s9Efy5l3CfNzife4hJc7+YzjoD
 cu7XbtfhkommojVhgg4Z6ziK4J+9HRoNtuQQKOI0021JfWp/sGfaRJqA8PAqwh/dC+FH
 269xV9FSSXJJdbWjhIEsM5xRBLgI7z5Y1KUnIA/Z2FBkE09Od3QMd6clp3Mu4sk1GqXQ
 yJ8aNl6/qgzMBfJnz1TzxTyIyiD6Zl3eyeD9kUUFzk0fk7XABI22RSxSqdYGtaIOOT1L
 naHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=O0+0D8dJ+AoOI44RH2/Vekh48Wr96X/25e2HUJ0lgVE=;
 b=G8zLLxJXstmqvdvHTQs6ADHWLar2IiiAVrw1ZoEO25UwadhuWmixO173Y7J1C/x5cw
 IYOp8cGHOhXyKmpCRa+NQ0SqlgS+vMXo5aFGe1XF4AKxzOBjk+bl8LdxzDiQurJzrP8F
 vL84GMiaG8mvc8NA3Bjs9nAy/iOeB085au40HaaMazMA5fYz+j2xnSL7F4eZP+KQZxkv
 8sM7DFlpslDx0PO10cUD45+ZpQJmcGxG9DtxCjnVg3OLhj8ZXm0Zf0hr4pPwmNpy7N3H
 cv9Z1gS5M5xg8k+3O3LCkRnndeyEndH4akfmWwQOjm7WSCz6leTe+Z8rLJLZiQtfzoL0
 rj3A==
X-Gm-Message-State: AOAM530JUQFokm2ShQ5CGE8WI+XnNtQ+PTGXud/wh+JwVB0oNTXNfCgu
 349sYJSlKS0rzXqJggWJzBjfEvOo+OALtA==
X-Google-Smtp-Source: ABdhPJyhZO+4YuPdftF4BqD5ah13+nAMWphzG+LbnOcuuQQxcImHqeKbvW22yKmcadbllZmQaJuG1w==
X-Received: by 2002:a17:906:a044:: with SMTP id
 bg4mr6530867ejb.312.1630013958532; 
 Thu, 26 Aug 2021 14:39:18 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n18sm1879663ejg.36.2021.08.26.14.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 14:39:18 -0700 (PDT)
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20210823125628.2838501-1-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <d01681c9-919d-f8e4-5ea4-1943d3d188c1@mind.be>
Date: Thu, 26 Aug 2021 23:39:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823125628.2838501-1-aperez@igalia.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH/next 1/1] package/bubblewrap: bump to
 version 0.5.0
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



On 23/08/2021 14:56, Adrian Perez de Castro wrote:
> Not much new, but has a few interesting bug fixes. Release notes:
> 
>   https://github.com/containers/bubblewrap/releases/tag/v0.5.0
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

 Applied to next, thanks.

 Regards,
 Arnout

> ---
>  package/bubblewrap/bubblewrap.hash | 4 ++--
>  package/bubblewrap/bubblewrap.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
> index d3ccb4cb1f..88aba150cd 100644
> --- a/package/bubblewrap/bubblewrap.hash
> +++ b/package/bubblewrap/bubblewrap.hash
> @@ -1,5 +1,5 @@
> -# Locally computed:
> -sha256  b9c69b9b1c61a608f34325c8e1a495229bacf6e4a07cbb0c80cf7a814d7ccc03  bubblewrap-0.4.1.tar.xz
> +# From https://github.com/containers/bubblewrap/releases/tag/v0.5.0
> +sha256  16fdaf33799d63104e347e0133f909196fe90d0c50515d010bcb422eb5a00818  bubblewrap-0.5.0.tar.xz
>  
>  # Hash for license files:
>  sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
> index 18c175951a..5f3d95e826 100644
> --- a/package/bubblewrap/bubblewrap.mk
> +++ b/package/bubblewrap/bubblewrap.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BUBBLEWRAP_VERSION = 0.4.1
> +BUBBLEWRAP_VERSION = 0.5.0
>  BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
>  BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
>  BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
