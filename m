Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320ACCD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6E43613E3;
	Fri, 15 Sep 2023 21:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6E43613E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QnQ7NK62KreS; Fri, 15 Sep 2023 21:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1410761379;
	Fri, 15 Sep 2023 21:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1410761379
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BAC61BF3D2
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70AC8421BD
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70AC8421BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4PR3Ik-cgr_9 for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:48:21 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 383C4421A1
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 383C4421A1
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5029e4bfa22so4265021e87.3
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 14:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694814498; x=1695419298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LtALcaFTDKVDYVOB5j2Qzbg3CjL2mTNCq43wc0cFAIU=;
 b=ji0tRdncCn/lqc4RvE8LncYTUj8xSkY7LRbLZxE/+lYsCBikRinBkMjuE3awB0zJxW
 fuin6Lt0Jt294XhzNxGTsHzsNXU24EluXmWj6/SXvWB5oeqp4HofysvHft1AKJ6WFJ0s
 lC7LYCgB5R4fY/hhfFCCGqSY3VmrTSkvODKYCZsasy8xO7kG3L7Kc9laALLrv2umtDe7
 WcYOC0TnSpluF2v5KIlV7jCmdrjE4SmYlHTuIpOyZTDajv21qxA6iMCJmj5n7OXpiNnZ
 qAfYAuNf4xp4a5orBCiBRMU/Iy/HJoRNgMKJA9PX1hndmm4X26qhOaJQph4Nn/38Y0mf
 KiRw==
X-Gm-Message-State: AOJu0Yz6Iv9foTAhxh5xQtHfQgM2KM9dsg61ugwg8Dj3UkgdfKVqACJz
 5Z2S42DVCym51T61nWHUL44pwqjsn9MZCUODYPuJLA==
X-Google-Smtp-Source: AGHT+IH4rD/F4greP2gInONRMr8CraLFK+2kNUbt/DUmxcRXn+FzHbNlL9MLQhusMDZ7XqqDIDBmQw==
X-Received: by 2002:a05:6512:1089:b0:4ff:7e80:4f1d with SMTP id
 j9-20020a056512108900b004ff7e804f1dmr2896300lfg.57.1694814498082; 
 Fri, 15 Sep 2023 14:48:18 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51]) by smtp.gmail.com with ESMTPSA id
 a15-20020a19f80f000000b004fe37339f8esm760064lff.149.2023.09.15.14.48.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 14:48:16 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5029e4bfa22so4264978e87.3
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 14:48:16 -0700 (PDT)
X-Received: by 2002:a05:6512:2111:b0:502:bdbd:841c with SMTP id
 q17-20020a056512211100b00502bdbd841cmr2085916lfr.33.1694814496192; Fri, 15
 Sep 2023 14:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230727232235.449788-1-christian@aperture.us>
 <b73fb293249bcf48f42ebaed0f78f1c1@agner.ch>
 <CA+h8R2r3sxFvPN5QFt9szw638M_9o=WRC3a8pUQ1O2KrGMvrkw@mail.gmail.com>
 <08DC739C-F115-4DB2-9F9A-0CD6E9BFEA42@agner.ch>
 <CA+h8R2rbhvCt60Fhwi1qGv0PocZsS0rA3fVQoukDP2KhPrkjdQ@mail.gmail.com>
 <23f2b3bd59cb6d860ea52b566eacfdb8@agner.ch>
In-Reply-To: <23f2b3bd59cb6d860ea52b566eacfdb8@agner.ch>
Date: Fri, 15 Sep 2023 14:48:04 -0700
X-Gmail-Original-Message-ID: <CA+h8R2o9eAVZBrzU1E8wbh_eoQfhWv+0JsH11_N4hrkPKqKCXg@mail.gmail.com>
Message-ID: <CA+h8R2o9eAVZBrzU1E8wbh_eoQfhWv+0JsH11_N4hrkPKqKCXg@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1694814498; x=1695419298; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LtALcaFTDKVDYVOB5j2Qzbg3CjL2mTNCq43wc0cFAIU=;
 b=AIabbOmNARB2fHVB5o8U8v0zwHKSe67WxQaJKgRjGsc3xMe3/+BBFY4n4R9QA2Av/l
 CpQaKiW+F9/YQBBJWjNoOQ1xlHkhJxM+GMWXRjcCKSpDg37CxVmDsO1CR4IJH8uKE9nh
 Ce/ZWawUCp1P66OT8ExWhombYd7+RpNybgO4qGCWu9/0ThRdcC7ZFOExovUkRprFGWwU
 N+fHxHocSijLqHbFhXYM/3BGEFWk4znL4lqQAlWHcwUtJyUnZF7APss3SNoIkTEoOkSh
 ho+lecxw1uJKa/i44Ip6EfTHRyk839pg1F4ALra+u8z+MhkIT2WhQ/z57u9DDiIb9kqC
 qmBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=AIabbOmN
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.6.22
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU3RlZmFuLAoKRGlkIHlvdSBmaW5kIGEgc29sdXRpb24gdG8gdGhpcz8gSnVzdCBmb2xsb3dp
bmcgdXAuCgpPbiBUaHUsIFNlcCA3LCAyMDIzIGF0IDExOjIx4oCvUE0gU3RlZmFuIEFnbmVyIDxz
dGVmYW5AYWduZXIuY2g+IHdyb3RlOgo+ID4gSSBoYXRlIHRvIHNheSAid29ya3Mgb24gbXkgbWFj
aGluZSwiIGJ1dCB3aXRoIGJvdGggdmVyc2lvbnMgb24gYWFyY2g2NCBpdCB3b3JrcyBmb3IgbWUu
Cj4gPgo+ID4gTWF5YmUgdGhlIGZpbGVzeXN0ZW0geW91IGFyZSB1c2luZyBpcyBkaWZmZXJlbnQ/
IEknbSB1c2luZyBleHQ0LiBPciBpcyB0aGUga2VybmVsIGNvbmZpZyBub3Qgc2V0IHVwIHF1aXRl
IHJpZ2h0PyBNYXliZSBvbGQga2VybmVsPwo+Cj4gVGhlIHJvb3QgZmlsZSBzeXN0ZW0gaXMgYSBz
cXVhc2hmcywgYnV0IHRoZSBkYXRhIGlzIHN0b3JlZCBvbiBleHQ0Lgo+Cj4gV2UgYXJlIHVzaW5n
IHRoZSBsYXRlc3QgdmFuaWxsYSBMaW51eCBrZXJuZWwgNi4xLjUyLgo+Cj4gSXQgc2VlbXMgdG8g
aGFuZyBoZXJlOgo+IFdBUk5bMjAyMy0wOS0wOFQwNjoxNzozOC41MTUyMTg2OTFaXSB3YWl0aW5n
IGZvciByZXNwb25zZSBmcm9tIGJvbHRkYgo+IG9wZW4gICAgICAgICBwbHVnaW49Ym9sdAo+Cj4g
RnJvbSB3aGF0IEkgY2FuIHRlbGwgaXQncyBzb21lIElQQyBtZWNoYW5pc20gb3Igc2ltaWxhciB3
aGljaCBpcwo+IGhhbmdpbmcuCj4KPiBJIGNhbiBhbHNvIHJlcHJvZHVjZSBpdCBvbiB4ODYtNjQu
IEkgZ3Vlc3MgaXQgbXVzdCBiZSB1bmlxdWUgdG8gb3VyCj4gb3BlcmF0aW5nIHN5c3RlbSBjb25m
aWd1cmF0aW9uIGluIHNvbWUgd2F5Li4uCgpCZXN0LApDaHJpc3RpYW4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
