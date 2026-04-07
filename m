Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EAEFEEF2E
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 12:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A0716073D;
	Tue,  7 Apr 2026 12:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fWs85Z1JMcc; Tue,  7 Apr 2026 12:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AB2260832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775565327;
	bh=uzuHuIaEaRwrQE4TwI7ly3fIlFT+qtQ+n1KgFAbtqRY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=bAf/mx3pjiCp2JOV8VGPHqwKRSFkUnmhQHcosXuPAPnFddJG7pExhL1696FPPjvAs
	 vpCknG2w5hVUwxrS2B8hW+GRqMHVNtgPGf/QVaoaTNskF2aQsBSLR1trn0HRJ+3XGx
	 PzrFSAuKBMuLAXpBCr6x+Vrq5hI/Es0gxk1jg0zHHb3JFKFbq4lZO2ZnkZ2khQkRZM
	 LXzAItmj/Qqys+/M5BPCz14Ax8i5o9tcS2YNrpdHQ9R4H3BPBENewZG64/2/QmSSfC
	 kKgalGCN25PS0O3bFKAd/AHnh+dTI10Tbk2jue1Gsx1+DJXkBp08nhu+lbFdI6FsYN
	 U0A4GBiPWjbIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AB2260832;
	Tue,  7 Apr 2026 12:35:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 098FB1F6
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 12:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAF7D40086
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 12:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XS9LikEQ6WoM for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 12:35:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F60D40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F60D40025
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F60D40025
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 12:35:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 05D921814BF; Tue,  7 Apr 2026 14:35:20 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue,  7 Apr 2026 14:34:14 +0200
Message-ID: <20260407123424.3983175-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1775565321; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ihVEbBdM301a9QxanZu6yCVHWz/JvaMga3OwBL+qyVI=;
 b=HepHXQ2+Ww1YQLUKrmyzL9fh5oybcAIz71yqHRoBf3bSYuA3mJVqb2OA43+CWiLbowG10G
 T2PoSkoIMMdDcZSN6Ase/xfusARXqgZol7cdMK9fZM7/5q8CTEmuxwRbKPaD0c069yxR4n
 +UNQIXs8xqY3fzuYuc4lFsiY3juCmNs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=HepHXQ2+
Subject: [Buildroot] [PATCH v2] package/supertux: fix build with gcc > 11
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 "missing #include <memory>" when building with GCC > 11.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---
V2: add "Upstream" to patch

---
 package/supertux/0001-fix-gcc11-build.patch | 33 +++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/supertux/0001-fix-gcc11-build.patch

diff --git a/package/supertux/0001-fix-gcc11-build.patch b/package/supertux/0001-fix-gcc11-build.patch
new file mode 100644
index 0000000000..d5ada531c6
--- /dev/null
+++ b/package/supertux/0001-fix-gcc11-build.patch
@@ -0,0 +1,33 @@
+From 81809dd5e6f611b1d64d952f6d96310bcc9c5fca Mon Sep 17 00:00:00 2001
+From: Semphris <semphris@protonmail.com>
+Date: Fri, 17 Jun 2022 12:36:26 -0400
+Subject: [PATCH] Fix problem with GCC 11 and Partio's ZIP manager (missing
+ #include <memory>)
+
+Closes #2219 on GitHub. Same fix, but puts the include closer to the copyright header.
+
+Upstream: https://github.com/SuperTux/supertux/commit/81809dd5e6f611b1d64d952f6d96310bcc9c5fca
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+---
+ external/partio_zip/zip_manager.hpp | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/external/partio_zip/zip_manager.hpp b/external/partio_zip/zip_manager.hpp
+index 666884dda53..245303c76be 100644
+--- a/external/partio_zip/zip_manager.hpp
++++ b/external/partio_zip/zip_manager.hpp
+@@ -1,8 +1,12 @@
+ // SOURCE: https://github.com/wdas/partio/blob/main/src/lib/io/ZIP.h
++// NOTE: This file was edited for purposes of compatibility with SuperTux.
+ 
+-/*
++// This include has been added to fix a problem with GCC 11+ (and maybe 10)
++#include <memory>
++
++// =============================================================================
+ 
+-NOTE: This file was edited for purposes of compatibility with SuperTux.
++/*
+ 
+ PARTIO SOFTWARE
+ Copyright 2010 Disney Enterprises, Inc. All rights reserved
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
