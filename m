Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6F7CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53CC74137E;
	Fri, 15 May 2026 13:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3db2Td-F2_Y; Fri, 15 May 2026 13:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7760A4137F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778853271;
	bh=hVqj3RXG1T9Me389eUk2sjHZ1Whiv5IjvyLkQd0PG9s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=frIYjmYs6rRutXk3rYHq4HSmxSp3NHBv+cRU2HBW+rffl+OTiavLqFqSN8NvhfUQg
	 A3F2bYGDLT8cqQI9wCnLU5YWztgehpTwPOQO0Ifkgfl+QDPTZivzt28NQ3DKUmBi2w
	 M6DdbTKiOP59XZjIQDlA7OlAM+5KJ+NJdk6WE4V8RYiMk4VFJXLXWT/LZWg6sj7ZeD
	 wlRCHsG9McrwCM8/fR830MB0hWBXug1BI8pizWh9NP1veyHYAVouYU5LQqwch15tpT
	 3N+aDH5/bA1j3QOxUTe0zzOYl72mbphuNpFpIEHSGOun0Kaccud8fQMQrf+/cTr+7r
	 +St4GYdTHACZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7760A4137F;
	Fri, 15 May 2026 13:54:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 552E036F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3ACEF826EF
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNX7iEIOqpVu for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:54:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE645826BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE645826BB
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE645826BB
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:54:28 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43fe608cb92so5803310f8f.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778853266; x=1779458066;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2g6UnATPaqA3Up+65wnbPUOE5yfPFezefS4FXVaFPjo=;
 b=SgFSyOh5CIRHwr9qLE/zdoopBAr3LMaTPmqQf0fdbvHm3f3upVDmTNO2DF951z9Qwv
 huxzAdoBocLpZOGJ3Owmh5txNOmMyvN8NwkeVxaMmxWBscR1PKO/hZluevBCrr7pLw3F
 4yiczTNiX6Sflq87H619eb5uOePK0ivI7gV4hgxT+xqCIt6EBt8hiBF14jG48P3HfkB8
 xn1NwkuvJqY8DHrk0d/xgUxRnjWp2JVEEwX+h1/3P/5x8h+BUlmh0bTsIpgqhKxj8ASG
 8dthM5rqEGk3hjj84cvighevP9fxIm3xAkOSSL9u069xgqlbrQ4p2YvCo0sIjMt9D2tl
 vsdA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+X9q/L2+euW3AzO/0TFsB4J7x4UsuskJ/qFgJHVnpWLQ/9g+7IggKkj6+sosgezlC2hdfMpJeMo0o=@buildroot.org
X-Gm-Message-State: AOJu0YzHTSQUeggjLcUFC3WnrkW8rOzP4IBpTPD0spJIlNZsqr4nldF0
 AIHo6lUyPWVNgKnc8nnH3t0h2fa6ttynnLHE8jl1E/HfQIVEBn7tq/fweIxV0fsy1oXk3qzpic2
 piOpPaUs=
X-Gm-Gg: Acq92OGGpaBI9vKS+JbppAFURz0QBkUxqMVaGt16Pld1dDiW9lD0GM/H/6cWJkgDVrz
 Sv/2P7wnFzjycSYtHnGVpgGzTtlaKraCR967SqNDQCbttoRvpc05oTqiQpML18CnqyfwZlIg8pH
 TM/RIDQ7HYtJ+tXePDmrRRVXReS3bJa7LnQcZMJ5f8sn/H47QvKHqML0J8AE/quyTyHij9Avd1T
 S4a38Ea9NhDg/UJ25H9XdmEXXGq6q5qsUTHGuRwUmjNO491669oaUZVF1GlbkLdcPrgQMky6//h
 p4c3jzRqk9oLVHIn/COBrgT4FDSCQ6V/pxNxcQKRdQllrV+CLqrhrMSiBnBMaG6mQPBHsrpj4cX
 mRkUKZVNDzKQOubCBHiV+RhBUuuJpm6uvEI7tj7zx6rqfrNxZoqT4uuu9FFfwLWTwHTnD6IvFsz
 vHzYLK7adzs/NtGYiI5Y9fRItW2k4lm5x1I0eiq0uKbuZBjrjFHLIWov6kszA902ArKKOW+/hSr
 JUltdARD+TRprFkOEyU+wXMFCC2kd2fUgsXTb5bzQhLhlnrU3ufPw2ihgVvUM3+93qpCYJKhOvo
X-Received: by 2002:a05:6000:26cf:b0:43d:7a97:78b5 with SMTP id
 ffacd0b85a97d-45e5c5ccbe0mr5595343f8f.33.1778853266417; 
 Fri, 15 May 2026 06:54:26 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a17a22sm15071706f8f.22.2026.05.15.06.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 06:54:26 -0700 (PDT)
Message-ID: <c24af83c-1300-4961-857b-db077ac8cbc0@smile.fr>
Date: Fri, 15 May 2026 15:54:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20260219-qemu-tcg-interpreter-v1-1-d7f11b967f49@gmail.com>
Content-Language: fr, en-US
In-Reply-To: <20260219-qemu-tcg-interpreter-v1-1-d7f11b967f49@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778853266; x=1779458066; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2g6UnATPaqA3Up+65wnbPUOE5yfPFezefS4FXVaFPjo=;
 b=3DHa+7xjVzxeLihDag/ILgFpAJluAK36BM99cAqltgEpKfQMqzZZojkyYyYGILX/87
 dEmatimuFIRevyTYbtXPA+/bk9PM6CkRD0J2Jn4vfFjvD5/G1SdOOBwwOK+w9Firb2px
 zzxrZlXt87kKgMfd9faTPrGA7w1r6PG6JyBNI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=3DHa+7xj
Subject: Re: [Buildroot] [PATCH] package/qemu: conditionally enable TCG
 interpreter
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

SGVsbG8gSm9zZXBoLAoKTGUgMjAvMDIvMjAyNiDDoCAwMjo0NSwgSm9zZXBoIEtvZ3V0IGEgw6lj
cml0wqA6Cj4gUWVtdSBoYXMgdHdvIGZsYWdzIHJlbGF0ZWQgdG8gZW5hYmxpbmcgdGhlIFRpbnkg
Q29kZSBHZW5lcmF0b3IgKFRDRykKPiBmZWF0dXJlLiBVc2luZzoKPiAKPiAgIC0tZW5hYmxlLXRj
Zwo+IAo+IFNpbXBseSBlbmFibGVzIHRoZSBUQ0cgYmFja2VuZCBmb3IgSklUIGNvZGUgZ2VuZXJh
dGlvbi4gSG93ZXZlciwgc29tZQo+IGFyY2hpdGVjdHVyZXMgYXJlbid0IHN1cHBvcnRlZCBieSB0
aGUgY29kZSBnZW5lcmF0b3IsIGFuZCB0aGUgYnVpbGQKPiB3aWxsIGZhaWwgZHVyaW5nIGNvbmZp
Z3VyYXRpb24sIHN1Y2ggYXMgaW4gdGhpcyBib290bGluLW1pcHNlbDMycjYtZ2xpYmMKPiBidWls
ZDoKPiAKPiAuLi9tZXNvbi5idWlsZDo5MjM6NjogRVJST1I6IFByb2JsZW0gZW5jb3VudGVyZWQ6
IFVuc3VwcG9ydGVkIENQVSAsIHRyeSAtLWVuYWJsZS10Y2ctaW50ZXJwcmV0ZXIKPiAKPiBFbmFi
bGluZyB0aGUgVENHIGludGVycHJldGVyIFswXSBhbGxvd3MgZm9yIGEgc29mdHdhcmUgaW50ZXJw
cmV0ZXIgdG8KPiBleGVjdXRlIFRDRyBjb2RlIGluIGNhc2VzIHdoZXJlIG5hdGl2ZSBjb2RlIGdl
bmVyYXRpb24gaXMgdW5zdXBwb3J0ZWQsCj4gd2hpY2ggZml4ZXMgdGhlIGJ1aWxkLgo+IAo+IFsw
XSBodHRwczovL3dpa2kucWVtdS5vcmcvRmVhdHVyZXMvVENJCj4gCj4gU2lnbmVkLW9mZi1ieTog
Sm9zZXBoIEtvZ3V0IDxqb3NlcGgua29ndXRAZ21haWwuY29tPgo+IC0tLQo+ICBwYWNrYWdlL3Fl
bXUvcWVtdS5tayB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11L3FlbXUubWsgYi9wYWNr
YWdlL3FlbXUvcWVtdS5tawo+IGluZGV4IDk3ZjhlMjIwOTEuLmY1MDgwNTkxN2IgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9xZW11L3FlbXUubWsKPiArKysgYi9wYWNrYWdlL3FlbXUvcWVtdS5tawo+
IEBAIC01Niw3ICs1Niw4IEBAIFFFTVVfT1BUUyArPSAtLWRpc2FibGUta3ZtCj4gIGVuZGlmCj4g
IAo+ICBpZmVxICgkKEJSMl9QQUNLQUdFX1FFTVVfU1lTVEVNX1RDRyksIHkpCj4gLVFFTVVfT1BU
UyArPSAtLWVuYWJsZS10Y2cKPiArUUVNVV9PUFRTICs9IC0tZW5hYmxlLXRjZyBcCj4gKwkgICAg
IC0tZW5hYmxlLXRjZy1pbnRlcnByZXRlcgoKVXNpbmcgLS1lbmFibGUtdGNnLWludGVycHJldGVy
IHdoZW4gYSBuYXRpdmUgVENHIGV4ZWN1dGlvbiBiYWNrZW5kIGF2YWlsYWJsZQp3aWxsIHRocm93
IGEgd2FybmluZyBhdCBjb25maWd1cmUgdGltZToKCmh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXBy
b2plY3QvcWVtdS8tL2Jsb2IvdjExLjAuMC9tZXNvbi5idWlsZD9yZWZfdHlwZT10YWdzI0w5MjEK
Ci0tZW5hYmxlLXRjZy1pbnRlcnByZXRlciBpcyBuZWVkZWQgd2hlbiB0aGUgdGFyZ2V0IGFyY2hp
dGVjdHVyZSBpcyBub3QgaW4gdGhpcwpsaXN0OgoKc3VwcG9ydGVkX2NwdXMgPSBbJ3BwYzY0Jywg
J3MzOTB4JywgJ3Jpc2N2NjQnLCAneDg2XzY0JywKICAnYWFyY2g2NCcsICdsb29uZ2FyY2g2NCcs
ICdtaXBzNjQnLCAnc3BhcmM2NCcsICd3YXNtNjQnXQoKSXQgd291bGQgYmUgYmV0dGVyIHRvIGhh
dmUgYSBmaW5lIGNvbnRyb2wgb2YgY29uZmlndXJlIGZsYWdzLgpDYW4geW91IHVzZSAtLWVuYWJs
ZS10Y2ctaW50ZXJwcmV0ZXIgb25seSBmb3IgbWlwczMyIGFuZCBhbGwgb3RoZXIgbm9uIFRHQwpz
dXBwb3J0ZWQgYXJjaGl0ZWN0dXJlcz8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAgZWxzZQo+
ICBRRU1VX09QVFMgKz0gLS1kaXNhYmxlLXRjZwo+ICBlbmRpZgo+IAo+IC0tLQo+IGJhc2UtY29t
bWl0OiA2YzgzYTBiOGU1NjU4YjkwMWRkMzVhZTIzMjE3MDc1ZjAzNWFmOTk4Cj4gY2hhbmdlLWlk
OiAyMDI2MDIxOS1xZW11LXRjZy1pbnRlcnByZXRlci1kYjM2YmY1MmI3YmUKPiAKPiBCZXN0IHJl
Z2FyZHMsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
