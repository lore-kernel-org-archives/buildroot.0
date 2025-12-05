Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D74D2F7CC
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 12:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15203607D1;
	Fri,  5 Dec 2025 12:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O6wA3wX_r84L; Fri,  5 Dec 2025 12:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AE0961C7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764937717;
	bh=98cPBH3EZgPl4mnjibLf3O/fz0GBh2iHDHqcnKKRoaY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=T08gcAOvE7tuPCvS8hfSICl4tfMfhZNGlWF18bBFZHfPGfpJFCxJAsNc5rPIeex3T
	 Qbnb+skPrcS50JHK7DYaTs4uJJ12ovff+kwlkisQ/m35iERnszp4HhNXgfahfWywxv
	 Y2/Psrlp4HgWUnYUv2RAR6rluLRmujfLbtzIGyA+CjCyGvIQSpj955p6CC3j4OmWCW
	 z+QdKw6+9ulyT0HlNz0q8Ig0G9T96NI6g9zIs2dQaX320XQyFzWmszJgrzU3wwPBFv
	 ECPwTCJdkQZIMIjc7QXVY++rWEmxLkDEpM5aJ6pCl6aOogazRD7EjzalgMZpTXjOgY
	 kBg3hOZrUiPcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AE0961C7F;
	Fri,  5 Dec 2025 12:28:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E9C931A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E22B7412B1
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Swnrpsc8ywA9 for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 12:28:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C0EDD4020C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0EDD4020C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0EDD4020C
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:28:32 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7D9992C89475;
 Fri, 05 Dec 2025 13:28:30 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri,  5 Dec 2025 13:28:32 +0100
Message-ID: <20251205122832.601160-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764937710; bh=Of9s6mZcf61YlT7Vb1IBjXGnm3SM3uLmyPRCb4SMlss=;
 h=From:To:Cc:Subject:Date;
 b=RFGnBpMVFjn0b9kLFMk8H2FeNc1HTt32fnSHpEI02PucsUjtHXwQEje4j22qqLcD8
 +0wHSb0HTnqS4W0M4JRZ7c3UqC6zOlNzHspNSvOtLGpaalULyNclHQKZw34lqQdro8
 6MdyXox+rhrGXVYB90QYAvvS972mS9hD/wpRT0lInV63x0ZgNVe0aAC+DxQWXThUNM
 QqvGpIwPdctblSDa6bTDC/blQPDDlubtk5c54W051LBRDH+I6XbFQJzz+092FT44UY
 mIqYAS1KR4dYG2gqWkQ/0wF2FAO6U4M6jUC6MdDUbjP8rY5RDULm+wRzGx3Gxx4aBR
 poJdsSfI1qJNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=RFGnBpMV
Subject: [Buildroot] [PATCH] package/python-sqlparse: bump to 0.5.4
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

Changes: https://sqlparse.readthedocs.io/en/latest/changes.html#release-0-5-4-nov-28-2025

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-sqlparse/python-sqlparse.hash | 4 ++--
 package/python-sqlparse/python-sqlparse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlparse/python-sqlparse.hash b/package/python-sqlparse/python-sqlparse.hash
index 3e54d227f4..8d9c27afb7 100644
--- a/package/python-sqlparse/python-sqlparse.hash
+++ b/package/python-sqlparse/python-sqlparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlparse/json
-md5  9764a42264c9a3102526c87260e73d11  sqlparse-0.5.3.tar.gz
-sha256  09f67787f56a0b16ecdbde1bfc7f5d9c3371ca683cfeaa8e6ff60b4807ec9272  sqlparse-0.5.3.tar.gz
+md5  b5bf6082e38fb99bf8217f429b73346a  sqlparse-0.5.4.tar.gz
+sha256  4396a7d3cf1cd679c1be976cf3dc6e0a51d0111e87787e7a8d780e7d5a998f9e  sqlparse-0.5.4.tar.gz
 # Locally computed sha256 checksums
 sha256  c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index 0140961393..6d952b215a 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLPARSE_VERSION = 0.5.3
+PYTHON_SQLPARSE_VERSION = 0.5.4
 PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
-PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/e5/40/edede8dd6977b0d3da179a342c198ed100dd2aba4be081861ee5911e4da4
+PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/18/67/701f86b28d63b2086de47c942eccf8ca2208b3be69715a1119a4e384415a
 PYTHON_SQLPARSE_SETUP_TYPE = hatch
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
