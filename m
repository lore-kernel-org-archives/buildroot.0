Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BA4C3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 21:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EEE781EFF;
	Mon, 12 May 2025 21:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eemHeunMvBcq; Mon, 12 May 2025 21:13:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA33481EAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA33481EAE;
	Mon, 12 May 2025 21:13:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DF87150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EFC44094D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9F_SEn0lvUL for <buildroot@buildroot.org>;
 Mon, 12 May 2025 21:13:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A4C0B407A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4C0B407A9
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4C0B407A9
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:13:49 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B4DA12C845BB;
 Mon, 12 May 2025 23:13:47 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 23:13:34 +0200
Message-ID: <20250512211344.721883-3-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512211344.721883-1-buildroot@bubu1.eu>
References: <20250512211344.721883-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747084427; bh=VZyZQxitfB+3GfWGJx8PGP0IOdf8ZWiXXaGfW+s0ldQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GrmgYSGN531pzbrqLxlOY5EpZuDbhaZqN3ibPoY+LwaTVXAaMZ/jwsGBRQK5UH3iS
 Kx47N6keoMRFqdcNv47u/LNpOCmBwjMDxtkkQwvwCyBTfomEVz4f3+Fbu8y8hT3C/K
 cramEHHSeGaT+C8jY696wd4gVfsfOELcNSblfUNMzebOo5NKhYFTOqf2nK6veqsUTx
 ih7XGmZ2+i+t/P811cWRJIQn7kWiWaEsq9hoS49EPx0msLCzKPKNZZALfrRatB70Jx
 aQ3Xro+BfUciOI4pspUUaICduTAO3M9cJQ/zKT6uDG0AjXJQvtasYrr9N+CX8p7PXz
 8C1f5ohQ71kMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=GrmgYSGN
Subject: [Buildroot] [PATCH 3/7] package/python-anyio: bump to 4.9.0
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
