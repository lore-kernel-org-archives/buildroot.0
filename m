Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6D2C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 10:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF5DA405FC;
	Mon, 25 Jul 2022 10:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF5DA405FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N6S149GHpSzm; Mon, 25 Jul 2022 10:10:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3D7640407;
	Mon, 25 Jul 2022 10:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3D7640407
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A48291BF371
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E5CC40407
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E5CC40407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPJgNvCyQtrw for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 10:10:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4109E400C7
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4109E400C7
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 10:10:42 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id bn9so4359272wrb.9
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 03:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=n4OVhu+XzR4A+ZaK3R/aen7QS6VIIPT3az4yYZv9vNg=;
 b=dtrzyW9Z1y58txmP261IoUPVU4CKZxGw+2KFxGcJUWp3CWqEk4OoSMPq924qNfOmIC
 fBdfHep5vJ6BqdlT8otKxjU3EAUXmdNDuEwHzHkJqx2R/Oa1+eggwNSrqWBTUx3bc+Bl
 U1vuovk468wd0sjWImIOZBURsMeKEtvNpnBFMBF8reQFAVxBWk2q1xcqF8SXmGv0B7Dv
 NLmBQFp6jq+yoteH4IW0D2PCaPMyHN1IQCRCI3DEs/bwP6XsHz1Br+41QhOQPlZu0WDO
 A4Q3gmbM1axsq4j1RQQX9qWQ2Is4wPqBJrLfsOR4OLZooT/YzVFjDSKQNLFEQRcg7MqV
 GI/g==
X-Gm-Message-State: AJIora8K8wFH6k7hLaZFNgm5x8RftdrOLSk9HRr1ERvttz55ggr2vp/r
 3ccDrrklhkFVd9gmFOqpeou1Iw==
X-Google-Smtp-Source: AGRyM1tHmpb44MdCVDIaB0dTxQpWOp8niaMuGyD4WT+sdEWcihKKrc9gSaytr/HgrEpRedGEq0e1sQ==
X-Received: by 2002:a05:6000:184d:b0:21e:8653:a0e7 with SMTP id
 c13-20020a056000184d00b0021e8653a0e7mr3592141wri.702.1658743840274; 
 Mon, 25 Jul 2022 03:10:40 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d568c000000b0021e5cc26dd0sm9825660wrv.62.2022.07.25.03.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 03:10:39 -0700 (PDT)
Message-ID: <26e6821b-a676-a8d6-df3a-83791f097ada@mind.be>
Date: Mon, 25 Jul 2022 12:10:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220612200904.2783767-1-fontaine.fabrice@gmail.com>
 <06b59095-245e-e92e-d6e8-73fcef93437a@mind.be>
Organization: Essensium/Mind
In-Reply-To: <06b59095-245e-e92e-d6e8-73fcef93437a@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=n4OVhu+XzR4A+ZaK3R/aen7QS6VIIPT3az4yYZv9vNg=;
 b=Bxx++ILtYmSx2uo0cK696AkgVtTN1s39QPDPIXi8Hba9uKZ1yKgThQSHnjoYPRFvp0
 1YyLO6QtvtlAx92jFe8z5fLesWwYyeqglyXKxNDtPkQA/i1DN40zWElg+0hwWuQpEqWW
 +JxQo3/BEWu7ojZ/mamFRI/inTUFY0YPuyzXLzwHZTNVlUpaUCdRDUBgSbihLAlx3YE8
 +cGLOaDOvMp5HnUjnPAkOyjM0iKvYIc44gGv+2qdYyTtc1+/9iw5AWI8c1zBueeLQLn+
 VQM1Wk2O4MUqjhPYtZvOAFxVoK3JTrkr1a1EosrquABULZYghbF0UeMK4ZHgRiw7k9S7
 d/Ow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Bxx++ILt
Subject: Re: [Buildroot] [PATCH 1/1] package/zstd: pass _GNU_SOURCE in CFLAGS
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDE0LzA2LzIwMjIgMjE6MTIsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAxMi8wNi8yMDIyIDIyOjA5LCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+PiBGaXggdGhlIGZv
bGxvd2luZyBidWlsZCBmYWlsdXJlOgo+Pgo+PiB1dGlsLmM6IEluIGZ1bmN0aW9uICdVVElMX3V0
aW1lJzoKPj4gdXRpbC5jOjE3MzoyNzogZXJyb3I6ICdzdGF0X3QnIHtha2EgJ2NvbnN0IHN0cnVj
dCBzdGF0J30gaGFzIG5vIG1lbWJlciBuYW1lZCAKPj4gJ3N0X210aW0nOyBkaWQgeW91IG1lYW4g
J3N0X210aW1lJz8KPj4gwqDCoCAxNzMgfMKgwqDCoMKgIHRpbWVidWZbMV0gPSBzdGF0YnVmLT5z
dF9tdGltOwo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fgo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RfbXRpbWUKPj4KPj4g
Rml4ZXM6Cj4+IMKgIC0gCj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRz
L2RkOTQ0YTNiZDRhYzBjOTRiMmJlYzhhYzIwOTEwMGRhYWY0MzkwM2QKPj4KPj4gU2lnbmVkLW9m
Zi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4+IC0t
LQo+PiDCoCBwYWNrYWdlL3pzdGQvenN0ZC5tayB8IDIgKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3pzdGQvenN0ZC5tayBiL3BhY2thZ2UvenN0ZC96c3RkLm1rCj4+IGluZGV4IGU4ZjYzMTUyMjIu
Ljc1ZWI2ZWNjMDcgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvenN0ZC96c3RkLm1rCj4+ICsrKyBi
L3BhY2thZ2UvenN0ZC96c3RkLm1rCj4+IEBAIC0zNiw3ICszNiw3IEBAIFpTVERfT1BUUyArPSBI
QVZFX0xaND0wCj4+IMKgIGVuZGlmCj4+IMKgIMKgICMgenN0ZCB3aWxsIGFwcGVuZCAtTzMgYWZ0
ZXIgJChDRkxBR1MpLCB1c2UgTU9SRUZMQUdTIHRvIG92ZXJyaWRlIGFnYWluCj4+IC1aU1REX09Q
VFMgKz0gTU9SRUZMQUdTPSIkKFRBUkdFVF9PUFRJTUlaQVRJT04pIgo+PiArWlNURF9PUFRTICs9
IE1PUkVGTEFHUz0iJChUQVJHRVRfT1BUSU1JWkFUSU9OKSAtRF9HTlVfU09VUkNFIgo+Cj4gwqBB
bHRob3VnaCB0aGlzIHdvcmthcm91bmQgc2VlbXMgcXVpdGUgaW5ub2N1b3VzLCBpdCBkb2Vzbid0
IGZlZWwgbGlrZSB0aGUgCj4gcmlnaHQgdGhpbmcgdG8gZG8uIEluZGVlZCwgdGhlIGNvZGUgYXJv
dW5kIHRoZSB1c2Ugb2Ygc3RfbXRpbSBhbHJlYWR5IGRvZXMgCj4gZXZlcnkgZWZmb3J0IG9mIG1h
a2luZyBzdXJlIHRoYXQgdGhlIHRvb2xjaGFpbiByZWFsbHkgc3VwcG9ydHMgc3RfbXRpbS4KPgo+
IMKgQWN0dWFsbHksIGl0IGZlZWxzIGxpa2UgYSBidWcgaW4gZ2xpYmMuIFBPU0lYIHJlcXVpcmUg
c3RfbXRpbSB0byBleGlzdCwgc28gCj4gcmVxdWlyaW5nIF9HTlVfU09VUkNFIGZvciBpdCBpcyBq
dXN0IHBsYWluIHdyb25nLiBJbmRlZWQsIGluIAo+IHN5c2RlcHMvdW5peC9zeXN2L2xpbnV4L21p
Y3JvYmxhemUvYml0cy9zdHJ1Y3Rfc3RhdC5oLCB0aGUgbGFyZ2VmaWxlIAo+IGRlZmluaXRpb24g
b2Ygc3RfbXRpbSBpcyBwcm90ZWN0ZWQgYnkgdGhlIF9fVVNFX01JU0MgbWFjcm8sIHdoaWxlIHRo
ZSAKPiBub24tbGFyZ2VmaWxlIGRlZmluaXRpb24gaXMgcHJvdGVjdGVkIGJ5IHRoZSBfX1VTRV9Y
T1BFTjJLOCBtYWNybyAod2hpY2ggaXMgCj4gdGhlIGNvcnJlY3Qgb25lKS4gU28gSSdkIHJhdGhl
ciBwYXRjaCBnbGliYy4KCiDCoFNvIHRoYXQncyBleGFjdGx5IHdoYXQgSSBkaWQgWzFdLiBNYXJr
ZWQgYXMgc3VwZXJzZWRlZC4KCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKClsxXSAKaHR0cHM6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDcyNTEwMDc0
NS4yODc4ODk2LTEtYXJub3V0QG1pbmQuYmUvCgoKCj4KPiDCoEFwcGFyZW50bHksIERlYmlhbiBo
YXMgYSBzaW1pbGFyIHByb2JsZW0gb24gQWxwaGEgWzFdLgo+Cj4gWzFdIGh0dHBzOi8vZ2l0aHVi
LmNvbS9mYWNlYm9vay96c3RkL3B1bGwvMjk4Ngo+Cj4+IMKgIMKgIFpTVERfQlVJTERfTElCU19C
QVNFTkFNRVMgPSBsaWJ6c3RkLnBjCj4+IMKgIGlmZXEgKCQoQlIyX1NUQVRJQ19MSUJTKSx5KQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
