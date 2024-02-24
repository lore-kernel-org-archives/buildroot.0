Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F391C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 11:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3261608C2;
	Sat, 24 Feb 2024 11:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tuAoBhmTfX6D; Sat, 24 Feb 2024 11:59:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD9E860A47
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD9E860A47;
	Sat, 24 Feb 2024 11:59:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C71461BF232
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 11:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEE274027F
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 11:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YcgZgMfUIx0U for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 11:59:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ECF6C4012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECF6C4012F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECF6C4012F
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 11:59:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8D0B0A4C0CB3;
 Sat, 24 Feb 2024 12:59:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58630)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rdqgc-000000005JF-1LGW;
 Sat, 24 Feb 2024 12:59:22 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 12:59:22 +0100
Message-Id: <20240224115922.234596-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1708775962;
 bh=vyIQ57DGaXh0asNVY15ZRE02FnLZGe4CrNuOcND1LSc=;
 h=From:To:Cc:Subject:Date:From;
 b=k2p93oW9YMDZbcs8KgGnxIGBGqos0W+julcj64MknPMoDipsSk4GQQlX+9CxCyJ4J
 3myli9+ZutuWiK77bk1dtCDOaNC3NWsO18yXGU76Czsw9OiwlAlPFTAlY4X3A30160
 YBs2NMa1sUkMseUU4sMdHqODnuEWoMoxb90mFMaB2YQ7wxpqxy7idnuC42s3GWBQo+
 vh8/C+h6AxqG0krSF9DOyWFvfPvTasGa1wxVR45o3OlSD4lyoAcg+b077raFMBKK0r
 GRMpIje8EHpcKGewS+MtJj3uutXrtZGV0kbFLTRn9DZCnYaOOALca5bVN3RTC+Y4+6
 9cYd5xPI9tFnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=k2p93oW9
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.28.3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://www.kitware.com/cmake-3-28-3-available-for-download/
https://www.kitware.com/cmake-3-28-2-available-for-download/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 51fff6c3ef..74b4a0a3a8 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.28/cmake-3.28.1-SHA-256.txt
-sha256  15e94f83e647f7d620a140a7a5da76349fc47a1bfed66d0f5cdee8e7344079ad  cmake-3.28.1.tar.gz
+# From https://cmake.org/files/v3.28/cmake-3.28.3-SHA-256.txt
+sha256  72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1  cmake-3.28.3.tar.gz
 
 # Locally calculated
 sha256  4a01ccf2dc580ba570d02bc015bbe0ec92f1f318717aae9540ba841ba7946756  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 23d00b95c5..49d1f9fea5 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.28
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
