Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ED1C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 21:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFCA9402A8;
	Mon, 13 Dec 2021 21:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oney0q4YrGDT; Mon, 13 Dec 2021 21:15:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06667402B5;
	Mon, 13 Dec 2021 21:15:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A13451BF2B0
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D14B402B5
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D4tAccTqEony for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 21:15:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFE3D402C3
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 21:15:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 140FF83799; Mon, 13 Dec 2021 21:09:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 22:09:26 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: e23a8a497b1e71dd8b71ae7b549aecdf497a0935
X-Git-Newrev: 573978d29ddb73533e20e1de4af92d76896e38fe
X-Patchwork-Hint: ignore
Message-Id: <20211213210952.140FF83799@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/bluez5_utils: fix
 mesh build with musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=573978d29ddb73533e20e1de4af92d76896e38fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

when compiling with mesh support and musl toolchain the build fails
due to a missing include of limits.h for PATH_MAX in mesh-cfgtest.c.

Patch submitted upstream:
https://lore.kernel.org/linux-bluetooth/20210723081039.30396-1-bluez@heine.tech

Fixes:
http://autobuild.buildroot.net/results/20cc47f54de0b0d4bdf108c3715c590ae8ab476f/
http://autobuild.buildroot.net/results/003968b25906579dbcf5a95d1e43fec0ab504ef5/

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 950a09fc56e76499258a843472d4fd5d1a08bf25)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
