Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7FEEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 04:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 189A260E76;
	Mon, 17 Jul 2023 04:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 189A260E76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U8bGD-hm_S84; Mon, 17 Jul 2023 04:55:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6171060E73;
	Mon, 17 Jul 2023 04:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6171060E73
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8EA4B1BF373
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 04:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6836B815CD
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 04:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6836B815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVGXNZvkzsT9 for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 04:55:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25966813FB
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25966813FB
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 04:55:32 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fbb281eec6so6260011e87.1
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 21:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689569730; x=1692161730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=09XiIZkOzU04WXXAyc86P2VF6D0nGFYUxmrHU5XRxyY=;
 b=Kh9eb9j27pA6Ay4SBCZhxWg2jVAGrSh91X0BZTHtEsJsdKqoYokWvfF/pSDWS/pLtI
 mYgnuv5t0iEuambmMtrNQjSEQx8kxt0whN1kuaC2dGmgU1biPfF+WioNxX70hBBuFP17
 bnfsExOASE7PuRJj4zBTrYEof95TeLR1MfsXHE5m0uWQauZD+F39YoGHyOVPWL53CYiu
 Ufm2ZiYK6NZqrcm0AVET53a6wNelFOtOrEHkHXYuTpJAwWyKcv6Nr1P8lSod289pIRnw
 u6lu/XDgi0aNdM4nyxn/i+q54a7CRbqhZ/T4OvKNZz8SxJq4R2SlUaI6D90Cx2axJ9BH
 LwRQ==
X-Gm-Message-State: ABy/qLYZGkwzN0Uj9svIFRQPnBp8p6iOK6ha1acH85v4uIaaVzzvxCAZ
 oJOb3S1B3SdP7ZzaMypN20GO/aS6gM7zDHzPSKI=
X-Google-Smtp-Source: APBJJlHvm7WD6gMxkJuOj5npcsYff9tFUZGTZo6lmwa3M1TzWNmAYxO5RlGoGvfIunQx0618MOGSXA==
X-Received: by 2002:a05:6512:1084:b0:4fb:76a5:2325 with SMTP id
 j4-20020a056512108400b004fb76a52325mr7337704lfg.24.1689569729695; 
 Sun, 16 Jul 2023 21:55:29 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 w7-20020ac25987000000b004fbb3872190sm2611165lfn.113.2023.07.16.21.55.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jul 2023 21:55:28 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-4fbf09a9139so6258974e87.2
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 21:55:28 -0700 (PDT)
X-Received: by 2002:a05:6512:234a:b0:4fb:9d61:db4d with SMTP id
 p10-20020a056512234a00b004fb9d61db4dmr8482406lfu.18.1689569727976; Sun, 16
 Jul 2023 21:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230711224536.1799553-1-christian@aperture.us>
In-Reply-To: <20230711224536.1799553-1-christian@aperture.us>
Date: Sun, 16 Jul 2023 21:55:16 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qPeACukDSSf+nWJ2SePw4Y=S92ioQa1PijM+Ya3uHqZw@mail.gmail.com>
Message-ID: <CA+h8R2qPeACukDSSf+nWJ2SePw4Y=S92ioQa1PijM+Ya3uHqZw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1689569730; x=1692161730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=09XiIZkOzU04WXXAyc86P2VF6D0nGFYUxmrHU5XRxyY=;
 b=ywXrOX6/zDiuWLrAmdMtoTW8EyDaJR18jSmJlJ35oUahgHOlJBhqJiinRj3s3/vjc5
 d7rqWlCmHwlRqqfh4oVzbpu1asjR/UYzs6ICJBzjGs04SFFI24E5OysXpNKgymTv0UEP
 UXC0NKr/yLjLD7fbnbwEEYEyE3w6gEzOod+CzScEe0yzj9yMDrGQJu1Mv/Vhnwtap2uE
 dteO8pQdB6DAh6q6V9y3P8FqrLt8i45xjhNG5v+ZKoASyKud/Y4PLIK+KNrVipq8U5ph
 1uqNf2kroswt7UuDMGoJ4mMeK+ipULAJFLQZUJBj/VCKJv2smFo66F37u9kYLENyYf/J
 faAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=ywXrOX6/
Subject: Re: [Buildroot] [PATCH v2 1/1] package/docker-cli-buildx: new
 package
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

QWxsLAoKT24gVHVlLCBKdWwgMTEsIDIwMjMgYXQgMzo0NeKAr1BNIENocmlzdGlhbiBTdGV3YXJ0
IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+Cj4gYnVpbGR4IGlzIGEgZG9ja2VyIENM
SSBwbHVnaW4gaW1wbGVtZW50aW5nIGV4dGVuZGVkIGJ1aWxkIGZlYXR1cmVzLgoKPiBIb3dldmVy
LCBidWlsZHggaXMgYSBzZXBhcmF0ZSByZXBvc2l0b3J5IGZyb20gZG9ja2VyLWNsaTogaXQgaXMg
YSBwbHVnaW4gdGhhdAo+IG5lZWRzIHRvIGJlIGluc3RhbGxlZCBhdCAvdXNyL2xpYi9kb2NrZXIv
Y2xpLXBsdWdpbnMgb24gdGhlIHRhcmdldC4KCj4gK2RlZmluZSBET0NLRVJfQ0xJX0JVSUxEWF9J
TlNUQUxMX1RBUkdFVF9DTURTCj4gKyAgICAgICAkKElOU1RBTEwpIC1tIDA3NTUgLUQgJChARCkv
YmluL2J1aWxkeCBcCj4gKyAgICAgICAgICAgICAgICQoVEFSR0VUX0RJUikvdXNyL2xpYi9kb2Nr
ZXIvY2xpLXBsdWdpbnMvYnVpbGR4CgpUaGlzIHNob3VsZCBiZSAvdXNyL2xpYi9kb2NrZXIvY2xp
LXBsdWdpbnMvZG9ja2VyLWJ1aWxkeAoKSSB3aWxsIGZpeCBpdCBpbiB2MywgYnV0IHdpbGwgd2Fp
dCB0byBzdWJtaXQgdW50aWwgdGhlIHByZXJlcXVpc2l0ZQpnbzEuMjAgdXBkYXRlIGlzIG1lcmdl
ZDoKCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gv
MjAyMzA3MTEyMjA4NDkuMTcwMjM1OC0zLWNocmlzdGlhbkBhcGVydHVyZS51cy8KClRoYW5rcywK
Q2hyaXN0aWFuIFN0ZXdhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
