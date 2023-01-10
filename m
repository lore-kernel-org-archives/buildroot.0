Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66E8C54EBC
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 12:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EA9440A9F;
	Tue, 10 Jan 2023 12:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EA9440A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ti0bmKFkiNwo; Tue, 10 Jan 2023 12:31:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C3B140132;
	Tue, 10 Jan 2023 12:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C3B140132
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66E321BF307
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 12:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3576E81D5F
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 12:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3576E81D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sObSemFhA6wh for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 12:31:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11BB081D47
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11BB081D47
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 12:31:16 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id v30so17279559edb.9
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 04:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3zT+y1X+op34bZ9kRVj4zj9Sc+W/Q2bPYDoDVb5ShAk=;
 b=a8C2IbzZj/xwq7A1zbnYZv6sIZw1qT8eL6ViXoyB6un4hMiX0wgZwfsBNNtexXzxl5
 bZKZGqHQ58SzYrhS2yqHxjM8hPe87fxEBorvGxtT9qiD9AWodmqcRCoYr8yEAEt4QhET
 UECMkBY+ELwo63iEsvpJMJz/tuoz5pEISoDa54fS9avvvJoaTVo/tpJQHP8g7sj1Fkgm
 Ij2POPT0ifZXRodAFmhebiW3srYPp9Ow32XWFSwHGc354WvaO7yyGLrvefmbfNoZzBYn
 gPZxR328o3R95+GrPsHmHdFOxfzTojZLqly1HQAhk0qyJFf590cBBpOaqc7xnC1kYVV0
 fabg==
X-Gm-Message-State: AFqh2krLFnCxhLWWdCyres18/UTF28zW8JbKRGPrHf6sq+Gb5e1I7a4V
 ATpvI2i9h9W0qfkfrcfitafFeiNrEjAQUFTY8Pi1Qo5LdrDUGQ==
X-Google-Smtp-Source: AMrXdXshoD99MmjiUfXQ5hooPgwtUv7bnohaOJYg+4yjpVfxz0lXILrXiL4xrEFzad89b52EDpN5r5pc5KkaJAKLyQ0=
X-Received: by 2002:a05:6402:378b:b0:499:bd67:c68f with SMTP id
 et11-20020a056402378b00b00499bd67c68fmr617259edb.177.1673353875180; Tue, 10
 Jan 2023 04:31:15 -0800 (PST)
MIME-Version: 1.0
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <20221128175851.1913859-3-james.hilliard1@gmail.com>
In-Reply-To: <20221128175851.1913859-3-james.hilliard1@gmail.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 10 Jan 2023 13:31:03 +0100
Message-ID: <CAKcgs2y21ghDbtd1kO3D7SibV123vGQodhabDmiD816uCDTp2Q@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3zT+y1X+op34bZ9kRVj4zj9Sc+W/Q2bPYDoDVb5ShAk=;
 b=mbGKzDk4lcUrGjYVfjcZdid1imCMJGp+KlGy6cGuDvabjqaMnILkubqXC1FmjBgUZt
 pTmDS3GIvs4XGy3uVN/O5/w8m/YRDVWTa5NLBjqhcGX5ymhvIwFBPcTH1cQ41aTWlZAf
 Lldfwc9UdutNl05V7+hz/YmRpvySV9CpenR6ZNJJmJjz8rMWEdG4dfLu1FPWL3FJ+Ukb
 DbRNzRj/EurZcQDti2i55PzZfLBUg0uibNdQ2OtAPhZ2/Yj6XT2QL/Ea23/jgjumi9/a
 6l/N9BDSYSKZ55J6tgJJMyAzrP+EErafySPwYzXjZmIP8Thw7ZKFJyPqeZYtovo9e7wk
 Fy6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mbGKzDk4
Subject: Re: [Buildroot] [PATCH v2 3/8] package/ruy: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMgU3RlZmFuLAoKTGUgbHVuLiAyOCBub3YuIDIwMjIgw6AgMTg6NTksIEphbWVzIEhp
bGxpYXJkCjxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4KPiBGcm9tOiBT
dGVmYW4gSGFnZXIgPHN0ZWZhbi5oYWdlckBnaW56aW5nZXIuY29tPgo+Cj4gVGhpcyBwYWNrYWdl
IGlzIHJlcXVpcmVkIGJ5IHRlbnNvcmZsb3ctbGl0ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZh
biBIYWdlciA8c3RlZmFuLmhhZ2VyQGdpbnppbmdlci5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFt
ZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2Uv
Q29uZmlnLmluICAgICB8ICAxICsKSWYgeW91IHdhbnQgdG8gYmUgbWFpbnRhaW5lcnMgZm9yIHRo
aXMgcGFja2FnZSwgZG8gbm90IGZvcmdldCB0bwp1cGRhdGUgdGhlIERFVkVMT1BFUlMgZmlsZS4K
Cj4gIHBhY2thZ2UvcnV5L0NvbmZpZy5pbiB8IDExICsrKysrKysrKysrCj4gIHBhY2thZ2UvcnV5
L3J1eS5oYXNoICB8ICA0ICsrKysKPiAgcGFja2FnZS9ydXkvcnV5Lm1rICAgIHwgMTggKysrKysr
KysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ydXkvQ29uZmlnLmluCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3J1eS9ydXkuaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ydXkv
cnV5Lm1rCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZp
Zy5pbgo+IGluZGV4IGUwOWZhMGIzYmQuLjQ1ZTY2Y2FhOGMgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+IEBAIC0yMDk1LDYgKzIwOTUs
NyBAQCBlbmRpZgo+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3FodWxsL0NvbmZpZy5pbiIKPiAg
ICAgICAgIHNvdXJjZSAicGFja2FnZS9xbGliYy9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2Ug
InBhY2thZ2UvcmllbWFubi1jLWNsaWVudC9Db25maWcuaW4iCj4gKyAgICAgICBzb3VyY2UgInBh
Y2thZ2UvcnV5L0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9zaGFwZWxpYi9D
b25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2Uvc2thbGlicy9Db25maWcuaW4iCj4g
ICAgICAgICBzb3VyY2UgInBhY2thZ2Uvc3BoaW54YmFzZS9Db25maWcuaW4iCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcnV5L0NvbmZpZy5pbiBiL3BhY2thZ2UvcnV5L0NvbmZpZy5pbgo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uY2U3YWI1ZDU4NQo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9wYWNrYWdlL3J1eS9Db25maWcuaW4KPiBAQCAtMCwwICsxLDExIEBACj4g
K2NvbmZpZyBCUjJfUEFDS0FHRV9SVVkKPiArICAgICAgIGJvb2wgInJ1eSIKPiArICAgICAgIGRl
cGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQClRoZSBDTWFrZUxpc3RzLnR4dCBtZW50aW9u
cyBhIGRlcGVuZGVuY3kgb24gQysrMTQuIENhbiB5b3Ugc2V0IHRoZQptaW5pbXVtIEdDQyB2ZXJz
aW9uIHJlcXVpcmVkPyAoZWl0aGVyIDQuOSBvciA1KQoKPiArICAgICAgIHNlbGVjdCBCUjJfUEFD
S0FHRV9DUFVJTkZPCj4gKyAgICAgICBoZWxwCj4gKyAgICAgICAgIFJ1eSBpcyBhIG1hdHJpeCBt
dWx0aXBsaWNhdGlvbiBsaWJyYXJ5LiBJdHMgZm9jdXMgaXMgdG8gY292ZXIKPiArICAgICAgICAg
dGhlIG1hdHJpeCBtdWx0aXBsaWNhdGlvbiBuZWVkcyBvZiBuZXVyYWwgbmV0d29yayBpbmZlcmVu
Y2UKPiArICAgICAgICAgZW5naW5lcy4gSXRzIGluaXRpYWwgdXNlciBoYXMgYmVlbiBUZW5zb3JG
bG93IExpdGUsIHdoZXJlIGl0Cj4gKyAgICAgICAgIGlzIHVzZWQgYnkgZGVmYXVsdCBvbiB0aGUg
QVJNIENQVSBhcmNoaXRlY3R1cmUuCj4gKwo+ICsgICAgICAgICBodHRwczovL2dpdGh1Yi5jb20v
Z29vZ2xlL3J1eQpQbGVhc2UgbWVudGlvbiB0aGUgZGVwZW5kZW5jaWVzIChDKysgYW5kIEMrKyB2
ZXJzaW9uKQoKCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnV5L3J1eS5oYXNoIGIvcGFja2FnZS9y
dXkvcnV5Lmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjk4
MjY2YjU4ODEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9ydXkvcnV5Lmhhc2gKPiBA
QCAtMCwwICsxLDQgQEAKPiArIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiArc2hhMjU2ICA0ZGE4NTcy
OTQ2MDA3NjAzMzc4YzVkMDI4MGY0OGM1Yjc3ZjRkMzg3NjMyMDlmNTMwNmI1N2M3NTEzZDlhODJl
ICBydXktMzE2OGE1YzhmNGM0NDdmZDhjZWE5NDA3ODEyMWVlMmUyY2Q4N2RmMC50YXIuZ3oKPiAr
IyBMaWNlbnNlIGZpbGVzLCBsb2NhbGx5IGNhbGN1bGF0ZWQKPiArc2hhMjU2ICBjZmM3NzQ5Yjk2
ZjYzYmQzMWMzYzQyYjVjNDcxYmY3NTY4MTQwNTNlODQ3YzEwZjNlYjAwMzQxN2JjNTIzZDMwICBM
SUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnV5L3J1eS5tayBiL3BhY2thZ2UvcnV5L3J1
eS5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uY2VlZWE4Y2Q1
OAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3J1eS9ydXkubWsKPiBAQCAtMCwwICsx
LDE4IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBydXkKPiArIwo+ICsj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArUlVZX1ZFUlNJT04gPSAzMTY4YTVjOGY0YzQ0
N2ZkOGNlYTk0MDc4MTIxZWUyZTJjZDg3ZGYwCj4gK1JVWV9TSVRFID0gJChjYWxsIGdpdGh1Yixn
b29nbGUscnV5LCQoUlVZX1ZFUlNJT04pKQo+ICtSVVlfTElDRU5TRSA9IEFwYWNoZS0yLjAKPiAr
UlVZX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gK1JVWV9JTlNUQUxMX1NUQUdJTkcgPSBZRVMK
PiArUlVZX0RFUEVOREVOQ0lFUyA9IGNwdWluZm8KPiArUlVZX0NPTkZfT1BUUyA9IFwKPiArICAg
ICAgIC1EQ01BS0VfUE9TSVRJT05fSU5ERVBFTkRFTlRfQ09ERT1PTiBcCj4gKyAgICAgICAtRFJV
WV9GSU5EX0NQVUlORk89T04gXAo+ICsgICAgICAgLURSVVlfTUlOSU1BTF9CVUlMRD1PTgo+ICsK
PiArJChldmFsICQoY21ha2UtcGFja2FnZSkpCj4gLS0KPiAyLjM0LjEKPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
