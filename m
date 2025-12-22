Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD43E674B0
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 13:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94ED960A65;
	Mon, 22 Dec 2025 13:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7zg20qZTK2w; Mon, 22 Dec 2025 13:21:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ECC860735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766409706;
	bh=Q1myhhtTzVYfZa5cl4wVAFoMHwgcb+ZNRa53mmANxv8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=ijSH/7m9wXcYWtZelaLSVp16XwY8U41MWscmyvxCrJ+Vn6H8bBUbZObiSb4qQK/ur
	 UTt1yXsEeQ+H3HtfvI1ZA6oqW8U1SPpDQHA1Pa6gWuf9pbPYuzPrGaUkvPTItqktL2
	 crrNQo2yJEq2KSFXrnghwEeJYgxJoFYVDXSUUF/sI+G2GfxQQVBgeqTqjNTvt7+FGF
	 tGVX8KA1WyT6Lmwz0N/BraTeoYERHDaIg8EwQW67IP3+yFM5BucQGY4dFsrSLcDDCg
	 k3ZRxHRCkuY65PiKKR455XgocFaR3y5r6u4keOfEb6nLSq9qa5AqxYBf39Wpn7FW4A
	 wcGEpyJWcgosg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ECC860735;
	Mon, 22 Dec 2025 13:21:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14669119
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 13:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEF2381248
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 13:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUC0hulj0JRT for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 13:21:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E5948122B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E5948122B
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E5948122B
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 13:21:43 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 74A122C80CD5;
 Mon, 22 Dec 2025 14:21:40 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 22 Dec 2025 14:21:42 +0100
Message-ID: <20251222132143.357875-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1766409700; bh=ah4CK8BHsOWlLqRHg3RVeFPjIVBdAd0+MT0Tz+891DU=;
 h=From:To:Cc:Subject:Date;
 b=Nje/tuHqDNv79aWyYhSHA6gm4S2nZeEOJDR+jb/D8O71/l0168a4TMye3TJWbuOrR
 paAfNTQBsxOrvNFBvel2V8+Ixu1pTSlpM4E10+KgVaNEAAFkiwTaLewZI+7PS8q0o2
 M8qqlT0FG/bMuzWZQBENO33uFjL77YjqM51GG9nCpkYtA5YGVjOyA6K0/Ar8AaXTti
 iDWOGujUWf6SAZKttuieIN81jn86qGOuYye+eMi+mIj8Akg1s2+lVwVCEMMEKAblQl
 YnVucupiBy/fSbKeEzSdo/g+pGe0edoQ1Tcm1zZMW5koLWlaQmM6Abs0oN4/fbQ9pL
 tlycSYrYT6TBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=Nje/tuHq
Subject: [Buildroot] [PATCH] package/python-sdbus: bump to 0.14.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
https://github.com/python-sdbus/python-sdbus/releases/tag/0.14.2

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-sdbus/python-sdbus.hash | 4 ++--
 package/python-sdbus/python-sdbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sdbus/python-sdbus.hash b/package/python-sdbus/python-sdbus.hash
index bb3834dfb4..680f501137 100644
--- a/package/python-sdbus/python-sdbus.hash
+++ b/package/python-sdbus/python-sdbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sdbus/json
-md5  48ba3d23852b3d3f4f0623194f637872  sdbus-0.14.1.post0.tar.gz
-sha256  ae3915ab3e3f0a116632e1e5876df992b9529e82b0b492006eb22f8791ed6deb  sdbus-0.14.1.post0.tar.gz
+md5  b7b98bfd8934b676a48a9e4c6c180f8e  sdbus-0.14.2.tar.gz
+sha256  4f5d13b196e1e1de35311ebb2563a32de791451a30f5b9a4894528ba98766412  sdbus-0.14.2.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-sdbus/python-sdbus.mk b/package/python-sdbus/python-sdbus.mk
index 9a72b23776..685626ffb4 100644
--- a/package/python-sdbus/python-sdbus.mk
+++ b/package/python-sdbus/python-sdbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SDBUS_VERSION = 0.14.1.post0
+PYTHON_SDBUS_VERSION = 0.14.2
 PYTHON_SDBUS_SOURCE = sdbus-$(PYTHON_SDBUS_VERSION).tar.gz
-PYTHON_SDBUS_SITE = https://files.pythonhosted.org/packages/b9/4f/549089131ba4ba5379517655cdcbfe3925fd1cc0eafd93aac5f73c2a6d40
+PYTHON_SDBUS_SITE = https://files.pythonhosted.org/packages/7c/0f/0cf6b2fb0338fb3ab564cb8a8d68aa1c6de767851f5f9de9a3c83dbabeab
 PYTHON_SDBUS_SETUP_TYPE = setuptools
 PYTHON_SDBUS_LICENSE = LGPL-2.1+
 PYTHON_SDBUS_LICENSE_FILES = COPYING
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
