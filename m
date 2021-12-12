Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3931EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD9DC40131;
	Sun, 12 Dec 2021 14:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X8-SWehL-dGK; Sun, 12 Dec 2021 14:54:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01E5541223;
	Sun, 12 Dec 2021 14:54:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 252651BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD6C561CEE
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HqlfTkTXIsrv for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:53:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DFB261CF6
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:53:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3DF2D83465; Sun, 12 Dec 2021 14:48:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 15:48:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8901538cd0e507f8a5b462e3c3421415f3ceea7
X-Git-Newrev: 474f35eb544b6ffe64fb5f2c1e086fcd2f1a431b
X-Patchwork-Hint: ignore
Message-Id: <20211212144823.3DF2D83465@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rp-pppoe: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=474f35eb544b6ffe64fb5f2c1e086fcd2f1a431b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure raised since bump of pppd to
version 2.4.9 in commit 075b01f2f7b5a9241b4bfe76db8f14af0284060c:

In file included from pppoe.h:133,
                 from debug.c:19:
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/netinet/if_ether.h:116:8: error: redefinition of 'struct ethhdr'
  116 | struct ethhdr {
      |        ^~~~~~
In file included from pppoe.h:121,
                 from debug.c:19:
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/linux/if_ether.h:163:8: note: originally defined here
  163 | struct ethhdr {
      |        ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ccca18fcbcde65cb6784f5559eac68ca17ab14a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...0002-src-pppoe.h-fix-build-with-musl-libc.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch b/package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch
new file mode 100644
index 0000000000..29ba72be4f
--- /dev/null
+++ b/package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch
@@ -0,0 +1,60 @@
+From bbf5b2759cff0c65b47fd6dbe5fe7341f205ad03 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 11 Dec 2021 22:03:16 +0100
+Subject: [PATCH] src/pppoe.h: fix build with musl libc
+
+musl libc defines its own struct ethhdr that conflicts with the kernel
+define one. The kernel headers provide a way to suppress its struct
+ethhdr. For that to work the libc headers must precede the kernel. Move
+the kernel linux/if_ether.h include below libc netinet/if_ether.h. That
+fixes the following build failure:
+
+In file included from pppoe.h:133,
+                 from debug.c:19:
+/home/giuliobenetti/autobuild/run/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/netinet/if_ether.h:116:8: error: redefinition of 'struct ethhdr'
+  116 | struct ethhdr {
+      |        ^~~~~~
+In file included from pppoe.h:121,
+                 from debug.c:19:
+/home/giuliobenetti/autobuild/run/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/linux/if_ether.h:163:8: note: originally defined here
+  163 | struct ethhdr {
+      |        ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ccca18fcbcde65cb6784f5559eac68ca17ab14a3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/dfskoll/rp-pppoe/pull/4]
+---
+ src/pppoe.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/pppoe.h b/src/pppoe.h
+index 4780092..2b08111 100644
+--- a/src/pppoe.h
++++ b/src/pppoe.h
+@@ -117,10 +117,6 @@ typedef unsigned long UINT32_t;
+ #error Could not find a 32-bit integer type
+ #endif
+ 
+-#ifdef HAVE_LINUX_IF_ETHER_H
+-#include <linux/if_ether.h>
+-#endif
+-
+ #include <netinet/in.h>
+ 
+ #ifdef HAVE_NETINET_IF_ETHER_H
+@@ -134,6 +130,10 @@ typedef unsigned long UINT32_t;
+ #endif
+ #endif
+ 
++#ifdef HAVE_LINUX_IF_ETHER_H
++#include <linux/if_ether.h>
++#endif
++
+ 
+ 
+ /* Ethernet frame types according to RFC 2516 */
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
