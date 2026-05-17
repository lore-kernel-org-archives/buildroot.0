Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD7FCD4F3D
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 21:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0D386F861;
	Sun, 17 May 2026 21:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGVLAjKwcKtf; Sun, 17 May 2026 21:42:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D472C6F86A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779054130;
	bh=XKoZlrTXyhDTDx/9h9JtP8qznDp/YQgu9yaoPe3yUog=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V71jvKhvNfQFfbGNakK7GcVh3lsRFiCNbfBRJOZCK9RP4SG3E2qYhZheXdn/kq4hI
	 dLFDUN3RTnUqJ9Y8DSM7qMquZFJ+X9ur4djBTxfKCb4sCUigsOL2EGUOAj0QzJVHHy
	 lXxsMTw0BGmRGtqTBvbhf9rtOarWCQcNFkTGRcVX61RuVZE55av8dy8WvEyUD1DO7d
	 xWq5IWNfj6cn0DXQCOawqI4V+hlbqgopIZjoeYc5vW0JKA3janpxmAE6MFgPYRKiWC
	 HEPqJWDgkhNoLtE6dlkbrl2phgoARF1xvyZJX0NDm70xCqPSepOQq0byIQfFvIA8kI
	 Gn4SjcK5L9lLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D472C6F86A;
	Sun, 17 May 2026 21:42:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9695265
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB06A6F86A
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sB9uEE7gnB_5 for <buildroot@buildroot.org>;
 Sun, 17 May 2026 21:42:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15DF66F861
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15DF66F861
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:42:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3897286568; Sun, 17 May 2026 21:42:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 May 2026 23:38:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fb64dfc2411bace5a0e1e55ac17963ba4bca6d1
X-Git-Newrev: 56ff67b50b27e54296af0c2ebc572f55b8e9703c
X-Patchwork-Hint: ignore
Message-Id: <20260517214201.3897286568@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/supertux: fix build with gcc > 11
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/56ff67b50b27e54296af0c2ebc572f55b8e9703c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
 "missing #include <memory>" when building with GCC > 11.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/supertux/0001-fix-gcc11-build.patch | 33 +++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
