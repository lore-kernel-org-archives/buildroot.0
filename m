Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149FCC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4488605D5;
	Wed, 10 Jul 2024 21:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCI7tmfi7oN0; Wed, 10 Jul 2024 21:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2E5360890
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2E5360890;
	Wed, 10 Jul 2024 21:42:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C6A01BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6978260890
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nL2DgDtOUSnu for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6118C605D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6118C605D5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6118C605D5
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:42:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b57c.dip0.t-ipconnect.de [84.161.181.124])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DD4F8A4C106F;
 Wed, 10 Jul 2024 23:42:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41296)
 by fli4l.lan.fli4l with esmtp (Exim 4.98-RC3)
 (envelope-from <bernd@kuhls.net>) id 1sRf5J-000000004lv-14jW;
 Wed, 10 Jul 2024 21:42:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 23:42:45 +0200
Message-Id: <20240710214245.3432395-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1720647765;
 bh=Sd0qZgR4L6IDlVoujG2YBz4ukxG8+k7Wqyo3WNm/BNM=;
 h=From:To:Cc:Subject:Date:From;
 b=bLCq7DU7Z+yy004sGD05poXx9brPHf/+DFJ46/oRMKvJ38SZ/99mN/EaLPACLiMlr
 r+EAvo9CG0jFS48ZyPHOPGaecraRlTT6/pSHlRNieCYIqh00uwrwKWgA4Es94TqCmp
 pl6lhG/w467y3yC9zO3lygmKJ8gaPFMk7nD0gbF67GPUuwN0EzZqgFXFV7oD8blhsI
 ftBnnBUUcWEvzWW2hnk365s1WN0bHNEWXKr0t5toGt73g0YN0+7ame72qlptItwzpE
 NHWnsetQ2MaR1Ty4icBqpIeH+L3AODGS4S+wJBIw0bLLBYBEgieMW2Pj5dAXZ6aS33
 zfxQSyNV5CNnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=bLCq7DU7
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.30.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Release notes:
https://cmake.org/cmake/help/latest/release/3.29.html
https://cmake.org/cmake/help/latest/release/3.30.html

Updated license hash due to copyright year bump:
https://gitlab.kitware.com/cmake/cmake/-/commit/4bc97565d0f97fa1a840d56ab58be46ccad175e0
and updated zlib version:
https://gitlab.kitware.com/cmake/cmake/-/commit/6c2bed54f6610405e1a37aa48ff0f8d25f198076

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/Config.in.host | 10 ++++++++++
 package/cmake/cmake.hash     |  6 +++---
 package/cmake/cmake.mk       |  4 ++--
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index c38bb9daaa..389300f31f 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -51,10 +51,20 @@ config BR2_HOST_CMAKE_AT_LEAST_3_28
 	bool
 	select BR2_HOST_CMAKE_AT_LEAST_3_27
 
+config BR2_HOST_CMAKE_AT_LEAST_3_29
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_28
+
+config BR2_HOST_CMAKE_AT_LEAST_3_30
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_29
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_HOST_CMAKE_AT_LEAST
 	string
+	default "3.30"	if BR2_HOST_CMAKE_AT_LEAST_3_30
+	default "3.29"	if BR2_HOST_CMAKE_AT_LEAST_3_29
 	default "3.28"	if BR2_HOST_CMAKE_AT_LEAST_3_28
 	default "3.27"	if BR2_HOST_CMAKE_AT_LEAST_3_27
 	default "3.26"	if BR2_HOST_CMAKE_AT_LEAST_3_26
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 74b4a0a3a8..ee6dab551c 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.28/cmake-3.28.3-SHA-256.txt
-sha256  72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1  cmake-3.28.3.tar.gz
+# From https://cmake.org/files/v3.30/cmake-3.30.0-SHA-256.txt
+sha256  157e5be6055c154c34f580795fe5832f260246506d32954a971300ed7899f579  cmake-3.30.0.tar.gz
 
 # Locally calculated
-sha256  4a01ccf2dc580ba570d02bc015bbe0ec92f1f318717aae9540ba841ba7946756  Copyright.txt
+sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 49d1f9fea5..eacecdc0ee 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
-CMAKE_VERSION_MAJOR = 3.28
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_VERSION_MAJOR = 3.30
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
