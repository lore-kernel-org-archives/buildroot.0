Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329F1C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 09:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A37A460A98;
	Sat,  6 Aug 2022 09:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A37A460A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-dIGjs6cXrE; Sat,  6 Aug 2022 09:08:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9763B60F3E;
	Sat,  6 Aug 2022 09:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9763B60F3E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 439BB1BF852
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 09:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E71A60A9B
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 09:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E71A60A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pgK73A08B0ID for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 09:08:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D40E60F3E
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 09:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D40E60F3E
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8FD6F868A0; Sat,  6 Aug 2022 08:54:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 Aug 2022 11:05:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e7c9f152771b9e5fad83fdd4aa5bc3d88bb8645
X-Git-Newrev: 1e5338ed06f74ebd8c216ba504fc1dc1e1a2f76b
X-Patchwork-Hint: ignore
Message-Id: <20220806085446.8FD6F868A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: fix build race condition
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e5338ed06f74ebd8c216ba504fc1dc1e1a2f76b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sometimes buildroot fails with:
../grub-core/kern/emu/hostfs.c:20:10: fatal error: config-util.h: No such file or directory
   20 | #include <config-util.h>
      |          ^~~~~~~~~~~~~~~

Add a patch which fixes the Makefile to correctly generate config-util.h
first.

Note: This re-adds a workaround to avoid re-running autoconf. This has
previously been used to avoid having to run the rather complex build
file generation machinery of GRUB2. See 7e64a050fb ("boot/grub2: Fix
GRUB i386-pc build with Ubuntu gcc"), but now we just need to touch
Makefile.in.

Signed-off-by: Stefan Agner <stefan@agner.ch>
[yann.morin.1998@free.fr:
  - add comment with patch name before hook
  - slightly extend commit log that we only touch Makefile.in
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ke-grub_fstest.pp-depend-on-config-util.h.patch | 45 ++++++++++++++++++++++
 boot/grub2/grub2.mk                                |  7 ++++
 2 files changed, 52 insertions(+)

diff --git a/boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch b/boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
new file mode 100644
index 0000000000..ea8787de7a
--- /dev/null
+++ b/boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
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
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 57593330dd..4e7e0fa898 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -13,6 +13,13 @@ GRUB2_DEPENDENCIES = host-bison host-flex host-grub2
 HOST_GRUB2_DEPENDENCIES = host-bison host-flex
 GRUB2_INSTALL_IMAGES = YES
 
+# 0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
+define GRUB2_AVOID_AUTORECONF
+	$(Q)touch $(@D)/Makefile.in
+endef
+GRUB2_POST_PATCH_HOOKS += GRUB2_AVOID_AUTORECONF
+HOST_GRUB2_POST_PATCH_HOOKS += GRUB2_AVOID_AUTORECONF
+
 # CVE-2019-14865 is about a flaw in the grub2-set-bootflag tool, which
 # doesn't exist upstream, but is added by the Redhat/Fedora
 # packaging. Not applicable to Buildroot.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
