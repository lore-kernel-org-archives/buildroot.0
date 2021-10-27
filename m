Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDC0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:32:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 832CA60F0F
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 832CA60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5333F81D7C;
	Wed, 27 Oct 2021 20:32:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kiuOdW1QuPFo; Wed, 27 Oct 2021 20:32:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A94D981D65;
	Wed, 27 Oct 2021 20:32:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D8091BF3EB
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89EF480CDA
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qgqe6ZKYTeFf for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:30:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB3BF81D65
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:30:53 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id h7so15861437ede.8
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 13:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wlBCZd0Xh2obNx38Nlp7n2ssCVtI0r3dA2Z79TOXDQE=;
 b=UTS8l3uARHzPHnT6FkVHJ3/3Fz06aTBQkr/6GQ46Dp1g4d9eIsPLs9bBZxxUnT7uv6
 2cuVtlB1dL0NXLCwgaM5Z7iU6+xnZconnYBwlxaVb6WVCW9YQOHbqM8wofC806tOfVPu
 TzjeCBZCZxKaOHl9q+SpeoCJ0PnU2TL/mPOMEkEkRCm/MJaSJf1T4w3NKt31EHu49iXq
 ar7ULb+aaTWDDeCF+M86uMepkTPdnoHvNBdxbNTgo9br6leA6vM1FaFyZC9fpyhMuhOf
 OtJnP2UGCfa+rtyGo5v28bQaDyRxvm6siTRBxkGjubVY2iFNURIp1cgGjj8AjVASfABA
 dr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wlBCZd0Xh2obNx38Nlp7n2ssCVtI0r3dA2Z79TOXDQE=;
 b=qVvSYJ5P0IW4dpoB5Ef5G5yOC3yRfmgzpbiARHWslIU/xsKakY0yRpJV/6E6aUew5b
 P0AtGeAHaaNzEW6iim03SoNe8b15UNvELF7Y7D6RqiTCV+jBSkMZ6741+4YnAC96wkrs
 sfCl3MygBxvPLyV9KuroQKRloS3QcxxtiuRJD3E/AS8Qh5nEYD8LKwksqfdkHgNxzVvJ
 n+d8A6xHCH91Y4Kuuc0KFKTodbNDr8LPem4nnl2XHoRSbz5J5brZd/ehQJpuImr6TKfR
 vS8QVw8k0894xBuqqZZOubroe3aK0uGF/TCHsuIOrMRJaNrcMRLVM/A1686gtnRUYDq3
 u6Hg==
X-Gm-Message-State: AOAM530v94KprMGgTyz5rMIGu1vMK9XNSWKtP9GKAqw2Nz4eY8ppNJrD
 rp/FuOUIE4C3Fw9Wqpbj2nEo3g==
X-Google-Smtp-Source: ABdhPJzwqoiYXI8UkCR5U0viX+5fn9uLYYR1KL9QzS0cckwNJJ+ssrlCJkYkxD1dXZGqxwpRYW2xlA==
X-Received: by 2002:a17:906:4818:: with SMTP id
 w24mr42352983ejq.473.1635366652069; 
 Wed, 27 Oct 2021 13:30:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gb2sm413512ejc.52.2021.10.27.13.30.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 13:30:51 -0700 (PDT)
Message-ID: <fb50f6af-15bc-7b3e-535f-5362d1694b03@mind.be>
Date: Wed, 27 Oct 2021 22:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211025080446.3860462-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025080446.3860462-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libpsl: remove docs config
 option
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



On 25/10/2021 10:04, James Hilliard wrote:
> This option is only available in master and not any release.
> 
> Fixes:
> output/build/libpsl-0.21.1/meson.build:1:0: ERROR: Unknown options: "docs"
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libpsl/libpsl.mk | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/package/libpsl/libpsl.mk b/package/libpsl/libpsl.mk
> index 69e5da4ca4..5dc03a7c24 100644
> --- a/package/libpsl/libpsl.mk
> +++ b/package/libpsl/libpsl.mk
> @@ -10,7 +10,6 @@ LIBPSL_LICENSE = MIT, BSD-3-Clause
>   LIBPSL_LICENSE_FILES = COPYING src/LICENSE.chromium
>   LIBPSL_DEPENDENCIES = host-pkgconf
>   LIBPSL_INSTALL_STAGING = YES
> -LIBPSL_CONF_OPTS = -Ddocs=false
>   
>   # The order of checks is the same as done by libpsl when configured.
>   ifeq ($(BR2_PACKAGE_LIBIDN2)$(BR2_PACKAGE_LIBUNISTRING),yy)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
