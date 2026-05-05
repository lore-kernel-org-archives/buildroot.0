Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4455FCD3439
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 09:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7864D60817;
	Tue,  5 May 2026 09:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ka_qsHLLfPNY; Tue,  5 May 2026 09:43:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6523607C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777974221;
	bh=oxgmkkhRmm33szLm5XUpF1vBcRUvTUaYPYjuv5ASgcg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=etjZXvjL2hMCkxfocFQqsrgZmbzqlQfTH9ceJyPNwYfSxVoyjfeBEwZNWdakMemcW
	 EN7Kz3iLy2pWauRK3Qtz/lUtZV8qE5KFNy4sX1xMwIGtD1jHkn32jVFGDEp3S2WOXa
	 lh6Q9Okaxk7iUPPVfaOLs9x4dsiU3fyTPR4/4TCzXW3n+NwWOFFoBfc/LeyPOOr9iI
	 bWVPIPiMR2RHMvcloaVBB1gdXh42dX5Qh2uEG7g9R/cKod1ZhGL4LLE+s9Mda8nxMv
	 5XXRyefNl7mNdgRyCAY9lhi4V+korsdOVhMeCxWk5do9I0Re0IJP1y5lm5V0sRTEYl
	 CIIxRfQ7v4wmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6523607C9;
	Tue,  5 May 2026 09:43:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 71CF82DF
 for <buildroot@buildroot.org>; Tue,  5 May 2026 09:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57D91409B2
 for <buildroot@buildroot.org>; Tue,  5 May 2026 09:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pghi0sKt9ujN for <buildroot@buildroot.org>;
 Tue,  5 May 2026 09:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42CF9408E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42CF9408E6
 for <buildroot@buildroot.org>; Tue,  5 May 2026 09:43:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AE64844E1; Tue,  5 May 2026 09:43:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 11:42:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dff61f65ec655513cec87133c7b3fc1ecd95649c
X-Git-Newrev: e4a9c1c760eccfd409ab1d33cb8a7df5e11f43db
X-Patchwork-Hint: ignore
Message-Id: <20260505094338.8AE64844E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmod: switch to Meson build
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e4a9c1c760eccfd409ab1d33cb8a7df5e11f43db
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The upstream changelog for version 34 states that the next major
version will drop the Autotools build, and the 34 series is meant for
distros to switch.

Notable changes in the Buildroot package:

* The Meson build handles symlink install, so we can drop the post
  install hooks.

* Simplify the merged-usr and merged-bin symlink install handling.
  Only the non merged-usr case needs special handling now for placing
  the correct symlink to block busybox placing it's only kmod applet
  symlink unto /sbin later.

* The previous point also means that host-kmod now installs the full
  set of tools.

* Explicitly disable openssl support in host-kmod tools. It is enabled
  by default and the build fails if OpenSSL cannot be found. In the
  autotools build it was not explicitly set.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
[Marcus: explain the merged-bin, merged-usr simplifications in the
commit message]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/kmod/kmod.mk | 82 +++++++++++++++++++---------------------------------
 1 file changed, 30 insertions(+), 52 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index bcf65fd9be..0901afc872 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -17,43 +17,43 @@ KMOD_LICENSE_FILES = libkmod/COPYING
 
 KMOD_CPE_ID_VENDOR = kernel
 
-# static linking not supported, see
-# https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
-KMOD_CONF_OPTS = --disable-static --enable-shared
-
-KMOD_CONF_OPTS += --disable-manpages
-HOST_KMOD_CONF_OPTS = --disable-manpages
+KMOD_CONF_OPTS = -Dmanpages=false
+HOST_KMOD_CONF_OPTS = -Dmanpages=false
 
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
-KMOD_CONF_OPTS += --with-bashcompletiondir=/usr/share/bash-completion/completions
+KMOD_CONF_OPTS += -Dbashcompletiondir=/usr/share/bash-completion/completions
+else
+KMOD_CONF_OPTS += -Dbashcompletiondir=no
 endif
 
+KMOD_CONF_OPTS += -Dfishcompletiondir=no -Dzshcompletiondir=no
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 KMOD_DEPENDENCIES += zlib
-KMOD_CONF_OPTS += --with-zlib
+KMOD_CONF_OPTS += -Dzlib=enabled
 else
-KMOD_CONF_OPTS += --without-zlib
+KMOD_CONF_OPTS += -Dzlib=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ZSTD),y)
 KMOD_DEPENDENCIES += zstd
-KMOD_CONF_OPTS += --with-zstd
+KMOD_CONF_OPTS += -Dzstd=enabled
 else
-KMOD_CONF_OPTS += --without-zstd
+KMOD_CONF_OPTS += -Dzstd=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
 KMOD_DEPENDENCIES += xz
-KMOD_CONF_OPTS += --with-xz
+KMOD_CONF_OPTS += -Dxz=enabled
 else
-KMOD_CONF_OPTS += --without-xz
+KMOD_CONF_OPTS += -Dxz=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 KMOD_DEPENDENCIES += openssl
-KMOD_CONF_OPTS += --with-openssl
+KMOD_CONF_OPTS += -Dopenssl=enabled
 else
-KMOD_CONF_OPTS += --without-openssl
+KMOD_CONF_OPTS += -Dopenssl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
@@ -62,61 +62,39 @@ ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
 KMOD_LICENSE += , GPL-2.0+ (tools)
 KMOD_LICENSE_FILES += COPYING
 
-# /sbin is really /usr/sbin with merged /usr, and /usr/sbin is
-# really /usr/bin with merged-bin, so adjust relative symlink
-ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-ifeq ($(BR2_ROOTFS_MERGED_BIN),y)
-KMOD_BIN_PATH = kmod
-KMOD_SBIN_DIR = bin
-else
-KMOD_BIN_PATH = ../bin/kmod
-KMOD_SBIN_DIR = sbin
-endif
-else
-KMOD_BIN_PATH = ../usr/bin/kmod
-KMOD_SBIN_DIR = sbin
+ifeq ($(BR2_ROOTFS_MERGED_USR),)
+# Busybox would install its modutils symlinks to /sbin, so kmod needs
+# to do the same to take priority (Busybox won't overwrite them, see
+# its install-noclobber).
+KMOD_CONF_OPTS += -Dsbindir=/sbin
 endif
 
-define KMOD_INSTALL_TOOLS
-	for i in depmod insmod lsmod modinfo modprobe rmmod; do \
-		ln -sf $(KMOD_BIN_PATH) $(TARGET_DIR)/$(KMOD_SBIN_DIR)/$$i; \
-	done
-endef
-
-KMOD_POST_INSTALL_TARGET_HOOKS += KMOD_INSTALL_TOOLS
 else
-KMOD_CONF_OPTS += --disable-tools
+KMOD_CONF_OPTS += -Dtools=false
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_KMOD_GZ),y)
 HOST_KMOD_DEPENDENCIES += host-zlib
-HOST_KMOD_CONF_OPTS += --with-zlib
+HOST_KMOD_CONF_OPTS += -Dzlib=enabled
 else
-HOST_KMOD_CONF_OPTS += --without-zlib
+HOST_KMOD_CONF_OPTS += -Dzlib=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_KMOD_ZSTD),y)
 HOST_KMOD_DEPENDENCIES += host-zstd
-HOST_KMOD_CONF_OPTS += --with-zstd
+HOST_KMOD_CONF_OPTS += -Dzstd=enabled
 else
-HOST_KMOD_CONF_OPTS += --without-zstd
+HOST_KMOD_CONF_OPTS += -Dzstd=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_KMOD_XZ),y)
 HOST_KMOD_DEPENDENCIES += host-xz
-HOST_KMOD_CONF_OPTS += --with-xz
+HOST_KMOD_CONF_OPTS += -Dxz=enabled
 else
-HOST_KMOD_CONF_OPTS += --without-xz
+HOST_KMOD_CONF_OPTS += -Dxz=disabled
 endif
 
-# We only install depmod, since that's the only tool used for the
-# host.
-define HOST_KMOD_INSTALL_TOOLS
-	mkdir -p $(HOST_DIR)/sbin/
-	ln -sf ../bin/kmod $(HOST_DIR)/sbin/depmod
-endef
-
-HOST_KMOD_POST_INSTALL_HOOKS += HOST_KMOD_INSTALL_TOOLS
+HOST_KMOD_CONF_OPTS += -Dopenssl=disabled
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
