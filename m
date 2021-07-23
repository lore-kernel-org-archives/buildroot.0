Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B313C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 13:27:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D40EB60EB4
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 13:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D40EB60EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E2276062F;
	Fri, 23 Jul 2021 13:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id is8RE91_risq; Fri, 23 Jul 2021 13:27:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2F50605E7;
	Fri, 23 Jul 2021 13:27:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDE871BF20B
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 13:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9258605E7
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 13:27:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VxnG3hkZAJr4 for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 13:27:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94AAE605D0
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 13:27:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 66B0018287E; Fri, 23 Jul 2021 15:27:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1627046839; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=uhtOhplt1kVSaaWpfVRtJfwqlAAUHZJlFdNkFTwpAV8=;
 b=PEVIgsVsncXJntIw2Ja+oSpSOJGo0q024nvsFD20kO39pAaA2dE5q89rvRht6c81FEdp2D
 j70NP0iEMS5sXmWThBBpHpm9JCU9obaNJhkaTW6IHk675GKFl15eVQhuz1Kuo8/V2hmlnh
 EPVBQLS5ffokikCXdbVOZIujxIsTEsQ=
To: buildroot@buildroot.org
Date: Fri, 23 Jul 2021 15:26:46 +0200
Message-Id: <20210723132648.30775-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH v2] package/bluez5_utils: fix mesh build with
 musl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff <buildroot@heine.tech>, Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

when compiling with mesh support and musl toolchain the build fails
due to a missing include of limits.h for PATH_MAX in mesh-cfgtest.c.

Patch submitted upstream:
https://lore.kernel.org/linux-bluetooth/20210723081039.30396-1-bluez@heine.tech

Fixes:
http://autobuild.buildroot.net/results/20cc47f54de0b0d4bdf108c3715c590ae8ab476f/
http://autobuild.buildroot.net/results/003968b25906579dbcf5a95d1e43fec0ab504ef5/

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 ...-tools-mesh-cfgtest-include-limits.h.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch

diff --git a/package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch b/package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch
new file mode 100644
index 0000000000..8f40a94873
--- /dev/null
+++ b/package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch
@@ -0,0 +1,32 @@
+From 5158827fded7cb4daf550a5956aff0c74f6c38fc Mon Sep 17 00:00:00 2001
+From: Michael Nosthoff <bluez@heine.tech>
+Date: Thu, 22 Jul 2021 21:36:13 +0200
+Subject: [PATCH BlueZ] tools/mesh-cfgtest: include limits.h
+
+mesh-cfgtest.c uses PATH_MAX so it should include limits.h.
+
+fixes compilation error when enabling mesh support with musl-based
+toolchains observed in buildroot autobuilders.
+
+http://autobuild.buildroot.net/results/20cc47f54de0b0d4bdf108c3715c590ae8ab476f/
+http://autobuild.buildroot.net/results/003968b25906579dbcf5a95d1e43fec0ab504ef5/
+
+---
+ tools/mesh-cfgtest.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/mesh-cfgtest.c b/tools/mesh-cfgtest.c
+index fa0474faa..116ab7f16 100644
+--- a/tools/mesh-cfgtest.c
++++ b/tools/mesh-cfgtest.c
+@@ -21,6 +21,7 @@
+ #include <ftw.h>
+ #include <getopt.h>
+ #include <libgen.h>
++#include <limits.h>
+ #include <signal.h>
+ #include <stdio.h>
+ #include <time.h>
+-- 
+2.32.0
+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
