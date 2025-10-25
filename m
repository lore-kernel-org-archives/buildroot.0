Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D3BCCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 22:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93F05813B0;
	Sat, 25 Oct 2025 22:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SMXVhGMGiIf; Sat, 25 Oct 2025 22:07:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68E698133A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68E698133A;
	Sat, 25 Oct 2025 22:07:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86263976
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 22:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7696640245
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 22:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d71XV3ggUkWj for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 22:07:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A5F840216
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A5F840216
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 22:07:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56FE4878D0; Sat, 25 Oct 2025 22:07:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Oct 2025 00:06:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 991cb9d36c84ea70d904e03ccd493ea697fda01b
X-Git-Newrev: 5c5a28e46116c4f0caedb35aa422b983aa86b0a5
X-Patchwork-Hint: ignore
Message-Id: <20251025220740.56FE4878D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libshout: fix build with gcc >=
 14.x
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5c5a28e46116c4f0caedb35aa422b983aa86b0a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/c53/c53b7b613269acddd3467865c11784f59062a943/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-icy-include-stdlib.h-and-stdio.h.patch    | 31 ++++++++++++++++++++++
 .../libshout/0002-legacy-include-stdlib.h.patch    | 30 +++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/package/libshout/0001-icy-include-stdlib.h-and-stdio.h.patch b/package/libshout/0001-icy-include-stdlib.h-and-stdio.h.patch
new file mode 100644
index 0000000000..cf3f02bae9
--- /dev/null
+++ b/package/libshout/0001-icy-include-stdlib.h-and-stdio.h.patch
@@ -0,0 +1,31 @@
+From 3ea67b511bdf4f12b3d5de4d7e133badf8c18d54 Mon Sep 17 00:00:00 2001
+From: Alexandre Janniaux <ajanni@videolabs.io>
+Date: Wed, 14 Sep 2022 16:29:22 +0200
+Subject: [PATCH] icy: include stdlib.h and stdio.h
+
+malloc, free, and snprintf had no valid previous declaration, making the
+build fail with clang.
+
+Upstream: https://gitlab.xiph.org/xiph/icecast-libshout/-/merge_requests/4
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/icy.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/icy.c b/src/icy.c
+index 8e83552..4de3c14 100644
+--- a/src/icy.c
++++ b/src/icy.c
+@@ -24,6 +24,8 @@
+ #endif
+ 
+ #include <stdbool.h>
++#include <stdlib.h> /* for free() and malloc() */
++#include <stdio.h> /* for snprintf() */
+ #include <string.h>
+ 
+ #include <shout/shout.h>
+-- 
+2.47.3
+
diff --git a/package/libshout/0002-legacy-include-stdlib.h.patch b/package/libshout/0002-legacy-include-stdlib.h.patch
new file mode 100644
index 0000000000..863d8095c8
--- /dev/null
+++ b/package/libshout/0002-legacy-include-stdlib.h.patch
@@ -0,0 +1,30 @@
+From 1742df325b52eef5af32c40893d821f895dc9d88 Mon Sep 17 00:00:00 2001
+From: Alexandre Janniaux <ajanni@videolabs.io>
+Date: Wed, 14 Sep 2022 16:30:03 +0200
+Subject: [PATCH] legacy: include stdlib.h
+
+free() had no previous declaration, making the build fail with clang.
+
+Upstream: https://gitlab.xiph.org/xiph/icecast-libshout/-/merge_requests/4
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/legacy.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/legacy.c b/src/legacy.c
+index 3e1d3d7..e0ed961 100644
+--- a/src/legacy.c
++++ b/src/legacy.c
+@@ -28,6 +28,8 @@
+ #include "shout_private.h"
+ #include "util.h"
+ 
++#include <stdlib.h> /* for free() */
++
+ int shout_set_format(shout_t *self, unsigned int format)
+ {
+     if (!self)
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
