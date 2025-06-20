Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E875C7115B
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 06:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FFAB60770;
	Fri, 20 Jun 2025 06:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lETHVdgFhtQO; Fri, 20 Jun 2025 06:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D32160DF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D32160DF7;
	Fri, 20 Jun 2025 06:27:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67404E2
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 06:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63A4783AE2
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 06:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljC-zz0DGgRV for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 06:27:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 98B4483ADD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98B4483ADD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98B4483ADD
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 06:27:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b017.dip0.t-ipconnect.de [84.161.176.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C05A4A4C2461;
 Fri, 20 Jun 2025 08:27:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36344)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uSVDR-000000001CI-3YQ9;
 Fri, 20 Jun 2025 06:27:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Fri, 20 Jun 2025 08:27:09 +0200
Message-Id: <20250620062709.20890-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750400829;
 bh=WBEacfAOGVt+AyisZ7fScnx/jMyFMXq/3uH7ttE8ujE=;
 h=From:To:Cc:Subject:Date:From;
 b=V0iO6V1EKNibeuyg37ZT2KHcesQEDGiIaQGU6G6yi17VQ7J4+d2+yPMFfwDIrGUPU
 UNB2bssh67XXmht5Zk2R/gnqySqGER9yKyByjCFRIMMcLpRLa4rsvUHY11xYJ0QZbi
 88egOgSdZQ5JZaHqQUgXJrI5DLJSHkgPXVpByoU+2Jb+kSyCTkQxKi7cGBvuQzJ7JW
 +8WD/MNrX0iu5RYITcr/mey/6Qba7phWtRiG5NxrDbZ6LSuij/0elNqMtZRHjN9A8y
 bW6mwBMCX3ldhWeSzg8CWJbaHZd7FnnTWuMY8H/MQc24dIzz8/Z9awZSkVw5AqG+/5
 EuckswWGn9WSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=V0iO6V1E
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.1.4
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
https://lists.freedesktop.org/archives/mesa-announce/2025-June/000808.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 2ce0465a08..c6ac968132 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.1.3
+MESA3D_HEADERS_VERSION = 25.1.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index c01d6ae762..3eb73ce4dd 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-June/000807.html
-sha256  ffcb6cadb5fd356d56008e6308641dfe4b2929f30139f6585436ca6e3cddba7f  mesa-25.1.3.tar.xz
-sha512  20b72ac4e39e559e36be07f003707cf5e25c5ebac22746d71438edecb9d911f5341373b1632ff08c00b57ac15fc880ce5a203ab9165e5e71057816be31344fd7  mesa-25.1.3.tar.xz2
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-June/000808.html
+sha256  164872a5e792408aa72fecd52b7be6409724c4ad81700798675a7d801d976704  mesa-25.1.4.tar.xz
+sha512  b97a0fa185181e86ea39bf71a6031edf9e9477378aba2c1ff6dbe88399cc9f7dc728591b49918c0dccb170dce11335b2b8fa015c7b7495f2e166b295d47fd343  mesa-25.1.4.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 76789f647e..5622292b92 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.1.3
+MESA3D_VERSION = 25.1.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
