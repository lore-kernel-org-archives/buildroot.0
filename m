Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28847C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:01:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E23D761074
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E23D761074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB08B403D4;
	Sat, 11 Sep 2021 19:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Re1KIChts3zx; Sat, 11 Sep 2021 19:01:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19753403B8;
	Sat, 11 Sep 2021 19:01:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BFD31BF2C2
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C394403B8
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HjI-LjUM_iKe for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 19:01:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BA49403AE
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 19:01:01 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id e21so11351742ejz.12
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 12:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n74D2TKb+b6jzWtLRCmm24KlXie96fySaGgYMcgmE9A=;
 b=CnsgoVHrK+54dRwIiDB+FPoLSKpV5jfM8bFz+GgixVyRXToVuHWARFMghUsg7ePIsp
 G5BcuIZrAX7i1HMihDmBwgi1Lg8/s+6eomD9cwbIFtXAfFPXFn4HcW+lbnzFWYRpNZJS
 UyIVGaZF9+5jSUzqSEC0ee4sF4CoZRUKYTunbRHQ7oCAW4fh2TdFS+o4C55xhCgUwXZ5
 n82JNExlv1Mep/EvHRE38yZ6z05qETNrVU3b3aULT7zPVxlNrDsuwIirTLs5u0qjwNx7
 zcDqf9tIpJQ2SueEtqhKd8DX5bcQY5ZhB7pe8iyp1NcZioKUyBQuv8NlQMKd4yJR83Rh
 fztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=n74D2TKb+b6jzWtLRCmm24KlXie96fySaGgYMcgmE9A=;
 b=PbyHEJRzlS22s8ApY1kgXGkIJGSWCZmdefmc1XHsiUKvbWUi2DyC7yZfavrhFlY6od
 5lUvR9oOGFCacpZi6lqu/H9mnIR/rei7Bmo/FIkJdz7CXwm6rTKeSCdc7CksXnEVAP/1
 VYxElggB+Bd3jfs6P9UsKJ714QSRK6N8ais6P5MVcKKRX8JW52x91HsUihcoYOP+6cSw
 rXb8a9xHwRMWW0CxxquWGtvwe2JvNRJIyy5gOaskOcrWk/zNBNUkKXJXI3mrS0GCd1lw
 OjACEu9WvFOyRJlkAYP67SLjYxo/4BTGdaBJOvPBnTijDQoO0vzt791HaD7c/A5A4P3N
 eLXg==
X-Gm-Message-State: AOAM5325lGL6xud69NVl9d+/Ll0hN1zYvLGpNlZgnoxH1hZ8EFhNUa7k
 lj/I9+8nXEccOPlTNaUFED7G3g==
X-Google-Smtp-Source: ABdhPJxUSkOL3S9iINub5A1EwAbmqT4fTyzHGn/ZdC1zwD/xo2CaIR9DBNK2kswdWdUE1feYfv4NaA==
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr4103664ejb.299.1631386859679; 
 Sat, 11 Sep 2021 12:00:59 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q6sm1082503ejm.106.2021.09.11.12.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 12:00:59 -0700 (PDT)
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20210903162027.1935040-1-aduskett@gmail.com>
 <20210903162027.1935040-5-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <1af6cbd9-b38d-753e-6492-f9492dda293b@mind.be>
Date: Sat, 11 Sep 2021 21:00:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903162027.1935040-5-aduskett@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH/master 4/7] g-ir-scanner-lddwrapper.in: Fix
 shellcheck warnings, switch to sh
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
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 03/09/2021 18:20, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/gobject-introspection/g-ir-scanner-lddwrapper.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gobject-introspection/g-ir-scanner-lddwrapper.in b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
> index c19314566a..2f09bca77a 100644
> --- a/package/gobject-introspection/g-ir-scanner-lddwrapper.in
> +++ b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
> @@ -1,3 +1,3 @@
> -#!/usr/bin/env bash
> +#!/usr/bin/env sh
>  
> -${HOST_DIR}/sbin/prelink-rtld --root=$(dirname $0)/../../ "$@"
> +"${HOST_DIR}"/sbin/prelink-rtld --root="$(dirname "$0")/../../" "$@"
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
