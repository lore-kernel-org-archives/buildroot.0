Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3F2C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CBF5404A3;
	Sat, 23 Apr 2022 16:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aIJPOaf08RJe; Sat, 23 Apr 2022 16:34:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A9F8408B2;
	Sat, 23 Apr 2022 16:34:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E1A71BF95C
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E767D414D1
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id muM1uu6fwglV for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:32:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DEFB417CA
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:32:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AB5BF81327; Sat, 23 Apr 2022 16:22:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 18:25:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c88d24249d67e3e6b43d56b7052a155bd0150e0
X-Git-Newrev: 3c5ca1fd7e6e1300c0690ff0823e1d128e9ed32b
X-Patchwork-Hint: ignore
Message-Id: <20220423162249.AB5BF81327@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/arptables: fix build with
 BR2_OPTIMIZE_0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c5ca1fd7e6e1300c0690ff0823e1d128e9ed32b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with BR2_OPTIMIZE_0 raised since the
addition of the package in commit
efc10eb6b87884f1f7917462d78af6953fcd99e3 and
https://git.netfilter.org/arptables/commit/?id=369afc14de1d89ff5627ff4c5f72f6f839244b50:

libarptc/libarptc.c:48:21: error: redefinition of 'arpt_get_target'
   48 | #define GET_TARGET  arpt_get_target
      |                     ^~~~~~~~~~~~~~~
libarptc/libarptc_incl.c:16:1: note: in expansion of macro 'GET_TARGET'
   16 | GET_TARGET(STRUCT_ENTRY *e)
      | ^~~~~~~~~~
In file included from .//include/libarptc/libarptc.h:7,
                 from libarptc/libarptc.c:26:
.//include/linux/netfilter_arp/arp_tables.h:196:43: note: previous definition of 'arpt_get_target' was here
  196 | static __inline__ struct xt_entry_target *arpt_get_target(struct arpt_entry *e)
      |                                           ^~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/730dce4101e7afcee233067e2870603cd64b8a48

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ibarptc-libarptc_incl.c-fix-build-with-O0.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/arptables/0002-libarptc-libarptc_incl.c-fix-build-with-O0.patch b/package/arptables/0002-libarptc-libarptc_incl.c-fix-build-with-O0.patch
new file mode 100644
index 0000000000..29f2d714e2
--- /dev/null
+++ b/package/arptables/0002-libarptc-libarptc_incl.c-fix-build-with-O0.patch
@@ -0,0 +1,49 @@
+From 7d8285ae92253017a15282dd25f76d76eed49518 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 21 Apr 2022 13:43:23 +0200
+Subject: [PATCH] libarptc/libarptc_incl.c: fix build with -O0
+
+Fix the following build failure with -O0:
+
+libarptc/libarptc.c:48:21: error: redefinition of 'arpt_get_target'
+   48 | #define GET_TARGET  arpt_get_target
+      |                     ^~~~~~~~~~~~~~~
+libarptc/libarptc_incl.c:16:1: note: in expansion of macro 'GET_TARGET'
+   16 | GET_TARGET(STRUCT_ENTRY *e)
+      | ^~~~~~~~~~
+In file included from .//include/libarptc/libarptc.h:7,
+                 from libarptc/libarptc.c:26:
+.//include/linux/netfilter_arp/arp_tables.h:196:43: note: previous definition of 'arpt_get_target' was here
+  196 | static __inline__ struct xt_entry_target *arpt_get_target(struct arpt_entry *e)
+      |                                           ^~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/730dce4101e7afcee233067e2870603cd64b8a48
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libarptc/libarptc_incl.c | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/libarptc/libarptc_incl.c b/libarptc/libarptc_incl.c
+index c4d5de3..441f2de 100644
+--- a/libarptc/libarptc_incl.c
++++ b/libarptc/libarptc_incl.c
+@@ -11,14 +11,6 @@
+ /* (C)1999 Paul ``Rusty'' Russell - Placed under the GNU GPL (See
+    COPYING for details). */
+ 
+-#ifndef __OPTIMIZE__
+-STRUCT_ENTRY_TARGET *
+-GET_TARGET(STRUCT_ENTRY *e)
+-{
+-	return (void *)e + e->target_offset;
+-}
+-#endif
+-
+ static int sockfd = -1;
+ static void *arptc_fn = NULL;
+ 
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
