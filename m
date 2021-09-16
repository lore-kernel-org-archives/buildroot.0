Return-Path: <SRS0=h7+E=OG=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6A3C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 18:42:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6274F61139
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 18:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6274F61139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 125E3607F7;
	Thu, 16 Sep 2021 18:42:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oni1SEotypCw; Thu, 16 Sep 2021 18:42:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D68260811;
	Thu, 16 Sep 2021 18:42:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA7B21BF8B4
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 18:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 994DF41589
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 18:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VgF1U2Smh_f5 for <buildroot@lists.busybox.net>;
 Thu, 16 Sep 2021 18:42:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AE72406F6
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 18:42:05 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id c22so20351259edn.12
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 11:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TP7eqte+W2bxxZGzPX3JZhm3XcJtTUq1qIjoWyAMeSs=;
 b=Vtt0tGzUvQjWHsEH+L0ItnTc6Fo2xrKxc6w9YpR/SbZfdAwAPoLXwddtLU1/trGDXz
 861GcxIVehFPjgJ3bkUC3oQ15ipsHL/NYBMlDvW4RMi7Qwt55k7xIr7MTvdEQbgzErH+
 qAHG/YxdE5xTeSdgNJMF5By4otPCzzvTkctI3kOlvY7g0RHLxNCBYWgFoTlOECJWMD8H
 KAdMZBEpezmn7V9ac92ZRFgyB08NNsUn6p9FoHTWRlfMj6dpBOY3uwNfykmK77+sF3Lj
 n0rEoiJCaGNOtYv9FtHCFxqWpL5GYdlQOe4/FDjUIBOq8uxEemMcWAfQUQXZ8eOvUAr1
 wBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TP7eqte+W2bxxZGzPX3JZhm3XcJtTUq1qIjoWyAMeSs=;
 b=ZNos1FZ+hXrY8O1kPx4Nv8rp/smQE2YVuEYBRhAjJLnlDAJjKvfITKIH88yfDQ41fJ
 OB2aCeV/GupfEwQHG2DCbcRvPUULzUtRCgLOh7vNbZSd9u9TXEL2tiFRl4cr69zmhEXn
 uIta9rY7xEwEv+45HcL+hx9h5ZDXm6nDkcqT3nOgX38n5tJOmzbmxhTwCXS5zdbdbcIq
 W4vmVMaX52ZrVITyNpGx+uyu1YeQoqbqeiKw2GdIhxxOxGmq+ypJgDaWdDeH1yteIH0M
 q/HunWWNlvvxjEry/9WWCyMpZe+fCxHsPnw6gxA35XqnngAtljE1NhrpmsnA5YPPEkYC
 TF6w==
X-Gm-Message-State: AOAM530w9oGF2OVHPQo6pDdILftNeLd7T3dU9I1SohfI72KQYcTordYn
 pVWZgNH7RyG7s/tpLeuNRLGdhV4jLEh5Aw==
X-Google-Smtp-Source: ABdhPJybUJiVtLhbGbpWzQc5qLmKdC3l/WNP8BXNU1BGwzVaTKbxmlHolNtz1JellYWo9L0Fc30ULg==
X-Received: by 2002:a17:906:6943:: with SMTP id
 c3mr7746274ejs.550.1631817723437; 
 Thu, 16 Sep 2021 11:42:03 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w11sm1722260edl.12.2021.09.16.11.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 11:42:02 -0700 (PDT)
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20210915194839.22122-1-petr.vorel@gmail.com>
 <20210915194839.22122-4-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <56e9b208-6590-eaa7-35ce-55cec55e499a@mind.be>
Date: Thu, 16 Sep 2021 20:42:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210915194839.22122-4-petr.vorel@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 3/4] utils/getdeveloperlib.py: use
 python3 explicitly
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
Cc: David Laight <David.Laight@ACULAB.COM>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 15/09/2021 21:48, Petr Vorel wrote:
> + remove python2 compatibility imports
> 
> library is used by support/scripts/pkg-stats and utils/get-developers
> which both use python3. Although library does not require shebang,
> it's better to state python3 use.

 Do you have some supporting evidence of this claim "it's better to add a shebang"?

 Looking at a few random projects with python files, I see none that do it.

 And it seems like a lot of noise to add this for no obvious gain. If it's about
documenting the minimum python version, it's not even correct: some of these
scripts will require python3.4 or python3.5 and that's not documented...

 Regards,
 Arnout

> 
> Tested with python3 -m py_compile.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> New in v2
> 
>  utils/getdeveloperlib.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
> index ce822320f8..74a3a420ee 100644
> --- a/utils/getdeveloperlib.py
> +++ b/utils/getdeveloperlib.py
> @@ -1,4 +1,5 @@
> -from __future__ import print_function
> +#!/usr/bin/env python3
> +
>  from io import open
>  import os
>  import re
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
