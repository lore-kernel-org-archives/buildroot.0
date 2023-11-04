Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B39C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E236400BD;
	Sat,  4 Nov 2023 17:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E236400BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UPzCQ86XRccJ; Sat,  4 Nov 2023 17:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BF7640128;
	Sat,  4 Nov 2023 17:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BF7640128
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1719E1BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E471260AC6
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E471260AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LlBB3f8Mm9x6 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:55:17 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D303760AB2
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D303760AB2
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9a58dbd5daeso482023166b.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 10:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699120515; x=1699725315;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yi+2c6MwlJmbXT4PZUUfHYisC/cg4pY4jATs/50JN5I=;
 b=qlihUVH3f46fDVWHFZFqhKicznpmTvUza3+YOeAULo6xxg7T9Y2uK3Etdczu6Sbybw
 NnaWW+9UqTOK0gcj1H8uYG9fza8Z88Qy8iqiQ3ZMUgef25/DHmeqn6uGihu6SY82gheb
 3B04Bqa7/jBJA/tRapUDnP6aEHJbv/V8d/YAxjeFFu5zCO6mXfW3EgJ61srLXqJLejXX
 orNSX0X/Iof6LPjE7sY0psP31LaUy1AEzpNTaP/KVozI6CdqsyXhF9rQnWthZy6Qbh5j
 X7VVBxb+QsixQLwCU9rpbufCNb/mr2OgsyOXBEK6uVQcCEV+QPaQouMRAp4jv6VQJVDq
 hVig==
X-Gm-Message-State: AOJu0Yy9mU/k68d2B3JV5Mm114jKfaU1Rr9qmCX1+vgcAtOtXG67L5e4
 DJTM5XMIdJAxCJyb3R2NHE/oFQ==
X-Google-Smtp-Source: AGHT+IF872FjEEmy7grtPxIptOcLn+KtfN9cWaShWJnuOLnbBeDaz3fofF8qpVfu6RpBBjRtjqKF8A==
X-Received: by 2002:a17:907:60d2:b0:9c6:8190:359f with SMTP id
 hv18-20020a17090760d200b009c68190359fmr10860655ejc.33.1699120515101; 
 Sat, 04 Nov 2023 10:55:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a170906368100b0099bd453357esm2167290ejc.41.2023.11.04.10.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 10:55:14 -0700 (PDT)
Message-ID: <3e5949fe-5d4e-4d48-b9ef-4088c19d792e@mind.be>
Date: Sat, 4 Nov 2023 18:55:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
 <20231026092701.12345-16-adam.duskett@amarulasolutions.com>
 <c8a18ebb-1b1c-4e4f-b855-ba1241257a14@mind.be>
In-Reply-To: <c8a18ebb-1b1c-4e4f-b855-ba1241257a14@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699120515; x=1699725315; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yi+2c6MwlJmbXT4PZUUfHYisC/cg4pY4jATs/50JN5I=;
 b=eH0HRFh4gjs7G/UDASUiaXezEuJK2ubLOI0vx/NfOwh2PhuZmdK5j9825w1GpjMPFh
 5StlFUhk4uAeQJiDxOEwKh0l4QJ9Yd42yjoiQ9kPX66ZQuSpxzBNzJZ9vqZbUNaUzonN
 FUq9JxSeO+BHoU1Fb6Gkq0wsH5can1AXB9r4o7OYBfjqfez3Mz0MWLgPC0OxdvnYKS2d
 MrdNDlVCWSPdjuGipR+9h4oGzwVPtD5O6NnKTtjTe6YI9U8+7Nb+zbyHRssNg9KPG2AW
 cPZYJ5UTBxSjRc/yo+5ycDCkCHlEVc+qldbXJ5OCOW31A0eb9YIrsOsaFoRyORmmsikI
 wUSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eH0HRFh4
Subject: Re: [Buildroot] [PATCH 15/30] package/scons: bump version to 4.5.2
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA0LzExLzIwMjMgMTg6NTQsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+IMKgSGkg
QWRhbSwKPgo+IE9uIDI2LzEwLzIwMjMgMTE6MjYsIEFkYW0gRHVza2V0dCB3cm90ZToKPj4gU2Nv
bnMgaXMgYSBzZXR1cHRvb2xzIHBhY2thZ2Ugbm93Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBZGFt
IER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29sdXRpb25zLmNvbT4KPj4gLS0tCj4+IMKg
IHBhY2thZ2Uvc2NvbnMvc2NvbnMuaGFzaCB8IDQgKystLQo+PiDCoCBwYWNrYWdlL3Njb25zL3Nj
b25zLm1rwqDCoCB8IDcgKysrKy0tLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc2NvbnMvc2Nv
bnMuaGFzaCBiL3BhY2thZ2Uvc2NvbnMvc2NvbnMuaGFzaAo+PiBpbmRleCBhNzJmYmFlZTVhLi40
OGI1MDc3YjJlIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3Njb25zL3Njb25zLmhhc2gKPj4gKysr
IGIvcGFja2FnZS9zY29ucy9zY29ucy5oYXNoCj4+IEBAIC0xLDMgKzEsMyBAQAo+PiDCoCAjIExv
Y2FsbHkgY29tcHV0ZWQ6Cj4+IC1zaGEyNTYgNzgwMWYzZjYyZjY1NDUyOGUyNzJkZjc4MGJlMTBj
MGU5MzM3ZTg5NzY1MGI2MmRkY2VlOWYzOWZkZTEzZjhmYiAKPj4gc2NvbnMtMy4xLjIudGFyLmd6
Cj4+IC1zaGEyNTYgNzJlZDg4OTE2NWZiMjgzNzhjYWRhYzE0NTUyYmU0YTk1OWYxZWJhYjZiMTQ4
YWJiNWRkMmI0OTcxMmMzYzZmNiAKPj4gTElDRU5TRS50eHQKPj4gK3NoYTI1NiBjZTI2YWFjOTVk
MzUwYTc5YTQxOTIxOTZiMGJlYWMzY2IyNGY0Y2NhYmNlMDEyM2ViMjhkMzM3MGY1NzZmMDcyIAo+
PiBTQ29ucy00LjUuMi50YXIuZ3oKPj4gK3NoYTI1NiAyZjZhYzlhMWZjOTgzOTRkMThiODBkYmE5
YmVkYjlkNTYyNjAwNmQ0NGRiM2ZlY2Y3Y2YzZTIxY2ZmN2U4YjFjIExJQ0VOU0UKPgo+IMKgVGhl
IGxpY2Vuc2UgaGFzaCBjaGFuZ2VkLiBDYW4geW91IHJlcG9ydCBpbiB0aGUgY29tbWl0IG1lc3Nh
Z2Ugd2h5IGl0IGNoYW5nZWQgCj4gKGkuZS4sIGRpZCBzb21ldGhpbmcgY2hhbmdlIGFib3V0IHRo
ZSBsaWNlbnNlPykKCiDCoElkZWFsbHkgd2l0aCBgZGlmZiAtd2Agb3V0cHV0LgoKCiDCoFJlZ2Fy
ZHMsCiDCoEFybm91dAoKCj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc2NvbnMvc2NvbnMubWsg
Yi9wYWNrYWdlL3Njb25zL3Njb25zLm1rCj4+IGluZGV4IDZiNzVkM2RkY2EuLjc2N2NmNjRiMjYg
MTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2Uvc2NvbnMvc2NvbnMubWsKPj4gKysrIGIvcGFja2FnZS9z
Y29ucy9zY29ucy5tawo+PiBAQCAtNCwxMSArNCwxMiBAQAo+PiDCoCAjCj4+ICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4+IMKgIC1TQ09OU19WRVJTSU9OID0gMy4xLjIKPj4gK1NDT05TX1ZFUlNJ
T04gPSA0LjUuMgo+Cj4gwqBUaGF0J3MgYSBwcmV0dHkgYmlnIGJ1bXAuIEhhdmUgeW91IHRlc3Rl
ZCBpZiB0aGUgc2NvbnMgcGFja2FnZXMgKGJlbmVqc29uLCAKPiBncHNkLCBtb25nb2RiKSBzdGls
bCBidWlsZD8KPgo+IMKgUmVnYXJkcywKPiDCoEFybm91dAo+Cj4+ICtTQ09OU19TT1VSQ0UgPSBT
Q29ucy0kKFNDT05TX1ZFUlNJT04pLnRhci5nego+PiDCoCBTQ09OU19TSVRFID0gCj4+IGh0dHA6
Ly9kb3dubG9hZHMuc291cmNlZm9yZ2UubmV0L3Byb2plY3Qvc2NvbnMvc2NvbnMvJChTQ09OU19W
RVJTSU9OKQo+PiDCoCBTQ09OU19MSUNFTlNFID0gTUlUCj4+IC1TQ09OU19MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRS50eHQKPj4gLVNDT05TX1NFVFVQX1RZUEUgPSBkaXN0dXRpbHMKPj4gK1NDT05T
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4+ICtTQ09OU19TRVRVUF9UWVBFID0gc2V0dXB0b29s
cwo+PiDCoCDCoCBIT1NUX1NDT05TX0lOU1RBTExfT1BUUyA9IFwKPj4gwqDCoMKgwqDCoCAtLWlu
c3RhbGwtbGliPSQoSE9TVF9ESVIpL2xpYi9zY29ucy0kKFNDT05TX1ZFUlNJT04pCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
