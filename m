Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85ABEE674A9
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 12:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 487C081E55;
	Mon, 22 Dec 2025 12:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fmrZQcMht1y; Mon, 22 Dec 2025 12:54:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E0FD81E5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766408066;
	bh=pQJxsVYvl8PXx8Fd+EUX6mM+D6r+PpKatVZ5ZAgO2jA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=qjISZV/Zq6m7FnXPl9CnAwh6xJcdr6KCFDOK3qDfUVBsG7IZeSPmjqRU4G1hOnv4E
	 HdIkKwT+BoUKzyBqd2yKWKnPJwmfVuhfv2bqqlvKZsA1/wvB6YdKvnxeX6bAkzvURG
	 8thNsiLVok6lXY51riKtR1wmgjG+FD6TbzcM9v0xFVWtde1qRm39S1aqYOFKUllvRe
	 t3RNUJ97eR7uDPHN5o9G56olM1Jxr1n10yM5Tnidd06aLXh6M0unG9dM96vW7R+3oO
	 KxF4qPoPUHJPbbk5SH5djjEKr4RQ1Vjb2U5KBYch4Hgq3lwfugodmOTxNp/EQmHOFV
	 GXGY4j9CGrJwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E0FD81E5B;
	Mon, 22 Dec 2025 12:54:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99CD0195
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 12:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96BBF608F1
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 12:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8SMmWyS7CMY for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 12:54:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7FF4F60882
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FF4F60882
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FF4F60882
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 12:54:23 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 0C3D32C80CD5;
 Mon, 22 Dec 2025 13:54:21 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 22 Dec 2025 13:54:22 +0100
Message-ID: <20251222125423.85289-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1766408061; bh=cF/gMsjq14AoAplxKxhIB19yH97PVyHfKNtDZkSG8+w=;
 h=From:To:Cc:Subject:Date;
 b=qC2Mne14MBJagmCrlVCjghh+Nbg2jJGO4SYIDabDfRS0l6uVoy7Uio9vmt9ZcTH8U
 r+98OAPXZ4ysMvQVnNmWkcXYJyD+rvodbAumAaFJpTCB0OHpSEFfWSsVZGikLy/QIv
 2SmCSO8tA9MfeNidhKCnPHbPxMC7vOZg2LWc51dCZ+T46BXTdM+cLeYKCiWT0apJXs
 gU2TZvfJGsm7/51K4+Xzdl+YD7Pss1JiSi4cBRSpEX/qHrWzGMNDK6JwOjgSLH7WX/
 7OQvvdEJ5dA+f14YVG1RIlLxyKgmS4YP7gHWpEbT2EvU5oGHUEEHIB5PK8MAhzBJx4
 soJlQCd8oI8IQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=qC2Mne14
Subject: [Buildroot] [PATCH] package/python-sqlparse: bump to 0.5.5
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
https://sqlparse.readthedocs.io/en/latest/changes.html#release-0-5-5-dec-19-2025

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-sqlparse/python-sqlparse.hash | 4 ++--
 package/python-sqlparse/python-sqlparse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlparse/python-sqlparse.hash b/package/python-sqlparse/python-sqlparse.hash
index 8d9c27afb7..b541aec42f 100644
--- a/package/python-sqlparse/python-sqlparse.hash
+++ b/package/python-sqlparse/python-sqlparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlparse/json
-md5  b5bf6082e38fb99bf8217f429b73346a  sqlparse-0.5.4.tar.gz
-sha256  4396a7d3cf1cd679c1be976cf3dc6e0a51d0111e87787e7a8d780e7d5a998f9e  sqlparse-0.5.4.tar.gz
+md5  2023800dc264c2fedab3250a8eb43995  sqlparse-0.5.5.tar.gz
+sha256  e20d4a9b0b8585fdf63b10d30066c7c94c5d7a7ec47c889a2d83a3caa93ff28e  sqlparse-0.5.5.tar.gz
 # Locally computed sha256 checksums
 sha256  c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index 6d952b215a..af1af475d8 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLPARSE_VERSION = 0.5.4
+PYTHON_SQLPARSE_VERSION = 0.5.5
 PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
-PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/18/67/701f86b28d63b2086de47c942eccf8ca2208b3be69715a1119a4e384415a
+PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/90/76/437d71068094df0726366574cf3432a4ed754217b436eb7429415cf2d480
 PYTHON_SQLPARSE_SETUP_TYPE = hatch
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
