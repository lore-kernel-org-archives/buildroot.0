Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BAA108E1E9
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 11:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8623884174;
	Thu, 19 Mar 2026 11:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id neolBQPrGk-c; Thu, 19 Mar 2026 11:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91D8184163
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773919204;
	bh=hz77+61VBwOMcqZzCu3EmNbpIQZZbkZRkLIKvlKyZwE=;
	h=References:In-Reply-To:Date:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Fbf2klOQ+LJ+elm5xjwdRd2p5mLvL7E2aIKy1oGTiqhhnRNhtqdVhWMUL/iro1qq7
	 HnZ1htLa2tCjc369hpa0Z4yqrWM3uzHaXwGplvrLkso2Dqi5NzGtsBTEyc1hebjtCZ
	 PdrW4ToEUxHukPL4aEbNnJPQO871YEHczzW7biPRovSDfXEB02+iIqDl5ue6lXWqZ/
	 gX3pYkv/vifss/G1l8yFTZuQlAZxGVQt1G4UQzyezqv7F5u/vHgrFT1pnGY0Yxd98V
	 3NyTrGGL1EG5NPCRDESwbuY6uFWLkyuflLFK6majV0Ytawkqu81QLxXbMrCkp3Z0eJ
	 5CKxVW3PGJv4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91D8184163;
	Thu, 19 Mar 2026 11:20:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6D021AD
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 11:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C820A84163
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 11:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJ_Xg4aYAgD5 for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 11:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C75C184162
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C75C184162
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C75C184162
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 11:20:01 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5a279ce9475so1602211e87.1
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 04:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773919199; x=1774523999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rYSOMjtM6EclAYZK1aIe3R1ZkzNwUwc56EX7oqAeV90=;
 b=srD8BRSzhLm9QDZNajFX8pXIkB2bblqq/zsTNDTPg6tOU/X85UifHhs5h4Sig05/tu
 7gURJo9AzbwB4UT7p0oWAumJwKbCOg+aDFZTPQvNHyoSaijxfa8VbKMeGBtGyVafcGI/
 d8MNZ2GpclYU3+U4Q6KLhHm68+QKnv8CWrc+mrNXRqNJJBon7AtXMA6NOqD7hzDEvD+s
 Gyqvy+IlK3IpWgjSQFnO995940ouqCPRpkAEqPJAegD9N/hs4UnNkgBruwZ7IoZbnGq/
 bR4Qiqui0dpAZcYwKUESGTPdPpEifik1TBoG3HrexDyfbP0uhRigcTl6R+z8v6PL+xtG
 vIRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX65CHItn6bYNARwCGUpjOt9H+dFEHTQUCj7Y7EidOAwDe1DeY26S+P3dkDmsFHAH+HB9JZnIxuyyg=@buildroot.org
X-Gm-Message-State: AOJu0Yzz40e83H5GU6S98kU9dUkq5Uv7A92XZYXIMYWfG8nW56icuc+3
 AfBrQ1lqM9Exmy0nLYsRgRPxqU6K9BieBZ06YT3eR7KDbU3+TNur65pTLUnHqKfQ2gu5s06w5HT
 1Fymy5Z/foQ==
X-Gm-Gg: ATEYQzxndLKS04m6YwdKFEc0SLdWOnZNJnKgcNSObIR5djrGBzWl9LePleOwaC9dyvw
 cBM64NPjky8lhyDwJOVE6ApL/6AuAGKEuEVUe9W9WkcxNqtaGaG3+PPwLuVIgfDmZtNqGd6DlSL
 4zu2piDVVdtMWawhO1R116/Mud96UIoCCr3vi/5iPn0gUMV1BgVEHVV23LYUJczxUeqxVo4eycR
 UYbjq8wC8uwQHMlf4ZTGtG4MOsYNxtW/hjk6GWcrtYgI6PCLlIGDIfkIZg9AvGZ9DNII2vdmT1m
 H+bQTSX7j4mBlBtYra1BdC84lAVZhJtUI/+GWJcM6rfYIVF8Cj7J53abva2CGzNw6EROuChYja0
 w8J9EYZUjG4BqQJlp5OnvnY4/hbt6u6e6zkYLAdyAPzdqrGIMXB8BcD7BKgBlMD0OJTwQRGd2wH
 W64Y+i6D4aYO0ZF9cxSw7X4LJr28QmK87b+wrbKXoiM1JFBRp2TRXfZU/2PFNBBQ==
X-Received: by 2002:a05:6512:3193:b0:5a1:357d:8d5c with SMTP id
 2adb3069b0e04-5a27de41dc4mr1276682e87.16.1773919198839; 
 Thu, 19 Mar 2026 04:19:58 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38bd51570b3sm10846991fa.9.2026.03.19.04.19.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 04:19:57 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5a12c19affeso1369044e87.1
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 04:19:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXpljPXqzRgBm/Rt7ODOn9zrwuEFvV+YULMfqj8JQiggW3avLDoFD6DsTm2ibOdCM701owReAKuGYQ=@buildroot.org
X-Received: by 2002:a05:6512:4201:b0:5a1:2c19:4e83 with SMTP id
 2adb3069b0e04-5a27de4f2famr864558e87.20.1773919197257; Thu, 19 Mar 2026
 04:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <87wlzehme3.fsf@dell.be.48ers.dk>
 <20260319101938.68045-1-thomas.perale@mind.be>
In-Reply-To: <20260319101938.68045-1-thomas.perale@mind.be>
Date: Thu, 19 Mar 2026 04:19:45 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rcfnnrrmoBzBUHMcHM35j2WBXfhbbzQKegUpjZfYbfCg@mail.gmail.com>
X-Gm-Features: AaiRm50Bq4o-zcOyDY7SecmReTo99PrIeYunp_w42dN96VcU5WOtuJMYwEh2Y3E
Message-ID: <CA+h8R2rcfnnrrmoBzBUHMcHM35j2WBXfhbbzQKegUpjZfYbfCg@mail.gmail.com>
To: Thomas Perale <thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1773919199; x=1774523999; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rYSOMjtM6EclAYZK1aIe3R1ZkzNwUwc56EX7oqAeV90=;
 b=BApa6DxJPo9xe1mr0sXL+/uSZC662/oY5CnGYmjB/Gc94LrFy2gdHjgkQPLLUozB6N
 oXEhRH7Aw81LQlGKVTTrp0jJ4aWz1SG+0pGwVsuDLcyaauhJTx+hekCmZVkA1bT+mf/0
 AwURc8gFxlKovqf+Ed0IK8EoGYse0XJd9155vzjdeWelZ8ydOuGJwJAyHi0INoI0y3La
 IEZj5NoES+GxctXOiXrEirBIGIXbOc7gnRCTpfZoCa/HJyL0myw825essN4hNbS67tCb
 5kS8jFNDIs0Fmgw8/nMyssl1YPc4+E9LlA1tyxL1/LaZiFXa0qjDqMsh2pmCk/bv0cv5
 6X1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=BApa6DxJ
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: security bump to version
 1.26.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gVGh1LCBNYXIgMTksIDIwMjYgYXQgMzoxOeKAr0FNIFRob21hcyBQZXJh
bGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4gd3JvdGU6Cj4gSSdtIGp1bXBpbmcgaW50byB0aGUg
ZGlzY3Vzc2lvbi4gQXMgSSdtIG5vdCBhIEdvIHVzZXIgbXlzZWxmLCBob3cgZG8geW91Cj4gKENo
cmlzdGlhbiwgUGV0ZXIsIGFueW9uZSkgc2VlIHRoZSB1cGRhdGUgY3ljbGUgZm9yIEdvIG9uIHRo
ZSBMVFMgYnJhbmNoLgo+Cj4gU2hvdWxkIHdlIHVwZGF0ZSAibGF0ZSIgdG8gdGhlIGxhc3QgbWFp
bnRhaW5lZCBzdWJ2ZXJzaW9uIHdoZW5ldmVyIExUUyBpcyBiYXNlZAo+IG9uIGEgdmVyc2lvbiBu
byBsb25nZXIgc3VwcG9ydGVkID8KCkkgd291bGQgc3VnZ2VzdCBtaW5pbXVtIHZlcnNpb24gc2Vs
ZWN0aW9uLCB0aGF0IGlzLCBidW1wIExUUyB0byB0aGUKb2xkZXN0IHN0aWxsLXN1cHBvcnRlZCB2
ZXJzaW9uIGlmIHRoYXQgdmVyc2lvbiBpcyBuZXdlciB0aGFuIHRoZQpjdXJyZW50LgoKPiBIb3cg
bXVjaCBicmVha2luZyBjaGFuZ2VzIGFyZSB0aG9zZSBzdWJ2ZXJzaW9uIGJ1bXAgaW50cm9kdWNp
bmcgPwoKTm9uZSwgc2luY2UgR28gaGFzIGEgcHJvbWlzZSBvZiBjb21wYXRpYmlsaXR5IGdvaW5n
IGJhY2sgdG8gMS4wLgpUaGVyZSdzIG5vIGJyZWFraW5nIGNoYW5nZXMuCgpFdmVuIHRoZSBsYW5n
dWFnZSB2ZXJzaW9uIGlzIHBpbm5lZCBpbiBnby5tb2QKCkJlc3QgcmVnYXJkcywKQ2hyaXN0aWFu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
