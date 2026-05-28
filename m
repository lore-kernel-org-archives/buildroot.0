Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18757CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E54286131D;
	Fri, 29 May 2026 08:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zegx9G4Njz8j; Fri, 29 May 2026 08:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 185BD61307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043138;
	bh=B8DGeuwZm4IKWl00ZF66TBSKXzbo2U4rZjp/43NhBec=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OXb7zBSfBZ6e1ljHgS0POOSb/9EfkReQ9QYzC8JX9yI0Mga96MtSyvVHgKKy7ar0R
	 DcdT1AOAsjV5VV4zqStAetPQwNWK3WtbT9vIMx6rPQ/O5VQNU9+p/tG/CAzlJDmKsq
	 0cANW70SvmL9oi8307BzdRAiE0gZd76FC/CyFa8DOp6R3i9fBUll6/iYt+xszlOCyz
	 ftmCuCFLUPPvsWCs92MCfmiUnPy/gIuEX+7Olqh6ilk8I53P1F/mL8Q+VWlF+LD9Qd
	 1GbuuWVzpnzNhQC+6XIfY6Tomx0VYnVqoNKCP+O0txnhSrAVxCQOjkrnd37nlwpnWh
	 tei48EY02PD5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 185BD61307;
	Fri, 29 May 2026 08:25:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1214828E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C510941F64
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qdq7lcPjUo_Z for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A0C241F6C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A0C241F6C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E02087334; Fri, 29 May 2026 08:25:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:27:49 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0e61ee1db0af3a1bb226b8363a922107c970b5de
X-Git-Newrev: fa40ef1d96e50685f08f3f2473130304bde2d240
X-Patchwork-Hint: ignore
Message-Id: <20260529082506.9E02087334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/supertux: fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fa40ef1d96e50685f08f3f2473130304bde2d240
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
