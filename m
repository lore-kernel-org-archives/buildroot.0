Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47156C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:53:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E83BD60E96
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E83BD60E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCB82405D5;
	Sat, 24 Jul 2021 07:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yIkUKL9NDhL7; Sat, 24 Jul 2021 07:53:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABC5041581;
	Sat, 24 Jul 2021 07:53:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB1541BF4D6
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7CF040617
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hyfNpWi9Tvqs for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 07:53:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0148840171
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 07:53:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C6F6B85E33; Sat, 24 Jul 2021 07:18:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 09:53:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b350246df61671fa8f6b177e5015d4d2ac13f5d1
X-Git-Newrev: 950a09fc56e76499258a843472d4fd5d1a08bf25
X-Patchwork-Hint: ignore
Message-Id: <20210724071858.C6F6B85E33@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: fix mesh build with
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=950a09fc56e76499258a843472d4fd5d1a08bf25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

when compiling with mesh support and musl toolchain the build fails
due to a missing include of limits.h for PATH_MAX in mesh-cfgtest.c.

Patch submitted upstream:
https://lore.kernel.org/linux-bluetooth/20210723081039.30396-1-bluez@heine.tech

Fixes:
http://autobuild.buildroot.net/results/20cc47f54de0b0d4bdf108c3715c590ae8ab476f/
http://autobuild.buildroot.net/results/003968b25906579dbcf5a95d1e43fec0ab504ef5/

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-tools-mesh-cfgtest-include-limits.h.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch b/package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch
new file mode 100644
index 0000000000..26c7f85e0c
--- /dev/null
+++ b/package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch
@@ -0,0 +1,33 @@
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
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
