Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EF8C5321E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 13:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3871400F2;
	Sun, 25 Aug 2024 13:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yi3kX1W_fmQs; Sun, 25 Aug 2024 13:07:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 624CE40154
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 624CE40154;
	Sun, 25 Aug 2024 13:07:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B4BE1BF4E6
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 195E5605CF
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_3c-RYCaX3D for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 13:06:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0CFAD605C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CFAD605C1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CFAD605C1
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 13:06:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C67D20002;
 Sun, 25 Aug 2024 13:06:53 +0000 (UTC)
Date: Sun, 25 Aug 2024 15:06:52 +0200
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via buildroot" <buildroot@buildroot.org>
Message-ID: <20240825150652.09dcab72@windsurf>
In-Reply-To: <20240824-x264-textrel-v1-1-fbfcedc7179d@gmx.net>
References: <20240824-x264-textrel-v1-1-fbfcedc7179d@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724591213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SQqsl6Oz9QHOSL1QcNH3oUdX7hVo/aVMeqkYCtR3Qvc=;
 b=H+25MEHZK0hXYPpOkRrefs5se6h/ZClJntq5+OUV30j2xqb9dRzgbR6DlS+QCCuKWMYprx
 7mw/8Cr7CgPByOv+hrSLLus2u9vnbuUgIaJ513fk6V3CSS6CC90XfUe5rApZCh3VH4IhRc
 efIXvJ4vgq29XZSeGQBvRTzswtSWsXeFP/CQ9yF1a8klhKprclsrPturqaB0aQUnJxzxNi
 7FBvhtIGfGxnDv4Lc/u02mu1s74L6JgLFRu4Ma9thAxnWdgkP+gXiWMo+n0rwufkPYTYrO
 e+zRHFpDTT2ThjaCHr4OsDfvjQiiUmfRPpscHv9xfodAkuWTzz+ZvsX4RcZ/8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H+25MEHZ
Subject: Re: [Buildroot] [PATCH] package/x264: disable assembly code on x86
 + musl + PIC/PIE
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Yann Morin <yann.morin@orange.com>,
 "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>,
 David du Colombier <0intro@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAyNCBBdWcgMjAyNCAyMjoxMTowMiArMDIwMApKLiBOZXVzY2jDpGZlciB2aWEgYnVp
bGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IFRoZSB4MjY0IHBhY2th
Z2UgdXNlcyBsYXJnZSBhbW91bnRzIG9mIG5vbi1QSUMgYXNzZW1ibHkgY29kZQo+IChlLmcuIGNv
bW1vbi94ODYvZGN0LWEuYXNtKSwgd2hpY2ggcmVzdWx0cyBpbiB0ZXh0cmVscywgd2hpY2ggYXJl
bid0Cj4gc3VwcG9ydGVkIGJ5IG11c2wtbGliYydzIGR5bmFtaWMgbGlua2VyLgo+IAo+IERpc2Fi
bGUgeDI2NCdzIGFzc2VtYmx5IGNvZGUgd2hlbiBjb21waWxpbmcgZm9yIHg4NiB3aXRoIFBJQy9Q
SUUgYW5kCj4gbXVzbC1saWJjIHRvIGF2b2lkIHRoaXMgcGFydGljdWxhciBpbmNvbXBhdGliaWxp
dHkuCj4gCj4gUmVwb3J0ZWQtYnk6IFlhbm4gTW9yaW4gPHlhbm4ubW9yaW5Ab3JhbmdlLmNvbT4K
PiBGaXhlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290L1pyc2lybnJ2Z3NFSXBB
SklAdGwtbG54LW55bWE3NDg2LTIvCj4gU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGou
bmV1c2NoYWVmZXJAZ214Lm5ldD4KPiAtLS0KPiAgcGFja2FnZS94MjY0L3gyNjQubWsgfCA2ICsr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpJJ3ZlIGFwcGxpZWQgdG8g
bWFzdGVyLCBidXQgdG8gYmUgaG9uZXN0LCBJJ20gbm90IHJlYWxseSB0aHJpbGxlZC4gSGFzCnRo
aXMgYmVlbiB0YWtlbiB1cCB0byB0aGUgbXVzbCdzIG1haW50YWluZXJzPyBJdCdzIHJhdGhlciBh
bm5veWluZyB0aGFuCm9uIGEgbWFqb3IgYXJjaGl0ZWN0dXJlIGxpa2UgeDg2IHdlIGNhbid0IGdl
dCB0aGUgYXNzZW1ibHkgb3B0aW1pemVkCngyNjQgY29kZS4KClRoYW5rcywKClRob21hcwotLSAK
VGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
