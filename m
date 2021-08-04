Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDD5C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:14:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 757C461040
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 757C461040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BED6400D9;
	Wed,  4 Aug 2021 21:14:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XbyTIphiUUgh; Wed,  4 Aug 2021 21:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 304E3400F8;
	Wed,  4 Aug 2021 21:14:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CFB71BF5DB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68B8282980
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vb4ejsuumUZm for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:14:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8478F82965
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:14:53 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id hs10so5866865ejc.0
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 14:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oOyqF1OXu1RPXyw8DE1Go9T46zqlzlROMVH8DE+OCnI=;
 b=a3iUe2hW4oMblgs6P6pexcIOq/UiczGuC82zlG03TxC8dyo9kwrYjvy/GaxV5Oo0rP
 IIwYRCAl6r9lQu2WcW4gumZbx6wWFmBBgpIZ/cS3no40laY4SlUBjrVTTfBUANvtGtjD
 MhhCIqYUgRsO0i1bYA9jqCma9CDsXLezqgB2IIHpxYKQk5p6Buu4oZMf1MWUS5jrm0KR
 UQ11TOa5MJNq0uwjXNxErL0wbcqbqYQvarAlpDe2wydkUfJ5bbAnwrG8h9D7H7e3UJeu
 gpJXxn1tp4ILcoSLpjyYwQWColGk7D6HTdpCBZJXKib7HaMnH+TJnzLnRpwJwe+E6IZR
 6VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=oOyqF1OXu1RPXyw8DE1Go9T46zqlzlROMVH8DE+OCnI=;
 b=si8JML2fJKa87ElQp5i7U9077GctwvhBhhyyi094qKkNp+JEPZLqVpEMQwFEVUsrS3
 ihLc3ZG6yOdS5Esys2vXlIgJiiP0lqjcjUPzbDWdsntXJoofgE2DYTNLRURCY59Xzfyu
 2yG0zQGNUGU6VsWsnsKLU0g28IdUUAktM3eN02ozN58Lw6D3NMbFISLWHSlMI43RjmSe
 hasThDKYq83M/F5R+aDZLRk5roWqtIaKP8UNcPMrCA62ui/4dbCJ+e7+pyQLXTYxYRBO
 uWJ7NRqw4dxaoHvndUL9drJzJXe+tfrLhPZ1Hqej1DcCdWz/b5Sa5D9hqVsWNy1POVBC
 fytg==
X-Gm-Message-State: AOAM532JsFRF/y2TIUsqUOLsIZnOClcN5iI72f58ZhnCAotkZiwuutiD
 Mr5ksNkXjFl2Vi2EUws26DILjRoDj9dnjR7Il+4=
X-Google-Smtp-Source: ABdhPJxHBOL1srZcJoaef5xMRXT6WVyjFck5D/549SCJh9HNpS4piSg0NrzYbaQBEFDx465SlNB8FQ==
X-Received: by 2002:a17:906:f11:: with SMTP id
 z17mr1094726eji.385.1628111691788; 
 Wed, 04 Aug 2021 14:14:51 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id w23sm1370912edx.34.2021.08.04.14.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 14:14:51 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210804083137.483753-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <c8bc5169-9b1e-4bcd-1d11-2f79f1ae447a@mind.be>
Date: Wed, 4 Aug 2021 23:14:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804083137.483753-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/openzwave: fix example build
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



On 04/08/2021 10:31, Fabrice Fontaine wrote:
> -std=c++11 has been wrongly removed from CFLAGS since commit

 D'0h! I actually verified that no other relevant flag than -fPIC was set when I
applied your previous patch, and I did see the -std=c++11, but I read the
"MinOZW" as "MinGW" so I thought it wasn't relevant for us...

 Anyway, applied to master, thanks!

 Regards,
 Arnout

> c5ca521e232eae31276e7a12d17f0cf9d9c0108f resulting in the following
> build failure:
> 
> In file included from /home/buildroot/autobuild/run/instance-1/output-1/build/openzwave-62444b0f979c337d2091d77d89cf63c2ae9775cf/cpp/src/Driver.h:38:0,
>                  from /home/buildroot/autobuild/run/instance-1/output-1/build/openzwave-62444b0f979c337d2091d77d89cf63c2ae9775cf/cpp/src/Manager.h:39,
>                  from Main.cpp:37:
> /home/buildroot/autobuild/run/instance-1/output-1/build/openzwave-62444b0f979c337d2091d77d89cf63c2ae9775cf/cpp/src/Node.h:566:32: error: 'std::shared_ptr' has not been declared
>     void SetProductDetails(std::shared_ptr<Internal::ProductDescriptor> product);
>                                 ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a7999ffe3b93391b9a20dcfa3ddd9d21daf0cace
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openzwave/openzwave.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
> index 0f639635dd..17da3b9b87 100644
> --- a/package/openzwave/openzwave.mk
> +++ b/package/openzwave/openzwave.mk
> @@ -31,8 +31,8 @@ OPENZWAVE_MAKE_OPTS = \
>  	pkgconfigdir=/usr/lib/pkgconfig \
>  	sysconfdir=/etc/openzwave \
>  	DOXYGEN= \
> -	DEBUG_CFLAGS="-fPIC" \
> -	RELEASE_CFLAGS="-fPIC" \
> +	DEBUG_CFLAGS="-fPIC -std=c++11" \
> +	RELEASE_CFLAGS="-fPIC -std=c++11" \
>  	USE_BI_TXML=0
>  
>  ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
