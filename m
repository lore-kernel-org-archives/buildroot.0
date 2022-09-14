Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F26ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 18:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B432B60E76;
	Wed, 14 Sep 2022 18:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B432B60E76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dXmPpDCs89m0; Wed, 14 Sep 2022 18:51:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B296460DFD;
	Wed, 14 Sep 2022 18:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B296460DFD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B0CE1BF33C
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 18:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 772CC60DFC
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 18:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 772CC60DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S8Ht1g0WZ7EG for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 18:51:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D45460D6C
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 18:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D45460D6C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6B32A8393E; Wed, 14 Sep 2022 18:51:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 16:14:07 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fe73c6e9d02df06c0ca8a5e3b80679ce72415718
X-Git-Newrev: 072a275a9aeb2a0a24507c2acec2f2fdb3788001
X-Patchwork-Hint: ignore
Message-Id: <20220914185118.6B32A8393E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/grub2: fix build
 race condition
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

commit: https://git.buildroot.net/buildroot/commit/?id=072a275a9aeb2a0a24507c2acec2f2fdb3788001
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Sometimes buildroot fails with:
../grub-core/kern/emu/hostfs.c:20:10: fatal error: config-util.h: No such file or directory
   20 | #include <config-util.h>
      |          ^~~~~~~~~~~~~~~

Add a patch which fixes the Makefile to correctly generate config-util.h
first.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ke-grub_fstest.pp-depend-on-config-util.h.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/boot/grub2/0151-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch b/boot/grub2/0151-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
new file mode 100644
index 0000000000..ea8787de7a
--- /dev/null
+++ b/boot/grub2/0151-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
@@ -0,0 +1,45 @@
+From bb08b723fa7bc56439c7bc166cff361628e73453 Mon Sep 17 00:00:00 2001
+Message-Id: <bb08b723fa7bc56439c7bc166cff361628e73453.1659683176.git.stefan@agner.ch>
+From: Stefan Agner <stefan@agner.ch>
+Date: Fri, 5 Aug 2022 08:59:52 +0200
+Subject: [PATCH] Makefile: Make grub_fstest.pp depend on config-util.h
+
+Warning: This commit does not apply to the GRUB git repository. This
+patch applies against the release tarballs.
+
+Upstream status: https://lists.gnu.org/archive/html/grub-devel/2022-08/msg00045.html
+Signed-off-by: Stefan Agner <stefan@agner.ch>
+---
+ Makefile.am | 2 +-
+ Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index bf9c1ba..f08cfc0 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -51,7 +51,7 @@ libgrub_a_init.c: libgrub_a_init.lst $(top_srcdir)/geninit.sh
+ CLEANFILES += libgrub_a_init.c
+ 
+ # For grub-fstest
+-grub_fstest.pp: $(grub_fstest_SOURCES)
++grub_fstest.pp: config-util.h $(grub_fstest_SOURCES)
+ 	$(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(grub_fstest_CPPFLAGS) $(CPPFLAGS) \
+ 	  -D'GRUB_MOD_INIT(x)=@MARKER@x@' $^ > $@ || (rm -f $@; exit 1)
+ CLEANFILES += grub_fstest.pp
+diff --git a/Makefile.in b/Makefile.in
+index 13f2eef..2c1d20b 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -13312,7 +13312,7 @@ libgrub_a_init.c: libgrub_a_init.lst $(top_srcdir)/geninit.sh
+ 	sh $(top_srcdir)/geninit.sh `cat $<` > $@ || (rm -f $@; exit 1)
+ 
+ # For grub-fstest
+-grub_fstest.pp: $(grub_fstest_SOURCES)
++grub_fstest.pp: config-util.h $(grub_fstest_SOURCES)
+ 	$(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(grub_fstest_CPPFLAGS) $(CPPFLAGS) \
+ 	  -D'GRUB_MOD_INIT(x)=@MARKER@x@' $^ > $@ || (rm -f $@; exit 1)
+ 
+-- 
+2.37.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
