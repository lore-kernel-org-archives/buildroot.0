Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6F5CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 20:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C83440B61;
	Sun, 12 Oct 2025 20:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hudFsIHBV5mW; Sun, 12 Oct 2025 20:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69AAC40A96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69AAC40A96;
	Sun, 12 Oct 2025 20:23:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFBFD12B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D668860AB9
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZ8NJvoqKJQG for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 20:23:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DC47E60634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC47E60634
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC47E60634
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:23:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB5C2A4C6721;
 Sun, 12 Oct 2025 22:20:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39868)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v82Y0-000000004zD-0MEg;
 Sun, 12 Oct 2025 20:20:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 22:19:55 +0200
Message-ID: <20251012202002.178080-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012202002.178080-1-bernd@kuhls.net>
References: <20251012202002.178080-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760300404;
 bh=digm6ltamrLlTIJHbkeJFey/f8Hrm2ILAvgzyoJUv9s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=k/fgU8WE3glbBfwQ5WJXo3e0WT6ySHvbVp4ZFRYWYBKjcEw8ANrUdx/FKr2GBdifF
 BmDxQly4vN4JK0YuaB9Gtx8hAzzf8yBd7HmibZ7ZRX8VuxHP1afZQX8prM4hHn5als
 Htdd8fQImHwmQsrqtafrkc8ZLXET6yx0AQoAyi68FZL22NVUWxltmFhA8acqQbdrMv
 9n67PUcdpCUi1qnb0PJirmR5Ghv8hSSVcY+jlN9hTcUj6X37S3YdP61SUZesMD1YmE
 bze0Sxbp/LwHbp6+FPzs9ZBMqHU1MGMzu3gwlRigZd16JcZjbRl72QpjQuKfR/AEMi
 VKftFph/X1qBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=k/fgU8WE
Subject: [Buildroot] [PATCH 16/23] package/python-libevdev: bump version to
 0.12
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-libevdev/python-libevdev.hash | 4 ++--
 package/python-libevdev/python-libevdev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-libevdev/python-libevdev.hash b/package/python-libevdev/python-libevdev.hash
index 2799078cc8..c48ddbf716 100644
--- a/package/python-libevdev/python-libevdev.hash
+++ b/package/python-libevdev/python-libevdev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/libevdev/json
-md5  34b48098c1fba26de79a0d67a17a588a  libevdev-0.11.tar.gz
-sha256  e9ca006a4df2488a60bd9a740011ee948d81904be2364f017e560169508f560f  libevdev-0.11.tar.gz
+md5  9bf8acc011c72d1466ae8f0b8f2c5fac  libevdev-0.12.tar.gz
+sha256  02e952632ec6c249cbb9c66f6fa00012ea448b06606c77cd139133bc2fe46b08  libevdev-0.12.tar.gz
 # Locally computed sha256 checksums
 sha256  a547b196da4e5bb9588a6e24f1f36ae9e2349ca5375e2cf9c315186e237d9f6d  COPYING
diff --git a/package/python-libevdev/python-libevdev.mk b/package/python-libevdev/python-libevdev.mk
index e5256064c9..cc40adc874 100644
--- a/package/python-libevdev/python-libevdev.mk
+++ b/package/python-libevdev/python-libevdev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBEVDEV_VERSION = 0.11
+PYTHON_LIBEVDEV_VERSION = 0.12
 PYTHON_LIBEVDEV_SOURCE = libevdev-$(PYTHON_LIBEVDEV_VERSION).tar.gz
-PYTHON_LIBEVDEV_SITE = https://files.pythonhosted.org/packages/b0/49/2fe589ce1fa6ca0f05ae0b1717923650f2cc6eec6307c71fbc7789738902
+PYTHON_LIBEVDEV_SITE = https://files.pythonhosted.org/packages/61/6b/e0193f4ba0c3b7d20f8f1b961793d39df5538451c0959abb115020d4ec2d
 PYTHON_LIBEVDEV_SETUP_TYPE = setuptools
 PYTHON_LIBEVDEV_LICENSE = MIT
 PYTHON_LIBEVDEV_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
