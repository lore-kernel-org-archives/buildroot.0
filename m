Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABFFEBFD20
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 09:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE4884104A;
	Mon, 13 Apr 2026 09:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aI_cNNYgfGKf; Mon, 13 Apr 2026 09:09:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E95E941E4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776071366;
	bh=o7qXLxm1xllHy9Wc+2eGfB8KjrpM05ydjngWtau4Tdg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=BtDrxkUQZmbgD8n+mfzUT5wz4aZoppV6T47Y3tKMZSdb/lYV8YgEC3k/7ckPV8vC4
	 veeK/abYxw7fyGc2HJUvHlxzRFK285mbmTibwFGUBS0uUWy53Z/Xw8fUVkew3kDNB3
	 nEroj5oykthEkM0Fyxy+q43isdgVkFrxd6ZNB7PDeBG4aoYKSTc5AytI2qN9vo39ia
	 0Orz64PIWLWWCbM9I5vLCMUp6+anlNhx8ACV3f11ud0gucczAtTD7v/f6IrmZ2ux57
	 AkVpReZxPj+zu+pOS1YUmOtdqUNVHkrB+LbS5/aW0PS3FOL2A8OaTuFUstsVHmgXuz
	 HkCMiyzNYb+mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E95E941E4B;
	Mon, 13 Apr 2026 09:09:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5436194
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 09:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D703941E4B
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 09:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFoAEKAFdYVM for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 09:09:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4C1974104A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C1974104A
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C1974104A
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 09:09:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 517B71814BF; Mon, 13 Apr 2026 11:09:19 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 11:08:49 +0200
Message-ID: <20260413090901.109220-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1776071359; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=8s6FzVneZFf2ahEAjEocSImvcVZKz3ZBRXg20L63z8k=;
 b=QnHdvrc7iJ+dOhIVsCtwKKyPqe1sh1b5MoSjAAEwK8NHHPYqZDW3rDlBmsDEC5oPTltzGL
 uDsHyAuVE5lNTSzBmjllWagmtDGgXAM6fEMQb/C94qeo6Y5+5OB5So8Y2fXcxEuUiKsVV4
 l2AbOnh0WJgf5AKu9nYIBjPXrZSizwg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=QnHdvrc7
Subject: [Buildroot] [PATCH] package/python-cryptography: security bump to
 version 46.0.7
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://cryptography.io/en/46.0.7/changelog/

Fixes:
https://www.cve.org/CVERecord?id=CVE-2026-34073
https://www.cve.org/CVERecord?id=CVE-2026-39892

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 25d987a321..ba00e24b47 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  18ecafb2c1f2de6d02d1b848f0f80736f0f93e8708afaf3df3064e8722077291  python-cryptography-46.0.5-cargo4.tar.gz
+sha256  8f7279694cfdd99257c07393bfd2c2317d6a12e3844819b818686c4bfea60d56  python-cryptography-46.0.7-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 0747394fc6..196ccdfb3e 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 46.0.5
+PYTHON_CRYPTOGRAPHY_VERSION = 46.0.7
 PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/60/04/ee2a9e8542e4fa2773b81771ff8349ff19cdd56b7258a0cc442639052edb
+PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/47/93/ac8f3d5ff04d54bc814e961a43ae5b0b146154c89c61b47bb07557679b18
 PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
