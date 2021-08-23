Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B511FC4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 21:09:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44F36613A6
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 21:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44F36613A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ADC1400CD;
	Mon, 23 Aug 2021 21:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQ3_oIn0H8av; Mon, 23 Aug 2021 21:09:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03C70400F1;
	Mon, 23 Aug 2021 21:09:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F2E41BF32D
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 21:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C02B6059B
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 21:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bvN37v8d3XeT for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 21:09:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BD6F60087
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 21:09:13 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id h9so39781345ejs.4
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 14:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xzFF1c6QoZ9MOJ2YpMgPxSuosT63R2yW0Iyj8mOVfbE=;
 b=buBZC7XUaRqWXt70mauMxHIeMcG7jNQukF7Jrr1anRjuO0oOO8EguKEY1ZwVx4yRpZ
 an9y7ZjFmTFxXFzLbU2VvbbMPt+zdJ+62A0OgINDXWJcB3P9qKSJijFK++Na4dJ19Y+r
 7ZMMOjl1Gjf97LZt9XIyfpd5cAfYuFYKZ3bj+sk8NN3WiVT8bRuy++eixMr11fSAoksG
 YCV+1XbtD2V+511klxE+5hCBOXh3dNm/7sd6FO8HW1DznqFFAhqFw7Zo3AIPTglHITcg
 DmuaxDC2HvccjDppukDm1r31kO7sHDb26V89vNa61WGICLhW41q4+VZJ9ZbnuekzygE8
 RIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xzFF1c6QoZ9MOJ2YpMgPxSuosT63R2yW0Iyj8mOVfbE=;
 b=JZsV0gMuM1jgj71VdrIY6oLb7aYCsbLR76scQlcpaV6pzkTurFADskn7fkTQhK0zWE
 I5tO69vKkUUkK21ZEzye4aiQ6EnCCd3MTRoxOP1LAlaaKXUxvmb7+scAuynJiAeJW6+i
 DLBQoV7cuj8oSSl0mNQhnfqAxaN2VXS0qUEV7TC4nk41Pjp8KXbsqswdKvA6fD1wLLBM
 qDjgnP7NJZv/Xcq6kWso+J0xw0Lw7Ks6tIn994ZcN9qHj9Y3lIhXQd+Hy9GrkQL148+3
 zgAlefLce8wVudRoXkKm05sQx9Rl9wO6jDk2Q2bS0gzlB/Po4bl+SxZoFefZvonkDDZS
 yOVw==
X-Gm-Message-State: AOAM5330oPVWiopbOeSOjpnJUxTjTGFuTrjOaP+2E4dQRxLl6MMieK+4
 TK5eL9KjVFiOQsbIg3v2ngWatK1ZaAfAfA==
X-Google-Smtp-Source: ABdhPJw8kfVb7G3d6Ax+xkiT8IAUo+zKgrqBeQ9fIhF+AQcntSO8gbpnJv0YcPzt7HkclEH5X8cS4g==
X-Received: by 2002:a17:906:13c4:: with SMTP id g4mr60213ejc.152.1629752951627; 
 Mon, 23 Aug 2021 14:09:11 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l9sm10174342edt.55.2021.08.23.14.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 14:09:11 -0700 (PDT)
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20210820225341.1131147-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a3095f99-de72-57a5-ded9-915c5b400de9@mind.be>
Date: Mon, 23 Aug 2021 23:09:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820225341.1131147-1-romain.naour@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] Config.in: disable Fortify Source for
 microblaze
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 21/08/2021 00:53, Romain Naour wrote:
> As reported by Toolchain-builder project [1], the system doesn't
> boot when Fortify Source is enabled for glibc based toolchain
> (the init process hang).
> 
> Also, hardening features may not be wanted or possible for such
> slow soft-core cpus [2].
> 
> [1] https://gitlab.com/bootlin/toolchains-builder/-/jobs/1467624500
> [2] http://lists.busybox.net/pipermail/buildroot/2021-June/312416.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>

 Applied to master, thanks. I reworded the commit message to avoid Giulio's
confusion.

 Also, I added a dependency on BR2_FORTIFY_SOURCE_ARCH_SUPPORTS in the comment
that glibc and optimisation are needed.

 Regards,
 Arnout

> ---
> With BR2_RELRO_PARTIAL enabled, the system boot.
> ---
>  Config.in | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index 2ef5d407e4..84f7fa6e8d 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -853,9 +853,16 @@ endchoice
>  comment "RELocation Read Only (RELRO) needs shared libraries"
>  	depends on !BR2_SHARED_LIBS
>  
> +config BR2_FORTIFY_SOURCE_ARCH_SUPPORTS
> +	bool
> +	default y
> +	# Microblaze glibc toolchains don't work with Fortify Source enabled
> +	depends on !BR2_microblaze
> +
>  choice
>  	bool "Buffer-overflow Detection (FORTIFY_SOURCE)"
>  	default BR2_FORTIFY_SOURCE_1
> +	depends on BR2_FORTIFY_SOURCE_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	depends on !BR2_OPTIMIZE_0
>  	help
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
