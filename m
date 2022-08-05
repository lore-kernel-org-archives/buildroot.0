Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D43C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 07:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C419341C31;
	Fri,  5 Aug 2022 07:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C419341C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1xqmGW1cjWfg; Fri,  5 Aug 2022 07:19:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3F3741085;
	Fri,  5 Aug 2022 07:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3F3741085
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22C3B1BF869
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 07:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1B1383276
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 07:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1B1383276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-TkafBUd4em for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 07:19:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D7E2831F5
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D7E2831F5
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 07:19:38 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 0E71D5C0A73;
 Fri,  5 Aug 2022 09:19:37 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: thomas.petazzoni@bootlin.com,
	buildroot@buildroot.org
Date: Fri,  5 Aug 2022 09:19:36 +0200
Message-Id: <b4212236d70f90c9026e160a1da694568e56d4dd.1659683968.git.stefan@agner.ch>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1659683977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=X477lkaj2LToibjUD4KIPAqxxrPTh8+3WckRP0otDwE=;
 b=SAbUtAQTR8SDoDBQmE3jFPQVFAWWZ84jgxcItakPbER6M3O8+RHdN69YACEb7jTV7G3EQS
 XJl2VxWp+g1HJVw6/ft5JNFqApS7JR7n2TH61nCaDOhOrnO0czc3Gc17zMffhzT/9YuE0g
 /OU+HrgXtpOkHmqDADOLFmkNEEMb6rs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=SAbUtAQT
Subject: [Buildroot] [PATCH] [2022.02.x v2] boot/grub2: fix build race
 condition
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
Cc: yann.morin.1998@free.fr, stefan@agner.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sometimes buildroot fails with:
../grub-core/kern/emu/hostfs.c:20:10: fatal error: config-util.h: No such file or directory
   20 | #include <config-util.h>
      |          ^~~~~~~~~~~~~~~

Add a patch which fixes the Makefile to correctly generate config-util.h
first.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 ...ub_fstest.pp-depend-on-config-util.h.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 boot/grub2/0151-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch

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
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
