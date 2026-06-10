Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CDECD98C6
	for <buildroot@archiver.kernel.org>; Wed, 10 Jun 2026 16:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 501E640CB2;
	Wed, 10 Jun 2026 16:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b87vsiyIfdZ0; Wed, 10 Jun 2026 16:15:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C09540CB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781108115;
	bh=yTHj/3pRd51pEA8Y015vOgPPBJndIq9ZeoHP1j2Ez9U=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r18OZhj3MJzZWn3mtuNVL/CUyeImvbsGfSEMS/DRkdIGYwWVJHZ3jwd5j/RD00LuQ
	 ceORg6PU4I0k2Q5xzM6o5P2ns/+iD4glcTpO9GIR/+Nsf0uWTDg2mMC5wik4OoDQi+
	 jLN226zV/A0RlLKDmwnJZnoJO7Dr7cPhKtGmyinPsQnkSKyPdFOGrct65B57lr1VDF
	 c8b+sE6+PqR61oik76Y0Q+TjiWbIO6XUk40pru/CMQC0MlmMx5chZBLC+kanS05A6h
	 Xx3ciEYG3zbDCKvm4QFON3b36tlTPInT8LRVpX7uoZf74cwFrvZO0FO8ud008vpO2x
	 7D8fTi667k13Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C09540CB7;
	Wed, 10 Jun 2026 16:15:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70043196
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 16:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5639E40CB7
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 16:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9tUq2NeqIgBL for <buildroot@buildroot.org>;
 Wed, 10 Jun 2026 16:15:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2654E40CB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2654E40CB2
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2654E40CB2
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 16:15:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 322E01A08ED;
 Wed, 10 Jun 2026 16:15:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EFF515FFC9;
 Wed, 10 Jun 2026 16:15:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B7E5C106B90E9; 
 Wed, 10 Jun 2026 18:15:05 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 10 Jun 2026 18:15:04 +0200
Message-Id: <DJ5I4NMH7D4O.1AHCNRTCHPJHG@bootlin.com>
To: "Maxime Chevallier" <maxime.chevallier@bootlin.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Thomas Petazzoni via
 buildroot" <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1781108108; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=lJDy0Zzgc94h13hsArwjR53RmRPciPlDsDJvi+C/cl8=;
 b=TfYYCSuZ3+2m3LrqgwNmYhNGV3RT2etsI7AYx9RVwjcF9tp9Q4b0P4omU6+QDfdqR1ERYu
 ka0ygsuo3sfdaGHtSH9FGhu0lK5gtXX7yINzOmgxkjbLqh7tGKXY1pj5kAw81Kh/qYp+qN
 UOLbmU9oFP5sedXg6f60wMAL4vcekqeT9OZP0EhXzWpQECfpbmplBSThOBr1aUDrZR1R7u
 8EfLZUcMdvtJCJ+GWELWevwibFzZtOw5+UzAzCNq3wz5EuOnvUW3xRV++TvTsHZSn/be/v
 pE00qUnC2Ygwhyvreogu6LS/I/kB3K2jDf0E/Mu0IVfG0ieFetmz2FsMDKarlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=TfYYCSuZ
Subject: [Buildroot] Training improvement brain storming sesssion
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

RGVhciB0cmFpbmluZyBjb2xsZWFndWVzLAoKaGVyZSBpcyBhIHNob3J0IHN1bW1hcnkgb2YgdGhl
IHBvaW50cyB3ZSBoYXZlIGRpc2N1c3NlZCBhbmQgdmFsaWRhdGVkIGFzCmFjdGlvbnMgdGhpcyBh
ZnRlcm5vb24gd2hpbGUgdHJ5aW5nIHRvIGZpbmQgd2F5cyB0byBpbXByb3ZlIG91cgp0cmFpbmlu
Z3M6CgotIE1heGltZTogcHJlcGFyZSBhIGtpbmQgb2YgdGVhY2hpbmctdHJhaW5pbmctbWVudG9y
aW5nIHNlc3Npb24sIGdpdmluZwogIGhpbnRzIGFuZCBnb29kIGhhYml0cyB0byBvdGhlciB0cmFp
bmVycyB0byBpbXByb3ZlIHRoZWlyIHRlYWNoaW5nCiAgc2tpbGxzCi0gZXZlcnkgdHJhaW5lcjog
YWRkIG1vcmUgZGlhZ3JhbXMgYW5kIGRyYXdpbmdzIGluIHNsaWRlcywgcG9zc2libHkgZXZlbgog
IHJlcGxhY2luZyBwYXJ0cyB3aXRoIGxhcmdlIGFtb3VudCBvZiB0ZXh0IGJ5IHBpY3R1cmVzIG9u
bHkKLSBBbGV4aXM6IGludHJvZHVjZSBwZXJpb2RpYyBxdWl6emVzIGluIHRyYWluaW5nIHNsaWRl
czogZmluZCB0aGUKICByZWxldmFudCB0b29sIHRvIGRvIHNvIChCaWcgQmx1ZSBCdXR0b24gPyBN
ZW50aW1ldGVyID8gRGlnaXN0b3JtID8KICBLYWhvb3QgPykgYW5kIGZpbmQgaG93IHRvIGludGVn
cmF0ZSBzdWNoIHRvb2wgaW4gb3VyIHRyYWluaW5nIHNlc3Npb25zCiAgbWFuYWdlbWVudAotIGV2
ZXJ5IHRyYWluZXI6IHJlLXNwbGl0IGxhYnMgaW50byBtdWx0aXBsZSBzbWFsbGVyIGxhYnMgdG8g
aGF2ZSBtb3JlCiAgZnJlcXVlbnQgInNsaWRlcyBicmVha3MiCi0gVGhvbWFzOiBuZXh0IHRpbWUg
d2UgZ2V0IGEgdHJhaW5pbmcgcmVxdWVzdCBmcm9tIGEgZm9yZWlnbiBjdXN0b21lcgogIChlZyBV
UyksIHByb3Bvc2UgYSBuZXcgc2NoZWR1bGUgYmFzZWQgb24gM2ggc2Vzc2lvbnMgcmF0aGVyIHRo
YW4gNGguCgpBbGV4aXMKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
