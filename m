Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0DAC433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 21:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8B3B607BB;
	Mon, 22 Nov 2021 21:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hineAramBR87; Mon, 22 Nov 2021 21:35:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D487160758;
	Mon, 22 Nov 2021 21:35:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF0961BF82C
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 21:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD3774049F
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 21:35:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rnfKmrM4zPcW for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 21:35:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60089404BD
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 21:35:21 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id x15so82551647edv.1
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 13:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=baI+fo7y/vjEdWor2GI9+HLzwREtTtMcWUzMCHiz8K0=;
 b=EXYHnkyeJjUmNh+wb0byTF2f2ddalcw90zzv0dYx7Xu/JsinsCfgv2JolkcXTSajZQ
 siFLYY6v976qqWMgZZFEko4FP5snW1OdQ2AUOoQ9HrAibohPN63Nk7Ck7m9CyFEipMLM
 U4EK4uwm1N76VDkfuhs4sHoVNdu5fRTjIpxa6vak4XmXIG3/qEmc81oJgb7CbkqBfNva
 3nJgYcXeYmxasKpcqlxgI+YFJvINavBTTIoBkRq5fbxD1Xa765JmAdX1fTzifEXKT8JY
 fizGO/4534QiEbI6ryQbuplPQi1dYOwPJ8pM/JWP1SjPvfXLv33pqF/cEwu43fkYjUGf
 DqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=baI+fo7y/vjEdWor2GI9+HLzwREtTtMcWUzMCHiz8K0=;
 b=iSjfhW5Z5HA+r7TSNRdV0zG3FiRI+A9OUSxiCEa/5m56ZFfFNXsgmmvnpKnvUjUBv2
 OMhkJjlbCGLnoYK2eLdI79Er//KO01AzDZcplYQI0u5tqC/zgSCOXsRl88OOQbIGORGf
 AAJbWCq+amFRpIFhaP9etiDUWison3SS0I0H6SsuzWBj6mzdxsPDfSwRIowbKl4O2JLQ
 qujLmTrwZIkb9R9PJUuCf14mihA5806sL+4PsY2Sokxeqsa8KPS3Rir+oO5J7eERue9Y
 xqvGNXS9+PWGf0XwDm9apIsvOYNBAFSTwiqs82LF5C89RUQRl8WWFcSpRQL6xKNn4SoF
 VsVg==
X-Gm-Message-State: AOAM530u34szzMnWyZuCBcY9XybB5CY+dxDLl2futUTZW2LWu0I7TImB
 3Xx17dfxfe/EeQFtHAmhiNmmUw==
X-Google-Smtp-Source: ABdhPJwFVQMDQGYprPmJT/RXwB8R2DjL+Mig6wycdEXA49LxmPXG8ALsCbbcmSpvKEWZ6X0GPmRAGw==
X-Received: by 2002:a17:906:90da:: with SMTP id
 v26mr523701ejw.442.1637616919480; 
 Mon, 22 Nov 2021 13:35:19 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hg19sm4233743ejc.1.2021.11.22.13.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 13:35:19 -0800 (PST)
Message-ID: <f69f2d5d-57ac-3ec1-1fd8-9d3c3b44987b@mind.be>
Date: Mon, 22 Nov 2021 22:35:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211104003607.2022984-1-aduskett@gmail.com>
 <20211104003607.2022984-2-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211104003607.2022984-2-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH vRFC 1/4] package/gcr/gcr.mk: enable gtk
 backend for wayland
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/11/2021 01:36, Adam Duskett wrote:
> gcr has supported wayland since commit
> 685e1da9642b7a3fb0dbe1afda482f7bd5b05f33.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
>   package/gcr/gcr.mk | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
> index d51e853f3f..ef253b4ef9 100644
> --- a/package/gcr/gcr.mk
> +++ b/package/gcr/gcr.mk
> @@ -30,10 +30,12 @@ else
>   GCR_CONF_OPTS += -Dintrospection=false
>   endif
>   
> -# Only the X11 backend is supported for the simple GUI
>   ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
>   GCR_DEPENDENCIES += libgtk3
>   GCR_CONF_OPTS += -Dgtk=true
> +else ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
> +GCR_DEPENDENCIES += libgtk3
> +GCR_CONF_OPTS += -Dgtk=true
>   else
>   GCR_CONF_OPTS += -Dgtk=false
>   endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
