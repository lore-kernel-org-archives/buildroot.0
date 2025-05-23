Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B375DC54ED1
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 17:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 271B684018;
	Fri, 23 May 2025 17:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIc8bP8oq2yC; Fri, 23 May 2025 17:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 210AB8402A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 210AB8402A;
	Fri, 23 May 2025 17:42:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E93C368
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAA604031D
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGXMCnHmBChB for <buildroot@buildroot.org>;
 Fri, 23 May 2025 17:42:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.101;
 helo=smtp-outgoing-1703.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 13E6940FED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13E6940FED
Received: from smtp-outgoing-1703.laposte.net (smtp-outgoing-1703.laposte.net
 [160.92.124.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13E6940FED
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:42:25 +0000 (UTC)
X-mail-filterd: {"version":"1.9.1","queueID":"4b3stQ0JQwzKm48","contextId":
 "14f3c3fb-623d-4c25-8968-78638b55742f"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0115.laposte.net (SMTP Server) with ESMTP id 4b3stQ0JQwzKm48;
 Fri, 23 May 2025 19:42:22 +0200 (CEST)
X-mail-filterd: {"version":"1.9.1","queueID":"4b3stP6Qh6zKm44","contextId":
 "5c856c18-c5c5-40d9-9815-377717b662fa"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0115.laposte.net (SMTP Server) with ESMTPSA id 4b3stP6Qh6zKm44;
 Fri, 23 May 2025 19:42:21 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id DACC7670D667;
 Fri, 23 May 2025 19:42:30 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.98.1)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1uIWQN-0000000022f-0jG8; Fri, 23 May 2025 19:43:15 +0200
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Fri, 23 May 2025 19:43:11 +0200
Message-ID: <20250523174313.7056-4-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250523174313.7056-1-vincent.stehle@laposte.net>
References: <20250523174313.7056-1-vincent.stehle@laposte.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1748022142;
 bh=ZXEHPR3kYhCP/RVC7myZVjUMwZ+Z7AcekhmgJ3IN1xE=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=nJvSL/TA7hITmG6gn/r7L4xLNumpPJWLzgjjLzYciM9y7wTdIJEt9RaH7MHJg/Np4aX2T/WB9vKifVtvO4QTkOkFucdZxYBOg33JfD+1t4t7uatVzA2kR3HpMyqEN6bqgp1HMxlnmjBtpf24SDGDQERFZd2SAnGS8t6l1gE3Bhz6mVKTlmbMfFi71FFVLsUGPhWxyHiRGmT/ywml3RmccimJCf7Dv8mA1gR3aIv7mt1OUpPBE/Bar9Lsf1vyEn1KAbE9SNDz0XI07R0RLFYZN9kDFagpb+XWoKqTfG+dBimLeH7arKinuiIVHj8hSBRQbFJheWybG6ehs1V4D6aimg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=nJvSL/TA
Subject: [Buildroot] [PATCH 3/5] package/glibc: enable hppa support
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIHN1cHBvcnQgZm9yIEhQUEEuCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZp
bmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgpDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
Z21haWwuY29tPgotLS0KIHBhY2thZ2UvZ2xpYmMvQ29uZmlnLmluIHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2dsaWJjL0NvbmZpZy5p
biBiL3BhY2thZ2UvZ2xpYmMvQ29uZmlnLmluCmluZGV4IDUyNzUyZTk3NWUuLjk2MWI5ODRiM2Qg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZ2xpYmMvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvZ2xpYmMv
Q29uZmlnLmluCkBAIC00LDYgKzQsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfR0xJQkNfQVJDSF9T
VVBQT1JUUwogCWRlZmF1bHQgeSBpZiBCUjJfYXJtZWIKIAlkZWZhdWx0IHkgaWYgQlIyX2FhcmNo
NjQKIAlkZWZhdWx0IHkgaWYgQlIyX2FhcmNoNjRfYmUKKwlkZWZhdWx0IHkgaWYgQlIyX2hwcGEK
IAlkZWZhdWx0IHkgaWYgQlIyX2kzODYKIAlkZWZhdWx0IHkgaWYgQlIyX202OGtfbTY4awogCWRl
ZmF1bHQgeSBpZiBCUjJfbWlwcwotLSAKMi40Ny4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
