Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358C5C3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 14:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD1FF80AC6;
	Mon,  2 Jan 2023 14:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD1FF80AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EgnMoZ_YCcZ6; Mon,  2 Jan 2023 14:23:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17022802CE;
	Mon,  2 Jan 2023 14:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17022802CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51ABF1BF2BD
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 14:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D24340613
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 14:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D24340613
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GfIayDEhfppV for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 14:23:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48E7B40438
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 14:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48E7B40438
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 385B6870F1; Mon,  2 Jan 2023 14:23:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Jan 2023 15:20:52 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d7f7f0e3a521361f2cb5b34d3601f1d225623080
X-Git-Newrev: 879200c2677ee1835d500f175ace22158eac94d7
X-Patchwork-Hint: ignore
Message-Id: <20230102142330.385B6870F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/xxhash: fix
 static library install
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

commit: https://git.buildroot.net/buildroot/commit/?id=879200c2677ee1835d500f175ace22158eac94d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Install headers when building statically

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0945e4913fba932217278f484de04cc366415bd6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
