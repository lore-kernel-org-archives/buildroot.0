Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC20CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 418CB8405C;
	Thu, 21 Aug 2025 19:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghB5S3lRs_bx; Thu, 21 Aug 2025 19:20:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93D6984620
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93D6984620;
	Thu, 21 Aug 2025 19:20:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE94925B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1EA540D75
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyJJcAvHus32 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0778040CF0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0778040CF0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03D828711B; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:54:37 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 3afff7b8bca772ddb729d975ad010e52fa00c16b
X-Git-Newrev: 3eac6e8bca0b02793d23084ca531c4bab49639b4
X-Patchwork-Hint: ignore
Message-Id: <20250821192018.03D828711B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/setserial:
 simplify patching
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3eac6e8bca0b02793d23084ca531c4bab49639b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

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
(cherry picked from commit c688a1a8a833a89e9e6fcef70f183766e341e11d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
