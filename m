Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D8FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:15:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 791DD61264
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 791DD61264
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4849E60792;
	Tue, 21 Sep 2021 19:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U4Cy-vlHxj6M; Tue, 21 Sep 2021 19:15:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90B9860877;
	Tue, 21 Sep 2021 19:15:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 530CC1BF578
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4292840554
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bk9i6zwebotL for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:15:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D75840517
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:15:18 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id v22so296992edd.11
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 12:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=6RtJia18lHBCXgbRFgYsV0DwUtnZ0sK/aRun9gpJhWA=;
 b=Kglk+TDFabv9Glb7oTo/zMOLn5oUrPIFvHHTGkOHtorsZqcl2GHFdvlcLPG/4E/Yt5
 ZAvQhhFmiUyCnLQusjQ9TtcqPE0JsduG9zmAb/+1H/hFzsPnlEYLkkBWvncLlI4Ngeem
 WCMOlN3sDO+XmFHB5vcx44n0BTTVa7CTFmyhL43SFcpxcvnzdUQOlOyCMHXHXA+vwNBl
 IZzfknPAadCrmtW3V59SsyVolENFA6t5ibZ9HBIDpXVGDtg17AnDq2QUnQ2dxDRG2v/A
 MiUkACWqiDHjeOgN90KVZZnua/G3UB4qkD1d0AzftAwsL0lSngiCSPKN8fmHBUCnaunX
 f3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6RtJia18lHBCXgbRFgYsV0DwUtnZ0sK/aRun9gpJhWA=;
 b=xi1u5abNPWu20rUzz58P+DrGpinCG0rYMNGbil69ZSuUdULxAOQf8qjqMuubjI3N0j
 HXMaN/JKK8tHxy5jyGXhFM7ExJen2YABXDRjiedd9AhEhrp1VONC+EM5zoGjrdyREU+r
 THnOYwC3lc7g/8Mvca4f+6UmQ29HsgFBWBUgPWUU71gsNFlJrtuIc9oWI81gVDrKQD76
 kajYfFfkMhdYx5zVJbzAiflsiEf1cMfnG+3n8n0CMVuVDtWVIyg5e5USV4YxEZWu7406
 P+loer3Hf1z69DxeklTl2wW5gYphcFuZ3c8lPy6AHFxZ8OQ3vo1Jpa6rQC736YYny6xx
 ERqA==
X-Gm-Message-State: AOAM531h4A7ugYn3ynxlrC+Zxo3NFipk568zkNNyoP9RYVtu6Nqf8rx8
 SHqPvoOXnqsAD2IGUTyXLukJ1w==
X-Google-Smtp-Source: ABdhPJy4RjomQ6rOqV8V60gy4O4cyVRQK6p8qmxzEbpox5QLOj8xyumkppzfQjbF+MD7NTUh7OYQoA==
X-Received: by 2002:aa7:c988:: with SMTP id c8mr37409496edt.105.1632251716538; 
 Tue, 21 Sep 2021 12:15:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d22sm8184201ejj.47.2021.09.21.12.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 12:15:15 -0700 (PDT)
Message-ID: <d384dc63-4f9c-cc35-3a84-55e87a098322@mind.be>
Date: Tue, 21 Sep 2021 21:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210909224121.2327470-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210909224121.2327470-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pipewire: install systemd
 services when using systemd
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 10/09/2021 00:41, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>    - Install user for service

  I added a blurb about the user (in particular, mentioning that it should also 
be used in the non-systemd case), and applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pipewire/pipewire.mk | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index 2317398088..7ae9673cae 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -43,10 +43,16 @@ PIPEWIRE_CONF_OPTS += -Dgstreamer=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> -PIPEWIRE_CONF_OPTS += -Dsystemd=enabled
> +PIPEWIRE_CONF_OPTS += \
> +	-Dsystemd=enabled \
> +	-Dsystemd-system-service=enabled \
> +	-Dsystemd-user-service=enabled
>   PIPEWIRE_DEPENDENCIES += systemd
>   else
> -PIPEWIRE_CONF_OPTS += -Dsystemd=disabled
> +PIPEWIRE_CONF_OPTS += \
> +	-Dsystemd=disabled \
> +	-Dsystemd-system-service=disabled \
> +	-Dsystemd-user-service=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
> @@ -144,4 +150,8 @@ else
>   PIPEWIRE_CONF_OPTS += -Decho-cancel-webrtc=disabled
>   endif
>   
> +define PIPEWIRE_USERS
> +	pipewire -1 pipewire -1 * - - - PipeWire System Daemon
> +endef
> +
>   $(eval $(meson-package))
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
