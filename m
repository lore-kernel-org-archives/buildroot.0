Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E90D5B846
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 563D96059D;
	Mon, 28 Oct 2024 22:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8qrU3iEyH8r; Mon, 28 Oct 2024 22:41:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A1DC606AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A1DC606AE;
	Mon, 28 Oct 2024 22:41:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4679BAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34EF9606AE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lUnwuPz11wHW for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:41:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B192607D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B192607D0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B192607D0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:41:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 49938A4C0D00;
 Mon, 28 Oct 2024 23:41:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47934)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t5YQW-000000007DJ-2FYy;
 Mon, 28 Oct 2024 22:41:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Oct 2024 23:41:32 +0100
Message-Id: <20241028224132.2463402-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730155293;
 bh=mYUbiWLkYCjZV5Up1Ayslng930mNKTV8FkrFiythuGI=;
 h=From:To:Cc:Subject:Date:From;
 b=nJ/MP55vx5zxgYWZYHuOMjWcdoPHZJBTZdcHPOiNhs06MHff2RmB3kScWrV97arlo
 YKpIRXBQnkc34b+hR8lxUB3j6RoGSyUETO5OF7djQT1uEiL8veG9Hg90uIxPP2JPLl
 h1a/9rP17jlfq1LvchpoYqLTKBwmCid0G343YYN8GwBB0yBdpEjqiVI45idXwYdjDi
 OJLJJEgtp1gNjqEurGt0/dUrPlrpQK1RPHiHZ1LQpBJ2XfTYosORD27b6WCL1YHI+q
 7PONZYL0xRvxODUbAxIcMO9N147wSYvS+fZno3s44//LA0dTz/ULpYLthkxv6PK/Od
 pm/5oD6cBXaYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=nJ/MP55v
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump to 3.30.5
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
https://cmake.org/cmake/help/v3.30/release/3.30.html#id3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 1a59c3fe89..f80b942103 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.30/cmake-3.30.2-SHA-256.txt
-sha256  46074c781eccebc433e98f0bbfa265ca3fd4381f245ca3b140e7711531d60db2  cmake-3.30.2.tar.gz
+# From https://cmake.org/files/v3.30/cmake-3.30.5-SHA-256.txt
+sha256  9f55e1a40508f2f29b7e065fa08c29f82c402fa0402da839fffe64a25755a86d  cmake-3.30.5.tar.gz
 
 # Locally calculated
 sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index e7d2d86791..0c5d46c23d 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.30
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).5
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
