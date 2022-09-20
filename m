Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E208C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 20:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C458A60FCD;
	Tue, 20 Sep 2022 20:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C458A60FCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qsLib4LcxtOx; Tue, 20 Sep 2022 20:39:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9713560FC9;
	Tue, 20 Sep 2022 20:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9713560FC9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D60461BF82C
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 20:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0EDF60F9D
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 20:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0EDF60F9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g7gTWrrbsdFN for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 20:39:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A7E460AAA
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A7E460AAA
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 20:39:39 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id z13so5561639edb.13
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 13:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=b9IUkcAyDR81YKu9IT6HQ/cbx+6395YrgZqOKmkmpgc=;
 b=YbtmfcH/taDomyF3QvaV2e8qnegPWidWn45nbMHHf+PhzA4QWOwHLeINnpzrBRn88t
 gyXfBcOcLKb/W4/iib2HB2Ix6G16qgKeW12OPbaGOvl9s6kCQIp16BWyvUIPkPWgt108
 n4TpTL1JA6y5P9PZrUWTY+619DEan6HJB4hVvE0+TO+Sp+gajVWSKKfHWToFqHs6tQlE
 7Y8DbLXKMYrSErHMHAiiIc4F4f+FJs6auenPu8bjAEsD/LSIzskc6WOKTFL7PsH9SUfi
 W2IYeYuGHLpuWecR/ReO8KtSq2hfZfkHATCN8ZdN0HVy5TcN7Woim5TX3DQAW/oOljyi
 j0aA==
X-Gm-Message-State: ACrzQf3AHM0RxgcUdj35yVhQOulOLei/oUMuemtmFkKKvZpfd3jwWkzc
 +0aevuTo45at7JpQA62dtEgOEQ==
X-Google-Smtp-Source: AMsMyM4hspS9KWE59xxql0dPa+Q12CqNl4Qu4jYuEwZ7409R6hAi0mnuIEDdwPPmOiz2bYS06l/LRA==
X-Received: by 2002:a05:6402:3784:b0:453:9d2a:771b with SMTP id
 et4-20020a056402378400b004539d2a771bmr16019769edb.353.1663706378275; 
 Tue, 20 Sep 2022 13:39:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a17090653c100b0077fde38993asm331982ejo.152.2022.09.20.13.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 13:39:37 -0700 (PDT)
Message-ID: <686ab90f-c290-8183-dff7-c836ed7642ca@mind.be>
Date: Tue, 20 Sep 2022 22:32:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-4-joel@jms.id.au>
 <c1b32b94-df43-96ad-72e0-8a6592e042fb@mind.be>
 <67a21fcf-03ce-0eb7-8e19-0ae171057d5b@kaod.org>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <67a21fcf-03ce-0eb7-8e19-0ae171057d5b@kaod.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=b9IUkcAyDR81YKu9IT6HQ/cbx+6395YrgZqOKmkmpgc=;
 b=WDj1Pfc857eUswWJz5rbGOheo1gvysDt2mglhLL6Gb7/arHYVjUEIgAvBamD8YHjzw
 /XUW+Xkcs79o0XIIx94griWMTOZh03y3CRdAHdK2TTbwN39dTk6D1pTjXzWxFse7qruF
 zDCOh4R1x+K7WXrAuvgGCC9ReIV8tdoHRrUax5brCU2HeD0kEnx3OBtRHc9AU3T4T4ae
 gU5qDngjhb/7DwkXgPwZ65JKcZN0wMOqq5t9Z3tvPr9A43qZKy1fCLHm8kMUZIAbWloq
 3wPXG7Z9rLRBZX34s/AapFoecAHXhKI0ZihP5kMPH4tHl0nYhS1lZ/XWY7nqhZm+8/RX
 gPWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WDj1Pfc8
Subject: Re: [Buildroot] [PATCH 3/9] arch/powerpc: Enable powerpc64le only
 on CPUs that support it
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMC8wOS8yMDIyIDE5OjA5LCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToKPiBPbiA5LzE4
LzIyIDEyOjIzLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPj4KPj4KPj4gT24gMjkvMDcv
MjAyMiAwMjowOCwgSm9lbCBTdGFubGV5IHdyb3RlOgo+Pj4gSW52YWxpZCBjb25maWd1cmF0aW9u
cyBsZWFkIHRvIGJ1aWxkIGZhaWx1cmVzLCBzdWNoIGFzIHRyeWluZyB0byBlbmFibGUKPj4+IHBw
YzY0bGUgZm9yIHRoZSBwcGM5NzA6Cj4+Pgo+Pj4gICAgCj4+PiBodHRwOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5uZXQvcmVzdWx0cy9mZGE4ODY3NjhmY2UyNWNjZDliNTJiNjM1ZmY1YjEzZGE3YmEy
ZDBjLwo+Pj4KPj4+IEluIG9yZGVyIHRvIHJ1biBhIHBwYzY0bGUgdXNlcnNwYWNlIGEga2VybmVs
IHRoYXQgcnVucyBpbiB0aGlzIG1vZGUgaXMKPj4+IHJlcXVpcmVkLiBUaGUgb25seSBDUFUgc3Vw
cG9ydGVkIGluIGJ1aWxkcm9vdCB0aGF0IGNhbiBib290IGEgcHBjNjRsZQo+Pj4ga2VybmVsIGlz
IFBvd2VyOCwgc28gbWFyayBhbGwgb2YgdGhlIG90aGVyIDY0LWJpdCBjYXBhYmxlIENQVXMgYXMg
bm90Cj4+PiBzdXBwb3J0aW5nIHBwYzY0bGUuCj4+Pgo+Pj4gVGhpcyBkcm9wcyB0aGUgY29tbWVu
dCBhYm91dCBsaWJjLCB3aGljaCBpcyB0cnVlIGJ1dCBkb2Vzbid0IHRlbGwgdGhlCj4+PiB3aG9s
ZSBzdG9yeS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlk
LmF1Pgo+Pgo+PiDCoMKgQXBwbGllZCB0byBtYXN0ZXIgd2l0aCBzb21lIGNoYW5nZXMsIHNlZSBi
ZWxvdy4KPj4KPj4+IC0tLQo+Pj4gwqAgYXJjaC9Db25maWcuaW4ucG93ZXJwYyB8IDExICsrKysr
KystLS0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL0NvbmZpZy5pbi5wb3dlcnBjIGIvYXJjaC9D
b25maWcuaW4ucG93ZXJwYwo+Pj4gaW5kZXggOGQzOTJiZmRlODE0Li43YzZhZTg0MzQ4ZTkgMTAw
NjQ0Cj4+PiAtLS0gYS9hcmNoL0NvbmZpZy5pbi5wb3dlcnBjCj4+PiArKysgYi9hcmNoL0NvbmZp
Zy5pbi5wb3dlcnBjCj4+PiBAQCAtNzEsMTEgKzcxLDkgQEAgY29uZmlnIEJSMl9wb3dlcnBjXzYw
NGUKPj4+IMKgwqDCoMKgwqAgZGVwZW5kcyBvbiAhQlIyX0FSQ0hfSVNfNjQKPj4+IMKgIGNvbmZp
ZyBCUjJfcG93ZXJwY182MjAKPj4+IMKgwqDCoMKgwqAgYm9vbCAiNjIwIgo+Pj4gLcKgwqDCoCAj
IE5vIEMgbGlicmFyeSBzdXBwb3J0cyB0aGlzIHZhcmlhbnQgb24gcHBjNjRsZQo+Pj4gwqDCoMKg
wqDCoCBkZXBlbmRzIG9uICFCUjJfcG93ZXJwYzY0bGUKPj4+IMKgIGNvbmZpZyBCUjJfcG93ZXJw
Y182MzAKPj4+IMKgwqDCoMKgwqAgYm9vbCAiNjMwIgo+Pj4gLcKgwqDCoCAjIE5vIEMgbGlicmFy
eSBzdXBwb3J0cyB0aGlzIHZhcmlhbnQgb24gcHBjNjRsZQo+Pj4gwqDCoMKgwqDCoCBkZXBlbmRz
IG9uICFCUjJfcG93ZXJwYzY0bGUKPj4+IMKgIGNvbmZpZyBCUjJfcG93ZXJwY183NDAKPj4+IMKg
wqDCoMKgwqAgYm9vbCAiNzQwIgo+Pj4gQEAgLTEwMiw2ICsxMDAsNyBAQCBjb25maWcgQlIyX3Bv
d2VycGNfODYwCj4+PiDCoMKgwqDCoMKgIGRlcGVuZHMgb24gIUJSMl9BUkNIX0lTXzY0Cj4+PiDC
oCBjb25maWcgQlIyX3Bvd2VycGNfOTcwCj4+PiDCoMKgwqDCoMKgIGJvb2wgIjk3MCIKPj4+ICvC
oMKgwqAgZGVwZW5kcyBvbiAhQlIyX3Bvd2VycGM2NGxlCj4+Cj4+IMKgwqBBcyBzdWdnZXN0ZWQg
YnkgVGhvbWFzLCBJIGNoYW5nZWQgdGhpcyB0byBwb3NpdGl2ZSBsb2dpYy4gSSdsbCBhbHNvIHB1
c2ggYSAKPj4gZm9sbG93LXVwIHBhdGNoIHRoYXQgY2hhbmdlcyB0aGUgcmVzdCBvZiB0aGUgZmls
ZSB0byBwb3NpdGl2ZSBsb2dpYy4KPj4KPj4gwqDCoENvdWxkIHlvdSAob3IgYW55IG90aGVyIHBv
d2VycGMgImV4cGVydCIpIHJldmlldyB0aGUgY29uZGl0aW9ucyB0byBiZSBzdXJlIAo+PiB0aGUg
YXJjaGl0ZWN0dXJlIHNlbGVjdGlvbiBvcHRpb25zIGFyZSBjb3JyZWN0IG5vdz8KPj4KPj4+IMKg
wqDCoMKgwqAgc2VsZWN0IEJSMl9QT1dFUlBDX0NQVV9IQVNfQUxUSVZFQwo+Pj4gwqAgY29uZmln
IEJSMl9wb3dlcnBjXzg1NDAKPj4+IMKgwqDCoMKgwqAgYm9vbCAiODU0MCAvIGU1MDB2MSIKPj4+
IEBAIC0xMjksMjEgKzEyOCwyNSBAQCBjb25maWcgQlIyX3Bvd2VycGNfZTY1MDAKPj4+IMKgwqDC
oMKgwqAgc2VsZWN0IEJSMl9QT1dFUlBDX0NQVV9IQVNfQUxUSVZFQwo+Pj4gwqAgY29uZmlnIEJS
Ml9wb3dlcnBjX3Bvd2VyNAo+Pj4gwqDCoMKgwqDCoCBib29sICJwb3dlcjQiCj4+PiAtwqDCoMKg
ICMgTm8gQyBsaWJyYXJ5IHN1cHBvcnRzIHRoaXMgdmFyaWFudCBvbiBwcGM2NGxlCj4+PiDCoMKg
wqDCoMKgIGRlcGVuZHMgb24gIUJSMl9wb3dlcnBjNjRsZQo+Pj4gwqAgY29uZmlnIEJSMl9wb3dl
cnBjX3Bvd2VyNQo+Pj4gwqDCoMKgwqDCoCBib29sICJwb3dlcjUiCj4+PiAtwqDCoMKgICMgTm8g
QyBsaWJyYXJ5IHN1cHBvcnRzIHRoaXMgdmFyaWFudCBvbiBwcGM2NGxlCj4+PiDCoMKgwqDCoMKg
IGRlcGVuZHMgb24gIUJSMl9wb3dlcnBjNjRsZQo+Pj4gK8KgwqDCoCBkZXBlbmRzIG9uIEJSMl9B
UkNIX0lTXzY0Cj4+Cj4+IMKgwqBBRkFJVSwgYWxsIFBPV0VSIENQVXMgYXJlIGFibGUgdG8gcnVu
IGluIDMyLWJpdCBtb2RlIAo+IAo+IHllcy4gVGhlIHF1ZXN0aW9uIGlzIG1vcmUgOiBjYW4gd2Ug
Z2VuZXJhdGUgY29ycmVjdGx5IDMyLWJpdCBzb2Z0d2FyZQo+IGZvciBhbGwgdGhlc2UgQ1BVcyA/
IGZpcm13YXJlLCBrZXJuZWwgYW5kIHVzZXJzcGFjZS4gSSBkb3VidCB3ZSBoYXZlCj4gY29ycmVj
dCBzdXBwb3J0IGZvciBvbGRlciBDUFVzLgoKICBUaGF0IGlzIGluZGVlZCB0aGUgcXVlc3Rpb24u
IEhvd2V2ZXIsIHdlIGhhdmUgb2ZmZXJlZCB0aGlzIHBvc3NpYmlsaXR5IGZvciAKeWVhcnMuIFNv
IGlmIGl0IGlzIGluIGZhY3Qgd29ya2luZywgcGVvcGxlIG1heSBiZSByZWx5aW5nIG9uIGl0LiBT
byB1bmxlc3MgeW91IApoYXZlIHNvbWUgYWN0dWFsIGV2aWRlbmNlIHRoYXQgaXQgZG9lc24ndCB3
b3JrLCBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCByZW1vdmUgaXQuCgogIEkgYWxzbyBub3RpY2Ug
dGhhdCB5b3UgcmVtb3ZlZCAzMi1iaXQgc3VwcG9ydCBmb3IgdGhlIFBvd2VyIENQVXMsIGJ1dCBk
aWRuJ3QgCnRvdWNoIHRoZSBub24tSUJNIENQVXMgbGlrZSBlNTUwMCB3aGljaCBpcyB1c2VkIGlu
IHNvbWUgRnJlZXNjYWxlL05YUCBTb0NzLiBBbmQgCmluZGVlZCwgSUlSQyBJIGhhZCBhIGN1c3Rv
bWVyIGEgZmV3IHllYXJzIGFnbyB3aG8gd2FzIHJ1bm5pbmcgYSAzMi1iaXQga2VybmVsIAphbmQg
dXNlcnNwYWNlIG9uIHN1Y2ggYSBDUFUuCgoKPj4gYW5kIEkgYmVsaWV2ZSBpdCdzIGV2ZW4gcG9z
c2libGUgdG8gcnVuIGEgNjQtYml0IGtlcm5lbCB3aXRoIDMyLWJpdCB1c2Vyc3BhY2UgCj4+IGxp
a2Ugb24gQVJNLiBJcyB0aGlzIG5vdCB0cnVlPwo+IAo+IEl0IGlzLiBUaGlzIGlzIGNoZWNrZWQg
b24gb2xkZXIgQ1BVcywgbGlrZSBHNSwgdW5kZXIgUUVNVSBidXQgMzJiaXQgaXMKPiBiaXQtcm90
dGluZyBpbiBtYW55IHBsYWNlcy4KPiAKPj4KPj4gwqDCoElmIFBPV0VSNSsgcmVhbGx5IGNhbid0
IHJ1biBpbiAzMi1iaXQgbW9kZSAob3IgdGhpcyBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRoZSAKPj4g
a2VybmVsKSwgCj4gCj4gSSB0aGluayB0aGVyZSBpcyBhbiBpc3N1ZSB3aXRoIHRoZSB1c2Ugb2Yg
dGhlIHJmaSBpbnN0cnVjdGlvbiBpbiAzMi1iaXQKPiBtb2RlIHdoaWNoIHdhcyByZW1vdmVkIGZy
b20gdGhlIElTQSBvZiBzZXJ2ZXIgQ1BVcy4gWW91IGNhbiBub3QgZ2VuZXJhdGUKPiBhIDMyYml0
IGtlcm5lbCBmb3Igc3VjaCBDUFVzIEFGQUlSCgogIFNvIGlmIHlvdSdyZSBzdXJlIG9mIHRoaXMs
IGZlZWwgZnJlZSB0byBzZW5kIGEgcGF0Y2ggcmVtb3ZpbmcgdGhlIEJSMl9wb3dlcnBjIApwYXJ0
IG9mIHRoZSByZWxldmFudCBDUFVzLCB3aXRoIHNvbWUgZXZpZGVuY2UgaW4gdGhlIGNvbW1pdCBs
b2cgd2h5IHRoaXMgCndvdWxkbid0IHdvcmsgYW55d2F5LiBJZGVhbCBldmlkZW5jZSB3b3VsZCBi
ZSB0aGF0IHRoZSBidWlsZCBvZiB0aGUga2VybmVsIApmYWlscywgYnV0IHNvbWV0aGluZyBsZXNz
IGNvbmNyZXRlIGNhbiB3b3JrIGFzIHdlbGwuCgoKPj4gYXJlIHlvdSBzdXJlIHRoYXQgdGhpcyAq
aXMqIHBvc3NpYmxlIG9uIFBPV0VSND8KPiAKPiBQT1dFUjQgc3VwcG9ydCB3YXMgcmVtb3ZlZCBm
cm9tIExpbnV4IH40IHllYXJzIGFnby4KCiAgQWgsIGluIHRoYXQgY2FzZSB3ZSBzaG91bGQgcHJv
YmFibHkgcmVtb3ZlIFBPV0VSNCBlbnRpcmVseS4KCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+PiDC
oMKgSW4gZWl0aGVyIGNhc2UsIGlmIHRoZSBjdXJyZW50IGNvbmRpdGlvbnMgYXJlIG5vdCBjb3Jy
ZWN0LCBwbGVhc2Ugc2VuZCBhIAo+PiBmb2xsb3ctdXAgcGF0Y2ggdG8gZml4IHRoZW0gZXZlbiBt
b3JlLgo+IAo+IEl0IGlzIHNhZmVyIHRvIGJ1aWxkIGFsbCA2NC1iaXQgKGtlcm5lbCArIHVzZXJz
cGFjZSkgZm9yIHNlcnZlciBDUFVzLgo+IAo+Pj4gwqAgY29uZmlnIEJSMl9wb3dlcnBjX3Bvd2Vy
Ngo+Pj4gwqDCoMKgwqDCoCBib29sICJwb3dlcjYiCj4+PiArwqDCoMKgIGRlcGVuZHMgb24gIUJS
Ml9wb3dlcnBjNjRsZQo+Pj4gK8KgwqDCoCBkZXBlbmRzIG9uIEJSMl9BUkNIX0lTXzY0Cj4+Cj4+
IMKgwqBTbyBoZXJlIEkgd3JvdGUgdGhlIGNvbmRpdGlvbiBhcwo+Pgo+PiDCoMKgwqDCoMKgZGVw
ZW5kcyBvbiBCUjJfcG93ZXJwYyB8fCBCUjJfcG93ZXJwYzY0Cj4+Cj4+IGJlY2F1c2UgSSBkbyBi
ZWxpZXZlIGl0IHN1cHBvcnRzIDMyLWJpdC4KPiAKPiBUaGVzZSBkZWZpbml0aW9ucyBjYW4gYmUg
cHJvYmxlbWF0aWMgOgo+IAo+ICDCoCBjb25maWcgQlIyX3Bvd2VycGNfcG93ZXJ4Cj4gIMKgwqDC
oMKgwqAgYm9vbCAicG93ZXJ4Igo+ICDCoMKgwqDCoMKgIGRlcGVuZHMgb24gQlIyX3Bvd2VycGMg
fHwgQlIyX3Bvd2VycGM2NAo+IAo+IGJlY2F1c2UgdGhleSBpbXBseSB0aGF0IHRoZSBrZXJuZWwg
Y291bGQgYmUgYnVpbHQgaW4gMzJiaXQuIFNlZSBhYm92ZS4KPiAKPiBUaGFua3MsCj4gCj4gQy4K
PiAKPj4KPj4gwqDCoFJlZ2FyZHMsCj4+IMKgwqBBcm5vdXQKPj4KPj4+IMKgwqDCoMKgwqAgc2Vs
ZWN0IEJSMl9QT1dFUlBDX0NQVV9IQVNfQUxUSVZFQwo+Pj4gwqAgY29uZmlnIEJSMl9wb3dlcnBj
X3Bvd2VyNwo+Pj4gwqDCoMKgwqDCoCBib29sICJwb3dlcjciCj4+PiArwqDCoMKgIGRlcGVuZHMg
b24gIUJSMl9wb3dlcnBjNjRsZQo+Pj4gK8KgwqDCoCBkZXBlbmRzIG9uIEJSMl9BUkNIX0lTXzY0
Cj4+PiDCoMKgwqDCoMKgIHNlbGVjdCBCUjJfUE9XRVJQQ19DUFVfSEFTX0FMVElWRUMKPj4+IMKg
wqDCoMKgwqAgc2VsZWN0IEJSMl9QT1dFUlBDX0NQVV9IQVNfVlNYCj4+PiDCoCBjb25maWcgQlIy
X3Bvd2VycGNfcG93ZXI4Cj4+PiDCoMKgwqDCoMKgIGJvb2wgInBvd2VyOCIKPj4+ICvCoMKgwqAg
ZGVwZW5kcyBvbiBCUjJfQVJDSF9JU182NAo+Pj4gwqDCoMKgwqDCoCBzZWxlY3QgQlIyX1BPV0VS
UENfQ1BVX0hBU19BTFRJVkVDCj4+PiDCoMKgwqDCoMKgIHNlbGVjdCBCUjJfUE9XRVJQQ19DUFVf
SEFTX1ZTWAo+Pj4gwqAgZW5kY2hvaWNlCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
