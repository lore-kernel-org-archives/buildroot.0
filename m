Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA30C5B572
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 14:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FC9F60802;
	Tue, 11 Aug 2026 14:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJSX9gs4RaET; Tue, 11 Aug 2026 14:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DB9560604
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786459256;
	bh=buYW/k1TK7oxSP6/OHXe4UXyG4PgDiPt4RD1GzDgFRs=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=PPv+bNLNf5li4BYtttlgMBNe9aruVdP1rAUsZWY6XShwR2mVZ37ww+HAqCyj5Rre8
	 p1fuYIRUTQoJ/SsfxDR6xoauf5kKSQRHFL5cRpzJ8uw5DfTp9miUVEVnslsavpyBLn
	 gCzmQCcHHH/Sm23zqZvCi+gUMK7lfpnW98dkEnwnoND9zbMsUxBadVbNBAxLxG2Z+i
	 RfTBgzqiFHKvjvIe6iRbxbSVuV91pTXH4gzNytr3VdvzsvAIMb+rlVlyIW/JXgY/CG
	 4qu7GUFrY8XfjY/LpJI7M6dOsgsmxjDirX2FrqyVN1KiQ+StzkhefIF/lFLYqqj2ts
	 q86+xdjXimJJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DB9560604;
	Tue, 11 Aug 2026 14:40:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA44A28A
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFF984067C
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNPcexMCkAyO for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 14:40:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02A44405E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02A44405E4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02A44405E4
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:40:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 251804E411BB
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:40:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E75D16033C
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:40:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2F7D711C48C8D; 
 Tue, 11 Aug 2026 16:40:49 +0200 (CEST)
Date: Tue, 11 Aug 2026 16:40:40 +0200
MIME-Version: 1.0
Message-Id: <20260811-add_missing_tests_in_developpers-v1-1-4ee158838089@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNWwrCMBBG4a2UeTbQBJTgVkRCLn/riKYhE4tQu
 nejPn4v52wkqAyh87BRxcrCS+7Qh4HizecZilM3mdGcRqu18im5J4twnl2DNHGcXcKKx1IKqig
 bjj4AxsYJ1DOlYuL3b3G5/i2vcEds3y7t+wcHha20hAAAAA==
X-Change-ID: 20260811-add_missing_tests_in_developpers-8b5abee28cfe
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786459250; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=kRAF0IQrHBop8XWMw+4PYl747xGYQf2BUefT+0jBZ4o=;
 b=SvX3sY692ooYLyJnPkbA7zUXnCmbhNkKp407AnLdvARSh5ckYUQdY/jR/qIDhCUUPrRER6
 5t1QUsh9h51Wp0Hf4CC7yXJtp2Kahptukm38mMSNHqlUKJWicQ24PChLwzFneASK3e2D23
 N+61LY76rjjnz1ntRhQ+NFpp2252slgz5zYHyPhDWH0SUnTQBIqrFBrzB5Dy3EP19xQhxV
 GH4VBWGEJljXWx1AEL4CJ10hFEdIzhocw8wtG7Ly5H7mumf0H5HIN9F10VbOudE8SXzs/J
 sR1uZDSzZlUpTX4ZWBuvkrHlqi2W92xHFMFWCe7h5ZgiS5zMey15E7f+OBIJ0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=SvX3sY69
Subject: [Buildroot] =?utf-8?q?=5BPATCH=5D_DEVELOPERS=3A_add_Alexis_Lotho?=
 =?utf-8?q?r=C3=A9_for_libldns_and_python=5Fscp_tests?=
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

V2hlbiBhZGRpbmcgdGhlIGxpYmxkbnMgYW5kIHB5dGhvbl9zY3AsIHRoZSBjb3JyZXNwb25kaW5n
IHRlc3RzIHdlcmUgbm90CmFkZGVkIHRvIERFVkVMT1BFUlMsIHByZXZlbnRpbmcgY29ycmVjdCBu
b3RpZmljYXRpb25zIGluIGNhc2Ugb2YgdGVzdHMKZmFpbHVyZXMuCgpBZGQgdGhlIG1pc3Npbmcg
ZW50cmllcyB0byBlbmFibGUgcHJvcGVyIGF1dGhvciBub3RpZmljYXRpb25zIGluIGNhc2Ugb2YK
ZmFpbGluZyB0ZXN0cy4KClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxv
dGhvcmVAYm9vdGxpbi5jb20+Ci0tLQogREVWRUxPUEVSUyB8IDIgKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwpp
bmRleCA3NTYwNzE4M2M2MTQuLjQ0NjA1MjM0NDc1YiAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUwor
KysgYi9ERVZFTE9QRVJTCkBAIC0xNTgsNiArMTU4LDggQEAgTjogCUFsZXhpcyBMb3Rob3LDqSA8
YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+CiBGOglwYWNrYWdlL2xpYnhtbHNlYzEvCiBGOglw
YWNrYWdlL29wZW5zY2FwLwogRjogCXBhY2thZ2UvcHl0aG9uLXNjcC8KK0Y6CXN1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGlibGRucy5weQorRjoJc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF9weXRob25fc2NwLnB5CiAKIE46CUFsaXN0YWlyIEZyYW5jaXMgPGFs
aXN0YWlyQGFsaXN0YWlyMjMubWU+CiBGOglib2FyZC9zaWZpdmUvCgotLS0KYmFzZS1jb21taXQ6
IGQzOGI0OTE1ZTk0MzdjNTQ5MjgzNjkxNGMwYTBmZmYxMmI0ZjEwMzEKY2hhbmdlLWlkOiAyMDI2
MDgxMS1hZGRfbWlzc2luZ190ZXN0c19pbl9kZXZlbG9wcGVycy04YjVhYmVlMjhjZmUKCkJlc3Qg
cmVnYXJkcywKLS0gIApBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
