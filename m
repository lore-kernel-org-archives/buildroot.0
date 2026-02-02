Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36C5E73151
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 09:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 964F140093;
	Mon,  2 Feb 2026 09:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1Du4xdlNync; Mon,  2 Feb 2026 09:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C4C440177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770025873;
	bh=dwm+SUL4/JVOyPsyCNGkzYtM6XF4PiojKQGo/BjFq5Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ky83dF6lzy0eFBdtGsRBc3wVcMiQOXoAArI7j7rpGLaKDgs8OqwhNrsRbf05o2k2M
	 552QaJ+5JR/7gFLNUgIJ3U4D9jCr0EoC1fh441PE+Dgsbhd5lXGZDp4LTuru8w9dvM
	 FLrmCjdxt5gru6QPZwZCNFMarBouFEmGMLlycnS8ajB//qPlRh9A0UUNZB4LK1BoIy
	 Vx/rXchhxn50YHCwvFJoWOX+EJJommiluGIEtfIupm/UMfxMmtD8J+t6rYWgtg5Gmt
	 mgiIhTla9g2DpFARBLahfue2jtCaG8VtDc6Ok9M59fldzubi8YGRzRMg67o9qJBAkq
	 bvMbjNMsEBT6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C4C440177;
	Mon,  2 Feb 2026 09:51:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 299EB149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 09:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16F7F407E3
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 09:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEf_ZNc9a-Wb for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 09:51:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 887F040A15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 887F040A15
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 887F040A15
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 09:51:10 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso8649165e9.0
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 01:51:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770025868; x=1770630668;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HNHGNqq/wRewe/wdsXIpSk1sTeMvFbZ9GdLF+mlOBVA=;
 b=YkAlcL5D187RPQ8qXCiBjs3UbvaDP9/4f00L2iyQQosPcM/9A1HMuqO1TW5NyNubX/
 wbhH3HnU5WDNbZ7NRw5Oy/Bc945EDBFGRkobJ6qWlWQZUwuChsOAkf79A74iOaYzg4kv
 mqUebJ/Yi9WbQ6ehKwlbywZqMLtfiumjQ72qr5WtS/0GuRnxtm3VCJfEPBELRL7u/qSA
 r5h2rrtOq8iSea7Rx+MK/hzSFRkm6aoz22vkL53Dj8wnsOo3R9j+FdBTMTXFgwYoHBqL
 arLeiZ1ewH2dEp81Ooyg1lVbr3SzjRzKPPAruuf8+vnERQRyhwOTr4Ymtp9KPBY9At80
 Bx3A==
X-Gm-Message-State: AOJu0YzSt+efwbaAvIpkj/N3zmPNmKD0KII/ibXkbx+Dg4n4DB8osf9d
 /hNDJRKRRuuc6oMXbfjRTqnHOWGPOCHORVw7VYLKyC8QlGlPmUS5FWujeaUyfDFn+uI=
X-Gm-Gg: AZuq6aKmxNGxv6g12Rl4dILqnw/XyVCqKWWX345kpoal8ukpgRFC/34IvDFoxAzk//Z
 sXZ7qu6fl13r6JS9eL7rrkrVO9bFf29DjyeTFoGHgDlLIGvvgjDqQ2GqRnUTgmcbkbmrmutQaPw
 7hBRdzgGYYg4wtZwzKXbgCs47PcimqOBd8TXhep+0TunXHzwrwjfOET9pABClPSI8weQ4CA2D13
 nT/nTCPv+Xv2ZboH19SkmxRSnrZwaD7ZTDriPMDQx2ErrF3wbrDgIXLuCrgv6yqv8OCG0IgPFXo
 SJVD/AmvnAdsvx/WtuYoZqwd87zuCOGSrDU+wVSWZJzG+mT+4qwdzv7EAedVMBDE/w6/AoLkq3y
 e1UzOhO9SWY8I7z3EDhTIhxzpdbOsS/7w01Q3E58vtgB2LLd4oHwKPXazwr6o0iFrXRCaMrvN8X
 DDuaT6zuvUkdHVvk9pBEjQcKT6e8Qrz/qPCRogYPC1cQJQqyr6N2Dx
X-Received: by 2002:a05:600c:2dc8:b0:47e:e452:ec12 with SMTP id
 5b1f17b1804b1-4808493b38cmr120802565e9.15.1770025868225; 
 Mon, 02 Feb 2026 01:51:08 -0800 (PST)
Received: from [172.16.2.208] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cddffe9sm553231345e9.4.2026.02.02.01.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 01:51:07 -0800 (PST)
Message-ID: <39a51a3a-816f-4666-bfa1-4ed769cf88a3@smile.fr>
Date: Mon, 2 Feb 2026 10:51:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
References: <20260124131337.1022030-1-ju.o@free.fr>
 <20260124131337.1022030-3-ju.o@free.fr>
 <82fffd9a-dcd8-4dc6-8f33-c85e8d3f836c@smile.fr>
 <a3c30c525a648b03b3ee9755fdcd6a4d@free.fr>
Content-Language: en-US
In-Reply-To: <a3c30c525a648b03b3ee9755fdcd6a4d@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770025868; x=1770630668; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HNHGNqq/wRewe/wdsXIpSk1sTeMvFbZ9GdLF+mlOBVA=;
 b=lYgh9AWQQ52t6NMNUyi3T1n03Btw2jCniMwTnu7LsFfxxrQkXgYQSuCNKDiYLF5Pfs
 4oyiajT1gLCOT4iTM8DHl4ArSGUZZkAbTLwDMO1SNdNFRwk9iLHkspPTPdLLE5zlmDf4
 KKETALfnMR0yTBaZME1vPwpxz9JAB2aNwJO44=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=lYgh9AWQ
Subject: Re: [Buildroot] [PATCH 3/3] boot/edk2: bump to version
 edk2-stable202511
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

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAwMS8wMi8yMDI2IMOgIDIyOjUzLCBKdWxpZW4gT2xpdmFp
biBhIMOpY3JpdMKgOgo+IEhpIFJvbWFpbiwKPiAKPiBPbiAwMS8wMi8yMDI2IDIyOjIxLCBSb21h
aW4gTmFvdXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4gSGVsbG8gSnVsaWVuLAo+Pgo+PiBMZSAy
NC8wMS8yMDI2IMOgIDE0OjEzLCBKdWxpZW4gT2xpdmFpbiBhIMOpY3JpdMKgOgo+Pj4gRm9yIHJl
bGVhc2Ugbm90ZXMgc2luY2UgZWRrMi1zdGFibGUyMDI1MDgsIHNlZToKPj4+IGh0dHBzOi8vZ2l0
aHViLmNvbS90aWFub2NvcmUvZWRrMi9yZWxlYXNlcy90YWcvZWRrMi1zdGFibGUyMDI1MTEKPj4+
Cj4+PiBUaGlzIGNvbW1pdCBhbHNvIHVwZGF0ZXMgdGhlIGVkazItcGxhdGZvcm1zIHBhY2thZ2Vz
IHdpdGggdGhlIGxhc3QKPj4+IGNvbW1pdCBtZXJnZWQgYXQgdGhlIGVkazIgcmVsZWFzZSBkYXRl
ICgyMDI1LTExLTE5KSwgd2hpY2ggY29ycmVzcG9uZHMKPj4+IHRvIGNvbW1pdCBbMV0uCj4+PiBU
aGUgZWRrMi1ub24tb3NpIHBhY2thZ2UgaXMgYWxzbyB1cGRhdGVkIHRoZSBzYW1lIHdheSwgd2hp
Y2gKPj4+IGNvcnJlc3BvbmRzIHRvIGNvbW1pdCBbMl0uCj4+Pgo+Pj4gVGhpcyBjb21taXQgYWxz
byBhZGRzIGFuIGVkazItcGxhdGZvcm1zIHBhY2thZ2UgcGF0Y2ggdG8gZml4IGEgTWFydmVsbAo+
Pj4gYnVpbGQgZmFpbHVyZSBzZWVuIHdpdGggdGhlIFNvbGlkUnVuIE1hY2NoaWF0b0JpbiBwbGF0
Zm9ybS4KPj4+Cj4+PiBUaGlzIGNvbW1pdCBoYXMgYmVlbiBydW50aW1lIHRlc3RlZCB3aXRoIHRl
c3RzIHVzaW5nIEVESzIgcGFja2FnZSwKPj4+IHdpdGggY29tbWFuZHM6Cj4+Pgo+Pj4gwqDCoMKg
IHN1cHBvcnQvdGVzdGluZy9ydW4tdGVzdHMgXAo+Pj4gwqDCoMKgwqDCoMKgwqAgLWQgZGwgLW8g
b3V0cHV0X2ZvbGRlciBcCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRlc3RzLmJvb3QudGVz
dF9lZGsyIFwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGVzdHMuYm9vdC50ZXN0X2dydWIu
VGVzdEdydWJBQXJjaDY0RUZJIFwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGVzdHMuYm9v
dC50ZXN0X2dydWIuVGVzdEdydWJSaXNjVjY0RUZJIFwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgdGVzdHMuYm9vdC50ZXN0X2dydWIuVGVzdEdydWJYODY2NEVGSSBcCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHRlc3RzLnBhY2thZ2UudGVzdF9md3RzCj4+Pgo+Pj4gSXQgaGFzIGFsc28g
YmVlbiBydW50aW1lIHRlc3RlZCAoYnkgYm9vdGluZyBpbiBxZW11KSB3aXRoIGRlZmNvbmZpZ3MK
Pj4+IHVzaW5nIEVESzIgcGFja2FnZToKPj4+IHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZwo+
Pj4gcWVtdV9sb29uZ2FyY2g2NF92aXJ0X2VmaV9kZWZjb25maWcKPj4+IHFlbXVfcmlzY3Y2NF92
aXJ0X2VmaV9kZWZjb25maWcKPj4+IHFlbXVfeDg2XzY0X2VmaV9kZWZjb25maWcKPj4+Cj4+PiBb
MV0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyLXBsYXRmb3Jtcy8KPj4+IGNvbW1p
dC8xZTY0YzExMDlhZTJhYzAxODUzNTFlOGQwYzE5NzMyOTcwZDRmZWNmCj4+PiBbMl0gaHR0cHM6
Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyLW5vbi1vc2kvCj4+PiBjb21taXQvOTRkMDQ4OTgx
MTE2ZTJlM2VkYTUyZGFkMWE4OTk1OGVlNDA0MDk4ZAo+Pj4KPj4+IENjOiBEaWNrIE9sc3NvbiA8
aGlAc2VuemlsbGEuaW8+Cj4+PiBDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUu
ZnI+Cj4+PiBDYzogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+Pj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPj4+IC0tLQo+Pj4g
VGhlIGVkazItcGxhdGZvcm1zIHBhdGNoIGNvbnRhaW5zIENSLUxGIGxpbmUgZW5kaW5ncywgd2hp
Y2ggbWlnaHQgYmUgY2hhbmdlZAo+Pj4gYnkgdGhlIG1haWxpbmcgbGlzdCB0byBMRi4gVGhpcyBj
YW4gbWFrZSB0aGUgcGF0Y2ggbm90IGFwcGx5IGNsZWFubHkuIEZvcgo+Pj4gY29udmVuaWVuY2Us
IEkgYWxzbyBwdWJsaXNoZWQgdGhvc2UgcGF0Y2hlcyBhdDoKPj4+IGh0dHBzOi8vZ2l0bGFiLmNv
bS9qb2xpdmFpbi9idWlsZHJvb3QvLS9jb21taXRzL2J1bXBfZWRrMi1zdGFibGUyMDI1MTEKPj4+
IC0tLQo+Pj4gwqBDb25maWcuaW4ubGVnYWN5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNyArKwo+Pj4gwqBib290L2VkazIvQ29u
ZmlnLmluwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8IDEyICstLQo+Pj4gwqBib290L2VkazIvZWRrMi5oYXNowqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+Pj4gwqBib290L2VkazIv
ZWRrMi5ta8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgMTUgKy0tLQo+Pj4gwqBwYWNrYWdlL2VkazItbm9uLW9zaS9lZGsyLW5vbi1vc2ku
aGFzaMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4+PiDCoHBhY2thZ2UvZWRrMi1ub24tb3NpL2Vk
azItbm9uLW9zaS5ta8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+Pj4gwqAuLi5NYXJ2ZWxs
LWZpeC1TTUJJT1MtdHlwZS03LXN0cnVjdHVyZXMucGF0Y2ggfCA4MCArKysrKysrKysrKysrKysr
KysrCj4+PiDCoHBhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvZWRrMi1wbGF0Zm9ybXMuaGFzaMKgwqDC
oCB8wqAgMiArLQo+Pj4gwqBwYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1zLm1r
wqDCoMKgwqDCoCB8wqAgMiArLQo+Pj4gwqA5IGZpbGVzIGNoYW5nZWQsIDk3IGluc2VydGlvbnMo
KyksIDI3IGRlbGV0aW9ucygtKQo+Pj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9lZGsy
LXBsYXRmb3Jtcy8wMDAxLVNpbGljb24tTWFydmVsbC1maXgtU01CSU9TLQo+Pj4gdHlwZS03LXN0
cnVjdHVyZXMucGF0Y2gKPj4+Cj4+Cj4+IC4uLgo+Pgo+Pj4gZGlmZiAtLWdpdCBhL2Jvb3QvZWRr
Mi9lZGsyLm1rIGIvYm9vdC9lZGsyL2VkazIubWsKPj4+IGluZGV4IDJjMDg5YWVmY2EuLmRiYTRh
ZWQ1MTMgMTAwNjQ0Cj4+PiAtLS0gYS9ib290L2VkazIvZWRrMi5tawo+Pj4gKysrIGIvYm9vdC9l
ZGsyL2VkazIubWsKPj4+IEBAIC00LDcgKzQsNyBAQAo+Pj4gwqAjCj4+PiDCoAo+Pj4gIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPj4+Cj4+PiAtRURLMl9WRVJTSU9OID0gZWRrMi1zdGFibGUyMDI1
MDgKPj4+ICtFREsyX1ZFUlNJT04gPSBlZGsyLXN0YWJsZTIwMjUxMQo+Pj4gwqBFREsyX1NJVEUg
PSBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIKPj4+IMKgRURLMl9TSVRFX01FVEhP
RCA9IGdpdAo+Pj4gwqBFREsyX0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UtUGF0ZW50Cj4+PiBAQCAt
NTYsMTQgKzU2LDcgQEAgRURLMl9HSVRfU1VCTU9EVUxFUyA9IFlFUwo+Pj4gwqBFREsyX0JVSUxE
X1BBQ0tBR0VTID0gJChARCkvQnVpbGQvQnVpbGRyb290Cj4+PiDCoEVESzJfUEFDS0FHRVNfUEFU
SFMgPSAkKEBEKSAkKEVESzJfQlVJTERfUEFDS0FHRVMpICQoU1RBR0lOR19ESVIpL3Vzci9zaGFy
ZS8KPj4+IGVkazItcGxhdGZvcm1zCj4+Pgo+Pj4gLWlmZXEgKCQoQlIyX1RBUkdFVF9FREsyX1BM
QVRGT1JNX09WTUZfSTM4NikseSkKPj4+IC1FREsyX0FSQ0ggPSBJQTMyCj4+PiAtRURLMl9ERVBF
TkRFTkNJRVMgKz0gaG9zdC1uYXNtCj4+PiAtRURLMl9QQUNLQUdFX05BTUUgPSBPdm1mUGtnCj4+
PiAtRURLMl9QTEFURk9STV9OQU1FID0gT3ZtZlBrZ0lhMzIKPj4+IC1FREsyX0JVSUxEX0RJUiA9
IE92bWZJYTMyCj4+PiAtCj4+PiAtZWxzZSBpZmVxICgkKEJSMl9UQVJHRVRfRURLMl9QTEFURk9S
TV9PVk1GX1g2NCkseSkKPj4+ICtpZmVxICgkKEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9PVk1G
X1g2NCkseSkKPj4+IMKgRURLMl9BUkNIID0gWDY0Cj4+PiDCoEVESzJfREVQRU5ERU5DSUVTICs9
IGhvc3QtbmFzbQo+Pj4gwqBFREsyX1BBQ0tBR0VfTkFNRSA9IE92bWZQa2cKPj4+IEBAIC03NCwx
MyArNjcsMTMgQEAgZWxzZSBpZmVxICgkKEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9BUk1fVklS
VF9RRU1VKSx5KQo+Pj4gwqBFREsyX0FSQ0ggPSBBQVJDSDY0Cj4+PiDCoEVESzJfUEFDS0FHRV9O
QU1FID0gQXJtVmlydFBrZwo+Pj4gwqBFREsyX1BMQVRGT1JNX05BTUUgPSBBcm1WaXJ0UWVtdQo+
Pj4gLUVESzJfQlVJTERfRElSID0gJChFREsyX1BMQVRGT1JNX05BTUUpLSQoRURLMl9BUkNIKQo+
Pj4gK0VESzJfQlVJTERfRElSID0gJChFREsyX1BMQVRGT1JNX05BTUUpLUFBcmNoNjQKPj4+Cj4+
PiDCoGVsc2UgaWZlcSAoJChCUjJfVEFSR0VUX0VESzJfUExBVEZPUk1fQVJNX1ZJUlRfUUVNVV9L
RVJORUwpLHkpCj4+PiDCoEVESzJfQVJDSCA9IEFBUkNINjQKPj4+IMKgRURLMl9QQUNLQUdFX05B
TUUgPSBBcm1WaXJ0UGtnCj4+PiDCoEVESzJfUExBVEZPUk1fTkFNRSA9IEFybVZpcnRRZW11S2Vy
bmVsCj4+PiAtRURLMl9CVUlMRF9ESVIgPSAkKEVESzJfUExBVEZPUk1fTkFNRSktJChFREsyX0FS
Q0gpCj4+PiArRURLMl9CVUlMRF9ESVIgPSAkKEVESzJfUExBVEZPUk1fTkFNRSktQUFyY2g2NAo+
Pgo+PiBJdCBzZWVtcyB0aGUgY29tbWl0IGxvZyBkb2Vzbid0IGV4cGxhaW4gdGhpcyBjaGFuZ2Uu
Cj4gCj4gWW91IGFyZSBjb3JyZWN0LiBJIGZvcmdvdCB0byBpbmNsdWRlIHRoZSBleHBsYW5hdGlv
bi4KPiAKPiBUaGUgZm9sbG93aW5nIHRleHQgc2hvdWxkIGJlIGFkZGVkIGluIHRoZSBjb21taXQg
bG9nOgo+IAo+ICIiIgo+IFVwc3RyZWFtIGNvbW1pdCBbM10gcmVtb3ZlZCB0aGUgMzJiaXQgQVJN
IFZpcnR1YWwgUGxhdGZvcm1zLiBUaGUKPiBzcGVjaWZpYyBjaGFuZ2UgWzRdIGNoYW5nZWQgYSAi
JChBUkNIKSIgdG8gIkFBcmNoNjQiLiBQb3NzaWJsZQo+IHZhbHVlcyBmb3IgIiQoQVJDSCkiIHdl
cmUgIkFBUkNINjQiIG9yICJBUk0iLiBTaW5jZSBMaW51eCBoYXMKPiBhIGNhc2Ugc2Vuc2l0aXZl
IGZpbGVzeXN0ZW0sIHRoZSBFREsyX0JVSUxEX0RJUiB2YWx1ZXMgbmVlZHMgdG8gYmUKPiB1cGRh
dGVkIGFjY29yZGluZ2x5Lgo+IAo+IFszXSBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2Vk
azIvY29tbWl0Lwo+IGI0NzFlZDI5Njk0YzM3NWVhMWI2YjQ4NGViNzFhZjczZWQ2MWZlY2UKPiBb
NF0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL2NvbW1pdC8KPiBiNDcxZWQyOTY5
NGMzNzVlYTFiNmI0ODRlYjcxYWY3M2VkNjFmZWNlI2RpZmYtNTUyMDBhYzkzNGJiZTZlODFiYjQx
NThiZmZmNDc5Nzk5MmIxM2ZiMWFmYjk1ZmU5ODI4NTMwMjRjNjAxODQzMEwyMC1SMjEKPiAiIiIK
PiAKPiBGb3IgY29udmVuaWVuY2UsIEkndmUgYWxzbyBwdWJsaXNoZWQgdGhpcyB1cGRhdGVkIGNv
bW1pdCBsb2cgYXQ6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL2Nv
bW1pdHMvYnVtcF9lZGsyLXN0YWJsZTIwMjUxMV92Mgo+IAo+IFRlbGwgbWUgaWYgeW91IHdhbnQg
bWUgdG8gc2VuZCBhIHYyIG9uIHRoZSBsaXN0LgoKVGhhbmtzIGZvciB0aGUgdXBkYXRlLgoKRm9y
IHRoZSB1cGNvbWluZyAyMDI2LjAyIHJlbGVhc2UsIEknbSBub3Qgc3VyZSBpZiB3ZSBzaG91bGQg
bWVyZ2UgdGhpcyBzZXJpZXMKcmlnaHQgbm93LiBJbmRlZWQgdXBzdHJlYW0gRURLMiByZW1vdmVk
IHRoZSBJQTMyIHN1cHBvcnQsIHNvIHdlIGhhdmUgdG8gZm9sbG93CnVwc3RyZWFtIGNoYW5nZSBm
b3IgdGhlIGxvbmctdGVybSBidXQgd2Ugc3VkZGVubHkgcmVtb3ZlIGl0IGZyb20gQnVpbGRyb290
IHdoaWxlCnVwc3RyZWFtIHN0aWxsIHByb3ZpZGUgYSBzcGVjaWZpYyBicmFuY2ggZm9yICJhbnkg
bG9uZyB0ZXJtIGNvbnN1bWVycyIuCgpJbiBhbiBvdGhlciBoYW5kLCB0aGUgMjAyNi4wMiByZWxl
YXNlIHdpbGwgbm90IGJlIGFuIExUUyByZWxlYXNlIChzZWUKaHR0cHM6Ly9idWlsZHJvb3Qub3Jn
L2x0cy5odG1sKS4KClRob3VnaHRzPwoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+PiBCZXN0
IHJlZ2FyZHMsCj4+IFJvbWFpbgo+IAo+IEJlc3QgcmVnYXJkcywKPiAKPiBKdWxpZW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
