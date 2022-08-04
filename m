Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E149EC19F2A
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 12:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F0E540B59;
	Thu,  4 Aug 2022 12:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F0E540B59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CeoQu9cTZNyc; Thu,  4 Aug 2022 12:39:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 090B640B7C;
	Thu,  4 Aug 2022 12:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 090B640B7C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B0571BF9CB
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 12:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D7E18274E
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 12:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D7E18274E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YraG1qv29u03 for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 12:39:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F07D8828A9
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F07D8828A9
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 12:39:14 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id B85E35C2FA5;
 Thu,  4 Aug 2022 14:39:11 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: yann.morin.1998@free.fr,
	buildroot@buildroot.org
Date: Thu,  4 Aug 2022 14:39:10 +0200
Message-Id: <573007e6c5d1d25be3a1e5eec19466f6919ae905.1659616743.git.stefan@agner.ch>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1659616751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=TRWBOB7E4kkfNlAY5prWMW7Vt9xUIHBBHdMnBHtJW0w=;
 b=NRWkkhQ5d30JDa6sNkF+tBhHR3Yq+ICoH6wIT80I1lpYmKFa9RJjv1jox+MgTdE3dcrYWS
 K2MeLWcHFb8hp6CuddEPnkbd3Lg+p68qAmVgh40HoVEXMNPPR6gXzjFXJ9QRwYnDjft/5j
 uO/DsgZ8G0/gBicoan8nSKlmrz1Blig=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=NRWkkhQ5
Subject: [Buildroot] [PATCH] [2022.02.x] boot/grub2: fix build race condition
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
Cc: stefan@agner.ch
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
 ...ub_fstest.pp-depend-on-config-util.h.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 boot/grub2/0151-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch

diff --git a/boot/grub2/0151-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch b/boot/grub2/0151-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
new file mode 100644
index 0000000000..f25291b504
--- /dev/null
+++ b/boot/grub2/0151-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
@@ -0,0 +1,36 @@
+From 2ad0b32a5c7a94c10b982139934a931c547929b3 Mon Sep 17 00:00:00 2001
+Message-Id: <2ad0b32a5c7a94c10b982139934a931c547929b3.1659606262.git.stefan@agner.ch>
+From: Stefan Agner <stefan@agner.ch>
+Date: Thu, 4 Aug 2022 11:43:12 +0200
+Subject: [PATCH] Makefile: Make grub_fstest.pp depend on config-util.h
+
+If you build with "make -j25", sometimes you see:
+/build/output_generic_x86_64/host/bin/x86_64-buildroot-linux-gnu-gcc -E -DHAVE_CONFIG_H -I. -I..  -Wall -W -DGRUB_UTIL=1 -D_FILE_OFFSET_BITS=64 -I./include -DGRUB_FILE=\"util/grub-fstest.c\" -I. -I.. -I. -I.. -I../include -I./include -I../grub-core/lib/libgcrypt-grub/src/ -I./grub-core/lib/gnulib -I../grub-core/lib/gnulib  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fno-stack-protector -D_FILE_OFFSET_BITS=64 \
+  -D'GRUB_MOD_INIT(x)=@MARKER@x@' ../util/grub-fstest.c ../grub-core/kern/emu/hostfs.c ../grub-core/disk/host.c ../grub-core/osdep/init.c > grub_fstest.pp || (rm -f grub_fstest.pp; exit 1)
+config.status: creating config-util.h
+../grub-core/kern/emu/hostfs.c:20:10: fatal error: config-util.h: No such file or directory
+   20 | #include <config-util.h>
+      |          ^~~~~~~~~~~~~~~
+compilation terminated.
+
+Signed-off-by: Stefan Agner <stefan@agner.ch>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 42e121feb..43635d5ff 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -60,7 +60,7 @@ libgrub_a_init.c: libgrub_a_init.lst $(top_srcdir)/geninit.sh
+ CLEANFILES += libgrub_a_init.c
+ 
+ # For grub-fstest
+-grub_fstest.pp: $(grub_fstest_SOURCES)
++grub_fstest.pp: config-util.h $(grub_fstest_SOURCES)
+ 	$(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(grub_fstest_CPPFLAGS) $(CPPFLAGS) \
+ 	  -D'GRUB_MOD_INIT(x)=@MARKER@x@' $^ > $@ || (rm -f $@; exit 1)
+ CLEANFILES += grub_fstest.pp
+-- 
+2.37.1
+
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
