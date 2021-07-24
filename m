Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,BITCOIN_SPAM_02,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CE1C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:45:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B45560E8C
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B45560E8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF8B7606A7;
	Sat, 24 Jul 2021 20:45:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ymx9xhfmyyvp; Sat, 24 Jul 2021 20:45:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27D2460636;
	Sat, 24 Jul 2021 20:45:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 126511BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EE2D400EA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c39GIP_yFuU4 for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:45:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07DCD400BE
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:45:28 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id hb6so9094543ejc.8
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 13:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LOdo7NBApPl/xwtzjYjY0Rx3DeG+XzMb83OrjMn6ndY=;
 b=KWR3r9uvfAdejxaIfo5Ka7I2zs4bhBVWN1GSIS/f6w/xGXXgRfhpI6gMXRx3zYeZlH
 eTmORWC6ef9tG6DjWlX88uzwXpl5o/omM0nq/I2qLz/ufmKxBghAETohiLaYGIKaBl0Z
 hxTwU+vUyEqMPNVeSJFpq/fmv8cO12sEnHAO5I/+5Wph4cXKDdO+BIkqEltul7x8NkV3
 YRNPu2IJnF257rnCHYCIjF3on74LwFNLFTXZYkJCvYTZRhJp7+494e68HlGa6nVXiXjz
 6KWh+IIys/jfWp1iN9iLpqlRSPH0NYU0Yf3cFkfcldX7+2kTCqRCTLONYQFTiIz3E8yz
 OA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LOdo7NBApPl/xwtzjYjY0Rx3DeG+XzMb83OrjMn6ndY=;
 b=U+0LbzOiUzrKZPEGFP6COliMhOj2NHCdLohk9v89Co2adjKPiVUOMRnOJga6jIaYK2
 abZZCTFSEsXAhKPi+2f9fYjVMBmayNP8hDVYKGVuK4XFt84Brh7BZyC72GvwYWwgJH2K
 zwvAS5xjYFP/dodxAt+h37REQjR7y0h6cXUAv0PdsSMOmOT8vU3Iy4HqdN3pe75zmZir
 XatNo5YV+jq5pK3+xLnFhcMd0ZiFw6ShvWWd/yZVr9pXi9nO+QRU2HCZTCZCuSMpzL+J
 j+02n/IpBNG41yfWLTuyTLQr7ITfIjkch9CskaCmnfxqjtl4ocp62ilo9N47kmFDcuc7
 w8xA==
X-Gm-Message-State: AOAM5301dc2eCchciR8Q53HKliw4tHGo6YX9/LrUojWi1JKk/Mc8oKXb
 OPRbQVYlMdjkiSFvJE3R/2ieSXKPEsS3uAIU
X-Google-Smtp-Source: ABdhPJy+4B3Ilmt3BqJN+q1PHQUTXwv9St8xYnq7VL24879GRWxoCVJo131jc0VPDxjcj8vgc2KHJQ==
X-Received: by 2002:a17:907:75d2:: with SMTP id
 jl18mr10138715ejc.238.1627159527232; 
 Sat, 24 Jul 2021 13:45:27 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ce21sm12906866ejc.25.2021.07.24.13.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jul 2021 13:45:26 -0700 (PDT)
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20210701051142.85616-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <21a6aadc-fe7e-bf7c-a72d-b70db50fddca@mind.be>
Date: Sat, 24 Jul 2021 22:45:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701051142.85616-1-bernd.kuhls@t-online.de>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/libglu: bump version to 9.0.2
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



On 01/07/2021 07:11, Bernd Kuhls wrote:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2021-June/000634.html
> 
> Removed md5 & sha1 hashes not provided by upstream anymore.
> 
> Updated license hash due to upstream commit:
> https://cgit.freedesktop.org/mesa/glu/commit/?id=a172e0aec8f537f365078dab5486cae9c9a6880e
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/libglu/libglu.hash | 10 ++++------
>  package/libglu/libglu.mk   |  2 +-
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/package/libglu/libglu.hash b/package/libglu/libglu.hash
> index b0202a1334..234b58dd63 100644
> --- a/package/libglu/libglu.hash
> +++ b/package/libglu/libglu.hash
> @@ -1,7 +1,5 @@
> -# From https://lists.freedesktop.org/archives/mesa-announce/2019-July/000530.html
> -md5 151aef599b8259efe9acd599c96ea2a3  glu-9.0.1.tar.xz
> -sha1 b6ffef562ba55d3f80146d4238589cb9b1de66f5  glu-9.0.1.tar.xz
> -sha256 fb5a4c2dd6ba6d1c21ab7c05129b0769544e1d68e1e3b0ffecb18e73c93055bc  glu-9.0.1.tar.xz
> -sha512 8a6dae5b4bd63efb96d15f23ccda4ad9c2ffaa964897e5fa63d1e58360d8d4e6732c5efd2109dba04155d5fc457ab1718a65cf9b544ce0d452679ba988d04018  glu-9.0.1.tar.xz
> +# From https://lists.freedesktop.org/archives/mesa-announce/2021-June/000634.html
> +sha256  6e7280ff585c6a1d9dfcdf2fca489251634b3377bfc33c29e4002466a38d02d4  glu-9.0.2.tar.xz
> +sha512  2517d7406bb643d12c017a95dcb5d8716f307344332638bcbdf274a90752a7c22165d34745f1b082ed916bb07d40e62d1d1d67d96426225be63166f3480d6f64  glu-9.0.2.tar.xz
>  # locally computed
> -sha256  84187ce0fd0153769675cb7f3301583eb27393f66b57c5604999a1d805a9184c  include/GL/glu.h
> +sha256  3a9992ccc9d672cfdd07ea862431d943a992d04836570c638a733bf15ec62c54  include/GL/glu.h
> diff --git a/package/libglu/libglu.mk b/package/libglu/libglu.mk
> index e18c7f1494..8820e75d8b 100644
> --- a/package/libglu/libglu.mk
> +++ b/package/libglu/libglu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGLU_VERSION = 9.0.1
> +LIBGLU_VERSION = 9.0.2
>  LIBGLU_SITE = https://mesa.freedesktop.org/archive/glu
>  LIBGLU_SOURCE = glu-$(LIBGLU_VERSION).tar.xz
>  LIBGLU_LICENSE = SGI-B-2.0
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
