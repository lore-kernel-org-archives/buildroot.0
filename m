Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A24DE7C6F9
	for <buildroot@archiver.kernel.org>; Sat, 31 Jan 2026 22:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6555834F1;
	Sat, 31 Jan 2026 22:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZKuG3BaruQr; Sat, 31 Jan 2026 22:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E7DD834F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769898639;
	bh=BqSOeEu4PxwOqU8coBDYPs7+ah92eIIzvBeuBQytVcI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PINodEd+QAzbgJkrKbIDcoR+sK7Iy2FzbTa5JeqyzrxPttOjSlQAlY0/+iegkL2jh
	 5y8CzqwIUTfn3zPmN8BwIS5d1CEVlmOqDDHT1Sdn5IrFpvZWFTp08RccCq7Ht2HV/+
	 aWnonAN1d5AY2WciwWqcXcaM2WlA/xe9cUfq5igHm6UYMCpG9fmpRu99SApQ8pdqZe
	 uGOzMxLVop01dMYlL6NIyIca2QcyYGtnvg5ezILKUo3FnZspLOn/dQUInODUzhtQig
	 im1+u5gLXvYDFK80DfNJk02wP8wQEnB/3KZEYONcOKTtuD1/2udQoW3+L/i+NDL8Sv
	 RLd58wfzb3v+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E7DD834F4;
	Sat, 31 Jan 2026 22:30:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B56C21E0
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 22:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EE7F4099B
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 22:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEZZBOkmr3wH for <buildroot@buildroot.org>;
 Sat, 31 Jan 2026 22:30:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=boerge.struempfel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 73A8740996
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73A8740996
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73A8740996
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 22:30:36 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4806a7ec499so1874075e9.3
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 14:30:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769898634; x=1770503434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UolrmrHIuA7Y1AsTsU5EivVEGwuyBEdx53sNn6qtKCk=;
 b=BsTeYIHEKWa0kG4H83o9lZA+L9WIrhrnyOORDTTLWuzUyfnmdaMmF5bpaGV1daJYtd
 wEUbqz/ofHUhFTOgrgLyI4LtXnzxM5lVi91NXvCiJUVlJ+6xqdOgN+kju4LKbK1IesIG
 xu56mCW18PE6D/z+ZW7Y+QniVyiR/a4sDNeWA7Cn08qTN15kWEqmjiB9Zl/bRx4ZQeSS
 epcZgUVJCoL5WXV/sahpzxdrShZyORK+v4HV0iRbqkHLtmXZZ8v62o5O70uxM4OV+upT
 TSQxNpLfAXnYoRl2cXFk375/coUHnt7oZspSrRir19P6SBVfpRgQEE/cz0WorqZt/6KY
 Ya2A==
X-Gm-Message-State: AOJu0Yx2OfKTtVNkLZz3C76hfnMlxKNqZXSLmQyloUCdyOEfVjXngk4h
 73ynMOQQtDAly/AQba78M86VXhHKNcSA12GYzwxyLURHX+nJneVaABlmb3rSWZol
X-Gm-Gg: AZuq6aLG4hH3rE71wTKMEK9IU3eGugiwhOK7Wuky3i3iZzN+Cp+xaHCe4Vrs0QmlXxK
 izCsh+yeNjefrj4VirUDhRezFJ1Kw/XUta3+oiUk+5S6qBBjJ9Gxhi2PoRQ8Nz6x0up+O8BNO+T
 XI273RIkWRwqAa867eXH2NN6wt3VFEo6Pu7vdDVoFgbHOk6ZhUqrZIRhnJRrpKfmos/Nb8lxrGc
 wxFrshvLMkTuwL31zBCTeUIf5D7yXFNO2V1yTsSVWRlvDMBGa+LsSlx90cScbaO4b3mlY9RHXjk
 OXJ7asARAHGwzJqlk+7fCnTWfxG73qJEZy5Ys7qT3pw8mw+s/L4uOnlZ3+oCsV2CpwxaDfGS374
 y48OasTnRovEu7AsNCmaq14Z3bBvmGPdqvwqayDJzE7KEbpP9227j+5pERk20TrKmxI4+3B8nhe
 cuPV8Wu0wN4bDeWR1JIFI4whM0NW9TOmeUX2SEbqsaWtsCDnTCS0bnYCeAVd7Jm8Kyj5uzY65/T
 LzFhgSnPfSSn/cL2x2vQ39plESE4/kHtqfTKZDCwbZ46BxnDQ==
X-Received: by 2002:a05:600c:6209:b0:477:a478:3f94 with SMTP id
 5b1f17b1804b1-482db49a1b1mr55567005e9.5.1769898634169; 
 Sat, 31 Jan 2026 14:30:34 -0800 (PST)
Received: from boerge-desktop.shire.home.arpa
 (p200300c7872f80009df45c8f4846b22f.dip0.t-ipconnect.de.
 [2003:c7:872f:8000:9df4:5c8f:4846:b22f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10edf62sm35392783f8f.13.2026.01.31.14.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jan 2026 14:30:32 -0800 (PST)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Boerge Struempfel <boerge.struempfel@gmail.com>
Date: Sat, 31 Jan 2026 23:29:45 +0100
Message-ID: <20260131222948.844562-1-boerge.struempfel@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130131014.1506555-1-buildroot@bubu1.eu>
References: 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769898634; x=1770503434; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UolrmrHIuA7Y1AsTsU5EivVEGwuyBEdx53sNn6qtKCk=;
 b=RFpSdgUrplh29eL5p5MbUEKIoaf4LqC6Xl8OC5hXFJrLunFfnXc5NNPcDf2PWtzR7t
 OMQoUQd/mmlkK/wtC9QUUIJg+LoGtjeEC0WWPL7LDYHn8dKDbsIBZdqiTK7nw9MSKJ4e
 hpSkLW4arHElYs3xcTdXHtHEWTjPUKlhissbjaZkWhy6ldLAmodIWj54hiWOr1CxNxCR
 fYOCB1BNAQVkfPNCBKyOLTxsBhFEP8e1agLsRiYswrTQohLv7Waa78xnrGACwC8APQ/8
 hMdMt4lKYUXO9BH8IfQpMJPoZFEDMXilItjmayDuoONm4WkUWHV2fQjhbJ/yapA8+Csg
 4f1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RFpSdgUr
Subject: Re: [Buildroot] [PATCH] package/libgpiod2: add option to enable
 gpioset interactive mode
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

SGVsbG8gTWFyY3VzLAoKVGhhbmtzIGZvciB0aGUgcGF0Y2guIEZ1bmN0aW9uYWxseSwgaXQgbG9v
a3MgZ29vZCB0byBtZSwgaG93ZXZlciBJIGRvIGhhdmUgb25lCnNtYWxsIG5pdHBpY2tpbmcgY29t
bWVudCBvbiB0aGUgaGVscCB0ZXh0IChzZWUgYmVsb3cpLgoKSSBhbHNvIHRlc3RlZCB0aGlzIG9u
IGFuIGkuTVg4TVAgYm9hcmQgYW5kIGl0IHNlZW1zIHRvIGJlIHdvcmtpbmcgYXMKaW50ZW5kZWQu
CgpPbiBGcmksIDMwIEphbiAyMDI2IDE0OjEwOjEzICswMTAwIE1hcmN1cyBIb2ZmbWFubiB2aWEg
YnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IFNpZ25lZC1vZmYt
Ynk6IE1hcmN1cyBIb2ZmbWFubiA8YnVpbGRyb290QGJ1YnUxLmV1PgpUZXN0ZWQtYnk6IEJvZXJn
ZSBTdHJ1ZW1wZmVsIDxib2VyZ2Uuc3RydWVtcGZlbEBnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2th
Z2UvbGliZ3Bpb2QyL0NvbmZpZy5pbiAgICB8IDExICsrKysrKysrKystCj4gIHBhY2thZ2UvbGli
Z3Bpb2QyL2xpYmdwaW9kMi5tayB8ICA3ICsrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGli
Z3Bpb2QyL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGliZ3Bpb2QyL0NvbmZpZy5pbgo+IGluZGV4IDVh
MTNiZmMzNDQuLjI3OWIxZTQwZTcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJncGlvZDIvQ29u
ZmlnLmluCj4gKysrIGIvcGFja2FnZS9saWJncGlvZDIvQ29uZmlnLmluCj4gQEAgLTIxLDcgKzIx
LDE2IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJHUElPRDJfVE9PTFMKPiAgCWhlbHAKPiAgCSAg
SW5jbHVkZSBhIHNldCBvZiBjb21tYW5kLWxpbmUgdG9vbHMgZm9yIG1hbmFnaW5nIEdQSU9zLgo+
ICAKPiAtZW5kaWYKPiAraWYgQlIyX1BBQ0tBR0VfTElCR1BJT0QyX1RPT0xTCj4gKwo+ICtjb25m
aWcgQlIyX1BBQ0tBR0VfTElCR1BJT0QyX0dQSU9TRVRfSU5URVJBQ1RJVkUKPiArCWJvb2wgImdw
aW9zZXQgaW50ZXJhY3RpdmUiCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCRURJVAo+ICsJaGVs
cAo+ICsJICBCdWlsZCB3aXRoIGdwaW9zZXQgaW50ZXJhY3RpdmUgbW9kZS4KCkkgYW0gbm90IHF1
aXRlIHN1cmUsIGJ1dCBJIHRoaW5rIHRoZXJlIHNob3VsZCBiZSBhbiBlbXB0eSBsaW5lIGhlcmUg
dG8KYXZvaWQgdGhlIGhlbHAgdGV4dCBiZWluZyBzbXVzaGVkIHRvZ2V0aGVyIHdpdGggdGhlIFN5
bWJvbCBTZWN0aW9uLiBJCmRpZCBub3QgZmluZCBhbnl0aGluZyByZWdhcmRpbmcgdGhpcyBpbiB0
aGUgc3R5bGVndWlkZSBob3dldmVyLCBzbyBJCm1pZ2h0IGJlIG1pc3Rha2VuLgoKPiArZW5kaWYg
IyBCUjJfUEFDS0FHRV9MSUJHUElPRDJfVE9PTFMKPiArCj4gK2VuZGlmICMgQlIyX1BBQ0tBR0Vf
TElCR1BJT0QyCj4gIAo+ICBjb21tZW50ICJsaWJncGlvZDIgbmVlZHMga2VybmVsIGhlYWRlcnMg
Pj0gNS4xMCIKPiAgCWRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF81
XzEwCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZ3Bpb2QyL2xpYmdwaW9kMi5tayBiL3BhY2th
Z2UvbGliZ3Bpb2QyL2xpYmdwaW9kMi5tawo+IGluZGV4IGM1YjUzZjYzMWIuLjYyZDYxNzM0MTgg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJncGlvZDIvbGliZ3Bpb2QyLm1rCj4gKysrIGIvcGFj
a2FnZS9saWJncGlvZDIvbGliZ3Bpb2QyLm1rCj4gQEAgLTI0LDYgKzI0LDEzIEBAIGVsc2UKPiAg
TElCR1BJT0QyX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtdG9vbHMKPiAgZW5kaWYKPiAgCj4gK2lm
ZXEgKCQoQlIyX1BBQ0tBR0VfTElCR1BJT0QyX0dQSU9TRVRfSU5URVJBQ1RJVkUpLHkpCj4gK0xJ
QkdQSU9EMl9ERVBFTkRFTkNJRVMgKz0gbGliZWRpdAo+ICtMSUJHUElPRDJfQ09ORl9PUFRTICs9
IC0tZW5hYmxlLWdwaW9zZXQtaW50ZXJhY3RpdmUKPiArZWxzZQo+ICtMSUJHUElPRDJfQ09ORl9P
UFRTICs9IC0tZGlzYWJsZS1ncGlvc2V0LWludGVyYWN0aXZlCj4gK2VuZGlmCj4gKwo+ICBpZmVx
ICgkKEJSMl9JTlNUQUxMX0xJQlNURENQUCkseSkKPiAgTElCR1BJT0QyX0NPTkZfT1BUUyArPSAt
LWVuYWJsZS1iaW5kaW5ncy1jeHgKPiAgZWxzZQo+IC0tIAo+IDIuNTIuMAo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxp
bmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpLaW5kIHJlZ2FyZHMsCkLDtnJnZQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
