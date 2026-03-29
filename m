Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AB8F3D605
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 16:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DE5880CAB;
	Sun, 29 Mar 2026 16:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fv6fzWAE6zVU; Sun, 29 Mar 2026 16:20:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0C1780CDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774801223;
	bh=4Yd0rJTZoN/7RbFluTWAJwApqLXkloiW5D7U47BhEDM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=TfII2HtJyjfYQWklNKEA7JI9Hb3QQGi4huLd5I2+ztnOnlxlqGT9Q2Nsq6zKb1VTp
	 h96RKwm6H636gffQCfX/iTnKD2a6Uqe90MXtxRuhIr09ZGQSgKfRShXoIXje/7lbya
	 XABmlwhEe07iPUBoqYjuWE4ODMMJjKkcLbKnDaZYVl0Kq/xRmnUabPvwZQ9x3oTO1a
	 +dmgGWxNCaRuJ9yZAOPe5Bn+sibF9vLs/ZDKMPStvPkkWxzLFuXbEifvK05tBVPV20
	 /RiHM+V4hEWdDP9lQ6ZYwW8PgOO6mGRbqnButU0xsLJee82wZh3kcUZ690xzNP2Qoe
	 cZHuhC1OSDZoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C1780CDA;
	Sun, 29 Mar 2026 16:20:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AAD7C2EB
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 16:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CA2F40202
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 16:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26x4z3h7yhwU for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 16:20:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B312A4020C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B312A4020C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B312A4020C
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 16:20:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDbx-1vEnFc1rX3-013Wgi; Sun, 29
 Mar 2026 18:20:17 +0200
Message-ID: <e08de844-666a-46f0-b178-4f378834855a@gmx.de>
Date: Sun, 29 Mar 2026 18:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Di Carlo <a.p.dicarlo@gmail.com>, buildroot@buildroot.org
References: <20260319022906.47253-1-a.p.dicarlo@gmail.com>
 <20260329154709.539516-1-a.p.dicarlo@gmail.com>
 <20260329154709.539516-2-a.p.dicarlo@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260329154709.539516-2-a.p.dicarlo@gmail.com>
X-Provags-ID: V03:K1:OrSCXZZtMMuYiOObJlZYHmK7BXwIoBH8FBOB4jRPZ22ge4LrCFA
 Kenu93pWRsA8pAykj2GQzhRClDNE8xfT9yblodA0edNFAqyhEElPcuOeV571nz6evVD3XYy
 JVvAqXzOP0cd6xoJ29lp6jwP6xajXUX7WFDXhghUnrrsBoEca4dMGWZK97+vgGeV7QEUltk
 FT4cdcZ7axe8S/FVpKjlw==
UI-OutboundReport: notjunk:1;M01:P0:Cucp43f08IU=;mgD7fNbldKPuLyI8FoRbknY95YG
 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
 L4IS5OjkbRj/HzND6nI0pdkQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1774801217; x=1775406017; i=fiona.klute@gmx.de;
 bh=vTahQLm/Z+hsWpLe+l/aAjJj3EVqkBjBY17R4BgwHfk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=AlWuA4Ulchu1aLwe0wUVEJAnPw1uFMe8Urv9IX58RKR5VuPZn0DsFLHtp2E6htkR
 Bl/+NwEp/9jQZyldiigSit719vGrZIPgly9EfDa1wjcdlrxU6yajN3xCquzYB8q/B
 N+EDWAL/vje2/ugBP9mjpJx/DhoJKh4V2h/+YFy0cM/mUylO/IK3fOkBiRlJmvryC
 YoAlHt+9LpZan2RuFbuXKJFLuEHpniaJniuSjig2t2gZsl6MHr75NTSq3/ISB76RV
 topk7OkessJvQg9wLXgzIiC5UTVtqhDrT7MdQihDhQ9dAZi0TtwFjsn3yv1+gKgBs
 2ABcQfYyMG73PN3Nxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=AlWuA4Ul
Subject: Re: [Buildroot] [PATCH v2 1/3] package/gst1-plugins-base: if libdrm
 is enabled, make use of it
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMjkuMDMuMjYgdW0gMTc6NDcgc2NocmllYiBBZGFtIERpIENhcmxvOgo+IFRoaXMgZm9ybWFs
aXplcyB0aGUgcmVsYXRpb24gYmV0d2VlbiB0aGUgY29uZmlndXJhdGlvbiBvcHRpb24sIG5vdwo+
IGF1dG9tYXRpY2FsbHkgYWthIHJhbmRvbWx5IHNldCwgZGVwZW5kaW5nIG9uIHRoZSBzdGF0ZSBv
Zgo+IGxpYmRybSAoQlIyX1BBQ0tBR0VfTElCRFJNKS4gIFNpbmNlIHRoYXQgaG9zdCBkZXBlbmRl
bmN5IHdhcyBub3QKCmxpYmRybSBpcyBhIHRhcmdldCBwYWNrYWdlLCBub3QgYSBob3N0IHBhY2th
Z2UuIEkgYXNzdW1lIHRoaXMgc2hvdWxkIGJlIAoiU2luY2UgdGhhdCBkZXBlbmRlbmN5IFvigKZd
Ij8KCkJlc3QgcmVnYXJkcywKRmlvbmEKCj4gcHJldmlvdXNseSBub3RlZCwgY29uZmlndXJlIHdv
dWxkIHNvbWV0aW1lcyBjaG9vc2Ugb25lIHdheSBvciBhbm90aGVyLAo+IGJ1dCB1c3VhbGx5IHdp
dGhvdXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWRhbSBEaSBDYXJsbyA8YS5wLmRpY2FybG9AZ21h
aWwuY29tPgo+IC0tLQo+ICAgcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1Z2lucy1iYXNlL2dz
dDEtcGx1Z2lucy1iYXNlLm1rIHwgNyArKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLXBsdWdp
bnMtYmFzZS9nc3QxLXBsdWdpbnMtYmFzZS5tayBiL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLXBs
dWdpbnMtYmFzZS9nc3QxLXBsdWdpbnMtYmFzZS5tawo+IGluZGV4IGFkZmI0MDczODYuLjQ2N2Ux
NTQxNGIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1Z2lucy1iYXNl
L2dzdDEtcGx1Z2lucy1iYXNlLm1rCj4gKysrIGIvcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1
Z2lucy1iYXNlL2dzdDEtcGx1Z2lucy1iYXNlLm1rCj4gQEAgLTQ3LDYgKzQ3LDEzIEBAIGVsc2UK
PiAgIEdTVDFfUExVR0lOU19CQVNFX0NPTkZfT1BUUyArPSAtRGludHJvc3BlY3Rpb249ZGlzYWJs
ZWQKPiAgIGVuZGlmCj4gICAKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9MSUJEUk0pLHkpCj4gK0dT
VDFfUExVR0lOU19CQVNFX0NPTkZfT1BUUyArPSAtRGRybT1lbmFibGVkCj4gK0dTVDFfUExVR0lO
U19CQVNFX0RFUEVOREVOQ0lFUyArPSBsaWJkcm0KPiArZWxzZQo+ICtHU1QxX1BMVUdJTlNfQkFT
RV9DT05GX09QVFMgKz0gLURkcm09ZGlzYWJsZWQKPiArZW5kaWYKPiArCj4gICBpZmVxICgkKEJS
Ml9QQUNLQUdFX09SQykseSkKPiAgIEdTVDFfUExVR0lOU19CQVNFX0RFUEVOREVOQ0lFUyArPSBv
cmMKPiAgIEdTVDFfUExVR0lOU19CQVNFX0NPTkZfT1BUUyArPSAtRG9yYz1lbmFibGVkCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
