Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465E4C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 06:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DBD161431;
	Sat, 11 May 2024 06:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4xBnyrl9OFq; Sat, 11 May 2024 06:58:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01A8F61632
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01A8F61632;
	Sat, 11 May 2024 06:58:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12E921BF398
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0023C40132
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSeFPC5XYsCu for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 06:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 293A4400F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 293A4400F9
 for <buildroot@buildroot.org>; Sat, 11 May 2024 06:58:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17B2986E89; Sat, 11 May 2024 06:58:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 08:57:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fa9ad7e4f2212e3ff934695eb36e9dc2cb9c2b8
X-Git-Newrev: 01f2a530e2c73aba7c0aaaeded4fc160d560707f
X-Patchwork-Hint: ignore
Message-Id: <20240511065824.17B2986E89@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libselinux: fix uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=01f2a530e2c73aba7c0aaaeded4fc160d560707f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc build failure raised since bump to version 3.6
in commit 5f7275787ab1520c3d3f7eb9d2bd1b9f5ff41443 and
https://github.com/SELinuxProject/selinux/commit/cb8289c2b237e5f66e4a7608ecc6c68abeaeaf55:

selinux_internal.c: In function 'reallocarray':
selinux_internal.c:25:29: error: 'SIZE_MAX' undeclared (first use in this function)
   25 |         if (size && nmemb > SIZE_MAX / size) {
      |                             ^~~~~~~~
selinux_internal.c:6:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
    5 | #include <string.h>
  +++ |+#include <stdint.h>
    6 |
selinux_internal.c:25:29: note: each undeclared identifier is reported only once for each function it appears in
   25 |         if (size && nmemb > SIZE_MAX / size) {
      |                             ^~~~~~~~

Fixes: 5f7275787ab1520c3d3f7eb9d2bd1b9f5ff41443
 - http://autobuild.buildroot.org/results/7e627744beaa4f7fdfd488dfacbaafc074a999f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-src-se_linux_internal.c-include-stdint.h.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/libselinux/0002-libselinux-src-se_linux_internal.c-include-stdint.h.patch b/package/libselinux/0002-libselinux-src-se_linux_internal.c-include-stdint.h.patch
new file mode 100644
index 0000000000..a626370a1b
--- /dev/null
+++ b/package/libselinux/0002-libselinux-src-se_linux_internal.c-include-stdint.h.patch
@@ -0,0 +1,45 @@
+From f6143706e2fc0f1ae16cb3667722deb9cc51c244 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 11 May 2024 08:09:38 +0200
+Subject: [PATCH] libselinux/src/se_linux_internal.c: include stdint.h
+
+Include stdint.h to avoid the following uclibc build failure raised
+since version 3.6 and
+https://github.com/SELinuxProject/selinux/commit/cb8289c2b237e5f66e4a7608ecc6c68abeaeaf55:
+
+selinux_internal.c: In function 'reallocarray':
+selinux_internal.c:25:29: error: 'SIZE_MAX' undeclared (first use in this function)
+   25 |         if (size && nmemb > SIZE_MAX / size) {
+      |                             ^~~~~~~~
+selinux_internal.c:6:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
+    5 | #include <string.h>
+  +++ |+#include <stdint.h>
+    6 |
+selinux_internal.c:25:29: note: each undeclared identifier is reported only once for each function it appears in
+   25 |         if (size && nmemb > SIZE_MAX / size) {
+      |                             ^~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7e627744beaa4f7fdfd488dfacbaafc074a999f7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/SELinuxProject/selinux/pull/435
+---
+ libselinux/src/selinux_internal.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/selinux_internal.c b/src/selinux_internal.c
+index 06852359..f6385908 100644
+--- a/src/selinux_internal.c
++++ b/src/selinux_internal.c
+@@ -1,6 +1,7 @@
+ #include "selinux_internal.h"
+ 
+ #include <errno.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ 
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
