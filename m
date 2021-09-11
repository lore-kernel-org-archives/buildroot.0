Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09F6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:52:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 209276109F
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 209276109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE5FD400E8;
	Sat, 11 Sep 2021 14:52:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10gUyKwovMUo; Sat, 11 Sep 2021 14:52:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E915D40142;
	Sat, 11 Sep 2021 14:52:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE8C91BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC700400E8
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ax0KONqp0g0w for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:52:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C12A40142
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:52:12 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id s25so7059542edw.0
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U3GBCGeAd7EJaQJiovH0Ll8WJBrTHXq5hYKHMCBvvHE=;
 b=e1ua3F8w7Ls0XoetqotTS5bkO3BCsFVI3zgXmFEWVhsKDypyrRqst1b8dTAxqn6owy
 ReyJQLOrohmeOuQeFItTDYPHn9ejgj4AZ6OPOH9SdAtoKS9nJ7bAE4hAhOya68wAac4Y
 kzu0VncyAWG+JMgxiE7wm4qCc0fCoe8c2vH8Iwhq4q9tpAnKExqixZxGeSB9I0uIREat
 uma6/dpRH40s4V1XQlSTHUaGiQ57ZTtbT15Dg7vokjot10MkSZXTCedXPuISvqmG12ur
 5zV+fRNB4/2rEbuCKGTV39SiZ1bMqsT3cifoO9LC0Va1+1uJ9tjbiKIP+Zqzfj8lI3+9
 WZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=U3GBCGeAd7EJaQJiovH0Ll8WJBrTHXq5hYKHMCBvvHE=;
 b=h/VSgCV59jml7dUbPCWzb1Ew/vWF3Yf88JoMgAldfvFRnRE+XwCi+3rFPtsF18b03F
 ViyzSUJi8XGbDmIJ4lKmi+JgVcP8Z+q82mDouc0SLk+XMVrsKP1NRfLuczbFnle/7tT2
 dsUGNCOAr40tr+e/bzSCaAcK3jxgloALkMzAyCbGJg7h8I1igKNe+lUtkc+qkIQI9Ylt
 3ZhBMLzvosE8x71l3F0oXlMhBpiCqraXX+KvFdtnOhECU+3xUArx1TypmMB/vwLNgvfL
 0z5ogapWleDbJgqs2zobS7hs2F/RJe/oOeN53swChhqhbU4Rnd+u4R3xVgylulSq4Jz1
 J53g==
X-Gm-Message-State: AOAM5308PL3k8BZPLcpVjKJePiijUYV4l7xqKvbM4MRFQvsIlFiBX1Te
 5G74agu8nD716/LhJyUbEr0y4qeKiBz90Q==
X-Google-Smtp-Source: ABdhPJw7hcBpWwMJXV28VtPp6xT+plpnVjWlX7c4wYOtSZUNXn//eVju/yQ5gH8ha8EGXLsXhnOWvQ==
X-Received: by 2002:a50:ae21:: with SMTP id c30mr3703524edd.120.1631371931232; 
 Sat, 11 Sep 2021 07:52:11 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m22sm924776edq.71.2021.09.11.07.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 07:52:10 -0700 (PDT)
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20210902044451.64673-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <fabc97ab-dd72-507c-65ee-ff08234344c2@mind.be>
Date: Sat, 11 Sep 2021 16:52:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902044451.64673-1-bernd.kuhls@t-online.de>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH/next 1/1] package/xmrig: bump version to
 6.15.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 02/09/2021 06:44, Bernd Kuhls wrote:
> Changelog:
> https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/xmrig/xmrig.hash | 2 +-
>  package/xmrig/xmrig.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
> index 0af163de8a..ebe6fe5726 100644
> --- a/package/xmrig/xmrig.hash
> +++ b/package/xmrig/xmrig.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  5342632664a01efc7d512ce404f580d9ee380899afb144b4afc05c43e76cf446  xmrig-6.14.1.tar.gz
> +sha256  155ce4b921839525f03ff7fe3ce9d6ecddf4f2a32cae1b0b83b3808c9db39880  xmrig-6.15.0.tar.gz
>  sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
> diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
> index d04a783254..16471682ca 100644
> --- a/package/xmrig/xmrig.mk
> +++ b/package/xmrig/xmrig.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XMRIG_VERSION = 6.14.1
> +XMRIG_VERSION = 6.15.0
>  XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
>  XMRIG_LICENSE = GPL-3.0+
>  XMRIG_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
