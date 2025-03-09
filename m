Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D62C28B2F
	for <buildroot@archiver.kernel.org>; Sun,  9 Mar 2025 12:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3678C8156D;
	Sun,  9 Mar 2025 12:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWOXw2OZ0tqa; Sun,  9 Mar 2025 12:42:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 161E782030
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 161E782030;
	Sun,  9 Mar 2025 12:42:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F21391C1
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 12:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3EA2400CB
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 12:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DpPVg-rCwmIi for <buildroot@buildroot.org>;
 Sun,  9 Mar 2025 12:42:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=kanakshilledar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 639B7400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 639B7400AC
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 639B7400AC
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 12:42:22 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-224172f32b3so5227055ad.2
 for <buildroot@buildroot.org>; Sun, 09 Mar 2025 05:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741524142; x=1742128942;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yBRi+zRs7SVOHVsEWhifVyCKyRmZodP4bd7CRE3PgK0=;
 b=jI47VEGDg6SZcnQCA8wiFePH6vJMNSxbbGjFoGhI2JbREL5v95sFeLFoS0ULVTgd3T
 WkoTjriJfCm2QbOPUGPKtSd+wVkfl8/99f1OYnABWnQ9Cx2Yy3bzWPTky/S3dEK6wU8X
 fMVePMmbmUsYF8Lo1GeHN/HTDKzL+0QrRcykq0Wc1k1WWaK6HPI3u5UVSlUuUQkmxf7R
 /zxEpla50GfLjydfluutQO/1aGOLz0Ls1lJdMGLlDYmhxrHMvXLyTM+tcrMq08dRK9uk
 dvld8e3o5B4dJfrkGFhv3QQJKJO/nUkn+dsQ5kenYoe60WlPaDCYJFXtjGIspKCe7eWF
 u1Zg==
X-Gm-Message-State: AOJu0YxcLUDGPdp9DdcxjhkXwsnjympyVSsd07Vw611uh3JPzdp1cdGv
 e85NM0wBRcQbt5LY8OwLu0zJROUTHl1WT9jl9lzM1/kg4ul+iF7WQF5bmt0/qGnXTvKWYqk0RWV
 H6OjVUHQ4g5Et7nS+xP6lryMQVhZSeTuc5Bg=
X-Gm-Gg: ASbGncvVuzZHnEqd6XC7EEaq865TDane/FvZpG8ap5peCppK3Mh1zWEQDuh6Qbd8ni1
 SI3H2ONsyLVPNATqh/lf7zJZFFw79MK03Tsdj033ijXgkr9MjUn00clhcfomAC91SY7sgDmMXca
 6Y4FOGe4mYXya62vR88zpW7wrjNfil
X-Google-Smtp-Source: AGHT+IGrBYObIGIX1KGznKsbZBylYVUvnIYsQZV8XheQc5QleMkeKWIoRLJFXZz/gkBSk7vknvDXmKFUCs6wtwsPOYU=
X-Received: by 2002:a17:903:2452:b0:212:48f0:5b6f with SMTP id
 d9443c01a7336-22541f971bdmr34593095ad.9.1741524141573; Sun, 09 Mar 2025
 05:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250308061245.1774235-2-kanakshilledar@gmail.com>
 <20250308061245.1774235-4-kanakshilledar@gmail.com>
 <2cbc27d4a30b7289256d80f1c7cb5807@free.fr>
In-Reply-To: <2cbc27d4a30b7289256d80f1c7cb5807@free.fr>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Sun, 9 Mar 2025 18:12:10 +0530
X-Gm-Features: AQ5f1JoKRbBx3QUtH8ZoEyFQhTF77QWzHF0zsowQnLCdVxMdTAPdtGlvjO7Vv_s
Message-ID: <CAGLn_=s_QZgS38bNein42jdqEwA5_4LoOdpzVqSnc-LKXmiP_Q@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Damien Le Moal <dlemoal@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741524142; x=1742128942; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yBRi+zRs7SVOHVsEWhifVyCKyRmZodP4bd7CRE3PgK0=;
 b=iPdLk1uhKoaOWZG1G8WcZ5LZvNQf/xVT36/5uazHk3/Bk9iricNS8X/Spk2cAN6e0u
 DMdpnSRq7QZjnL1AnC9d8er35aqdPmVx1+0UUmT1NJlds2PcOD4g39VRbKGEq4I3xePb
 bTCLnuwwsAFSOP/rPZkcDV4WM5uhxPb6X3FPPgJmHZ9HGvj4PxTAyDjLU683aSJWTaVY
 amCnUF5tb/QlwwxBd02s90ZiTi3NCElR0jdnXhiA8oo1hKj3P7rPQuTXav13TBYPk+pN
 mOb1pxuEMx8HT9X/1qPN4gVZzvQ1tEDzdMY3eUI3XuunsOB3nnR0KWciaSjEMlWt50Gb
 7iNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iPdLk1uh
Subject: Re: [Buildroot] [PATCH 2/2] configs/sipeed_licheepi_4a: add new
 board
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGV5IEp1bGllbiwKClRoYW5rcyBmb3IgcmV2aWV3aW5nIG15IHBhdGNoLiBJIGhhdmUgZm9sbG93
ZWQgeW91ciBjb21tZW50cyBhbmQgbWFkZQp0aGUgbmVjZXNzYXJ5IGNoYW5nZXMuClNlbmRpbmcg
dGhlIHYyIHBhdGNoIHNob3J0bHkuCgpPbiBTdW4sIE1hciA5LCAyMDI1IGF0IDQ6MzXigK9BTSBK
dWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPiB3cm90ZToKPgo+IEhpIEthbmFrLAo+Cj4gVGhh
bmtzIGZvciB0aGUgcGF0Y2ghCj4KPiBJIGhhdmUgZmV3IHF1ZXN0aW9ucy9jb21tZW50cywgc2Vl
IGJlbG93Lgo+Cj4gT24gMDgvMDMvMjAyNSAwNzoxMiwgS2FuYWsgU2hpbGxlZGFyIHdyb3RlOgo+
ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBMaWNoZWVQaSA0QSB3aXRoIG1haW5saW5lIGNvbXBvbmVu
dDoKPiA+ICAtIExpbnV4IEtlcm5lbCA2LjEyCj4gPgo+ID4gVGhlIGZvbGxvd2luZyBjb21wb25l
bnRzIGFyZSBwcm92aWRlZCBieSB2ZW5kb3I6Cj4gPiAgLSBVLUJvb3QgMjAyMC4wMQo+ID4gIC0g
T3BlblNCSSB2MC45Cj4gPgo+ID4gQm9hcmQgaG9tZXBhZ2UgYW5kIG1vcmUgdXNhYmxlIHdpa2k6
Cj4gPiAgLSBodHRwczovL3dpa2kuc2lwZWVkLmNvbS9oYXJkd2FyZS9lbi9saWNoZWUvdGgxNTIw
L2xwaTRhLzFfaW50cm8uaHRtbAo+ID4KPiA+IHRoMTUyMC1ib290LWZpcm13YXJlIGlzIHNlbGVj
dGVkIGZyb20gdGhlIHBhY2thZ2Ugc2lwZWVkLWxwaTRhYmlucy4KPiA+IFRoaXMgaXMgaW5zcGly
ZWQgZnJvbSBsb25lMCdzIGZvcmsgb2YgYnVpbGRyb290IGZvciB0aDE1MjAuWzFdCj4gPgo+ID4g
WzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9sb25lMC9idWlsZHJvb3QtdGgxNTIwCj4gPiBTaWduZWQt
b2ZmLWJ5OiBLYW5hayBTaGlsbGVkYXIgPGthbmFrc2hpbGxlZGFyQGdtYWlsLmNvbT4KPiA+IC0t
LQo+ID4gIC4uLi9zaXBlZWQvbGljaGVlcGlfNGEvZXh0bGludXgvZXh0bGludXguY29uZiB8ICA0
ICsrCj4gPiAgYm9hcmQvc2lwZWVkL2xpY2hlZXBpXzRhL2dlbmltYWdlLmNmZyAgICAgICAgIHwg
IDkgKysrKwo+ID4gIGJvYXJkL3NpcGVlZC9saWNoZWVwaV80YS9wb3N0LWltYWdlLnNoICAgICAg
ICB8IDI1ICsrKysrKysrKwo+ID4gIGJvYXJkL3NpcGVlZC9saWNoZWVwaV80YS9yZWFkbWUudHh0
ICAgICAgICAgICB8IDU0ICsrKysrKysrKysrKysrKysrKysKPiA+ICBjb25maWdzL3NpcGVlZF9s
aWNoZWVwaV80YV9kZWZjb25maWcgICAgICAgICAgfCA0MCArKysrKysrKysrKysrKwo+ID4gIDUg
ZmlsZXMgY2hhbmdlZCwgMTMyIGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
Ym9hcmQvc2lwZWVkL2xpY2hlZXBpXzRhL2V4dGxpbnV4L2V4dGxpbnV4LmNvbmYKPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgYm9hcmQvc2lwZWVkL2xpY2hlZXBpXzRhL2dlbmltYWdlLmNmZwo+ID4g
IGNyZWF0ZSBtb2RlIDEwMDc1NSBib2FyZC9zaXBlZWQvbGljaGVlcGlfNGEvcG9zdC1pbWFnZS5z
aAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9zaXBlZWQvbGljaGVlcGlfNGEvcmVhZG1l
LnR4dAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL3NpcGVlZF9saWNoZWVwaV80YV9k
ZWZjb25maWcKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYm9hcmQvc2lwZWVkL2xpY2hlZXBpXzRhL2V4
dGxpbnV4L2V4dGxpbnV4LmNvbmYKPiA+IGIvYm9hcmQvc2lwZWVkL2xpY2hlZXBpXzRhL2V4dGxp
bnV4L2V4dGxpbnV4LmNvbmYKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAw
MDAwMDAwLi5hZGQzOTU0MTg0Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9ib2FyZC9zaXBl
ZWQvbGljaGVlcGlfNGEvZXh0bGludXgvZXh0bGludXguY29uZgo+ID4gQEAgLTAsMCArMSw0IEBA
Cj4gPiArbGFiZWwgbGludXgKPiA+ICsgIGtlcm5lbCAvSW1hZ2UKPiA+ICsgIGRldmljZXRyZWUg
L3RoMTUyMC1saWNoZWUtcGktNGEuZHRiCj4gPiArICBhcHBlbmQgY29uc29sZT10dHlTMCwxMTUy
MDAgcm9vdD0vZGV2L21tY2JsazBwNCByb290ZnN0eXBlPWV4dDQKPiA+IHJvb3R3YWl0IHJ3IGVh
cmx5Y29uIGNsa19pZ25vcmVfdW51c2VkIGluaXQ9L3NiaW4vaW5pdAo+ID4gZGlmZiAtLWdpdCBh
L2JvYXJkL3NpcGVlZC9saWNoZWVwaV80YS9nZW5pbWFnZS5jZmcKPiA+IGIvYm9hcmQvc2lwZWVk
L2xpY2hlZXBpXzRhL2dlbmltYWdlLmNmZwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGlu
ZGV4IDAwMDAwMDAwMDAuLjdlZWY0NDY1ZGIKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2Jv
YXJkL3NpcGVlZC9saWNoZWVwaV80YS9nZW5pbWFnZS5jZmcKPiA+IEBAIC0wLDAgKzEsOSBAQAo+
ID4gK2ltYWdlIGJvb3QuZXh0NCB7Cj4gPiArICAgICBleHQ0IHsKPiA+ICsgICAgICAgICAgICAg
dXNlLW1rZTJmcyA9IHRydWUKPgo+IFdoeSAidXNlLW1rZTJmcyA9IHRydWUiIGlzIG5lZWRlZCBo
ZXJlPyBJIHRoaW5rIGl0IGlzIHRoZSBmaXJzdAo+IGNvbmZpZ3VyYXRpb24gaW4gQnVpbGRyb290
IHVzaW5nIGl0Lgo+Cj4gQ291bGQgeW91IGFkZCBhIGNvbW1lbnQgd2h5IGl0IGlzIG5lZWRlZD8g
KG9yIGl0IGlmIHdvcmtzCj4gd2l0aCB0aGUgZGVmYXVsdCB2YWx1ZSwgdGhlbiBpdCBjb3VsZCBi
ZSByZW1vdmVkKS4KCiJ1c2UtbWtlMmZzPXRydWUiIHdhcyBpbmRlZWQgbm90IHJlcXVpcmVkIGFu
ZCB0aGUgZGVmYXVsdCB2YWx1ZSB3b3JrZWQKanVzdCBmaW5lLgoKPiA+ICtIb3cgdG8gZmxhc2gg
dGhlIGJvYXJkCj4gPiArPT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiArCj4gPiArT25jZSB0
aGUgYnVpbGQgcHJvY2VzcyBpcyBmaW5pc2hlZCB5b3Ugd2lsbCBoYXZlIHRvIGZsYXNoIHRoZQo+
ID4gK2NvcnJlc3BvZGluZyBpbWFnZXMgdG8gdGhlIHJlc3BlY3RpdmUgcGFydGl0aW9ucyBpbiB0
aGUgZU1NQy4KPiA+ICtMaWNoZWVQaSA0QSB1c2VzIGZhc3Rib290IHRvIGZsYXNoIHRoZSBpbWFn
ZXMuCj4gPiArCj4gPiArIyBmYXN0Ym9vdCBmbGFzaCByYW0gdS1ib290LXdpdGgtc3BsLmJpbgo+
ID4gKyMgZmFzdGJvb3QgcmVib290Cj4gPiArIyBmYXN0Ym9vdCBmbGFzaCB1Ym9vdCB1LWJvb3Qt
d2l0aC1zcGwuYmluCj4gPiArIyBmYXN0Ym9vdCBmbGFzaCBib290IGJvb3QuZXh0NAo+ID4gKyMg
ZmFzdGJvb3QgZmxhc2ggcm9vdCByb290ZnMuZXh0Mgo+Cj4gT3V0IG9mIGN1cmlvc2l0eSwgaXMg
aXQgcG9zc2libGUgdG8gYm9vdCB0aGUgQnVpbGRyb290IGltYWdlCj4gZnJvbSB0aGUgU0QgY2Fy
ZD8gSWYgeWVzLCBpdCBjb3VsZCBiZSBpbnRlcmVzdGluZyB0byBhbHNvIGhhdmUKPiB0aGUgbWV0
aG9kIGhlcmUgKGFuZCBib290IGNvbmZpZyBzd2l0Y2hlcykuCj4KVGhlIGJvYXJkIGlzIGN1cnJl
bnRseSB1bmFibGUgdG8gYm9vdCBmcm9tIFNEIGNhcmQgYXMgcGVyIG15IHRlc3RpbmcgdGhlCmJv
b3Qgcm9tIGN1cnJlbnRseSBkb2Vzbid0IHN1cHBvcnQgbG9hZGluZyBpbWFnZXMgZnJvbSB0aGUg
U0QgY2FyZC4gQWxzbyB0aGUKU2lwZWVkIFdpa2kgZG9lc24ndCBoYXZlIG11Y2ggaW5zdHJ1Y3Rp
b25zIG9uIGJvb3RpbmcgdmlhIHRoZSBTRCBjYXJkIGFwYXJ0IGZyb20KbWVudGlvbiBhYm91dCB0
aGUgRElQIHN3aXRjaC4gSWYgSWZpZ3VyZSBvdXQgaG93IHRvIGdldCBpdCB0byBib290IHZpYQp0
aGUgU0QgY2FyZCwKSSB3aWxsIHVwZGF0ZSB0aGUgcmVhZG1lIGluIGEgZnV0dXJlIGNvbW1pdC4K
Cj4KPiA+ICtCUjJfVEFSR0VUX1VCT09UX1NQTD15Cj4gPiArQlIyX1RBUkdFVF9VQk9PVF9TUExf
TkFNRT0idS1ib290LXdpdGgtc3BsLmJpbiIKPiA+ICtCUjJfUEFDS0FHRV9IT1NUX0dFTklNQUdF
PXkKPiA+ICtCUjJfUEFDS0FHRV9IT1NUX01UT09MUz15Cj4KPiBBbHNvLCBjb3VsZCB5b3UgYWRk
IHlvdXJzZWxmIGFzIHRoZSBtYWludGFpbmVyIG9mIHRoaXMgZGVmY29uZmlnIGluIHRoZQo+IGZp
bGUgIkRFVkVMT1BFUlMiPwo+Cj4gQmVzdCByZWdhcmRzLAo+Cj4gSnVsaWVuLgoKVGhhbmtzIGFu
ZCBSZWdhcmRzLApLYW5hayBTaGlsbGVkYXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
