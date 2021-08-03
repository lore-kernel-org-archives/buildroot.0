Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57EFC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:20:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67FCC600D4
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67FCC600D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4285E404F4;
	Wed,  4 Aug 2021 01:20:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QIflk7s3QvZr; Wed,  4 Aug 2021 01:20:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90DF1424D7;
	Wed,  4 Aug 2021 01:20:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 060151BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 030BA405C6
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xL7LXBMmhyaI for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:48:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55099405BF
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:48:03 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b7so947397edu.3
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 14:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UrNZqcQlIvNxn16tI2tlAy+c06VLyaUjnHHoMz8hndY=;
 b=PRH5iR523jscOilvMyxt1qE4ucsHhrTUNVmED1HNOnHx+TbPEaRJdvL5rnFUcotEcu
 DU0JfZlvSicPFB4HxQGS450MhpkkLmeX1Zfp1VUf2t9S5YIJy1bqDN84rYjFd/wfZSkj
 lG8ykky3+89YZ2N+F7D4jwXCDSvtEZ4zwZ6M5Ys40gGeTY2Ky6UTZ9wYrWEin/glTSLG
 xQisfhOWhOOHrhpAKUEAIEeR2aQsei23szRKH9VaNXDNFfBU97u6GkXA7EkBROgxJ+w/
 Fe/iGxWyfVrHMXOw0WdHLNg8FE2Sz5R1TLSR9nt1yS+xE2dXwZP9Bp61cXKiU8exk1le
 fU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UrNZqcQlIvNxn16tI2tlAy+c06VLyaUjnHHoMz8hndY=;
 b=rEoBGXDBlAC8bUd+xD6rJ4PGJDi2t5tLjTPgl7X7MBKTNbfVi9ti+jjI4oFB/eRGeD
 YOplZAliV9D0veYEU9ylsDxN9CHkEES4FE7aIuf3Faso0oSfLGW+7m/ZSJYlHvZHyM33
 LEO0N6rxK2BY/VBLH37QPPebcGcSpPPGyZuVYc5sTrIiZMbVzroHFNn25lEOoH+Y0doO
 AzlL3VJAmqjsiAUOwMTd9fcJbNACGJ6Ojy1/1fWJW/aj8cF+8HUhR5tvYQOG93UVqRnh
 GIKYNhjCL65ssu4B7U8IBVw6/6sHtTK4WRL9e28biLNEy8Z+Jdx4HnAvEFZOBNA33m1/
 cmFA==
X-Gm-Message-State: AOAM5305cvVzu9dhFnICKM35VBgWDI1FEuBkdmLZu24V/aXRB8aoKc0H
 P9NY6hPOmoc8ehXEnEAvWiQLtw==
X-Google-Smtp-Source: ABdhPJyB6ApQmGkclv+mZ+yOyo7Xn3rfEAQv2aO67QZXww/Cdy90v9p1YGuvJO2KpKGquh0jQabptA==
X-Received: by 2002:aa7:dbc8:: with SMTP id v8mr27452949edt.242.1628027281561; 
 Tue, 03 Aug 2021 14:48:01 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id c6sm87849ede.48.2021.08.03.14.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 14:48:01 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210803135447.32589-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a38a761e-8060-2ffd-12a0-f3913ee55985@mind.be>
Date: Tue, 3 Aug 2021 23:48:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803135447.32589-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/libodb-boost: fix build with
 gcc 11
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 15:54, Fabrice Fontaine wrote:
> Fixes:
>  - No autobuilder failures yet
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 I accidentally applied this to master after all :-) Oh well, it'll probably be OK.

 Regards,
 Arnout

> ---
>  package/libodb-boost/libodb-boost.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libodb-boost/libodb-boost.mk b/package/libodb-boost/libodb-boost.mk
> index 679c9d7a38..bac5f1e78f 100644
> --- a/package/libodb-boost/libodb-boost.mk
> +++ b/package/libodb-boost/libodb-boost.mk
> @@ -12,5 +12,6 @@ LIBODB_BOOST_INSTALL_STAGING = YES
>  LIBODB_BOOST_LICENSE = GPL-2.0
>  LIBODB_BOOST_LICENSE_FILES = LICENSE
>  LIBODB_BOOST_DEPENDENCIES = boost libodb
> +LIBODB_BOOST_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
>  
>  $(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
