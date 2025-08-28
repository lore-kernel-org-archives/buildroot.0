Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE30CA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 11:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39BFB60DE8;
	Thu, 28 Aug 2025 11:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qY4donzVch0a; Thu, 28 Aug 2025 11:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 610DA60DA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 610DA60DA8;
	Thu, 28 Aug 2025 11:22:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50E4AB8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41637827D2
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FyoxpiJORun5 for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 11:22:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BA0F827B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BA0F827B5
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BA0F827B5
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:22:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AC92FC8EC69
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:21:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1A75A60303
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:22:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 821DE1C22D52D; 
 Thu, 28 Aug 2025 13:22:12 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Aug 2025 13:22:02 +0200
Message-ID: <20250828112203.136135-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828112203.136135-1-thomas.petazzoni@bootlin.com>
References: <20250828112203.136135-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756380132; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=WQdhhIgUkzapH1RkwnjatJwlM6ftZulJJXNxdf3zcOM=;
 b=dgAcSOykY8+0zciIjS6z9Z1FZBkDOIwGie7bQ4QHnxkHQP3nNkr95vK9hiabJcI1JMbiQs
 5MSqiulT157Jci/j7+3jlpTHU9Q+feoRCe2ZsQ8rJ0YLCFFDGoU7jkVVLUcQ6XzDIQLL9x
 CCMqiLHD4TdTf8Hn0r4HyTZmDd8HnsmFMSted1PqbhPypmmPK7Rvs17SPVJ01LTlpA/6GA
 lZy7dA9/Wv/7JoSS2eFdCssA/wNgfh7Hg0k7YcbKC7CswAkMG/KriR1mzHxcSF+2G1MuYs
 nb00MqWtEcu0JxHdlG7WZO76CGZAPYgja366ka32Vul+4RLlqalSl1g37XLfTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=dgAcSOyk
Subject: [Buildroot] [PATCH 3/3] package/netsurf-buildsystem: remove package
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
