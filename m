Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E6BD5CC8D
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 09:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31E5960895;
	Tue, 16 Dec 2025 09:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70tnfUQTBpBH; Tue, 16 Dec 2025 09:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4425D60F23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765877721;
	bh=9BestrjTOSgvVTJbt2jSDfd8ekryTnr13KxOGuVeyPo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=SEgy2H5tGOBng29219tnvGQfN5gLEy3tgxgUoqZBwCXcT502eRrAmphKOGrrNCxLn
	 MtX5Ahnk7X/wI3NYtC2sbpM7ufTPZjjYYBGcyK9idrEb5lTftOb8Tb/MkGxQt2lgDK
	 GuqlPOjr2l3Q9K5lETdYRCWdVzIHxti3ilSQg2hyYig3AXvsZD74HdI8TY3ouZniO8
	 IND4g71VUcXclOolmBaqiBAAUbMe9QsvkXpTo4J5gVr2x2xGA58AeZFsGb8OjKqJvn
	 I+TZ20sJivI+zih2zOdZzBHQ/8JOtABWrYdxH1CDzw8oTDOQG7A+BnjiLxwNfUY+fe
	 7X7WQmk5z1WOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4425D60F23;
	Tue, 16 Dec 2025 09:35:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FED6372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81F4280EA7
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIHDKMEXcx4f for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 09:35:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B911780E79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B911780E79
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B911780E79
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:35:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 701C64E41C26
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:35:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 449B86071C
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:35:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 155B111942E5A; Tue, 16 Dec 2025 10:35:13 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Dec 2025 10:34:46 +0100
Message-ID: <20251216093447.1377743-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765877714; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Ck898mRFyhJaYTOwpKVopof9ERmwgWH1F+o+uhkpiBc=;
 b=FzVx+I5KfVWxUIs4Wh6RIlcyBJH2LttMqGdnBxTl3YQ0lFMjNhkzK0ibqCaSt0N5xa957H
 V5vYi95OSNWu9EqLIaHmkA8f5Wb/voIxjZ/xcxv5a0w+n0gAMmulZvfr05ZxXoC5VKLEva
 YWgNlXMCjXi0vW70nXgX8QmWWFeIxAQoVnERRKnfZFe8q76fsGLRDy36ANzznG9snZjkwi
 WAGoHK9n5xMRvldYMprG9v7AfojdMGBME6Z7tDbYLaiDonc83GQs9CNv0CPs0lwcAn0VkF
 6Dj+bP6FgJtokhd+Au2dQnBhiNq1sVD76o1GXCgIw2/zTV3b2ZEjBGEmgDUicA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=FzVx+I5K
Subject: [Buildroot] [PATCH] package/musepack: fix build with CMake 4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

No autobuilder issues, as this problem was hidden by the libcuefile
CMake 4 build issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
I would also be totally OK by dropping this package related to
libcuefile, and similarly unmaintained.
---
 ...s.txt-fix-compatibility-with-CMake-4.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/musepack/0007-CMakeLists.txt-fix-compatibility-with-CMake-4.patch

diff --git a/package/musepack/0007-CMakeLists.txt-fix-compatibility-with-CMake-4.patch b/package/musepack/0007-CMakeLists.txt-fix-compatibility-with-CMake-4.patch
new file mode 100644
index 0000000000..ed8988a337
--- /dev/null
+++ b/package/musepack/0007-CMakeLists.txt-fix-compatibility-with-CMake-4.patch
@@ -0,0 +1,35 @@
+From 72267961bc3dafecdd6ce1d5bbdffaa6f7120004 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 16 Dec 2025 10:32:58 +0100
+Subject: [PATCH] CMakeLists.txt: fix compatibility with CMake 4
+
+Fixes:
+
+CMake Error at CMakeLists.txt:1 (CMAKE_MINIMUM_REQUIRED):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Upstream: N/A, dead
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b13f78c..0764198 100755
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.4)
++CMAKE_MINIMUM_REQUIRED(VERSION 3.5)
+ cmake_policy(SET CMP0003 NEW)
+ include(TestBigEndian)
+ 
+-- 
+2.52.0
+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
