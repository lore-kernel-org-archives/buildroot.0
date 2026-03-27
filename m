Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C0110ED674
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 13:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20B6A60EDD;
	Fri, 27 Mar 2026 13:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJxO7RRRdvFc; Fri, 27 Mar 2026 13:03:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ED5F60FBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774616633;
	bh=aMbl7nMwx4meQzUIQ//m63/W+po0w9+YSYani0lDhHU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=ObuspiEw//zzr/DHByyXvT8pkxZJlY1YENOIeBc1q86pzpULqIVxXntfcWNZgordx
	 RLAsGlSqO3tQigmE9ZH3SaURUovdUfdPTR9pCMNTn+HQ471xsZuVZn4C1J8yTk4+hY
	 wmEQd+byxBwW5VOvQ8JmhIPpzZy0zK5kkli8qXa2AupQo6EvYA63zEeqVRf1XM+nTN
	 qxFDiOynEj3wPxx77kRes8acY/L9V8/4d1egXeNFFtUVhNEDQjAuJvEqXEi8perdOa
	 G0E616o/+Xm7a4C9qwp9j8REEnmylJdWcYqugrsGnKKWMg0k58rr+fv3MQ2SIuzMhV
	 0Vyv9lH52CXPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ED5F60FBB;
	Fri, 27 Mar 2026 13:03:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 49D0F1D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 13:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3014C41703
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 13:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dTKVJFuMRNg for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 13:03:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83E65416FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83E65416FA
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83E65416FA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 13:03:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DC6AF1814B9; Fri, 27 Mar 2026 14:03:45 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 14:03:12 +0100
Message-ID: <20260327130326.3513059-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1774616626; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Kgs/U42GMjUvD6tmXTxc9KWkIbhpbWEaRXvwMjzVEek=;
 b=DZjVpZ5ltohapMjDCXt+PiIB93oXyQiUC91Xwitm7gjrMUwFX7R5AHuu/mBpyDgJOJcQaY
 +THcopAVYZ3YlTURLer7Wfew1gLLMtujtTHpCTyxMkq1DKoCzxGVb2uvq8gUiraWjW0C+p
 QJePuULngXqbq6Q//H3xipyE7myWEPA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=DZjVpZ5l
Subject: [Buildroot] [PATCH] package/supertux: fix build with gcc > 11
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
 package/supertux/0001-fix-gcc11-build.patch | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/supertux/0001-fix-gcc11-build.patch

diff --git a/package/supertux/0001-fix-gcc11-build.patch b/package/supertux/0001-fix-gcc11-build.patch
new file mode 100644
index 0000000000..2b4580c45f
--- /dev/null
+++ b/package/supertux/0001-fix-gcc11-build.patch
@@ -0,0 +1,32 @@
+From 81809dd5e6f611b1d64d952f6d96310bcc9c5fca Mon Sep 17 00:00:00 2001
+From: Semphris <semphris@protonmail.com>
+Date: Fri, 17 Jun 2022 12:36:26 -0400
+Subject: [PATCH] Fix problem with GCC 11 and Partio's ZIP manager (missing
+ #include <memory>)
+
+Closes #2219 on GitHub. Same fix, but puts the include closer to the copyright header.
+
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
