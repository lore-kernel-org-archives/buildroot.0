Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB37CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 14:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9105484571;
	Sun, 24 Aug 2025 14:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wK6v68nN3zwH; Sun, 24 Aug 2025 14:30:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7EEB84565
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7EEB84565;
	Sun, 24 Aug 2025 14:30:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E3191D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74EFE405D3
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDiaJ6TCw2mD for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 14:30:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5CFA4400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CFA4400D6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CFA4400D6
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:30:57 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45a1b0d231eso19131765e9.3
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 07:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756045855; x=1756650655;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vgKiiSkB7jF50qt4z2hP4dZ0IY9+8D5FCK2rmPoNSXk=;
 b=gEx7hoCpsMO+pk9N2h9qCBkHoeYG6YuWJfXaHQW8bnrbgUwceMn2nimNnF26lGfTkr
 nvQlq6lzJyAg9Z2s7ce5jcdD6xfmz+ofrzSmIpdzUtnWXiQbiwC7oDzLhj6Tt8JAnqPI
 Y7XR5o13f2Ah7XiY/x1i6aV8zpSy+RwD0mWrCRrEBkAlsKSG9+DsQ8H9Y3+kDTOAArCo
 SOh57BMY3uBrP93RiLW7c6IC/NbPfhPpMnB1FrKz7V+Z/lMvAM59FCJ/GMMu8jqm9YyO
 kuOfcT/Fk3hRLj5eORYmkRG7lFBSfUMq/vh//Inl6IbiNzroJNBjZPdjnL5ekcDIKORJ
 RR8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG9DeJ105iCiMLhpyU791AprZDUOWILY8e1++8GmxGyA20aCh4jiD1/kd4wBCNWnzK+s/yP+rP+KU=@buildroot.org
X-Gm-Message-State: AOJu0YxQfU9cFtRO6RLKy0sa//Xnxm5NkgGGhANzZ+CuV2c+oLcnSmDs
 Xo3EMIsIUIyS0YT5Z9NlahhVXDpGsITc3qeJC7xPUnPh2mO7oW3C03O5hg1mCxCZq7Je6Y6gkaK
 9lHn1
X-Gm-Gg: ASbGncuFMuSPx06gt2AWN9zmOwOyGVXtb1RTSEuFeWoEmDlVLYkmr6IU+AkXffYcaC9
 AxtexUqpOnLVCP/RMhm2FfRXKsw+66tMBOr1AX5ONNF5H99fkRO/L83QWvnmWEUSnr057GhXtsj
 a7/5/uIYEzrKexwZqsD5VzCKsgI0M2Bd54x+VEDVpQ/rSms768ZL5rPAae4h4OYTaLPQm4cZmMZ
 BQjxMUPfEU/xMQSSoNxfG8ope24M5O1TBAAscw/ZdAz88jOl0sNPdd2JBmQDipLR2WLAaB3JIMf
 pQ+uTMZdxMAhs+3pZ54yVP/bAX5f4i7sFdRFfm6MjmsJpXzWyrUWy8lh4X/g3uvoKHuJHFLyl8S
 OT0Li1oYch70GTdCG3ntLGFZ/DFsM53ndsn3EMonYi11ute+usqzjgyNAvzDkqI/7s728ny+ngF
 xrYvnIpAfA1nfaVRargk05idvlSocmoDJsUnOyK6Ob4XgElWrpVIzcLhW3EZoOh2WccpyypUk=
X-Google-Smtp-Source: AGHT+IFbKIBFt4ZgbNSHSMWRQXPkNZ3CN+Bdvmux1w3NIHgNc8W/nWa3p94svnD0Nd4rHyJ0OdnOxw==
X-Received: by 2002:a05:600c:b95:b0:459:d645:bff7 with SMTP id
 5b1f17b1804b1-45b5179cf7dmr79940585e9.12.1756045855127; 
 Sun, 24 Aug 2025 07:30:55 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c70b634943sm7626195f8f.0.2025.08.24.07.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 07:30:54 -0700 (PDT)
Message-ID: <4abf2675-1983-4e35-8bdf-7b0d8e9e9ac8@smile.fr>
Date: Sun, 24 Aug 2025 16:30:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Antoine Tenart <atenart@kernel.org>
References: <20250817163144.1217520-1-ju.o@free.fr>
Content-Language: fr, en-US
In-Reply-To: <20250817163144.1217520-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756045855; x=1756650655; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vgKiiSkB7jF50qt4z2hP4dZ0IY9+8D5FCK2rmPoNSXk=;
 b=VY2uieSda+aEpmplmhv3f6NZ61Kbw32gaYjwins2vvB3Gc/rcSF8EFhjNemxaPqg1q
 nB2DEFmxxxx7Xr2pCw/oSnCnbEddSFKnAj77RY5B2joa52UJY8wQDtvqhGFK4Hw2GJTA
 YlgWFiueRfv8mWFwG9fWNvKBZUylrVWZxj3ro=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=VY2uieSd
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_systemd_selinux:
 fix test after bootlin toolchains update
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

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAxNy8wOC8yMDI1IMOgIDE4OjMxLCBKdWxpZW4gT2xpdmFp
biB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gU2luY2UgQnVpbGRyb290IGNvbW1pdCBbMV0g
InVwZGF0ZSB0byBCb290bGluIHRvb2xjaGFpbnMgMjAyNS4wOC0xIiwKPiB0aGUgdGVzdHMuaW5p
dC50ZXN0X3N5c3RlbWRfc2VsaW51eCBmYWlscyB3aGVuIGJ1aWxkaW5nIGl0cwo+IEtlcm5lbCA2
LjEuMjYgd2l0aCBnY2MgMTUuMS4wLgo+IAo+IFRoaXMgY29tbWl0IGZpeGVzIHRoZSBpc3N1ZSBi
eSB1cGRhdGluZyB0aGUgdGVzdCBLZXJuZWwgdG8gdGhlCj4gbGF0ZXN0IDYuMS55IHZlcnNpb24g
KDYuMS4xNDggYXQgdGhlIHRpbWUgb2YgdGhpcyBjb21taXQpIHdoaWNoCj4gaW5jbHVkZXMgdGhl
IGZpeCBmb3IgZ2NjLTE1LgoKSWYgcG9zc2libGUsIHdlIHByZWZlciB3aGVuIHdlIGNhbiBoYXZl
IGEgbGluayB0byB0aGUgdXBzdHJlYW0gZml4LgpJbiB0aGlzIHNwZWNpZmljIGNhc2UsIHRoZSBr
ZXJuZWwgcmVjZWl2ZWQgc2V2ZXJhbCAiVXNlICctc3RkPWdudTExJyB0byBmaXgKYnVpbGQgd2l0
aCBHQ0MgMTUiIGJldHdlZW4gNi4xLjI2IGFuZCA2LjEuMTQ4LiBJIGFkZGVkIG9uZSBvZiB0aGVt
IGluIHRoZSBjb21taXQKbG9nLgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVn
YXJkcywKUm9tYWluCgoKPiAKPiBGaXhlczoKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzEwOTg0Njg1OTQ5Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMDk4NDY4NTk1MAo+IAo+IFsxXSBodHRwczov
L2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvOTQ3ZGJjOTJhMjBj
NWFjZWE3ODgyMTY2Y2FlNzg5M2U2ZWE2NjFlMQo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBP
bGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4gLS0tCj4gIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9pbml0
L3Rlc3Rfc3lzdGVtZF9zZWxpbnV4LnB5IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL2luaXQvdGVzdF9zeXN0ZW1kX3NlbGludXgucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvaW5pdC90ZXN0X3N5c3RlbWRfc2VsaW51eC5weQo+IGluZGV4IGU5YmIzNDA1Y2QuLjM5OGNm
YmFhODIgMTAwNjQ0Cj4gLS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2luaXQvdGVzdF9zeXN0
ZW1kX3NlbGludXgucHkKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvaW5pdC90ZXN0X3N5
c3RlbWRfc2VsaW51eC5weQo+IEBAIC0xMiw3ICsxMiw3IEBAIGNsYXNzIFRlc3RTRUxpbnV4U3lz
dGVtZChpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+ICAgICAgICAgIEJSMl9JTklUX1NZU1RFTUQ9
eQo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJORUw9eQo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJO
RUxfQ1VTVE9NX1ZFUlNJT049eQo+IC0gICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZF
UlNJT05fVkFMVUU9IjYuMS4yNiIKPiArICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9W
RVJTSU9OX1ZBTFVFPSI2LjEuMTQ4Igo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfVVNFX0NV
U1RPTV9DT05GSUc9eQo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0NPTkZJR19G
SUxFPSJib2FyZC9xZW11L3g4Nl82NC9saW51eC5jb25maWciCj4gICAgICAgICAgQlIyX0xJTlVY
X0tFUk5FTF9ORUVEU19IT1NUX0xJQkVMRj15CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
