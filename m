Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0786CC25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 16:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1D2E60687;
	Wed, 22 May 2024 16:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qduWVmhBcXSs; Wed, 22 May 2024 16:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4F5760710
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4F5760710;
	Wed, 22 May 2024 16:09:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C53D31C5D3A
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 16:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFB2B81241
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 16:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OCtdZDDcTDPd for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 16:09:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BCF881234
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BCF881234
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BCF881234
 for <buildroot@buildroot.org>; Wed, 22 May 2024 16:09:42 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-420160f8f52so9659475e9.0
 for <buildroot@buildroot.org>; Wed, 22 May 2024 09:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716394181; x=1716998981;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fu50LW4/vUfrhIJLJsJIiZrMBvqAqFJZOlFDqkFbym4=;
 b=rLGB+f3siliv1cn44LPHO7KHjVgrtSGsUqG+B7dviF7yLasxnzjQ49HrlstZV/pO6X
 aTQWD6TmuPyPl/2JP19do7Gy+XojnXjkrzw7pnZF4rS0mrIaWHadUFeM/86xYkg6k6mj
 R/1tm3Yb+vxFNs/9tAL5FPaLxKTRVJsWvkln19X72rW6ukicZgDVmHXHGyJDIjEDTyjm
 uR99nejNsZNRHQlhw9n9rjcVb09nXCn1M84yJh8JGLtO1zdoEpRKsQ3OIiLvWap/OVy3
 9DNfEFm5q2dpdArB84qPpUFjDT2+Io44DnTalcazuFdYn0y4Su9kZcR4q4Dh/bWsrCLT
 Jh1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRrzx22fiWz2yodsNaunHKzowUlj8MeyCakKMW+KdAxI54Smvmb43g/Jao0QvYASY/8fags9t7rr/61kCKJcR7jyqPBmHJRw==
X-Gm-Message-State: AOJu0YykbJhey01jVxVbV5ImZWABiu0F6EpveTCitbZ25GU9FVs5s6gq
 8j2dmLQvMilcegma5pyIS+1qOsEx7886Nqao9otEleDdtrtDZYeEG9265q11Uodh9koKpPHjfkU
 +
X-Google-Smtp-Source: AGHT+IEjfhgGFlqfQoM+jEL8z+zKgxxECiBPNwZ+39hXRNvgHbwLkfaAQttGDnJcqPFqS44x1MFErg==
X-Received: by 2002:a05:600c:5112:b0:41f:ef1e:7312 with SMTP id
 5b1f17b1804b1-420fd301fa0mr19037455e9.14.1716394180904; 
 Wed, 22 May 2024 09:09:40 -0700 (PDT)
Received: from [10.5.0.27] (202-122-190-109.dsl.ovh.fr. [109.190.122.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccbe8f8asm503637645e9.10.2024.05.22.09.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 09:09:40 -0700 (PDT)
Message-ID: <8b6c5643-1fef-44eb-9f6f-6910633daf99@smile.fr>
Date: Wed, 22 May 2024 18:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20240519101355.7792-1-peter@korsgaard.com>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240519101355.7792-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716394181; x=1716998981;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Fu50LW4/vUfrhIJLJsJIiZrMBvqAqFJZOlFDqkFbym4=;
 b=Dy9wGvxF5+TG+iDGVI+ueIywVXkoCBJT+ZVy+VRUAbqI62SZo2hAA8RiSgUvXfHb4P
 BKJVzV0Uv63lXTJ91R2wvkRSNQzUm9gV2jGYD22sqGz1tR1jNaWJKq8bINiKZOqF/K35
 4KODR4RbTaUPlKcwdn2DfVEvy5eTKkAdnNGLeOtnftKeemPLoJrknefzb6VKeiihh/X8
 uauZRPm0/H/20qKfo4OtObKm7spX5x6tPO8GZaxMsBsNWrgC+l9lvqIziKs/agIKulFB
 xn9SeAOQbK+fT8uZC77D3jw8GpIzkRBIqNExhHoqmQReZo8TkB3K6T8LAmyinWVKFx8n
 aFlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Dy9wGvxF
Subject: Re: [Buildroot] [PATCH 1/5] configs/orangepi_r1_defconfig: drop
 double _HOST_UBOOT_TOOLS=y
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSAxOS8wNS8yMDI0IMOgIDEyOjEzLCBQZXRlciBLb3JzZ2FhcmQgYSDD
qWNyaXTCoDoKPiBGaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cj4gb3JhbmdlcGlfcjFfZGVm
Y29uZmlnOjM1Ondhcm5pbmc6IG92ZXJyaWRlOiByZWFzc2lnbmluZyB0byBzeW1ib2wgQlIyX1BB
Q0tBR0VfSE9TVF9VQk9PVF9UT09MUwo+IAo+IFdoaWxlIHdlJ3JlIGF0IGl0LCBtb3ZlIHRoZSBI
T1NUX1VCT09UX1RPT0xTXyogb3B0aW9ucyB3aGVyZSBzYXZlZGVmY29uZmlnCj4gd291bGQgcHV0
IHRoZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2Fh
cmQuY29tPgo+IC0tLQo+ICBjb25maWdzL29yYW5nZXBpX3IxX2RlZmNvbmZpZyB8IDUgKystLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvY29uZmlncy9vcmFuZ2VwaV9yMV9kZWZjb25maWcgYi9jb25maWdzL29yYW5n
ZXBpX3IxX2RlZmNvbmZpZwo+IGluZGV4IGJhZDFmOTQwMGMuLjMzMjc2MWJiNzEgMTAwNjQ0Cj4g
LS0tIGEvY29uZmlncy9vcmFuZ2VwaV9yMV9kZWZjb25maWcKPiArKysgYi9jb25maWdzL29yYW5n
ZXBpX3IxX2RlZmNvbmZpZwo+IEBAIC0yNiwxMyArMjYsMTIgQEAgQlIyX1RBUkdFVF9VQk9PVF9O
RUVEU19QWVRIT04zPXkKPiAgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWUxJQkZEVD15Cj4gIEJS
Ml9UQVJHRVRfVUJPT1RfRk9STUFUX0NVU1RPTT15Cj4gIEJSMl9UQVJHRVRfVUJPT1RfRk9STUFU
X0NVU1RPTV9OQU1FPSJ1LWJvb3Qtc3VueGktd2l0aC1zcGwuYmluIgo+IC1CUjJfUEFDS0FHRV9I
T1NUX1VCT09UX1RPT0xTPXkKPiAtQlIyX1BBQ0tBR0VfSE9TVF9VQk9PVF9UT09MU19CT09UX1ND
UklQVD15Cj4gLUJSMl9QQUNLQUdFX0hPU1RfVUJPT1RfVE9PTFNfQk9PVF9TQ1JJUFRfU09VUkNF
PSJib2FyZC9vcmFuZ2VwaS9vcmFuZ2VwaS1yMS9ib290LmNtZCIKPiAgQlIyX1BBQ0tBR0VfSE9T
VF9ET1NGU1RPT0xTPXkKPiAgQlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15Cj4gIEJSMl9QQUNL
QUdFX0hPU1RfTVRPT0xTPXkKPiAgQlIyX1BBQ0tBR0VfSE9TVF9VQk9PVF9UT09MUz15Cj4gK0JS
Ml9QQUNLQUdFX0hPU1RfVUJPT1RfVE9PTFNfQk9PVF9TQ1JJUFQ9eQo+ICtCUjJfUEFDS0FHRV9I
T1NUX1VCT09UX1RPT0xTX0JPT1RfU0NSSVBUX1NPVVJDRT0iYm9hcmQvb3JhbmdlcGkvb3Jhbmdl
cGktcjEvYm9vdC5jbWQiCj4gIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9InN1cHBvcnQv
c2NyaXB0cy9nZW5pbWFnZS5zaCIKPiAgQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSItYyBi
b2FyZC9vcmFuZ2VwaS9vcmFuZ2VwaS1yMS9nZW5pbWFnZS5jZmciCj4gIAoKQXBwbGllZCB0byBt
YXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
