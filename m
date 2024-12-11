Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0D9E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 19:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2531402DB;
	Wed, 11 Dec 2024 19:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97yaLnBiLP55; Wed, 11 Dec 2024 19:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61AFF402C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61AFF402C2;
	Wed, 11 Dec 2024 19:28:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C522962
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD05341CA6
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Ldc5yBaN5gp for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 19:28:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A6E0E40104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6E0E40104
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6E0E40104
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:28:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b472.dip0.t-ipconnect.de [84.161.180.114])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B6DBFA4C2545;
 Wed, 11 Dec 2024 20:27:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35838)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tLSNK-000000004vV-00BK;
 Wed, 11 Dec 2024 19:27:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Dec 2024 20:27:58 +0100
Message-Id: <20241211192758.1653472-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1733945278;
 bh=FwkdqS6IK4TQix6mwk8gNBsocI4GvWY7cGp7iyCNHNg=;
 h=From:To:Cc:Subject:Date:From;
 b=aL9kInGah9o7hC7WGAHrKbkhl0kZnDLnDIddJWCC6w1Z1RwXdrR7fVIOXdlhLoiUX
 RYFDmU9vK7a3rXAuE64U6jlcarFbCbk7j82wmhQGjiMURFr9CAGbNyA06uTTaiIuuP
 s88BSBd7pajQ4//Kvlm3OpEFls499X/Ri3YH7Xi05jgqWNmSm8Z1mxiKMq03i47Azw
 DsHPgxo4bR5QO67amGRf0fxc0RHorIbhy9Lgvqu4FsJ/+SseU/k6RLKn8sDRpJiJGb
 mLDcXAF7ZsJ8lFtg1LJat5khcOcKJWNEZbJ0zsejRlXpsNusttZvXC0AkqFJIHS1rQ
 2lwhGNEFKFNUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=aL9kInGa
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.31.1
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
https://cmake.org/cmake/help/v3.31/release/3.31.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/Config.in.host | 5 +++++
 package/cmake/cmake.hash     | 4 ++--
 package/cmake/cmake.mk       | 4 ++--
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index 389300f31f..b30ce03a1c 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -59,10 +59,15 @@ config BR2_HOST_CMAKE_AT_LEAST_3_30
 	bool
 	select BR2_HOST_CMAKE_AT_LEAST_3_29
 
+config BR2_HOST_CMAKE_AT_LEAST_3_31
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_30
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_HOST_CMAKE_AT_LEAST
 	string
+	default "3.31"	if BR2_HOST_CMAKE_AT_LEAST_3_31
 	default "3.30"	if BR2_HOST_CMAKE_AT_LEAST_3_30
 	default "3.29"	if BR2_HOST_CMAKE_AT_LEAST_3_29
 	default "3.28"	if BR2_HOST_CMAKE_AT_LEAST_3_28
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index f80b942103..f214c21925 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.30/cmake-3.30.5-SHA-256.txt
-sha256  9f55e1a40508f2f29b7e065fa08c29f82c402fa0402da839fffe64a25755a86d  cmake-3.30.5.tar.gz
+# From https://cmake.org/files/v3.31/cmake-3.31.1-SHA-256.txt
+sha256  c4fc2a9bd0cd5f899ccb2fb81ec422e175090bc0de5d90e906dd453b53065719  cmake-3.31.1.tar.gz
 
 # Locally calculated
 sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 0c5d46c23d..7fc1f0181d 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
-CMAKE_VERSION_MAJOR = 3.30
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).5
+CMAKE_VERSION_MAJOR = 3.31
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
