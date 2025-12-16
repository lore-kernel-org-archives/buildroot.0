Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED59ED609AA
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 15:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BF42823C6;
	Tue, 16 Dec 2025 15:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9VTVd7J_dknF; Tue, 16 Dec 2025 15:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 437C38236A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765899207;
	bh=WkiJDkrYIkxkE4wpLPQa44Nx1xoND5a0WMUtkSghlts=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=SyMFmqqtgBmsy1TyWePloG/TQi/+F2CohTHc9LDfsmI9ey+LCwCmy1zeycUymnvmx
	 CEvWDQXMaunEENHwkcw8l2SHI9uS7Ug3k0f9GEdluw5vzf9aTQU0bUdcNzoV9i8I2A
	 44cnscdOdUrCtthT/8TUCMabUF9EfFuBQ28C+L+Xm4ribGWWSQMpRIZwgNxwwQkRMe
	 2D5FcKcDOTew1LLh9to1kiktaSAmIpChkzBlmVe9LH61GH1GjUljAZVwM86gLwi6S/
	 AVHlL17pgpfPkstWSWVWFbAi5Qp6Ez69ATq4BKSdUcYFGvYx7jUarcB8jrcm+/WoGf
	 +jXMrlEOkOTag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 437C38236A;
	Tue, 16 Dec 2025 15:33:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 400C8372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31EDC40071
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQh9WI3On05N for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 15:33:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A5A940593
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A5A940593
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A5A940593
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:33:22 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B68D12C894D0;
 Tue, 16 Dec 2025 16:33:20 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 16:33:21 +0100
Message-ID: <20251216153322.653758-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1765899200; bh=FbL+9j0EsxMmQUK3hgnwP+baBJvNp12RGuhDZlhloHw=;
 h=From:To:Cc:Subject:Date;
 b=coJOhPtcEpw7JK0ycWngsQji5cO9kj0VJeYKSj+haWAnYXKzSzGMNKn3v2UL8XB4B
 c3Nx3jy97hIp8V093zLylSCh3bn2h+5GWLq9GtY/T4M6f6epSGBPierNfadsXNuZAU
 Pt/UL0ffTHB71lqthsB3BC/woZeJcSnlSB6Y99Po1PoZZ9MZEayykVIfn7nSDs3Vtp
 oi7WOjCF0xXh4CRQl8Dv0C96G6auO9pTZJUsNLNaMgao2z1IWB8sudCiOGbukiCvFd
 1q/dPjt7H9Q22EbIBGvHDCipLTfzmgFPXcb66gkWDF1ylZeKAnxc3M8h+n0dAWDhBI
 W/oQwdGZiVjsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=coJOhPtc
Subject: [Buildroot] [PATCH] package/python-fastapi: bump to 0.124.4
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Two more bugfix releases:

* https://github.com/fastapi/fastapi/releases/tag/0.124.3
* https://github.com/fastapi/fastapi/releases/tag/0.124.4

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index dc6549d670..14f14a411f 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  d82c1c5040c1d29b7e0cb4bce9ac0e51  fastapi-0.124.2.tar.gz
-sha256  72e188f01f360e2f59da51c8822cbe4bca210c35daaae6321b1b724109101c00  fastapi-0.124.2.tar.gz
+md5  8deab8ab1b623e1428e4753110295297  fastapi-0.124.4.tar.gz
+sha256  0e9422e8d6b797515f33f500309f6e1c98ee4e85563ba0f2debb282df6343763  fastapi-0.124.4.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 34aa3781b5..36954f8b0e 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.124.2
+PYTHON_FASTAPI_VERSION = 0.124.4
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/58/b7/4dbca3f9d847ba9876dcb7098c13a4c6c86ee8db148c923fab78e27748d3
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/cd/21/ade3ff6745a82ea8ad88552b4139d27941549e4f19125879f848ac8f3c3d
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
