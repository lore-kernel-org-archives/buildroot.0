Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A414CD4F39
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 18:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEB4C4100B;
	Thu, 14 May 2026 18:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVwyA3nNwiic; Thu, 14 May 2026 18:21:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15D2541012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778782878;
	bh=KbMbdKVRjuS2kU5yBOD5UOqmUqqNmCUpCsKOZqcRTa4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qIGhYNH37UabsTAX0s2W6pg4XaM5evWyJSRDkOKcWcqaIIdSq64xOAItPvkWUFeAm
	 FAkDEbUyYIx8IDlxZIE/NGfZFabmmJoPawZAo9HcaCf1UO6ZSEXHbU5EYodpBsom9T
	 m9sWvWR4uKF+7ZkP1WuHatw9qiiBrNzJwTVeyCnBXBk2mJ1ARjkDvyX+yVhDe0FcYx
	 wAi7EjwLQUu8mu1xLu1B9xS2VWqbr/pYPMQI9tyB2K98xbXct88+9e3prl6od4Sdsk
	 dr7NQ+EJYxugMHBPAPz8zTO39V/W7W/KGhY/EuSB+KQhfW1RPp4SX841RCHEjwSssq
	 JngzTeEQNG/1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15D2541012;
	Thu, 14 May 2026 18:21:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EA0936F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 18:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 602A741012
 for <buildroot@buildroot.org>; Thu, 14 May 2026 18:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKqpYKPvnMtB for <buildroot@buildroot.org>;
 Thu, 14 May 2026 18:21:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B47040F5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B47040F5B
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B47040F5B
 for <buildroot@buildroot.org>; Thu, 14 May 2026 18:21:15 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so138061105e9.2
 for <buildroot@buildroot.org>; Thu, 14 May 2026 11:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778782874; x=1779387674;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2kWTEncDwLfGEjMUOqcqM0YlAYXZm0IHvknpG+I2iFQ=;
 b=reCThy9Pc0RCv8LDBlYb6MG10lNvilQpxgSPovzHEDi5I4JKtvxlGygsUWQOpnNaz6
 z7gIZOjDAx0e5uuqMWBDunK6MFUXagKx6Jl56o+uphi5dW3adLk0N/BvRpX/t4odU6I8
 RK/m00Gi3qAJGAwzRWpCkY1S+RcFZwH7JySCjai5agsHviHEXRf7R2Q8zBy+yPtxaDFh
 Ff1FBbKcI+FoVD1smiWyWyWPBoOyDLDFTtaRJSdi8JZX0rUqRAx643+vnzMntXm3HgpM
 NDszXuOizzU2ylOJBbKOescUYnxSN+Slt272jp3IpBQ7Xop8UZHfWX70aiCIvK35Xs47
 uL6A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+EQNy2O84/R301o9Bqrkh10ALAGDjt5HeQhIj1pVKjQpUtBkulgwL/1TNZ//WbTwXkeq3qt01Lbyc=@buildroot.org
X-Gm-Message-State: AOJu0YwayUk/6jLr/bfNZngaKDS1D20eOPr0DhCf4SAdPJxRUG7PwF4k
 OzW6arBJA+665qfulqqgHCqBUm+dXd2iT7BEk3fLVCP/tlPwGZB1+aIP5h374JF9+7g=
X-Gm-Gg: Acq92OFepX27GDkR16TJ39XLrvw7Qoq6iX7ggk22EXFCsQcvVG6jJNt1B44U2kOKK4K
 3nJlh/jh8TtW572BRVU1BC8H/vhWwWaVLXO3ypZsbPEsS1SJ4H8lo7RlizSca2PZ2nkL1wFYXUx
 sCNwe36nfEmEiSmpYUROkptmQswVEsTdIZpjqPsX/bS2JAUJfpCt5Fu6gihZpzCWC5QIr5arCvD
 TJZSIXzNs/i34xzk9Hd4idVwSLtzjqeHyXlCWT+EFklElsoubP3ulI+/r5eGZrxIHN5IaBqTwxy
 AZKxceFd1P1lPCMYUPFFS+cpg+47QpGJU77uKY5Q/2XePypiF/K/pjY8GulhAwqsLOHs2HZUiET
 VWCbfIdeZvkS/neE79g8482yn6iZcogVDxPaG7V1eEWiGxBiwemiFUtmI/Z8oEpIhBeFb0TFdAJ
 EOk7PLxmGDF8H9c/1DsAp0u85IXn1Yxa5nVUwCqa9bZvAam9EHpbdVFn2q6CvBUgBXnav0vQP99
 ZOjg7AkPr5u6mAHd9C++DKopn5Dl+FqqnE7+heRb5AO+l+RQyfN0oP86gcGDKCigg==
X-Received: by 2002:a05:600d:10:b0:48f:e230:2a21 with SMTP id
 5b1f17b1804b1-48fe662fd6bmr5403745e9.32.1778782873708; 
 Thu, 14 May 2026 11:21:13 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5694fbfsm17769445e9.6.2026.05.14.11.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 11:21:13 -0700 (PDT)
Message-ID: <9847f417-14cf-4eb6-96ca-bcaf483ed0f5@smile.fr>
Date: Thu, 14 May 2026 20:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Joseph Kogut <joseph@anodize.com>, buildroot@buildroot.org,
 Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>
References: <20260512-radeonsi-aco-compiler-v1-1-6557627f3d55@anodize.com>
 <ce2f40c6-1c9b-4aaa-be5d-9699ada1da3e@smile.fr>
 <CAMWSM7h4zNQ2z1roRwHHQzDDv-+COL5pLe-GKGmZvkzrZut5qQ@mail.gmail.com>
Content-Language: fr, en-US
In-Reply-To: <CAMWSM7h4zNQ2z1roRwHHQzDDv-+COL5pLe-GKGmZvkzrZut5qQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778782874; x=1779387674; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2kWTEncDwLfGEjMUOqcqM0YlAYXZm0IHvknpG+I2iFQ=;
 b=fB+B4EKR8PPTGn6zz2XUIIQCtJo2xpmn8WivpycUsiBsnh49/ZSGycjjKHvUozr4rK
 umB3dykTEiuoP42eP2HIPNWRH7KUXaQsLe65wZbY3IGCWY80dWORIEMMa9xznkLIEOIl
 bvooNifjRjPlOtmiFxO8fbly/7akTMbitpBtw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=fB+B4EKR
Subject: Re: [Buildroot] [PATCH RESEND] package/mesa3d: make LLVM optional
 for radeonsi
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zZWYsCgpMZSAxNC8wNS8yMDI2IMOgIDE4OjM3LCBKb3NlcGggS29ndXQgYSDDqWNy
aXTCoDoKPiBIZWxsbyBSb21haW4sCj4gCj4gT24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgNTo0M+KA
r0FNIFJvbWFpbiBOYW91ciB2aWEgYnVpbGRyb290Cj4gPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
PiB3cm90ZToKPj4KPj4gSGVsbG8gSm9zZXBoLAo+Pgo+PiBMZSAxMi8wNS8yMDI2IMOgIDIxOjI5
LCBKb3NlcGggS29ndXQgYSDDqWNyaXQgOgo+Pj4gU2luY2UgbWVzYTNkIHYyNi4wIFswXSwgdGhl
IEFDTyBjb21waWxlciBoYXMgYmVlbiB0aGUgZGVmYXVsdCBvdmVyIExMVk0uCj4+PiBUaGlzIHNo
YWRlciBjb21waWxlciBiYWNrZW5kIGhhcyBiZWVuIHVzZWQgZm9yIGV2ZW4gbG9uZ2VyIGJ5IHRo
ZSBSQURWCj4+PiB2dWxrYW4gZHJpdmVyLgo+Pj4KPj4+IExldCdzIG1ha2UgTExWTSBvcHRpb25h
bC4KPj4+Cj4+PiBbMF0gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvY29t
bWl0Lz9pZD1lMjZjMjhmMzExY2M1NDE2ZjZjN2Y1YjA5YTUzY2EyYjE0ZGZiOTU1Cj4+Cj4+IFBs
ZWFzZSB1cGRhdGUgdG8gdGhlIG5ldyBnaXRsYWIgcmVwb3NpdG9yeToKPj4gaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2NvbW1pdC9lMjZjMjhmMzExY2M1NDE2ZjZj
N2Y1YjA5YTUzY2EyYjE0ZGZiOTU1Cj4+Cj4gCj4gRG9uZS4KPiAKPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBKb3NlcGggS29ndXQgPGpvc2VwaEBhbm9kaXplLmNvbT4KPj4+IC0tLQo+Pj4gIHBhY2th
Z2UvbWVzYTNkL0NvbmZpZy5pbiB8IDMgKy0tCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2Ez
ZC9Db25maWcuaW4gYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KPj4+IGluZGV4IDY2ZWJlMDQz
OTQuLjA4ODgxYWY1YmQgMTAwNjQ0Cj4+PiAtLS0gYS9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4K
Pj4+ICsrKyBiL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgo+Pj4gQEAgLTI1MiwxMSArMjUyLDEw
IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfUkFERU9OU0kKPj4+
ICAgICAgIGJvb2wgIkdhbGxpdW0gUmFkZW9uIFNJIGRyaXZlciIKPj4+ICAgICAgIGRlcGVuZHMg
b24gQlIyX1VTRV9NTVUgIyBsaWJkcm0KPj4+ICAgICAgIGRlcGVuZHMgb24gQlIyX2kzODYgfHwg
QlIyX3g4Nl82NAo+Pj4gLSAgICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9NRVNBM0RfTExWTQo+
Pj4gICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUgo+Pj4gICAg
ICAgc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkRSTV9BTURHUFUKPj4+ICAgICAgIHNlbGVjdCBCUjJf
UEFDS0FHRV9MSUJEUk1fUkFERU9OCj4+PiAtICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfTExWTV9B
TURHUFUKPj4+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9MTFZNX0FNREdQVSBpZiBCUjJfUEFD
S0FHRV9NRVNBM0RfTExWTQo+Pgo+PiBUaGlzIHN0aWxsIHJlcXVpcmVzIHRvIHNldCBBTURfREVC
VUc9dXNlbGx2bSBpbiB0aGUgZW52aXJvbm1lbnQgdG8gcmVhbGx5IHVzZQo+PiBsbHZtIGNvbXBp
bGVyIGZvciByYWRlb25zaS4gQnV0IHdlIGNhbid0IHJlbW92ZSB0aGlzIGxpbmUgZm9yIHRoZSBz
YWtlIG9mCj4+IHJlcHJvZHVjaWJsZSBidWlsZHMuCj4+Cj4gCj4gSSdtIG5vdCBzdXJlIEknbSBm
b2xsb3dpbmcsIGNhbiB5b3UgaGVscCBtZSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4KPiBhYm91
dCByZXByb2R1Y2libGUgYnVpbGRzPyBEb2VzIHRoaXMgcmVxdWlyZSBhbnkgYWN0aW9uIGZyb20g
bWUgaGVyZT8KCkknbSB3cm9uZyBhYm91dCB0aGUgcmVwcm9kdWNpYmxlIGJ1aWxkcy4gVGhlcmUg
aXMgbm8gaXNzdWUuCgo+IAo+IFNob3VsZCB3ZSBhZGQgYSBub3RlIHRvIHRoZSBjb21taXQgb3Ig
S2NvbmZpZyBoZWxwIG1lc3NhZ2UgZXhwbGFpbmluZwo+IHRoYXQgdGhlIExMVk0gY29tcGlsZXIg
cmVxdWlyZXMgYW4gZW52aXJvbm1lbnQgb3ZlcnJpZGUgdG8gdXNlPwoKSSdtIHdvbmRlcmluZyBp
ZiB3ZSBjYW4gcmVtb3ZlIHRoaXMgbGluZSBlbnRpcmVseSBzaW5jZSB0aGUgbGx2bSBjb21waWxl
ciBpcyBubwpsb25nZXIgdXNlZCBieSBkZWZhdWx0LiBCdXQgaWYgQlIyX1BBQ0tBR0VfTUVTQTNE
X0xMVk0gaXMgYWxyZWFkeSBzZWxlY3RlZCwKZW5hYmxpbmcgQlIyX1BBQ0tBR0VfTExWTV9BTURH
UFUgZG9lc24ndCBpbmNyZWFzZSBhIGxvdCB0aGUgYnVpbGQgdGltZS4gV2UgZG9uJ3QKa25vdyBp
ZiB0aGUgc3lzdGVtIHdpbGwgdXNlIEFNRF9ERUJVRz11c2VsbHZtIG9yIG5vdC4KCllvdSBjYW4g
ZG8gYm90aCwgYWRkIGEgbm90ZSB0byB0aGUgY29tbWl0IGxvZyBhbmQgYSBjb21tZW50IGluIFJh
ZGVvbiBTSSBoZWxwCnRleHQgdG8gcmVtZW1iZXIgd2UgaGF2ZSB0byB1c2UgYW4gZW52aXJvbm1l
bnQgb3ZlcnJpZGUuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPj4gUmV2aWV3ZWQtYnk6IFJv
bWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+
IFJvbWFpbgo+Pgo+Pj4gICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0VMRlVUSUxTCj4+PiAgICAg
ICBzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX05FRURTX0VMRlVUSUxTCj4+PiAgICAgICBzZWxl
Y3QgQlIyX1BBQ0tBR0VfTUVTQTNEX1JVU1RJQ0xfU1VQUE9SVEVEX0RSSVZFUgo+Pj4KPj4+IC0t
LQo+Pj4gYmFzZS1jb21taXQ6IDk2ODRjYjliNDQwNmUwMTY4M2E5YjUxMzYxMDBkODEwNDBkNTZh
YTAKPj4+IGNoYW5nZS1pZDogMjAyNjA1MTItcmFkZW9uc2ktYWNvLWNvbXBpbGVyLWFlNGU2OTdk
NDg0OAo+Pj4KPj4+IEJlc3QgcmVnYXJkcywKPj4+IC0tCj4+PiBKb3NlcGggS29ndXQgPGpvc2Vw
aEBhbm9kaXplLmNvbT4KPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+Pj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo+IAo+IEJlc3QsCj4gSm9zZXBoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
