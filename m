Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F18C4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 12:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 920324051D;
	Tue, 15 Nov 2022 12:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 920324051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DHMpZ3Hknk0M; Tue, 15 Nov 2022 12:54:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 991DB40481;
	Tue, 15 Nov 2022 12:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 991DB40481
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53EFF1BF348
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 12:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3013A8131A
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 12:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3013A8131A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f97DpGOSbJpb for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 12:54:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65E47812FA
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 12:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65E47812FA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52B6A83C43; Tue, 15 Nov 2022 12:54:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 13:51:38 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: a2c54b1990767235ac85a98d4f518465608a4116
X-Git-Newrev: 76b180425cb02ba7d533c22b37286ec1a6e9471f
X-Patchwork-Hint: ignore
Message-Id: <20221115125402.52B6A83C43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/wavemon: fix
 kernel header collision
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

commit: https://git.buildroot.net/buildroot/commit/?id=76b180425cb02ba7d533c22b37286ec1a6e9471f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Fix the following build failure raised since bump to version 0.9.4 in
commit 5cae1a0d675eca41125b6430157d3d0d78d1220c:

In file included from iw_if.h:26:0,
                 from conf.c:19:
/home/buildroot/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/linux/if.h:71:2: error: redeclaration of enumerator 'IFF_UP'
  IFF_UP    = 1<<0,  /* sysfs */
  ^
/home/buildroot/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/net/if.h:44:5: note: previous definition of 'IFF_UP' was here
     IFF_UP = 0x1,  /* Interface is up.  */
     ^

Fixes:
 - http://autobuild.buildroot.org/results/cbdf3e0cf0bee8f1b076581768c24155afc320d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 57a1ce00a2c9f4b4b988f41b15ad01c6abc2a99c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-iw_if.h-don-t-include-linux-if.h.patch    | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch b/package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch
new file mode 100644
index 0000000000..95f54e4b7f
--- /dev/null
+++ b/package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch
@@ -0,0 +1,41 @@
+From 4ac1482bb40376e47805c3737dfed60abb1dd3b4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 22 Dec 2021 00:39:35 +0100
+Subject: [PATCH] iw_if.h: don't include linux/if.h (#109)
+
+Don't include linux/if.h to avoid the following build failure:
+
+In file included from iw_if.h:31:0,
+                 from conf.c:19:
+/home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h: At top level:
+/home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h:143:8: error: redefinition of 'struct ifmap'
+ struct ifmap {
+        ^
+In file included from iw_if.h:26:0,
+                 from conf.c:19:
+/home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/net/if.h:111:8: note: originally defined here
+ struct ifmap
+        ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a6ee162cf04b70b144b54e1ca4b7b2421071c50c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/uoaerg/wavemon/commit/4ac1482bb40376e47805c3737dfed60abb1dd3b4]
+---
+ iw_if.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/iw_if.h b/iw_if.h
+index 9e7fa89..6607e0b 100644
+--- a/iw_if.h
++++ b/iw_if.h
+@@ -28,7 +28,6 @@
+ #include <net/ethernet.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
+-#include <linux/if.h>
+ 
+ /* Definitions from linux/ieee80211.h (not necessarily part of distro headers) */
+ #define WLAN_CAPABILITY_ESS		(1<<0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
