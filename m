Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF0ACCD184
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 07:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6554881215;
	Fri, 17 Oct 2025 07:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LWMpIPMkYGal; Fri, 17 Oct 2025 07:10:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28BCC810C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28BCC810C6;
	Fri, 17 Oct 2025 07:10:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 608FFD8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46F3140A79
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4ZGkYbVTcQS for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 07:10:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32A9240A76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32A9240A76
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32A9240A76
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:10:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0F55D4E41115;
 Fri, 17 Oct 2025 07:10:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DA696606DB;
 Fri, 17 Oct 2025 07:10:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 91AD8102F22FF; 
 Fri, 17 Oct 2025 09:10:08 +0200 (CEST)
Mime-Version: 1.0
Date: Fri, 17 Oct 2025 09:10:08 +0200
Message-Id: <DDKEQUFRSIDF.NNELX3VBHKQH@bootlin.com>
Cc: <buildroot@buildroot.org>, "Bernd Kuhls" <bernd@kuhls.net>,
 <nicolas.carrier@nav-timing.safrangroup.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251016-libldns_drill-v1-0-21bfa8c53896@bootlin.com>
 <20251016-libldns_drill-v1-1-21bfa8c53896@bootlin.com>
 <20251017084617.7113dd26@windsurf>
In-Reply-To: <20251017084617.7113dd26@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760685010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=mTrb/8hkCPUD1KOosSYiAPHUITx8MXY+ytn7vXqw+jQ=;
 b=1vpVjlL/Mq8XHZfYlDeWIjDiKdrFap52WBH+xpCqEpZA7b4NAjO6cGbwQkQ+vbrwa/BaHc
 DZU4rXJGkw8zw4xbUesey9hFCPmNMkKKvLwpR9oh7PI1rMS0vuf2XYHc2/AsOb4/KHNCK4
 vCYILfEsWBeEIi0lX3Kfe/XGC+yzc+MMMJ8Gr4wozPfGsyLJeKeRm09LR6n4ZdNl6MzV4Y
 GvbEO7uWaLy42yWYsM1tqI2oP0a5VqhcAA1CqswJjPWg/rH2J43fo/v+O4mfeOWeZYvZrH
 lCitZ9vaZk+WxbkAiAd/3YMtblzkBiUTVxivAy/Fbnia0/hHDrniUS5zC4x1jA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1vpVjlL/
Subject: Re: [Buildroot] [PATCH RESEND 1/2] package/libldns: add an option
 to build and install drill
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gRnJpIE9jdCAxNywgMjAyNSBhdCA4OjQ2IEFNIENFU1QsIFRob21hcyBQ
ZXRhenpvbmkgd3JvdGU6Cj4gSGVsbG8gQWxleGlzLAo+Cj4gVGhhbmtzIGZvciB0aGUgcGF0Y2gh
Cj4KPiBPbiBUaHUsIDE2IE9jdCAyMDI1IDE3OjI3OjAyICswMjAwCj4gQWxleGlzIExvdGhvcsOp
IDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4gd3JvdGU6Cj4KPj4gVGhlIGxpYmxkbnMgbGli
cmFyeSBhbHNvIGNvbWVzIHdpdGggYSBDTEkgdG9vbCBuYW1lZCBkcmlsbCwgYWxsb3dpbmcgdG8K
Pj4gcGVyZm9ybSBETlMgcmVxdWVzdHMuIERyaWxsIGJ1aWxkIGlzIGN1cnJlbnRseSBkaXNhYmxl
ZCBieSBkZWZhdWx0Lgo+PiAKPj4gQWRkIGEgS0NvbmZpZyBvcHRpb24gdG8gYWxsb3cgYnVpbGRp
bmcgYW5kIGluc3RhbGxpbmcgZHJpbGwgdG9vbC4gU2V0Cj4+IHRoZSBkZWZhdWx0IHZhbHVlIHRv
IG4gdG8gcHJlc2VydmUgdGhlIGN1cnJlbnQgYmVoYXZpb3IuIFNpbWlsYXJseSB0bwo+PiBsaW5r
dGVzdCAoc2VlIHRoZSBjb21tZW50IGluIHRoZSAubWspLCBkcmlsbCBmYWlscyB0byBidWlsZCBj
b3JyZWN0bHkgYXMKPj4gYSBzdGF0aWMgYmluYXJ5LCBzbyBtYWtlIHRoZSBuZXcgb3B0aW9uIGRl
cGVuZCBvbiBub24tc3RhdGljIGJ1aWxkLgo+Cj4gTWlzc2luZyBTb0IuCgpJJ20gbm90ZSBzdXJl
IGhvdyBJIGNvdWxkIGhhdmUgbWVzc2VkIHVwIHRoaXMgb25lLi4uIEknbGwgZml4IHRoYXQgYW5k
IHRoZQpwb2ludHMgcmFpc2VkIGJlbG93LCB0aGFua3MuCgpBbGV4aXMKPj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvbGlibGRucy9Db25maWcuaW4gYi9wYWNrYWdlL2xpYmxkbnMvQ29uZmlnLmluCj4+
IGluZGV4IDY5NmZlYzk3YjU5ODU3ZmJkOTliZGNhYWJhYmEwOWQ0OTc3NGYzYWUuLjdhMTY5YzQ5
NTI4MWJlMDFiMmVlNzI0ZmQyZjllMjdiODNmNWUyZWMgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2Uv
bGlibGRucy9Db25maWcuaW4KPj4gKysrIGIvcGFja2FnZS9saWJsZG5zL0NvbmZpZy5pbgo+PiBA
QCAtOCwzICs4LDE3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJMRE5TCj4+ICAJICBleHBlcmlt
ZW50YWwgc29mdHdhcmUgZm9yIGN1cnJlbnQgSW50ZXJuZXQgRHJhZnRzLgo+PiAgCj4+ICAJICBo
dHRwOi8vd3d3Lm5sbmV0bGFicy5ubC9wcm9qZWN0cy9sZG5zCj4+ICsKPj4gK2lmIEJSMl9QQUNL
QUdFX0xJQkxETlMKPj4gKwo+PiArY29uZmlnIEJSMl9QQUNLQUdFX0xJQkxETlNfRFJJTEwKPj4g
Kwlib29sICJkcmlsbCBiaW5hcnkiCj4+ICsJZGVmYXVsdCBuCj4KPiBkZWZhdWx0IG4gaXMgdGhl
IGRlZmF1bHQsIHNvIGl0J3Mgbm90IG5lZWRlZC4KPgo+PiArCWRlcGVuZHMgb24gIUJSMl9TVEFU
SUNfTElCUwo+PiArCWhlbHAKPj4gKwkgIEluc3RhbGwgdGhlIGRyaWxsIGJpbmFyeQo+PiArCj4+
ICtjb21tZW50ICJkcmlsbCBuZWVkcyBkeW5hbWljIGxpYnJhcnkiCj4KPiBjb21tZW50ICJkcmls
bCBuZWVkcyBhIHRvb2xjaGFpbiB3LyBkeW5hbWljIGxpYnJhcnkiCj4KPiBPdGhlcndpc2UsIGxv
b2tzIGdvb2QhCj4KPiBUaG9tYXMKCgoKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
