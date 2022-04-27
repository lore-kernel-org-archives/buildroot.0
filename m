Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110AFC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD026830B8;
	Wed, 27 Apr 2022 19:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMvfTk5LrJmw; Wed, 27 Apr 2022 19:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 422CC8301D;
	Wed, 27 Apr 2022 19:38:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 790221BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72EF0409ED
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AENYt-wFXZVr for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:38:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 592784036A
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:38:05 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g23so3100726edy.13
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 12:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5MSDTmH6vYxRtOqniGeK7vJZsBeSmsZwhiwGKNKPoVE=;
 b=NNL57OmDeGJYx6Z2sCH2nnMBFsCiBTegXQ9SKz5+4jWE/85UXbibatEVP2H39bZtVH
 mcWGf2Jhe7CAIhV//2WpZ1jiMFTSMPf27CXvyL4HIU9l4Q8lAZMMHf/n1gwR6gOgBVTR
 qLMxAu3GLTKR3mTZTPpMCdDQBUMG3eIs7TG1CqMIFrotqoYjCYDyaI8wm7jSzvknzeC6
 sMxv+0XAd5DsL/2egt0ETCPTtGWTB/YIa84DnObffUYSLT1v+rn29GUnXgR4AXPMkc/c
 Ds/fpLRHYzw4WgaQllGLghRlJZ3j/WNVaACVhZ0Ttc7meGLqmzUADKnRDshGA4o4yxY3
 JcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5MSDTmH6vYxRtOqniGeK7vJZsBeSmsZwhiwGKNKPoVE=;
 b=H7ZtZHifvjWBVyusRZjRIElKiYLgzYner/dG/6q8cmOQu3RUKtG7H9hrtLiPsoEteS
 uy3h5f81cK0olcrdTKxVPHjclZQALA2anxU/HYAtVq+9rwAIZiZ5adDMnfrAshTG9tV8
 FWYumhnkm9sYE5+ApaejytXh57hyXo6Qje9XVzCd+T2/dmJp/a8kyPHNAF39REgXmOaB
 alWxX8tioQ6so3GrPjO2wxYVgOTZfMmi7GxLYSFTQ9ihzdA/WSYyFjuVqV0c2P/ogQxd
 aCWnpN6hmWvfDdutJ7NEwP0ug/9RPI4hjZVHay7uBQ6T123lXrnJmzG6PY8S2mnUKRaT
 AXsg==
X-Gm-Message-State: AOAM533VGAgICZTG6fArj5F8ngTMEMnjcGlLVTZgCa5TLkax/7DYMKWK
 KrQN70C+zMXjXtoVcBGJlqLIZJIGHQyXpA==
X-Google-Smtp-Source: ABdhPJyTbL4vudhlngbfSLNuHzgl9hOWbFJpazjkXCYobO1QoMr3K39gV7o46ITzpylVCpk5p2Rq9w==
X-Received: by 2002:a05:6402:26c7:b0:423:e5d6:b6c6 with SMTP id
 x7-20020a05640226c700b00423e5d6b6c6mr31933320edd.61.1651088283550; 
 Wed, 27 Apr 2022 12:38:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f23-20020aa7d857000000b0042617ba63b4sm83901eds.62.2022.04.27.12.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:38:03 -0700 (PDT)
Message-ID: <a083e346-264e-965c-105b-c1f731685fd1@mind.be>
Date: Wed, 27 Apr 2022 21:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220427035039.1664864-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220427035039.1664864-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: drop libressl support
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/04/2022 05:50, James Hilliard wrote:
> Libressl is no longer supported as of python 3.10.
> 
> See: https://peps.python.org/pep-0644/#libressl
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/a16/a160cfdc9dfc036c4dc41af1c796f8838d91c573
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python3/Config.in | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python3/Config.in b/package/python3/Config.in
> index 61470c2944..761c38c850 100644
> --- a/package/python3/Config.in
> +++ b/package/python3/Config.in
> @@ -89,7 +89,8 @@ config BR2_PACKAGE_PYTHON3_READLINE
>   config BR2_PACKAGE_PYTHON3_SSL
>   	bool "ssl"
>   	select BR2_PACKAGE_OPENSSL
> -	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2 if BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2
>   	help
>   	  _ssl module for Python3 (required for https in urllib etc).
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
