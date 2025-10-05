Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208E2CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 08:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B992C412EE;
	Sun,  5 Oct 2025 08:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UH76OCROs8u0; Sun,  5 Oct 2025 08:59:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C516F412E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C516F412E6;
	Sun,  5 Oct 2025 08:59:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ACBF226
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 08:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BF00412C1
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 08:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ktZ8BQDmwb6 for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 08:59:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C44B412EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C44B412EA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C44B412EA
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 08:59:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c725.dip0.t-ipconnect.de [79.214.199.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 25D37A4C5D2E;
 Sun,  5 Oct 2025 10:59:08 +0200 (CEST)
Received: from [192.168.1.144] (port=53466 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v5KaB-000000001f0-254I;
 Sun, 05 Oct 2025 08:59:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  5 Oct 2025 10:59:07 +0200
Message-ID: <20251005085907.1707917-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759654748;
 bh=uKud5XzB1BMZfnhUvuIlTcR/NE2iA3afGCXjzsseThE=;
 h=From:To:Cc:Subject:Date:From;
 b=yQT2O4uB4Omy1kiXyhNE3vDnH0+EtU9M0C7P/Hv5Y8PccLv/7Ic2nvDXyVyMtehIg
 xmpBUftkMOsj2Egihm1fWgZX3kTqUrSKCFtVeYCPVU/rEhtjiasqiu4rbdz9u15UY7
 /bVKDhWIK3Y46n6B16pjU3UpVJLv9vfWdx5hcEgheL2XCnaghDsUtO5p6ILRZfnO+w
 FxrZEAqzh+8UyrfyURbZoKoBnj8Dsbm0CkZtjZWQycnu5NA2eo0rRA2GwXIiwuFHo1
 WHSPvi2GvczUdafH3ADpENVBH7RUVXaFISKv4mmxidQ+NHz0oBizXvxe3S1+VE/U5+
 rULyu9mlpiy6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=yQT2O4uB
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.1.2
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
https://cmake.org/cmake/help/latest/release/4.1.html

License file was renamed upstream
https://gitlab.kitware.com/cmake/cmake/-/commit/2d42a5444f859891b6598c76ea5d51510013565e
and updated:
https://gitlab.kitware.com/cmake/cmake/-/commits/v4.0.3/LICENSE.rst?ref_type=tags

This release fixes the build with libcurl >= 8.16.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/Config.in.host | 10 ++++++++++
 package/cmake/cmake.hash     |  6 +++---
 package/cmake/cmake.mk       |  6 +++---
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index b30ce03a1c..f09c5ba28e 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -63,10 +63,20 @@ config BR2_HOST_CMAKE_AT_LEAST_3_31
 	bool
 	select BR2_HOST_CMAKE_AT_LEAST_3_30
 
+config BR2_HOST_CMAKE_AT_LEAST_4_0
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_31
+
+config BR2_HOST_CMAKE_AT_LEAST_4_1
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_4_0
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_HOST_CMAKE_AT_LEAST
 	string
+	default "4.1"	if BR2_HOST_CMAKE_AT_LEAST_4_1
+	default "4.0"	if BR2_HOST_CMAKE_AT_LEAST_4_0
 	default "3.31"	if BR2_HOST_CMAKE_AT_LEAST_3_31
 	default "3.30"	if BR2_HOST_CMAKE_AT_LEAST_3_30
 	default "3.29"	if BR2_HOST_CMAKE_AT_LEAST_3_29
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 6101fe16f0..4d23725f4b 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.31/cmake-3.31.8-SHA-256.txt
-sha256  e3cde3ca83dc2d3212105326b8f1b565116be808394384007e7ef1c253af6caa  cmake-3.31.8.tar.gz
+# From https://cmake.org/files/v4.1/cmake-4.1.2-SHA-256.txt
+sha256  643f04182b7ba323ab31f526f785134fb79cba3188a852206ef0473fee282a15  cmake-4.1.2.tar.gz
 
 # Locally calculated
-sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
+sha256  1e0d48f16c60f400838a96989684ae12cec35cb96688db11e8cb0204058cf4b8  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 1eb4da90ad..59d13d0cc0 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,11 +5,11 @@
 ################################################################################
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
-CMAKE_VERSION_MAJOR = 3.31
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).8
+CMAKE_VERSION_MAJOR = 4.1
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
-CMAKE_LICENSE_FILES = Copyright.txt
+CMAKE_LICENSE_FILES = LICENSE.rst
 CMAKE_CPE_ID_VALID = YES
 # Tool download MITM attack warning if using npm package to install cmake
 CMAKE_IGNORE_CVES = CVE-2016-10642
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
