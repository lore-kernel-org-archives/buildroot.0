Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED46FC28B23
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 19:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E2CD40690;
	Fri,  7 Mar 2025 19:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ImjkuPVvkmXv; Fri,  7 Mar 2025 19:05:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3695A40675
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3695A40675;
	Fri,  7 Mar 2025 19:05:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F05A944
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78A7F81212
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SalkWZtXMV3K for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 19:05:13 +0000 (UTC)
X-Greylist: delayed 353 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 07 Mar 2025 19:05:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E85F8120C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E85F8120C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.25.10;
 helo=smtp-190a.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch
 [185.125.25.10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E85F8120C
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:05:13 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246c])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Z8bDh2g4zz1G9;
 Fri,  7 Mar 2025 19:59:16 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4Z8bDg73GtzMQZ; Fri,  7 Mar 2025 19:59:15 +0100 (CET)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Fri, 07 Mar 2025 19:58:46 +0100
MIME-Version: 1.0
Message-Id: <20250307-setserial-fix-v1-4-c37c1e7e8234@cherry.de>
References: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
In-Reply-To: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
To: buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 4/4] package/setserial: simplify patching
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

The original commit (aaa2b660a9f9 ("setserial: convert to autotargets
and fix manpages install") wasn't entirely clear why we went for a
removal of a patch from the tarball we get from Debian.

It is assumed the original patch mainly only wanted to remove the strip
and make sure the directories are created before files are installed in
there. But doing only that made my build fail because the linker doesn't
find @CXXFLAGS@. After undoing the addition of this variable (and its
use) from 01_makefile.patch it now compiles just fine.

Therefore, instead of removing the patch from the tarball we get from
Debian, simply update the patch we carry in the tree to remove what's
necessary and simplify the patching logic.

This could also help identify notable differences between the
01_makefile.patch from two different versions whenever we upgrade.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/setserial/0001-build-system-fix.patch | 33 +++++++++++++++++++++++----
 package/setserial/setserial.mk                |  2 --
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/package/setserial/0001-build-system-fix.patch b/package/setserial/0001-build-system-fix.patch
index eec7993d19963c45a85ac724c089c9be7655d274..06f2201bd4404a513d5ef7b8fc2feb7f0b1269b3 100644
--- a/package/setserial/0001-build-system-fix.patch
+++ b/package/setserial/0001-build-system-fix.patch
@@ -3,7 +3,19 @@ sure that the directories (especially the manpages directory) are
 created before installing files to them. This is similar to what
 automake does.
 
+Also remove CXXFLAGS and its use since the linker errors out with:
+
+  cannot find @CXXFLAGS@: No such file or directory
+
+Additionally, remove the strip command made on the wrong file.
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[rebased on top of Debian's setserial_2.17-57.debian.tar.xz instead of relying
+ on deletion of 01_makefile.patch]
+[extend commit log to explain why CXXFLAGS is removed and also that strip is
+ removed on purpose, c.f. original commit aaa2b660a9f9 ("setserial: convert to
+ autotargets and fix manpages install")]
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
 ---
  Makefile.in |    7 ++++---
  1 file changed, 4 insertions(+), 3 deletions(-)
@@ -12,17 +24,30 @@ Index: setserial-2.17/Makefile.in
 ===================================================================
 --- setserial-2.17.orig/Makefile.in
 +++ setserial-2.17/Makefile.in
-@@ -26,9 +26,10 @@ setserial.cat: setserial.8
+@@ -15,7 +15,6 @@ RM = rm -f
+ CFLAGS = @CFLAGS@
+ LDFLAGS = @LDFLAGS@
+ CPPFLAGS = @CPPFLAGS@
+-CXXFLAGS = @CXXFLAGS@
+ DEFS = @DEFS@
+ INCS = -I.
+ TAR = tar
+@@ -23,14 +22,15 @@ TAR = tar
+ all: setserial setserial.cat
+ 
+ setserial: setserial.c
+-	$(CC) $(CFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS) $(DEFS) $(INCS) setserial.c -o setserial
++	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(DEFS) $(INCS) setserial.c -o setserial
+ 
+ setserial.cat: setserial.8
  	nroff -man setserial.8 > setserial.cat
  
  install: setserial setserial.8
 -	$(INSTALL_PROGRAM) setserial $(DESTDIR)/bin
 -	$(STRIP) $(DESTDIR)/bin/setserial
--	$(INSTALL_DATA) setserial.8 $(DESTDIR)/usr/man/man8
 +	mkdir -p $(DESTDIR)/usr/bin
 +	$(INSTALL_PROGRAM) setserial $(DESTDIR)/usr/bin
 +	mkdir -p $(DESTDIR)/usr/share/man/man8
-+	$(INSTALL_DATA) setserial.8 $(DESTDIR)/usr/share/man/man8
+ 	$(INSTALL_DATA) setserial.8 $(DESTDIR)/usr/share/man/man8
  
  clean:
- 	$(RM) setserial setserial.o setserial.cat *~
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 9b27e4e867e65231eb7c27c11685befcfcb6b75f..2b54de77c27af224873d1dfe006a5e485ced5b23 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -29,8 +29,6 @@ define SETSERIAL_APPLY_DEBIAN_PATCHES
 	# - Apply patches in the order listed in debian/patches/series
 	if [ -d $(@D)/debian/patches ]; then \
 		touch $(@D)/gorhack.h; \
-		rm $(@D)/debian/patches/01_makefile.patch; \
-		sed -i '/01_makefile.patch/d' $(@D)/debian/patches/series; \
 		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches series; \
 	fi
 endef

-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
