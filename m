Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66835C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 10:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08A1340A11;
	Sat, 15 Aug 2026 10:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9X2EQ943gQU; Sat, 15 Aug 2026 10:47:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A95F409FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786790858;
	bh=faDX9k20JH6EdVT4nWrhkJHgacQD/KQbM+FBvtKgGP8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=GQi10ItMLKJQXfy3nvDTKpZ4eRePSVNAuAxwHtxLIdEajNcQc2kRr//oEFSgfr6g2
	 +I3GdHYVWIXfGLWhI9xS7ONSQCUh6KCXGj/ZKfrTKvJ/C/JGnYfA6MsdGG/HC+3khm
	 cCxOFSitk/DbOf1yR/qw86XeaYbYl5KX2neguiyU+ly9EnCOQG34a88AWiWgNsugeM
	 OBPagrJ6r5SKDipjoz1CAtzg/I91rllRKdmglnC7KWw4rVulUlcuSJnERs47f+1J2G
	 9ueUkdG5Eyq1LcaOj1AENK3l+wsBNzN3MdKq0IgQx4D8bMGVEAKVMoTD5ldxmyd+Dl
	 92heAaInQRG3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A95F409FE;
	Sat, 15 Aug 2026 10:47:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0565C3DF
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 10:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E54F04005A
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 10:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_WoTlflT8eF for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 10:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E10CA4004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E10CA4004E
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E10CA4004E
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 10:47:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D91BA4E41247
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 10:47:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 95AE4604AA
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 10:47:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B803311C4F4D3; 
 Sat, 15 Aug 2026 12:47:27 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Aug 2026 12:47:25 +0200
Message-ID: <20260815104726.241039-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/double-conversion: bump to 3.4.0
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

Packaging changes:

- Drop patch that is upstream (it was an upstream backport)
- double-conversion now requires CMake 3.29, so we select
  BR2_HOST_CMAKE_AT_LEAST_3_29

Upstream changes:

CMake: Raised required version to 3.5 by @heirecka in #240
Bump ossf/scorecard-action from 2.4.0 to 2.4.1 by @dependabot[bot] in #241
Always initialize decimal-point variable. by @floitsch in #244
Explain that ToShortest might not be the shortest. by @floitsch in #245
Add higher bound for cmake. by @floitsch in #246
Bump ossf/scorecard-action from 2.4.1 to 2.4.2 by @dependabot[bot] in #248
Bump lukka/get-cmake from 4.0.2 to 4.0.3 by @dependabot[bot] in #250
Bump lukka/get-cmake from 4.0.3 to 4.1.0 by @dependabot[bot] in #252
Bump actions/checkout from 4.2.2 to 5.0.0 by @dependabot[bot] in #253
Bump lukka/get-cmake from 4.1.0 to 4.1.1 by @dependabot[bot] in #254
Add alias double-conversion::double-conversion by @Flamefire in #255
Revert "Add _ITERATOR_DEBUG_LEVEL=2 and _DEBUG defines (#202)" by @Osyotr in #256
Bump ossf/scorecard-action from 2.4.2 to 2.4.3 by @dependabot[bot] in #259
Install pkg-config file (from CMake build) by @Ericson2314 in #262
Update CI runners and minimal cmake. by @floitsch in #257
Bump lukka/get-cmake from 4.1.1 to 4.1.2 by @dependabot[bot] in #258
Bump lukka/get-cmake from 4.1.2 to 4.2.0 by @dependabot[bot] in #264
Bump actions/checkout from 5.0.0 to 6.0.0 by @dependabot[bot] in #265
Bump actions/checkout from 6.0.0 to 6.0.1 by @dependabot[bot] in #266
Prepare new release. by @floitsch in #267

See https://github.com/google/double-conversion/releases/tag/v3.4.0

Tested in a defconfig that has the two reverse dependencies of
double-conversion in Buildroot:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_UJSON=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...CMake-Raised-required-version-to-3.5.patch | 27 -------------------
 package/double-conversion/Config.in           |  1 +
 .../double-conversion/double-conversion.hash  |  2 +-
 .../double-conversion/double-conversion.mk    |  2 +-
 4 files changed, 3 insertions(+), 29 deletions(-)
 delete mode 100644 package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch

diff --git a/package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch b/package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch
deleted file mode 100644
index 9d8482d5d2..0000000000
--- a/package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 101e1ba89dc41ceb75090831da97c43a76cd2906 Mon Sep 17 00:00:00 2001
-From: Heiko Becker <mail@heiko-becker.de>
-Date: Thu, 20 Feb 2025 15:20:07 +0100
-Subject: [PATCH] CMake: Raised required version to 3.5 (#240)
-
-CMake >= 4.0.0-rc1 removed compatibility with versions < 3.5 and errors
-out with such versions passed to cmake_minimum_required(). 3.5.0 has
-been released 9 years ago, so I'd assume it's available almost
-everywhere.
-
-Upstream: https://github.com/google/double-conversion/commit/101e1ba89dc41ceb75090831da97c43a76cd2906
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8749ef86..31457723 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5)
- project(double-conversion VERSION 3.3.0)
- 
- option(BUILD_SHARED_LIBS "Build shared libraries (.dll/.so) instead of static ones (.lib/.a)" OFF)
diff --git a/package/double-conversion/Config.in b/package/double-conversion/Config.in
index b858b56c27..1c43a2a851 100644
--- a/package/double-conversion/Config.in
+++ b/package/double-conversion/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DOUBLE_CONVERSION
 	bool "double-conversion"
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_HOST_CMAKE_AT_LEAST_3_29
 	help
 	  Provides binary-decimal and decimal-binary routines for
 	  IEEE doubles.
diff --git a/package/double-conversion/double-conversion.hash b/package/double-conversion/double-conversion.hash
index a10da6d75d..3b61297332 100644
--- a/package/double-conversion/double-conversion.hash
+++ b/package/double-conversion/double-conversion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  fe54901055c71302dcdc5c3ccbe265a6c191978f3761ce1414d0895d6b0ea90e  double-conversion-3.3.1.tar.gz
+sha256  42fd4d980ea86426e457b24bdfa835a6f5ad9517ddb01cdb42b99ab9c8dd5dc9  double-conversion-3.4.0.tar.gz
 sha256  4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  COPYING
diff --git a/package/double-conversion/double-conversion.mk b/package/double-conversion/double-conversion.mk
index a4760236ca..0c73c07043 100644
--- a/package/double-conversion/double-conversion.mk
+++ b/package/double-conversion/double-conversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOUBLE_CONVERSION_VERSION = 3.3.1
+DOUBLE_CONVERSION_VERSION = 3.4.0
 DOUBLE_CONVERSION_SITE = $(call github,google,double-conversion,v$(DOUBLE_CONVERSION_VERSION))
 DOUBLE_CONVERSION_LICENSE = BSD-3-Clause
 DOUBLE_CONVERSION_LICENSE_FILES = COPYING
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
