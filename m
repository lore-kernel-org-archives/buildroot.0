Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F945E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 16:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 561F54151A;
	Sat, 14 Dec 2024 16:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBNOVizXV6CN; Sat, 14 Dec 2024 16:11:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2618741525
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2618741525;
	Sat, 14 Dec 2024 16:11:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDFC1CE
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 16:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AED6D4151A
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 16:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRBNv79xUmeQ for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 16:11:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 28097414F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28097414F2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28097414F2
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 16:11:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c577.dip0.t-ipconnect.de [79.214.197.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3A5DEA4C3BB5;
 Sat, 14 Dec 2024 17:11:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42474)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tMUjx-000000005Cs-3YnG;
 Sat, 14 Dec 2024 16:11:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2024 17:11:37 +0100
Message-Id: <20241214161137.3283154-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734192698;
 bh=xp7jKq2LzYN+dJDtaF44TW5geJAAL7elRdNxiiGNH18=;
 h=From:To:Cc:Subject:Date:From;
 b=R2GRHLjMKR92YEaA/rYGjvSlnSU4Bi3tgGvseK0D747VWXeutl6aFfJegB3yBpcDd
 YPYNO/TpAIjmnwEaR65oy0wfw51U4sRjhQyZKrKOMkcS2kcVGMoDwaOXelGDwPTKv1
 5ppRJFJ0WinF57D0TN2a/w9G1VeGyUuh5PK/UHxsmU5Ra7uDGR0NmTl7x698SzXf/p
 8i6q58aUsmczdGF3NhBGO4A8ApzROZpkGqvNMxVMYVxxO4pnlnzQ28spL2/3gm/p3n
 5Uo+7n7lIAaPJK1OGiiDkoMlSFFq0CEqcJptBGs1dj3on92XWR9ozL/hQPyWV4WxBx
 5bWpJMW0vupBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=R2GRHLjM
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.31.2
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
https://www.kitware.com/cmake-3-31-2-available-for-download/

Rebased patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/0001-rename-cmake-rootfile.patch | 4 ++--
 package/cmake/cmake.hash                       | 4 ++--
 package/cmake/cmake.mk                         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cmake/0001-rename-cmake-rootfile.patch b/package/cmake/0001-rename-cmake-rootfile.patch
index 7e6e0a8cf7..c73e0dfe02 100644
--- a/package/cmake/0001-rename-cmake-rootfile.patch
+++ b/package/cmake/0001-rename-cmake-rootfile.patch
@@ -12,7 +12,7 @@ This buildroot-specific patch makes sure ctest looks also for
 
 [Vincent: tweak patch for 3.6.3]
 [James: tweak patch for 3.15.4]
-[Bernd: tweak patch for 3.27.0]
+[Bernd: tweak patch for 3.27.0 & 3.31.2]
 
 Signed-off-by: Davide Viti <zinosat@tiscali.it>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
@@ -26,7 +26,7 @@ diff --git a/Source/cmake.cxx b/Source/cmake.cxx
 index 3772f09985..c317e4af38 100644
 --- a/Source/cmake.cxx
 +++ b/Source/cmake.cxx
-@@ -1891,7 +1891,12 @@ int cmake::AddCMakePaths()
+@@ -1896,7 +1896,12 @@ int cmake::AddCMakePaths()
                        cmStateEnums::INTERNAL);
  #endif
    if (!cmSystemTools::FileExists(
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index f214c21925..89c2662091 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.31/cmake-3.31.1-SHA-256.txt
-sha256  c4fc2a9bd0cd5f899ccb2fb81ec422e175090bc0de5d90e906dd453b53065719  cmake-3.31.1.tar.gz
+# From https://cmake.org/files/v3.31/cmake-3.31.2-SHA-256.txt
+sha256  42abb3f48f37dbd739cdfeb19d3712db0c5935ed5c2aef6c340f9ae9114238a2  cmake-3.31.2.tar.gz
 
 # Locally calculated
 sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 7fc1f0181d..1032ec6e39 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.31
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
