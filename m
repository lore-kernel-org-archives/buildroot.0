Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B99CA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 22:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CB82842F6;
	Wed, 10 Sep 2025 22:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTqcwacSlmHi; Wed, 10 Sep 2025 22:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 740B484403
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 740B484403;
	Wed, 10 Sep 2025 22:29:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 537372BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 22:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A12584403
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 22:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSgOntccncZr for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 22:29:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 38EE3842F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38EE3842F6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38EE3842F6
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 22:29:16 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-55f74c6d316so50133e87.0
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 15:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757543355; x=1758148155;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ks1prYdf3GuWkB/GDc41J/GRAUD7eSwqe9gSGBPxilE=;
 b=TI9YS4h14KYllbSCMA6ygq2Wor43O8diTUinIgklevubdch/HnZYBvtz5OZY3Fb2LM
 oZ5rTL+XOsqk9wYLV8ihLm7Sin/uiw8G7M3H0SogScJqUu3nWoC6lmloq5JEFT197PUA
 uc8oZqWcgIfcWJKq9qCUPFl4wq5ArX/0pCeyN9SAg5p7ggSgSfG2en9U9oZYUEYuo5WI
 MC81JJ507qR+1RKlbcgX/wJCDlLnAQChY2eafibgHT7uK4Ypkas/hvQ81GkCImJmnbw1
 EdodTBEZsr0IyvSXbIDd8qYBkx4CZc0fM4scXaalkA5jmkgrQqBLmJVhPTLsOYbNy6Hw
 UWTQ==
X-Gm-Message-State: AOJu0YyNezpaYRudP/Fx+Qds8Yt/sr1CuJLLdsNZ9Pc41FLkEHRtOaLe
 idHEeWL+6B1FGniyzV7P3Jh5KssMgJkL84PqDdXYGi8qyOyTITQdGjBw3oqIk0oTmKB+AiZ8JEW
 Xf+CHUHq6Vg==
X-Gm-Gg: ASbGncvNvQz7LcT1coaQfvmwUC72d5yJVQlpHcJN28HnZeQmd/CbblppJ0RiwjkjlV1
 1ULgBxpQgJovZZ4WSgoDLgQ3l+LoPI+cimyE5cmcyS1zwJSj2vD9YR7/GjVP3NsfLHRtlVMxIk0
 Qec+GlaWgUuSGX/eWnHm2SSb2+j3DoHm0FeEHfbPTRqIbBijZOyzI0BjSGR/56G9hVZYH+s4L8I
 3sM2RbLQ+piygDbIwPgMfNcWJmfQc/u7h17H7Wj5SDPfSLbfCRB4qj8cIN6hTNo1p+yBCoR1iIp
 bLJ2LL6zVQDEWvKnrSkSrkKe+O/bQ0Hp6VJHu8o5h7hkGfj5aZI2PoZaU73nQ62aSYtG1JK6pye
 dB0gz7xXT0eBd+u9OAMfzFKT3NRTLOIh94bpHqQFTB2k4wsioHDLV4qQj3q8wCSV2Vg==
X-Google-Smtp-Source: AGHT+IFl+2+BIcYmfd83rY9eJ4JWPaD0Du4Iy4BzizESmaQieCmvdaRCHBlYr6a8MMMpELtiVk0J9A==
X-Received: by 2002:a05:6512:a92:b0:55f:4423:f52 with SMTP id
 2adb3069b0e04-562636d7a39mr6104061e87.37.1757543354610; 
 Wed, 10 Sep 2025 15:29:14 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e1e46721fsm39633e87.35.2025.09.10.15.29.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 15:29:14 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-336d2b0ea8dso800491fa.3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 15:29:14 -0700 (PDT)
X-Received: by 2002:a2e:be22:0:b0:336:85e3:a95c with SMTP id
 38308e7fff4ca-33b537e650amr52214381fa.29.1757543353742; Wed, 10 Sep 2025
 15:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250910183458.1288165-1-james.hilliard1@gmail.com>
 <CA+h8R2ozbY7zf0=x+gP=bgruLYOK7qW1Ex5Sa0x_h_gaqqHrwg@mail.gmail.com>
 <CADvTj4pVPa=j0BrhiJMoiYBmzq_uXbUtUw-xEqdNoWUCkam+VQ@mail.gmail.com>
 <CA+h8R2rhgRvEegJ4a7MZX+iKqqdswN6xRxds0rPu12eh50jvSQ@mail.gmail.com>
 <CADvTj4pzNug8M53i6c2bMcZgKc0_LXrQG22cJ4NA=OSv-qHKJA@mail.gmail.com>
 <CA+h8R2qh53rU4g6_m4EAc+4qPxZZTBXu_-osrojNLMf0HR_+vQ@mail.gmail.com>
In-Reply-To: <CA+h8R2qh53rU4g6_m4EAc+4qPxZZTBXu_-osrojNLMf0HR_+vQ@mail.gmail.com>
Date: Wed, 10 Sep 2025 15:29:02 -0700
X-Gmail-Original-Message-ID: <CA+h8R2o5cONixvA2Gat9=OptwG1XoqURWe87aBa1gZ6NRbQUqw@mail.gmail.com>
X-Gm-Features: Ac12FXwi5p--i96nLlbLmbYRkeZ2hGdgEI8o1diHX7FAcQUWEQs2TnvwR_92o_M
Message-ID: <CA+h8R2o5cONixvA2Gat9=OptwG1XoqURWe87aBa1gZ6NRbQUqw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1757543355; x=1758148155; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ks1prYdf3GuWkB/GDc41J/GRAUD7eSwqe9gSGBPxilE=;
 b=eq0Erb7LdCo69pH0F33OtKFJfZbDD5sELtCqhRmHoCWLcK81JU+drZAYr9DBlMktPw
 B1sMjDpLMFfKtUshJi9faVe8NhzQca+CdIPfLjN0hdD7+WZitK9bPuZchyTPY6fhGWzd
 4s+2MXVM3kqniB9WLEzevxnXx6EjryQIlYQZU4SVf5aL/Jn5Y5f4jfyVjWcvmH/EcmU6
 Uep4S8KNbWe6i/4KSNMACHVcy70ukRbHxozsJj5bPyIgnwjJtoyOzd/kU08Ypt4GIeuO
 R70VlW3hiH84L57J4TDEC4l61H9+P9Y9sM2yyl4sUcDrPNJGGIpM0rX+nlEzJ+iuAftg
 BbRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=eq0Erb7L
Subject: Re: [Buildroot] [PATCH 1/2] package/go: bump to version 1.25.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsCgpPbiBXZWQsIFNlcCAxMCwgMjAyNSBhdCAzOjIy4oCvUE0gQ2hyaXN0aWFuIFN0ZXdh
cnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4KPiBIaSBKYW1lcywKPgo+IE9uIFdl
ZCwgU2VwIDEwLCAyMDI1IGF0IDI6NTnigK9QTSBKYW1lcyBIaWxsaWFyZAo+IDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIFNlcCAxMCwgMjAyNSBhdCAz
OjUz4oCvUE0gQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6
Cj4gPiA+IGp1c3QgYmVjYXVzZSB0aGlzIHdheSBpZiB3ZSBuZWVkIGdvMS4yNCBmb3Igc29tZSBy
ZWFzb24sIGEgdXNlciBjYW4KPiA+ID4gcmV2ZXJ0IHRoZSBnbzEuMjUgY29tbWl0Lgo+ID4KPiA+
IFNlZW1zIGtpbmRhIHBvaW50bGVzcyBzaW5jZSB0aGVyZSBzaG91bGRuJ3QgYmUgYW55IHJlYXNv
biB0byB1c2UgZ28xLjI0LAo+ID4gYnV0IGRvZXNuJ3QgcmVhbGx5IG1hdHRlciB0byBtZS4KPiA+
Cj4gPiA+IElmIHBvc3NpYmxlIGxldCBtZSBrbm93IHdoYXQgY29uZmlnIGNoYW5nZXMgdGhlcmUg
d2VyZS4uLiBJIGNvdWxkCj4gPiA+IHJlc3RydWN0dXJlIHlvdXIgY29tbWl0IHRoaXMgd2F5IGZv
ciB5b3UgaWYgeW91IGxpa2UgYXMgd2VsbC4KPiA+Cj4gPiBJZiB5b3Ugc3F1YXNoIHlvdXIgMyBj
b21taXRzIGFuZCBjb21wYXJlIHRoYXQgYWdhaW5zdCBteSBwYXRjaCwgaXQKPiA+IHNob3VsZCBi
ZSBtb3JlIG9idmlvdXMgd2hhdCBhbGwgdGhvc2UgY2hhbmdlcyBhcmUuCj4KPiBJIGRpZCBkbyB0
aGUgZGlmZiBhcyB5b3Ugc2FpZCBhbmQgdGhlcmUgYXJlIG5vIGNvbmZpZyBjaGFuZ2VzIC8KPiBk
aWZmZXJlbmNlcyB0byBub3RlIG90aGVyIHRoYW4gdGhlIHZlcnNpb24gIyBvbiBzdGFnZTQuCgou
Li4gTXkgYmFkLCBJIGRpZCB0aGUgZGlmZiB3cm9uZy4uLiBpIHNlZSB3aGF0IHlvdSdyZSBzYXlp
bmcgbm93Li4KCk9rLCBJIHdpbGwgbWFyayBteSBjb21taXRzIGFzIHN1cGVyY2VkZWQgYW5kIHdl
IGNhbiBnbyB3aXRoIHlvdXJzLgoKVGhhbmtzLApDaHJpc3RpYW4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
