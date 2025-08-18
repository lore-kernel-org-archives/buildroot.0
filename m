Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6549CA0EE9
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 20:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BC336064B;
	Mon, 18 Aug 2025 20:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GA-o3n4j4hi; Mon, 18 Aug 2025 20:59:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9D6B60664
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9D6B60664;
	Mon, 18 Aug 2025 20:59:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17BCE196
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09DEA80A4C
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2EGEcKsVUgD for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 20:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BC8680A54
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BC8680A54
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:59:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37CD2876FC; Mon, 18 Aug 2025 20:59:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 Aug 2025 22:58:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 871cdeab6a00054a1366d5e0ea56bd62a53f1c76
X-Git-Newrev: c688a1a8a833a89e9e6fcef70f183766e341e11d
X-Patchwork-Hint: ignore
Message-Id: <20250818205902.37CD2876FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/setserial: simplify patching
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c688a1a8a833a89e9e6fcef70f183766e341e11d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/setserial/0001-build-system-fix.patch | 33 +++++++++++++++++++++++----
 package/setserial/setserial.mk                |  2 --
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/package/setserial/0001-build-system-fix.patch b/package/setserial/0001-build-system-fix.patch
index eec7993d19..06f2201bd4 100644
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
index 5bce05056a..9beee349c8 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
