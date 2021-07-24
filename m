Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6754CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:36:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A26E61037
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A26E61037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0354483C8F;
	Tue,  3 Aug 2021 22:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oG2kClvrCMcX; Tue,  3 Aug 2021 22:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D77783C8C;
	Tue,  3 Aug 2021 22:36:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A46A01BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97D1360A5F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K0d0-HAiK0mj for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBC0960902
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 41F7783FBA; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 09:53:08 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b350246df61671fa8f6b177e5015d4d2ac13f5d1
X-Git-Newrev: 950a09fc56e76499258a843472d4fd5d1a08bf25
X-Patchwork-Hint: ignore
Message-Id: <20210803211015.41F7783FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bluez5_utils: fix mesh
 build with musl
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
