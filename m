Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B72CC04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 04:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 244F18250B;
	Wed,  8 May 2024 04:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4qte4jsIjgb; Wed,  8 May 2024 04:05:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3933C8289B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3933C8289B;
	Wed,  8 May 2024 04:05:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A87451BF401
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 04:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A13368289B
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 04:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3MxlRtBsT_M6 for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 04:05:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 644D98250B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 644D98250B
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 644D98250B
 for <buildroot@buildroot.org>; Wed,  8 May 2024 04:05:55 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a59cc765c29so691126066b.3
 for <buildroot@buildroot.org>; Tue, 07 May 2024 21:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715141153; x=1715745953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RL2BGgpEZL41M9th1pNSz41Z0k8tYggV7MINwljarBY=;
 b=s2ogvuw64P5Rx4eez2/VOOpZVrDz2/ocVtApzDfYMF4yrD5fgtpHoEaQrlur4k8+DP
 GxrY/gsLSPQe45zx3H4TfGCTZ4+6qomOBq9WHoDRYxM4eQ9eTBEurkqI6wqPZaV6gWfy
 lZzaHPK89nV4WD1t1QnSLPZMg+5pWs8sTQk4x1hvi+sBuZiW6+L827JPVTYsM0LB8wnF
 Lg0pyofSwc1hWAYO/vwqdSHRXhAFYLoIzkmEuPio3dj2rRRICfIEQ1soBn8RZ9WBz217
 VSLluKpTd5XY25adZsKmff4qF2Odja2+NmltTFFhIc8XDh6FSNZHRGeiAMX1Nvpu3MR7
 2aPQ==
X-Gm-Message-State: AOJu0YyRO/nVs0niCkqJF1Nlq+oSW0WHZMnbcwfDcxIxq0y3jOCacc96
 q3ExqHD8S9HTbZfsS+WFzVa1e75HAYQJdexPbj/9z17EW7r8LlPQu+ODWmAY+KYXfFlZNC3I8Jr
 n
X-Google-Smtp-Source: AGHT+IEvi+r0CsWAX7EBTjAwsrOOR1QDFRL+9tbrLdSJ7D/RDQJJYaer0bTkK2oVeRvjLOZ61pa6Dw==
X-Received: by 2002:a17:906:494d:b0:a59:a5c3:819e with SMTP id
 a640c23a62f3a-a59fb9490f9mr77683966b.11.1715141153107; 
 Tue, 07 May 2024 21:05:53 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 an3-20020a17090656c300b00a59bb1a257asm4192029ejc.202.2024.05.07.21.05.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 21:05:52 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a59a0e4b773so922901766b.2
 for <buildroot@buildroot.org>; Tue, 07 May 2024 21:05:52 -0700 (PDT)
X-Received: by 2002:a17:907:2da3:b0:a59:db8c:d26f with SMTP id
 a640c23a62f3a-a59fb9f5159mr99382866b.73.1715141151332; Tue, 07 May 2024
 21:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240508040220.28371-1-christian@aperture.us>
In-Reply-To: <20240508040220.28371-1-christian@aperture.us>
Date: Tue, 7 May 2024 21:05:39 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pL25M4cr9jyCM=wc=iKUJQR9e6QKK8cXZD-eP+39G5qA@mail.gmail.com>
Message-ID: <CA+h8R2pL25M4cr9jyCM=wc=iKUJQR9e6QKK8cXZD-eP+39G5qA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1715141153; x=1715745953; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RL2BGgpEZL41M9th1pNSz41Z0k8tYggV7MINwljarBY=;
 b=gZzJXWYhNKLXh4suRQRBJOcGK33/OA3X8pQIGq9KjhUQiE6Q8H67gQc0AZSMR4tDun
 st5uvkwkkUIWJC2kdpLPaHnM66uLL9YbjamyUbVSUUWq4fb59vhqbkbDVrglKcUJqeon
 RYUteYeuqAcBvhJE027GcFv/BxX5OdBu32h7MJJh9XbZQPfI8IcWgQLfkKdaikf78tgO
 xHZRLqBYJm46YokaSoM1WmD9yE2VcuPCgKtfdyfbSWUmtpOrWcbmwG+4rUjjE6MVTY2Y
 vtaM6q/9o7WLihsOxrqdjatTJG3k4KCyvECrIdEMrY9O+z60ffPJRhwci4AonJoJe1wZ
 ouPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=gZzJXWYh
Subject: Re: [Buildroot] [PATCH v1 1/1] package/mdadm: add udev to ldlibs if
 enabled
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gVHVlLCBNYXkgNywgMjAyNCBhdCA5OjAy4oCvUE0gQ2hyaXN0aWFuIFN0ZXdh
cnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4KPiBGaXhlcyBhIGJ1aWxkIGZhaWx1
cmUgd2hlcmUgdGhlIHVkZXZfIGZ1bmN0aW9ucyBhcmUgdW5kZWZpbmVkLgoKCkhlcmUgaXMgdGhl
IENJIGZhaWx1cmUgZm9yIHRoZSBpc3N1ZToKaHR0cHM6Ly9naXRodWIuY29tL3NraWZmb3MvU2tp
ZmZPUy9hY3Rpb25zL3J1bnMvODk5MzM5NDQ2Mi9qb2IvMjQ3MDUxMTc1NTcKClRoYW5rcywKQ2hy
aXN0aWFuIFN0ZXdhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
