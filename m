Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9310C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:12:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6BE961151
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6BE961151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41E3A84026;
	Wed,  6 Oct 2021 19:12:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ES0vX9av-MXC; Wed,  6 Oct 2021 19:12:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 976E084028;
	Wed,  6 Oct 2021 19:12:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4841D1BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3843E84028
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39eciysitkPt for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:12:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6559F84026
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:12:41 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id dj4so13734488edb.5
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+TJnw/QVVb+8s21IbUN6IZvHJZ0Xn8RmEfRSTLNIMjk=;
 b=EaDhgfY7Z4KpoEn/jn8P/lG75Q7qRJZWvJmbs60Mc9fV4ByAx1friWJc2yJXP2Reb6
 hsURxH1EIIFLGq7i+rF+ak3B6xQMmZKticLEUN60xxctY+m5wPXnERAAStlo4YZ/bv7X
 di41wW0SnCcGStemWczNMTjgQ6ms2YJV7t2aBJCsbkP08PrYdoGgMiyeYN4ec4Rm1rQx
 YYqITq1knqjZBpWvEBXGAIdwriOoo/xQ4+18UL6Tv7dYi9O4sq84noqf9zawJOYJz3G2
 Rn4IN3MpkAXMx8KAEl6l59qA2F2xGU2udQwDS3JUv8Hc2HK+Xsb9atikIVzh5qLaYY72
 Qx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+TJnw/QVVb+8s21IbUN6IZvHJZ0Xn8RmEfRSTLNIMjk=;
 b=EQyJBdoeSh1Km125SbsHLa79W9VZa1LJHeR2jPtRhY0me1jj0OKzja9zXQ0LuYpn1B
 FR3F0o+JG/Eyts/+ZlVPqGlVjokTM9DkVqQ1tuf7DSM2t0v5fi5JjlJwrmm/TsQnideB
 QEGnifz/Rd3V5VM9dAu39/SnpS5Zs6zy18ZHDYp2Dj6K+eMHspy5Tv/mBDoEsT5qyds0
 QjZ5lCpAbJ61UZeWWOaXWMl/ycCS8JK1V5pWNCyIIKg5XM3FvegH9IieRS23bhCIGOWy
 cbTIGvFGhVSDDy/d324eXj2+KTcxiT4hR+tr9Wu67sBBbsQpMZOtkzVgM8CByxgqDEuS
 Mb1Q==
X-Gm-Message-State: AOAM532mH2uPS6HhGDkF7e8ufMBNbD1azHoei/LjYj0+bPRGax4Sy2LV
 42RQ2VtQrtn1drHf9SFOFzrHoA==
X-Google-Smtp-Source: ABdhPJyRSHPv4QkgCSn365U5cXU3TJIk7VD/kUlYfxwA0oQIaNvpxNxddfiVGgEFwRbR/zkadyXLtg==
X-Received: by 2002:a05:6402:5203:: with SMTP id
 s3mr9410009edd.250.1633547559478; 
 Wed, 06 Oct 2021 12:12:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j16sm10649707edw.23.2021.10.06.12.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 12:12:38 -0700 (PDT)
Message-ID: <6c16498a-c426-c0a3-f1e0-050a402291cd@mind.be>
Date: Wed, 6 Oct 2021 21:12:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210924105340.3514180-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210924105340.3514180-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: add option to enable
 media-stream
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/09/2021 12:53, James Hilliard wrote:
> This has a compile time dependency on gst1-plugins-bad due to
> the codecparsers dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  As James mentioned, the current situation already is that wpewebkit is 
compiled without mediastream support. So although this is not a perfect 
solution, it's at least a step forward.

  Regards,
  Arnout

> ---
>   package/wpewebkit/Config.in    | 6 ++++++
>   package/wpewebkit/wpewebkit.mk | 7 +++++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index 04b2bf3beb..df1c900d9f 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -105,6 +105,12 @@ config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
>   	  This option pulls in all of the required dependencies
>   	  to enable multimedia (video/audio) support.
>   
> +config BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM
> +	bool "media-stream support"
> +	depends on BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
> +	help
> +	  This option enables media-stream support.
> +
>   if BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
>   
>   config BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index 5c5e6625f8..9ad569a472 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -46,6 +46,13 @@ WPEWEBKIT_CONF_OPTS += \
>   	-DENABLE_WEB_AUDIO=OFF
>   endif
>   
> +ifeq ($(BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM),y)
> +WPEWEBKIT_CONF_OPTS += -DENABLE_MEDIA_STREAM=ON
> +WPEWEBKIT_DEPENDENCIES += gst1-plugins-bad
> +else
> +WPEWEBKIT_CONF_OPTS += -DENABLE_MEDIA_STREAM=OFF
> +endif
> +
>   ifeq ($(BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL),y)
>   WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
>   else
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
