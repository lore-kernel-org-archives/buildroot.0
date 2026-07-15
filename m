Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22736C44501
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 12:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03F4F6062A;
	Wed, 15 Jul 2026 12:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlehIt7FXYF9; Wed, 15 Jul 2026 12:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B2C76069D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784118618;
	bh=Zc4mCveLA+DUCd/QLx5TOH1hlNkG2hpNTjVIQqH9jy8=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=nI3Shsv4NR6zREtcOYlFXR9Xgb/lQUTwEk1jZ58MHfj8w47r8xnkYTcigkKVnf59e
	 Pnx2rPErtLswobeXhJyEya1amLPoGEx2nuzEIZJ53rTdeCMgzdJf1f+Q0b7DpKRzmR
	 oHH/Kl/TPTnR8c2UfKh+elD92QJXVAyoqpQK7kUDNuo+lRPTD7um/0S2Cy5GXVp3lJ
	 oRCgKiE4/NNTHb5cOQ/K4C5zsqLVjBhuS5s5QfovkaUgm6c4CVH7kZdbthah8VZD8c
	 HAkBrybMH8a6uNj0sUQBiXwZkvpdx7JQ3DqHPsnbvSlWBOMskbAtSqnuTTmtqAfcu/
	 L57r/YXjE/owg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B2C76069D;
	Wed, 15 Jul 2026 12:30:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AF8E499
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 12:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CA5A400A2
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 12:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYtYa7doa1lk for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 12:30:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D63A40051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D63A40051
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D63A40051
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 12:30:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5AF011A0FF1;
 Wed, 15 Jul 2026 12:30:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2F98C6035C;
 Wed, 15 Jul 2026 12:30:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8AD5111BD3AD3; 
 Wed, 15 Jul 2026 14:30:10 +0200 (CEST)
Date: Wed, 15 Jul 2026 14:30:00 +0200
MIME-Version: 1.0
Message-Id: <20260715-legal-info-localdef-v1-1-5c44106ea59d@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMAyA4VeRnA1YxY35KsNDFhOXUdrR6hiI7
 77qjt/h/zfIkkwyDNUGST6WLYYCV1fATwqzoE3F0Dbtpbm6Hr3M5NGCRvSRyU+iyHxjUkeddgS
 lfCdR+57X+/h3Xh8v4eVYwb7/ABDjn9F3AAAA
X-Change-ID: 20260715-legal-info-localdef-cc9caf1a3f3a
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1784118612; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=fPdj5IUSewsDyD0S7Pgezpevif2d7ZNLBT4t/bqZRuA=;
 b=Pm4/kRqIEQlou5K4f0Djqh71afxTgItKhqnouHpL8IZdBGbi0S9j2s0csVau3LcqWuWHZM
 2UOytuiSA26QCtTJ1kDdV9B+boeeGIDPOyCIRN6WdAjg9DoOb19CyDcVLob/xoiUIOzalh
 BC1MLnYJ9e3Ig9VZvxBjSiuPcaFaf/Vm6f6f2AoPnjXcZ/4YPrR9JN1QqZSnIxUYU1D1Sr
 39FPUFPp90Rt2Dlb42OVe9gpBu0ZLgiXh0UptlKNKoDqpqTY57ffP5F+u3iqp0NH00cuqP
 5Ks5boH96TKYrZeH1gqv+g2m+NkDBG46+sTbk3VpbbSBoG4+BsbmYyN7IF0vfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Pm4/kRqI
Subject: [Buildroot] [PATCH] package/localedef: add license data
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

V2hlbiBydW5uaW5nIGBtYWtlIGxlZ2FsLWluZm9gIGZvciBhIGJ1aWwgYmFzZWQgb24gZ2xpYmMg
YW5kIGNvbmZpZ3VyZWQKdG8gZ2VuZXJhdGUgc29tZSBsb2NhbGUgZGF0YSAoZWc6IEJSMl9HRU5F
UkFURV9MT0NBTEU9IkMuVVRGLTgiKSwgdGhlCmZvbGxvd2luZyB3YXJuaW5nIGlzIHByaW50ZWQ6
CgogIFdBUk5JTkc6IGxvY2FsZWRlZi0yLjQzLTQ1LWdkYWU0MjViNTU0MjA3ZjdjNDU5OWM3ZmFj
NzA3YWQ0YzA4NTQ1Njc0OiBcCiAgY2Fubm90IHNhdmUgbGljZW5zZSAoSE9TVF9MT0NBTEVERUZf
TElDRU5TRV9GSUxFUyBub3QgZGVmaW5lZCkKCkRlZmluZSB0aGUgbWlzc2luZyBMT0NBTEVERUZf
TElDRU5TRSBhbmQgTE9DQUxFREVGX0xJQ0VOU0VfRklMRVMgdG8gZ2V0CnJpZCBvZiB0aGUgd2Fy
bmluZy4gVGhlIGhlYWRlciBpbiBsb2NhbGUvcHJvZ3JhbXMvbG9jYWxlZGVmLmMgc3RhdGVzCnRo
YXQgdGhlIHByb2dyYW0gaXMgcmVsZWFzZWQgdW5kZXIgR1BMLCBzbyB1c2UgR1BMdjIsIGFzIGFs
c28gc3Qgc3RhdGVkCmJ5IGdsaWJjLm1rIGluIHRoZSBnbGliYyBwYWNrYWdlIGluIGJ1aWxkcm9v
dC4KClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxp
bi5jb20+Ci0tLQpVcCB0byBteSBrbm93bGVkZ2UgdGhpcyBwYWNrYWdlIG5ldmVyIGhhZCB0aGUg
bmVlZGVkIGxpY2Vuc2UgZGF0YSwgc28KYWxsIGN1cnJlbnRseSBtYWludGFpbmVkIHZlcnNpb25z
IGFyZSBhZmZlY3RlZCBieSB0aGUgaXNzdWUuCi0tLQogcGFja2FnZS9sb2NhbGVkZWYvbG9jYWxl
ZGVmLm1rIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbG9jYWxlZGVmL2xvY2FsZWRlZi5tayBiL3BhY2thZ2UvbG9jYWxlZGVmL2xv
Y2FsZWRlZi5tawppbmRleCA3MzJlZDZkNGFkMWQuLmFhN2RiYTJiNTE3MCAxMDA2NDQKLS0tIGEv
cGFja2FnZS9sb2NhbGVkZWYvbG9jYWxlZGVmLm1rCisrKyBiL3BhY2thZ2UvbG9jYWxlZGVmL2xv
Y2FsZWRlZi5tawpAQCAtMTEsNiArMTEsOCBAQCBMT0NBTEVERUZfVkVSU0lPTiA9IDIuNDMtNDUt
Z2RhZTQyNWI1NTQyMDdmN2M0NTk5YzdmYWM3MDdhZDRjMDg1NDU2NzQKIExPQ0FMRURFRl9TT1VS
Q0UgPSBnbGliYy0kKExPQ0FMRURFRl9WRVJTSU9OKSQoQlJfRk1UX1ZFUlNJT05fZ2l0KS50YXIu
Z3oKIExPQ0FMRURFRl9TSVRFID0gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvZ2xpYmMuZ2l0
CiBMT0NBTEVERUZfU0lURV9NRVRIT0QgPSBnaXQKK0xPQ0FMRURFRl9MSUNFTlNFID0gR1BMLTIu
MCsKK0xPQ0FMRURFRl9MSUNFTlNFX0ZJTEVTID0gQ09QWUlOR3YyCiBIT1NUX0xPQ0FMRURFRl9E
TF9TVUJESVIgPSBnbGliYwogCiBIT1NUX0xPQ0FMRURFRl9ERVBFTkRFTkNJRVMgPSBcCgotLS0K
YmFzZS1jb21taXQ6IDY0M2Y0ODBmNDM3OWFmZTU2NzdlYzM5OWM4MDJiOGQzMzczNGI2MDEKY2hh
bmdlLWlkOiAyMDI2MDcxNS1sZWdhbC1pbmZvLWxvY2FsZGVmLWNjOWNhZjFhM2YzYQoKQmVzdCBy
ZWdhcmRzLAotLSAgCkFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
