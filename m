Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F82C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D470817F2;
	Sat, 13 Jul 2024 20:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d07TxZy0Dvp3; Sat, 13 Jul 2024 20:34:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27B27818D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27B27818D7;
	Sat, 13 Jul 2024 20:34:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDE351BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB60560753
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNFMIUwg0NiG for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:34:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2FE0D60605
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FE0D60605
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FE0D60605
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:34:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9009C20003;
 Sat, 13 Jul 2024 20:34:31 +0000 (UTC)
Date: Sat, 13 Jul 2024 22:34:30 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= via buildroot
 <buildroot@buildroot.org>
Message-ID: <20240713223430.039c274c@windsurf>
In-Reply-To: <20240607163208.1445715-1-raphael.melotte@mind.be>
References: <20240216211344.1807353-2-raphael.melotte@mind.be>
 <20240607163208.1445715-1-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720902872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5No3w3Pg9sJ654Jc7EHQqQimdAAlHYlT1559IOaXgQ=;
 b=YT/4pRr2m9ZdZFNNVbGM/DeaB5LXu3Sn4WNvfr7vVo/Qs/xyUGkBG8hSoVwNg2b+TR9Z7H
 XRRofRYBOQfe944fY4xYZqEZkeIt0jynExEM15ZT2/CQK/Ho+iPoRxZ6OoqF2nkPyT6rr9
 XSsX+wVzr6bHOcF04X6miFEoo3aoNsFGz9RWChwbx8U0rukDuw8Ylv/e8v8nTJyauWXvC/
 5WOaLJ8sFTSpTutwfBm2cWaVwqJZX1ONr1dxjovoksCzNjqxL07YqoYrPoBQ02fo/ASye3
 GCSvW7og2XHD4fu5lSGZFUMXyJZ7qOhPBJxch9n+S7kWNzHCLs5sp8Wp+d6YeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YT/4pRr2
Subject: Re: [Buildroot] [PATCH v2 1/5] package: python-pymupdf: add missing
 python-zlib dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAgNyBKdW4gMjAyNCAxODozMjowMiArMDIwMApSYXBoYcOrbCBNw6lsb3R0ZSB2aWEg
YnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IEl0IHR1cm5zIG91
dCB0aGF0IHB5dGhvbi1weW11cGRmIGRvZXNuJ3QgcmVxdWlyZSB6bGliIGRpcmVjdGx5LCBidXQg
aXQKPiBkb2VzIHJlcXVpcmUgdGhlIHpsaWIgcHl0aG9uIG1vZHVsZS4KPiAKPiBUaGlzIGZpeGVz
IHRoZSBmb2xsb3dpbmcgcnVudGltZSBlcnJvcjoKPiAKPiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50
IGNhbGwgbGFzdCk6Cj4gICBGaWxlICI8c3RkaW4+IiwgbGluZSAxLCBpbiA8bW9kdWxlPgo+ICAg
RmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzL2ZpdHovX19pbml0X18ucHki
LCBsaW5lIDIyLCBpbiA8bW9kdWxlPgo+ICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xMS9zaXRl
LXBhY2thZ2VzL2ZpdHovZml0ei5weSIsIGxpbmUgMzQwMiwgaW4gPG1vZHVsZT4KPiAgIEZpbGUg
Ii91c3IvbGliL3B5dGhvbjMuMTEvZ3ppcC5weSIsIGxpbmUgOSwgaW4gPG1vZHVsZT4KPiBNb2R1
bGVOb3RGb3VuZEVycm9yOiBObyBtb2R1bGUgbmFtZWQgJ3psaWInCj4gCj4gU2lnbmVkLW9mZi1i
eTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgoKWW91IGhhZCBm
b3Jnb3R0ZW4gdG8gZHJvcCB0aGUgInpsaWIiIGRlcGVuZGVuY3kgaW4gTVVQREZfREVQRU5ERU5D
SUVTLApzbyBJIGRyb3BwZWQgaXQgYXMgd2VsbC4gQW5kIGFwcGxpZWQgeW91ciBwYXRjaCEKCkFu
ZCBpbiBmYWN0IHRoaXMgbGVhZCBtZSB0byBsb29rIG1vcmUgaW50byBtdXBkZiwgYW5kIEkgd2Fz
IGN1cmlvdXMgdG8Kc2VlIHdoeSBpdCBkZXBlbmRlZCBvbiBYMTEuIEV4Y2VwdCBpdCBkb2VzIG5v
dDogaXQgaXMgYSBwdXJlbHkgb3B0aW9uYWwKZGVwZW5kZW5jeS4gQW5kIEkgZm91bmQgb3RoZXIg
dGhpbmdzIHRoYXQgd2VyZSBub3QgY29ycmVjdC91c2VmdWwKYW55bW9yZSBpbiB0aGUgcGFja2Fn
ZSBzbyBJIGRpZCBhIGZldyBwcmVwYXJhdGlvbiBjb21taXRzOgoKaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2Y3ZGVhYTEzMzBiYWFkMzAzYWZiNzZh
NzcxMWZhZWViMWRkZmVlNWQKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRy
b290Ly0vY29tbWl0LzkwZjBhNDg0NjcxMDk4ZjlhOTRjZTY2YjhmOGFmOTRlMTA2YWUxMDYKaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzJjMGQ3Yjcy
YzA5OTNhNTVjOGRjYjdiMzhkODU3OTJlMWJmNmU4YmMKCmFuZCB1bHRpbWF0ZWx5LCBJIGRyb3Bw
ZWQgdGhlIFgub3JnIGRlcGVuZGVuY3kgYWxzbyBvbiBweXRob24tcHltdXBkZjoKCmh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9lZGZhNmYyOTc4NWU2
MThiNzU3MzliNzAyZmM4NjNlZTI0MTA5MDhkCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmks
IGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
