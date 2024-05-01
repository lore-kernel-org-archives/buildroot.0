Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD3FC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 935D282173;
	Wed,  1 May 2024 21:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0J12Q5nHfZ2d; Wed,  1 May 2024 21:32:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2871782158
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2871782158;
	Wed,  1 May 2024 21:32:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 816161BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B5AA60BCC
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiYVv008CZV9 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:32:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=gael.portay@rtone.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA65C60BCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA65C60BCA
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA65C60BCA
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:32:37 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2dd64d6fe94so83375531fa.0
 for <buildroot@buildroot.org>; Wed, 01 May 2024 14:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714599155; x=1715203955;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fvo+0vlJP/5Kj2s7QZ/Q58bASL7V1KnZU8QXxLdhl0s=;
 b=LOElro88YKJwRajeizgSRG0CjXFIWY96TrWoPS+3KWbGVcE6uzuRNXLW2bUA2aYIIV
 usWRvEzPTQzzYNOCSYTr9zxCwLIqumvRiZ22kDIJp5w/SWUCqRg0SIYIiXJrJnsLqsjC
 dupZbrss/Ds3doe7HX4Vb23MFs/3zAl/0HIS4mE2BzYqh4i28BD396sW+T6ph3bccVaB
 M1FDJVsU9IViRmyxmi9fq89cdNsSYUeb7Oavh9Ust8jMb4qkmkx6aMP88QIrNREVJ4yn
 QW5JGA2X4reSqsIsUk80FauesHdvh97JtUa0UwH8FH0S/jJITcMJ501ksO2THjttlNuG
 sCKQ==
X-Gm-Message-State: AOJu0Yxlci6aYpwyVNOmYdrbiHHju8VOUacfjHr7dvwmq5SjwKTwDcSc
 91BdCiuz2waEBV+eyMX/c4mg6OiyZaYMbMBcgy+FbdSjEWm4+MebTHwzy7GG47Ov61a1Ekq+i3w
 9
X-Google-Smtp-Source: AGHT+IGFJAUZPcHXacJm8b6TZHa5nckZP2AQEF9rtozbFV/GP/gVBP23YMvuhNoyaPPnUAM2dONp5A==
X-Received: by 2002:a2e:3317:0:b0:2d9:ed7c:7882 with SMTP id
 d23-20020a2e3317000000b002d9ed7c7882mr2280493ljc.26.1714599155079; 
 Wed, 01 May 2024 14:32:35 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a7bcb49000000b0041b5500e438sm3343933wmj.23.2024.05.01.14.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 14:32:34 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 01 May 2024 23:32:34 +0200
Message-Id: <D0YMO9JWPSZG.1HOCCJ064OASR@rtone.fr>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>
To: "Peter Seiderer" <ps.report@gmx.net>
X-Mailer: aerc 0.17.0
References: <20240427015517.413015-1-gael.portay@rtone.fr>
 <20240427211939.520ab908@gmx.net>
In-Reply-To: <20240427211939.520ab908@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1714599155; x=1715203955; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fvo+0vlJP/5Kj2s7QZ/Q58bASL7V1KnZU8QXxLdhl0s=;
 b=Au3RXMwEZoP3sRxxc8QpxkihkhNPIJ6fYI8YjCoGv5++/4m8PS4rtVhrvNMXZDqxcv
 jI+VnCroBPtYcss8QZ8rSzkb/E4ErFLnDP2php8kZgqtYsGnpGSYPtClv6p1F97qiafE
 RKDWz9zFYwK29jO6UZgK2MzYI2bywif/c8TSc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=rtone.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=rtone.fr header.i=@rtone.fr header.a=rsa-sha256
 header.s=google header.b=Au3RXMwE
Subject: Re: [Buildroot] [RESEND PATCH 1/1] board/raspberrypi_{3_qt5we,
 cm4io*}: autoprobe of bluetooth driver
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
Cc: Martin Bark <martin@barkynet.com>, Julien
 Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpPbiBTYXQgQXByIDI3LCAyMDI0IGF0IDk6MTkgUE0gQ0VTVCwgUGV0ZXIg
U2VpZGVyZXIgd3JvdGU6Cj4gT3IgcmVtb3ZlIHRoZSB0aGUga3JuYnQgcGFyYW1ldGVyIGZyb20g
YWxsIFJQaSBkZWZjb25maWdzIGFzIHRoZQo+IGRlZmF1bHQgY2hhbmdlZCBzaW5jZSBsaW51eCBr
ZXJuZWwgNi4xLngsIHNlZSBbMl0uLi4KPgoKT2gsIHNvIHRydWUuIE5vdywgSSByZW1lbWJlciB0
byBoYXZlIHNlbnQgdGhhdCBwYXRjaCBiZWZvcmUgKG9yIHJpZ2h0CmFmdGVyKSB0aGUga2VybmVs
IHdhcyBidW1wIHRvIDYuMTsgaXQgd2FzIGludGVuZGVkIHRvIGdldCBtZXJnZWQgaW4gdGhlCmJy
YW5jaCAyMDIzLjExIDovCgpBbmQsIEkgc2hvdWxkIGhhdmUgdGhlIGNoYW5nZSByZW1vdmluZyB0
aGUga3JuYnQgZHRwYXJhbSBzb21ld2hlcmUuLi4gRG8KeW91IG1ha2UgdGhlIGNoYW5nZSB5b3Vy
c2VsZj8KCj4gUmVnYXJkcywKPiBQZXRlcgo+Cj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNw
YmVycnlwaS9saW51eC9jb21taXQvZWMwOGU5MzgzN2VmYTJlNzVlNWNhYjRkODA0MjdmZGY3ZWEy
M2RhMQoKUmVnYXJkcywKR2HDq2wKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
