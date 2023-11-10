Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17AFC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EBA84288A;
	Fri, 10 Nov 2023 21:16:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EBA84288A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6QskWyTdLckS; Fri, 10 Nov 2023 21:16:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2E7242883;
	Fri, 10 Nov 2023 21:16:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2E7242883
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F3731BF41B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37AF183C84
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37AF183C84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JsLb-zxgGJny for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:16:14 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44E6A83C83
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44E6A83C83
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9bf86b77a2aso402783566b.0
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 13:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699650972; x=1700255772;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yHEQjILP1Gq3moteNoo3w4BlXvJ/QPJVRsoR3KYg1SA=;
 b=M5EqSfop7KjD3jz3ZTrIdJmjqr5uw+r0RSslzsV2TmW7iLjDK/G5PTP4ELNSicte78
 Abuwhbw6VYajNKnvLbGSgjNRA3SxXFue4FRM/6+y5SXkz9cvBtWyxkLta05G/l4h40dW
 r6ntPuX6e9PuZ24EyP79xSo2SHuiVgC1ZdKSo5ALtCl8OrOwjkQ4a2ZY8TQcNVgATXfb
 5bWRUOhJnHvFMT+I7BLBrnWUNrIZh+vsABSbetPwFiQZYxSgybQbNZJwlyBnv7MgNJs9
 3D5+JnUWtIwO4LKWxT4NrUDMw897bUSKYKMijZxRkXHTTEZtysAN5pKXQ1oME5POQd7z
 3Ayg==
X-Gm-Message-State: AOJu0YxX8s9mQQ/UqTGAoROhoym9tmgltCilTA+pOxqAnwxsM7vZTaZ2
 2RdkSrZ150vM0hk7YM7cQW7PUQ==
X-Google-Smtp-Source: AGHT+IH/5JELwb3gkWRNmJ1eN+5wCl1IwX6RgRJnXS7pCfsCPokYtcK9iJoDpsHJP1iIC4Pn9+BqAQ==
X-Received: by 2002:a17:906:6a1f:b0:9bd:d1e8:57f1 with SMTP id
 qw31-20020a1709066a1f00b009bdd1e857f1mr164199ejc.50.1699650972092; 
 Fri, 10 Nov 2023 13:16:12 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a170906264b00b0099bd5d28dc4sm92535ejc.195.2023.11.10.13.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 13:16:11 -0800 (PST)
Message-ID: <43f28d31-bb14-4051-9fea-0eb9322e4ebc@mind.be>
Date: Fri, 10 Nov 2023 22:16:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>,
 buildroot@buildroot.org
References: <20231107191809.1338200-1-martin@geanix.com>
In-Reply-To: <20231107191809.1338200-1-martin@geanix.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699650972; x=1700255772; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yHEQjILP1Gq3moteNoo3w4BlXvJ/QPJVRsoR3KYg1SA=;
 b=UPcpNbw3G9FQ3NjssOdNx06CwWpm7MgS9SLECHzYaCWndvXoNen3TnwW0JdVZN6cGp
 U8v85DYGfh3S/k6kQFr7AgIDzE+VPxbVXRNo7wFQfmsYyzyz4nG4A5yWgmbahjKHpzcY
 UKL/yQoK4h5nCPaSeb/yQ1A2XvEX9dc3kc+28QJwgIipjZVD1isnLeuRn2rgKxSdwzJD
 8YmcUzU4h3BlTyMD9Cu8g0T2/lsWxvtOs3fWO3h/d4kxVcGEUYE41LT1pHZ7OtT3AOSw
 Y1fEWHBkcyVzSbI1dS5eB3lYg8IJ2zQsN9tw6dmHIZ7dfCmsnQojeQfiohNe/tUMzHz+
 jNnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UPcpNbw3
Subject: Re: [Buildroot] [PATCH] python-gpiozero: update to version 2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBNYXJ0aW4sCgpPbiAwNy8xMS8yMDIzIDIwOjE4LCBNYXJ0aW4gSHVuZGViw7hsbCB3cm90
ZToKPiBNb3N0IG5vdGFibHksIHRoaXMgcmVtb3ZlcyBwdXl0aG9uMiBzdXBwb3J0IGFuZCBhZGRz
IHN1cHBvcnQgZm9yIFJQaTUuCj4gV2hpbGUgaGVyZSwgdGhlIHBhY2thZ2UgaXMgZW5hYmxlZCBm
b3IgYWFyY2g2NCB0b28uCgogIEphbWVyIGFscmVhZHkgc3VibWl0dGVkIHRoaXMgdmVyc2lvbiBi
dW1wIGxhc3QgU3VuZGF5LCBhbmQgVGhvbWFzIGFwcGxpZWQgaXQgCm9uIE1vbmRheS4gU28geW91
ciBwYXRjaCB1bmZvcnR1bmF0ZWx5IGNhbWUgdG9vIGxhdGUuIEkgbWFya2VkIGl0IGFzIFN1cGVy
c2VkZWQuCgogIEhvd2V2ZXIsIEphbWVzIGRpZG4ndCBlbmFibGUgaXQgZm9yIGFhcmNoNjQsIHNv
IHBlcmhhcHMgeW91IGNhbiBzdWJtaXQgYSBwYXRjaCAKZG9pbmcgdGhhdD8KCiAgUmVnYXJkcywK
ICBBcm5vdXQKCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFydGluIEh1bmRlYsO4bGwgPG1hcnRpbkBn
ZWFuaXguY29tPgo+IC0tLQo+ICAgLi4uLzAwMDEtTWlncmF0ZS10by1zZXR1cC5jZmcucGF0Y2gg
ICAgICAgICAgIHwgODU1IC0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgcGFja2FnZS9weXRob24tZ3Bp
b3plcm8vQ29uZmlnLmluICAgICAgICAgICAgIHwgICAyICstCj4gICBwYWNrYWdlL3B5dGhvbi1n
cGlvemVyby9weXRob24tZ3Bpb3plcm8uaGFzaCAgfCAgIDIgKy0KPiAgIHBhY2thZ2UvcHl0aG9u
LWdwaW96ZXJvL3B5dGhvbi1ncGlvemVyby5tayAgICB8ICAgMiArLQo+ICAgNCBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDg1OCBkZWxldGlvbnMoLSkKPiAgIGRlbGV0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3B5dGhvbi1ncGlvemVyby8wMDAxLU1pZ3JhdGUtdG8tc2V0dXAuY2ZnLnBh
dGNoCltzbmlwXQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1ncGlvemVyby9Db25maWcu
aW4gYi9wYWNrYWdlL3B5dGhvbi1ncGlvemVyby9Db25maWcuaW4KPiBpbmRleCA5M2U1ZGUzZTU1
Li40YzIyMzM1MTliIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWdwaW96ZXJvL0NvbmZp
Zy5pbgo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWdwaW96ZXJvL0NvbmZpZy5pbgo+IEBAIC0xLDYg
KzEsNiBAQAo+ICAgY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9HUElPWkVSTwo+ICAgCWJvb2wg
InB5dGhvbi1ncGlvemVybyIKPiAtCWRlcGVuZHMgb24gQlIyX2FybQo+ICsJZGVwZW5kcyBvbiAo
QlIyX2FybSB8fCBCUjJfYWFyY2g2NCkKPiAgIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX0NP
TE9SWkVSTyAjIHJ1bnRpbWUKPiAgIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1JQSV9HUElP
ICMgcnVudGltZQo+ICAgCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fU0VUVVBUT09MUyAjIHJ1
bnRpbWUKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZ3Bpb3plcm8vcHl0aG9uLWdwaW96
ZXJvLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1ncGlvemVyby9weXRob24tZ3Bpb3plcm8uaGFzaAo+
IGluZGV4IDczNTlmNjQwNWUuLjE4MTUzY2Y5ZDcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRo
b24tZ3Bpb3plcm8vcHl0aG9uLWdwaW96ZXJvLmhhc2gKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1n
cGlvemVyby9weXRob24tZ3Bpb3plcm8uaGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+ICAgIyBMb2Nh
bGx5IGNvbXB1dGVkCj4gLXNoYTI1NiAgN2U2ZGE5MjM3NzQ0MzdlMjRlZGMwYzA1NmU0ODY0MTVi
YWNlOGM0YmE0MTIzYzIyYWM0MjE0MTQ3ODU0ZWE2ZCAgcHl0aG9uLWdwaW96ZXJvLTEuNi4yLnRh
ci5nego+ICtzaGEyNTYgIGM1N2Q5YzgxODU0ZjcyYWI1NDM1MWQ3MmZhMWU2YjJlNGJjMWZmNTZj
NTc0MjJjMzA3NzJkMjcxODI0ZTE5MTYgIHB5dGhvbi1ncGlvemVyby0yLjAudGFyLmd6Cj4gICAj
IExvY2FsbHkgY29tcHV0ZWQKPiAgIHNoYTI1NiAgYjZmZGQ1ODdmM2RjM2E5YjhjYzVhZGFlMDA5
MThlM2ZmYTkwOWIxMDkyYmQ0ZGVjZjdlOGIxYjA4ZmE1ZDBmYiAgTElDRU5TRS5yc3QKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9weXRob24tZ3Bpb3plcm8vcHl0aG9uLWdwaW96ZXJvLm1rIGIvcGFj
a2FnZS9weXRob24tZ3Bpb3plcm8vcHl0aG9uLWdwaW96ZXJvLm1rCj4gaW5kZXggYTY4YzM5ZGIx
Zi4uODMwYmUzOTFhMSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1ncGlvemVyby9weXRo
b24tZ3Bpb3plcm8ubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1ncGlvemVyby9weXRob24tZ3Bp
b3plcm8ubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCj4gICAKPiAtUFlUSE9OX0dQSU9aRVJPX1ZFUlNJT04gPSAxLjYuMgo+ICtQWVRIT05fR1BJ
T1pFUk9fVkVSU0lPTiA9IDIuMAo+ICAgUFlUSE9OX0dQSU9aRVJPX1NJVEUgPSAkKGNhbGwgZ2l0
aHViLGdwaW96ZXJvLGdwaW96ZXJvLHYkKFBZVEhPTl9HUElPWkVST19WRVJTSU9OKSkKPiAgIFBZ
VEhPTl9HUElPWkVST19MSUNFTlNFID0gQlNELTMtQ2xhdXNlCj4gICBQWVRIT05fR1BJT1pFUk9f
TElDRU5TRV9GSUxFUyA9IExJQ0VOU0UucnN0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
