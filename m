Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70805C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 13:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45A9840B7B;
	Mon, 25 Mar 2024 13:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0qmlPYuJje6; Mon, 25 Mar 2024 13:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DEA040B9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DEA040B9A;
	Mon, 25 Mar 2024 13:06:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC23D1BF358
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 13:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D93C340B7B
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 13:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPvqcN8p-408 for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 13:06:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A16F340137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A16F340137
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A16F340137
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 13:06:41 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 4BB952C83946;
 Mon, 25 Mar 2024 14:06:38 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 14:06:36 +0100
Message-Id: <20240325130636.156426-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325130636.156426-1-buildroot@bubu1.eu>
References: <20240325130636.156426-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1711371998; bh=+5P3DaNxd/0AI7UUiMkHbnVjmVR5yHtS15z8Wd6qw1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=p/kqQFa4LfUaTV09RlpjfHVkY6IpunGnCBwHivUURj129oHfquIWBSCrP+aG7cbpI
 kLoSpf7zeFt0R7tbjAaQxHug8iVnDKvfB0/dHbFtHFe9VV7RwkeHwKxhCwufgUX2dl
 yAcRa6d2EtQH7zZzOelnschWp9cSiTs7H0xgrAGNurgMFiELd+mVRg5W8VFYnTkwzd
 nAo+t4TNOzIr/gYsJyltwMi+FrlRiwL/iIjYdT5dHKojOcL661WV+GgPE8kgHFrjAc
 bvK9Br8XavtBSQUaU7949o7wFW6OfPuWDXY36aTPAEmiaTa2TGOQ78t+5gt8gR2PSS
 lV2Y+Bo/a5SJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=p/kqQFa4
Subject: [Buildroot] [PATCH 2/2] package/python-pytest-asyncio: bump to
 version 0.23.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://pytest-asyncio.readthedocs.io/en/latest/reference/changelog.html

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index 29a38c7dc7..53bf62340c 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  0c81f6de855e546180de424c0db05c20  pytest-asyncio-0.23.3.tar.gz
-sha256  af313ce900a62fbe2b1aed18e37ad757f1ef9940c6b6a88e2954de38d6b1fb9f  pytest-asyncio-0.23.3.tar.gz
+md5  e419d6fbc626b366814b7b698fa79236  pytest-asyncio-0.23.6.tar.gz
+sha256  ffe523a89c1c222598c76856e76852b787504ddb72dd5d9b6617ffa8aa2cde5f  pytest-asyncio-0.23.6.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index 8464c70f5f..88f93d83e0 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 0.23.3
+PYTHON_PYTEST_ASYNCIO_VERSION = 0.23.6
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest-asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/1d/27/f036ec4bcbfd056c54572d7169ba3dbb54e7181f02f21caadd3aecb9cf5b
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/cd/ef/80107b9e939875ad613c705d99d91e4510dcf5fed29613ac9aecbcba0a8d
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
