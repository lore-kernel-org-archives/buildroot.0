Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF12DCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C70E142364;
	Fri, 29 May 2026 08:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CbN7XZL-T1Ra; Fri, 29 May 2026 08:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0CF142365
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043442;
	bh=bo6ymytEF2Z0uaSM+6RnfSpSGRP2GkEq1UvU8c2xXG8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VtgTDASm+aQcCo9Sscyvvw4pJVJO5+5ZTVQ+MKN48+NK3SYjPSEfe0Vd1KJNk9twl
	 tBaTfNw78kiI8gkI8aMLhjk9c84/3wUcJpz++iASF5O1yU438phyk9/cg53r5jVnQH
	 MV9BWKQ+eHoKpiGZfj/pZQ/zosGxNvaI6fimY2M5lZazDVpkXZhi5ulFSFGVsFIHiW
	 /gucDTNscW/22+NWWCgBjKDxLi6sh5Myoh4xkr/UqT4/Ot3jDKTGYizbSR6nJA0bBd
	 3RjWXRexi/CxcN1UV3+STu4xfsS7uZxtKpmmJizdoRFtP4pip1rI3qVQLUF6ds83lH
	 u22C7fUrFaQ/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0CF142365;
	Fri, 29 May 2026 08:30:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E89228E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F256040B8A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrbkVTCayNRY for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E5DB9406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5DB9406F3
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5DB9406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:29 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-68acf0a15b3so2669798a12.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043427; x=1780648227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yfoanZJFquDV/mt9QfPKHMm4tSajj+vbxer/UFodCYE=;
 b=fkZdwUEIxQyJeEQ4mgsHmzKE4yrbssyrkPnOSoaUG5rOF+UY48RjnT/RuxP/YOcgS2
 luQ7GRRt73F6K7monfzk5PhhUfzcebBQpIhxa6uLwaFTyJ2Zu1ZMww8th4faKtBtBrlG
 1pkbRjzY5Px8nOY6MriJB2kvuV3bUVADGh7j6vqASMQfQA8jrfHdeW6FBZOSJKEIunzm
 ID4lA4EM0qM5tvdBRW5OVwSrMhb8MorL+21FhezB5isfmCVmFMJ3G0yibU8dBTyfWs9I
 8Nj9LYBud1EkyTctS90zCUIKQDvrXYBSptYxJf+ZV73BAKw612+iVlx2+qUwwhehP8jl
 C+CQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+7QHHSW3VhECTT9pEdR5mD3jpWV197vcjKsEXtfCwhdL0jXGUJ7qzI72p8PEGzle9Ay4A5pqNZUxU=@buildroot.org
X-Gm-Message-State: AOJu0YwVj+Dn0IRgZG2N78bOCojpKndEm+cO7ERpBhgE3YVb8x0yeLxj
 QSPoAK/3Vvxgsby9VpvpO5BvVTc5Wczn5Gyw4QOP7sG7JTkAw4PTKrVo1lK80Y1SMWbHREjqdTP
 +LaL8
X-Gm-Gg: Acq92OE+8gCw1GxaPCpxy8DrDVlvjFAJ5BbdTqbZ4UFcPRTBblcnkEBwY3izj/K4424
 3pnmNlXpJJ8wUwnE4y9/Z6mpwWCshBVXxqJCkoU8FJ//ogpiV0laHDcSb31X6p1jMrWxC0XBA7i
 RlpQVhVmGAZz46sf3MUg3Q8/y+sp6TC06KwXx5L/R2RMrGxsydQA2aN8d/CnZMv3TmI7F8F4DhJ
 yvIffvjbl1Dt0/PqRwJ8UlZFLaDi934Lys6qhmXfQ3kRrSZDIoUFHs2DuWxvfrY6mV1K53Tp/h4
 EZmeQTGFzXlLrZqo62sS4FnVrLDRoWNjzuxzcmgdN/eTW6QZZq7d0ciUsaa7OpRhVDTVgdRw6YH
 0kmjBTtUEB619iVhSaiPp/kH9ZRx2zHw7BxYi+4q+EGyo9ARK3dCNqUjafKTbV+k9yU0vKX8O9m
 /kiV7KiL6rKSXGCv17G8td24G19x+nu+DZbLmUlAcPQRazg9kwWqKKRikyo83wEWlfUTyj
X-Received: by 2002:a17:906:7952:b0:bd4:7b7c:a4b3 with SMTP id
 a640c23a62f3a-be9cad0724emr96024066b.32.1780043427532; 
 Fri, 29 May 2026 01:30:27 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3587072sm1816462f8f.34.2026.05.29.01.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:27 -0700 (PDT)
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:26 +0200
Message-ID: <20260529083026.59658-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515-virglrenderer-v7-2-1f1814b65ccd@gmail.com>
References: <20260515-virglrenderer-v7-2-1f1814b65ccd@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043427; x=1780648227; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yfoanZJFquDV/mt9QfPKHMm4tSajj+vbxer/UFodCYE=;
 b=Gbnl+fDA+Vpb6tl7cTHlG+YnPPeQo2L1NDfqPMm7DEwVFCp/JfGimmLJvfvbNiGFeW
 Hw73HFEFYCbstXDghb3mYpKQxsYCdaUo+cjPoJIXKFP8sagGuBgBYAT1HigJvaC6b9Jw
 +yutLRo9fWGk3ewQterfCDvuzkuM9z6Tx4X93rZ9NV7fHZB/QDVwrDzNuW2YBXIggDz7
 fZ2/BaFBvWqvjDQjVQwJNiko3ViYLCWiqjJ3DYy9JU3LrqtwNlSDLTA10p/gkYfCmPfi
 1aRpc7IQcfkGxV/mic8iWYhlnUWqgVeSd1uwowxS8e6EnToUc87kCwqhkWlViLMIGO8s
 lE5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Gbnl+fDA
Subject: Re: [Buildroot] [PATCH v7 2/8] package/wpewebkit: fix stale
 libepoxy dependency comments
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> wpewebkit depends directly on OpenGL ES and EGL support, but those
> dependencies are not imposed by libepoxy itself. Update the inline
> comments so they describe the actual dependency source before relaxing
> libepoxy's package-level EGL/GL dependency.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/wpewebkit/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index c8602f1de6..c4ee5a27f7 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -38,8 +38,8 @@ config BR2_PACKAGE_WPEWEBKIT
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	depends on BR2_USE_WCHAR # icu, libsoup3
> -	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
> -	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
> +	depends on BR2_PACKAGE_HAS_LIBGLES
> +	depends on BR2_PACKAGE_HAS_LIBEGL # wpebackend-fdo
>  	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>  	select BR2_HOST_CMAKE_AT_LEAST_3_20
>  	select BR2_PACKAGE_CAIRO if BR2_ENDIAN = "BIG"
> 
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
