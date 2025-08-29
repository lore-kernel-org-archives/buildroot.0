Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F955CA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7A806167D;
	Fri, 29 Aug 2025 15:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDgg7jGm6Epi; Fri, 29 Aug 2025 15:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0461D61671
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0461D61671;
	Fri, 29 Aug 2025 15:33:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2C0F69
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7B68811A5
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0KeNwXVzSFpB for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:33:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B002844F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B002844F4
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:33:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEC0887DAF; Fri, 29 Aug 2025 15:33:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 17:27:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b10f50399afcdc1cfaed06387b3f51d2dfa27ad0
X-Git-Newrev: 6fdebc54b301ca4729789849c602aa4203bcfbe6
X-Patchwork-Hint: ignore
Message-Id: <20250829153356.EEC0887DAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsvgtiny: add patch to fix GCC
 15.x build issue
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6fdebc54b301ca4729789849c602aa4203bcfbe6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a small, easily backportable patch to fix GCC 15.x build
issue. The issue is also fixed upstream in later releases, but this
patch is a minimal fix that can be backported to LTS independently
from a version bump.

Fixes:

  https://autobuild.buildroot.org/results/c3d703663faabe40448d908afbdbb351a016aece/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ..._gradient-svgtiny_list-.c-add-missing-std.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch b/package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch
new file mode 100644
index 0000000000..17e63ba541
--- /dev/null
+++ b/package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch
@@ -0,0 +1,42 @@
+From 1d86ce7e6ea9fae8285eed23d838f87ab3ac083c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 19 Aug 2025 23:28:35 +0200
+Subject: [PATCH] src/{svgtiny_gradient,svgtiny_list}.c: add missing <stdlib.h>
+
+Needed to get the prototype for malloc()/free().
+
+Upstream: N/A, already fixed upstream in a later release (but as part
+of a larger commit)
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/svgtiny_gradient.c | 1 +
+ src/svgtiny_list.c     | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/svgtiny_gradient.c b/src/svgtiny_gradient.c
+index 3a8db73..5172223 100644
+--- a/src/svgtiny_gradient.c
++++ b/src/svgtiny_gradient.c
+@@ -8,6 +8,7 @@
+ #include <assert.h>
+ #include <math.h>
+ #include <string.h>
++#include <stdlib.h>
+ #include "svgtiny.h"
+ #include "svgtiny_internal.h"
+ 
+diff --git a/src/svgtiny_list.c b/src/svgtiny_list.c
+index 53cfb34..91e2c98 100644
+--- a/src/svgtiny_list.c
++++ b/src/svgtiny_list.c
+@@ -11,6 +11,7 @@
+  */
+ 
+ #include <assert.h>
++#include <stdlib.h>
+ #include "svgtiny.h"
+ #include "svgtiny_internal.h"
+ 
+-- 
+2.50.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
