Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9D8C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CC6A83EE5;
	Thu, 16 Dec 2021 19:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRyW_AAqyGxK; Thu, 16 Dec 2021 19:20:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42D7183F35;
	Thu, 16 Dec 2021 19:20:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E26EE1BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEF2F83EE5
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1-bM0LYzYsd for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:20:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C04968300C
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:20:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3FA5981E4E; Thu, 16 Dec 2021 19:14:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 20:11:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7cd070e4f0ebe1b566b33d3bbdfa7bef05c4b4e4
X-Git-Newrev: cc0c90aa83821d817ae2cbe01ad2c8d22ea30ba8
X-Patchwork-Hint: ignore
Message-Id: <20211216191449.3FA5981E4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xxhash: install in staging
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc0c90aa83821d817ae2cbe01ad2c8d22ea30ba8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install xxhash in staging to allow lighttpd to use it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../xxhash/0001-fixed-man-page-installation.patch  | 31 +++++++++
 .../xxhash/0002-fix-man-page-installation.patch    | 66 +++++++++++++++++++
 ...03-Makefile-add-dedicated-install-targets.patch | 73 ++++++++++++++++++++++
 package/xxhash/xxhash.mk                           | 27 +++++++-
 4 files changed, 195 insertions(+), 2 deletions(-)

diff --git a/package/xxhash/0001-fixed-man-page-installation.patch b/package/xxhash/0001-fixed-man-page-installation.patch
new file mode 100644
index 0000000000..a9f68db4b4
--- /dev/null
+++ b/package/xxhash/0001-fixed-man-page-installation.patch
@@ -0,0 +1,31 @@
+From e345ccaf4daa8c35698ab02c0de346fcc0ca9ef6 Mon Sep 17 00:00:00 2001
+From: Yann Collet <cyan@fb.com>
+Date: Fri, 6 Aug 2021 15:29:32 -0700
+Subject: [PATCH] fixed man page installation
+
+[Retrieved from:
+https://github.com/Cyan4973/xxHash/commit/e345ccaf4daa8c35698ab02c0de346fcc0ca9ef6]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index b8552a9f..556a32a0 100644
+--- a/Makefile
++++ b/Makefile
+@@ -498,10 +498,10 @@ endif
+ 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh64sum
+ 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh128sum
+ 	@echo Installing man pages
+-	$(Q)$(INSTALL_DATA) xxhsum.1 $(DESTDIR)$(MANDIR)/xxhsum.1
+-	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh32sum.1
+-	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh64sum.1
+-	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh128sum.1
++	$(Q)$(INSTALL_DATA) $(MAN) $(DESTDIR)$(MANDIR)/xxhsum.1
++	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh32sum.1
++	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh64sum.1
++	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh128sum.1
+ 	@echo xxhash installation completed
+ 
+ .PHONY: uninstall
diff --git a/package/xxhash/0002-fix-man-page-installation.patch b/package/xxhash/0002-fix-man-page-installation.patch
new file mode 100644
index 0000000000..5d2a5a4efa
--- /dev/null
+++ b/package/xxhash/0002-fix-man-page-installation.patch
@@ -0,0 +1,66 @@
+From 836f4e735cf368542f14005e41d2f84ec29dfd60 Mon Sep 17 00:00:00 2001
+From: Yann Collet <yann.collet.73@gmail.com>
+Date: Sat, 4 Dec 2021 10:29:49 -0800
+Subject: [PATCH] fix man page installation
+
+for variant redirectors (`xxh32sum`, `xxh64sum` and `xxh128sum`).
+fix #647, reported by @jpalus.
+
+Also : slightly updated man page text, for clarity and accuracy.
+
+[Retrieved (and updated to keep only Makefile update) from:
+https://github.com/Cyan4973/xxHash/commit/836f4e735cf368542f14005e41d2f84ec29dfd60]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile        | 14 ++++++++------
+ cli/xxhsum.1    |  8 ++++----
+ cli/xxhsum.1.md |  8 +++++---
+ 3 files changed, 17 insertions(+), 13 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 2fbefbc6..63273e16 100644
+--- a/Makefile
++++ b/Makefile
+@@ -457,6 +457,7 @@ endif
+ 
+ INSTALL_PROGRAM ?= $(INSTALL)
+ INSTALL_DATA    ?= $(INSTALL) -m 644
++INSTALL_DIR     ?= $(INSTALL) -d -m 755
+ 
+ 
+ # Escape special symbols by putting each character into its separate class
+@@ -496,7 +497,7 @@ libxxhash.pc: libxxhash.pc.in
+ .PHONY: install
+ install: lib libxxhash.pc xxhsum  ## install libraries, CLI, links and man page
+ 	@echo Installing libxxhash
+-	$(Q)$(INSTALL) -d -m 755 $(DESTDIR)$(LIBDIR)
++	$(Q)$(INSTALL_DIR) $(DESTDIR)$(LIBDIR)
+ 	$(Q)$(INSTALL_DATA) libxxhash.a $(DESTDIR)$(LIBDIR)
+ 	$(Q)$(INSTALL_PROGRAM) $(LIBXXH) $(DESTDIR)$(LIBDIR)
+ 	$(Q)ln -sf $(LIBXXH) $(DESTDIR)$(LIBDIR)/libxxhash.$(SHARED_EXT_MAJOR)
+@@ -508,19 +509,20 @@ ifeq ($(DISPATCH),1)
+ 	$(Q)$(INSTALL_DATA) xxh_x86dispatch.h $(DESTDIR)$(INCLUDEDIR)
+ endif
+ 	@echo Installing pkgconfig
+-	$(Q)$(INSTALL) -d -m 755 $(DESTDIR)$(PKGCONFIGDIR)/
++	$(Q)$(INSTALL_DIR) $(DESTDIR)$(PKGCONFIGDIR)/
+ 	$(Q)$(INSTALL_DATA) libxxhash.pc $(DESTDIR)$(PKGCONFIGDIR)/
+ 	@echo Installing xxhsum
+-	$(Q)$(INSTALL) -d -m 755 $(DESTDIR)$(BINDIR)/ $(DESTDIR)$(MANDIR)/
++	$(Q)$(INSTALL_DIR) $(DESTDIR)$(BINDIR)/
+ 	$(Q)$(INSTALL_PROGRAM) xxhsum $(DESTDIR)$(BINDIR)/xxhsum
+ 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh32sum
+ 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh64sum
+ 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh128sum
+ 	@echo Installing man pages
++	$(Q)$(INSTALL_DIR) $(DESTDIR)$(MANDIR)/
+ 	$(Q)$(INSTALL_DATA) $(MAN) $(DESTDIR)$(MANDIR)/xxhsum.1
+-	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh32sum.1
+-	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh64sum.1
+-	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh128sum.1
++	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh32sum.1
++	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh64sum.1
++	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh128sum.1
+ 	@echo xxhash installation completed
+ 
+ .PHONY: uninstall
diff --git a/package/xxhash/0003-Makefile-add-dedicated-install-targets.patch b/package/xxhash/0003-Makefile-add-dedicated-install-targets.patch
new file mode 100644
index 0000000000..0607c8ee82
--- /dev/null
+++ b/package/xxhash/0003-Makefile-add-dedicated-install-targets.patch
@@ -0,0 +1,73 @@
+From 0e7418bce83bb9c236d9cb4535a36a80cd0cc663 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 15 Dec 2021 21:45:14 +0100
+Subject: [PATCH] Makefile: add dedicated install targets
+
+Add dedicated install targets to allow the user to install only xxhsum,
+the static library, the shared library, etc.
+
+This is especially useful on embedded systems where dynamic library is
+not always supported by toolchains
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/Cyan4973/xxHash/pull/665]
+---
+ Makefile | 18 +++++++++++++++---
+ 1 file changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 8d4fcd2..5fe7297 100644
+--- a/Makefile
++++ b/Makefile
+@@ -505,11 +505,14 @@ libxxhash.pc: libxxhash.pc.in
+           $< > $@
+ 
+ 
+-.PHONY: install
+-install: lib libxxhash.pc xxhsum  ## install libraries, CLI, links and man page
+-	@echo Installing libxxhash
++install_libxxhash.a: libxxhash.a
++	@echo Installing libxxhash.a
+ 	$(Q)$(INSTALL_DIR) $(DESTDIR)$(LIBDIR)
+ 	$(Q)$(INSTALL_DATA) libxxhash.a $(DESTDIR)$(LIBDIR)
++
++install_libxxhash: libxxhash
++	@echo Installing libxxhash
++	$(Q)$(INSTALL_DIR) $(DESTDIR)$(LIBDIR)
+ 	$(Q)$(INSTALL_PROGRAM) $(LIBXXH) $(DESTDIR)$(LIBDIR)
+ 	$(Q)ln -sf $(LIBXXH) $(DESTDIR)$(LIBDIR)/libxxhash.$(SHARED_EXT_MAJOR)
+ 	$(Q)ln -sf $(LIBXXH) $(DESTDIR)$(LIBDIR)/libxxhash.$(SHARED_EXT)
+@@ -519,21 +522,30 @@ install: lib libxxhash.pc xxhsum  ## install libraries, CLI, links and man page
+ ifeq ($(DISPATCH),1)
+ 	$(Q)$(INSTALL_DATA) xxh_x86dispatch.h $(DESTDIR)$(INCLUDEDIR)
+ endif
++
++install_libxxhash.pc: libxxhash.pc
+ 	@echo Installing pkgconfig
+ 	$(Q)$(INSTALL_DIR) $(DESTDIR)$(PKGCONFIGDIR)/
+ 	$(Q)$(INSTALL_DATA) libxxhash.pc $(DESTDIR)$(PKGCONFIGDIR)/
++
++install_xxhsum: xxhsum
+ 	@echo Installing xxhsum
+ 	$(Q)$(INSTALL_DIR) $(DESTDIR)$(BINDIR)/
+ 	$(Q)$(INSTALL_PROGRAM) xxhsum $(DESTDIR)$(BINDIR)/xxhsum
+ 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh32sum
+ 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh64sum
+ 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh128sum
++
++install_man:
+ 	@echo Installing man pages
+ 	$(Q)$(INSTALL_DIR) $(DESTDIR)$(MANDIR)/
+ 	$(Q)$(INSTALL_DATA) $(MAN) $(DESTDIR)$(MANDIR)/xxhsum.1
+ 	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh32sum.1
+ 	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh64sum.1
+ 	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh128sum.1
++
++.PHONY: install
++install: install_libxxhash.a install_libxxhash install_libxxhash.pc install_xxhsum install_man ## install libraries, CLI, links and man page
+ 	@echo xxhash installation completed
+ 
+ .PHONY: uninstall
+-- 
+2.33.0
+
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index c2ddbbd607..3e7f3244b3 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -8,13 +8,36 @@ XXHASH_VERSION = 0.8.0
 XXHASH_SITE = $(call github,Cyan4973,xxHash,v$(XXHASH_VERSION))
 XXHASH_LICENSE = BSD-2-Clause (library), GPL-2.0+ (xxhsum)
 XXHASH_LICENSE_FILES = LICENSE
+XXHASH_INSTALL_STAGING = YES
+
+XXHASH_TARGETS = xxhsum
+XXHASH_INSTALL_TARGETS = install_xxhsum
+
+ifeq ($(BR2_STATIC_LIBS),y)
+XXHASH_TARGETS += libxxhash.a libxxhash.pc
+XXHASH_INSTALL_TARGETS += install_libxxhash.a install_libxxhash.pc
+else ifeq ($(BR2_SHARED_LIBS),y)
+XXHASH_TARGETS += libxxhash libxxhash.pc
+XXHASH_INSTALL_TARGETS += install_libxxhash install_libxxhash.pc
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+XXHASH_TARGETS += libxxhash.a libxxhash libxxhash.pc
+XXHASH_INSTALL_TARGETS += \
+	install_libxxhash.a install_libxxhash install_libxxhash.pc
+endif
 
 define XXHASH_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) xxhsum
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		$(XXHASH_TARGETS)
+endef
+
+define XXHASH_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		PREFIX=/usr DESTDIR=$(STAGING_DIR) $(XXHASH_INSTALL_TARGETS)
 endef
 
 define XXHASH_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/xxhsum $(TARGET_DIR)/usr/bin/xxhsum
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		PREFIX=/usr DESTDIR=$(TARGET_DIR) $(XXHASH_INSTALL_TARGETS)
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
