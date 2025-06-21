Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA3FC71157
	for <buildroot@archiver.kernel.org>; Sat, 21 Jun 2025 17:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B752560745;
	Sat, 21 Jun 2025 17:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDWF7fbGxBF0; Sat, 21 Jun 2025 17:30:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8483B606F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8483B606F3;
	Sat, 21 Jun 2025 17:30:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77070C8
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 17:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 556E4606F3
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 17:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gJKXofdL7HU for <buildroot@buildroot.org>;
 Sat, 21 Jun 2025 17:30:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 03A52605C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03A52605C3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03A52605C3
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 17:30:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b017.dip0.t-ipconnect.de [84.161.176.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5DBBCA4C0A6E
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 19:30:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50308)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uT22m-000000007lR-28Qh
 for buildroot@buildroot.org; Sat, 21 Jun 2025 17:30:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 21 Jun 2025 19:30:19 +0200
Message-Id: <20250621173019.3992829-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750527020;
 bh=Q6muCNvmj0ZX7mD/wfeyfkjab3T3l1ieP5+kBhJu8Tk=;
 h=From:To:Subject:Date:From;
 b=NwKbg2LFDEazH9ruXVR2XHZhCdj6+ZKBDiI/Ey3WVVBa6BzzMVVqYEYIc8hvZwT06
 JeRpjhJwMz1zu+m0KS7YhOmbJYlWcU4RMWYEKSmmGopQK1zCWHXlbZj/Ung1Ib2VR7
 uTVyYB2cBr41AYNyQGAo6AD7e4Hu9ICwsoxWByBAhAe9FNvtSBLUunvU8HY635dair
 Zz+YmyNXEPLtAyx53F67il89y3NygqIK6JRFii4snjvYv1gEiL+7prqOaTDq0GkAae
 DBXHQNCNBwDFWlPI/9NdKfO+YHnbd4ySa/F8X7sG58sbC8ULVEjQHnJYg7SHU0QpDy
 v+GnbDVhTRsnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=NwKbg2LF
Subject: [Buildroot] [PATCH 1/1] package/opencv3: bump version to 3.4.20
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

Changelog:
https://github.com/opencv/opencv/wiki/OpenCV-Change-Logs-v2.2%E2%80%90v4.10#version3420

Updated license hash due to copyright year bump:
https://github.com/opencv/opencv/commit/7b7774476e92247c801309387df2ea64465976e3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/opencv3/opencv3.hash | 4 ++--
 package/opencv3/opencv3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
index 3d6fd2ed8a..b378e7050f 100644
--- a/package/opencv3/opencv3.hash
+++ b/package/opencv3/opencv3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9b913e74299ce4416a5c94000da577c592bf670fd53bad16220eb115a0821529  opencv3-3.4.19.tar.gz
-sha256  c1fed9cd2f557ba23a1b37a21e2c90629d1a60bdb61e92d0e79369bb6fca3390  LICENSE
+sha256  b9eda448a08ba7b10bfd5bd45697056569ebdf7a02070947e1c1f3e8e69280cd  opencv3-3.4.20.tar.gz
+sha256  3f221dbe2ca9228d6470990ed28e55957e8506335df4620539c4db0dd27a6b4c  LICENSE
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 5064496ca6..218174c17e 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV3_VERSION = 3.4.19
+OPENCV3_VERSION = 3.4.20
 OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
