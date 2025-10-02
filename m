Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE56CAC5B8
	for <buildroot@archiver.kernel.org>; Thu,  2 Oct 2025 20:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2B5080BD5;
	Thu,  2 Oct 2025 20:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sssini7ZtaBl; Thu,  2 Oct 2025 20:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D975B80BDA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D975B80BDA;
	Thu,  2 Oct 2025 20:33:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3A3872
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 20:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A3E3400FB
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 20:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbweWFMx9hgv for <buildroot@buildroot.org>;
 Thu,  2 Oct 2025 20:33:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C127400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C127400D1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C127400D1
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 20:33:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc8f.dip0.t-ipconnect.de [79.214.204.143])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3E7CAA4C5B62;
 Thu,  2 Oct 2025 22:33:18 +0200 (CEST)
Received: from [192.168.1.144] (port=53242 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4PzJ-000000008R2-3fGh;
 Thu, 02 Oct 2025 20:33:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  2 Oct 2025 22:33:17 +0200
Message-ID: <20251002203317.3346782-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759437198;
 bh=ywQgm9OPeGQshMD/yovUjgq7uTbOBAme8Rp4p1je1X4=;
 h=From:To:Cc:Subject:Date:From;
 b=Svjq+tErs7SUCGOmKfFm1ay1AMtRq6zYyi284yyTCIj0YzW+CfifUPeX8NS8RK06V
 LBoHyUYXy397aAdZGf0kTUn/NmcmDn1XqtuLByVkCrH1OzX57ju/iI7s5kyLOiGbRS
 D36+r49rp+M7JVXC+/B5jBrJdDErP5VkXa8bhMdE7+gzDXC4G5S/A8r2OFOGhejezQ
 4JECYQdyBYHKWkTDCyVf8XDj9l/n/fPtQYwBWkUb99iNJtQI9MgTD6rqLsF51AgTq2
 PVA1bu+/of2pwN//rnRWj3BRgVJhagcdk99EdawdPkkTWD5thYjYwBuHC81D3k4JX2
 oljgiuPnzzVDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=Svjq+tEr
Subject: [Buildroot] [PATCH 1/1] package/motion: bump version to 4.7.1
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
https://github.com/Motion-Project/motion/releases/tag/release-4.7.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/motion/motion.hash | 2 +-
 package/motion/motion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/motion/motion.hash b/package/motion/motion.hash
index 1d1a005e7a..4b5cec0a6f 100644
--- a/package/motion/motion.hash
+++ b/package/motion/motion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  657b7d8ee59f42cf06e00da04f0627f3ff42ff5344c9a1da33d16207c4451a03  motion-4.7.0.tar.gz
+sha256  c11f68c7cea949227e57797b932f01432d8942ef5323c75063d19b951d0d4194  motion-4.7.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index fc70349221..a405403b2b 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOTION_VERSION = 4.7.0
+MOTION_VERSION = 4.7.1
 MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
