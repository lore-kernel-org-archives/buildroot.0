Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A66AE66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 311D4817F2;
	Sun, 21 Dec 2025 22:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLMkUhVg2sxO; Sun, 21 Dec 2025 22:30:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CCAC81854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356243;
	bh=vw2gD8BeO/o9JYRYx5RaQVFF2gQYHJkJhITGJEkLHIU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CLJ8Rxaz3e+VMxzlRS0FXZr6Taj5Ymm/yYJjdndFcBY9ZT9SsFDidVWlbCmTtinUk
	 +i+SWHYDflR2Yz4v9mZUQxPKiZ7BbDtWSwNYjy88yYrIXjS2NwDAmRj+HwdGa4WPPM
	 oZfjbqTrKVrjVxXoeeKFnmYYpHFin6qt7aUCvRptWXCjN+uGz82cZzVE6uF98vc9as
	 gdm9byQmW6eL0WXoZXFyU7mrTU3XRowdMMsMkKbBa/IbZoSpW9lJvDUdpgJ995cTkh
	 g9E3KUoPGw8/YbD7PmmI3aXtJdwD62Rf4Gm0Kfjchh0y2XCS6LuhSsC/6aE5wV5DSM
	 VLvrG4FNL4tWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CCAC81854;
	Sun, 21 Dec 2025 22:30:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 457E7195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BEA060810
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7804XWngW-M9 for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:30:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0AD3E607F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AD3E607F3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AD3E607F3
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:30:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E2407A4C4E14;
 Sun, 21 Dec 2025 23:30:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46252)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXRw9-000000004xC-0py2;
 Sun, 21 Dec 2025 22:30:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:30:00 +0100
Message-ID: <20251221223000.184312-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223000.184312-1-bernd@kuhls.net>
References: <20251221223000.184312-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356201;
 bh=CevfEP16cljM8E6ACkiNl3fcyYm6A5NyU6GKu/bD75U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=soQYM0kBTr4johSnIjCf8LonUGb95Gz2fU2iTpzyx4falghW5OF6Zc5rBu2cSHynE
 w1cmCW725U2XDn/9x0jdvYDU2Q9n5nn/rnrnP+jsKoTJUHUkYHaS47W4X3LxUinsK2
 mzFC36EqIleBiOPkk/lnmxXlApEwQphDXQT5imi+WR1Kcq7rEz40vy6GcQ1Vy+0mkj
 kHPUkUP5Z/SlMZiXxgCE2GL9+Jf0xfVO3Q2u7QUAtDABwya3h2QVY//CQN+6TlnWW+
 jpv8FW+EP7t1QBByaw68CWCDtlKgSLLqtp43UVgoDB1/Lz4uwQT/fvb72r+rZ5HCc+
 Gglq92+gGTKpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=soQYM0kB
Subject: [Buildroot] [PATCH 7/7] package/python-pytest-asyncio: bump version
 to 1.3.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pytest-dev/pytest-asyncio/blob/v1.3.0/docs/reference/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index a9b33e0ebc..fbd141d76c 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  84f54204d53c46291c412bce27562480  pytest_asyncio-1.0.0.tar.gz
-sha256  d15463d13f4456e1ead2594520216b225a16f781e144f8fdf6c5bb4667c48b3f  pytest_asyncio-1.0.0.tar.gz
+md5  f9bf0eed023c7b6bb1d68ebea82d0398  pytest_asyncio-1.3.0.tar.gz
+sha256  d7f52f36d231b80ee124cd216ffb19369aa168fc10095013c6b014a34d3ee9e5  pytest_asyncio-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index f8d1e87e64..da0bbfeb81 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 1.0.0
+PYTHON_PYTEST_ASYNCIO_VERSION = 1.3.0
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest_asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/d0/d4/14f53324cb1a6381bef29d698987625d80052bb33932d8e7cbf9b337b17c
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/90/2c/8af215c0f776415f3590cac4f9086ccefd6fd463befeae41cd4d3f193e5a
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
