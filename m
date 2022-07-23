Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D176DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 22:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 600FA41682;
	Sat, 23 Jul 2022 22:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 600FA41682
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWlFUpLIx_sX; Sat, 23 Jul 2022 22:13:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCE5D41560;
	Sat, 23 Jul 2022 22:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCE5D41560
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D01C11BF3AD
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 22:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A99AC4151E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 22:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A99AC4151E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TXiW7nl8PqDV for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 22:13:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6A9F410E0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6A9F410E0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:13:26 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u5so10993589wrm.4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GcY5L4cz3nAjDghOEuj4Jph2OcFiHJZC/8gZQEr7DII=;
 b=xn7+gKeRzATNlHchvka3hWgnJPLXW83emsnpJvXak9uEipVqRkJSNQiQLO2fF+48yQ
 gP4dpJhbmYFdFeWi1OhbfXjGd3qm0jUZ2Pr8rcZ13Rh+8yZ2z2ee77upeEGs414D1QuC
 FEefNYzAwnAycxF4IWS4VWBMbh3BmwFIgZri0OyliMR7PNAKu6qXoxmy7pmwNi2qz0UH
 AT6prdIhOR9zourBxIsEPwV6OkASs7rGX/xOLyboePmrnKLpV+aTd2EhHRS4J5+laFst
 nq6Pe9gsHLYXog17HNKK5fatH/GND2qq8Vk13YTc1NAlWze7XDrVg85gbVNVXqpieWlz
 yATQ==
X-Gm-Message-State: AJIora+txrjewUJckmkfdqOnesh+TxEfQssZKdAsD/xdEeI0MCN8wQea
 d1YJhNs3bYOV6wyKJU/uLLnkIg==
X-Google-Smtp-Source: AGRyM1u1tkVj+JdQFiqERf6b2j5G/7usGPIq8AmK9XFpgRqKI2yoSt/eNkYOwmXmrGHK0OVezP27kw==
X-Received: by 2002:a5d:5747:0:b0:21d:65e9:be07 with SMTP id
 q7-20020a5d5747000000b0021d65e9be07mr3607120wrw.215.1658614404721; 
 Sat, 23 Jul 2022 15:13:24 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a5d448d000000b002167efdd549sm7833393wrq.38.2022.07.23.15.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 15:13:24 -0700 (PDT)
Message-ID: <2ed8752c-4b59-1588-c182-f38306cef014@mind.be>
Date: Sun, 24 Jul 2022 00:13:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: TIAN Yuanhao <tianyuanhao3@163.com>, Christian Stewart <christian@paral.in>
References: <20220517103608.3455749-1-christian@paral.in>
 <4b7583c4-5d03-60bc-4b42-4b2f18177a78@mind.be>
 <20220518202129.GX1597494@scaer>
 <80e2a4c8-4c41-b9b7-25e3-a075b573f7f6@163.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <80e2a4c8-4c41-b9b7-25e3-a075b573f7f6@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GcY5L4cz3nAjDghOEuj4Jph2OcFiHJZC/8gZQEr7DII=;
 b=V+VpI0E9xdyJoLoOTZIX6qLuYsaoSvjBA6CRqwBenk/2+BpGJ/PNzmXW11SV8BmDUj
 t1ZfQoJXFa4p82QBwkAQnHTR8HrsKBlEAw8OMSq+7c6cDtUbsPGC0g+YzjAi2rtNDaHq
 MeuTZNSuemVNF6pDJtMQCLkMu/45oIaK9yUEmn8wahvBqEDr5rB+El++1g0E6uakboJd
 p+Chns41Mac16cnJntC1vYqMafhvcv5a5YY5JhrsIstoUYx/cj20R1koyUle1UtIWpxo
 BviLCRuvjBrfTLtGwJ0QiHbzmMgbHRXwvreYMgSKge00aepkoysOdV5rQQcP2PQTZK8x
 hTkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=V+VpI0E9
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pkg-utils: prevent
 kconfig_enable_opt from changing =m to =y
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMy8wNS8yMDIyIDEzOjUzLCBUSUFOIFl1YW5oYW8gd3JvdGU6Cj4gQWxsLAo+IAo+IE9u
IDUvMTgvMjIgMTM6MjEsIFlhbm4gRS4gTU9SSU4gd3JvdGU6Cj4+IENocmlzdGlhbiwgQXJub3V0
LCBBbGwsCj4+Cj4+IE9uIDIwMjItMDUtMTggMjA6MDEgKzAyMDAsIEFybm91dCBWYW5kZWNhcHBl
bGxlIHNwYWtlIHRodXNseToKPj4+IE9uIDE3LzA1LzIwMjIgMTI6MzYsIENocmlzdGlhbiBTdGV3
YXJ0IHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+Pj4gVGhpcyBwYXRjaCBjaGFuZ2VzIEtDT05GSUdf
TVVOR0VfRE9UX0NPTkZJRyB0byBwcmV2ZW50IGNoYW5naW5nIGA9bWAgdG8gYD15YC4KPj4+IMKg
IEdvb2QgY2F0Y2ghCj4+PiDCoCBQYXRjaCBpcyBhIGJpdCBvdmVyLWNvbXBsaWNhdGVkLCBidXQg
SSBkb24ndCBrbm93IGhvdyB0byBkbyBiZXR0ZXIuCj4+IFstLVNOSVAtLV0KPj4+PiBAQCAtMjEs
OCArMjEsMTQgQEAgS0NPTkZJR19ET1RfQ09ORklHID0gJChzdHJpcCBcCj4+Pj4gwqAgKQo+Pj4+
IMKgICMgS0NPTkZJR19NVU5HRV9ET1RfQ09ORklHIChvcHRpb24sIG5ld2xpbmUgWywgZmlsZV0p
Cj4+Pj4gKyMgSWYgc2V0dGluZyB0byA9eSBhbmQgdGhlIG9wdGlvbiBpcyBhbHJlYWR5IHNldCB0
byA9bSwgaWdub3JlLgo+Pj4+IMKgIGRlZmluZSBLQ09ORklHX01VTkdFX0RPVF9DT05GSUcKPj4+
PiAtwqDCoMKgICQoU0VEKSAiL1xcPCQoc3RyaXAgJCgxKSlcXD4vZCIgJChjYWxsIEtDT05GSUdf
RE9UX0NPTkZJRywkKDMpKQo+Pj4+ICvCoMKgwqAgaWYgW1sgIiQobGFzdHdvcmQgJChzdWJzdCA9
LCAsJChzdHJpcCAkKDIpKSkpIiA9PSAieSIgXV07IHRoZW4gXAo+Pj4gwqAgVGhpcyBwYXJ0IHdl
IGNvdWxkIGF2b2lkIGJ5IGFkZGluZyBhIDR0aCBvcHRpb24gYW5kIHNldHRpbmcgaXQgb25seSBv
bgo+Pj4gS0NPTkZJR19FTkFCTEVfT1BULgo+Pj4KPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgZ3Jl
cCAtcSAiJChzdHJpcCAkKDEpKT1tIiAkKGNhbGwgS0NPTkZJR19ET1RfQ09ORklHLCQoMykpOyB0
aGVuIFwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBleGl0IDA7IFwKPj4+IMKgIFRoaXMg
aXMgYSBraW5kIG9mIGhhcmQtdG8tZm9sbG93IGNvbnRyb2wgc3RydWN0dXJlIC0gYmV0dGVyIHR1
cm4gYXJvdW5kIHRoZQo+Pj4gY29uZGl0aW9uIGFuZCBkbyB0aGUgcmVwbGFjZW1lbnQgaW5zaWRl
IGl0LiBTbywgY29tYmluZWQgd2l0aCB0aGUgYWJvdmU6Cj4+Pgo+Pj4gwqDCoMKgwqBpZiAkKGlm
ICQoNCksZ3JlcCAtcSAuLi4sdHJ1ZSk7IHRoZW4gXAo+Pj4gwqDCoMKgwqDCoMKgwqAgc2VkIC4u
LjsgXAo+Pj4gwqDCoMKgwqDCoMKgwqAgZWNobyAuLi47IFwKPj4+IMKgwqDCoMKgZmkKPj4gQWN0
dWFsbHksIEkgdGhpbmsgdGhlIGNoZWNrIHNob3VsZCBub3QgYmUgaW4gS0NPTkZJR19NVU5HRV9E
T1RfQ09ORklHLAo+PiBhcyBpdCByZWFsbHkgYmVsb25ncyB0byBLQ09ORklHX0VOQUJMRV9PUFQu
Cj4+Cj4+IE1heWJlIHNvbWV0aGluZyBsaWtlOgo+Pgo+PiDCoMKgwqDCoCBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9wa2ctdXRpbHMubWsgYi9wYWNrYWdlL3BrZy11dGlscy5tawo+PiDCoMKgwqDCoCBp
bmRleCA3ZDFhZWE3NzEwLi41NmNkNzJhOWE5IDEwMDY0NAo+PiDCoMKgwqDCoCAtLS0gYS9wYWNr
YWdlL3BrZy11dGlscy5tawo+PiDCoMKgwqDCoCArKysgYi9wYWNrYWdlL3BrZy11dGlscy5tawo+
PiDCoMKgwqDCoCBAQCAtMjIsMTIgKzIyLDE2IEBAIEtDT05GSUdfRE9UX0NPTkZJRyA9ICQoc3Ry
aXAgXAo+PiDCoMKgwqDCoMKgICMgS0NPTkZJR19NVU5HRV9ET1RfQ09ORklHIChvcHRpb24sIG5l
d2xpbmUgWywgZmlsZV0pCj4+IMKgwqDCoMKgwqAgZGVmaW5lIEtDT05GSUdfTVVOR0VfRE9UX0NP
TkZJRwo+PiDCoMKgwqDCoCAtwqDCoMKgICQoU0VEKSAiL1xcPCQoc3RyaXAgJCgxKSlcXD4vZCIg
JChjYWxsIEtDT05GSUdfRE9UX0NPTkZJRywkKDMpKQo+PiDCoMKgwqDCoCArwqDCoMKgICQoU0VE
KSAiL1xcPCQoc3RyaXAgJCgxKSlcXD4vZCIgJChjYWxsIEtDT05GSUdfRE9UX0NPTkZJRywkKDMp
KSAmJiBcCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBlY2hvICckKHN0cmlwICQoMikpJyA+PiAkKGNh
bGwgS0NPTkZJR19ET1RfQ09ORklHLCQoMykpCj4+IMKgwqDCoMKgwqAgZW5kZWYKPj4gwqDCoMKg
wqDCoCAjIEtDT05GSUdfRU5BQkxFX09QVCAob3B0aW9uIFssIGZpbGVdKQo+PiDCoMKgwqDCoCAt
S0NPTkZJR19FTkFCTEVfT1BUwqAgPSAkKGNhbGwgS0NPTkZJR19NVU5HRV9ET1RfQ09ORklHLCAk
KDEpLCAkKDEpPXksICQoMikpCj4+IMKgwqDCoMKgICtkZWZpbmUgS0NPTkZJR19FTkFCTEVfT1BU
Cj4+IMKgwqDCoMKgICvCoMKgwqAgaWYgISBncmVwIC1xIC1FICdeJCgxKT0nICQoY2FsbCBLQ09O
RklHX0RPVF9DT05GSUcsJCgyKSk7IHRoZW4gXAo+PiDCoMKgwqDCoCArwqDCoMKgwqDCoMKgwqAg
JChjYWxsIEtDT05GSUdfTVVOR0VfRE9UX0NPTkZJRywgJCgxKSwgJCgxKT15LCAkKDIpKSB8fCBl
eGl0IDE7IFwKPj4gwqDCoMKgwqAgK8KgwqDCoCBmaQo+PiDCoMKgwqDCoCArZW5kaWYKPj4gwqDC
oMKgwqDCoCAjIEtDT05GSUdfU0VUX09QVCAob3B0aW9uLCB2YWx1ZSBbLCBmaWxlXSkKPj4gwqDC
oMKgwqDCoCBLQ09ORklHX1NFVF9PUFTCoMKgwqDCoCA9ICQoY2FsbCBLQ09ORklHX01VTkdFX0RP
VF9DT05GSUcsICQoMSksICQoMSk9JCgyKSwgCj4+ICQoMykpCj4+IMKgwqDCoMKgwqAgIyBLQ09O
RklHX0RJU0FCTEVfT1BUwqAgKG9wdGlvbiBbLCBmaWxlXSkKPiBJIHByZWZlciB0aGlzOgo+IAo+
ICDCoCMgS0NPTkZJR19NVU5HRV9ET1RfQ09ORklHIChvcHRpb24sIG5ld2xpbmUgWywgZmlsZV0p
Cj4gIMKgZGVmaW5lIEtDT05GSUdfTVVOR0VfRE9UX0NPTkZJRwo+IC3CoMKgwqAgJChTRUQpICIv
XFw8JChzdHJpcCAkKDEpKVxcPi9kIiAkKGNhbGwgS0NPTkZJR19ET1RfQ09ORklHLCQoMykpCj4g
K8KgwqDCoCAkKFNFRCkgJy9eXCgjIFwpXD8kKHN0cmlwICQoMSkpXD4vZCcgJChjYWxsIEtDT05G
SUdfRE9UX0NPTkZJRywkKDMpKSAmJiBcCj4gIMKgwqDCoMKgIGVjaG8gJyQoc3RyaXAgJCgyKSkn
ID4+ICQoY2FsbCBLQ09ORklHX0RPVF9DT05GSUcsJCgzKSkKPiAgwqBlbmRlZgo+IAo+ICDCoCMg
S0NPTkZJR19FTkFCTEVfT1BUIChvcHRpb24gWywgZmlsZV0pCj4gLUtDT05GSUdfRU5BQkxFX09Q
VMKgID0gJChjYWxsIEtDT05GSUdfTVVOR0VfRE9UX0NPTkZJRywgJCgxKSwgJCgxKT15LCAkKDIp
KQo+ICtkZWZpbmUgS0NPTkZJR19FTkFCTEVfT1BUCj4gK8KgwqDCoCAkKFEpaWYgISBncmVwIC1x
ICdeJChzdHJpcCAkKDEpKT1bbXldJyAkKGNhbGwgS0NPTkZJR19ET1RfQ09ORklHLCQoMikpOyB0
aGVuIFwKPiArwqDCoMKgIMKgwqDCoCAkKGNhbGwgS0NPTkZJR19NVU5HRV9ET1RfQ09ORklHLCAk
KDEpLCAkKDEpPXksICQoMikpIHx8IGV4aXQgMTsgXAo+ICvCoMKgwqAgZmkKPiArZW5kZWYKCiAg
VGhhdCBsb29rcyBnb29kIGluZGVlZC4gQ2FuIHlvdSBzZW5kIGFuIG9mZmljaWFsIHBhdGNoPwoK
ICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiBSZWdhcmRzLAo+IFl1YW5oYW8KPj4KPj4gT3IgbWF5
YmUganVzdCB0aGF0Ogo+Pgo+PiDCoMKgwqDCoCBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctdXRp
bHMubWsgYi9wYWNrYWdlL3BrZy11dGlscy5tawo+PiDCoMKgwqDCoCBpbmRleCA3ZDFhZWE3NzEw
Li44YWViZDE0MTE0IDEwMDY0NAo+PiDCoMKgwqDCoCAtLS0gYS9wYWNrYWdlL3BrZy11dGlscy5t
awo+PiDCoMKgwqDCoCArKysgYi9wYWNrYWdlL3BrZy11dGlscy5tawo+PiDCoMKgwqDCoCBAQCAt
MjcsNyArMjcsNyBAQCBkZWZpbmUgS0NPTkZJR19NVU5HRV9ET1RfQ09ORklHCj4+IMKgwqDCoMKg
wqAgZW5kZWYKPj4gwqDCoMKgwqDCoCAjIEtDT05GSUdfRU5BQkxFX09QVCAob3B0aW9uIFssIGZp
bGVdKQo+PiDCoMKgwqDCoCAtS0NPTkZJR19FTkFCTEVfT1BUwqAgPSAkKGNhbGwgS0NPTkZJR19N
VU5HRV9ET1RfQ09ORklHLCAkKDEpLCAkKDEpPXksICQoMikpCj4+IMKgwqDCoMKgICtLQ09ORklH
X0VOQUJMRV9PUFTCoCA9ICQoY2FsbCBLQ09ORklHX01VTkdFX0RPVF9DT05GSUcsICQoMSkgaXMg
bm90IHNldCwgCj4+ICQoMSk9eSwgJCgyKSkKPj4gwqDCoMKgwqDCoCAjIEtDT05GSUdfU0VUX09Q
VCAob3B0aW9uLCB2YWx1ZSBbLCBmaWxlXSkKPj4gwqDCoMKgwqDCoCBLQ09ORklHX1NFVF9PUFTC
oMKgwqDCoCA9ICQoY2FsbCBLQ09ORklHX01VTkdFX0RPVF9DT05GSUcsICQoMSksICQoMSk9JCgy
KSwgCj4+ICQoMykpCj4+IMKgwqDCoMKgwqAgIyBLQ09ORklHX0RJU0FCTEVfT1BUwqAgKG9wdGlv
biBbLCBmaWxlXSkKPj4KPj4gQWxzbywgSSBub3RpY2Ugbm93IHRoYXQgdGhpcyBLQ09ORklHX01V
TkdFX0RPVF9DT05GSUcgaXMgcHJldHR5IGZyYWdpbGUuCj4+IEdpdmVuIGEgLmNvbmZpZyB3aXRo
Ogo+Pgo+PiDCoMKgwqDCoCBGT089IjEyMzQiCj4+IMKgwqDCoMKgIEJBUj0iJChGT08pIgo+Pgo+
PiBhbmQgdGhlbjoKPj4KPj4gwqDCoMKgwqAgJChjYWxsIEtDT05GSUdfU0VUX09QVCxGT08sYXpl
cnR5KQo+Pgo+PiB3b3VsZCB5aWVsZCBhIC5jb25maWcgd2l0aCBqdXN0Ogo+Pgo+PiDCoMKgwqDC
oCBGT089ImF6ZXJ0eSIKPj4KPj4gYmVjYXVzZSBcPEZPT1w+IHdvdWxkIG1hdGNoIHRoZSBhc3Np
Z25lbWVudCB0byBCQVIuCj4+Cj4+IFNvIHdlIG1heSBuZWVkIHRvIHJldmlzaXQgdGhhdCBtZXNz
IG9mIG1pbmUuLi4KPj4KPj4gUmVnYXJkcywKPj4gWWFubiBFLiBNT1JJTi4KPj4KPiAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
