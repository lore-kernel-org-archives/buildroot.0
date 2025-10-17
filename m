Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18E4CCD19A
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 07:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 627938128C;
	Fri, 17 Oct 2025 07:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7RZx1eY6VXI; Fri, 17 Oct 2025 07:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFBBE8127F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFBBE8127F;
	Fri, 17 Oct 2025 07:38:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EC6ED8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C25640806
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBTfzjKMLudc for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 07:38:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DED19407E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DED19407E9
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DED19407E9
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:38:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0F012C041DC;
 Fri, 17 Oct 2025 07:37:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5521E606DB;
 Fri, 17 Oct 2025 07:38:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 85FA8102F2337; 
 Fri, 17 Oct 2025 09:38:16 +0200 (CEST)
Date: Fri, 17 Oct 2025 09:36:28 +0200
MIME-Version: 1.0
Message-Id: <20251017-libldns_drill-v2-2-f5479778848f@bootlin.com>
References: <20251017-libldns_drill-v2-0-f5479778848f@bootlin.com>
In-Reply-To: <20251017-libldns_drill-v2-0-f5479778848f@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bernd Kuhls <bernd@kuhls.net>, nicolas.carrier@nav-timing.safrangroup.com, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760686696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6/eRuOOCYdCUNQtBRj1i2HuyleerXLhdGOzUPmdQvkA=;
 b=ka/+cdED1q2nOzjP4IZiVOLGhDXUebev/onShi27mJ72iAznFcc1XOgbg48hZdlGfke+pI
 O1QLYbZM+wWCthlEAIUV87K/WqBj/wgbLYnB2hYeMEklDO550rGJ42sU96hxxW37ob3bo0
 coUttb1FWbI3/DNBASIo8W0gu6cnNV3WgCaT54FeekyNtnn5hxPr32Tdkgb3ZAO8Kqkqy8
 mQ/qv8lBFfbuajjggrlK2rxPEoGOjLN/cJ37jb1zEmEGyIcmTB6UfKJGdLAASEl4YR+G3N
 N1JmuyituW/f4T6M67GMlCSZDdoc09d29TcMhfae/inEOecNNUfb4p/TKQoYzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ka/+cdED
Subject: [Buildroot] [PATCH v2 2/2] support/testing: add basic runtime test
 for libldns/drill
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
