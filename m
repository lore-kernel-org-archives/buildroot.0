Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FA1CD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C5E861320;
	Fri, 29 May 2026 08:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8ajGPUiOHkE; Fri, 29 May 2026 08:28:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E18E61460
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043302;
	bh=d9EAsTqOEpb1BHZSHY3bYwcNv/+G5oPC6pop6MXjT1o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qsucG+U+QA9xSAYM55+/i9W8tbfLBYXp6ErUTUpHqcvRhrWvhM1ZhNqrEi9jniYW1
	 YxMwdM1WkTuGDZUNguV0rGt7XFsDRowtVwObNnNuZtYLiWdEJhE2fTgt8NVYli+FTt
	 nvcnbbtc4FFJG6pfh7Z6DDYFpqrA2TtghSGSWLauz7KZSLaml6qpUcHkXVwPAN6D3a
	 Y6dCaOx+Kq+sFnvy2N2YDNaXPFoxN7EVGzzm69tlqZ/PbrR2tO4qL4dQAWAgVYiIms
	 3deuRKUReLcFgBWAji1RbN/KndOzU0ElVHGA+L+kQQgDxTd0G26ZSBvKjruLmDTtL7
	 RoetSSLTYkpHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E18E61460;
	Fri, 29 May 2026 08:28:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1251128E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD20F6134D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0U8ngQuSEUY for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0604061404
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0604061404
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97B8987391; Fri, 29 May 2026 08:27:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:23 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 79acbb383d3a1387a3db5fddfb74765dd1679641
X-Git-Newrev: 3afe2535b959bfa8e14ea8a5df54c953bab580d9
X-Patchwork-Hint: ignore
Message-Id: <20260529082748.97B8987391@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/supertux: fix
 build with gcc > 11
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3afe2535b959bfa8e14ea8a5df54c953bab580d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes:
 "missing #include <memory>" when building with GCC > 11.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 56ff67b50b27e54296af0c2ebc572f55b8e9703c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
