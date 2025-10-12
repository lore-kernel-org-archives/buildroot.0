Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53777CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 18:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 278D98126E;
	Sun, 12 Oct 2025 18:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGZcw-fL0slN; Sun, 12 Oct 2025 18:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30CC08128D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30CC08128D;
	Sun, 12 Oct 2025 18:22:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6761CBC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D78D4008B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTtisFMz-RV5 for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 18:22:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CDCC140082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDCC140082
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDCC140082
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:22:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7DD26A4C670D;
 Sun, 12 Oct 2025 20:20:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45202)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v80g5-000000000yp-3p8f;
 Sun, 12 Oct 2025 18:20:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:20:06 +0200
Message-ID: <20251012182016.2711834-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012182016.2711834-1-bernd@kuhls.net>
References: <20251012182016.2711834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760293218;
 bh=5enzCJ0nWXbX04iRPnlSu0agASWKLou024UskUv1570=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sT0Inb2Tcxkyomk6YcwisR6QxIFCOrHSOQLUnGz6bFLjPrwLM6umRTgN/xDqbXrTE
 KNUfZVCLVE/fO4XRTjnwQLkr8srDezOttqAkjzRMneut7U/Z6Q/d5z7rBsnfGSh7Sd
 u5CZ1pAiYYj+GdBDCDsBHgNGxZEpBDenzTB7ILSyUKFdxJ/HcL6EIsiV5OQbQJlCLB
 z7ndJtYpIxl6GYlgUpiR017eeNLMG8KfrDLtqMVqt+ii6jRsuHrFWA2hs68yBPSTy7
 KtbP+LtbQ+tZstsEIxWN0BQdUHmlL0EVNqOm1GqvVnoefv3n2MLNp+lWfSq3T7cwd/
 NS9oQhqlCOmnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=sT0Inb2T
Subject: [Buildroot] [PATCH 11/21] package/python-cachetools: bump version
 to 6.2.1
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
Cc: Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/tkem/cachetools/blob/v6.2.1/CHANGELOG.rst

Updated license hash due to copyright year bumps:
https://github.com/tkem/cachetools/commits/v6.2.1/LICENSE

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-cachetools/python-cachetools.hash | 6 +++---
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index aee9548b9e..5831c2acba 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  a9855be6d00255c175529d91f1c4003f  cachetools-5.5.1.tar.gz
-sha256  70f238fbba50383ef62e55c6aff6d9673175fe59f7c6782c7a0b9e38f4a9df95  cachetools-5.5.1.tar.gz
+md5  34b0025a306749e0b3619662362a76e2  cachetools-6.2.1.tar.gz
+sha256  3f391e4bd8f8bf0931169baf7456cc822705f4e2a31f840d218f445b9a854201  cachetools-6.2.1.tar.gz
 # Locally computed sha256 checksums
-sha256  2f4d2ff05f05c5da3879f40292b7600332d775dc7ed320d43dd42f3cd7d92c9b  LICENSE
+sha256  23c4eff7a1c027a977a0b79c4497e17582c334c5f17ef6ac8ca0b52d1e7d8417  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index e1b27cf362..576202a650 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 5.5.1
+PYTHON_CACHETOOLS_VERSION = 6.2.1
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/d9/74/57df1ab0ce6bc5f6fa868e08de20df8ac58f9c44330c7671ad922d2bbeae
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/cc/7e/b975b5814bd36faf009faebe22c1072a1fa1168db34d285ef0ba071ad78c
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
