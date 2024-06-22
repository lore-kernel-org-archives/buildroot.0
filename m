Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B907AC27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 08:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71B9240503;
	Sat, 22 Jun 2024 08:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKg2yiX4hlAq; Sat, 22 Jun 2024 08:35:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09ADF4052B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09ADF4052B;
	Sat, 22 Jun 2024 08:35:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB4421BF5EA
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4F6A4069B
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPyJ15xCD53k for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 08:34:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F04A4065A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F04A4065A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F04A4065A
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 08:34:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf60.dip0.t-ipconnect.de [79.214.207.96])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9E8D6A4C0403;
 Sat, 22 Jun 2024 10:34:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58240)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sKwD2-000000000VL-0Sqn;
 Sat, 22 Jun 2024 08:34:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 10:34:56 +0200
Message-Id: <20240622083456.9596-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719045296;
 bh=8+xd+puE9yqlhw6aoJ+UiYpC1QIWW6jecY0FGgj+4v8=;
 h=From:To:Cc:Subject:Date:From;
 b=TayP6eginTpwpASaClF0r/iLvv9RXL/Ow2Xn99DwpU7lalmKxC41sv0oslr4783q0
 wsl7+68pYhvdfgu8bQrKJZyksfKCdRB/R8o1aH2F5/xwVXyXKHyrxtIRsJ/Sm4Yxob
 YIvSM01PSliSlswmlntHp7YzGBotFlvz1N3aWCc8xNZWEON7WJJV6Nz9XZskfORhgQ
 /4fJ6Sq34cVf393vbKVrgVN1iQFByPdpknWEeaDCQS037IctkXwwgqvg0PvpFVkZ/Y
 rIatInKOt+NYvHAKMOHh6egrMZcFi6kYVppVJCM64wcZvbaZV6FBoeBc3nOiyBx7/m
 IsC6q4/RHn1vQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=TayP6egi
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.29.6
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

Updated license hash due to copyright year bump:
https://gitlab.kitware.com/cmake/cmake/-/commit/4bc97565d0f97fa1a840d56ab58be46ccad175e0
and updated zlib version:
https://gitlab.kitware.com/cmake/cmake/-/commit/6c2bed54f6610405e1a37aa48ff0f8d25f198076

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/Config.in.host | 5 +++++
 package/cmake/cmake.hash     | 6 +++---
 package/cmake/cmake.mk       | 4 ++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index c38bb9daaa..6865ce1557 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -51,10 +51,15 @@ config BR2_HOST_CMAKE_AT_LEAST_3_28
 	bool
 	select BR2_HOST_CMAKE_AT_LEAST_3_27
 
+config BR2_HOST_CMAKE_AT_LEAST_3_29
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_28
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_HOST_CMAKE_AT_LEAST
 	string
+	default "3.29"	if BR2_HOST_CMAKE_AT_LEAST_3_29
 	default "3.28"	if BR2_HOST_CMAKE_AT_LEAST_3_28
 	default "3.27"	if BR2_HOST_CMAKE_AT_LEAST_3_27
 	default "3.26"	if BR2_HOST_CMAKE_AT_LEAST_3_26
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 74b4a0a3a8..70adb9c0d8 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.28/cmake-3.28.3-SHA-256.txt
-sha256  72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1  cmake-3.28.3.tar.gz
+# From https://cmake.org/files/v3.29/cmake-3.29.6-SHA-256.txt
+sha256  1391313003b83d48e2ab115a8b525a557f78d8c1544618b48d1d90184a10f0af  cmake-3.29.6.tar.gz
 
 # Locally calculated
-sha256  4a01ccf2dc580ba570d02bc015bbe0ec92f1f318717aae9540ba841ba7946756  Copyright.txt
+sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 49d1f9fea5..388507f4e5 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
-CMAKE_VERSION_MAJOR = 3.28
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_VERSION_MAJOR = 3.29
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
