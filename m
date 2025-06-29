Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D455BC7EE39
	for <buildroot@archiver.kernel.org>; Sun, 29 Jun 2025 10:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D8B561015;
	Sun, 29 Jun 2025 10:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3pW2_saJL0H; Sun, 29 Jun 2025 10:14:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD0E261005
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD0E261005;
	Sun, 29 Jun 2025 10:14:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 334551C9
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 10:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 254DA61005
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 10:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-9ng3qdJnje for <buildroot@buildroot.org>;
 Sun, 29 Jun 2025 10:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D12D60FD1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D12D60FD1
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 10:14:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37E6184925; Sun, 29 Jun 2025 10:14:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Jun 2025 11:45:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b14fd5112722fc28675955f1169af072b93377d
X-Git-Newrev: 90e76818a135417d97869b6292cf0590452c3686
X-Patchwork-Hint: ignore
Message-Id: <20250629101453.37E6184925@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/syslinux: fix install with top-level
 parallel build
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=90e76818a135417d97869b6292cf0590452c3686
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

syslinux is... special. It is a target package, but it is installed in
HOST_DIR *in the target install commands*: in addition to the boot files
that run on the target, syslinux installs a set of host tools that are
to be used at build time (e.g. extlinux, to prepare bootable media, like
an iso96660 image). Then, from HOST_DIR, the actual boot files are
copied into BINARIES_DIR (i.e. images/); we do it that way because the
boot files are scattered about everywhere in the build tree, while they
are all packed together in a single directory once installed.

However, there is no dependency between the target and image install
steps. So, when using top-level parallel builds, there is no guarantee
that the target install commands are finished before the image install
commands are started.

We fix that by first installing into a temporary location, as part of
the build step, and by then copying from there as part of the install
step. This ensures that the boot files are easily available, without
needing a dependency on the target install step, that we can't express.

Note that we do not change the actual installation into HOST_DIR: it can
be set up differently that our temporary location, and we do not want
to duplicate that setup here (it's going to diverge over time).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/syslinux/syslinux.mk | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index cc52c49aee..084acc398e 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -56,6 +56,11 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
 # syslinux build system has no convenient way to pass CFLAGS,
 # and the internal zlib should take precedence so -I shouldn't
 # be used.
+# Install in a temporary location that eases final install into
+# images/ (see corresponding command, below).
+# Repeat the target, otherwise syslinux will try to build everything
+# Repeat LD (and CC) as it happens that some binaries are linked at
+# install-time.
 define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) \
 		ASCIIDOC_OK=-1 \
@@ -70,6 +75,10 @@ define SYSLINUX_BUILD_CMDS
 		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
 		PYTHON=$(HOST_DIR)/bin/python3 \
 		$(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
+	$(TARGET_MAKE_ENV) $(MAKE1) $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(@D)/br-root.temp \
+		CC="$(TARGET_CC)" \
+		LD="$(TARGET_LD)" \
+		-C $(@D) $(SYSLINUX_TARGET) install
 endef
 
 # While the actual bootloader is compiled for the target, several
@@ -77,6 +86,8 @@ endef
 # Repeat the target, otherwise syslinux will try to build everything
 # Repeat LD (and CC) as it happens that some binaries are linked at
 # install-time.
+# Don't use the temporarily-installed br-root.temp: HOST_DIR may be setup
+# differently (merged usr, merged bin...)
 define SYSLINUX_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(HOST_DIR) \
 		CC="$(TARGET_CC)" \
@@ -99,15 +110,15 @@ SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_EFI) += $(SYSLINUX_EFI_BITS)/efi/syslinux.
 
 SYSLINUX_C32 = $(call qstrip,$(BR2_TARGET_SYSLINUX_C32))
 
-# We install the c32 modules from the host-installed tree, where they
-# are all neatly installed in a single location, while they are
+# We install the c32 modules from the temporarily installed tree, where
+# they are all neatly installed in a single location, while they are
 # scattered around everywhere in the build tree.
 define SYSLINUX_INSTALL_IMAGES_CMDS
 	for i in $(SYSLINUX_IMAGES-y); do \
 		$(INSTALL) -D -m 0755 $(@D)/$$i $(BINARIES_DIR)/syslinux/$${i##*/}; \
 	done
 	for i in $(SYSLINUX_C32); do \
-		$(INSTALL) -D -m 0755 $(HOST_DIR)/share/syslinux/$${i} \
+		$(INSTALL) -D -m 0755 $(@D)/br-root.temp/usr/share/syslinux/$${i} \
 			$(BINARIES_DIR)/syslinux/$${i}; \
 	done
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
