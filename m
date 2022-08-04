Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D064C19F2B
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 11:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8B7982716;
	Thu,  4 Aug 2022 11:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8B7982716
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6GsmxicUggXU; Thu,  4 Aug 2022 11:45:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD3E58269C;
	Thu,  4 Aug 2022 11:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD3E58269C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C0B61BF48B
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 11:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06FE28269C
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 11:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06FE28269C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f8aF2ZVbjRtA for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 11:45:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D58782512
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D58782512
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 11:45:31 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 0C9C85C0A73;
 Thu,  4 Aug 2022 13:45:29 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: yann.morin.1998@free.fr,
	buildroot@buildroot.org
Date: Thu,  4 Aug 2022 13:45:27 +0200
Message-Id: <32cdca079efa80b745bb60af23ad9e99f3cabbf4.1659613508.git.stefan@agner.ch>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1659613529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=6NmvG7H5dQZ4npurLMozY69jRFmwsiWxueIPN5g2tis=;
 b=gjVQLTpo5K1+cIGXclH0iIHWy8GDNmXr3ky6477e1/DajBlTGwA4vQFSxUDuX4cgvqYR3F
 8yBRLcbr+FwoXNYVo74JOpIET+cJuHkH2NgD3McmJQmNlVSFR/exZ6bQF6Rqwccf88YDAF
 Lcd0sAidKFk6kLDC9u9bZtYknFxAJaQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=gjVQLTpo
Subject: [Buildroot] [PATCH] [master] boot/grub2: fix build race condition
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
 ...ub_fstest.pp-depend-on-config-util.h.patch | 24 +++++++++++++++++++
 boot/grub2/grub2.mk                           |  6 +++++
 2 files changed, 30 insertions(+)
 create mode 100644 boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch

diff --git a/boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch b/boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
new file mode 100644
index 0000000000..96e6852e86
--- /dev/null
+++ b/boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
@@ -0,0 +1,24 @@
+diff -uraBN grub-2.06.orig/Makefile.am grub-2.06/Makefile.am
+--- grub-2.06.orig/Makefile.am	2020-03-10 21:39:53.000000000 +0100
++++ grub-2.06/Makefile.am	2022-08-04 12:48:15.486566890 +0200
+@@ -51,7 +51,7 @@
+ CLEANFILES += libgrub_a_init.c
+ 
+ # For grub-fstest
+-grub_fstest.pp: $(grub_fstest_SOURCES)
++grub_fstest.pp: config-util.h $(grub_fstest_SOURCES)
+ 	$(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(grub_fstest_CPPFLAGS) $(CPPFLAGS) \
+ 	  -D'GRUB_MOD_INIT(x)=@MARKER@x@' $^ > $@ || (rm -f $@; exit 1)
+ CLEANFILES += grub_fstest.pp
+diff -uraBN grub-2.06.orig/Makefile.in grub-2.06/Makefile.in
+--- grub-2.06.orig/Makefile.in	2021-06-08 16:41:36.000000000 +0200
++++ grub-2.06/Makefile.in	2022-08-04 12:48:08.116566935 +0200
+@@ -13312,7 +13312,7 @@
+ 	sh $(top_srcdir)/geninit.sh `cat $<` > $@ || (rm -f $@; exit 1)
+ 
+ # For grub-fstest
+-grub_fstest.pp: $(grub_fstest_SOURCES)
++grub_fstest.pp: config-util.h $(grub_fstest_SOURCES)
+ 	$(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(grub_fstest_CPPFLAGS) $(CPPFLAGS) \
+ 	  -D'GRUB_MOD_INIT(x)=@MARKER@x@' $^ > $@ || (rm -f $@; exit 1)
+ 
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 57593330dd..6c9c80dc15 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -13,6 +13,12 @@ GRUB2_DEPENDENCIES = host-bison host-flex host-grub2
 HOST_GRUB2_DEPENDENCIES = host-bison host-flex
 GRUB2_INSTALL_IMAGES = YES
 
+define GRUB2_AVOID_AUTORECONF
+       $(Q)touch $(@D)/Makefile.in
+endef
+GRUB2_POST_PATCH_HOOKS += GRUB2_AVOID_AUTORECONF
+HOST_GRUB2_POST_PATCH_HOOKS += GRUB2_AVOID_AUTORECONF
+
 # CVE-2019-14865 is about a flaw in the grub2-set-bootflag tool, which
 # doesn't exist upstream, but is added by the Redhat/Fedora
 # packaging. Not applicable to Buildroot.
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
