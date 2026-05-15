Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EEACD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 11:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF27E61549;
	Fri, 15 May 2026 11:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nu4TW-5DuVme; Fri, 15 May 2026 11:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 236EF6154A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778844072;
	bh=j2Dyit2ZEsSb08pl2M7arTvl2wodJHNeNdRjfn0xF7s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e01MZsHeMYbu959wdkeYg/QIwVKtEpFs9R5A7Fb1uYg0JVN9k9VMQfPrUL6e1DVZf
	 pVKKv7atIq/Qs+p/VdNxnK7E4ajehRM3G6Eq3zU/b3cLEG8kFpZxjHVLNCQu0eKLSV
	 weXOevtL+X1lpssexmEY0BnL4sEZoZomlNuGSc49BqBxWnNv0CZI8dqx2HYcZ8nJ3x
	 pmmOMPj8Kd8l4h70vH1uZm9R6/XAaNULdT8DaOia1NkwXfyExBqQJ8p0OL7XSeYRzW
	 Vo1b84PkxWbRwG+UaVD15BMjonQu/He6UvcQCTKVZawCxIcTj/KzDOokrzxY9Vey37
	 gD9djCHFeQxKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 236EF6154A;
	Fri, 15 May 2026 11:21:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0589136F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 11:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF44840DE7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 11:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnTOw_sD30Va for <buildroot@buildroot.org>;
 Fri, 15 May 2026 11:21:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98645404E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98645404E4
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98645404E4
 for <buildroot@buildroot.org>; Fri, 15 May 2026 11:21:06 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso104091355e9.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 04:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778844064; x=1779448864;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qIlfjnb5P7/qMjOjHGoy4AFTPWCQVbykYWBEP7UBloY=;
 b=iEce6hDAvGbwFI23HlPHrlLC23MuiS7rHl5vqZS9OCBeSODTYyy5Ibf/SvXMwfRZEp
 RZRSOYesxgfeXMJN4EIloS1LoRZykGvR9fgyqGYN9kIb3qJKnXP7+x3m57spg8mQ8W4m
 6CGV0L3GiawlW2vHrbb8HZp62EyURXt5vqjmZSSwpQ3Rnhbt6GUVgXAjEjMSIoKDUfwH
 veAgmv2oUo6J9UH+2OePijKXQEH+4JpYzVnebxr5+ONwjNOUnxkmroSL3qkU1GcxoPU+
 nHUtEHsMBp24+LLHpEqZ7rVhOURWmDdiWSSwTgceC4lxrgHdJOQU34Vlc4H1yYX/fufS
 7KnQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9aKiJBCQpS+0L5truALWwfxbZrS4N6yfiHO/LfAhx7GnWS6bgT19BAZXmUNJj6ZdXZ3bxpoNgedzs=@buildroot.org
X-Gm-Message-State: AOJu0Yw2YmSffVm0pp7wv2YV/N/U0QJ0gESIk6yahCb0lllUZ6IlgVcv
 5XPEwtYnbnN2nUWUZ2utB4sosyp8KMYJgvOwVqucDjHWwMViuBn+kjds9au3eDEirxU=
X-Gm-Gg: Acq92OG0rQfXiWoOtXEOJEQKPYNpdKMcpKK24rP7hQG+qwwu4XNYLxqd1iVCD98q9ro
 npYqXIlbscZ5FR9ji3KshhxOmzBaGDYqFkVPmUURR8uipL2K6lbmkgIzCEHqTugeOoq+EV2m/58
 7CJBMmodtfTv/+CkL8BTkgIfBrKCUTK/rs/DajATxMNULmOwZA7Kzi22167Eo3hnw8wuQ28t5Zc
 /vn1Yw7jFL9G9vYpgXtYCUQiW4ZHUgb7zIYRxHE7Zo1CAVTEpTMcS8d2ukinXzhlnIBpftBOltK
 QvR/pnvQx4FucWKvl9anUbpjMi+l3e50wteu0r5o/dQNYy5rdZ8893aJmV/3n66AXGuhhjpBZQ6
 LgWxdRX0bxeM3RuS+/8/v2+BQVpjKcMNUVnbt2hwqxWrZ+MyrqaeQbXJ8Kfed/RNwapyKVC8e0u
 QyXKq/Aef5v3oySEWLlLJD1pOOwIBSlvitmYFILPP4FbgNOlpdWFTr/PSYciPxeW/ZB4qOQXkEY
 ovK9l1Xn8n9m/eRcoI3MwydI7iMyGRGr9arpl8wWkUVx1icFjT51/19z4Nho/pPOA==
X-Received: by 2002:a05:600c:4455:b0:48e:8dec:19ad with SMTP id
 5b1f17b1804b1-48fe60ea94emr46998685e9.12.1778844064404; 
 Fri, 15 May 2026 04:21:04 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe67688sm14326435e9.5.2026.05.15.04.21.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 04:21:03 -0700 (PDT)
Message-ID: <e1f3991c-0557-43e2-b63a-0ad674e54928@smile.fr>
Date: Fri, 15 May 2026 13:21:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph@anodize.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>
References: <20260514-radeonsi-aco-compiler-v2-1-d7dbeca185ca@anodize.com>
Content-Language: fr
In-Reply-To: <20260514-radeonsi-aco-compiler-v2-1-d7dbeca185ca@anodize.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778844064; x=1779448864; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qIlfjnb5P7/qMjOjHGoy4AFTPWCQVbykYWBEP7UBloY=;
 b=rZpgbIGmJ0xiWnUcy+h64rX/yUnyYyvg01LLo29feV5F9PubpAJ58bPndmByBDnD0V
 dw1J6KfNg43fD7ySjqni2WJ+qOO2uenCHhIOSaRoEEn4jc8EAgMxymg6UZ2t2OQrq+dp
 ZirBGTnWITTh368ilrNaG2kk16nppZpiXNvJ4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=rZpgbIGm
Subject: Re: [Buildroot] [PATCH v2] package/mesa3d: make LLVM optional for
 radeonsi
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

SGVsbG8gSm9zZXBoLAoKTGUgMTQvMDUvMjAyNiDDoCAyMzoyNCwgSm9zZXBoIEtvZ3V0IGEgw6lj
cml0wqA6Cj4gU2luY2UgbWVzYTNkIHYyNi4wIFswXSwgdGhlIEFDTyBjb21waWxlciBoYXMgYmVl
biB0aGUgZGVmYXVsdCBvdmVyIExMVk0uCj4gVGhpcyBzaGFkZXIgY29tcGlsZXIgYmFja2VuZCBo
YXMgYmVlbiB1c2VkIGZvciBldmVuIGxvbmdlciBieSB0aGUgUkFEVgo+IHZ1bGthbiBkcml2ZXIu
Cj4gCj4gTGV0J3MgbWFrZSBMTFZNIG9wdGlvbmFsLgo+IAo+IFVzZXJzIHdobyB3aXNoIHRvIGNv
bnRpbnVlIHVzaW5nIExMVk0gbXVzdCBlbmFibGUgc3VwcG9ydCBpbiBNZXNhLCBhbmQKPiBvdmVy
cmlkZSB0aGUgZGVmYXVsdCBBQ08gY29tcGlsZXIgYXQgcnVudGltZSB1c2luZyBhbiBlbnYgdmFy
LiBbMV0KPiAKPiBVc2VycyB3aG8gb25seSB3YW50IHRvIHVzZSB0aGUgZGVmYXVsdCBjb21waWxl
ciBiYWNrZW5kIG1heSBkaXNhYmxlIExMVk0KPiBzdXBwb3J0LCBhbmQgc2F2ZSBhIGxvdCBvZiB0
aW1lIGR1cmluZyB0aGUgYnVpbGQuCj4gCj4gWzBdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9tZXNhL21lc2EvLS9jb21taXQvZTI2YzI4ZjMxMWNjNTQxNmY2YzdmNWIwOWE1M2NhMmIx
NGRmYjk1NQo+IFsxXSBodHRwczovL2RvY3MubWVzYTNkLm9yZy9lbnZ2YXJzLmh0bWwjZW52dmFy
LUFNRF9ERUJVRwo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvc2VwaCBLb2d1dCA8am9zZXBoQGFub2Rp
emUuY29tPgo+IFJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5m
cj4KCkFwcGxpZWQgdG8gbmV4dCwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gLS0t
Cj4gQ2hhbmdlcyBpbiB2MjoKPiAtIFVwZGF0ZSBtZXNhIGNvbW1pdCBVUkwgZnJvbSBjZ2l0IHRv
IGdpdGxhYgo+IC0gRG9jdW1lbnQgZm9yY2luZyBMTFZNIGNvbXBpbGVyIGF0IHJ1bnRpbWUKPiAt
IExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDUxMi1yYWRlb25zaS1h
Y28tY29tcGlsZXItdjEtMS02NTU3NjI3ZjNkNTVAYW5vZGl6ZS5jb20KPiAKPiBUbzogYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBDYzogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiBD
YzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+IC0tLQo+ICBwYWNrYWdl
L21lc2EzZC9Db25maWcuaW4gfCAxMSArKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21l
c2EzZC9Db25maWcuaW4gYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KPiBpbmRleCA2NmViZTA0
Mzk0Li44Y2RiNTQ4ZmI2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgo+
ICsrKyBiL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgo+IEBAIC0yNTIsMTcgKzI1MiwyNCBAQCBj
b25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX1JBREVPTlNJCj4gIAlib29s
ICJHYWxsaXVtIFJhZGVvbiBTSSBkcml2ZXIiCj4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMg
bGliZHJtCj4gIAlkZXBlbmRzIG9uIEJSMl9pMzg2IHx8IEJSMl94ODZfNjQKPiAtCWRlcGVuZHMg
b24gQlIyX1BBQ0tBR0VfTUVTQTNEX0xMVk0KPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0Rf
R0FMTElVTV9EUklWRVIKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJEUk1fQU1ER1BVCj4gIAlz
ZWxlY3QgQlIyX1BBQ0tBR0VfTElCRFJNX1JBREVPTgo+IC0Jc2VsZWN0IEJSMl9QQUNLQUdFX0xM
Vk1fQU1ER1BVCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTExWTV9BTURHUFUgaWYgQlIyX1BBQ0tB
R0VfTUVTQTNEX0xMVk0KPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9FTEZVVElMUwo+ICAJc2VsZWN0
IEJSMl9QQUNLQUdFX01FU0EzRF9ORUVEU19FTEZVVElMUwo+ICAJc2VsZWN0IEJSMl9QQUNLQUdF
X01FU0EzRF9SVVNUSUNMX1NVUFBPUlRFRF9EUklWRVIKPiAgCWhlbHAKPiAgCSAgRHJpdmVyIGZv
ciBBVEkvQU1EIFJhZGVvbiBIRDcwMDAvSEQ4MDAwL1J4MjAwIEdQVXMuCj4gIAo+ICsJICBTaW5j
ZSBNZXNhIDI2LjAuMCwgdGhlIGRlZmF1bHQgc2hhZGVyIGNvbXBpbGVyIGlzIEFDTywKPiArCSAg
ZXZlbiB3aGVuIExMVk0gc3VwcG9ydCBpcyBlbmFibGVkIGF0IGJ1aWxkIHRpbWUuCj4gKwo+ICsJ
ICBVc2UgdGhlIGVudiB2YXIgQU1EX0RFQlVHPXVzZWxsdm0gdG8gb3ZlcnJpZGUgdGhlCj4gKwkg
IGRlZmF1bHQgYW5kIHVzZSBMTFZNIGF0IHJ1bnRpbWUuCj4gKwo+ICsJICBodHRwczovL2RvY3Mu
bWVzYTNkLm9yZy9lbnZ2YXJzLmh0bWwjZW52dmFyLUFNRF9ERUJVRwo+ICsKPiAgY29uZmlnIEJS
Ml9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9TVkdBCj4gIAlib29sICJHYWxsaXVtIHZt
d2FyZSBzdmdhIGRyaXZlciIKPiAgCWRlcGVuZHMgb24gQlIyX2kzODYgfHwgQlIyX3g4Nl82NAo+
IAo+IC0tLQo+IGJhc2UtY29tbWl0OiA5Njg0Y2I5YjQ0MDZlMDE2ODNhOWI1MTM2MTAwZDgxMDQw
ZDU2YWEwCj4gY2hhbmdlLWlkOiAyMDI2MDUxMi1yYWRlb25zaS1hY28tY29tcGlsZXItYWU0ZTY5
N2Q0ODQ4Cj4gCj4gQmVzdCByZWdhcmRzLAo+IC0tICAKPiBKb3NlcGggS29ndXQgPGpvc2VwaEBh
bm9kaXplLmNvbT4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
