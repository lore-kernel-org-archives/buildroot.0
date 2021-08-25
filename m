Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50050C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:48:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E78F7610D0
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E78F7610D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF3E0400EE;
	Wed, 25 Aug 2021 19:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lcgrj6_Syc2x; Wed, 25 Aug 2021 19:48:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DB53401B4;
	Wed, 25 Aug 2021 19:48:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2140C1BF588
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1024040113
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EQpCM7Xt5nGK for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 19:47:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11D59400EE
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 19:47:58 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z10so815921edb.6
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 12:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C0MuJ7/GYbKwRKBkTM4IF9I1C7zP8f0/N0DlDUB3aVs=;
 b=P+BUz0ECDxfHKvPcxidShGJQz3fO45hNMP9Ohc/3f78KTIrZ1+a4mN2RablsIVnPyW
 43R4AgJ/Ojj0XkP5DemGJDxaNghdIxj1NDQG4J8MV9cXdbNvp9WPznW4kJjSN62SobZN
 v+kVH95IAO/nF+KrcLitKODGQJkGKPQ1IhoRzdxEfvGwLSA5Ah2KB5PdSuAGZEYFCSie
 pU7oHys/TSMYfiDJu6NuWBUGyHIwccy6/+KkHn6xpWfzk3xUhl+Ep2r3PIciS6PgZoAN
 FPBO+zDdcgwOM+O+kedBCXcXEu5zOnfjriqhANYTu1bSOgc3TeDnL8IUPN9n8oDSXPaL
 OtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=C0MuJ7/GYbKwRKBkTM4IF9I1C7zP8f0/N0DlDUB3aVs=;
 b=CAs2aoFEnmMj9anZqmX4ZxMYdrlvID2fuNRV/62Ll/pMkec/yZ5g/0q1Hou14olEjh
 Iz/ihR2T1uvH6yOVLu2Yy8L0+nBuH3KAYktT8/PaOxEZD/cb8ExrduPGDQdUISgIdVZm
 oKJu9ptP8Q1X9utJ2WDGgAZ7GJIl9Ima804PKKJxln7NbBC84Awrrg70Bfdw+ESAoOaQ
 9+4YyTToBYzYIL7UddLkgj/IKjqlN7YbD4F/Sa+OGmyiu6v86C7vVZSCCk0JzpB/V2D0
 3x+llgUyhpTwbM2BPtZ9N+WdwQWql5pT3kYb5EK2sQyuTFOAYGS30sGNyMzjg9Ui52q5
 L9iw==
X-Gm-Message-State: AOAM530YH/5baFh8JHKp3gVpPL5fMTP74pC7H3F/v2I0N308GuK7fNeL
 JPHJ2esnhw28aSFP9tswX8KLKaXGIdXOzw==
X-Google-Smtp-Source: ABdhPJzpXIrwlGkdUv0in8VRAd6k0MuICbnoYoIsM7tgUI143CwmhSMDqDFolQulyKZ/98wtA+TLaA==
X-Received: by 2002:a50:cc08:: with SMTP id m8mr247267edi.60.1629920877123;
 Wed, 25 Aug 2021 12:47:57 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r28sm510412eda.84.2021.08.25.12.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 12:47:56 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210824193904.127514-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <1f258481-a663-4660-acd2-9d02680257e7@mind.be>
Date: Wed, 25 Aug 2021 21:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824193904.127514-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/belle-sip: add
 BELLE_SIP_CPE_ID_VENDOR
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



On 24/08/2021 21:39, Fabrice Fontaine wrote:
> cpe:2.3:a:linphone:belle-sip is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alinphone%3Abelle-sip
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/belle-sip/belle-sip.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/belle-sip/belle-sip.mk b/package/belle-sip/belle-sip.mk
> index 23b60e51f5..11b96f3fd9 100644
> --- a/package/belle-sip/belle-sip.mk
> +++ b/package/belle-sip/belle-sip.mk
> @@ -9,6 +9,7 @@ BELLE_SIP_SITE = \
>  	https://gitlab.linphone.org/BC/public/belle-sip/-/archive/$(BELLE_SIP_VERSION)
>  BELLE_SIP_LICENSE = GPL-3.0+
>  BELLE_SIP_LICENSE_FILES = LICENSE.txt
> +BELLE_SIP_CPE_ID_VENDOR = linphone
>  BELLE_SIP_INSTALL_STAGING = YES
>  BELLE_SIP_DEPENDENCIES = \
>  	bctoolbox \
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
