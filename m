Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E822DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:18:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A13461050
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A13461050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AD8D8275C;
	Mon, 20 Sep 2021 19:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a4tzRKq_vaH8; Mon, 20 Sep 2021 19:18:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70BBB82423;
	Mon, 20 Sep 2021 19:18:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1186E1BF955
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F37AD40277
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fyx6M03loS7x for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 19:18:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8109C4012E
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 19:18:22 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id eg28so42689954edb.1
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 12:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=a3oQOj9ynu9G1jIQqQRomVJFJdrohq9m0OSpVt/fDxI=;
 b=cce4b4AS68EWrv7HKbQYy/JbKw6YkQR0sKlX7bvICtdQWFOcPqhWqUpYNDTI66A9il
 1my2+ITwrf0a/Jo3m7cQO4BQmMUHFMxoibULtgQ66EQ8P/XRauIoMeHCSEhXSlYZ+Rx+
 60R9zOJzNwwAMQexMsSVpCgEqjkiyySTCCURZ2+kZa1j3YVrf5lnSLwQlhHJtBDVylMq
 mEq3S69Cxzx+jr9WCP0nbITbvurzkP8AdM/slHgn5Q0BCEm8pgU+Odt/Krbu5JoLiRIL
 zxpBh/B/fdDLtR+uOXp2nOby8PAi7W1wSoJbWwwYNrKdeERTL15HkFT71VltAe5Ao7rh
 LwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=a3oQOj9ynu9G1jIQqQRomVJFJdrohq9m0OSpVt/fDxI=;
 b=eAzL4flqqJU5fhSiXFfJVFCyblUOHMNv0h+DO2QosY6HakzdGlaO2yGJTsBDHL+9Qw
 kqO7PjmYBgzcSJUa5UhOa6rvObHr0GKOTMHGvWT5Oai8I6wA7wFsWOskmlCZ1VXnTRJT
 j7X+wCCW7MdPjCrhhz0CIav8iw8uC3BuwicYywEGLqso4QkTDKuN7yDaaYa692DgaUsQ
 tABRH4hp/RpcbfTcvc0RzsMp8iVha/OrCzwewNtIvTeHtjjnUVoE/+3sL4Zf54smnAea
 niRrDatt/psT8NdGzcVeTarW4x+ASBjDjhBoBPhkO9gvZSjNkjHZMtgXH+4D2M3A9zvU
 MKpw==
X-Gm-Message-State: AOAM5300q500Xz7QCIu7dhqFbNK2XoCDA1tag4fkjpV9Lfc76UJA+AKn
 /GKc/QOluwlFVblfOKX/TWZbr2eyYqGmJQ==
X-Google-Smtp-Source: ABdhPJzURWMQxPQxxCy7bIZAa+zG9fs0VcstEaHKWrGDj72ri+LezDfqOZ1qzqRAV+Ko9D66lrwg5g==
X-Received: by 2002:a17:906:dbe5:: with SMTP id
 yd5mr29752082ejb.134.1632165500319; 
 Mon, 20 Sep 2021 12:18:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id a7sm301382eda.70.2021.09.20.12.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 12:18:19 -0700 (PDT)
Message-ID: <b6eaed9d-1861-2d37-53fd-6a97f5a783b0@mind.be>
Date: Mon, 20 Sep 2021 21:18:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210908194847.582017-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210908194847.582017-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/kismet: bump to version
 2021-08-R1
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



On 08/09/2021 21:48, Fabrice Fontaine wrote:
> Drop patch (already in version)
> 
> https://www.kismetwireless.net/release/kismet-2021-08-R1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-nrf_51822.h-fix-build-on-sparc.patch | 59 -------------------
>   package/kismet/kismet.hash                    |  2 +-
>   package/kismet/kismet.mk                      |  2 +-
>   3 files changed, 2 insertions(+), 61 deletions(-)
>   delete mode 100644 package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch
> 
> diff --git a/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch b/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch
> deleted file mode 100644
> index c675654721..0000000000
> --- a/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From b347fea1a5ba0f66bf15e7de56d748e0f0dd624a Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Tue, 20 Jul 2021 22:27:45 +0200
> -Subject: [PATCH] nrf_51822.h: fix build on sparc
> -
> -apple is not the only target that miss some defines, for example build
> -fails on sparc with:
> -
> -capture_nrf_51822.c: In function 'get_baud':
> -capture_nrf_51822.c:80:16: error: 'B2500000' undeclared (first use in this function); did you mean 'B2000000'?
> -   80 |         return B2500000;
> -      |                ^~~~~~~~
> -      |                B2000000
> -capture_nrf_51822.c:80:16: note: each undeclared identifier is reported only once for each function it appears in
> -capture_nrf_51822.c:82:16: error: 'B3000000' undeclared (first use in this function); did you mean 'B2000000'?
> -   82 |         return B3000000;
> -      |                ^~~~~~~~
> -      |                B2000000
> -capture_nrf_51822.c:84:16: error: 'B3500000' undeclared (first use in this function); did you mean 'B500000'?
> -   84 |         return B3500000;
> -      |                ^~~~~~~~
> -      |                B500000
> -capture_nrf_51822.c:86:16: error: 'B4000000' undeclared (first use in this function); did you mean 'B2000000'?
> -   86 |         return B4000000;
> -      |                ^~~~~~~~
> -      |                B2000000
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/38f20816a654894c0625f00b1360c92fdc251e8b
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/kismetwireless/kismet/pull/388]
> ----
> - capture_nrf_51822/nrf_51822.h | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/capture_nrf_51822/nrf_51822.h b/capture_nrf_51822/nrf_51822.h
> -index cf7fee1e..d9203f61 100644
> ---- a/capture_nrf_51822/nrf_51822.h
> -+++ b/capture_nrf_51822/nrf_51822.h
> -@@ -3,7 +3,6 @@
> - #ifndef __NRF51822_H__
> - #define __NRF51822_H__
> -
> --#ifdef __APPLE__
> - #ifndef B9600
> - #define B9600 9600
> - #endif
> -@@ -58,7 +57,6 @@
> - #ifndef B4000000
> - #define B4000000 4000000
> - #endif
> --#endif
> -
> -
> -
> ---
> -2.30.2
> -
> diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
> index 4c986a159b..9a9d2260b9 100644
> --- a/package/kismet/kismet.hash
> +++ b/package/kismet/kismet.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  f85939c9d32fa72d777db35c68af84c379171b94380acad0db7924f95a81bdaa  kismet-2021-06-R1.tar.xz
> +sha256  1c8e31b1babdb0fc93ac38fd0772a24d4b40f865fbc292fa8ec7f4a18ced0135  kismet-2021-08-R1.tar.xz
>   sha256  93c7f0d7e356b0abfb6f494ff3ea37f96abc84e9a5619b25d4e43f7553a55739  LICENSE
> diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
> index 64f9501db8..819ed510d7 100644
> --- a/package/kismet/kismet.mk
> +++ b/package/kismet/kismet.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KISMET_VERSION = 2021-06-R1
> +KISMET_VERSION = 2021-08-R1
>   KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
>   KISMET_SITE = http://www.kismetwireless.net/code
>   KISMET_DEPENDENCIES = \
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
