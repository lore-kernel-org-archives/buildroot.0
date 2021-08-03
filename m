Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61864C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:24:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9DD60187
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD9DD60187
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6F6782EA2;
	Tue,  3 Aug 2021 23:24:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GS7lyqc75iyG; Tue,  3 Aug 2021 23:24:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0569B82CFA;
	Tue,  3 Aug 2021 23:24:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A42F81BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9453B6067E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OmxcHfJcWFYa for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:15:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8660F60653
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:15:29 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id yk17so534618ejb.11
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 14:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=grQNAwd11nei/CpbKJi9DD6vMzHDaBczOQF2wLhCjWc=;
 b=PTqm/XzoEGAYd4KkgFBTUTMHrQ80gshGJAuKRGT08gs+Sro6eOuUUsqGW0vg9ccEod
 buKvaQukAoHbP9humdyqO0PN7f4OK2WmP+LePLh3kIuK1ZmVtMX12t9OmAFSpxmZCMNS
 mgY8MVuLCLi2c9pQJVe9YIySl8C+kREdBxJfLflV1xrzdkZ9IoN4xdMLujSS+XCJE04K
 p4Pphuo11Dl1pxJF1u1Nx6PMyhVd9ogtAblJew4qlJegM146Ry+JM9C+WMypdK7oS/DQ
 N2/nvWSltf4me/su+ufg7XO6SqcsKq9L5+18UHBEmV877NuujHGmM2CWeRBW1iicwxaD
 StaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=grQNAwd11nei/CpbKJi9DD6vMzHDaBczOQF2wLhCjWc=;
 b=DuOZ6IGePQ54jUfr9La/IDVBUkS3+EkZeWQ6V/doyesZTydB3plhAwSd96pnu+CZah
 AJQErDyt9ndMzASDume4eVBgAi+KjXXULvhKRfS0k7UNNQlA4fky4Ih365pMribJ5N6E
 cW2VeKVPT5IdWj/ohpUtwoBqayvC4IstfZQQIJxE+drHflevPhq6fuRriUr2g1tAo3I4
 1GqsXmpm53DoVHRRTTAM20boFgYLX2i3xDavktJVoP3yBinxrrHdcQe1HRYYa34umBqi
 5KJkXolXMNPkffYAQJh/iwd7xFnVHqOPerM6AnVQ5XMzjD8X83jc7SPA7sa0AIIV+N7j
 WpUw==
X-Gm-Message-State: AOAM530EkEP0z0ly60w++QbqRCmiOjujVqH+lV/u2RMDeXE1J2ooUKYr
 AVurAvmkGn7rVj28sko6HO+hmPtYTECgD+B3MU0=
X-Google-Smtp-Source: ABdhPJx9hdC1OcMzMop3yIrfO6BxYZBMtA5GzObDq3oCziWn2dJcl/b55Bvt0CWJwgPu/Qyfv311+w==
X-Received: by 2002:a17:906:6dcb:: with SMTP id
 j11mr22404056ejt.202.1628025327811; 
 Tue, 03 Aug 2021 14:15:27 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id cr9sm58650edb.17.2021.08.03.14.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 14:15:27 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210802204400.1597406-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <2f6234dc-96f9-f54a-58fc-0f8f61a3ebf0@mind.be>
Date: Tue, 3 Aug 2021 23:15:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802204400.1597406-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/openzwave: set back -fPIC
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



On 02/08/2021 22:44, Fabrice Fontaine wrote:
> Set back -fPIC in CFLAGS which was wrongly removed as a side effect of
> commit c5ca521e232eae31276e7a12d17f0cf9d9c0108f

 That commit also removes -DSYSCONFDIR="\"$(PREFIX)/etc/openzwave/\"". Turns out
that's fine, so I added an explanation why to the commit message.

 Applied to master, thanks.

 Regards,
 Arnout


> 
> Fixes:
>  - http://autobuild.buildroot.org/results/161f53574697016ab8bdb91aaaf4a2be5410ebb0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openzwave/openzwave.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
> index 9c28c0a13b..0f639635dd 100644
> --- a/package/openzwave/openzwave.mk
> +++ b/package/openzwave/openzwave.mk
> @@ -23,7 +23,7 @@ OPENZWAVE_INSTALL_STAGING = YES
>  # the correct directory otherwise openzwave will install configuration files in
>  # $(PREFIX)/etc/openzwave.
>  # Disable doxygen documentation.
> -# Set {DEBUG,RELEASE}_CFLAGS to an empty value to remove -Werror.
> +# Set {DEBUG,RELEASE}_CFLAGS to remove -Werror.
>  OPENZWAVE_MAKE_OPTS = \
>  	CROSS_COMPILE="$(TARGET_CROSS)" \
>  	PREFIX=/usr \
> @@ -31,8 +31,8 @@ OPENZWAVE_MAKE_OPTS = \
>  	pkgconfigdir=/usr/lib/pkgconfig \
>  	sysconfdir=/etc/openzwave \
>  	DOXYGEN= \
> -	DEBUG_CFLAGS= \
> -	RELEASE_CFLAGS= \
> +	DEBUG_CFLAGS="-fPIC" \
> +	RELEASE_CFLAGS="-fPIC" \
>  	USE_BI_TXML=0
>  
>  ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
