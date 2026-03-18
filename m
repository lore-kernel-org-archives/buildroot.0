Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723E81077604
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 19:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D42D341723;
	Wed, 18 Mar 2026 19:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnYY_IZ8sFPc; Wed, 18 Mar 2026 19:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87E2A4132B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773860906;
	bh=aUvEos+dZ9bNvj7BknVbUvCjymDMXUEpa8I6PHIi5ys=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eg0g5mgpHMnxkwEwRcOzEARJXqEyBwKNDWvcI94CUcnO0dnEHoEPAh7W1x1dKRcu9
	 hf7QQAAu00SzZOz3obs0lKdv08dHMz8yFNru/nfQ9wsVdUrKkFQSB+hxefxVM/osP7
	 DTmalWmQA2Jp3u0F7QmBegsTOfDxJW1AzjwcholzV1s4PKk1dwfbtMyfIN28ZEd2oX
	 WSgB3VOTECbnAN4q1axeDgZABxqfKTp7D+QmlNLxpMjd/BqnwyiPMU2/7qmcmechdb
	 t3QqajCl0IjBfofJaklKzI2U4S5rx9JCsaDw3kYzMqgDNXKovtLnatkrkzQ+gbi/tM
	 nX0AEFpvfmWuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87E2A4132B;
	Wed, 18 Mar 2026 19:08:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E1E31BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 19:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0877E8289B
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 19:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAA2r3z0kxBq for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 19:08:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4868083753
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4868083753
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4868083753
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 19:08:23 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-439fe4985efso102861f8f.3
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773860899; cv=none;
 d=google.com; s=arc-20240605;
 b=J8uXxkla511iDLQh5hHhrNf5jF/e3gp6u1Zzr2IONBn0+oEuTD3hIRDzXMMWpJhNIX
 A03l2QvjTQFtSt6wIURRqUfhAzcZUDsMSCGXfRSiDJ4BXV99MX+w+Myh8M8R+lQkRxSc
 qkOw3JTtJToTL5MJMXoUsw81RLLybtbnioUO+LWjuHtaf/esYZDCn+Wqxckw0SRn3Cvq
 71fmk6fiGxtok6milctmsAo+R/KwTs8+BogZfErKG6uFZBFK7prLo8IoolzY4KSydTCc
 jY4G9v1IBw1YdqyJDjhEo9tOVrTID5K6nERUhKc9OWw6SyakM5p7pf5RKU6BLBN37VeZ
 TiIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=SUYotcTMuMEqjsR5uAjxhzQ8BW83Bh0oOCyUv/x4elM=;
 fh=kV9UqK9gm2vy3lxY4oRSYGuL1NTrUh3b94wdaVaoN80=;
 b=GLBFdHFwPr+mDF8wJQhBGz1+tJF0NN5JGx+CBxLP6ylzmRK4ofgre2mQi5Q4h4UlaK
 xZCUbBZwRnRBl5QgIcVCnypepXP4pWEcRalE4YBkiciZRXBRLnQ9tQY4+h7cNXb0Z1Zv
 0fhXXviAy81HIwdRF/qRI+d9vLeYj1+CzyVYY/GpTKOrCZgJHCAiXMGx6oKbJuti3PPA
 DlcK1V1mRwZY3ZZlUbrBTP567b7Rg4yEXhqCP8j0N0NUMzH+JMMAihXSL5SwACLpacIt
 dN1GkbF1veldgEf/0Ne1dqCf1SB+a+IQNu5HB2i9oksjOXLqUr4Xo3eKEluIrYPSVExb
 l5zA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773860899; x=1774465699;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SUYotcTMuMEqjsR5uAjxhzQ8BW83Bh0oOCyUv/x4elM=;
 b=S6qhEEpetjAsAVSUQtMe4cxsNS5S1hrsmMrz0SdZprw/P8cZcHBD+0RUeTcwBPPnZ7
 10cxxxH8cQqqRuSgmXKn90NDWWVFmjXmonWyWS3cxc/OB0tO6h7wWh2bHjou7kCXokKw
 yOK8TzuUWh6EWe1jMXzqJ6N6IucK7x5K/QDdUGPTLnUJRlCajc6zM9JctblmIXiJeJbI
 VrfWNVdAjSn37Y6QDmkwJ/JQSUSjB41fecoFQ2OUTiWAK5HPCnker/DPWgaeF9G3tTUt
 zPIWacsxDJFHPBj5dYgPQxHoFsUp9ptsuZp8T0g1A1BBBB0dXOB0NVzq7mJjGK6IIHkq
 ivcg==
X-Gm-Message-State: AOJu0YxeqvRYNmbZzb5Qcvv3ztVWCeN0BB4u2+VkMhLxGhxGnk7HmHXu
 u3RgZjF0Ku37Ss4K5q1YDt4aEtaeD2x3NpqU6xhaqMWN/Hd7q3J8qKk6TnM20RTUqoJD6icKkLS
 qQmCuqel8A6z5G/uGWBeDNjGCsBDJnlRiXiwUp+g=
X-Gm-Gg: ATEYQzzu5pMb3cSDxoz9eu7xEFGPTJwz68Lo/fpxXMnJiyF5YlATpI+YOWIoITihwGY
 6eQPaAUWRxZyyPmt0cKWjTzkzIZM9Wyf9QuKmOozpnSTZmZ9gtIvN8KsWJe7hWRSAAXlOL+NRO8
 GZnTimUY148JNTX4vOjm+0QBv9oZfuEMiBI9PmOSDqENjSAfAQ3qGLa1xTPfCd4LkhVo1eo6jVq
 H+MrqJdZsGNXVeZi19/sdJ5ZIsJ2ZHqBZ/hGaVkYcyorzdTZO5DudC0Fs9ENhVMG2vGiFZ6PmMr
 KRv3dQ==
X-Received: by 2002:a05:6000:184d:b0:43b:42af:75e with SMTP id
 ffacd0b85a97d-43b527c92f4mr8010437f8f.44.1773860899239; Wed, 18 Mar 2026
 12:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260317-virglrenderer-v4-0-ed223e222bb6@gmail.com>
 <20260317-virglrenderer-v4-3-ed223e222bb6@gmail.com>
In-Reply-To: <20260317-virglrenderer-v4-3-ed223e222bb6@gmail.com>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 18 Mar 2026 12:07:40 -0700
X-Gm-Features: AaiRm53_zo0pi4bvdBKspumOaFvS-OAVmXoDagSIFn7NhsOHffD3JwZZDcped3k
Message-ID: <CAMWSM7hvUjX+uc3FYw1QgJh-_FwFDTc7cNG2cGBsOVKvt2+4vQ@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, Joseph Kogut <joseph@anodize.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773860899; x=1774465699; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SUYotcTMuMEqjsR5uAjxhzQ8BW83Bh0oOCyUv/x4elM=;
 b=XaKPyINjHY7tKQNsoSh/S8Xt4HHvOvNv/dowO3Ek5jQJwVbjhjjo+jD7Z8+rDFy+TO
 ZU1sKa5gOonyoeTHXxt0QyIxlkGZH8kvEhhuFiMqNVquSozRVKGPRxhdFYijfw0GtYu8
 9J5xsy1MJ26mRzfdGlxY4j0gRvDiDy0lbwtdkQ04jb/dMAACd4R3KybiutChefj7sXeb
 KOwTFgvx85Tl9gaBVm0vPgxNIvFTPS2ndS7iHVdQOTv6lhLLCWNDnr6qkhf2xrH07kIq
 h2kPXLi6jmqE5Bcrorf23CUQ2BmB0VLgvMMibX9TfEaMQBDO52lG2bVnH5mOJJggUqsA
 DmEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XaKPyINj
Subject: Re: [Buildroot] [PATCH v4 3/5] package/virglrenderer: Fix build
 with glibc 2.43
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gVHVlLCBNYXIgMTcsIDIwMjYgYXQgMzoxNuKAr1BNIEpvc2VwaCBLb2d1dCA8
am9zZXBoLmtvZ3V0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBKb3NlcGggS29ndXQgPGpv
c2VwaEBhbm9kaXplLmNvbT4KPgo+IEFkZCBhbiB1cHN0cmVhbSBwYXRjaCB0byBmaXggdGhlIGJ1
aWxkIHdpdGggZ2xpYmMgMi40Mywgbm90IHByZXNlbnQgaW4gYQo+IHN0YWJsZSByZWxlYXNlIHll
dC4KCkl0IGxvb2tzIGxpa2UgSSdtIG1pc3NpbmcgYSBTaWduZWQtb2ZmLWJ5IGxpbmUgaGVyZS4g
QWxzbywgbXkKZ2l0LXNlbmQtZW1haWwgY29uZmlndXJhdGlvbiB3YXMgaW5jb25zaXN0ZW50IGZv
ciB0aGlzIHNlcmllcywgc29tZQpjb21taXRzIGFyZSBhdXRob3JlZCB3aXRoIG9uZSBlbWFpbCBh
bmQgc2lnbmVkIG9mZiB3aXRoIGFub3RoZXIuIEknbGwKZml4IHRoYXQgYW5kIHJlc3VibWl0LCBz
b3JyeSBmb3IgdGhlIG5vaXNlLgoKQmVzdCwKSm9zZXBoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
