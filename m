Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C00EC432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:47:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE55C610D0
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE55C610D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 994106060B;
	Wed, 25 Aug 2021 19:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TRIXHE6r-YPU; Wed, 25 Aug 2021 19:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F95B60614;
	Wed, 25 Aug 2021 19:47:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 822C31BF588
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64B2440139
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvjKHgCeW5Kg for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 19:47:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6741E400EE
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 19:47:45 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id r19so762370eds.13
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 12:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LwLV4o0wQIpfbJTKgyybgp5agbc2OgL519bqNHFvMdE=;
 b=SNLGlxFfkNkPZVsNhCTbfaoGvSN/BgRJHIo+NTU1oUJ12BOZ/wyTWp17Q01h8qnxWu
 ur+hIrMunSXa8XzL72hcVDjPc6Y6BW1hAYLkNS74hlWO8iM+WUqd2eah5yj0qUgh0tUo
 mQe0BJXFMvtEUMkucXEgn1dv1hyLErinbH3wr+9hzghNNJvxwgHWjF71Am5dSS9LWOow
 3IM7nE+McFRek/GUcf+RkAH2PMDDYstjSolQ+pCbnzl9xdDjsjLMYlVnKvXqIraHkWPt
 MAuIyT9xlEwTdXl2QzFtSM85Onqnw2bYHkBXkj8Vndai6biixVQInTbYbgdVOTF6+DbS
 vMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LwLV4o0wQIpfbJTKgyybgp5agbc2OgL519bqNHFvMdE=;
 b=U2HhQ2OyY4gK3Iylzmrc4G4aO9Tw+zouj6/zcvUCXBqJsljlPC+A955neOe7V9RWak
 yStI/sZTcvUHPZuFEsaVL9dIKLwKlf9Y5au7CjAdAWFMe0ilBUyWIZC0LX6BfVZXKSHC
 8Df8JB6hVYNCdXCJCuXBP5kCicsq0hCoPSnJNptf6zRN1A+Im9K/nUWf8w9/Ty+7Bi4E
 x7bIAPo+Y2RsCpjgCRFIJk9FZIQI7DcCphRtVuSocD9zNo71AEgGArrxjY+K3//5mpGJ
 ZOYlFAS40ap/HtFtO5S/AZt/A+yJmkJvb+pSJuXeeYx6RnLejhrhXqycFk/tCzcw9fob
 iAeA==
X-Gm-Message-State: AOAM531uW6j3ZCYVPDjAdJqOwpEFy9wXrxfqkxoJcTwAZMgFB6P59D6b
 ExjxgO/t5nIBBEiiiHBrpmE65OO4mPIBTw==
X-Google-Smtp-Source: ABdhPJwsDIN2z/Y08m3Uj7R4NUPE5rdZpnWBNsJjnXetd6qq2pHdAixnWKJoSXNjYPgRizFSDklAtA==
X-Received: by 2002:aa7:c487:: with SMTP id m7mr256818edq.62.1629920863561;
 Wed, 25 Aug 2021 12:47:43 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y13sm499500edd.45.2021.08.25.12.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 12:47:43 -0700 (PDT)
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20210823112729.750916-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <5d9f8647-dd25-da59-1e05-acdf81f15d25@mind.be>
Date: Wed, 25 Aug 2021 21:47:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823112729.750916-1-romain.naour@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/libffi: disable use of static exec
 trampolines
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



On 23/08/2021 13:27, Romain Naour wrote:
> TestGst1Python test segfault since the libffi bump to 3.4.2.
> 
> Apply the same fix from Yocto [1] disabling static exec trampolines.
> 
> Fixes:
> https://gitlab.com/kubu93/buildroot/-/jobs/1522848331
> 
> [1] http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=dadfef3950fae4e93ce4c13ab91a2a7f41b3702e
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/libffi/libffi.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
> index 0ef2786988..85b4ab5b84 100644
> --- a/package/libffi/libffi.mk
> +++ b/package/libffi/libffi.mk
> @@ -13,5 +13,9 @@ LIBFFI_INSTALL_STAGING = YES
>  # We're patching Makefile.am
>  LIBFFI_AUTORECONF = YES
>  
> +# The static exec trampolines is enabled by default since
> +# libffi 3.4.2. However it doesn't work with gobject-introspection.
> +LIBFFI_CONF_OPTS = --disable-exec-static-tramp
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
