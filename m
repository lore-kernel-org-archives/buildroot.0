Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB11E674A9
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 12:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44E128084D;
	Mon, 22 Dec 2025 12:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEle6rSEkpJy; Mon, 22 Dec 2025 12:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 678A381E47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766407700;
	bh=9eHEHOr4SYk0QnIuNMNwZrcsHJgDlBAyzFyFmT6xHgA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=kjKjjtjFfhSt75T3S6pHceTc+wQGgFrr4xJ/tjBYT5l2mj6xWyn7ezosmh8E/7qdz
	 aq4LdsLs0261o9cm6LdhKLWRKUNNolIGE+hapqJY3P/BLl3lKHrsxxhFWdQekNSERe
	 enI7BMaSUiJ6h52s+lecy6B86XY1xBc11b9Com3cSc1FluTBiuYBlJCkkFhQT2C4Hx
	 0Dr0d22/4BJqg/joG8ZiuO9K/vuLwgAl6kUN2gT04Nw/COpQbg5WsjO2xOhKLjOR4E
	 3f9tUDhqwS6T/JoQmlQlBaI+5N7G6K+KR4HdnFn3KHd9lMq+QUbwC+fxsQEaRoQ+yR
	 PmpcBGSgdBuAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 678A381E47;
	Mon, 22 Dec 2025 12:48:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6504195
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 12:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C896A40298
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 12:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFwFGk1FBhP4 for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 12:48:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C9F6F40292
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9F6F40292
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9F6F40292
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 12:48:17 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 990D72C80CD5;
 Mon, 22 Dec 2025 13:48:14 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 22 Dec 2025 13:48:16 +0100
Message-ID: <20251222124816.82310-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1766407694; bh=saMJA1kob6l5rer2ZWPYCZSX87RrY5++jGjvIFS0xRc=;
 h=From:To:Cc:Subject:Date;
 b=oqJRS1EjnhzXBbNhUGlG44s1ItbT9lhMvduO58oIXbDQDUudAuWa+Cw/LpXl1ccE/
 KOh0rh+PkkW2+bAZQpjWLRQYDq0wF5ZEK96cqqTKy3UtAxlgnf+HdilpeV8uukiPk/
 g2CDUrdcIn082n/FLpAmZViut934zCOj5YCS1Z7aTfbr/tEck4pfGpZSP6BR1i5Y+h
 xZfcYICFmfIwAlKLyv0w6TEGXJSTuwm3OHDwxveGsxkUkvct+xpF1hFFm7yW2aPu/H
 UR4MrgG8aQpBohZU0C/guwInK6VLdlxnvRYL6XPRpH9YSoTrJhCr87GUP8ahbG+Ayx
 KvSMwXkAyV0pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=oqJRS1Ej
Subject: [Buildroot] [PATCH] package/python-uvicorn: bump to 0.40.0
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

Changes:
* https://github.com/Kludex/uvicorn/releases/tag/0.39.0
* https://github.com/Kludex/uvicorn/releases/tag/0.40.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index dd8c2bbabe..9049083cf6 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  ee4fbbe43a1e58e6624adb2763161bee  uvicorn-0.38.0.tar.gz
-sha256  fd97093bdd120a2609fc0d3afe931d4d4ad688b6e75f0f929fde1bc36fe0e91d  uvicorn-0.38.0.tar.gz
+md5  9f7303c20d72660dc37ac54d697d0881  uvicorn-0.40.0.tar.gz
+sha256  839676675e87e73694518b5574fd0f24c9d97b46bea16df7b8c05ea1a51071ea  uvicorn-0.40.0.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index ba27cd8052..11d347a366 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.38.0
+PYTHON_UVICORN_VERSION = 0.40.0
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/cb/ce/f06b84e2697fef4688ca63bdb2fdf113ca0a3be33f94488f2cadb690b0cf
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/c3/d1/8f3c683c9561a4e6689dd3b1d345c815f10f86acd044ee1fb9a4dcd0b8c5
 PYTHON_UVICORN_SETUP_TYPE = hatch
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
