Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DB8EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 20:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2BED404E0;
	Mon, 19 Jun 2023 20:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2BED404E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rc5mQ_b06w_g; Mon, 19 Jun 2023 20:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED944402A8;
	Mon, 19 Jun 2023 20:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED944402A8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C95A71BF2CF
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 20:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9A1D81A29
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 20:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9A1D81A29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iJonKyZzZZUe for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 20:22:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8557781A24
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8557781A24
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 20:22:32 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f875b267d9so1278633e87.1
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 13:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687206150; x=1689798150;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LzloFNidd3sti4UkHXrTIMIUWHeXzO1TQ+lfVII4nEc=;
 b=I/pb5bZiCagm7olM+/Cik6Il7n5z+MfNTrgO/bRxY2Cyyl0rmviaGjeSrtkX6VWE58
 aB68i7ePcHU2in3YLq7GIgUfYFvbfnjguZtZx4kMLJ4xQr91P8HhB9pLp5W1Z1Yrco0/
 mym3lD/Zrr+uEWTq3qTCLgEOzbdsQ3R6MgdmOA47aboH9B/Sw7rTDoYnR79vZwV3rvbf
 XAX9y9Fx2EgQMHPnIFakTtPPQDgCnqDZPNLQiSJPlyo3k8TENeaCA7TGaUQMg9e/LU4j
 X5Qx7WSWmpqV1JjdARV9mCsvSI9PIztUYSbEIz9S/78S1rmvvMaCn4A+bVeRH0EIb0Cj
 uC/g==
X-Gm-Message-State: AC+VfDzENugb5LtYv/i0aCIFalsd/Hh/BAtkPAFEU9l5WlXh+XE8fixK
 TsAKo/pOkJKzzgXDWGf139VZhQ==
X-Google-Smtp-Source: ACHHUZ6Dk1aB/DBpDd7/kwqxoPzYr1p6t6eM+1UsFhjlNbUmRhT9Sz95ofbPn9R1r2iGVrepwCBXjg==
X-Received: by 2002:a2e:95c4:0:b0:2b4:6a20:f12d with SMTP id
 y4-20020a2e95c4000000b002b46a20f12dmr4075598ljh.43.1687206150083; 
 Mon, 19 Jun 2023 13:22:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 gu1-20020a170906f28100b009829a5ae8b3sm157154ejb.64.2023.06.19.13.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 13:22:29 -0700 (PDT)
Message-ID: <b1725f8f-7d1e-4d6e-a307-f1ac83081f54@mind.be>
Date: Mon, 19 Jun 2023 22:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Laurent Vivier <laurent@vivier.eu>, buildroot@buildroot.org
References: <20230613105015.739870-1-laurent@vivier.eu>
 <20230613105015.739870-4-laurent@vivier.eu>
In-Reply-To: <20230613105015.739870-4-laurent@vivier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687206150; x=1689798150;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LzloFNidd3sti4UkHXrTIMIUWHeXzO1TQ+lfVII4nEc=;
 b=R6CEXPGg2jHcsm/cq80r9WfV8Mzb5Yf7drWzpQlZaeRv97rGSb5Q+8hox01hiCOYzf
 EZMbJ8qqXqUaCr7TbCtK+iyWGFfQCpW8rBYBd30mUdYFNB3hfJES7rky8a+2P4BaygzS
 bwri6bQmItrZ5bexYobzZuTegnNoO5YCP0NpDQwkMisczCNMiOuuTb5VCoZkPVdQd6Vh
 ZfWtFCzW8Jnf3rr7VBkoe2oJu9nmEjfJGFCpXg3yMuJ0vvRuJHycjH6QIedNVxJs3z47
 uyjfpF2M1iPI+3UKrKX0awVpLOy2bYZo9b8w0WF9mqlYaExAq6bS/ZtjDPBpeMkKcyJI
 ZeuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=R6CEXPGg
Subject: Re: [Buildroot] [PATCH v14 3/4] board/qemu/m68k-virt: Add virt-m68k
 linux config
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMy8wNi8yMDIzIDEyOjUwLCBMYXVyZW50IFZpdmllciB3cm90ZToKPiBCdWlsZCBhIDUu
MTkgKGZpcnN0IHZlcnNpb24gd2l0aCB0aGUgbTY4ayB2aXJ0IG1hY2hpbmUpIGtlcm5lbAo+IGZv
ciAicWVtdS1zeXN0ZW0tbTY4ayAtTSB2aXJ0IiBtYWNoaW5lLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IExhdXJlbnQgVml2aWVyIDxsYXVyZW50QHZpdmllci5ldT4KPiBSZXZpZXdlZC1ieTogQ8OpZHJp
YyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KPiAtLS0KPiAgIERFVkVMT1BFUlMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCj4gICBib2FyZC9xZW11L202OGstdmlydC9s
aW51eC5mcmFnbWVudCAgICAgICAgfCAyMSArKysrKysrKysrKysrKysrKwo+ICAgYm9hcmQvcWVt
dS9tNjhrLXZpcnQvcmVhZG1lLnR4dCAgICAgICAgICAgIHwgIDUgKysrKysKPiAgIGNvbmZpZ3Mv
cWVtdV9tNjhrX3ZpcnRfcGV0aXRib290X2RlZmNvbmZpZyB8IDI2ICsrKysrKysrKysrKysrKysr
KysrKysKPiAgIDQgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGJvYXJkL3FlbXUvbTY4ay12aXJ0L2xpbnV4LmZyYWdtZW50Cj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgYm9hcmQvcWVtdS9tNjhrLXZpcnQvcmVhZG1lLnR4dAo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGNvbmZpZ3MvcWVtdV9tNjhrX3ZpcnRfcGV0aXRib290X2RlZmNvbmZpZwo+IAo+
IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IDdhYTU5ODBkZjdm
My4uODA0YTRjZDJjMWQ2IDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9Q
RVJTCj4gQEAgLTE4MjAsNiArMTgyMCw4IEBAIEY6CXBhY2thZ2Uvb3Blbi1sbGRwLwo+ICAgCj4g
ICBOOglMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+Cj4gICBGOglwYWNrYWdlL3Bl
dGl0Ym9vdC8KPiArRjoJYm9hcmQvcWVtdS9tNjhrLXZpcnQvCj4gK0Y6CWNvbmZpZ3MvcWVtdV9t
NjhrX3ZpcnRfcGV0aXRib290X2RlZmNvbmZpZwo+ICAgCj4gICBOOglMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgo+ICAgRjoJYm9vdC9hZmJvb3Qtc3RtMzIvCj4gZGlmZiAtLWdpdCBh
L2JvYXJkL3FlbXUvbTY4ay12aXJ0L2xpbnV4LmZyYWdtZW50IGIvYm9hcmQvcWVtdS9tNjhrLXZp
cnQvbGludXguZnJhZ21lbnQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAwMC4uNDk0MTY5ODI2MDFjCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2JvYXJkL3FlbXUvbTY4
ay12aXJ0L2xpbnV4LmZyYWdtZW50Cj4gQEAgLTAsMCArMSwyMSBAQAo+ICtDT05GSUdfQkxLX0RF
Vl9JTklUUkQ9eQo+ICtDT05GSUdfS0VYRUM9eQo+ICtDT05GSUdfQk9PVElORk9fUFJPQz15Cj4g
K0NPTkZJR19ERVZUTVBGU19NT1VOVD15Cj4gK0NPTkZJR19NRD15CgogIFdoeSBpcyBMVk0vUkFJ
RCBuZWVkZWQ/IFdlJ3JlIGp1c3QgYm9vdGluZyBhbiBpbml0cmQuLi4KCj4gK0NPTkZJR19NRF9M
SU5FQVI9eQo+ICtDT05GSUdfTURfTVVMVElQQVRIPXkKPiArQ09ORklHX01EX0ZBVUxUWT15Cj4g
K0NPTkZJR19CTEtfREVWX0RNPXkKCiAgU2FtZSBxdWVzdGlvbiwgd2h5IGlzIGRldmljZSBtYXBw
ZXIgbmVlZGVkPyBBbmQgcGFydGljdWxhcmx5IGFsbCB0aG9zZSBleG90aWMgCnRhcmdldHMuLi4K
Cj4gK0NPTkZJR19ETV9VTlNUUklQRUQ9eQo+ICtDT05GSUdfRE1fQ1JZUFQ9eQo+ICtDT05GSUdf
RE1fU05BUFNIT1Q9eQo+ICtDT05GSUdfRE1fVEhJTl9QUk9WSVNJT05JTkc9eQo+ICtDT05GSUdf
RE1fQ0FDSEU9eQo+ICtDT05GSUdfRE1fV1JJVEVDQUNIRT15Cj4gK0NPTkZJR19ETV9FQlM9eQo+
ICtDT05GSUdfRE1fRVJBPXkKPiArQ09ORklHX0RNX0NMT05FPXkKPiArQ09ORklHX0RNX01JUlJP
Uj15Cj4gK0NPTkZJR19ETV9SQUlEPXkKPiArQ09ORklHX0RNX1pFUk89eQo+IGRpZmYgLS1naXQg
YS9ib2FyZC9xZW11L202OGstdmlydC9yZWFkbWUudHh0IGIvYm9hcmQvcWVtdS9tNjhrLXZpcnQv
cmVhZG1lLnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi43
MTRiNzRjNzBlYTEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYm9hcmQvcWVtdS9tNjhrLXZpcnQv
cmVhZG1lLnR4dAo+IEBAIC0wLDAgKzEsNSBAQAo+ICtSdW4gdGhlIGVtdWxhdGlvbiB3aXRoOgo+
ICsKPiArIHFlbXUtc3lzdGVtLW02OGsgLU0gdmlydCAta2VybmVsIG91dHB1dC9pbWFnZXMvdm1s
aW51eCAtaW5pdHJkIG91dHB1dC9pbWFnZXMvcm9vdGZzLmNwaW8ueHogLWFwcGVuZCAiY29uc29s
ZT10dHlHRjAiIC0tbm9ncmFwaGljICMgcWVtdV9tNjhrX3ZpcnRfcGV0aXRib290X2RlZmNvbmZp
Zwo+ICsKPiArVGhlIHBldGlib290IG1lbnUgd2lsbCBhcHBlYXIgaW4gdGhlIHRlcm1pbmFsIHdo
ZXJlIFFFTVUgaGFzIGJlZW4gc3RhcnRlZC4KPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X202
OGtfdmlydF9wZXRpdGJvb3RfZGVmY29uZmlnIGIvY29uZmlncy9xZW11X202OGtfdmlydF9wZXRp
dGJvb3RfZGVmY29uZmlnCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAw
MDAuLjE4ODkwYjFhNmZjMQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9jb25maWdzL3FlbXVfbTY4
a192aXJ0X3BldGl0Ym9vdF9kZWZjb25maWcKPiBAQCAtMCwwICsxLDI2IEBACj4gK0JSMl9tNjhr
PXkKPiArQlIyX1RPT0xDSEFJTl9CVUlMRFJPT1RfV0NIQVI9eQo+ICtCUjJfQ0NBQ0hFPXkKPiAr
QlIyX1JFTFJPX05PTkU9eQoKICBXaHkgaXMgdGhpcyBuZWVkZWQ/IFBsZWFzZSBleHBsYWluIGlu
IHRoZSBjb21taXQgbWVzc2FnZS4KCj4gK0JSMl9UQVJHRVRfR0VORVJJQ19JU1NVRT0iV2VsY29t
ZSB0byBQZXRpdGJvb3QiCj4gK0JSMl9ST09URlNfREVWSUNFX0NSRUFUSU9OX0RZTkFNSUNfRVVE
RVY9eQo+ICtCUjJfUk9PVEZTX01FUkdFRF9VU1I9eQoKICBXaHkgaXMgdGhpcyBuZWVkZWQ/Cgo+
ICtCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC9xZW11L3Bvc3QtaW1hZ2Uuc2gi
Cj4gK0JSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iJChCUjJfREVGQ09ORklHKSIKPiArQlIy
X0xJTlVYX0tFUk5FTD15CgogIFBsZWFzZSB1c2UgYSBzcGVjaWZpYyBrZXJuZWwgdmVyc2lvbiAo
bGlrZSBpcyBkb25lIGZvciB0aGUgb3RoZXIgcWVtdSAKZGVmY29uZmlncykuIEl0IHdvdWxkIEJU
VyBiZSBuaWNlIHRvIHVzZSB0aGUgc3RydWN0dXJlZCBhbmQgY29tbWVudGVkIGZvcm1hdCAKbGlr
ZSBvbiB0aGUgb3RoZXIgcWVtdSBkZWZjb25maWdzLgoKPiArQlIyX0xJTlVYX0tFUk5FTF9ERUZD
T05GSUc9InZpcnQiCj4gK0JSMl9MSU5VWF9LRVJORUxfQ09ORklHX0ZSQUdNRU5UX0ZJTEVTPSJi
b2FyZC9xZW11L202OGstdmlydC9saW51eC5mcmFnbWVudCIKPiArQlIyX0xJTlVYX0tFUk5FTF9Y
Wj15Cj4gK0JSMl9QQUNLQUdFX0JVU1lCT1hfU0hPV19PVEhFUlM9eQo+ICtCUjJfUEFDS0FHRV9L
RVhFQz15CgogIFRoaXMgaXMgc2VsZWN0ZWQgYXV0b21hdGljYWxseSBieSBwZXRpdGJvb3QuCgo+
ICtCUjJfUEFDS0FHRV9LRVhFQ19aTElCPXkKCiAgV2h5IGlzIHRoaXMgbmVlZGVkPwoKPiArQlIy
X1BBQ0tBR0VfRVRIVE9PTD15Cj4gK0JSMl9QQUNLQUdFX05FVF9UT09MUz15Cj4gK0JSMl9QQUNL
QUdFX05FVENBVD15Cj4gK0JSMl9QQUNLQUdFX1JTWU5DPXkKCiAgV2h5IGFyZSB0aGUgZm91ciBh
Ym92ZSBuZWVkZWQ/CgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+ICtCUjJfUEFDS0FHRV9QRVRJVEJP
T1Q9eQo+ICtCUjJfVEFSR0VUX1JPT1RGU19DUElPPXkKPiArQlIyX1RBUkdFVF9ST09URlNfQ1BJ
T19YWj15Cj4gKyMgaG9zdC1xZW11IGZvciBnaXRsYWIgdGVzdGluZwo+ICtCUjJfUEFDS0FHRV9I
T1NUX1FFTVU9eQo+ICtCUjJfUEFDS0FHRV9IT1NUX1FFTVVfU1lTVEVNX01PREU9eQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
