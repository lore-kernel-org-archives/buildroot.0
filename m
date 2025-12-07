Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A41FD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C0E960AF9;
	Sun,  7 Dec 2025 14:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_7iFPcrV0fX; Sun,  7 Dec 2025 14:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D833560604
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118701;
	bh=kLCFDks4EgKyCcj66gmCYHLnkL8akCSTqFb6c+drcio=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IQr8Zj5r6ZC14qfQ76KQX+StSu5OsAzcEUifyZP3tXk1fnnKzlFd4wFRDIdnH201f
	 So9TadE90ekVLL2eGa4Pn1T8wfA8cUKj8d1Onxn8Br8KpgtTCF9adWfDUn3RE7qX1v
	 UqQDXyQVIef/C3ViEMrwGjVSCJZaXdkMAyZ5Ku1OYQvfrLVBkxHxHb+yFj+Eg8X56e
	 fGqTAbjF11/SYYLDTKqwsMrobU83ssnH5D3QlVeOY+fjqGoyGDZF92WlC4KKB8D3Gl
	 gotpqGsplv2svpI7Wkb50FDySo4V3zalE4MgrHP6H19LR1xtOndJgd/lz40zo+Cr6E
	 sc9Wt+NJSRtrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D833560604;
	Sun,  7 Dec 2025 14:45:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85656151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BE7F40208
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id co8sU7mHTbDP for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:44:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5CE9C40166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CE9C40166
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CE9C40166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:44:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 44CE3A4C09A8;
 Sun,  7 Dec 2025 15:42:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyG-00000000416-1qbm;
 Sun, 07 Dec 2025 14:42:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:20 +0100
Message-ID: <20251207144243.3696572-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118575;
 bh=cmNpfGR7Fk6eMiKjNAIcdL9eo0OFy9TqkNNIGSRCIGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IlJOGcOLWbqKqdk1fe0kxwEIGBDdBDUnE1pGhVZuV6abbMc629xMm0lHNyPz5hICv
 ICjfQ53YW0ASYwRbAnAzCmgCp/9a7TetCHkyzpPjC5Uxklm7Bk2FxDzVlobyls5D9c
 0RNnskJJYWiEbceEouYkGIisPbUqd2208dQqYLnvcSa2pbkoUxY1v2WBrGISqrI5Gv
 aYXTStoqdlqhqRnt7jzUFZYdnP/Wrfk/YOrt5z2EEJiEsBuEBi3oiKamIumYP0xqA7
 UT6Vc88evMgkegiSab9xygllYE3hImxG9fbAZ+Jcoc1TR2HyDdiSMvvwDzx7t79xGA
 dweh1yYrJd4oA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=IlJOGcOL
Subject: [Buildroot] [PATCH/next 11/33] package/openfpgaloader: bump version
 to 1.0.0
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/trabucayre/openFPGALoader/releases/tag/v0.12.0
https://github.com/trabucayre/openFPGALoader/releases/tag/v0.12.1
https://github.com/trabucayre/openFPGALoader/releases/tag/v0.13.0
https://github.com/trabucayre/openFPGALoader/releases/tag/v0.13.1
https://github.com/trabucayre/openFPGALoader/releases/tag/v1.0.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openfpgaloader/openfpgaloader.hash | 2 +-
 package/openfpgaloader/openfpgaloader.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openfpgaloader/openfpgaloader.hash b/package/openfpgaloader/openfpgaloader.hash
index 6fa81a98a2..33f798b7d4 100644
--- a/package/openfpgaloader/openfpgaloader.hash
+++ b/package/openfpgaloader/openfpgaloader.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a463690358d2510919472c2f460039a304d016a08a45970821e667eea1c48cc8  openfpgaloader-0.11.0.tar.gz
+sha256  cf19b596e5dea21891b1be3cb9a04be7a1501926ee0919dcc5c9f1b6d3bd0a96  openfpgaloader-1.0.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/openfpgaloader/openfpgaloader.mk b/package/openfpgaloader/openfpgaloader.mk
index 0fd172b532..06c8b2face 100644
--- a/package/openfpgaloader/openfpgaloader.mk
+++ b/package/openfpgaloader/openfpgaloader.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENFPGALOADER_VERSION = 0.11.0
+OPENFPGALOADER_VERSION = 1.0.0
 OPENFPGALOADER_SITE = $(call github,trabucayre,openFPGALoader,v$(OPENFPGALOADER_VERSION))
 OPENFPGALOADER_LICENSE = Apache-2.0
 OPENFPGALOADER_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
