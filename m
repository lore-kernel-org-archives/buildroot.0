Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41279C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:04:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05098610C8
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05098610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC8A640231;
	Wed, 25 Aug 2021 20:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iuHc29dolX_D; Wed, 25 Aug 2021 20:04:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3449040233;
	Wed, 25 Aug 2021 20:04:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 094A51BF335
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED0F960614
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JjCZ4X-7Ax5R for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 20:04:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2417F605FD
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 20:04:41 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id q3so896669edt.5
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 13:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tNoluFaa5BxlJ1/E0JtrWTT3s1B65qqV+7VD0Qyk1AI=;
 b=VOoCVPkvnDNrRcUh3ueEQAxkbQkf7TBAhsmr/HK64NPL+HzK0eJKNvZ9J8nFmohmpL
 xZnn6YtgVVK9fjaCa995iySpEAHiFQgnbP5lHToKBPhx4S0Yvm5fpTk+/3R0UOO4Yvwb
 wxONrGdkndvwUvpYRz2oo2En65+KbnGzd8sCaKFciEhVtLMKZP2vrAO2gk9dAU46P1pZ
 KjmnXLbkOndV/CKPrxjvSBQ3at4Upf/qx3sfwGl/6zYiZaTSSfQKoktM76Djj0f7JBZu
 dYLB2BST2sb5pUx4eQKVyvMl0/YKlyYN68YN/MFVyKep9kxJlYFDAAPF1Gl0x3TOlkAn
 jLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tNoluFaa5BxlJ1/E0JtrWTT3s1B65qqV+7VD0Qyk1AI=;
 b=T6Yma+UuhV2LA/CMqKk33bYFDh4BUVtOS8pV4S+AakROu0gibCzt10nfAQ3cpNP9na
 0QomsZMu2T8alTdIxmKmbrvWARy7Z3bkURGpVXXY2aoBGfq5WlJfFmhntP9ftNG8AvPo
 N7pzZImHn09GKqmrYCPvBInHfAwBrx3dlqlUrgMZVsQb/wJpYMz3Oue7iVNJeN+E5EGh
 4aGuolG3USRt2Rcuzjsk/hgz5FyDYIeemCX+HxNT6o5tgUl03XvEkDh/PRDUDba0Dktp
 E2/ATpMk7WbOExTFHZPjev9002myP4qZdM4G4UeaFOdj/7Zec9LghWCOCDk94D+ntZL5
 tZ9A==
X-Gm-Message-State: AOAM530cUgVP/rQm8jQT/wTPl8w0GG+jtKjBL59/gGKo3QxOGfKxb8yi
 dsL/wQu2HH93OTNUgbzfmkj0LWyhqSEiHw==
X-Google-Smtp-Source: ABdhPJxLLEvM9gF4sXKkBhr3oYFiGSByY2lavpn4jkEA95NE5UHPL85MT+E9LxrJ1yBD6UcLdlUJFg==
X-Received: by 2002:a50:e606:: with SMTP id y6mr303613edm.216.1629921879291;
 Wed, 25 Aug 2021 13:04:39 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b5sm290656ejq.56.2021.08.25.13.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 13:04:38 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20210824215813.1122744-1-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <e1df59fa-b22a-6d65-4aaa-e5213f90e350@mind.be>
Date: Wed, 25 Aug 2021 22:04:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824215813.1122744-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: drop Maxime Hadjinlian
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



On 24/08/2021 23:58, Thomas Petazzoni wrote:
> Maxime has not been contributing to Buildroot for several years, so it
> doesn't make sense to keep him in the DEVELOPERS file and make us
> think that those packages are being maintained and to Cc: him on
> patches affecting those packages.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  DEVELOPERS | 30 ------------------------------
>  1 file changed, 30 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7d2fbf4cf3..53448dd100 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1876,36 +1876,6 @@ F:	package/postgis/
>  F:	package/protozero/
>  F:	package/timescaledb/
>  
> -N:	Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> -F:	package/babeld/
> -F:	package/dante/
> -F:	package/faifa/
> -F:	package/initscripts/
> -F:	package/intel-microcode/
> -F:	package/iucode-tool/
> -F:	package/jasper/
> -F:	package/kodi/
> -F:	package/libass/
> -F:	package/libbluray/
> -F:	package/libcdio/
> -F:	package/libcofi/
> -F:	package/libenca/
> -F:	package/libmodplug/
> -F:	package/libnfs/
> -F:	package/libplist/
> -F:	package/libshairplay/
> -F:	package/linux-zigbee/
> -F:	package/netcat-openbsd/
> -F:	package/open-plc-utils/
> -F:	package/rpi-firmware/
> -F:	package/rpi-userland/
> -F:	package/rtmpdump/
> -F:	package/skeleton/
> -F:	package/systemd/
> -F:	package/systemd-bootchart/
> -F:	package/tinyalsa/
> -F:	package/tinyxml/
> -
>  N:	Michael Durrant <mdurrant@arcturusnetworks.com>
>  F:	board/arcturus/
>  F:	configs/arcturus_ucp1020_defconfig
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
