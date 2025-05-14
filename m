Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0A7C3ABD9
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 15:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E168460A7B;
	Wed, 14 May 2025 15:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rN2_GqBaEjHX; Wed, 14 May 2025 15:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4B056081B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4B056081B;
	Wed, 14 May 2025 15:13:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 734F612A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58392401CB
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSOHMf0-ryFL for <buildroot@buildroot.org>;
 Wed, 14 May 2025 15:13:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5F85F405BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F85F405BA
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F85F405BA
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:00 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C65D52C845D2;
 Wed, 14 May 2025 17:12:57 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 17:12:37 +0200
Message-ID: <20250514151255.2316205-3-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514151255.2316205-1-buildroot@bubu1.eu>
References: <20250514151255.2316205-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747235577; bh=VZyZQxitfB+3GfWGJx8PGP0IOdf8ZWiXXaGfW+s0ldQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ULMwkKAcnDcZEUUNrtW3bTY3vGZZuJ6Pa3yg+3n68rni0e0cYJeaxKE92oSJO0miu
 nCMkLNM2dgz8JuQV4sIFHw819yD6Hdpe3X3mxOP8VRCqmL9beML+obnCgYcBNxE8gu
 54AVqQC/ZL0QwzrBOsZDUdKiKMLHHK/RTCYYS393yMlNg1fd1fv1ejtzhFfNHY1fEn
 71AxTUBk3TPzMp74IVw9oIPnafSiqOJVV9XiqlDaotHxCiIoyPwuGF3yYmyQgiI9yD
 Upj8KwIikgEGG7XIZz+7sF9YRt13d3UMc85sAKBRjqFAUwXKEJTot2hrwKjhYJRpeO
 08RreitjYo79Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=ULMwkKAc
Subject: [Buildroot] [PATCH v2 03/12] package/python-anyio: bump to 4.9.0
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

Release notes: https://github.com/agronholm/anyio/releases/tag/4.9.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-anyio/Config.in         | 1 -
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-anyio/Config.in b/package/python-anyio/Config.in
index 353c7e4629..d843f37af0 100644
--- a/package/python-anyio/Config.in
+++ b/package/python-anyio/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_ANYIO
 	bool "python-anyio"
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
-	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  High level compatibility layer for multiple asynchronous
 	  event loop implementations.
diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index 4ff6955ae5..e1fdf474c2 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  ad00874069a6685b2e3e84c5a2e045cb  anyio-4.8.0.tar.gz
-sha256  1d9fe889df5212298c0c0723fa20479d1b94883a2df44bd3897aa91083316f7a  anyio-4.8.0.tar.gz
+md5  d0e4db5f5e4041d1bc9664042b454218  anyio-4.9.0.tar.gz
+sha256  673c0c244e15788651a4ff38710fea9675823028a6f08a5eda409e0c9840a028  anyio-4.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 4f38e12794..3be3f2b78f 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.8.0
+PYTHON_ANYIO_VERSION = 4.9.0
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/a3/73/199a98fc2dae33535d6b8e8e6ec01f8c1d76c9adb096c6b7d64823038cde
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/95/7d/4c1bd541d4dffa1b52bd83fb8527089e097a106fc90b467a7313b105f840
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
