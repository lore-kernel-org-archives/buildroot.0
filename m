Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1792CD1283
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 17:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49617827D9;
	Thu, 28 Mar 2024 17:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gxQGviHKHAN; Thu, 28 Mar 2024 17:23:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FC7682389
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FC7682389;
	Thu, 28 Mar 2024 17:23:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16B891BF2F2
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 17:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0395A82389
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 17:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_EEaQWKhLQm for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 17:23:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 209228237B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 209228237B
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 209228237B
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 17:23:01 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a4a393b699fso200887866b.0
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 10:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711646580; x=1712251380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CEztGHvf7g+8jNToeqKjgSK+2RSBS9dtNH+I5k7plxo=;
 b=Bw1DGJOMUIDWfojI/Rd8h69DLxJe0EqHkzOtvjkJVJaTtE27bYo7q9TRO/nD689iwH
 1MG/1xkYpIX+7JbB51QVk5Pv/vSQI4XQ+hGcZs2SUkGl5iVFZTykAO+sEIEQCNdUAEiK
 L/njvpwpnK4j/plpjjsp/CaZm1+salgNt7UXHINVSyV+CZlao0jNt+wXi/wsg3WSfUAH
 xA+JDhJCZ/lrIATwdusPdmMNeOqqScAZuyujxh6Ge7xct6/92QgWYMH0PEkr5cuxRdPO
 ZwTrue/ymP4yBjMWTqJkTApvGibAkBZ5cl78Vc8DWDmyHijaGvqhVIi2pW8y7Kksy7dH
 GPLA==
X-Gm-Message-State: AOJu0YzXCLTSf+jXJl/YeefDwl4TcI0VWtYVpSmXuTCm37S/3M5vPNYA
 8KCmhegPGfeyrVDQnp0hQP8lVAwjtSJvjsoWJfY1slnRXGfWo4D+0M2+RvE8pshVwtUWgxJoD+u
 5z82fi9QSWW5grZMUo6ZTpCXUUlcZFDPaAsdTee7YdhbHCeqx
X-Google-Smtp-Source: AGHT+IHZ3cFfGZ6jjUMSXHZxwUSc9IYq5rDeByTDAcp+B4fZBTmDjgedSHVd2GXJdS966yQ8ctGpGJDweZDvrCiRQ4I=
X-Received: by 2002:a17:907:7e9b:b0:a47:3afd:4739 with SMTP id
 qb27-20020a1709077e9b00b00a473afd4739mr3199746ejc.6.1711646579854; Thu, 28
 Mar 2024 10:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240326174059.499034-1-adam.duskett@amarulasolutions.com>
 <22517cb3-8448-429c-a79b-0efb5ca892cf@mind.be>
In-Reply-To: <22517cb3-8448-429c-a79b-0efb5ca892cf@mind.be>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu, 28 Mar 2024 11:22:48 -0600
Message-ID: <CAHDQB6MnyzQujKtQikEfVsK4X7MdGZ3TeOSTVc21TQbN4XrqUg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711646580; x=1712251380;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CEztGHvf7g+8jNToeqKjgSK+2RSBS9dtNH+I5k7plxo=;
 b=Se561MNoBIqEBcQGqIjPsm1/NF7z8n5k91D/5BTDPZ4YcIgQfmFLFobSwnqO7YXwPE
 o6MIoGNFwxLFLprL8yFOAED0Tg++/u/uHI/L5bBCnHjEFzFsNsQ0M7f49OH5QXT5ujsy
 XH0aI0h3mnMCvdW4czqEyc+DQbhrZOs6GxkjM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Se561MNo
Subject: Re: [Buildroot] [PATCH] package/flutter-packages: bump version to
 ab1630b9b9bd1130b4d5d1ac18a588b690fd0fa3
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGV5IEFybm91dDsKCkl0IHdhcyBwcm9iYWJseSBhIGJhZCBjb3B5L3Bhc3RlLiBOb3RoaW5nIHRv
IHdvcnJ5IGFib3V0IQoKQWRhbSBEdXNrZXR0CgoKT24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMToz
MOKAr0FNIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4KPgo+
Cj4gT24gMjYvMDMvMjAyNCAxODo0MCwgQWRhbSBEdXNrZXR0IHdyb3RlOgo+ID4gU2lnbmVkLW9m
Zi1ieTogQWRhbSBEdXNrZXR0IDxhZGFtLmR1c2tldHRAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4g
PiAtLS0KPiA+ICAgcGFja2FnZS9mbHV0dGVyLXBhY2thZ2VzL2ZsdXR0ZXItcGFja2FnZXMuaGFz
aCB8IDIgKy0KPiA+ICAgcGFja2FnZS9mbHV0dGVyLXBhY2thZ2VzL2ZsdXR0ZXItcGFja2FnZXMu
bWsgICB8IDIgKy0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmx1dHRlci1wYWNrYWdlcy9m
bHV0dGVyLXBhY2thZ2VzLmhhc2ggYi9wYWNrYWdlL2ZsdXR0ZXItcGFja2FnZXMvZmx1dHRlci1w
YWNrYWdlcy5oYXNoCj4gPiBpbmRleCA5OTQ0MzRlMjVjLi5mMTI0MzAyYTAyIDEwMDY0NAo+ID4g
LS0tIGEvcGFja2FnZS9mbHV0dGVyLXBhY2thZ2VzL2ZsdXR0ZXItcGFja2FnZXMuaGFzaAo+ID4g
KysrIGIvcGFja2FnZS9mbHV0dGVyLXBhY2thZ2VzL2ZsdXR0ZXItcGFja2FnZXMuaGFzaAo+ID4g
QEAgLTEsMyArMSwzIEBACj4gPiAgICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gPiAtc2hhMjU2ICA4
Mjc2Mjc2ZTA1MGMxZWE0NTc4N2Y3NGIwZjhjOTE1YjhjZjIxNjJiNmFmODUzN2ZmYTk4ODZiZDQy
M2YyODI4ICBmbHV0dGVyLXBhY2thZ2VzLTk0N2UzNGNlOWZlZGNkZDY3NTBiNTRlYjFjYzc0Yjg1
NGI0OWFiNDgtYnIxLnRhci5nego+ID4gK3NoYTI1NiAgMmUxZTE5NzEzYWM3NGI2ZTAwYTZmNWVj
NTE2ZThjY2RhNWU1YmExZmM4YjI0OWQ0MGFiY2ZlNGNiNTBkZmY4NyAgZmx1dHRlci1wYWNrYWdl
cy1hYjE2MzBiOWI5YmQxMTMwYjRkNWQxYWMxOGE1ODhiNjkwZmQwZmEzLWJyMS50YXIuZ3oKPgo+
ICAgRGlkIHlvdSBmaW5kIG91dCB3aHkgdGhlIGhhc2ggd2FzIHdyb25nIGluIHYxIG9mIHRoaXMg
cGF0Y2g/Cj4KPiAgIFJlZ2FyZHMsCj4gICBBcm5vdXQKPgo+ID4gICBzaGEyNTYgIDg5NTE5ZWNh
NmY3Yjk1MjliMzViZGRkZDYyM2E1OGMzYWYwNmE4OGM0NThkYmQ2NTMxZGRiNDY3NWFjZjc1YTkg
IExJQ0VOU0UKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2ZsdXR0ZXItcGFja2FnZXMvZmx1dHRl
ci1wYWNrYWdlcy5tayBiL3BhY2thZ2UvZmx1dHRlci1wYWNrYWdlcy9mbHV0dGVyLXBhY2thZ2Vz
Lm1rCj4gPiBpbmRleCA0YmVhYTM5MzI1Li5jMWU3YTE0Zjg1IDEwMDY0NAo+ID4gLS0tIGEvcGFj
a2FnZS9mbHV0dGVyLXBhY2thZ2VzL2ZsdXR0ZXItcGFja2FnZXMubWsKPiA+ICsrKyBiL3BhY2th
Z2UvZmx1dHRlci1wYWNrYWdlcy9mbHV0dGVyLXBhY2thZ2VzLm1rCj4gPiBAQCAtNCw3ICs0LDcg
QEAKPiA+ICAgIwo+ID4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4KPiA+IC1GTFVUVEVS
X1BBQ0tBR0VTX1ZFUlNJT04gPSA5NDdlMzRjZTlmZWRjZGQ2NzUwYjU0ZWIxY2M3NGI4NTRiNDlh
YjQ4Cj4gPiArRkxVVFRFUl9QQUNLQUdFU19WRVJTSU9OID0gYWIxNjMwYjliOWJkMTEzMGI0ZDVk
MWFjMThhNTg4YjY5MGZkMGZhMwo+ID4gICBGTFVUVEVSX1BBQ0tBR0VTX1NJVEUgPSAkKGNhbGwg
Z2l0aHViLGZsdXR0ZXIscGFja2FnZXMsJChGTFVUVEVSX1BBQ0tBR0VTX1ZFUlNJT04pKQo+ID4g
ICBGTFVUVEVSX1BBQ0tBR0VTX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKPiA+ICAgRkxVVFRFUl9Q
QUNLQUdFU19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
