Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A0DC77B7C
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 06:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF4E481EAB;
	Thu,  3 Jul 2025 06:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXPvfsbJvhio; Thu,  3 Jul 2025 06:44:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00B4681EB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00B4681EB1;
	Thu,  3 Jul 2025 06:44:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22528128
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 06:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 140DC81EB1
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 06:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lconnlJa3b3j for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 06:44:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DEFC281EAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEFC281EAB
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEFC281EAB
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 06:44:36 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-450cfb79177so45829145e9.0
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 23:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751525074; x=1752129874;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j1LGahnHdWCuE6qMCs/UwJImJC2ekTmtsihfsG4pofU=;
 b=Lkpsh8tDnP3NosXBRngOVvNXvPS0FVhBazAeVfYrsvH9whEt5LGq2+vbPxobX15SUf
 SQVKKKy2Ae/byXYYOowB528jEJcFZiHDDQBpRaBE0RUKbNT8d8/b+Bq4TGz/WSh6QppX
 KGz9LD3ylhvkpfXDSNkUD0/bXZaJXcH3Eg15AVAKZQNFyFx/dS/ekOfuq0/W1plvGqF8
 ezLyXk9ivbivLiSnx3yE88tu90a7DJUfZUrfKhqYv5l9IkjuaBuf4CXohfhIe6t+1RsG
 mu6SEY8ZQjjLQu7Mm5Hn4JWAH4DEJFlQMeoLNppkKaLlxzTSSk3oooZoFQzyJlcHl/oA
 Dk7w==
X-Gm-Message-State: AOJu0Yx/VfA1gcvP1onj749yrfR0QwoQTuI8mnJPDvdw7JYCxuYwVqxi
 469gHPQBVpD6my+GOZz2NzbxKnzMgOdLEoZUPG/01qodv3T9DvxvF1O94ldoKTQe9fxyGtrbw6R
 9eMQcr7M=
X-Gm-Gg: ASbGncv4lasjjriWM3/XpW8IUa1cJN/VcXZlHliMLzlCEm0MqpRJjOMfUqBmXXF3QpX
 1Ds9ihvmLrWyyg8Dva3nl3aomSyY3HvbOla9h4oiUfJx2N5sflp9meG8lf2aRQ5J9mVWDlAIEpC
 +5gYVHKDDPthV9ewTw7W1KBREAH+9pJtnM8SLO+bT2uxKUPtZzpR1zunFkPOK8DRRjvADvgtnL5
 An1up7TTN1gbNnS0yGTPDx+i/BiGeMM/rwObmQYfLqY59vODYDkJLw6Xy/tiHUaVZQZiSa6TQ3g
 Iad7KK/bm3QhwV9Zg9NedN3ZGxIsM/Rz7T4rAPEXF91Gt4r9kOzbrvCUK8OmVj4=
X-Google-Smtp-Source: AGHT+IGC3ybvMdFupm2a8Mc/EB1uEU45475FiPVdEpzkT6rCFAfOD3TyKJGJhsgoTHctmYaaMb6TWg==
X-Received: by 2002:a05:600c:4745:b0:445:49e:796b with SMTP id
 5b1f17b1804b1-454a9cc478dmr26377145e9.17.1751525074090; 
 Wed, 02 Jul 2025 23:44:34 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3aba76e40c0sm13715389f8f.59.2025.07.02.23.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 23:44:33 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6D63E5F8AE;
 Thu, 03 Jul 2025 07:44:32 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org,  Joseph Kogut <joseph.kogut@gmail.com>,  Romain
 Naour <romain.naour@gmail.com>,  Daniel Lang <dalang@gmx.at>,  Valentin
 Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <7ee26828-4b3d-4942-8c30-8293455c59fc@smile.fr> (Romain Naour's
 message of "Thu, 3 Jul 2025 00:37:07 +0200")
References: <20250626111642.228223-1-alex.bennee@linaro.org>
 <20250626111642.228223-4-alex.bennee@linaro.org>
 <7ee26828-4b3d-4942-8c30-8293455c59fc@smile.fr>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Thu, 03 Jul 2025 07:44:32 +0100
Message-ID: <87qzyxdb8v.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751525074; x=1752129874; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j1LGahnHdWCuE6qMCs/UwJImJC2ekTmtsihfsG4pofU=;
 b=JMzI92+it4RgmBBX0WX2SYqnSz8fBVhghMvw3xgexBHm1OowroZEAMMVqSokSZFuLa
 E3PX4+HDhiStf8nmscr0FCcxgrjRZ7/WXTlkcXg9q6A66eVHWSfOI2KZV/ryeT+EHDwx
 KsOn1ICKuzrYqBA9rUgYgz2fhstCEl6vK5saM81MBqxg4n7aaNwMOSBRLQUKsP+iRil7
 c5rJmKemlZ9TkK4vrleyrV+2SET1JXh0JWSAXtwrsDvs+ZwypMIo1XZf/ZqGeILe4K6R
 el3r0w+YFUb3MFXyOSJqhftxQmPkNUVSZiuacDT5yxu1aZMsH63jegooxPaKDR+qUb8c
 abkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JMzI92+i
Subject: Re: [Buildroot] [RFC PATCH 3/3] package/llvm-project: reduce the
 build size of llvm
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyaXRlczoKCj4gSGVsbG8gQWxl
eCwgQWxsLAo+Cj4gTGUgMjYvMDYvMjAyNSDDoCAxMzoxNiwgQWxleCBCZW5uw6llIGEgw6ljcml0
wqA6Cj4+IEFsdGhvdWdoIHdlIHJlcXVlc3QgYSBSZWxlYXNlIGJ1aWxkIHRoZSBkZWZhdWx0IENN
QUtFIGZsYWdzIGluCj4+IHRvb2xjaGFpbi5jbWFrZSBpbmNsdWRlIC1PZyAtZzMgd2hpY2ggZW5h
YmxlcyBkZWJ1ZyBzeW1ib2xzIGZvciB0aGUKPj4gYnVpbGQgaW5mbGF0aW5nIHRoZSBvdmVyYWxs
IHNpemUgb2YgdGhpbmdzLgo+Cj4gQnkgZGVmYXVsdCwgLU8yIC1nMCBpcyB1c2VkIGJ5IEJ1aWxk
cm9vdC4gSWYgeW91IGhhdmUgLU9nIC1nMyBpbiB0b29sY2hhaW4uY21ha2UKPiBnZW5lcmF0ZWQg
YnkgQnVpbGRyb290LCBpdCBtZWFucyB0aGF0IEJSMl9FTkFCTEVfREVCVUcsIEJSMl9ERUJVR18z
IGFuZAo+IEJSMl9PUFRJTUlaRV9HIGhhdmUgYmVlbiBzZWxlY3RlZCBpbiB0aGUgQnVpbGRyb290
IGNvbmZpZ3VyYXRpb24gKGJ5Cj4gdGhlIHVzZXIpLgoKV2hlcmUgaXMgdGhlIGxvZ2ljIHRoYXQg
c2V0cyB0aGlzPyBCZWNhdXNlOgoKICDinpwgIGFnIERFQlVHIC5jb25maWcKICAxNzk6QlIyX1RP
T0xDSEFJTl9IQVNfVEhSRUFEU19ERUJVRz15CiAgMzA2OiMgQlIyX0VOQUJMRV9ERUJVRyBpcyBu
b3Qgc2V0CiAgMzA3OiMgQlIyX0VOQUJMRV9SVU5USU1FX0RFQlVHIGlzIG5vdCBzZXQKICA0MTQ2
OiMgQlIyX1BBQ0tBR0VfT1BFTlBPV0VSTElOS19ERUJVR19MRVZFTCBpcyBub3Qgc2V0CgpCdXQ6
CgogIOKenCAgYWcgIkJ1aWxkcm9vdCBDRkxBR1MiIC4vaG9zdC9zaGFyZS9idWlsZHJvb3QvdG9v
bGNoYWluZmlsZS5jbWFrZQogIDU3OiAgc2V0KENNQUtFX0NfRkxBR1MgIi1EX0xBUkdFRklMRV9T
T1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLU9nIC1n
MyAtRF9GT1JUSUZZX1NPVVJDRT0xIiBDQUNIRSBTVFJJTkcgIkJ1aWxkcm9vdCBDRkxBR1MiKQoK
Pgo+PiAKPj4gRm9yIG5vdyBqdXN0IGNvcHkgdGhvc2UgZGVmYXVsdHMgaW50byB0aGUgcHJvamVj
dCBtayBmaWxlIGFuZCBkcm9wIHRoZQo+PiAtT2cgYW5kIC1nMyBsaW5lcy4gVGhpcyBkcm9wcyB0
aGUgc2l6ZSBvZiB0aGUgbGx2bSBidWlsZCBkaXJlY3Rvcnkgb24KPj4gbXkgYXJtNjQgYnVpbGQg
ZnJvbSAxN0diIHRvIGEgbW9yZSByZWFzb25hYmxlIDQuNEdiLgo+PiAKPj4gU2lnbmVkLW9mZi1i
eTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+PiAtLS0KPj4gIHBhY2th
Z2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tayB8IDEwICsrKysrKysrKysKPj4gIDEgZmlsZSBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sbHZt
LXByb2plY3QvbGx2bS9sbHZtLm1rIGIvcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9sbHZtLm1r
Cj4+IGluZGV4IDc4YWE2ZmU0NjcuLjAzNjg0MDg0YzQgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2Uv
bGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tawo+PiArKysgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9s
bHZtL2xsdm0ubWsKPj4gQEAgLTE2Nyw2ICsxNjcsMTYgQEAgTExWTV9DT05GX09QVFMgKz0gLURM
TFZNX0hBVkVfVEZMSVRFPSIiCj4+ICBIT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQlVJ
TERfVFlQRT1SZWxlYXNlIC1HIE5pbmphCj4+ICBMTFZNX0NPTkZfT1BUUyArPSAtRENNQUtFX0JV
SUxEX1RZUEU9UmVsZWFzZSAtRyBOaW5qYQo+PiAgCj4+ICsjIFJlZHVjZSB0aGUgb3Bwb3J0dW5p
dHkgZm9yIGRlZmF1bHQgW0N8Q1hYXV9GTEFHUyB0byBmYXR0ZW4gdGhlIGJ1aWxkCj4+ICtIT1NU
X0xMVk1fQ09ORl9PUFRTICs9IC1ETExWTV9FTkFCTEVfQVNTRVJUSU9OUz1PRkYKPj4gK0xMVk1f
Q09ORl9PUFRTICs9IC1ETExWTV9FTkFCTEVfQVNTRVJUSU9OUz1PRkYKPj4gCj4gTExWTV9FTkFC
TEVfQVNTRVJUSU9OUyBpcyBPRkYgYnkgZGVmYXVsdCBleGVwdCBmb3IgZGVidWcgYnVpbGRzLgo+
Cj4gKwo+PiArSE9TVF9MTFZNX0NPTkZfT1BUUyArPSAtRENNQUtFX0NfRkxBR1M9Ii1EX0xBUkdF
RklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQg
LURfRk9SVElGWV9TT1VSQ0U9MSIKPj4gK0xMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQ19GTEFH
Uz0iLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklMRV9PRkZT
RVRfQklUUz02NCAtRF9GT1JUSUZZX1NPVVJDRT0xIgo+PiArCj4+ICtIT1NUX0xMVk1fQ09ORl9P
UFRTICs9IC1EQ01BS0VfQ1hYX0ZMQUdTPSItRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklM
RTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1EX0ZPUlRJRllfU09VUkNFPTEiCj4+
ICtMTFZNX0NPTkZfT1BUUyArPSAtRENNQUtFX0NYWF9GTEFHUz0iLURfTEFSR0VGSUxFX1NPVVJD
RSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAtRF9GT1JUSUZZ
X1NPVVJDRT0xIgo+Cj4gSSdtIG5vdCBzdXJlIGFib3V0IHRoaXMgY2hhbmdlLCBzaW5jZSBpdCBh
bHNvIGNoYW5nZSBmb3Igb3RoZXIgQlIyX09QVElNSVpFX3gKPiBvcHRpb25zIGFuZCB3aGVuIEJS
Ml9FTkFCTEVfREVCVUcgaXMgZGlzYWJsZWQuIFdlIHdhbnQgdG8ga2VlcCB0aGUgb3B0aW1pemF0
aW9uCj4gbGV2ZWwgc2VsZWN0ZWQgYnkgdGhlIHVzZXIuCj4KPiBXaGF0IGFib3V0IHNvbWV0aGlu
ZyBsaWtlIGtleGVjIHBhY2thZ2UgWzFdIHRvIGZvcmNlIHRoZSBvcHRpbWl6YXRpb24gbGV2ZWwg
dG8gYQo+IG1pbmltdW0/Cj4KPiBJIHJlbWVtYmVyIChiYWNrIGluIDIwMTgpIGxsdm0gY3Jhc2hp
bmcgd2l0aCBEZWJ1ZyBidWlsZCB0eXBlLCB0aGF0J3Mgd2h5IGl0J3MKPiBmb3JjZWQgdG8gUmVs
ZWFzZSB0eXBlIGJ1dCB0aGUgZGVmYXVsdCBidWlsZCBvcHRpb25zIHdlcmUgdXNlZCAoLU8yIC1n
MCkuCj4KPiBbMV0KPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9ibG9iL21hc3Rlci9wYWNrYWdlL2tleGVjL2tleGVjLm1rP3JlZl90eXBlPWhlYWRzI0wyMwo+
Cj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+Cj4KPj4gKwo+PiAgIyBDb21waWxlIGxsdm0gd2l0
aCB0aGUgQysrMTQgKElTTyBDKysgMjAxNCBzdGFuZGFyZCkuCj4+ICBIT1NUX0xMVk1fQ09ORl9P
UFRTICs9IC1EQ01BS0VfQ1hYX1NUQU5EQVJEPTE0Cj4+ICBMTFZNX0NPTkZfT1BUUyArPSAtRENN
QUtFX0NYWF9TVEFOREFSRD0xNAoKLS0gCkFsZXggQmVubsOpZQpWaXJ0dWFsaXNhdGlvbiBUZWNo
IExlYWQgQCBMaW5hcm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
