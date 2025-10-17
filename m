Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77E0CCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 07:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C533160BD9;
	Fri, 17 Oct 2025 07:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EbLNpeMhyvbM; Fri, 17 Oct 2025 07:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B6DD60BB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B6DD60BB8;
	Fri, 17 Oct 2025 07:38:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C24FC1EB1
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A88AE81281
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTEGKWffPsF9 for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 07:38:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BA05D8127C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA05D8127C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA05D8127C
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:38:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 224474E40B36;
 Fri, 17 Oct 2025 07:38:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ECE66606DB;
 Fri, 17 Oct 2025 07:38:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2856B102F2334; 
 Fri, 17 Oct 2025 09:38:09 +0200 (CEST)
Date: Fri, 17 Oct 2025 09:36:26 +0200
Message-Id: <20251017-libldns_drill-v2-0-f5479778848f@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPrx8WgC/13M0QrCIBTG8VcZ5zrjaLlJV71HjMip7YBp6JBi+
 O7ZoJsu/x98vxWyTWQznLoVki2UKYYWYtfBNN/C3TIyrUGgkKiwZ560NyFfTSLvGSruuHTH3ko
 N7fNM1tFr8y5j65nyEtN74wv/rj9p+JMKZ8ikUQM/OI2qx7OOcfEU9lN8wFhr/QA7cP8mrAAAA
 A==
X-Change-ID: 20250806-libldns_drill-081f15f46e5b
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bernd Kuhls <bernd@kuhls.net>, nicolas.carrier@nav-timing.safrangroup.com, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760686695; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=9oPRu+BK1na+6xt3MIJaNdz+mztb+/wXxtjYn1yT4d0=;
 b=TPQSJjZ5pCXcBSzodoHmakZjHBEBLvDPfclkhaOvRoz0WKoK5bqLGYDvhvbUNQfW362ZHW
 iIr5XrSSGcsD1S8yBB4sHXbJUfMlInccKekz8qxg0LlsIZRKG5NPKRzOmVXpsXB3bnUNZQ
 F5m09QlW6C1aPn9Goqo7U/bzKRxJ9eRNztBy1jdBzPiDfDp8qrNuaptW5fZdFaeAII+D14
 Wa6LlaBP8a9C5A6orKp/w6+kj5YSOzj0uJCt6jnpbzuukFSBT4guMIzms5AkAmLpoEy8V5
 SknSSiPiXdLxxSGUuyprceEOXB1gzPj8iNx+TuCYUSJxlNl6+3NW3U85vKMorw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=TPQSJjZ5
Subject: [Buildroot] [PATCH v2 0/2] package/libldns: allow to build drill
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

SGVsbG8sCnRoaXMgaXMgdGhlIHYyIG9mIGEgc21hbGwgc2VyaWVzIGFpbWluZyB0byBhbGxvdyBi
dWlsZGluZyB0aGUgZHJpbGwKY29tbWFuZGxpbmUgdG9vbCwgc3VwcG9ydGVkIGJ5IGxpYmxkbnMg
cGFja2FnZS4gVGhpcyBpcyBhIHNtYWxsIENMSSB0b29sCmFsbG93aW5nIHRvIHBlcmZvcm0gYW5k
IGRlYnVnIEROUyByZXF1ZXN0cy4gV2hpbGUgYXQgaXQsIHRoZSBzZXJpZXMKYnJpbmdzIGluIGEg
c21hbGwgcnVudGltZSB0ZXN0IHZhbGlkYXRpbmcgdGhhdCB0aGUgYmluYXJ5IChhbmQgc28sIHRo
ZQpsaWJyYXJ5IGl0IGRlcGVuZHMgb24pIGlzIGNvcnJlY3RseSBidWlsdCwgaW5zdGFsbGVkLCBh
bmQgdGhhdCBpdCBpcwphYmxlIHRvIHJ1biBvbiB0aGUgdGFyZ2V0IGFyY2hpdGVjdHVyZS4KClsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyNTA4MDctbGlibGRuc19kcmls
bC12MS0wLTVkODcxM2ZiMDg2MEBib290bGluLmNvbS8KClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBM
b3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOgot
IEFkZGVkIG1pc3NpbmcgU29CIGluIGZpcnN0IHBhdGNoCi0gcmVtb3ZlIHVuZWNlc3NhcnkgImRl
ZmF1bHQgbiIgaW4gQ29uZmlnLmluCi0gZml4ZWQgY29tbWVudCBhYm91dCB0b29sY2hhaW4gZmVh
dHVyZXMgcmVxdWlyZW1lbnQKLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjUwODA3LWxpYmxkbnNfZHJpbGwtdjEtMC01ZDg3MTNmYjA4NjBAYm9vdGxpbi5jb20KCi0t
LQpBbGV4aXMgTG90aG9yw6kgKDIpOgogICAgICBwYWNrYWdlL2xpYmxkbnM6IGFkZCBhbiBvcHRp
b24gdG8gYnVpbGQgYW5kIGluc3RhbGwgZHJpbGwKICAgICAgc3VwcG9ydC90ZXN0aW5nOiBhZGQg
YmFzaWMgcnVudGltZSB0ZXN0IGZvciBsaWJsZG5zL2RyaWxsCgogcGFja2FnZS9saWJsZG5zL0Nv
bmZpZy5pbiAgICAgICAgICAgICAgICAgICAgIHwgMTMgKysrKysrKysrKysrKwogcGFja2FnZS9s
aWJsZG5zL2xpYmxkbnMubWsgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrKysrKwogc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9saWJsZG5zLnB5IHwgMjEgKysrKysrKysrKysr
KysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKykKLS0tCmJhc2UtY29t
bWl0OiAwYzJhMGE0NGYwMGUyYWI5YjQxYTJiYzNiZjAxOWUxN2VmMzdjNDcxCmNoYW5nZS1pZDog
MjAyNTA4MDYtbGlibGRuc19kcmlsbC0wODFmMTVmNDZlNWIKCkJlc3QgcmVnYXJkcywKLS0gCkFs
ZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
