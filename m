Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD921C83F21
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 14:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 865FA82C8E;
	Tue, 15 Jul 2025 14:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MfgfC4uy7u76; Tue, 15 Jul 2025 14:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A85AC821AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A85AC821AB;
	Tue, 15 Jul 2025 14:05:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D72CDF
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 14:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EC8F6104C
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 14:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4EdeT8ybhuTZ for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 14:05:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D69346119F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D69346119F
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D69346119F
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 14:05:05 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso4161134f8f.1
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 07:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752588303; x=1753193103;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rc9i3UVqvi8F2Yy6pCBbPasTHchuFq6Z1ELu1ZVHidg=;
 b=xIzkjBniW8Xr+iYK0Ou+mVOcUqUQnAIjLmjMBR803wWrdsRs8ZEwgO/9/mD7Fe14JQ
 nqZOPsOgZMqMdtAAzGiIe3soALG9q2Uc/eRSQF+7DuDYayKCS4VuWr+pWX47y5TAIgY8
 yvw8A2LrEgYWKzF1qC41oMmWWt9OtljHloJycV/vQU/DKS2mWZ+F2rulc8vPQsrGUjl8
 Fe6TfkIRxVcDZsJqnvEJxTpYUD041D4MxejXnLvV8fV3w+frVWrxJ2W3c3sZhKHGceWk
 G0EOtS1+EfSxAjA6JWkrGgmImOMrP2bsNK3iB1fMTuJjo4yBfH+Unf6M7ZX4lJFzvZ2x
 WLdg==
X-Gm-Message-State: AOJu0YzxyGWLN25TQvtKn+D/qjBzlN7hJGZjfU3FIk0jzJrZmm1zPqD9
 sB/6UaOLdjsAF9S1/k/sCKx56Que7yn1UZ7wMVh1XmXAzLmAFIR46HSz5bct5dxUg28=
X-Gm-Gg: ASbGnctXUIOHWAR8AKdmugCS0IWyjfymDHYlRr7p+tOLJskJKS1chwE0+AUjC8Tsk5L
 5Ssz4GjJle7NTAcun8/b0fpC4O/6qRARA08SX0uNPpn+ptBcXbnDLKXQ1Hub9pvH43GohLzuZKl
 wIcLveXjJlwXVGraq32FBO7NOaWNwZ7RNSe9S287f/bIY5H7HEmx5OGqToIfZuNQuydQ6D7PUyH
 YhQ0EX2MHII8b+V5PuD35Xs3nYQ6anC9H7DOK497Jsf50+9QrPI1sjBlCObIMykS+UvTjx8XZGI
 TSND0whm3QTLSoRhaA3PNfWh2O+gdFvsFQIjmA6qKO214/P2LKV4aHILSvEhM26rTqRbZFCaTsl
 vuhtuzHfY+v5D0Z7y2WQoiYOvrbDYWq8quBgwAxBNSzX9N6FhQs6eDcBcGEBPgzQqHGEpLp1VZP
 nMgs4BBg==
X-Google-Smtp-Source: AGHT+IHq5LYmn+O6uf0pqYR+8b113DDCMWTmM05SQr7Y7sUQGWWm/jP6BM1uY5J+bT3TwcK8TNopDA==
X-Received: by 2002:a5d:6f16:0:b0:3b4:58ff:ed1 with SMTP id
 ffacd0b85a97d-3b5f18f80e2mr12712733f8f.52.1752588303081; 
 Tue, 15 Jul 2025 07:05:03 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:639d:e501:5db7:a3a4:443e:4828?
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-456101b60besm89271175e9.1.2025.07.15.07.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 07:05:02 -0700 (PDT)
Message-ID: <ca9e3606-cec0-4eea-b099-e3d7e668f4e1@mind.be>
Date: Tue, 15 Jul 2025 16:05:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
References: <20250711173633.20222-1-fl@n621.de>
 <8e6d38ab-9800-4a57-b550-1810e615f5ee@mind.be>
 <20250715131652.jygohupj53zv2r3j@n621.de>
Content-Language: en-US
In-Reply-To: <20250715131652.jygohupj53zv2r3j@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752588303; x=1753193103; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rc9i3UVqvi8F2Yy6pCBbPasTHchuFq6Z1ELu1ZVHidg=;
 b=Isg7vp9FAUvCGZYvKV3equ1w1csrC9odLX5AeYiCma64ob5jmLfsaEmMo4xYmvSe02
 3IMls2VJvefyHL9mdWuxycsMGZoo4+zwl2DH9DwdOPTKg/t/tOBr/ANIJ17P4OeybAXz
 yce2kF3VvmY6FnKPCrapEE5qiqcWz65WZOhk5YzYAANk72HT1pBRJ/BCOCPhi8H/6lq1
 Um438/dkIh4nYZklvgwDqljGXwlA+y1F44w508Y5NENHNTiLYqCd2cp8BDes4aHPvwpc
 CSVhVOV6EJF6mHphuSb5YYlj9qPgdZWuVIxpd5RPNqCW2loFhZ6cVxotuhfR4zbDjLmy
 GrTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Isg7vp9F
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: add support for
 pulseaudio
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Florian,

On 15/07/25 15:16, Florian Larysch wrote:
> Hello Titouan,
> [--]
> The problem here is that the packages are a bit too coarse-grained.
> ffmpeg needs pulseaudio only for the client libraries (which get used in
> libavdevice), but pulseaudio uses ffmpeg (via libsoxr) only for
> providing an FFT implementation (via libavcodec) and that only gets used
> in the main pulseaudio daemon.
Thank you for having looked into this so far.
> This could be solved by splitting pulseaudio into a -libs package or
> splitting up ffmpeg. I think splitting up pulseaudio would be much
> easier in comparison. Also in my application I was just going to use
> libpulse to talk to the Pipewire implementation of the PulseAudio
> protocol - I wasn't even going to use the original daemon and this is
> probably not too uncommon nowadays.
>
> Either way I won't have the time to dig into this any further this week,
> I'll send a revert for now.

On my side, since we're not interested at all in the build itself (only 
collecting metadata), I just dropped the Makefile dependency 
libsoxr->ffmpeg in a custom patch, see 
https://gitlab.com/essensium-mind/buildroot-lts-tools/-/blob/main/patches/0003-package-libsoxr-remove-dependency-on-ffmpeg.patch

The patch above also solves another existing dependency cycle with one 
more hop: ffmpeg -> libopenmpt -> pulseaudio -> libsoxr -> ffmpeg

But obviously, this can't be upstreamed, as this would yield an 
incorrect build.

Until we find a better solution, I agree with your suggestion to revert.

> Florian

Have a nice day,

Titouan

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
