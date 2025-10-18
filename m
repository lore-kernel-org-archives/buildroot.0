Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2365CCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 17:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E7B881326;
	Sat, 18 Oct 2025 17:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PS912wnALn0Y; Sat, 18 Oct 2025 17:19:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EDC6812A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EDC6812A3;
	Sat, 18 Oct 2025 17:19:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CCD491CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 17:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B340740E1C
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 17:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1Y3jPHAWBD6 for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 17:19:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83EF140E18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83EF140E18
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83EF140E18
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 17:19:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3E392A4C1F57;
 Sat, 18 Oct 2025 19:19:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41098)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vAAaL-000000006mP-1TE8;
 Sat, 18 Oct 2025 17:19:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Oct 2025 19:19:16 +0200
Message-ID: <20251018171916.1369130-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760807957;
 bh=8Lm1Ncrs/9cnLxGpXBpYsojYJqzn74GoLxIEur/qZcU=;
 h=From:To:Cc:Subject:Date:From;
 b=bvekrHQrItxi2WC0ZXZha7PtA56eq/m6tsBYqySxRLEYK5tX4mcw/yEfLeecq0LpJ
 oR2v6HDV+qvTDM4FZ3pSFHpmUFVI1CtIhRuIboCqMH6eOBY59Nu2AOy1kviiW1qnaD
 LeteS6/G4ayA4FSX1BQKq0+FonXWREttC4oofcI6KQrCYYgP/nchhQ/FmBTDngzLrT
 M8oA99rjwXEuz+mtUzh+qTXAChd5AjNkk8mm3j5oFHWExjdUyj39SJQEPPLgpzgrVz
 sokR/sHSkq1JmjS+5y59rHeWwnt0qgAtu8LWYfaQtHb1uKLYLKuFrBKyIOnSIsPvvT
 Q67bKnCTqV8pQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=bvekrHQr
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.31.9
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

Fixes build error with libcurl 8.16.0 introduced by buildroot commit
fb5fb06ee5a886df5036c5c5e6c4536f2bc8e1c1

Fixes:
https://autobuild.buildroot.net/results/92b/92b1ed36e750d9ad756793814f9d1133bda0e013/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 6101fe16f0..cbca2fc355 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.31/cmake-3.31.8-SHA-256.txt
-sha256  e3cde3ca83dc2d3212105326b8f1b565116be808394384007e7ef1c253af6caa  cmake-3.31.8.tar.gz
+# From https://cmake.org/files/v3.31/cmake-3.31.9-SHA-256.txt
+sha256  5d4fdec04247ca8a8e8f63692f0d0f1e9d6d082a2bdd008dff8ab3ba7215aa83  cmake-3.31.9.tar.gz
 
 # Locally calculated
 sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 1eb4da90ad..8f3a54be5a 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.31
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).8
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).9
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
