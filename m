Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC0F1099B32
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 18:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77B9361BC4;
	Fri, 20 Mar 2026 18:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39wx4kGDEHPf; Fri, 20 Mar 2026 18:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12E6461B61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774031584;
	bh=fbyPO1nGA2aREAN2Dshv4gYDPjY9Jgw8mz91FCUmsdg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EDfI9Og7Yhvne3fQ7/OMl0fofWIXqXtdg+6ad8L8ugN6+QLId9uVuOmDlNzuTFTvm
	 FSlsdvMf/s5gfploq5qri36ZT3GdPZm1EiXYNZcPdHQuOSkcItyP9NTd2tgXxadiQz
	 KBreeH85oUm1YRy830FHVhUPZ04flF42KugbvVPLDzexkWKWVImtBgMS7aIgB8Zqbb
	 O6VS0lVT4vzpJzNxREebKhteas/WPiJJK9kLfPLT4yWAls2/C7tZItE5qYqZ6R0o3W
	 XNhzH1i01hrIho8sTXrYs/WoRnrlmFEatx3lnLtuZp/7VYhrVC17gfMq7TmpAfZoKG
	 UnkiElapSgxWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12E6461B61;
	Fri, 20 Mar 2026 18:33:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D76C4265
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 18:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D50F040237
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 18:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w4cPsBA1pbq2 for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 18:33:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1ADF2400E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ADF2400E3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1ADF2400E3
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 18:33:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ce09.dip0.t-ipconnect.de [79.214.206.9])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3846FA4C01CC;
 Fri, 20 Mar 2026 19:32:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49888)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w3eeV-000000007O1-2u5X;
 Fri, 20 Mar 2026 18:32:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Mar 2026 19:32:55 +0100
Message-ID: <20260320183255.28463-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774031577;
 bh=uFyHG6DGgmsdSi2dHDqMuCjRQr7cYaoDSpWEPRBkEHU=;
 h=From:To:Cc:Subject:Date:From;
 b=OxOYbHCgaf4YQClG0ej2gaBRsHIPdNgv4kOBIXXDw9uSTPGr6fW/2zT30iUfFdg5S
 kuts5f4Xp74He7H0KQvZUfwIEVU2nRyzqgLVJx2OeX931SyGXyhCgUmol/2SNGiYdF
 zGG8xLbd4zkjSyBpHZNcmEl+x55crKSXAJSn+27WEW0+KilkwDRhfBjC/d+dxYmXGJ
 YgeC6q+7bNwUgRDuuobifFxEaeZtPKujjx2QHhUjXHTCQBsvqXRiSkapWy4gY190e4
 qG4Kl5a/YlhrW5i5hJSZpxnqNG2nzK8t6CdStXyxpVX3RYVoZQ+hixPBw5BllLwPDq
 KUo9ivOy01k5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=OxOYbHCg
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.3.0
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

https://cmake.org/cmake/help/v4.3/release/4.3.html

Added Upstream: tag and rebased patch 0001.

Updated license hash due to copyright year bump:
https://gitlab.kitware.com/cmake/cmake/-/commit/97ad58a86cf73d85f755939114eb6b32f085d0dd

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                            | 1 -
 package/cmake/0001-rename-cmake-rootfile.patch | 8 +++++---
 package/cmake/Config.in.host                   | 5 +++++
 package/cmake/cmake.hash                       | 6 +++---
 package/cmake/cmake.mk                         | 4 ++--
 5 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0b1f71d8c6..973ecfba89 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -244,7 +244,6 @@ package/cfm/S65cfm lib_sysv.Indent lib_sysv.Variables
 package/cgroupfs-mount/S30cgroupfs Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/chipmunk/0001-Fix-build-failure-on-musl.patch lib_patch.Upstream
 package/chrony/S49chronyd lib_sysv.Variables
-package/cmake/0001-rename-cmake-rootfile.patch lib_patch.Upstream
 package/collectd/0001-src-netlink.c-remove-REG_NOERROR.patch lib_patch.Upstream
 package/connman/S45connman lib_sysv.Variables
 package/copas/0001-Do-not-load-coxpcall-for-LuaJIT.patch lib_patch.Upstream
diff --git a/package/cmake/0001-rename-cmake-rootfile.patch b/package/cmake/0001-rename-cmake-rootfile.patch
index c73e0dfe02..72da31c8a3 100644
--- a/package/cmake/0001-rename-cmake-rootfile.patch
+++ b/package/cmake/0001-rename-cmake-rootfile.patch
@@ -10,9 +10,11 @@ files are removed at build time via the target-finalize rule.
 This buildroot-specific patch makes sure ctest looks also for
 "Modules/CMake.cmake.ctest" before complaining
 
+Upstream: N/A (specific to buildroot)
+
 [Vincent: tweak patch for 3.6.3]
 [James: tweak patch for 3.15.4]
-[Bernd: tweak patch for 3.27.0 & 3.31.2]
+[Bernd: rebased for 4.3.0]
 
 Signed-off-by: Davide Viti <zinosat@tiscali.it>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
@@ -26,7 +28,7 @@ diff --git a/Source/cmake.cxx b/Source/cmake.cxx
 index 3772f09985..c317e4af38 100644
 --- a/Source/cmake.cxx
 +++ b/Source/cmake.cxx
-@@ -1896,7 +1896,12 @@ int cmake::AddCMakePaths()
+@@ -1987,7 +1987,12 @@ int cmake::AddCMakePaths()
                        cmStateEnums::INTERNAL);
  #endif
    if (!cmSystemTools::FileExists(
@@ -39,7 +41,7 @@ index 3772f09985..c317e4af38 100644
 +  {
      // couldn't find modules
      cmSystemTools::Error(
-       "Could not find CMAKE_ROOT !!!\n"
+       cmStrCat("Could not find CMAKE_ROOT !!!\n"
 -- 
 2.20.1
 
diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index 86f93b0ac8..0d96ee2233 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -75,10 +75,15 @@ config BR2_HOST_CMAKE_AT_LEAST_4_2
 	bool
 	select BR2_HOST_CMAKE_AT_LEAST_4_1
 
+config BR2_HOST_CMAKE_AT_LEAST_4_3
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_4_2
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_HOST_CMAKE_AT_LEAST
 	string
+	default "4.3"	if BR2_HOST_CMAKE_AT_LEAST_4_3
 	default "4.2"	if BR2_HOST_CMAKE_AT_LEAST_4_2
 	default "4.1"	if BR2_HOST_CMAKE_AT_LEAST_4_1
 	default "4.0"	if BR2_HOST_CMAKE_AT_LEAST_4_0
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 88744ac703..605bed2a40 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.2/cmake-4.2.3-SHA-256.txt
-sha256  7efaccde8c5a6b2968bad6ce0fe60e19b6e10701a12fce948c2bf79bac8a11e9  cmake-4.2.3.tar.gz
+# From https://cmake.org/files/v4.3/cmake-4.3.0-SHA-256.txt
+sha256  f51b3c729f85d8dde46a92c071d2826ea6afb77d850f46894125de7cc51baa77  cmake-4.3.0.tar.gz
 
 # Locally calculated
-sha256  1e0d48f16c60f400838a96989684ae12cec35cb96688db11e8cb0204058cf4b8  LICENSE.rst
+sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index f5d1787d19..952e8174f4 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
-CMAKE_VERSION_MAJOR = 4.2
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_VERSION_MAJOR = 4.3
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
