Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5B0CA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ACAD816FB;
	Thu, 28 Aug 2025 13:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFLASOvOOftA; Thu, 28 Aug 2025 13:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AB87817A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AB87817A7;
	Thu, 28 Aug 2025 13:05:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 648511B0
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 568FB6070F
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id piIeW0frt1JW for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:05:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 733A660AF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 733A660AF6
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 733A660AF6
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:05:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DFF2C1A0E42
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:05:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BAC7D60303
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:05:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 322831C22CBE7; 
 Thu, 28 Aug 2025 15:05:25 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Aug 2025 15:05:11 +0200
Message-ID: <20250828130513.146485-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828130513.146485-1-thomas.petazzoni@bootlin.com>
References: <20250828130513.146485-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756386325; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=xH4EFmfjlVmB69aTEwHu1dlXayCMAJBFVGNCEgF1ZpY=;
 b=1VZuQhX4szGRNMuUzXKKg9a0nKLxSHMqlRah8GsLsKI2AGRunKY5Xaa6Ou4q0apB8852o1
 dY90yKsWCKB9U64coN0OpurZg1wF0v6X/pxsOyMQI077XikpSfpSZ0SOPshnwwc0V1m2Nm
 EiDwH6M+b5GTkAjnB+QXBOSpITlTZBFtUcLOG2eIEMqGBIsw5Sb6bd5mqfxDE+P+NylAjY
 5poSCRDtL5Rod7nUNi0TVeFku+2w07YkFg8rSVGbk/Y8LyFvv4skbD5MFaQB4cU8OjfYAz
 UFkmsgtaC5qqikbmXbhWnBEYltuPVQm139+ixuzDEQLZFE+uGq04dIegUq8tgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=1VZuQhX4
Subject: [Buildroot] [PATCH v2 3/3] package/netsurf-buildsystem: remove
 package
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

This host package was only used as a build dependency of libsvgtiny,
which itself has been removed, so it can be dropped as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
v1 -> v2: No changes.

 DEVELOPERS                                    |  3 ---
 .../netsurf-buildsystem.hash                  |  3 ---
 .../netsurf-buildsystem.mk                    | 20 -------------------
 3 files changed, 26 deletions(-)
 delete mode 100644 package/netsurf-buildsystem/netsurf-buildsystem.hash
 delete mode 100644 package/netsurf-buildsystem/netsurf-buildsystem.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 762cd6d430..9fbdace7c1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1001,9 +1001,6 @@ F:	package/atest/
 F:	package/crucible/
 F:	package/kmscube/
 
-N:	Fabio Porcedda <fabio.porcedda@gmail.com>
-F:	package/netsurf-buildsystem/
-
 N:	Fabio Urquiza <fabiorush@gmail.com>
 F:	package/bitcoin/
 
diff --git a/package/netsurf-buildsystem/netsurf-buildsystem.hash b/package/netsurf-buildsystem/netsurf-buildsystem.hash
deleted file mode 100644
index 9da8c67aef..0000000000
--- a/package/netsurf-buildsystem/netsurf-buildsystem.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  b8620c6a95ccf071046cdb8e4e0ca149cdd58d292eb9ee02b3b0d63646466b72  netsurf-buildsystem-7574b41345968b5f7e9ca5875faccb1478ce0555-git4.tar.gz
-sha256  b2ddc1d607332423f6cf415b2ac619a1c03dd565facdc39a571282a520929a65  llvm/LICENSE.TXT
diff --git a/package/netsurf-buildsystem/netsurf-buildsystem.mk b/package/netsurf-buildsystem/netsurf-buildsystem.mk
deleted file mode 100644
index d4efec0e1d..0000000000
--- a/package/netsurf-buildsystem/netsurf-buildsystem.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# netsurf-buildsystem
-#
-################################################################################
-
-NETSURF_BUILDSYSTEM_VERSION = 7574b41345968b5f7e9ca5875faccb1478ce0555
-NETSURF_BUILDSYSTEM_SITE = http://git.netsurf-browser.org/buildsystem.git
-NETSURF_BUILDSYSTEM_SITE_METHOD = git
-NETSURF_BUILDSYSTEM_LICENSE = MIT, BSD-3-Clause (for llvm/* files)
-NETSURF_BUILDSYSTEM_LICENSE_FILES = llvm/LICENSE.TXT
-
-NETSURF_BUILDSYSTEM_INSTALL_DIR = $(HOST_DIR)/share/netsurf-buildsystem
-
-define HOST_NETSURF_BUILDSYSTEM_INSTALL_CMDS
-	mkdir -p $(NETSURF_BUILDSYSTEM_INSTALL_DIR)
-	cp -dpfr $(@D)/* $(NETSURF_BUILDSYSTEM_INSTALL_DIR)
-endef
-
-$(eval $(host-generic-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
