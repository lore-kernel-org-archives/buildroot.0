Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097B7C48260
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 21:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 431CF85418;
	Thu,  8 Feb 2024 21:43:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kf8mon6Ea5nU; Thu,  8 Feb 2024 21:43:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 186D785424
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 186D785424;
	Thu,  8 Feb 2024 21:43:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 388701BF30D
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 21:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 266698541B
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 21:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ks4NO3wyZtnU for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 21:43:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AFEA085418
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFEA085418
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFEA085418
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 21:43:03 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-410475afeddso2389325e9.2
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 13:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707428582; x=1708033382;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TxgdhvuYXsweOiBYhcxYDD7+2UAerBj81zs7CVdAJy4=;
 b=e+a7quENd8HZ2Vr6eoR+OBtPMqi+0l8IjBcos9M2ZJ9dvqRc1ixtsNVjCOqXEfgOqV
 xX+c9cx14VX9CHrmFOtfUtX9lIgu8VMme67ODPydLHVMCHaNJZ+C5hzgVX+UL4Cddzlw
 JGDcpCg9EdGbHTmQq99AJwGCoaqju+neoowcGK+6L5z9pIq2v6N/AE7CVQlwUr7Y761C
 jXRwWARjBODL83ny002Jw7sEvvk3f726dXyKMBK/pKCM2LZirc37SbQMh6SbFvQ77Q18
 Lv2qdAwtS6Pts7rLX1toOduuuQkeNiwN4JgE4/4FySNMVZ/14wrtILcdtqhIs38xKKJ7
 rLfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIbc0C4bg+ar6NyXe06Pv2y4JdkpdLtkiPXJ1/DkcBEjtpaHnuRYWTFoGmBIwDW5j7n0sA8XxS8B1cQVYd8pEL1/Li1CHubw==
X-Gm-Message-State: AOJu0YyAgx0UJ4td52JadrrMMZlmrQXaE9WhXps7ABLkxcutanxD0Q7O
 0mfqj041zpX0gQusEfsu25hfZUJftx8Hx+IudR+JumT7lfqtC1NoGWUdm2DswSc=
X-Google-Smtp-Source: AGHT+IEbDWo7oPpEGRdP1alYJ5CEuE8vJZ1FS3WpOem863PYjb6ZekeT2VgTflww1+AoXoPBipAsmQ==
X-Received: by 2002:a05:600c:548c:b0:40f:dd18:a152 with SMTP id
 iv12-20020a05600c548c00b0040fdd18a152mr364177wmb.41.1707428581999; 
 Thu, 08 Feb 2024 13:43:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWfqW3Wi+N+eV07URKZLVLfYTBTIjsJglLUv8Kb2/FXM4VgVE7Bx6BsZimx1kCnY9yn+0DDQu9s+/VD7QPiGpM7NnQH3/lb/KSb7HRClVhzzOwXEkgAXzy7yeanqZpJ28znn+Va3P/LDWN7zJ0Ua4D0mgIFUfp5O0M1IMRfK0l2JJtGeqBK1A4s9S9fnrn65UrYCDCl3ip/cOTv8D7G29hkaM6n1XipjUTkCTXUZYOyMpDqFhstuSabEgrheFCdhMk7NytVeoesk2Odvg35IkN77nGlojE8vrthwthprTq2nR8T09UyUbSdchj2ow==
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b0040ff583e17csm540419wmq.9.2024.02.08.13.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 13:43:01 -0800 (PST)
Message-ID: <d5054160-5ac7-4328-b2e5-546deb007eff@mind.be>
Date: Thu, 8 Feb 2024 22:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
References: <20231211181504.3035423-1-roy.kollen.svendsen@akersolutions.com>
In-Reply-To: <20231211181504.3035423-1-roy.kollen.svendsen@akersolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707428582; x=1708033382; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TxgdhvuYXsweOiBYhcxYDD7+2UAerBj81zs7CVdAJy4=;
 b=L47DLs2SUnjZUVXsN+f80H/QrUOT5lt+d/KVodkAjtv1W94g52IV38fdGPmLysWnmk
 9rJ8pWTlQ/nIK82BbYijIpr2cjVzA1k3D9m5u461GwEFhhsQltecKQ78UIZ6SEdzc1p9
 exOUqx/uHaAoKCQlKnFNso1zQyHKEUihF8gJeh8XnAr0rNQQ1Wy/tg26XWZzyHP+2pXe
 6/b8NT862rpfKCTX2vkPGP2XtFn4hIcrUrd55/s8PpI4nZ5UhkFcbNMjY5Iglvi+fvzY
 DNFLY3A3E/Qa7dpyXxrvpxcZ09DH5nSIVgOXjz3/RrwM4oIHkjoTItcESguw9q2aCSv+
 RnEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=L47DLs2S
Subject: Re: [Buildroot] [PATCH] package/qt5: bump packages to latest kde
 submodule versions
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
Cc: Sebastian WEYER <sebastian.weyer@smile.fr>,
 Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Roy,

On 11/12/2023 19:15, Roy Kollen Svendsen wrote:
> Bump qt5 packages to latest submodule versions from:
> https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
> 
> Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
> ---
>   package/qt5/qt5.mk                                           | 2 +-
>   package/qt5/qt53d/qt53d.hash                                 | 2 +-
>   package/qt5/qt53d/qt53d.mk                                   | 2 +-

  Sebastien Weyer submitted the same version bump earlier [1], but he left out 
qt53d because it doesn't build. Was it working for you or did you just not test 
qt53d?

>   package/qt5/qt5base/qt5base.hash                             | 2 +-
>   package/qt5/qt5base/qt5base.mk                               | 2 +-
>   package/qt5/qt5charts/qt5charts.hash                         | 2 +-
>   package/qt5/qt5charts/qt5charts.mk                           | 2 +-
>   package/qt5/qt5connectivity/qt5connectivity.hash             | 2 +-
>   package/qt5/qt5connectivity/qt5connectivity.mk               | 2 +-
>   package/qt5/qt5declarative/qt5declarative.hash               | 2 +-
>   package/qt5/qt5declarative/qt5declarative.mk                 | 2 +-
>   package/qt5/qt5doc/qt5doc.hash                               | 2 +-
>   package/qt5/qt5doc/qt5doc.mk                                 | 2 +-

  I don't know why, but Sebastian didn't update qt5doc either...


  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20231012132616.2180337-1-sebastian.weyer@smile.fr/


>   package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash     | 2 +-
>   package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk       | 2 +-
>   package/qt5/qt5imageformats/qt5imageformats.hash             | 2 +-
>   package/qt5/qt5imageformats/qt5imageformats.mk               | 2 +-
>   package/qt5/qt5location/qt5location.mk                       | 2 +-
>   package/qt5/qt5lottie/qt5lottie.hash                         | 2 +-
>   package/qt5/qt5lottie/qt5lottie.mk                           | 2 +-
>   package/qt5/qt5multimedia/qt5multimedia.hash                 | 2 +-
>   package/qt5/qt5multimedia/qt5multimedia.mk                   | 2 +-
>   package/qt5/qt5quickcontrols/qt5quickcontrols.hash           | 2 +-
>   package/qt5/qt5quickcontrols/qt5quickcontrols.mk             | 2 +-
>   package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash         | 2 +-
>   package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk           | 2 +-
>   package/qt5/qt5quicktimeline/qt5quicktimeline.hash           | 2 +-
>   package/qt5/qt5quicktimeline/qt5quicktimeline.mk             | 2 +-
>   package/qt5/qt5remoteobjects/qt5remoteobjects.hash           | 2 +-
>   package/qt5/qt5remoteobjects/qt5remoteobjects.mk             | 2 +-
>   package/qt5/qt5script/qt5script.hash                         | 2 +-
>   package/qt5/qt5script/qt5script.mk                           | 2 +-
>   package/qt5/qt5scxml/qt5scxml.hash                           | 2 +-
>   package/qt5/qt5scxml/qt5scxml.mk                             | 2 +-
>   package/qt5/qt5sensors/qt5sensors.hash                       | 2 +-
>   package/qt5/qt5sensors/qt5sensors.mk                         | 2 +-
>   package/qt5/qt5serialbus/qt5serialbus.hash                   | 2 +-
>   package/qt5/qt5serialbus/qt5serialbus.mk                     | 2 +-
>   package/qt5/qt5serialport/qt5serialport.hash                 | 2 +-
>   package/qt5/qt5serialport/qt5serialport.mk                   | 2 +-
>   package/qt5/qt5speech/qt5speech.hash                         | 2 +-
>   package/qt5/qt5speech/qt5speech.mk                           | 2 +-
>   package/qt5/qt5svg/qt5svg.hash                               | 2 +-
>   package/qt5/qt5svg/qt5svg.mk                                 | 2 +-
>   package/qt5/qt5tools/qt5tools.hash                           | 2 +-
>   package/qt5/qt5tools/qt5tools.mk                             | 2 +-
>   package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash       | 2 +-
>   package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk         | 2 +-
>   package/qt5/qt5wayland/qt5wayland.hash                       | 2 +-
>   package/qt5/qt5wayland/qt5wayland.mk                         | 2 +-
>   package/qt5/qt5webchannel/qt5webchannel.hash                 | 2 +-
>   package/qt5/qt5webchannel/qt5webchannel.mk                   | 2 +-
>   package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash | 4 ++--
>   package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk   | 2 +-
>   package/qt5/qt5websockets/qt5websockets.hash                 | 2 +-
>   package/qt5/qt5websockets/qt5websockets.mk                   | 2 +-
>   package/qt5/qt5webview/qt5webview.hash                       | 2 +-
>   package/qt5/qt5webview/qt5webview.mk                         | 2 +-
>   package/qt5/qt5x11extras/qt5x11extras.hash                   | 2 +-
>   package/qt5/qt5x11extras/qt5x11extras.mk                     | 2 +-
>   package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash               | 2 +-
>   package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk                 | 2 +-
>   62 files changed, 63 insertions(+), 63 deletions(-)
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
