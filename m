Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396F5C54E90
	for <buildroot@archiver.kernel.org>; Sun, 25 May 2025 07:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C741F4068C;
	Sun, 25 May 2025 07:13:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oSQ-h5VklNm; Sun, 25 May 2025 07:13:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0796E406A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0796E406A3;
	Sun, 25 May 2025 07:13:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA245119
 for <buildroot@buildroot.org>; Sun, 25 May 2025 07:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B78E14006F
 for <buildroot@buildroot.org>; Sun, 25 May 2025 07:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jo01I9nJH44o for <buildroot@buildroot.org>;
 Sun, 25 May 2025 07:13:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 09F7440062
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09F7440062
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09F7440062
 for <buildroot@buildroot.org>; Sun, 25 May 2025 07:13:29 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e7d7f7151f0so926088276.0
 for <buildroot@buildroot.org>; Sun, 25 May 2025 00:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748157209; x=1748762009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YPaVUL8EeP+TNO/EabiQjhi9LxRueZra3uDUe6hfGyA=;
 b=Gj0AN/HuD+OkDj8cYJun/rdpZyiXj/4vY4/PSCq0W60pUbxh6rvEorojWqky55BTa+
 a95fSbJDV3bESGp25KfpcunPLpJtWUy+F6f5/NS3p9ZxbbrE59ElzSjIGNZdH1esFTjs
 tONPr85W7UctLuMpEglTI2SOmRFbpvdtwC6UhbnTZKPNBa4fbJqJBmVVz8yZByKf91r9
 vdomS2EvFWSnFFQM0PBAlLobHMjJGK0V/z6G7/W98o+LWIrCIH8kx3PslIkwFpq3kn1Y
 8jCexGP3akB/J0pgf8oACwp0LpPRyJxloCdCU/QmjwBPN5crRC7hxRqz52F8lsDB99fJ
 A+qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqfezNojFoJersJk3eEoMizy9oblK7bibRBBXtQ3rB47wcHU/gcuJ4CUN9zYuQKam9VSd8y14pNvI=@buildroot.org
X-Gm-Message-State: AOJu0YxERPHIHnCOwFCkawHu14i+eEhrdZs0cLq/IVJ7u0Q6TCH7aFvP
 vHLsFeL5wPfbkmagG2hSQ5+j/sB57xWrA09WZIhg35gnjswAQHr/8E8Wx5wINZV5BJt2aptDnYU
 R4edj
X-Gm-Gg: ASbGncvMgwb3aoS7OGEnhmUqFLRf0pTIVOTCo4ZCEmc5705NenabWRaENhjU/O+nW+c
 4ayWa14kBVsTZ7Ljsh54ukJDkXKUliujxJtGhJwzgNJGvet6zJvqvLxWnGCV7yd1Z19rwic7cI2
 PQpdyfhs+rkSHbotsywIEmOavZx8y6zsSiTifEU8Q/x2uywaPCPo867xOkGtw3HtfhKhLBeTtAV
 QFgC6ItgkRNMhdGu0kCGgPF5cRO0uKAfSDO5Wath6OfWp7Fuz51h0SGkPGABLIh1aUKQgjquYfl
 m6xZri/3wlyNyRWyz9zg57pH0IH9ffYXTuUhaorpCwxCFLoGFDGj2+jdhBgiOk6slcO0hVT/HrB
 y9qFRS2TQA9MLBL8TNIqthMVoWyYG5Q==
X-Google-Smtp-Source: AGHT+IHxjk7FkUJSrhapLKXtXFhsxDCd6SiUCwkA4ZZMvGwFYMYTocFpXK3YuwpaIxU3CUMO5Pdl7A==
X-Received: by 2002:a05:6902:2b8c:b0:e7d:9fbf:275e with SMTP id
 3f1490d57ef6-e7d9fbf2f1emr1971394276.44.1748157208581; 
 Sun, 25 May 2025 00:13:28 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e7da9ebdb3fsm80347276.31.2025.05.25.00.13.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 May 2025 00:13:28 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e7d7f7151f0so926081276.0
 for <buildroot@buildroot.org>; Sun, 25 May 2025 00:13:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVRTphExvNLRtiFvM8trmiC1l57gOLaqE2eIRDZ+bVzBY1UBdvo8jPVXBpU3mYbOEL7qd+IjBIOugI=@buildroot.org
X-Received: by 2002:a05:6902:3382:b0:e7d:6829:207a with SMTP id
 3f1490d57ef6-e7d919c42c7mr4177739276.16.1748157207688; Sun, 25 May 2025
 00:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250314154252.10248-1-tom5760@gmail.com>
 <20250331153438.4103-1-tom5760@gmail.com>
 <20250518141452.4f6ea693@windsurf>
In-Reply-To: <20250518141452.4f6ea693@windsurf>
Date: Sun, 25 May 2025 00:13:16 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qBG0XV2591Y5BXo0_RvNcqCnZXJdtYsXoq=NAEff3R2Q@mail.gmail.com>
X-Gm-Features: AX0GCFugoFIQldkR4VDunDjB3Z32Az9c2CeI5Hot_9dowsx5omlz6jvVW5qTpdg
Message-ID: <CA+h8R2qBG0XV2591Y5BXo0_RvNcqCnZXJdtYsXoq=NAEff3R2Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Tom Wambold <tom5760@gmail.com>, buildroot@buildroot.org, 
 Thomas Perale <thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1748157209; x=1748762009; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPaVUL8EeP+TNO/EabiQjhi9LxRueZra3uDUe6hfGyA=;
 b=1cMzHjEy3P0NGe8y/T9dBikAdFdeOJdKe1tir9sJI7Fteu5Q8ru3G+dmZfIoY5jZKC
 GZp7ToMgbRMH2Wxqji+Bvv9/leXrI5fNA7hOEvDNcn4rM9fvVfWHWYy8rnWNaejUxsOu
 sz6jPEp/DTvG9yzZpeSnOTAdTc/WxpiEpjzcYaKIB60nhF142nF9/36hUzpdxQALmIoj
 4yQ15sBKfKDTwJPSl6MzrtEMoc6FsuoVRNWTBKvjbhPIfyD3DGFxUND+wPDMIu4C8O2/
 xcCHDWSUE9DR4CER2uTJtL9Eyb2NIaeWsdDDNuU1OegCumweNPEXYWbZrN1wMo1tNjTC
 F8DQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=1cMzHjEy
Subject: Re: [Buildroot] [PATCH v2] package/go: go-bin host-go provider
 implies target support
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

SGkgVG9tLCBUaG9tYXMsCgpPbiBTdW4sIE1heSAxOCwgMjAyNSBhdCA1OjE04oCvQU0gVGhvbWFz
IFBldGF6em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxs
byBUb20sCj4KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghIEkgbXVzdCBhZG1pdCBmb3IgdGhpcyBj
aGFuZ2UgSSByZWFsbHkgd291bGQgbGlrZQo+IHRvIGhhdmUgdGhlIGZlZWRiYWNrIGZyb20gQ2hy
aXN0aWFuLiBDaHJpc3RpYW4sIGNvdWxkIHlvdSByZXZpZXcgYW5kCj4gcHJvdmlkZSB5b3VyIGZl
ZWRiYWNrPyBUaGlzIHBhdGNoIGFsbG93cyB0byB1c2UgR28gcGFja2FnZXMgb24gQVJNNjQKPiBo
b3N0cywgd2hlcmUgdGhlIGdvLWJvb3RzdHJhcDEgLT4gZ28tYm9vc3RyYXAyIC0+IGdvLWJvb3Rz
dHJhcDMgLT4KPiBnby1zcmMgc29sdXRpb24gaXNuJ3QgYXZhaWxhYmxlIGFzIGdvLWJvb3RzdHJh
cDEgaXMgb25seSBzdXBwb3J0ZWQgb24KPiBpMzg2LCB4ODYtNjQgYW5kIGFybSAoMzItYml0KS4K
Ck92ZXJhbGwgbGd0bSBhbmQgSSBjYW4gdGVzdCB0aGlzIG91dCBhcyB3ZWxsLiBXaWxsIGhhdmUg
YSBsb29rIGF0IGl0IG9uIE1vbmRheS4KClRoaXMgb25lIHNsaXBwZWQgdGhyb3VnaCB0aGUgY3Jh
Y2tzLCBhcG9sb2dpZXMgZm9yIHRoZSBkZWxheSEKCkJlc3QsCkNocmlzdGlhbiBTdGV3YXJ0Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
