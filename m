Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8ABC83F03
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 21:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBA5680D45;
	Thu,  3 Jul 2025 21:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6UdxdC9dtFp; Thu,  3 Jul 2025 21:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E06DF80DC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E06DF80DC1;
	Thu,  3 Jul 2025 21:00:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E18A515F
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 21:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C77F2407B6
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 21:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BXinS8ubFGf for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 21:00:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 65F92407C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65F92407C6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65F92407C6
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 21:00:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a07af.dip0.t-ipconnect.de [91.58.7.175])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ABA96A4C3858;
 Thu,  3 Jul 2025 23:00:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40550)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uXR2T-000000003xs-1leO;
 Thu, 03 Jul 2025 21:00:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Thu,  3 Jul 2025 23:00:13 +0200
Message-Id: <20250703210013.1518617-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751576413;
 bh=6DlVrNEci8/s4mpI0+cAmV/bYZTJ55AAh/71AViF4tM=;
 h=From:To:Cc:Subject:Date:From;
 b=xvTgGmuUAwWrsJaSAxnz68AiBFc3oCTHwKLCSzQdQY268qCZ2UfTv+mcQ2+C3h/BK
 i7FTj5c0lHrkpvV9Gb1c77NvZ/L31BbttwEe9/MwSgziwTyg/xhoLp6AmdkSBCINv+
 RNd07xrZyrPQul4XYcu73QC6rxA/mu83QOVUmpa9QgRJoX8vDH1HoXOsYROKAw95Gi
 uypJxkqAbqpYFD2IAPcWCJWVQaUMmzIUSI3/hFvW+LQOGuIYuwv5gzJ/U8x5t543AR
 9PQ99iRWk82KNh8/HRQ1NKC3LWwtA70Zu0l1TqMIwpMtpK/00r9fjHFQFgSqkMZk19
 TM+Ao8uC4HRcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=xvTgGmuU
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.1.5
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
https://lists.freedesktop.org/archives/mesa-announce/2025-July/000809.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index c6ac968132..998662b96b 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.1.4
+MESA3D_HEADERS_VERSION = 25.1.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 3eb73ce4dd..1e5e52578e 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-June/000808.html
-sha256  164872a5e792408aa72fecd52b7be6409724c4ad81700798675a7d801d976704  mesa-25.1.4.tar.xz
-sha512  b97a0fa185181e86ea39bf71a6031edf9e9477378aba2c1ff6dbe88399cc9f7dc728591b49918c0dccb170dce11335b2b8fa015c7b7495f2e166b295d47fd343  mesa-25.1.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-July/000809.html
+sha256  3c4f6b10ff6ee950d0ec6ea733cc6e6d34c569454e3d39a9b276de9115a3b363  mesa-25.1.5.tar.xz
+sha512  ac44aab7ba0aa22f054c6a50fbb92fea5e78ebaea3ed7b4a6f652e1c894375cc8bb383e94390b1b0b956a07b950b0edfa718fb4235b878292246532f59373552  mesa-25.1.5.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5622292b92..998fd25584 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.1.4
+MESA3D_VERSION = 25.1.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
