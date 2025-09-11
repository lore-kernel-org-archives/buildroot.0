Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DF1CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 17:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83075849DE;
	Thu, 11 Sep 2025 17:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCjZupibeZ-o; Thu, 11 Sep 2025 17:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D0DC849DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D0DC849DF;
	Thu, 11 Sep 2025 17:13:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37701443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 17:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E85441E8F
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 17:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ce_Yok6uI1R4 for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 17:13:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C58EC41E87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C58EC41E87
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C58EC41E87
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 17:13:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b21f.dip0.t-ipconnect.de [84.161.178.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 93998A4C3B3B;
 Thu, 11 Sep 2025 19:13:34 +0200 (CEST)
Received: from [192.168.1.144] (port=53530 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uwkrW-000000006p8-28v5;
 Thu, 11 Sep 2025 17:13:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 19:13:32 +0200
Message-ID: <20250911171334.593571-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911171334.593571-1-bernd@kuhls.net>
References: <20250911171334.593571-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1757610814;
 bh=+dfOgAWPwXxNVVUZgcl4XvO1EYzXDokSAiIQ270GHUo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=zI98jqcDEhRY0Ms9AXJkg0wlsQQPPkCkH1H9PQZPS5ncE7ssIdZ6Y/Yy4Rhvf52dB
 ikdxy0JLxwLKMQ/SpYflApwZqXKnPaTeDYks1C09rF7NfWdEBtB6MAXjeBIi3Mv+jT
 Y5OIV+3FzQPoo3pRpWf1KUEr9im0CkEAHtfuQND1p9GKxtlMC3BYH/fdRqjHWa2S6x
 szYQ5gK4j5Km9sWws3apRx/uxB+AxRQbzh3Ib/za8bKw+5b+wQ53Hpg9bpcJjfOBu1
 h/Bbl3T9usrBcSWaCG1o4bl3vA5L+56yquDJzArjh+acBq/SlJyox54rh/kN+gvD8X
 NKlBgIlmBQrzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=zI98jqcD
Subject: [Buildroot] [PATCH 2/3] package/cmake: bump version to 4.0.4
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License file was renamed upstream
https://gitlab.kitware.com/cmake/cmake/-/commit/2d42a5444f859891b6598c76ea5d51510013565e
and updated:
https://gitlab.kitware.com/cmake/cmake/-/commits/v4.0.3/LICENSE.rst?ref_type=tags

This release fixes the build with libcurl >= 8.16.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/Config.in.host | 5 +++++
 package/cmake/cmake.hash     | 6 +++---
 package/cmake/cmake.mk       | 6 +++---
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index b30ce03a1c..c1ebbeb4be 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -63,10 +63,15 @@ config BR2_HOST_CMAKE_AT_LEAST_3_31
 	bool
 	select BR2_HOST_CMAKE_AT_LEAST_3_30
 
+config BR2_HOST_CMAKE_AT_LEAST_4_0
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_31
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_HOST_CMAKE_AT_LEAST
 	string
+	default "4.0"	if BR2_HOST_CMAKE_AT_LEAST_4_0
 	default "3.31"	if BR2_HOST_CMAKE_AT_LEAST_3_31
 	default "3.30"	if BR2_HOST_CMAKE_AT_LEAST_3_30
 	default "3.29"	if BR2_HOST_CMAKE_AT_LEAST_3_29
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 6101fe16f0..5a986319b4 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.31/cmake-3.31.8-SHA-256.txt
-sha256  e3cde3ca83dc2d3212105326b8f1b565116be808394384007e7ef1c253af6caa  cmake-3.31.8.tar.gz
+# From https://cmake.org/files/v4.0/cmake-4.0.4-SHA-256.txt
+sha256  629be82af0b76e029b675a4a37569e2ddc1769d42a768957c00ec0e98407737e  cmake-4.0.4.tar.gz
 
 # Locally calculated
-sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
+sha256  1e0d48f16c60f400838a96989684ae12cec35cb96688db11e8cb0204058cf4b8  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 1eb4da90ad..13c131f596 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,11 +5,11 @@
 ################################################################################
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
-CMAKE_VERSION_MAJOR = 3.31
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).8
+CMAKE_VERSION_MAJOR = 4.0
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).4
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
