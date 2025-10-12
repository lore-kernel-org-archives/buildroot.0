Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B75ACCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 18:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3139811DC;
	Sun, 12 Oct 2025 18:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OreVR4NIyMbV; Sun, 12 Oct 2025 18:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3ADF8125E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3ADF8125E;
	Sun, 12 Oct 2025 18:21:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF34FBC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D17994061F
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20qAUbdPbfd5 for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 18:21:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCEC9405F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCEC9405F3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCEC9405F3
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:21:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 63063A4C670B;
 Sun, 12 Oct 2025 20:20:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45202)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v80g5-000000000yp-2k0z;
 Sun, 12 Oct 2025 18:20:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:20:04 +0200
Message-ID: <20251012182016.2711834-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012182016.2711834-1-bernd@kuhls.net>
References: <20251012182016.2711834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760293218;
 bh=ppzlkL7/YhbnUY6kMxSPneKBW1vwdRHDXK4sdohuuQo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cJz6w7tLE3mAlJU3V+/fwjEee6r7i29nCwdi/0Jw3JvxIcmgD+EEz0UZIhb9tMT16
 NnQJ3ytKAZVlV6zAC+o+ZN4jeSbTg8Lo7WXYpPDI6xK9mj2Bl6SPBN4niHZ9Odedpq
 0Mfp1DzFpC0TBmwtRlNvVt18ETKmv1IUb1hu7Nl46Mrj8y5r88HM/07oOxcp058gBp
 hKNhR2FiAVmX5yw5HHQ1BIA7CgDGcNYAgoCOwKAVeNEYOO/mjaLx+mKvh51uM8cvID
 5h7IGBf5NWWygP5xheDZ5HCCAAsoFrHhMmGfHDuc1J7G89q3YTYd8gNtO+RyNZKcO5
 aQfAJt4t8gYhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=cJz6w7tL
Subject: [Buildroot] [PATCH 09/21] package/python-botocore: bump version to
 1.40.50
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

Changelog: https://github.com/boto/botocore/blob/1.40.50/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 6ed1cc42c4..2a4b75c67a 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  3819c8575d792c79bc1232174e249fae  botocore-1.37.33.tar.gz
-sha256  09b213b0d0500040f85c7daee912ea767c724e43ed61909e624c803ff6925222  botocore-1.37.33.tar.gz
+md5  26ac199c10a225d078ad4faf97398812  botocore-1.40.50.tar.gz
+sha256  1d3d5b5759c9cb30202cd5ad231ec8afb1abe5be0c088a1707195c2cbae0e742  botocore-1.40.50.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index d25e34eb69..b81bca5ad8 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.37.33
+PYTHON_BOTOCORE_VERSION = 1.40.50
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/f4/1d/0c539ae261d2f8fe8b47c358b369ec58645bf0ea96b78825365e48675b67
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/5b/66/21d9ac0d37e5c4e55171466351cfc77404d8d664ccc17d4add6dba1dee99
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
