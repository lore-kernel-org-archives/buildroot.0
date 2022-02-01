Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C562AC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 21:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CFDE40477;
	Tue,  1 Feb 2022 21:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hs91vMKXCe4S; Tue,  1 Feb 2022 21:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B4794019F;
	Tue,  1 Feb 2022 21:44:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 590571BF424
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 21:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5560A60B79
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 21:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id txQwmbgPnpXY for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 21:44:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5590460C33
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 21:44:39 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id b13so37510277edn.0
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 13:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6QS4wxxAVLqv++Ux82FewEMwax65+eDNvZaXevw7nP0=;
 b=Pq8XI72Y6VvCnqCTzk7x0gFJBT7ew+zZufmHM9C35VcO+NJW+HyJCRGvKg5qspHab5
 BkYlTz+fqoo1QhonYN+RFji7HDKQ4BnBZl3WpIOSC7tIyIWhGGzd6BBlxAEeGgXQmEw4
 tonQ3YXDq3V5fZjTe/S53znRRkb/PZ+64LtVrjzqOqL+0Dpr9IyK8B6KqL35wyPArcoY
 JzQJN302/v0HYW828lR+nCImkHoOHlnRM+aKcS4xQUmDdCxRad0UFIH2/diLyj3FYgH2
 UvfRC8QQCe8mcZ13z2Ichul47c/1fyevXAk6yvcuqmBiykqoMJOCshfd0ieRH+4E4THN
 Vmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6QS4wxxAVLqv++Ux82FewEMwax65+eDNvZaXevw7nP0=;
 b=BjtKEXOMRxZh466r+MdJL4obwHFn27Nc1vw+4OxnOLRh03qYYqt5fq7yhnfFrAv54I
 B7HbBhoBCpZCBbipDUcByUBmmgxf3CrqZAJeOVuMj+JjXStB7U5U/ElwPws4AWDue6Cb
 A3A1HpvPozQEuBnF4rVvWrAI1U7EWVM1ytNp4GLs7ulUwGFDe9TqVaIFqz2Z+SjaA3jN
 dE2SY+W8v/WPlgzvJsIAyCOXVBLkwF+4Ntm8VVpxHQyvHuwgPvCpLEd2CoWhYJl946Rc
 pxSQexWTJFkTBEKQeSpk/XQi26yMS60j15AlDk6JG3SwQa78x7PcoGZdi7np2SzTERjx
 AeKA==
X-Gm-Message-State: AOAM532C8FSJ1ZMitBoI/2k5jvfl+jyaJEDyr46HhlX+W1t11kqsxhkM
 BjO1Pw6bd0PX+bDsxw7kntkp3t2sXtELlA==
X-Google-Smtp-Source: ABdhPJyDWEC981ICzH4QylxeulteF6depIcFJltBoMumb4fTxQQQ98cd9x0nYRh4GGC/MIQVMpq8aA==
X-Received: by 2002:a05:6402:270b:: with SMTP id
 y11mr27566812edd.350.1643751877612; 
 Tue, 01 Feb 2022 13:44:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g24sm15122593ejx.11.2022.02.01.13.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:44:37 -0800 (PST)
Message-ID: <8892c3ac-c187-2ac4-9355-9c79b6a84194@mind.be>
Date: Tue, 1 Feb 2022 22:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220115111622.1910388-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220115111622.1910388-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/php-apcu: fix build without
 __sync_*_4 intrinsics
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
Cc: =?UTF-8?Q?Herv=c3=a9_Codina?= <herve.codina@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/01/2022 12:16, Fabrice Fontaine wrote:
> Fix the following build failure raised since the addition of the package
> in commit 8ddeeffa186d8bce875ac713c1e71483c618842a:
> 
> configure: error: Compiler does not support atomics
> 
> --enable-apcu-rwlocks can't be used until
> https://github.com/krakjoe/apcu/pull/430 is merged (and autoreconf does
> not work either)
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/efa/efa3b4406f87a1e9521b66f392a6fa19ac01f0cd/build-end.log
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/php-apcu/php-apcu.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/php-apcu/php-apcu.mk b/package/php-apcu/php-apcu.mk
> index ce59611d8f..3ac062e772 100644
> --- a/package/php-apcu/php-apcu.mk
> +++ b/package/php-apcu/php-apcu.mk
> @@ -22,4 +22,8 @@ define PHP_APCU_PHPIZE
>   endef
>   PHP_APCU_PRE_CONFIGURE_HOOKS += PHP_APCU_PHPIZE
>   
> +ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),)
> +PHP_APCU_CONF_OPTS += --disable-apcu-rwlocks
> +endif
> +
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
