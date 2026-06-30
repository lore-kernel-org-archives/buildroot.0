Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C426AC43458
	for <buildroot@archiver.kernel.org>; Tue, 30 Jun 2026 03:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 744C76089E;
	Tue, 30 Jun 2026 03:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97zFKoUynBpH; Tue, 30 Jun 2026 03:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B1B6607E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782790077;
	bh=wS/RWDdP58ttcYRklnXE3Ip1PQpIxi/nbK3iMzBU/CY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GS1A9MwcpyyL0kcX7gGGdAl+krSIV8BPXteoq9oaDYWyn4fdJZehPzqcKOSNSBuVl
	 84S0B20MeU+oG+9RvzgVXmmGPxsvi+NJWcMX26HHL8VDxztstaBT7QOgBfkNHI7psT
	 LOTamPHkexgbI61VrXAYpZccoqBQg14WfSWdGEND7mavEM90qkunmizT/OJquD75KR
	 ezwgLRC+5OWx8SkMcwoQRlZ3FLJqknsNDEagxv566HCr0YWCILqz38U2uNjUaypTs3
	 rn9GzBRiVetFgqKk7XL1CQqrTAGwGYPhClkmLmnoBXlWvyAugshkXb/4PZ31x+V8Hn
	 sFTAa1uCYMbOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B1B6607E7;
	Tue, 30 Jun 2026 03:27:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D26C1338
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 03:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E8A981255
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 03:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gy6c6PBHkXfT for <buildroot@buildroot.org>;
 Tue, 30 Jun 2026 03:27:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=alistair23@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3126281248
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3126281248
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3126281248
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 03:27:55 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6984111d35bso3806448a12.0
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 20:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782790073; cv=none;
 d=google.com; s=arc-20260327;
 b=jJDVki0XIekzma3+37htOywgFkBOOYKopaRcYxljbQBh4axFuU20ymWAt6GgrnuQu3
 pNwwzP2IQuVTc2has4dHoXKNbvT4BdaWj5ScS0IjoYmACsxGmF/HUgRA5+GdPVDdTVhF
 p0hpKp+/Hq8grVGx0m3ffco8pUlftCLtiUTy7jMNC+30Y2uosPtvKFBmUxAtOt8tZqGP
 L6FUTI5r4/AtxgQ857Q2cuqwOegiCiNwp/iMu6x0jK6bSQykYPsIBBSMzENEGq7DdF19
 ISSfSfrdNehdSHhG4N/PECK7Wu9gueg+AiISXAjrw3Ez7syTzPpPBIgoXG779ML9J+RN
 AY1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=FqMFkBMPj/0Xj2sB7QhZucMX2Zyq7YWFaAotSo2Nu1E=;
 fh=AdDfOARjNDUF5I7KTn7BGdRkifV3CwgD381gjWsaiZ0=;
 b=TrRg2gsO/BrssycQ8kQci39HQiDKjV1br1E7OkhyA0+m6VMVfLXaHO02H9I67L8SD3
 kGfakC22i9roKyQlyR4nvc60FZmvcYjFrLOvvB3HQTxq0mhhP7rtvfnhYgFdLXPlAwWX
 vat1kM8AIs5/jOV2Flp7vBvEsfYTSnghYIFqaDoimFtl3UOHmuUKXw11otcrn0S0qNSC
 78JrgeePsWOjEPMGZ8jNiu0w8Wd+ntfkhL7NOYA45LYeim8RsYpq+59Y4Xb1AdC0mZhx
 eqy2A1/u7/iVFWbsURxDUUa/3welM7jGK64WuNAlRHib3okJljBtkAX7UDpEq/eYE4ov
 yvWQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782790073; x=1783394873;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FqMFkBMPj/0Xj2sB7QhZucMX2Zyq7YWFaAotSo2Nu1E=;
 b=JXrDAo3Wo5HPEzc8XuRifvzUV/JvS44bz8MQ+jrocVd/A3f6bmoY4sNMJ01pRk1oG/
 uxWe+otXnvueTeEqf9H6fibxbaXvXWLatRDm6UlxnwQlqtPnKDBjL3/4ZrjI7oho2+JW
 Lc2aS7XNStT5VoWCthOXH4NJg7p1CqvYagj9WxXmrlmMD5glQkamxZ6fXcIoW5ha12hC
 yBcxiBWuo7IL1lu81C3pX91JWKgwKuY1P3cOau2QVpdRF8QnbjBQsPhyAiCA1Vl2Bwow
 b6WUBUytZ7MLlMuh8fS47ZmIxpY3j/ZVlbI6V1Ata6rxvs3jvOCFqwvSEOcI7/TuNawP
 D7yQ==
X-Gm-Message-State: AOJu0Yxyp6L6MFakajb2DaEw8a2oa7QwVEOQTcB4P5h2WGkX8ykk4eHu
 awVLxgMDvPDPAZYOQC1kjsEgvmKG8fcdDj5vm7wkG2ATp0mNMK5yd31DNUPATsaSAA5GCroY9je
 6iFX5bO3HY4bydl9d7iur+VOmeR64/dg=
X-Gm-Gg: AfdE7cm5vvSHVKQ+TZEBmWFjjHuO1a1dBcAF0JKJtPjOENuC+8dFzFDO6pwZwZcU5iX
 ehD6Tj7TwHHP+UE/RV0aIw/x+K/tlk1Rw29Jr9rzITeXTXYEmJU39lgpSS3Or6LAt+FAVRvcE8i
 rGOt8DNbyY4QW94/ovjzMnoAvCwtw/hX8Byt1su4git0YAqR1mJ6lJiicio6Rko7k5n9zdNhw2K
 U3DWGAZHrdmZlcTIDeJBewIiEllrh04CpPMQBT+n1yGeTq7/QSZ4x+1MHf1k4JOMqZUCsTVZ6TS
 iDtbRHpz7dVDKtR9ShgDAzXA2to=
X-Received: by 2002:a05:6402:3606:b0:698:1504:bb1d with SMTP id
 4fb4d7f45d1cf-69879e3c18emr680156a12.30.1782790072745; Mon, 29 Jun 2026
 20:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260630030441.1520601-1-jms@oss.tenstorrent.com>
In-Reply-To: <20260630030441.1520601-1-jms@oss.tenstorrent.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Jun 2026 13:27:25 +1000
X-Gm-Features: AVVi8Ccd-MWO1XcHaQ-MIr-O-ZhN2c_MFVdClWUqraEMZ2yh8IG2CqjZlsQ5SpE
Message-ID: <CAKmqyKNfN47ucm842Y_3Tf9us90C1J+2_98NHbopiENH9x1Bqw@mail.gmail.com>
To: Joel Stanley <jms@oss.tenstorrent.com>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782790073; x=1783394873; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FqMFkBMPj/0Xj2sB7QhZucMX2Zyq7YWFaAotSo2Nu1E=;
 b=qgqijo1/7d8yDVRdm8rsPzfrndwUJHW/nZwZY4UjoAZnXZkmseRTqY0LlMAlN8jp8N
 /3LMGVSxraUSXirweV5wkOI6patgQ1ZJXZNsiSTI84kjmDiHZCu4xthXiJxxvf6dcN3z
 wi9DLMtqimUOfQQ3+OAtS6BEMudUsLJnraGAUKOOsWvJSMKoAmd2odw2hsdtBu4wyj3H
 Eg0KiSmPfeBmXFTAPVHtr60NG5oTd2qi5Xce77Im01fx+NVFCf2u2zSEiOlZh10ANW60
 WgQpczFQYC/PyvUfj/iOdGf9JUknt5AnyTmljb1aErWEyNOIhOkeE/l8o+xt4EFk+AXy
 7gBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=qgqijo1/
Subject: Re: [Buildroot] [PATCH] boot/opensbi: Bump to v1.8.1
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

T24gVHVlLCBKdW4gMzAsIDIwMjYgYXQgMTowNeKAr1BNIEpvZWwgU3RhbmxleSB2aWEgYnVpbGRy
b290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiB2MS44IHJlbGVhc2Ugbm90
ZXM6Cj4KPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1zb2Z0d2FyZS1zcmMvb3BlbnNiaS9y
ZWxlYXNlcy90YWcvdjEuOAo+ICAgaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNvZnR3YXJlLXNy
Yy9vcGVuc2JpL3JlbGVhc2VzL3RhZy92MS44LjEKPgo+IFNpZ25lZC1vZmYtYnk6IEpvZWwgU3Rh
bmxleSA8am1zQG9zcy50ZW5zdG9ycmVudC5jb20+CgpSZXZpZXdlZC1ieTogQWxpc3RhaXIgRnJh
bmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgoKQWxpc3RhaXIKCj4gLS0tCj4gIGJvb3Qv
b3BlbnNiaS9Db25maWcuaW4gICAgfCA0ICsrLS0KPiAgYm9vdC9vcGVuc2JpL29wZW5zYmkuaGFz
aCB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvYm9vdC9vcGVuc2JpL0NvbmZpZy5pbiBiL2Jvb3Qvb3BlbnNi
aS9Db25maWcuaW4KPiBpbmRleCA5ODZlMzgwYjQ4ZGQuLjZlMjZkYTYzNDQ5ZSAxMDA2NDQKPiAt
LS0gYS9ib290L29wZW5zYmkvQ29uZmlnLmluCj4gKysrIGIvYm9vdC9vcGVuc2JpL0NvbmZpZy5p
bgo+IEBAIC0xOSw3ICsxOSw3IEBAIGNob2ljZQo+ICAgICAgICAgICBTZWxlY3QgdGhlIHNwZWNp
ZmljIE9wZW5TQkkgdmVyc2lvbiB5b3Ugd2FudCB0byB1c2UKPgo+ICBjb25maWcgQlIyX1RBUkdF
VF9PUEVOU0JJX0xBVEVTVF9WRVJTSU9OCj4gLSAgICAgICBib29sICIxLjciCj4gKyAgICAgICBi
b29sICJMYXRlc3QgdmVyc2lvbiAoMS44LjEpIgo+Cj4gIGNvbmZpZyBCUjJfVEFSR0VUX09QRU5T
QklfQ1VTVE9NX1ZFUlNJT04KPiAgICAgICAgIGJvb2wgIkN1c3RvbSB2ZXJzaW9uIgo+IEBAIC01
Nyw3ICs1Nyw3IEBAIGVuZGlmCj4KPiAgY29uZmlnIEJSMl9UQVJHRVRfT1BFTlNCSV9WRVJTSU9O
Cj4gICAgICAgICBzdHJpbmcKPiAtICAgICAgIGRlZmF1bHQgIjEuNyIgaWYgQlIyX1RBUkdFVF9P
UEVOU0JJX0xBVEVTVF9WRVJTSU9OCj4gKyAgICAgICBkZWZhdWx0ICIxLjguMSIgaWYgQlIyX1RB
UkdFVF9PUEVOU0JJX0xBVEVTVF9WRVJTSU9OCj4gICAgICAgICBkZWZhdWx0IEJSMl9UQVJHRVRf
T1BFTlNCSV9DVVNUT01fVkVSU0lPTl9WQUxVRSBcCj4gICAgICAgICAgICAgICAgIGlmIEJSMl9U
QVJHRVRfT1BFTlNCSV9DVVNUT01fVkVSU0lPTgo+ICAgICAgICAgZGVmYXVsdCAiY3VzdG9tIiBp
ZiBCUjJfVEFSR0VUX09QRU5TQklfQ1VTVE9NX1RBUkJBTEwKPiBkaWZmIC0tZ2l0IGEvYm9vdC9v
cGVuc2JpL29wZW5zYmkuaGFzaCBiL2Jvb3Qvb3BlbnNiaS9vcGVuc2JpLmhhc2gKPiBpbmRleCBj
ODJkMmRlMjM2ZTcuLjY2MWYwODE4OWVhMiAxMDA2NDQKPiAtLS0gYS9ib290L29wZW5zYmkvb3Bl
bnNiaS5oYXNoCj4gKysrIGIvYm9vdC9vcGVuc2JpL29wZW5zYmkuaGFzaAo+IEBAIC0xLDMgKzEs
MyBAQAo+ICAjIGxvY2FsbHkgY29tcHV0ZWQKPiAtc2hhMjU2ICAyY2Y4NTZhNGU1ZTJlMDUyOTQ4
ZGRiNTRiYTQ4MjMyYjFmNjk4YjdmNTJlMDM3NGZjN2QxN2Q1MWU4YzhmN2NlICBvcGVuc2JpLTEu
Ny50YXIuZ3oKPiArc2hhMjU2ICBmYjFhZTYxYTg1ZTk2NjMyMjEwMWFjYjFjOTgyZjg0ZDllYWFm
YzRkZTdkZDQ3NGE3ZDc1NDZkOWJiMzIxYzZmICBvcGVuc2JpLTEuOC4xLnRhci5nego+ICBzaGEy
NTYgIDgyZDEzZmIxYmY2YmIxNjI2MjlkZWVlYTllYjljMTE3ZTc0NTQ4ZDNiNzA3ZTQ3ODk2NzY5
MWZlNzlhNjhlMjEgIENPUFlJTkcuQlNECj4gLS0KPiAyLjUzLjAKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
