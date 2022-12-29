Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36115C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C32F7402B8;
	Thu, 29 Dec 2022 09:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C32F7402B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dGLB2fyNvNOF; Thu, 29 Dec 2022 09:03:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99BA8402D2;
	Thu, 29 Dec 2022 09:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99BA8402D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F08E1BF3A0
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B60660D58
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B60660D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_4KHFBo7TSx for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:03:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2B3060D55
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2B3060D55
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFBE686FC3; Thu, 29 Dec 2022 09:03:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:00:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14bb74b4617df6fe511e638147cbde01fd7637a1
X-Git-Newrev: 0945e4913fba932217278f484de04cc366415bd6
X-Patchwork-Hint: ignore
Message-Id: <20221229090320.BFBE686FC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xxhash: fix static library install
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0945e4913fba932217278f484de04cc366415bd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install headers when building statically

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ile-add-install_libxxhash.includes-target.patch | 39 ++++++++++++++++++++++
 package/xxhash/xxhash.mk                           | 15 +++++++--
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/package/xxhash/0004-Makefile-add-install_libxxhash.includes-target.patch b/package/xxhash/0004-Makefile-add-install_libxxhash.includes-target.patch
new file mode 100644
index 0000000000..22c8cdaadf
--- /dev/null
+++ b/package/xxhash/0004-Makefile-add-install_libxxhash.includes-target.patch
@@ -0,0 +1,39 @@
+From b7c91f761b6d0b79398d0a064d2d6e34de3dfa47 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 27 Dec 2022 23:12:37 +0100
+Subject: [PATCH] Makefile: add install_libxxhash.includes target
+
+Add install_libxxhash.includes to be able to install headers when
+building and installing the static library
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/Cyan4973/xxHash/pull/776]
+---
+ Makefile | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index cfa5779..2276282 100644
+--- a/Makefile
++++ b/Makefile
+@@ -557,6 +557,8 @@ install_libxxhash: libxxhash
+ 	$(Q)$(INSTALL_PROGRAM) $(LIBXXH) $(DESTDIR)$(LIBDIR)
+ 	$(Q)ln -sf $(LIBXXH) $(DESTDIR)$(LIBDIR)/libxxhash.$(SHARED_EXT_MAJOR)
+ 	$(Q)ln -sf $(LIBXXH) $(DESTDIR)$(LIBDIR)/libxxhash.$(SHARED_EXT)
++
++install_libxxhash.includes:
+ 	$(Q)$(INSTALL) -d -m 755 $(DESTDIR)$(INCLUDEDIR)   # includes
+ 	$(Q)$(INSTALL_DATA) xxhash.h $(DESTDIR)$(INCLUDEDIR)
+ 	$(Q)$(INSTALL_DATA) xxh3.h $(DESTDIR)$(INCLUDEDIR) # for compatibility, will be removed in v0.9.0
+@@ -586,7 +588,7 @@ install_man:
+ 	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh128sum.1
+ 
+ .PHONY: install
+-install: install_libxxhash.a install_libxxhash install_libxxhash.pc install_xxhsum install_man ## install libraries, CLI, links and man page
++install: install_libxxhash.a install_libxxhash install_libxxhash.includes install_libxxhash.pc install_xxhsum install_man ## install libraries, CLI, links and man page
+ 	@echo xxhash installation completed
+ 
+ .PHONY: uninstall
+-- 
+2.35.1
+
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index a8f8d1d179..6932113f14 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -15,14 +15,23 @@ XXHASH_INSTALL_TARGETS = install_xxhsum
 
 ifeq ($(BR2_STATIC_LIBS),y)
 XXHASH_TARGETS += libxxhash.a libxxhash.pc
-XXHASH_INSTALL_TARGETS += install_libxxhash.a install_libxxhash.pc
+XXHASH_INSTALL_TARGETS += \
+	install_libxxhash.a \
+	install_libxxhash.includes \
+	install_libxxhash.pc
 else ifeq ($(BR2_SHARED_LIBS),y)
 XXHASH_TARGETS += libxxhash libxxhash.pc
-XXHASH_INSTALL_TARGETS += install_libxxhash install_libxxhash.pc
+XXHASH_INSTALL_TARGETS += \
+	install_libxxhash \
+	install_libxxhash.includes \
+	install_libxxhash.pc
 else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 XXHASH_TARGETS += libxxhash.a libxxhash libxxhash.pc
 XXHASH_INSTALL_TARGETS += \
-	install_libxxhash.a install_libxxhash install_libxxhash.pc
+	install_libxxhash.a \
+	install_libxxhash \
+	install_libxxhash.includes \
+	install_libxxhash.pc
 endif
 
 define XXHASH_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
