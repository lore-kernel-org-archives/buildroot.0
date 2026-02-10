Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B32EB2704
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 19:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6EAF60B25;
	Tue, 10 Feb 2026 19:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-Hp8eXIOSgd; Tue, 10 Feb 2026 19:21:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7F4E60B0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770751290;
	bh=ewMWPg+oOKHPQAAalw0x0wR1KNsc6XkO1iWVY87hqFU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dzan2VwcQ0uJPkP36+1p20rlF+mFFSadmODb8+bu80u7sCq/1l2RwhbTz+Rkw62Ln
	 dZixtb5RYiRKBCPkS1wdXeJotJLGmTKI6VcugwKj4ndxjr/qcePeKZ5jnJN0MDYEba
	 MJ9zq67TPmGFCWkcXFVYmev8ctEJn8OirR0Xol4fmseCd9deovxDC47VejzG8yL1Ys
	 3EslOxOKNvTv7vfscSP0WriLshUGRdMz7AjOzoZnzPFckK1x04wFW4T8koalcZ28RB
	 GjIics6iJcjhZY31ADANpLojP4jFcij2I4E9wJh+f4tI/pjGYakMp/ZgtBAsso5Au6
	 JviSlbRdkBCww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7F4E60B0A;
	Tue, 10 Feb 2026 19:21:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FB0A23D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 19:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E899660B0A
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 19:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wp7KV7mNf5nr for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 19:21:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 071C460AB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 071C460AB2
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 071C460AB2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 19:21:26 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7C2532C801B0;
 Tue, 10 Feb 2026 20:21:24 +0100 (CET)
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>
Date: Tue, 10 Feb 2026 20:21:28 +0100
Message-ID: <20260210192130.2755696-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770751284; bh=VZBqs1Sxjgf4OCvXvlz6NHa94DkBHBekcPrkqZDsmFo=;
 h=From:To:Cc:Subject:Date;
 b=Edpq0XZfYTIYizJxRzZEiBMyON15y0SrO/HJsWp4L3XJ6IgZRnfZ7Imq1x18reJzH
 qwNYNSXuN10y4KE6ZN/KHVtCvfQMdX8cpp+0c2hoeEMywFcqjTdZMS8Osl/EParztZ
 zZ88few6FCFBdtGhyrcZ7V4KPsE0mMm09NpLMlcVzHq5s4KNXu6twQnQ7cO7hcTIYs
 HdjWVZagyp2zIpIkb+OVntDEXBjH6bWYh5P2ERvVaN/ZCxGjJG5btXfNBCpr69Ye85
 ogNRykF4OJswjr2n0kc5PBrqg9gUigOfj0q/h8FM6nBPM1n78HwNPYVff17lxp7Rcp
 Bb90tXjyJG1iw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=Edpq0XZf
Subject: [Buildroot] [PATCH 1/2] package/nethogs: add patch to fix missing
 time.h includes
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 - https://autobuild.buildroot.net/results/489/489e92cf7d1d1f7c29b452f09e06872cc61b9116/
 - https://autobuild.buildroot.net/results/2b6/2b6e3d723b4101cef61e36e13039288923ebffe2/
 - https://autobuild.buildroot.net/results/1da/1dae32417c889639da6d2c5aa80b565e7bfcddd0/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...ode2prog-add-missing-time.h-includes.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/nethogs/0001-main-inode2prog-add-missing-time.h-includes.patch

diff --git a/package/nethogs/0001-main-inode2prog-add-missing-time.h-includes.patch b/package/nethogs/0001-main-inode2prog-add-missing-time.h-includes.patch
new file mode 100644
index 0000000000..a6294e0c4f
--- /dev/null
+++ b/package/nethogs/0001-main-inode2prog-add-missing-time.h-includes.patch
@@ -0,0 +1,46 @@
+From f451eefaf4ebf5042f15cddad440722d5078b571 Mon Sep 17 00:00:00 2001
+From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
+Date: Mon, 9 Feb 2026 17:22:28 +0100
+Subject: [PATCH] main,inode2prog: add missing time.h includes
+
+clock_gettime() and time() are both declared in time.h, so add
+that to the includes in main.cpp and inode2prog.h
+
+time.h gets included implicitly included via many other stdlib headers,
+but this isn't guaranteed and indeed this fails to compile in buildroot
+for some configurations.
+
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+Upstream: https://github.com/raboof/nethogs/pull/305
+---
+ src/inode2prog.cpp | 1 +
+ src/main.cpp       | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/inode2prog.cpp b/src/inode2prog.cpp
+index 8ec1f65..e554256 100644
+--- a/src/inode2prog.cpp
++++ b/src/inode2prog.cpp
+@@ -36,6 +36,7 @@
+ #include <string>
+ #include <sys/stat.h>
+ #include <sys/types.h>
++#include <time.h>
+ #include <unistd.h>
+ 
+ #include "inode2prog.h"
+diff --git a/src/main.cpp b/src/main.cpp
+index 7501461..0ccc7dd 100644
+--- a/src/main.cpp
++++ b/src/main.cpp
+@@ -3,6 +3,7 @@
+ #include <set>
+ #include <vector>
+ #include <list>
++#include <time.h>
+ 
+ #ifdef __linux__
+ #include <linux/capability.h>
+-- 
+2.53.0
+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
