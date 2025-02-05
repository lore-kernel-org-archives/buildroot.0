Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C1BC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A86516070E;
	Wed,  5 Feb 2025 15:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwzYG3rIb7fg; Wed,  5 Feb 2025 15:03:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CF8660FF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CF8660FF9;
	Wed,  5 Feb 2025 15:03:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6721912A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4937C40207
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:03:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtKSP2BUsAW9 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:03:40 +0000 (UTC)
X-Greylist: delayed 965 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 05 Feb 2025 15:03:38 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B827D40183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B827D40183
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=2a02:2350:5:525::1; helo=mailrelay6-3.pub.mailoutpod3-cph3.one.com;
 envelope-from=ayoub.zaki@embetrix.com; receiver=<UNKNOWN> 
Received: from mailrelay6-3.pub.mailoutpod3-cph3.one.com
 (mailrelay6-3.pub.mailoutpod3-cph3.one.com [IPv6:2a02:2350:5:525::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B827D40183
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:03:38 +0000 (UTC)
X-HalOne-ID: 1ee4b0c9-e3d0-11ef-8f00-417246ffdc90
Received: from xps-13.fritz.box
 (dynamic-2a02-3102-8c10-00a0-4a56-405c-be0f-2c89.310.pool.telefonica.de
 [2a02:3102:8c10:a0:4a56:405c:be0f:2c89])
 by mailrelay6.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id 1ee4b0c9-e3d0-11ef-8f00-417246ffdc90;
 Wed, 05 Feb 2025 14:47:30 +0000 (UTC)
From: Ayoub Zaki <ayoub.zaki@embetrix.com>
To: buildroot@buildroot.org
Cc: Ayoub Zaki <ayoub.zaki@embetrix.com>
Date: Wed,  5 Feb 2025 15:47:28 +0100
Message-ID: <20250205144728.371416-1-ayoub.zaki@embetrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1738766850; x=1739371650; 
 d=embetrix.com; s=rsa1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from;
 bh=QI+zUUWLkmOlJEF8mDPoydZuz5/Bh/ksc2E1qVBA9nE=;
 b=Nd1USsJWx4IADBCBOTWPZMJtD8ec8uAox9DZicYJ2h1i1v+8C/BVbNU8ayatxKeO1aV+wdSaEs0Sy
 bvT7Owadx4ZRP8mUCT25Rl8IRFlEARdldyyS7TO0bIBh/FjmSHCUSaKQ6LvZppSJKhP2Jixxp7tlnI
 RsxwJnZqe/yEYVUV4zGDLtpC4ZtRIsnVZP7HkbaO9af2U6gK9X5dgjQ0Hh1yQp82Fb969shZJGxlFi
 NmKsBbTkwSs2BAzV4P0icUz9o6iarFAF+9SkioGbof8CCfAMY+3fnK3bNBfVmG+uYKi84mz/3LK0kk
 fgSTowGtUu5PoRqvDUtCL6MLhJuAnJA==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1738766850; x=1739371650; 
 d=embetrix.com; s=ed1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from;
 bh=QI+zUUWLkmOlJEF8mDPoydZuz5/Bh/ksc2E1qVBA9nE=;
 b=j7TSsuIg324ghikeqYzOPNp582RcW+piWpmoYBzOVtpgHHL9C/zOVbWVuU6t0OtxBXWVElola4UfG
 WoablEBAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=embetrix.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=embetrix.com
 header.i=@embetrix.com header.a=rsa-sha256 header.s=rsa1 header.b=Nd1USsJW; 
 dkim=pass header.d=embetrix.com header.i=@embetrix.com header.a=ed25519-sha256
 header.s=ed1 header.b=j7TSsuIg
Subject: [Buildroot] [PATCH 1/1] package/bmap-writer: bump to version 1.0.2
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

Switch from libxml2 to tinyxml2

Add http(s)/ftp stream wrapper script

Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
---
 package/bmap-writer/Config.in        | 2 +-
 package/bmap-writer/bmap-writer.hash | 2 +-
 package/bmap-writer/bmap-writer.mk   | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/bmap-writer/Config.in b/package/bmap-writer/Config.in
index b2e63c8381..5876a85927 100644
--- a/package/bmap-writer/Config.in
+++ b/package/bmap-writer/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_BMAP_WRITER
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libarchive
 	select BR2_PACKAGE_LIBARCHIVE
-	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_TINYXML2
 	help
 	  bmap-writer is a command-line utility designed to
 	  efficiently write disk images to storage devices using block
diff --git a/package/bmap-writer/bmap-writer.hash b/package/bmap-writer/bmap-writer.hash
index c59c7a91cb..0b0e8de46a 100644
--- a/package/bmap-writer/bmap-writer.hash
+++ b/package/bmap-writer/bmap-writer.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  94fda8420fa82256bfd01a76dff18ae23c6be9be03cb641f9845164e9326de60  bmap-writer-0.0.3.tar.gz
+sha256  a86ade2c70304574f200c048bd8a728ed27b04b7ece62cf0f696366e37fed6e7  bmap-writer-1.0.2.tar.gz
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  LICENSE
diff --git a/package/bmap-writer/bmap-writer.mk b/package/bmap-writer/bmap-writer.mk
index dc049c2b9b..19ccd3afbc 100644
--- a/package/bmap-writer/bmap-writer.mk
+++ b/package/bmap-writer/bmap-writer.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-BMAP_WRITER_VERSION = 0.0.3
+BMAP_WRITER_VERSION = 1.0.2
 BMAP_WRITER_SITE = $(call github,embetrix,bmap-writer,$(BMAP_WRITER_VERSION))
 BMAP_WRITER_LICENSE = GPL-3.0
 BMAP_WRITER_LICENSE_FILES = LICENSE
-BMAP_WRITER_DEPENDENCIES = host-pkgconf libarchive libxml2
-HOST_BMAP_WRITER_DEPENDENCIES = host-pkgconf host-libarchive host-libxml2
+BMAP_WRITER_DEPENDENCIES = host-pkgconf libarchive tinyxml2
+HOST_BMAP_WRITER_DEPENDENCIES = host-pkgconf host-libarchive host-tinyxml2
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
