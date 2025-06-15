Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D97C71135
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 16:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3664760A94;
	Sun, 15 Jun 2025 16:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hu1-ViBWjg6F; Sun, 15 Jun 2025 16:19:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A60B60DA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A60B60DA4;
	Sun, 15 Jun 2025 16:19:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ECFA1198
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 16:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF16860DA4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 16:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A92xHQKdx7Ve for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 16:19:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C70B660A94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C70B660A94
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C70B660A94
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 16:19:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ea.dip0.t-ipconnect.de [91.58.8.234])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EF78AA4C0465;
 Sun, 15 Jun 2025 18:19:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46702)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uQq4y-000000006sP-0o1m;
 Sun, 15 Jun 2025 16:19:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Jun 2025 18:19:32 +0200
Message-Id: <20250615161932.2499787-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750004372;
 bh=a8Fs0Bh+IeA6fU5GrEvUWE4L2q8NqhC8VXFV0kkWT0M=;
 h=From:To:Cc:Subject:Date:From;
 b=bLo89iE2rKCdW5nLsf+QFW2qspD2ZNxgsb3CFFAZ2pQlO0KjhUK0vIPx+eHaR7FJk
 KfKQbbELGZc4lQqvkfHLeOYXHx2jZm8gIZ+NuSLNenfOQDqYJu+HMybG2/vlqUy2Xv
 SmJ4BM++9SPTJbnPazuqh6wYlUbpsbmHl03VH8xKexTQnz7aexXpPnQT30MxfF2edA
 8+J6fUdAbDLMHhSKBKxWobhu4qH4eYRREtT3NN2ZGMvMelg1wqfMT4a1iEyjIjr531
 +TiyrDyajQ6h7cpXHJLWzqKEcFuSUjnqEwKQx/eClqTEpDqc7ZVdaL9VtO2ib54CJd
 PxOvqlW5/aKOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=bLo89iE2
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.31.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://www.kitware.com/cmake-3-31-6-available-for-download/
https://www.kitware.com/cmake-3-31-7-available-for-download/
https://www.kitware.com/cmake-3-31-8-available-for-download/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index a41f0a5c8e..6101fe16f0 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.31/cmake-3.31.5-SHA-256.txt
-sha256  66fb53a145648be56b46fa9e8ccade3a4d0dfc92e401e52ce76bdad1fea43d27  cmake-3.31.5.tar.gz
+# From https://cmake.org/files/v3.31/cmake-3.31.8-SHA-256.txt
+sha256  e3cde3ca83dc2d3212105326b8f1b565116be808394384007e7ef1c253af6caa  cmake-3.31.8.tar.gz
 
 # Locally calculated
 sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 6a1b6ae7ea..1eb4da90ad 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.31
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).5
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).8
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
