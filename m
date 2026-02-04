Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7C4E83EF5
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 08:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD81C40C24;
	Wed,  4 Feb 2026 08:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSUgrRFzQYpz; Wed,  4 Feb 2026 08:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6D5E40C59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770194124;
	bh=kaNDZIymd2pZ1rS1kO4nIpuX5cR+7rsPOCV4Naj+AS0=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J6n9Nrhw0MCSKbSqbw3qkUnNir0DMnmUQnfJi/SbIN2/5pSgShDCmZ1kL3zVkjIH8
	 LJoq7NZrZN7DeIXzr4hGCfewgZlqRXmd24/hr8OQG5+VrWEPAYydNgy9pn4+maxK7r
	 Cxg+m1cbmZe72RwUCPzlFRBZ2gn6w63w3nNm+rr9+lyYrlx44JkUmzOwpOceY5t3W+
	 ZbU2o0OnRUSFyhPkRi7NRlaq63LKCya+EoXjX0KMmo/CPJfBFYYlWi38J3zIrz/JHb
	 1vi5NOIPiUZRlqjn1Tq849ykdle0OdtgnmveTHRXMRr3dBMJd0DwcDJG9X6R9+ILkd
	 CYHjTKjGTFSOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6D5E40C59;
	Wed,  4 Feb 2026 08:35:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C359CF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4AC560A92
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S561zpUKVvo8 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 08:35:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 809BE60A89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 809BE60A89
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 809BE60A89
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:35:22 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-432da746749so275270f8f.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 00:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770194120; x=1770798920;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pr6J2/4DCh/mVM/Qzece9UqV6xzPL1l2bG1UKDU0xbU=;
 b=rUiD7MJX2YmOYzAjWJK1vONxedlwGFqcFGyx1wppfb7ODADgu+MuISvuZFZjPTllDm
 dXcCFw1LpRK9RYIMcpt0iXP+COfpk63eMvxkqGPJ6ZSv0zjQHyaMIL6nzpo/uvDPEpr/
 2dHe01fUT+38gPzPP3PUzzlA1Alh6eLUjfMxNP55cSfNWtZ1FpXVAdw6aVtgRaXp9xU4
 lsvUuMr2QQLW1LMV5/q9tGFU5DrbWMNiylcX8LGRX/XV8irmhEz02HIWjPzsL5Nk6aGE
 W12G34J0PuyFSWYnQGhqiq1LFRoSGl5PaktnvU+KglNxg3jZwBVKHII+DyiehLTMHUM+
 9qPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqHXnfZSsOnCY9PWM6ECDFl2ZZGHKZlwb4NbB8YSkc4FY61gzc5umX9O4F5mPlVCoS+2X1NS4Yimk=@buildroot.org
X-Gm-Message-State: AOJu0Yx2SWMtQaveWj9dXoSGKYqP2P8N/3kK63hs3IpTqVU9QwEymvav
 vu6zV74gpY537pM8BjF8s4h/n/Za8jfLhV5BQQeO7X734ugfalTHsglL/RDlIhQeFFSIrXW+JFq
 /DzXer3w=
X-Gm-Gg: AZuq6aLFLr3LaylT4BSgrcgtZBC66D2yLuEMK7UthW5abNZRIIBiuk8aqGKMKmxsaLz
 vFwN76w+nFvVaiwkU//33n3xO1v2Xa+0aPPGPmAYt4+8njYjywFO2VLGqnCZ8dEZqbftLSOEAN/
 ziXUtW+AmS9O77GqIKZS+rpISJcg3A9ipsA6LYBfXUgRpAcVQ+t351EWHcwdkvyAnIuOFOOLKV9
 GxnFR1lfLm5bRwILQUGU1fiIISCRQu2ZCBoAT5OvCKC3VRbuKpDlpT4ifzB06CTaVXbNAYNArNW
 dEutKZAZfG0VH9Ya6fLgdzzYsQODP51foe8woGhyujXtPjDpE0zW2J4bKYRB7w6tKxJeNsAZhU6
 exT/+1zexkA1EBxPM9xatHm7QPnDDlloOl1M/Rma7X+tdXeqfSohJAPsd9Nl0uPGYKRixRnrhRh
 rRLhtoZFy0D4t6dqh4/yhpjSWiNl+C8W2xh1SBCk3mAsSyQJd0NBFX
X-Received: by 2002:a5d:5d84:0:b0:435:9325:4702 with SMTP id
 ffacd0b85a97d-43617e3c6femr3073218f8f.21.1770194120086; 
 Wed, 04 Feb 2026 00:35:20 -0800 (PST)
Received: from [172.16.2.208] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436180588bfsm4984699f8f.26.2026.02.04.00.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 00:35:19 -0800 (PST)
Message-ID: <23949c8d-e427-419d-8ad6-325b6277a2cc@smile.fr>
Date: Wed, 4 Feb 2026 09:35:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Romain Naour via buildroot <buildroot@buildroot.org>
References: <20260202213637.396090-1-romain.naour@smile.fr>
 <87jywt8mwf.fsf@dell.be.48ers.dk>
Content-Language: en-US
Cc: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <87jywt8mwf.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770194120; x=1770798920; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Pr6J2/4DCh/mVM/Qzece9UqV6xzPL1l2bG1UKDU0xbU=;
 b=BajMVOErMaYzKVP70qPWV6xwWeduM53FTZHDkd+G19tGyMrKlRNa5aWfT2XTRlug2G
 CTVy/7HufV5ps57qMu/+2NExQpNNlXzITxuduoipglUaNQKrRy9/D8TiL0fQ8ji32jqR
 uQemQkz3BWwgSdK9CcgxPHfhEQ9Ujfu3XbMII=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=BajMVOEr
Subject: Re: [Buildroot] [PATCH] package/php-lua: add support for php >= 8.5
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

QWxsIFBldGVyLCBBbGwsCgpBZGRpbmcgQWxleGlzIGluIENjLgoKTGUgMDMvMDIvMjAyNiDDoCAy
Mzo0NywgUGV0ZXIgS29yc2dhYXJkIGEgw6ljcml0wqA6Cj4+Pj4+PiAiUm9tYWluIiA9PSBSb21h
aW4gTmFvdXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyaXRlczoK
PiAKPiAgPiBPdXIgcGhwIHBhY2thZ2Ugd2FzIHJlY2VudGx5IHVwZGF0ZSB0byA4LjUgdmVyc2lv
biBbMV0gYnV0IHRoaXMgdmVyc2lvbgo+ICA+IHJlbW92ZWQgc29tZSBvbGQgZnVuY3Rpb24gbGlr
ZSB6ZW5kX2V4Y2VwdGlvbl9nZXRfZGVmYXVsdCgpIFsyXS4KPiAgPiBCdXQgcGhwLWx1YSBzdGls
bCB1c2VzIHplbmRfZXhjZXB0aW9uX2dldF9kZWZhdWx0KCkuCj4gCj4gID4gUmVwbGFjZSB6ZW5k
X2V4Y2VwdGlvbl9nZXRfZGVmYXVsdCgpIGJ5IHplbmRfY2VfZXhjZXB0aW9uIGFzIHN1Z2dlc3Rl
ZAo+ICA+IGJ5IHBocCBwcm9qZWN0Lgo+IAo+ICA+IFsxXSBhZWRmMTMxZGE2NmQyZjJlYmNlNjQ3
ODhkZWFiMDdiZTE3Y2UzM2ViCj4gID4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9waHAvcGhwLXNy
Yy9jb21taXQvYTgxMmE3NGMyZTYwYTBiYTA4MDA1NzA2N2E3NjM0ZTRkYTNmMmI5Ygo+IAo+ICA+
IEZpeGVzOgo+ICA+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2pvYnMvMTI5NDQ3OTcyNjggKFRlc3RQaHBMdWFMdWEpCj4gID4gaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMjk0NDc5NzI3MCAoVGVzdFBocEx1YUx1
YWppdCkKPiAKPiAgPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBz
bWlsZS5mcj4KPiAgPiAtLS0KPiAgPiAgLi4uLzAwMDUtYWRkLXN1cHBvcnQtZm9yLXBocC04LjUu
cGF0Y2ggICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwo+ICA+ICAxIGZpbGUgY2hhbmdl
ZCwgMzQgaW5zZXJ0aW9ucygrKQo+ICA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9waHAt
bHVhLzAwMDUtYWRkLXN1cHBvcnQtZm9yLXBocC04LjUucGF0Y2gKPiAKPiAgPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9waHAtbHVhLzAwMDUtYWRkLXN1cHBvcnQtZm9yLXBocC04LjUucGF0Y2ggYi9w
YWNrYWdlL3BocC1sdWEvMDAwNS1hZGQtc3VwcG9ydC1mb3ItcGhwLTguNS5wYXRjaAo+ICA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gID4gaW5kZXggMDAwMDAwMDAwMC4uZGUwYjAwOTk1ZAo+ICA+
IC0tLSAvZGV2L251bGwKPiAgPiArKysgYi9wYWNrYWdlL3BocC1sdWEvMDAwNS1hZGQtc3VwcG9y
dC1mb3ItcGhwLTguNS5wYXRjaAo+ICA+IEBAIC0wLDAgKzEsMzQgQEAKPiAgPiArRnJvbSAyYzhi
NjQyYjcwZWRmNWIwNjAyYjEwYTI1ZDNmMDQ4NzRlMTc1Mjc2IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQo+ICA+ICtGcm9tOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPiAg
PiArRGF0ZTogTW9uLCAyIEZlYiAyMDI2IDIyOjEyOjQ4ICswMTAwCj4gID4gK1N1YmplY3Q6IFtQ
QVRDSF0gYWRkIHN1cHBvcnQgZm9yIHBocCA+PSA4LjUKPiAgPiArCj4gID4gK3BocCByZW1vdmVk
IHplbmRfZXhjZXB0aW9uX2dldF9kZWZhdWx0KCkgYW5kIHJlcGxhY2VkIGJ5IHplbmRfY2VfZXhj
ZXB0aW9uLgo+ICA+ICsKPiAgPiArWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9waHAvcGhwLXNyYy9j
b21taXQvYTgxMmE3NGMyZTYwYTBiYTA4MDA1NzA2N2E3NjM0ZTRkYTNmMmI5Ygo+ICA+ICsKPiAg
PiArVXBzdHJlYW06IHVwc3RyZWFtIGRlYWQsIGN1c3RvbSBwYXRjaAo+IAo+IElmIGl0IGlzIGRl
YWQsIHNob3VsZCB3ZSB0aGVuIG5vdCBkcm9wIHRoZSBwYWNrYWdlPwo+IAo+IEFueXdheSwgZm9y
IG5vdyAtIENvbW1pdHRlZCwgdGhhbmtzLgo+IAoKWW91J3JlIHJpZ2h0LCBidXQgaXQncyBhIG9u
ZSBsaW5lIGNoYW5nZSBvbmx5IGZvciB0aGUgc2FrZSBvZiB0aGUgcnVudGltZQp0ZXN0aW5nIHdl
IGhhdmUgaW4gQnVpbGRyb290IChhbmQgZm9yIHRoZSB3ZWVrbHkgZ2l0bGFiLWNpIHJlc3VsdHMp
LgoKQWxleGlzLCBkbyB5b3Uga25vdyBpZiBwaHAtbHVhIGNhbiBiZSByZW1vdmVkPyAoeW91IGFk
ZGVkIFBIUDgvR0NDMTQgc3VwcG9ydApyZWNlbnRseSkKCkJlc3QgcmVnYXJkcywKUm9tYWluCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
