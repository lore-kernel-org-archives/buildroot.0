Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB612C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:36:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16840611CC
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16840611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B044E407F9;
	Fri, 10 Sep 2021 17:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_LebxfACqtH; Fri, 10 Sep 2021 17:36:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAFC4407AB;
	Fri, 10 Sep 2021 17:36:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E55931BF83C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1F75401D5
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zjQfY2XzvUhU for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 17:36:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7BEC401D0
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 17:35:59 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id jg16so5788391ejc.1
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 10:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ebu3houH4OhnJXmj1jvKvQgZp8aAf0Xj0YUeonTKeTs=;
 b=W1WQfyBcOxse1bt5aDBt/IjmbgusVY6SZNM1evQN9XAA+xsbpV2KlKN3enIjrv/hpp
 BbUCmOWf4jmfIrMgcnAXJdq7Rq3ok2XyJ1+7HCrvtYhpRGU1zWO4PbI/PWFpy3HinZr+
 EA0ihNU5EvQymQSvfPJTnX9SIW/Ja8pisioJVJVthpWFn8phD0XE3rGBN8Or0vB1xSIo
 jJeUpkPyDyzbC217kNAJhdZvkZVqVBgClsusCOnQiqDgmNKg3puqMe/j7KUn4rrDPfXZ
 gy4KHdelZPM2B2EieI7+VPSd/Drs9SnjHBWXVbG06zUosEKIyxtiJJ8d2BWkXFzZFPbE
 U6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Ebu3houH4OhnJXmj1jvKvQgZp8aAf0Xj0YUeonTKeTs=;
 b=p9iBeLTaRc4myyEM7rKHTR0PFFeOG2nUVRggBRCT4UF0iijBlmzMJgOnqmTYY+FDxW
 JwV8oqPiZGhGuPuRGEZ2eCRSrr1UYEwC99pZz5H+mmKRXvUkkRpgPvzydeTcVsup9u35
 OjTHVVbIneQiga3d9V5tkRJ/8vsZPw6KC1iyY/U+T6QiYBIN7BGp4hozSfRQ4H0VrlcD
 v4CaUl/rRwZKFQMSRp3QkPjVdF0kY4zuFlDfjpp8AYvmmZmXgo1XvXbVM3SXnvp+FEAq
 GejNRqllqwh1SEkyAIMKGKFu6wnogrOpRkW+luvWjwLK2TC+6jD5dggACC+IMnmdzwvO
 C+Rw==
X-Gm-Message-State: AOAM533iq2QyfNPAls2jyGTE3kftW6Pktwj1+sH9TA+s81lCEc/dN4cX
 VehHtglprTWhxZYddkjcccWuGA==
X-Google-Smtp-Source: ABdhPJzGUnYfDoMr1NtXGH7GxrDVeveCK+5lDxoO7A5y8huY+mILgKCbmuP6ov6DbbKKdMmn7Ql+bA==
X-Received: by 2002:a17:906:93ef:: with SMTP id
 yl15mr11132500ejb.229.1631295357794; 
 Fri, 10 Sep 2021 10:35:57 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 6sm2835454ejx.82.2021.09.10.10.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 10:35:57 -0700 (PDT)
To: Bensuperpc <bensuperpc@gmail.com>, buildroot@buildroot.org
References: <20210821195634.60346-1-bensuperpc@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <4b97b158-8442-5a2a-b832-4567f68f7753@mind.be>
Date: Fri, 10 Sep 2021 19:35:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210821195634.60346-1-bensuperpc@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] Enable quadmath on aarch64
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 21/08/2021 21:56, Bensuperpc wrote:
> Enable quadmath on aarch64
> 
> Signed-off-by: Bensuperpc <bensuperpc@gmail.com>

 Since no signoff with a real name was provided, and Thomas's question hasn't
been answered (I checked the current master GCC source and couldn't find a
quadmath implementation for arm64), I marked this patch as Rejected.

 Regards,
 Arnout

> ---
>  toolchain/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 1d0469a13e..b4cd6d511f 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -794,6 +794,6 @@ config BR2_TOOLCHAIN_HAS_ATOMIC
>  # - When available, libquadmath requires wchar support.
>  config BR2_TOOLCHAIN_HAS_LIBQUADMATH
>  	bool
> -	default y if BR2_i386 || BR2_x86_64
> +	default y if BR2_i386 || BR2_x86_64 || BR2_aarch64
>  
>  endmenu
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
