Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38C5E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 20:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64EF4606E0;
	Sat, 14 Dec 2024 20:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gj0aAzl0PtHf; Sat, 14 Dec 2024 20:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FA81606FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FA81606FA;
	Sat, 14 Dec 2024 20:45:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF4A4D0
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFFE241294
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLg3sIY6HkAZ for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 20:45:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C46AA411D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C46AA411D0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C46AA411D0
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:45:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c243.dip0.t-ipconnect.de [79.214.194.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E35A7A4C3B8B
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 21:44:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47036)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tMZ0S-000000004lQ-0Qw5
 for buildroot@buildroot.org; Sat, 14 Dec 2024 20:44:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 21:44:56 +0100
Message-Id: <20241214204456.2666262-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734209096;
 bh=HqIyeG3BNCDo6a4B2aRW8Vj6Hxv2rbj2U57r3nI4h8Q=;
 h=From:To:Subject:Date:From;
 b=jGkUzb+I6iPaqM2DODrYOXR+mdh5epTto5gVrii2pqnvqdQSGsacTVhLJf3pIwKjL
 jpYX6knXvvLl5RyFri8RyzcKiIB0oq+lOov3AsdmVQj9H8EvyLzYbPmF/8wBA4o9um
 QybRMhCYVUAOfZe6968/0obF8A/P/ccSGm0aVsa3xcpr8guHz3HfZypUOLbWjhqNeG
 GvHg4B4fxPgc71ErhdEswvy7k0kTrghcTn2zs5TjzgV2L8zv/XyyumjXOYW16jo8dI
 lSOYj3d7hJv6hcQcQx0S12HLN2sktFEPUHQWuQ3Xj0s8d8huJCvpNkme3YUK2x5xMA
 Od3d1HqOCIr7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=jGkUzb+I
Subject: [Buildroot] [PATCH 1/1] package/libdeflate: bump version to 1.22
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
https://github.com/ebiggers/libdeflate/blob/master/NEWS.md

Updated license hash due to upstream commit:
https://github.com/ebiggers/libdeflate/commit/439f30117684c7859e0b1d4d8c57306b9ad71fd4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdeflate/libdeflate.hash | 4 ++--
 package/libdeflate/libdeflate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdeflate/libdeflate.hash b/package/libdeflate/libdeflate.hash
index 46afa96635..bb97c76c3d 100644
--- a/package/libdeflate/libdeflate.hash
+++ b/package/libdeflate/libdeflate.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ed1454166ced78913ff3809870a4005b7170a6fd30767dc478a09b96847b9c2a  libdeflate-1.20.tar.gz
-sha256  5d246dd2537307b80fed9ba5fdddf5d0fe7a8f023393a071182b9daed56b40fe  COPYING
+sha256  7f343c7bf2ba46e774d8a632bf073235e1fd27723ef0a12a90f8947b7fe851d6  libdeflate-1.22.tar.gz
+sha256  4ad69099cb4374836fd27583d9991e2838cd86b6e4666ab26b2d32582c91e73a  COPYING
diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 4597dc5a8c..823ff442fd 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDEFLATE_VERSION = 1.20
+LIBDEFLATE_VERSION = 1.22
 LIBDEFLATE_SITE = $(call github,ebiggers,libdeflate,v$(LIBDEFLATE_VERSION))
 LIBDEFLATE_LICENSE = MIT
 LIBDEFLATE_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
