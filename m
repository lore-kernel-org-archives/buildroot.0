Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E36C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD79781132;
	Tue,  2 Jul 2024 19:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8jUUP68j4UW; Tue,  2 Jul 2024 19:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5EA483F75
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5EA483F75;
	Tue,  2 Jul 2024 19:42:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2F1C1BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D138160BF0
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3XC7OIj8nmy for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB2E560685
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB2E560685
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB2E560685
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:42:47 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52cd87277d8so4832668e87.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 12:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719949366; x=1720554166;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bbVBKDAyEZHcJd61wZehQHSQ0wlRHOc8ZjutJPqOmpE=;
 b=P9iS1WOu0Gunk1Fg9Q7brJDtDGiM28AS55BMChXfgtQOyY/AVWRcqgLtTHgr156aCG
 U7kqK4u7m9MBLlNaHtLp23C90JkiUJH8e1jE43TRsgQV/yD0VEPU/gUU0aFRFL3WiY8J
 wJYp1Z4qMZpwLZIC+mc41TPqIgI4XgjMqh7f/E2OOr2AtSg1LPxdxjAY6vih0/9OlUoI
 i3LEQbmLpxJbO39REPGfBf/YRAtGG2g7LItUpA60gp32m+EntwPvc+EJ53a14LC0vQkq
 Vy+gZpRXde1Ens0AxHW/d05Kp27ofJZw4YmGEK5cFloAfucrFDyJSCz7WdeFvz6mkjss
 KHXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUId6dURhO45PK6wG58rfERu41FUadC1u3KE8IYRHeuf5ohXHwOOm7rXtmJKkU7GALyb+Aj+sjhJR58SGi1P2IKiaHjqAphEw==
X-Gm-Message-State: AOJu0YxKWajZk5F2BXXa5myr5z0cuZOTnjfPGWhDDCNK/kb1SFd28ZaD
 xRFeJAUNYB09bEJqWVoe11h+wPODXB/vFzk3ng8v1tPcZwVURCfTzxV0xZXVue8=
X-Google-Smtp-Source: AGHT+IEWX6PUKRmcXvgyuJD0iGSQdh/t4SS6TXsDGXpOblXfhOkIvvITvGGPgUMWRRH5IVMI/1bTbQ==
X-Received: by 2002:a05:6512:33d5:b0:52c:d13e:3785 with SMTP id
 2adb3069b0e04-52e82691ab3mr6344256e87.30.1719949365866; 
 Tue, 02 Jul 2024 12:42:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0971d2sm208456165e9.31.2024.07.02.12.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 12:42:45 -0700 (PDT)
Message-ID: <b3f10681-552c-48dc-9942-46e28d5f0969@mind.be>
Date: Tue, 2 Jul 2024 21:42:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240702133925.2426667-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240702133925.2426667-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719949366; x=1720554166; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bbVBKDAyEZHcJd61wZehQHSQ0wlRHOc8ZjutJPqOmpE=;
 b=DD5PZX2wd2olHY9rMI5RthWn1FzdJOgKN5GY6+/dqzPJEkcnu4YBeUfeDaDvZNt7Lb
 kvVtQDKNmmkB61LWdngtvUdOFQhZ2Skonk0nuptgI6ozn/Cb7JyWeVJmUn/33Js+6Nip
 sFBqVb0GdTKfyddt6cI6m4HN709H3xJwvsP24x0/rqhm2zMNFNX0+6tysx9yS2gO3jyF
 LY9NOw7aobMqiOLkczIcyHpTpxT4n1uG5piu8euQqa9kgONYkVyHsp1+r4hozeAwvRsu
 7YD1c9VyHO4VfZQdQ08XRZULpZAQDBtrtVwrKnPKVl0Xb0kK0hSU5jPs8ZbtaITwF4EJ
 5rcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DD5PZX2w
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl_mixer: update the patches
 to be applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: linux-amarula@amarulasolutions.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2024 15:39, Dario Binacchi wrote:
> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, sdl_mixer fails to build with output:
> 
>      Applying 0002-configure__set_macro_directory.patch using patch:
>      patching file configure.ac
>      Hunk #1 FAILED at 2.
>      1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../sdl_mixer/0002-configure__set_macro_directory.patch   | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sdl_mixer/0002-configure__set_macro_directory.patch b/package/sdl_mixer/0002-configure__set_macro_directory.patch
> index 9802333a1d4d..cad9baa9c31f 100644
> --- a/package/sdl_mixer/0002-configure__set_macro_directory.patch
> +++ b/package/sdl_mixer/0002-configure__set_macro_directory.patch
> @@ -20,13 +20,15 @@ Fixes:
>       libtool: and run autoconf again.
>   
>   Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> +[Dario: make the patch to be applied with fuzz factor 0]
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>   
>   diff --git a/configure.ac b/configure.ac
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -1,6 +1,7 @@
> - dnl Process this file with autoconf to produce a configure script.
> - AC_INIT(README)
> +@@ -2,6 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
> + AC_INIT
> + AC_CONFIG_SRCDIR([mixer.c])
>    AC_CONFIG_AUX_DIR(build-scripts)
>   +AC_CONFIG_MACRO_DIR([acinclude])
>    
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
