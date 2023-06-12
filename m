Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD039C88CB4
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 17:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A95F418AA;
	Mon, 12 Jun 2023 17:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A95F418AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alCE3ESiqfb7; Mon, 12 Jun 2023 17:08:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40362415DC;
	Mon, 12 Jun 2023 17:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40362415DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2703E1BF306
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 17:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3E0A60ACC
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 17:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E0A60ACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3rwzjulhDa6t for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 17:08:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F6886068B
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F6886068B
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 17:08:32 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1b3c0c476d1so13886905ad.1
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 10:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686589711; x=1689181711;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:reply-to:subject:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Axngv4L+rCBqDKgql346fQpTH1rPasehzH12ZMuCl68=;
 b=WM71OxSEt85gn3fJ9Dz7B8gmcX3j78/qA0ajnc5AMbffifWEAp1E3LimBUSVEEFnER
 du8X+hM5KJATL+X4dx+Piu9zvZNNNcrXsLhYdKUJhAn3avWjI0cAkaCTczhH601Li/Pn
 KlMUSQenFbxDM1jCIzDz7znWbwF4p2m5E37+iS1ktsxabpbhRLvQtX7pJBoNiAv9VYrF
 BWG5rVNz7Znx8oUJzOch3+r8yu66Y7Pcnh3Vw4r/he7ztBix9JW7YRX69s/VXhRZFR03
 z89giw+iR/yv+XKii+MAPai223X5W6xJa0Srzmk7XGcnr16C4iO8MeEOca8EE7+PCz5I
 bjGA==
X-Gm-Message-State: AC+VfDy5rMyvthzxzGpGfP0nUkdt/i9w9E9oP2F5NCBHdxcXM8JeSz0x
 V6ZVMsJ1tGQWlx/U3t/vl7tZ0YXPVbX0VpA3VAfXiw==
X-Google-Smtp-Source: ACHHUZ6xT3VXgJVNkxjaEhiBw5QfNWyTiwNJ/OpWTtkOZ5v8FY+p13YyXILt5bEZ5pJWcbEsbDTH+g==
X-Received: by 2002:a17:903:18e:b0:1b0:295b:f192 with SMTP id
 z14-20020a170903018e00b001b0295bf192mr7487700plg.3.1686589710790; 
 Mon, 12 Jun 2023 10:08:30 -0700 (PDT)
Received: from [10.10.10.151] ([75.164.37.163])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a170903229000b001ab2592ed33sm8497134plh.171.2023.06.12.10.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 10:08:30 -0700 (PDT)
X-Google-Original-From: Kris Bahnsen <kris@embeddedTS.com>
Message-ID: <6232f4834ed55784e63a925e478b09fbab57b5cc.camel@embeddedTS.com>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 10:08:29 -0700
In-Reply-To: <bae326459a62944709e8a46f12cc410bd3f80db1.camel@embeddedTS.com>
References: <20230511173451.2293054-1-kris@embeddedTS.com>
 <bae326459a62944709e8a46f12cc410bd3f80db1.camel@embeddedTS.com>
Organization: embeddedTS
User-Agent: Evolution 3.38.3-1+deb11u2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embeddedts.com; s=google; t=1686589711; x=1689181711;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:reply-to:subject:message-id:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Axngv4L+rCBqDKgql346fQpTH1rPasehzH12ZMuCl68=;
 b=DciWoTcPpgQ88k8625vN6YADIFJiwH2btwb8Yhb6+rZeSx3D8WXKz6SOc9tVi84H2/
 NJyy8RcDQ4NtNnDMOKaWPnKGS9vtr0hFJ0w10jV0piCsazMW5iBryG6iCBTenBVitnYF
 XROBJmzw4a9e9sQf7BvSUQGhkdNaAZnqx0xtY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=embeddedts.com header.i=@embeddedts.com
 header.a=rsa-sha256 header.s=google header.b=DciWoTcP
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: add QCA9377 BT
 firmware
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: kris@embeddedTS.com
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Mark Featherston <mark@embeddedts.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAyMDIzLTA1LTI2IGF0IDE2OjI5IC0wNzAwLCBLcmlzIEJhaG5zZW4gd3JvdGU6Ck9u
IFRodSwgMjAyMy0wNS0xMSBhdCAxMDozNCAtMDcwMCwgS3JpcyBCYWhuc2VuIHZpYSBidWlsZHJv
b3Qgd3JvdGU6CkRlcGxveSBmaXJtd2FyZSBmaWxlcyBhcyB3ZWxsLgoKU2lnbmVkLW9mZi1ieTog
S3JpcyBCYWhuc2VuIDxrcmlzQGVtYmVkZGVkVFMuY29tPgoKRm9sbG93aW5nIHVwIHdpdGggdGhp
cyBwYXRjaCB0byBzZWUgaWYgaWYgdGhlcmUgYXJlIGFueSBvdXRzdGFuZGluZwpxdWVzdGlvbnMK
b3IgY29uY2VybnMgYW5kIGlmIHRoZXJlIGlzIGEgdGltZWxpbmUgb24gZ2V0dGluZyB0aGlzIG1l
cmdlZCBpbi4KVGhhbmtzLgoKLUtyaXMKCkl0J3MgYmVlbiBhYm91dCBhIG1vbnRoIHNpbmNlIHRo
ZSBvcmlnaW5hbCBwYXRjaCB3YXMgc3VibWl0dGVkLiBJZgp0aGVyZSBhcmUgYW55IGlzc3VlcyB3
aXRoIHRoZSBwYXRjaCBJJ2QgbG92ZSBzb21lIGZlZWRiYWNrLiBPdGhlcndpc2UsCkkgd291bGQg
bGlrZSB0byBrbm93IGlmIHRoZXJlIGlzIGEgdGltZWxpbmUgb24gZ2V0dGluZyB0aGlzIG1lcmdl
ZCBpbgphcyB3ZSBhcmUgc3RhbGxlZCB3YWl0aW5nIG9uIHN1cHBvcnQgZm9yIGl0LiBUaGFua3Mu
CgotS3JpcwoKCj4gLS0tCj4gwqBwYWNrYWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbsKgwqDC
oMKgwqDCoMKgwqAgfCA1ICsrKysrCj4gwqBwYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZp
cm13YXJlLm1rIHwgNiArKysrKysKPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbiBiL3Bh
Y2thZ2UvbGludXgtCj4gZmlybXdhcmUvQ29uZmlnLmluCj4gaW5kZXggNGI0MTVhN2RhMi4uNGNh
YjZlNzkzOSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbgo+
ICsrKyBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvQ29uZmlnLmluCj4gQEAgLTY5LDYgKzY5LDEx
IEBAIGNvbmZpZwo+IEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX1FVQUxDT01NXzYxNzRBX0JU
Cj4gwqDCoMKgwqDCoMKgwqDCoGhlbHAKPiDCoMKgwqDCoMKgwqDCoMKgwqAgRmlybXdhcmUgZmls
ZXMgZm9yIFFDQSBSb21lIDYxNzRBIGJsdWV0b290aCBzdXBwb3J0Lgo+IMKgCj4gK2NvbmZpZyBC
UjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9RVUFMQ09NTV85Mzc3X0JUCj4gK8KgwqDCoMKgwqDC
oMKgYm9vbCAiUXVhbGNvbW0gQXRoZXJvcyBRQ0E5Mzc3IEJsdWV0b290aCIKPiArwqDCoMKgwqDC
oMKgwqBoZWxwCj4gK8KgwqDCoMKgwqDCoMKgwqAgRmlybXdhcmUgZmlsZXMgZm9yIFFDQTkzNzcg
Ymx1ZXRvb3RoIHN1cHBvcnQuCj4gKwo+IMKgY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1X
QVJFX0FSMzAxMQo+IMKgwqDCoMKgwqDCoMKgwqBib29sICJRdWFsY29tbSBBdGhlcm9zIDMwMTEi
Cj4gwqDCoMKgwqDCoMKgwqDCoGhlbHAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC1maXJt
d2FyZS9saW51eC1maXJtd2FyZS5tawo+IGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZS5tawo+IGluZGV4IDlkOWQxMmJkNWYuLjk2NzJjN2EwN2YgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tawo+ICsrKyBiL3BhY2thZ2Uv
bGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsKPiBAQCAtNjUsNiArNjUsMTIgQEAgTElO
VVhfRklSTVdBUkVfRklMRVMgKz0KPiBxY2EvcmFtcGF0Y2hfdXNiXzAwMDAwMzAyLmJpbiBxY2Ev
bnZtX3VzYl8wMDAwMDMwMi5iaW4KPiDCoExJTlVYX0ZJUk1XQVJFX0FMTF9MSUNFTlNFX0ZJTEVT
ICs9IExJQ0VOU0UucWNvbQo+IMKgZW5kaWYKPiDCoAo+ICsjIFF1YWxjb21tIEF0aGVyb3MgUUNB
OTM3NyBCbHVldG9vdGgKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9RVUFM
Q09NTV85Mzc3X0JUKSx5KQo+ICtMSU5VWF9GSVJNV0FSRV9GSUxFUyArPSBxY2EvcmFtcGF0Y2hf
MDAyMzAzMDIuYmluCj4gcWNhL252bV8wMDIzMDMwMi5iaW4KPiArTElOVVhfRklSTVdBUkVfQUxM
X0xJQ0VOU0VfRklMRVMgKz0gTElDRU5TRS5xY29tCj4gK2VuZGlmCj4gKwo+IMKgIyBSZWFsdGVr
IDg3eHggQmx1ZXRvb3RoCj4gwqBpZmVxICgkKEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX1JU
TF84N1hYX0JUKSx5KQo+IMKgTElOVVhfRklSTVdBUkVfRklMRVMgKz0gXAoKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
