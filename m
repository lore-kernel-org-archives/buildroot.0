Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31454C0218A
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 18:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0B4342690;
	Thu, 30 Jan 2025 18:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNOFK135JACj; Thu, 30 Jan 2025 18:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C063042699
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C063042699;
	Thu, 30 Jan 2025 18:23:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8280212C
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60FCF40342
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OETaweBRlZJs for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 18:23:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3427F4013B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3427F4013B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3427F4013B
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:23:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca57.dip0.t-ipconnect.de [79.214.202.87])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 067EAA4C042B;
 Thu, 30 Jan 2025 19:23:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40456)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tdZCV-000000001YU-1BPY;
 Thu, 30 Jan 2025 18:23:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 Jan 2025 19:23:39 +0100
Message-Id: <20250130182339.189234-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738261420;
 bh=DRpkI5lU88rCKne/oxJ+U2OcQBZRhnXDVL6eMSHa3j0=;
 h=From:To:Cc:Subject:Date:From;
 b=jpBXQGMIP7ie2/KrS8UaP8HWqCX9cvoeV4Fag3K21aoFrekmxCV/bhvRe73fbH/+D
 gprZ1onldI87SARb8gLPpIIwtN1MjnKJNegNz5oCaPUra+JUdukJV1NXHbtU2dIdu3
 FLZtl7YmO59qlIN8DhZWVxwZJ42UcXLHlQPitckzM9qODpOoJ9oRUUfJNVEtR6JW8i
 laeGmRzKEcRdhulf/8yDNu497uSCbenYPpnRiCdL5s2lMzfKYZfm3uZLGOZS9OWCBf
 E9TCFwwINTFsfZtlN8FUhk9hS5jtOUl6wPZkgrQ3t5PxYx+4cbnM5Ka1rCBbtpMTls
 yEX4nYRTEasoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=jpBXQGMI
Subject: [Buildroot] [PATCH] package/cmake: bump version to 3.31.5
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
https://www.kitware.com/cmake-3-31-5-available-for-download/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 88ffc5412b..a41f0a5c8e 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.31/cmake-3.31.3-SHA-256.txt
-sha256  fac45bc6d410b49b3113ab866074888d6c9e9dc81a141874446eb239ac38cb87  cmake-3.31.3.tar.gz
+# From https://cmake.org/files/v3.31/cmake-3.31.5-SHA-256.txt
+sha256  66fb53a145648be56b46fa9e8ccade3a4d0dfc92e401e52ce76bdad1fea43d27  cmake-3.31.5.tar.gz
 
 # Locally calculated
 sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 288039589d..6a1b6ae7ea 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.31
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
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
