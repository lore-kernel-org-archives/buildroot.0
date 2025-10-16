Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390FECCD19A
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 15:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12531605C3;
	Thu, 16 Oct 2025 15:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id daLehlZkcxWa; Thu, 16 Oct 2025 15:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30D546059A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30D546059A;
	Thu, 16 Oct 2025 15:27:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22CB9968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 15:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09E7880642
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 15:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bcg_RDXlF8mj for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 15:27:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59F5180640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59F5180640
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59F5180640
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 15:27:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A4DAC1A1436;
 Thu, 16 Oct 2025 15:27:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7B13D6062C;
 Thu, 16 Oct 2025 15:27:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B2643102F22F7; 
 Thu, 16 Oct 2025 17:27:17 +0200 (CEST)
Date: Thu, 16 Oct 2025 17:27:03 +0200
MIME-Version: 1.0
Message-Id: <20251016-libldns_drill-v1-2-21bfa8c53896@bootlin.com>
References: <20251016-libldns_drill-v1-0-21bfa8c53896@bootlin.com>
In-Reply-To: <20251016-libldns_drill-v1-0-21bfa8c53896@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bernd Kuhls <bernd@kuhls.net>, nicolas.carrier@nav-timing.safrangroup.com, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760628438; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6/eRuOOCYdCUNQtBRj1i2HuyleerXLhdGOzUPmdQvkA=;
 b=VU18hkqm1dgtxPNg6OKT308SLGysn2Bs1PC+MZrOcH42VC6ErqJmHr7Xj30gPp97PGq3Zv
 tkaEEFzoopfJ+1QE31loXx4mXraYxA5++AXHAuMb0DAxdMZz0CCp4IcjlaqJeIsJKU0HHU
 z5MwGcU+n32aanh9YsfeIXDldMY7GKVxO49xkpT7LGMmK54Dbuqi5L2Ann+bkP+omQrQNu
 fxZnrBJ8BTG3Jn0LASpl6KSgQDXll9EdBK3cTWJ61e/h7KifTHHM0SS6O5BN1KXget73Z2
 P677R2QXcI2Ch/cexvihz0MFK4W6dIPDjO5OjbAl+AC0LAsE4zENpQA2eSKfEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=VU18hkqm
Subject: [Buildroot] [PATCH RESEND 2/2] support/testing: add basic runtime
 test for libldns/drill
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

QWRkIGEgc2ltcGxlIHRlc3QgZW5zdXJpbmcgdGhhdAotIGxpYmxkbnMgaXMgY29ycmVjdGx5IGJ1
aWx0IGFuZCBpbnN0YWxsZWQKLSBkcmlsbCBpcyBjb3JyZWN0bHkgYnVpbHQgYW5kIGluc3RhbGxl
ZAotIGRyaWxsIGlzIGFibGUgdG8gZXhlY3V0ZSBvbiB0aGUgdGFyZ2V0CgpTaWduZWQtb2ZmLWJ5
OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KIHN1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGlibGRucy5weSB8IDIxICsrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2xpYmxkbnMucHkgYi9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2xpYmxkbnMucHkKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uNmMxYTRk
YTNmMjQ5ZTNlYWQyMTEwNzYwZjhlNTkzOThmZWMxYWYwZgotLS0gL2Rldi9udWxsCisrKyBiL3N1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGlibGRucy5weQpAQCAtMCwwICsxLDIx
IEBACitpbXBvcnQgaW5mcmEuYmFzZXRlc3QKK2ltcG9ydCBvcworCisKK2NsYXNzIFRlc3RMaWJM
ZG5zKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6CisgICAgY29uZmlnID0gaW5mcmEuYmFzZXRlc3Qu
QkFTSUNfVE9PTENIQUlOX0NPTkZJRyArIFwKKyAgICAgICAgIiIiCisgICAgICAgIEJSMl9QQUNL
QUdFX0xJQkxETlM9eQorICAgICAgICBCUjJfUEFDS0FHRV9MSUJMRE5TX0RSSUxMPXkKKyAgICAg
ICAgQlIyX1RBUkdFVF9ST09URlNfQ1BJTz15CisgICAgICAgICMgQlIyX1RBUkdFVF9ST09URlNf
VEFSIGlzIG5vdCBzZXQKKyAgICAgICAgIiIiCisKKyAgICBkZWYgdGVzdF9ydW4oc2VsZik6Cisg
ICAgICAgIGNwaW9fZmlsZSA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwg
InJvb3Rmcy5jcGlvIikKKyAgICAgICAgc2VsZi5lbXVsYXRvci5ib290KGFyY2g9ImFybXY1IiwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgIGtlcm5lbD0iYnVpbHRpbiIsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICBvcHRpb25zPVsiLWluaXRyZCIsIGNwaW9fZmlsZV0pCisgICAgICAg
IHNlbGYuZW11bGF0b3IubG9naW4oKQorCisgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soImRyaWxs
IC12IikKCi0tIAoyLjUxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
