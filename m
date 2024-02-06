Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5CDC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 23:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8DA7420E3;
	Tue,  6 Feb 2024 23:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dmD2EZ_5ViVG; Tue,  6 Feb 2024 23:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 502C6420B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 502C6420B0;
	Tue,  6 Feb 2024 23:01:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB7841BF2C4
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 23:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A856740CA1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 23:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvCHaL1K_Oev for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 23:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6A3F41478
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6A3F41478
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 23:01:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 937D3874AA; Tue,  6 Feb 2024 23:01:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 00:01:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 842f19849edeadd5846df3723e906b347383b164
X-Git-Newrev: b4f2cd9a2caeeacde0803b331b3f17c8be98584c
X-Patchwork-Hint: ignore
Message-Id: <20240206230133.937D3874AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-pam: fix musl build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b4f2cd9a2caeeacde0803b331b3f17c8be98584c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure raised since bump to version 1.6.0
in commit 7794fa4c4e1d19a245bb0367cde94560432a2bc5:

pam_namespace.c: In function 'process_line':
pam_namespace.c:649:41: error: 'SIZE_MAX' undeclared (first use in this function)
  649 |         if (count > UINT_MAX || count > SIZE_MAX / sizeof(uid_t)) {
      |                                         ^~~~~~~~
pam_namespace.c:41:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
   40 | #include "argv_parse.h"
  +++ |+#include <stdint.h>
   41 |

Fixes:
 - http://autobuild.buildroot.org/results/f07360f33010a2cf19aace266faae14a834bd9a4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-pam_namespace-include-stdint-h.patch      | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/linux-pam/0001-pam_namespace-include-stdint-h.patch b/package/linux-pam/0001-pam_namespace-include-stdint-h.patch
new file mode 100644
index 0000000000..5eda619505
--- /dev/null
+++ b/package/linux-pam/0001-pam_namespace-include-stdint-h.patch
@@ -0,0 +1,42 @@
+From cc9d40b7cdbd3e15ccaa324a0dda1680ef9dea13 Mon Sep 17 00:00:00 2001
+From: Jacob Heider <jacob@pkgx.dev>
+Date: Wed, 17 Jan 2024 11:49:26 -0500
+Subject: [PATCH] pam_namespace: include stdint.h
+
+pam_namespace.c makes use of SIZE_MAX but doesn't include stdint.h,
+resulting in the following build failures on 1.6.0:
+
+  pam_namespace.c: In function 'process_line':
+  pam_namespace.c:649:41: error: 'SIZE_MAX' undeclared (first use in this function)
+    649 |         if (count > UINT_MAX || count > SIZE_MAX / sizeof(uid_t)) {
+        |                                         ^~~~~~~~
+  pam_namespace.c:41:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
+     40 | #include "argv_parse.h"
+    +++ |+#include <stdint.h>
+     41 |
+  pam_namespace.c:649:41: note: each undeclared identifier is reported only once for each function it appears in
+    649 |         if (count > UINT_MAX || count > SIZE_MAX / sizeof(uid_t)) {
+        |                                         ^~~~~~~~
+
+Fixes: v1.6.0~100 ("pam_namespace: validate amount of uids in config")
+Resolves: https://github.com/linux-pam/linux-pam/issues/733
+
+Upstream: https://github.com/linux-pam/linux-pam/commit/cc9d40b7cdbd3e15ccaa324a0dda1680ef9dea13
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ modules/pam_namespace/pam_namespace.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespace/pam_namespace.c
+index f72d67189..b16731c22 100644
+--- a/modules/pam_namespace/pam_namespace.c
++++ b/modules/pam_namespace/pam_namespace.c
+@@ -34,6 +34,8 @@
+ 
+ #define _ATFILE_SOURCE
+ 
++#include "config.h"
++#include <stdint.h>
+ #include "pam_cc_compat.h"
+ #include "pam_inline.h"
+ #include "pam_namespace.h"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
