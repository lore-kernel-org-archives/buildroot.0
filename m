Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6B4CCD183
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 14:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C3A461113;
	Sun, 19 Oct 2025 14:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKn8Zs-FaHsi; Sun, 19 Oct 2025 14:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73D476111C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73D476111C;
	Sun, 19 Oct 2025 14:49:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CB2841CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 14:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC67441280
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 14:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kRFZzXrDrqi for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 14:49:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F85441249
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F85441249
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 14:49:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1E738757A; Sun, 19 Oct 2025 14:49:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 16:35:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0964bf05e9bf136b6ee3c86461b9d3a94f8a038d
X-Git-Newrev: 0629bcfc7ead1af78712a8aa38caa69588886057
X-Patchwork-Hint: ignore
Message-Id: <20251019144950.F1E738757A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: add upstream patch to
 fix musl/uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=0629bcfc7ead1af78712a8aa38caa69588886057
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 532d5561f48b6c430e7414ba5eacccf9b6c1bd22 bumped
iproute2 to version 6.17.0 which added lib/bridge.c:
https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/log/lib/bridge.c?h=v6.17.0
and causes build errors on musl & uclibc toolchains.

Added upstream patch to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/951/951e4198b2ba109fd9c746fe2e6316a29085aeeb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...lib-bridge-avoid-redefinition-of-in6_addr.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/iproute2/0001-lib-bridge-avoid-redefinition-of-in6_addr.patch b/package/iproute2/0001-lib-bridge-avoid-redefinition-of-in6_addr.patch
new file mode 100644
index 0000000000..c684b030a8
--- /dev/null
+++ b/package/iproute2/0001-lib-bridge-avoid-redefinition-of-in6_addr.patch
@@ -0,0 +1,36 @@
+From 7119f3736f689ab396ca4193ac593938affd55fa Mon Sep 17 00:00:00 2001
+From: Yureka <yureka@cyberchaos.dev>
+Date: Sun, 12 Oct 2025 14:39:47 +0200
+Subject: lib: bridge: avoid redefinition of in6_addr
+
+On musl libc, which does not use the kernel definitions of in6_addr, including
+the libc headers after the kernel (UAPI) headers would cause a redefinition
+error. The opposite order avoids the redefinition.
+
+Fixes: 9e89d5b94d749f37525cd8778311e1c9f28f172a
+Signed-off-by: Yureka <yureka@cyberchaos.dev>
+
+Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=7119f3736f689ab396ca4193ac593938affd55fa
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/bridge.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/bridge.c b/lib/bridge.c
+index 5386aa017..104f5858b 100644
+--- a/lib/bridge.c
++++ b/lib/bridge.c
+@@ -2,8 +2,8 @@
+ 
+ #include <net/if.h>
+ 
+-#include "bridge.h"
+ #include "utils.h"
++#include "bridge.h"
+ 
+ void bridge_print_vlan_flags(__u16 flags)
+ {
+-- 
+cgit 1.2.3-korg
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
