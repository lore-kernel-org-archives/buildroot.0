Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F89C4829E
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 18:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20504403E5;
	Mon, 12 Feb 2024 18:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yOs9uyJwcakA; Mon, 12 Feb 2024 18:13:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E313E40278
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E313E40278;
	Mon, 12 Feb 2024 18:13:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 781D81BF35E
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 18:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6531682036
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 18:13:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PxlndO1nb1G6 for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 18:13:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.234.176.197;
 helo=aposti.net; envelope-from=paul@crapouillou.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B9D482035
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B9D482035
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B9D482035
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 18:13:54 +0000 (UTC)
Message-ID: <80b6517820300e318ea9b5c89572115f5d4c3a44.camel@crapouillou.net>
From: Paul Cercueil <paul@crapouillou.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Adam Duskett
 <adam.duskett@amarulasolutions.com>
Date: Mon, 12 Feb 2024 19:13:48 +0100
In-Reply-To: <20240205222949.2805f50f@windsurf>
References: <20240121204252.152952-1-adam.duskett@amarulasolutions.com>
 <20240121204252.152952-2-adam.duskett@amarulasolutions.com>
 <20240205222949.2805f50f@windsurf>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZMLQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5UzFZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtNz8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe+rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIPdlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7Urf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KFlBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFCqaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IW
 YXndJO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN7062DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOtX0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEAAYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmcGu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2zMcLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2cLUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; s=mail; t=1707761630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TSv7xrR3grot12SWWuCjhebfS8ErhzAOaoaNKMiKD9E=;
 b=ukXs2utXrAVhmqEhSyV2I4i3PFowS3wiD4kIkcxUl3fd8QDvdubdGq/H4qBCx1ULxuPmYO
 zlhhuhmD2h19BZ5xYYGvdvzu6J89QMqPPlUJsiPfEZoNajZIigp1atSvfweFQ73UYd1gMq
 jZ6E1DRZGdvPSsJ8cKCNISSmFbp6+BQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=crapouillou.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=ukXs2utX
Subject: Re: [Buildroot] [PATCH 2/2] package/wlroots: Update patch with
 upstream status
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGF0Y2hlcyB3ZXJlIG1lcmdlZCB1cHN0cmVhbSwgYm90aCBpbiB3bHJvb3RzIGFuZCB1Q2xpYmM6
CgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2xyb290cy93bHJvb3RzLy0vbWVyZ2Vf
cmVxdWVzdHMvNDU0MApodHRwczovL21haWxtYW4ub3BlbmFkay5vcmcvbWFpbG1hbjMvaHlwZXJr
aXR0eS9saXN0L2RldmVsQHVjbGliYy1uZy5vcmcvdGhyZWFkL09NTUdTUDdQRFhRRE9RTlVYVEtS
RzVEV0VMQUQyQ0lJLwoKQ2hlZXJzLAotUGF1bAoKCkxlIGx1bmRpIDA1IGbDqXZyaWVyIDIwMjQg
w6AgMjI6MjkgKzAxMDAsIFRob21hcyBQZXRhenpvbmkgYSDDqWNyaXTCoDoKPiBIZWxsbyBBZGFt
LAo+IAo+ICtQYXVsIENlcmN1ZWlsIGluIENjLCBzZWUgYmVsb3cuCj4gCj4gT24gU3VuLCAyMSBK
YW4gMjAyNCAxMzo0Mjo1MiAtMDcwMAo+IEFkYW0gRHVza2V0dCA8YWRhbS5kdXNrZXR0QGFtYXJ1
bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPiAKPiA+IHBhY2thZ2Uvd2xyb290cy8wMDAxLUFkZC1m
ZWF0dXJlLW1hY3Jvcy10by1tb3JlLUMtZmlsZXMtLnBhdGNoIGhhcwo+ID4gYmVlbgo+ID4gcmVq
ZWN0ZWQgdXBzdHJlYW0sIGFuZCB0aGUgaW5pdGlhbCBwdWxsIHJlcXVlc3Qgd2FzIG1vdmVkIHRv
IHRoZQo+ID4gZnJlZWRlc2t0b3AgZ2l0bGFiLiBVcGRhdGUgdGhlIHBhdGNoIHRvIHJlZmxlY3Qg
dGhlc2UgY2hhbmdlcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQWRhbSBEdXNrZXR0IDxhZGFt
LmR1c2tldHRAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gCj4gVGhhbmtzLCBhcHBsaWVkIQo+IAo+
IFBhdWw6IGNvdWxkIHlvdSBmb2xsb3ctdXAgd2l0aCB1cHN0cmVhbSAoZWl0aGVyIHdscm9vdHMs
IG9yIHVjbGliYywKPiBvcgo+IGJvdGgpIHRvIHRyeSB0byBmaW5kIGFuIGFjY2VwdGFibGUgc29s
dXRpb24gc28gdGhhdCBzb21lIGRheSB3ZSBjYW4KPiBkcm9wIHRoaXMgcGF0Y2g/Cj4gCj4gVGhh
bmtzIGEgbG90IQo+IAo+IFRob21hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
