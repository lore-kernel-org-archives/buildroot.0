Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B22FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:42:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF39E61037
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF39E61037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A947183DF8;
	Tue,  3 Aug 2021 23:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SAmhK79_jcl2; Tue,  3 Aug 2021 23:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB30983E81;
	Tue,  3 Aug 2021 23:42:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E827B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D82D36067E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSYSvmpW3LJK for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:17:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0CBF60662
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:17:12 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id hw6so551302ejc.10
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 14:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hxV2sXLIRjzF7W/XfwIYQ1rjv4IiK8R+XIDSVJbu+90=;
 b=Hm/+46bIYzNlw7kirINjf2KGGZojN+gcdGxqGq9gmCiDKS+jCWkGg5JKujtgNaSkbF
 EMBZcO013zxZyDprQb0bD9ET7fgB45WR9NquZYJk24a8KfiedwwsvUfQ+d31e3uhNdwl
 HgbzszC+VO5QakmJ2S9Lou0yOS8U38lRoteULdZcG2nH5FDi9alrUthZoHBAZGwVvcRW
 fiXtiTfhdliwTmfZBBKojPL8qf/pGn+q55HPL+SVf2Hu3NiiIjtaGwglylIFsjmWCtmM
 fbk6V1Bwl2nQW5iyPQqkJ0BBI9e8bgw+9ZqdX4zkejEBhIhuQBnUj71ydiOgPX72y0XV
 hEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hxV2sXLIRjzF7W/XfwIYQ1rjv4IiK8R+XIDSVJbu+90=;
 b=WGGp7f99m0V3etHQ5zza+TvQj/T8+WjH5Yn19ttNTQz9WwuY0HhkxuNLjCqIC7FbO4
 F0Eno4CGyyRGbItyn8lrkckc+twU23q0ackNlIhPs3q5XJhjdt2AYGF81BtaR3IQIFDE
 nGu+goJjuavSjx1uohUnfDyJsG06tV0UnYDFFbI+gn4bD+r1LsTzqREhXOpHpeksA8B7
 Wg+d/SxJH3F4htIIXiah4girtKtoKTEUbSHWHZ36b8sutV3yU6WshjGQQh/xrSOsGbXe
 NgXt0v9bMF+u+jE2mFYH/4pYncEXiXzETKXcHmooEsYxDAU8Zc10tGrSau+F7F0dtYLh
 pYXA==
X-Gm-Message-State: AOAM530Ati8p6zpV9quNz1bJjIGDLYEOxaUz2E0eXV8AkdMbO1CFGrkt
 wF0ScPSP5qRmcW4xyF2qDxrKYiAV9jwMBB55WIs=
X-Google-Smtp-Source: ABdhPJyEKpSuAEqghSWmo8QRMQ+Znu11wfQnkMnfAEPZ4KOCDTlJ9tdVWPxr3ugNlHKUbZFiBRFzhQ==
X-Received: by 2002:a17:906:7393:: with SMTP id
 f19mr23574631ejl.79.1628025431087; 
 Tue, 03 Aug 2021 14:17:11 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id d2sm22150ejo.13.2021.08.03.14.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 14:17:10 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210803084503.2445206-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <c5aacf60-18ac-4377-3121-f50d9028a54e@mind.be>
Date: Tue, 3 Aug 2021 23:17:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803084503.2445206-1-james.hilliard1@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: add libdrm dependency
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



On 03/08/2021 10:45, James Hilliard wrote:
> The libcamera option requires libdrm, require and depend on it
> when available for libcamera plugin.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/e3bc1d9aa69af1d2cdeee7709df318fccbaa5476
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/pipewire/pipewire.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index b316d482d9..2317398088 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -95,9 +95,9 @@ else
>  PIPEWIRE_CONF_OPTS += -Dv4l2=disabled
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LIBCAMERA)$(BR2_PACKAGE_HAS_UDEV),yy)
> +ifeq ($(BR2_PACKAGE_LIBCAMERA)$(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_HAS_UDEV),yyy)
>  PIPEWIRE_CONF_OPTS += -Dlibcamera=enabled
> -PIPEWIRE_DEPENDENCIES += libcamera
> +PIPEWIRE_DEPENDENCIES += libcamera libdrm
>  else
>  PIPEWIRE_CONF_OPTS += -Dlibcamera=disabled
>  endif
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
