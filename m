Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9422CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 23:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B706844DB;
	Tue, 29 Mar 2022 23:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qRgM4G5Dyi6M; Tue, 29 Mar 2022 23:19:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33D67842F6;
	Tue, 29 Mar 2022 23:19:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8E2C1BF954
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 23:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C50AC40184
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 23:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGQkkwbyxhig for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 23:19:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F67840183
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 23:19:35 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id gb19so18957764pjb.1
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 16:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=iKZrWMq3ipW3mFJddRrDn3CdsKM3m9sVm3832URuBAI=;
 b=InLoKXfK6dyDZ78018SN56NpJ3hu3Ku4v2sZ8npMDag46P6PnjQT67DTEpMkud3hkj
 TJRsXD2kVlL9bzqV+QJSUbvBwEgHqKzAS8WGeXdfls8GWjoqW0FchvSt3cl5b+FFVz+A
 pbe5vDJBPCAyeHo62rt3wfdVMAQ2GEn5TaxOmVem90tXTy9GtWBZZT9Arng/lGZXyzqA
 TKdbGH8ZWxa78vQB61OXXwbEJ1/SZBkZ7dbhNUYpmnrkaAbz1wGDKn1J0SCoY1SdSwYR
 Er6LV/G0Qp0OnNGv0bWu/J+vuSxbrBrwjOYDiMHCWXFNkRJDEo0WTzLt+3MjjG7jVgqj
 m5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=iKZrWMq3ipW3mFJddRrDn3CdsKM3m9sVm3832URuBAI=;
 b=KYv0N9tZUoGSvqaXDYxf2oQgXpLfdP27q97JD2dzmvh+STkKICGpo5bpqIsEjM6exG
 4YnBlE6vrpsOzewv+k0SRUSR9c1stx3nCjJBTW1mALN28USooA5Vd0SPOys98WoFBsRX
 VWCnau1ARjzHkTF6resGjG2soZ+8KBscohS6hnq8CwHfwqq/4otTlnrYVucp+x8mLfXp
 A/WFgQMKTFNcVhGooOJJJ+hckGzEwjDKYvNhPD4DUHVY1b7Hc3ByKDxNtzQoFMK5z+dA
 pA6I6t7kt5t3XxXweGkC+rsrlPCzlZKOeqPYaZpeIOJBzQMtzC1QS22nlXLjA3VK6d72
 SpUQ==
X-Gm-Message-State: AOAM531mEFwhZYnd5lGK7LjcchI6PPPxpTmkTB8O88ZqfvGnJAvYN6FU
 MBYlZEo64/QCfDJlezzLhoq+2Q3Kn4RT8w==
X-Google-Smtp-Source: ABdhPJxYOYzIHdG3ZZJ0IbBO6ewzldc8KOgTf4Fz9f04aMABAJ7K+4MxcMNesVfFxoDvgDj7/vTsng==
X-Received: by 2002:a17:902:bd95:b0:14f:40ab:270e with SMTP id
 q21-20020a170902bd9500b0014f40ab270emr32045018pls.101.1648595975032; 
 Tue, 29 Mar 2022 16:19:35 -0700 (PDT)
Received: from smtpclient.apple ([2806:1000:8003:5c6c:6c2f:312d:b304:bc56])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm20610764pfu.56.2022.03.29.16.19.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Mar 2022 16:19:34 -0700 (PDT)
From: Alsey Miller <alseycmiller@gmail.com>
X-Google-Original-From: Alsey Miller <Alseycmiller@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
In-Reply-To: <CADvTj4rQnote1-uhWj6SEuddjFoEt2sPmcAnvR=_1ugrtve81A@mail.gmail.com>
Date: Tue, 29 Mar 2022 16:19:33 -0700
Message-Id: <057A8C3C-8DAC-46A3-86AB-2DAA92A9368B@gmail.com>
References: <20220329185059.943889-1-alseycmiller@gmail.com>
 <A770A102-397D-4194-B7CA-FA413C944812@gmail.com>
 <CADvTj4oQxty5MOVPmjXcQXOGXgdFn=LAF4WsgC8Ntf8Q6h-wng@mail.gmail.com>
 <6DD9DC86-9DF3-4CF8-9D7E-92F238643AA6@gmail.com>
 <CADvTj4rQnote1-uhWj6SEuddjFoEt2sPmcAnvR=_1ugrtve81A@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
Subject: Re: [Buildroot] [PATCH 1/4] package/pkg-cmake: allow overriding
 toolchain
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SeKAmXZlIHN1Ym1pdHRlZCBhIG5ldyBzZXJpZXMgb2YgcGF0Y2hlcyB0aGF0IEnigJl2ZSB0ZXN0
ZWQgd2l0aCB5b3VyIHBhdGNoLiBTbyB0aGUgYExJQkRJU1BBVENIX1NVUFBPUlRTX0NNQUtFX1RP
T0xDSEFJTmAgbGluZSBpcyByZW1vdmUgYW5kIGFsbCBgcGtnLWNtYWtlYCBjaGFuZ2VzLgoKPiBP
biBNYXIgMjksIDIwMjIsIGF0IDE6MTAgUE0sIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFy
ZDFAZ21haWwuY29tPiB3cm90ZToKPiAKPiBPbiBUdWUsIE1hciAyOSwgMjAyMiBhdCAxOjU4IFBN
IEFsc2V5IE1pbGxlciA8YWxzZXljbWlsbGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IAo+PiBUaGF0
IGNvbW1pdCBpcyBub3QgbWVyZ2VkIGFuZCBvbmx5IHNlZW1zIHRvIG92ZXJyaWRlIHRoZSBDIGZs
YWdzLiBIb3cgY2FuIHdlIGZvcmNlIGNtYWtlIHRvIHVzZSBDbGFuZyBmb3IgdGFyZ2V0IHBhY2th
Z2VzPyBJIHdvdWxkIGJlIGZpbmUgd2l0aCBiYXNpbmcgbXkgd29yayB0aGF0IHBhdGNoIGlmIHN1
cHBvcnQgZm9yIHVzaW5nIENsYW5nIGFuZCBhcyB0aGUgQyBhbmQgQysrIGNvbXBpbGVyIGlzIGFk
ZGVkLgo+IAo+IEl0IHNob3VsZCBhbGxvdyBvdmVycmlkaW5nIGFueSBvZiB0aGUgdG9vbGNoYWlu
IHZhcmlhYmxlcyBsaWtlIHRoaXM6Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9q
ZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDMyMjIzMjIyNC4yODQyMjY2LTYtamFtZXMuaGlsbGlh
cmQxQGdtYWlsLmNvbS8KPiAKPiBJIHRoaW5rIHRoaXMgd2lsbCBwcmV0dHkgbXVjaCB3b3JrIGFz
IGlzIHdpdGggeW91ciBsaWJkaXNwYXRjaCBwYXRjaDoKPiBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwMzI5MTg1MDU5Ljk0Mzg4OS0yLWFs
c2V5Y21pbGxlckBnbWFpbC5jb20vCj4gCj4gSXQgc2hvdWxkIGFsbG93IHlvdSB0byBkcm9wIHRo
aXMgcGFydDoKPiBMSUJESVNQQVRDSF9TVVBQT1JUU19DTUFLRV9UT09MQ0hBSU4gPSBOTwo+IAo+
IFlvdSBtaWdodCBhbHNvIGJlIGFibGUgdG8gZHJvcCBzb21lIG9mIHRoZSBvdGhlciBjb25mIG9w
dHMgc2luY2UgdGhlIHRvb2xjaGFpbgo+IGZpbGUgY2FuIHRoZW4gc3RpbGwgYmUgdXNlZCB3aXRo
IHBhcnRpYWwgb3ZlcnJpZGVzLgo+IAo+PiAKPj4+IE9uIE1hciAyOSwgMjAyMiwgYXQgMTI6MjYg
UE0sIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPj4+
IAo+Pj4gT24gVHVlLCBNYXIgMjksIDIwMjIgYXQgMToxOCBQTSBBbHNleSBNaWxsZXIgPGFsc2V5
Y21pbGxlckBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+IAo+Pj4+IFRoaXMgY2hhbmdlIGlzIG5lY2Vz
c2FyeSBiZWNhdXNlIGlmIHlvdSBzcGVjaWZ5IHRoZSB0b29sY2hhaW4gaXQgd2lsbCBhbHdheXMg
dXNlIHRoZSBHQ0MgdG9vbGNoYWluIGFuZCBDIGZsYWdzIGluc3RlYWQgb2YgdGhlIENsYW5nIGNy
b3NzIGNvbXBpbGVyICBhbmQgY3VzdG9tIEMgZmxhZ3MuIFRoaXMgaXMgbm90IGFuIGlzc3VlIGZv
ciBob3N0IHBhY2thZ2VzLCBvbmx5IGZvciB0YXJnZXQuCj4+PiAKPj4+IEkgdGhpbmsgdGhpcyBp
cyBwcm9iYWJseSBhIGJldHRlciB3YXkgb2YgZGVhbGluZyB3aXRoIHRoZSBpc3N1ZToKPj4+IGh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjAz
MjIyMzIyMjQuMjg0MjI2Ni01LWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vCj4+PiAKPj4+PiAK
Pj4+Pj4gT24gTWFyIDI5LCAyMDIyLCBhdCAxMTo1MCBBTSwgQWxzZXkgQ29sZW1hbiBNaWxsZXIg
PGFsc2V5Y21pbGxlckBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+PiAKPj4+Pj4gU2lnbmVkLW9mZi1i
eTogQWxzZXkgQ29sZW1hbiBNaWxsZXIgPGFsc2V5Y21pbGxlckBnbWFpbC5jb20+Cj4+Pj4+IC0t
LQo+Pj4+PiBwYWNrYWdlL3BrZy1jbWFrZS5tayB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysr
Ky0KPj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pj4+Pj4gCj4+Pj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1jbWFrZS5tayBiL3BhY2thZ2Uv
cGtnLWNtYWtlLm1rCj4+Pj4+IGluZGV4IDNiMWRiMzVmYjYuLjliMzZlZTJiNDcgMTAwNjQ0Cj4+
Pj4+IC0tLSBhL3BhY2thZ2UvcGtnLWNtYWtlLm1rCj4+Pj4+ICsrKyBiL3BhY2thZ2UvcGtnLWNt
YWtlLm1rCj4+Pj4+IEBAIC01Nyw3ICs1Nyw3IEBAICQoMilfSU5TVEFMTF9TVEFHSU5HX09QVFMg
ICA/PSBERVNURElSPSQkKFNUQUdJTkdfRElSKSBpbnN0YWxsL2Zhc3QKPj4+Pj4gJCgyKV9JTlNU
QUxMX1RBUkdFVF9PUFRTICAgICAgPz0gREVTVERJUj0kJChUQVJHRVRfRElSKSBpbnN0YWxsL2Zh
c3QKPj4+Pj4gCj4+Pj4+ICQoMylfU1VQUE9SVFNfSU5fU09VUkNFX0JVSUxEID89IFlFUwo+Pj4+
PiAtCj4+Pj4+ICskKDMpX1NVUFBPUlRTX0NNQUtFX1RPT0xDSEFJTiA/PSBZRVMKPj4+Pj4gCj4+
Pj4+IGlmZXEgKCQkKCQoMylfU1VQUE9SVFNfSU5fU09VUkNFX0JVSUxEKSxZRVMpCj4+Pj4+ICQo
MilfQlVJTERESVIgICAgICAgICAgICAgICAgID0gJCQoJCgyKV9TUkNESVIpCj4+Pj4+IEBAIC04
Miw2ICs4Miw3IEBAIGlmZXEgKCQoNCksdGFyZ2V0KQo+Pj4+PiAjICAgZG9jdW1lbnRlZCBhcyBh
IHN0YW5kYXJkIENNYWtlIHZhcmlhYmxlLiBJZiBhIHBhY2thZ2Ugc3VwcG9ydHMgaXQsCj4+Pj4+
ICMgICBpdCBtdXN0IGhhbmRsZSBpdCBleHBsaWNpdGx5Lgo+Pj4+PiAjCj4+Pj4+ICtpZmVxICgk
KDMpX1NVUFBPUlRTX0NNQUtFX1RPT0xDSEFJTiksWUVTKQo+Pj4+PiBkZWZpbmUgJCgyKV9DT05G
SUdVUkVfQ01EUwo+Pj4+PiAgICAgKG1rZGlyIC1wICQkKCQkKFBLRylfQlVJTERESVIpICYmIFwK
Pj4+Pj4gICAgIGNkICQkKCQkKFBLRylfQlVJTERESVIpICYmIFwKPj4+Pj4gQEAgLTEwNCw2ICsx
MDUsMjggQEAgZGVmaW5lICQoMilfQ09ORklHVVJFX0NNRFMKPj4+Pj4gICAgICkKPj4+Pj4gZW5k
ZWYKPj4+Pj4gZWxzZQo+Pj4+PiArZGVmaW5lICQoMilfQ09ORklHVVJFX0NNRFMKPj4+Pj4gKyAg
ICAgKG1rZGlyIC1wICQkKCQkKFBLRylfQlVJTERESVIpICYmIFwKPj4+Pj4gKyAgICAgY2QgJCQo
JCQoUEtHKV9CVUlMRERJUikgJiYgXAo+Pj4+PiArICAgICBybSAtZiBDTWFrZUNhY2hlLnR4dCAm
JiBcCj4+Pj4+ICsgICAgIFBBVEg9JCQoQlJfUEFUSCkgXAo+Pj4+PiArICAgICAkJCgkJChQS0cp
X0NPTkZfRU5WKSAkJChCUjJfQ01BS0UpICQkKCQkKFBLRylfU1JDRElSKSBcCj4+Pj4+ICsgICAg
ICAgICAgICAgLURDTUFLRV9JTlNUQUxMX1BSRUZJWD0iL3VzciIgXAo+Pj4+PiArICAgICAgICAg
ICAgIC1EQ01BS0VfQ09MT1JfTUFLRUZJTEU9T0ZGIFwKPj4+Pj4gKyAgICAgICAgICAgICAtREJV
SUxEX0RPQz1PRkYgXAo+Pj4+PiArICAgICAgICAgICAgIC1EQlVJTERfRE9DUz1PRkYgXAo+Pj4+
PiArICAgICAgICAgICAgIC1EQlVJTERfRVhBTVBMRT1PRkYgXAo+Pj4+PiArICAgICAgICAgICAg
IC1EQlVJTERfRVhBTVBMRVM9T0ZGIFwKPj4+Pj4gKyAgICAgICAgICAgICAtREJVSUxEX1RFU1Q9
T0ZGIFwKPj4+Pj4gKyAgICAgICAgICAgICAtREJVSUxEX1RFU1RTPU9GRiBcCj4+Pj4+ICsgICAg
ICAgICAgICAgLURCVUlMRF9URVNUSU5HPU9GRiBcCj4+Pj4+ICsgICAgICAgICAgICAgLURCVUlM
RF9TSEFSRURfTElCUz0kJChpZiAkJChCUjJfU1RBVElDX0xJQlMpLE9GRixPTikgXAo+Pj4+PiAr
ICAgICAgICAgICAgICQkKENNQUtFX1FVSUVUKSBcCj4+Pj4+ICsgICAgICAgICAgICAgJCQoJCQo
UEtHKV9DT05GX09QVFMpIFwKPj4+Pj4gKyAgICAgKQo+Pj4+PiArZW5kZWYKPj4+Pj4gK2VuZGlm
Cj4+Pj4+ICtlbHNlCj4+Pj4+IAo+Pj4+PiAjIENvbmZpZ3VyZSBwYWNrYWdlIGZvciBob3N0Cj4+
Pj4+IGRlZmluZSAkKDIpX0NPTkZJR1VSRV9DTURTCj4+Pj4+IC0tCj4+Pj4+IDIuMzUuMQo+Pj4+
PiAKPj4+PiAKPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+Pj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4+PiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+Pj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo+PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
