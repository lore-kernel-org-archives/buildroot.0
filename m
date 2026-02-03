Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0F5E87839
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C01E40B33;
	Tue,  3 Feb 2026 15:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ydN22UC2SMCQ; Tue,  3 Feb 2026 15:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8185140B35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770132037;
	bh=KA/WCL/p0DC5fnKS4vT5M9aVlcs6YYdlQwDMVE85Sz8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TRK2tn/hl/YYNp3xGyrl4GEMOgETmyyTVz4d7qK31//0bHOMUUR+VY98R8p1JBOtG
	 bp8kADmBp/SyZd1WzyNULaJg7r7ZkAi1lumkzwNpPGp8xlhpwRqgVWZFLMSs8fm/Je
	 cLX5IEniYb27z0uGu2ZT5UHtp5twX4xozKCpln/Ris/SA6QRM1CBLM84aMlfmptgej
	 7tT6AxzU/oQXryIV9IY08LWzHrZIWHJedXejo8+xPWSdHwylMoy5kjxHdd8fRs6On4
	 SmehXotHeeQCLO4oZuCUyF32YvhS37aZLoOotV7281B/A3f5iunbMKV8KtFLrEsUT+
	 s45tbYIrBMqug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8185140B35;
	Tue,  3 Feb 2026 15:20:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9049F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7EC040430
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-44idkKsNj8 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3C5940071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3C5940071
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3C5940071
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:20:35 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-658b511573cso9928257a12.0
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 07:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770132033; x=1770736833;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y03U1RBrFSCeOMfXqr24pK7dlkCiqltkM74Nz8YuYxU=;
 b=dCM5lCNVZr/TRE207kQJFIHDUgt8F84AVWpZzUON1mdzw7GJWSzo4zo4xnCxqUD1hk
 nFR4tUZkIaDb4ZNR7+51fogLeTcMN060PE/hquw2ybURqzy5rWdRc6eKtxk9G/jEQxLF
 4TyDFq5/BdTuqDCbTCgIamr+vx3cvy9jkR9zaxJFc9Sd/ZqVJpahXLrUE8l6UPn75hPB
 LaRO0mMNCq/KkwA3CEVYquuk6kp0gwbd1crOf60mYf+lM7wmCXmVe7T5LvOL9KJgGez0
 wWyPy0rQkW9PDnzYVf6CXuYPwYA4MWwJUzu6EHj7uafs7BFBtNIondpqLZjOogoITIfB
 F5rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHhY8qG6FJ2OAB7XB1S5I44oXpCuBvQxjVljzuyfBLW5Fe3ZFE3TZWAIGhomqz0rbX9CaMZybHs/Q=@buildroot.org
X-Gm-Message-State: AOJu0YzutJ54FiitiNHHmAS4izKjxiuEbe7l4Ez4ksDaZur8L8oO0AzL
 jic93D2V7Cm/AAePcMabC4dm6OIKyIx/QTYi5MXUmWC9pRT2tCtMOkqNKtRhmVjNX7U=
X-Gm-Gg: AZuq6aJ4WsGZXUxiODJ2gb2M5OXQWrfDtxnO53gZye8r/qLm1BveMYpfJYUjcuiqD3v
 7KaGqxro5KQIA0ci7UNrQ2DdV2/Tub82IW9jX8NyAUBw6SbLZc9qEoAyYcj3F0PQ+loTHyztU3R
 6St9Q25DhG9GxVMdoulz8Pfjy/7BGostbVBgpVj2dL4dE70NkdnF6Bn0lH1QMDBVQeKjmsgp9A5
 WE61QHucpsrK5U+kD065xprjKn1705+qRmCHZZjAHutwTqBK7upMs9IY5B7S0vqv76cT/w7dBv1
 q8HboQ3ZAlaALgcTI4HFHzktqMYBxQARmrvo39TsBN/mDjyKvtUKyiQTiLBUvEXv4A+VhlJ5yU7
 +2zEdLMeNGirP+UZcXec8djbQyUmnrzy7BkZuXDcX+F9b49qo3DgK1L3pzSHybO4BfMwIZ/AOlF
 EKFzc2lvArG0YmyupMXEofAGaEcPXcUZEQXvLx7sAMJ9EonU+n65ZF
X-Received: by 2002:a05:6402:3645:b0:658:c3c1:2b84 with SMTP id
 4fb4d7f45d1cf-658de557a68mr7242537a12.13.1770132033445; 
 Tue, 03 Feb 2026 07:20:33 -0800 (PST)
Received: from [172.16.2.208] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-658b46abe0asm9220411a12.33.2026.02.03.07.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 07:20:33 -0800 (PST)
Message-ID: <0c99ea3e-3253-4f64-ae5c-64e460150dfb@smile.fr>
Date: Tue, 3 Feb 2026 16:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexander Shirokov <shirokovalexs@gmail.com>, buildroot@buildroot.org
Cc: elmehdi.younes@smile.fr
References: <20250812192941.3477597-2-shirokovalexs@gmail.com>
 <20251026131233.183426-1-shirokovalexs@gmail.com>
 <20251026131233.183426-3-shirokovalexs@gmail.com>
Content-Language: en-US
In-Reply-To: <20251026131233.183426-3-shirokovalexs@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770132033; x=1770736833; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y03U1RBrFSCeOMfXqr24pK7dlkCiqltkM74Nz8YuYxU=;
 b=U6mKCSEWKMouaGljTUErl56fMcPLOsPPzixYtc7rttle8f6DeW4K8DWYQSJhNdcLsi
 WTOJRUdz89RXH93STsAyUcCu9Lp4FHBGB0SKPvlvoWnPCryvgS8cE3BOkzDYsrFyc74x
 qhfTw+QT6hOHpDdINRVgmbONWoUBUKd24MIgw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=U6mKCSEW
Subject: Re: [Buildroot] [v7, 2/2] package/uutils-coreutils: new tests
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

SGVsbG8gQWxleGFuZGVyLCBBbGwsCgpMZSAyNi8xMC8yMDI1IMOgIDE0OjA5LCBBbGV4YW5kZXIg
U2hpcm9rb3YgYSDDqWNyaXTCoDoKPiBBZGQgYSBzbWFsbCBzZXQgb2YgdGVzdHMgZm9yIHV1dGls
cy1jb3JldXRpbHMgdG8gZW5zdXJlIHRoYXQgdGhlIGJpbmFyeQo+IGlzIHByZXNlbnQgYW5kIGV4
ZWN1dGFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFNoaXJva292IDxzaGlyb2tv
dmFsZXhzQGdtYWlsLmNvbT4KPiAtLS0KPiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF9ydXN0LnB5IHwgOSArKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X3J1c3QucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3J1c3QucHkKPiBp
bmRleCA3NjMxMjVjYTIwLi5lYzI2M2RmNmI1IDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfcnVzdC5weQo+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfcnVzdC5weQo+IEBAIC0yOCwxMSArMjgsMTQgQEAgY2xhc3MgVGVzdFJ1
c3RCaW4oVGVzdFJ1c3RCYXNlKToKClRoZSBUZXN0UnVzdEJpbiBhbmQgVGVzdFJ1c3Qgc2hvdWxk
IG9ubHkgdGVzdCB0aGUgcnVzdCB0b29sY2hhaW4uIFJpcGdyZXAgaXMKb25seSB1c2VkIHRvIHZh
bGlkYXRlIHRoZSBydXN0IHRvb2xjaGFpbi4gQWRkaW5nIHV1dGlscy1jb3JldXRpbHMgaW4gdGhp
cyBsaXN0CmlzIGluZGVlZCBjb252ZW5pZW50IGJ1dCBJIHdvdWxkIHByZWZlciBhIHNlcGFyYXRl
IHRlc3QgZm9yIHV1dGlscy1jb3JldXRpbHMuIEl0CndvdWxkIGJlIG5hbWVkIFRlc3RVdXRpbHND
b3JldXRpbHMgdGhhdCB3b3VsZCBoZWxwIHRvIGlkZW50aWZ5IGFueSBpc3N1ZSBjYXVzZWQKYnkg
dGhlIHBhY2thZ2UgaXRzZWxmLgoKdXV0aWxzLWNvcmV1dGlscyBzaG91bGQgYmUgdGVzdGVkIGFn
YWluc3QgYm90aCBSdXN0QmluIGFuZCBSdXN0IHRvb2xjaGFpbi4KCj4gICAgICAgICAgIyBCUjJf
VEFSR0VUX1JPT1RGU19UQVIgaXMgbm90IHNldAo+ICAgICAgICAgIEJSMl9QQUNLQUdFX0hPU1Rf
UlVTVEM9eQo+ICAgICAgICAgIEJSMl9QQUNLQUdFX1JJUEdSRVA9eQo+ICsgICAgICAgIEJSMl9Q
QUNLQUdFX0JVU1lCT1hfU0hPV19PVEhFUlM9eQo+ICsgICAgICAgIEJSMl9QQUNLQUdFX1VVVElM
U19DT1JFVVRJTFM9eQo+ICAgICAgICAgICIiIgo+ICAKPiAgICAgIGRlZiB0ZXN0X3J1bihzZWxm
KToKPiAgICAgICAgICBzZWxmLmxvZ2luKCkKPiAgICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKCJy
ZyBCdWlsZHJvb3QgL2V0Yy9pc3N1ZSIpCj4gKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygiY29y
ZXV0aWxzIC0taGVscCIpCj4gIAo+ICAKPiAgY2xhc3MgVGVzdFJ1c3QoVGVzdFJ1c3RCYXNlKToK
PiBAQCAtNTAsMTEgKzUzLDE0IEBAIGNsYXNzIFRlc3RSdXN0KFRlc3RSdXN0QmFzZSk6Cj4gICAg
ICAgICAgQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQz15Cj4gICAgICAgICAgQlIyX1BBQ0tBR0VfSE9T
VF9SVVNUPXkKPiAgICAgICAgICBCUjJfUEFDS0FHRV9SSVBHUkVQPXkKPiArICAgICAgICBCUjJf
UEFDS0FHRV9CVVNZQk9YX1NIT1dfT1RIRVJTPXkKPiArICAgICAgICBCUjJfUEFDS0FHRV9VVVRJ
TFNfQ09SRVVUSUxTPXkKPiAgICAgICAgICAiIiIKPiAgCj4gICAgICBkZWYgdGVzdF9ydW4oc2Vs
Zik6Cj4gICAgICAgICAgc2VsZi5sb2dpbigpCj4gICAgICAgICAgc2VsZi5hc3NlcnRSdW5Paygi
cmcgQnVpbGRyb290IC9ldGMvaXNzdWUiKQo+ICsgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soImNv
cmV1dGlscyAtLWhlbHAiKQo+ICAKPiAgCj4gIGNsYXNzIFRlc3RSdXN0VmVuZG9yaW5nKGluZnJh
LmJhc2V0ZXN0LkJSQ29uZmlnVGVzdCk6Cj4gQEAgLTcxLDYgKzc3LDggQEAgY2xhc3MgVGVzdFJ1
c3RWZW5kb3JpbmcoaW5mcmEuYmFzZXRlc3QuQlJDb25maWdUZXN0KToKPiAgICAgICAgICBCUjJf
UEFDS0FHRV9QWVRIT04zPXkKPiAgICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT05fQ1JZUFRPR1JB
UEhZPXkKPiAgICAgICAgICBCUjJfQkFDS1VQX1NJVEU9IiIKPiArICAgICAgICBCUjJfUEFDS0FH
RV9CVVNZQk9YX1NIT1dfT1RIRVJTPXkKPiArICAgICAgICBCUjJfUEFDS0FHRV9VVVRJTFNfQ09S
RVVUSUxTPXkKPiAgICAgICAgICAiIiIKPiAgCj4gICAgICBkZWYgc2V0VXAoc2VsZik6Cj4gQEAg
LTk2LDMgKzEwNCw0IEBAIGNsYXNzIFRlc3RSdXN0VmVuZG9yaW5nKGluZnJhLmJhc2V0ZXN0LkJS
Q29uZmlnVGVzdCk6Cj4gICAgICBkZWYgdGVzdF9ydW4oc2VsZik6Cj4gICAgICAgICAgc2VsZi5j
aGVja19kb3dubG9hZCgicmlwZ3JlcCIpCj4gICAgICAgICAgc2VsZi5jaGVja19kb3dubG9hZCgi
cHl0aG9uLWNyeXB0b2dyYXBoeSIpCj4gKyAgICAgICAgc2VsZi5jaGVja19kb3dubG9hZCgidXV0
aWxzLWNvcmV1dGlscyIpCgp1c2luZyByaXBncmVwIGFuZCBweXRob24tY3J5cHRvZ3JhcGh5IGlz
IGVub3VnaCBmb3IgdGVzdGluZyB0aGUgUnVzdCBWZW5kb3JpbmcuCgpCZXN0IHJlZ2FyZHMsClJv
bWFpbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
