Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44654C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E72934F095;
	Fri, 28 Feb 2025 17:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o37--iKffLDZ; Fri, 28 Feb 2025 17:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74F964F6F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74F964F6F9;
	Fri, 28 Feb 2025 17:20:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F8C41DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1337746637
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRKSUhvaTeGh for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49C9646B64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49C9646B64
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44AE4875C7; Fri, 28 Feb 2025 16:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 22:24:26 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8a1ae9e0b151063528e67b8b34a1229dc729df3c
X-Git-Newrev: 57d73ec8e08e8cef1fe51665bd1ccfc5d53a6eeb
X-Patchwork-Hint: ignore
Message-Id: <20250228163043.44AE4875C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/binutils-bare-metal:
 add multiple tuple support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=57d73ec8e08e8cef1fe51665bd1ccfc5d53a6eeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add support to binutils-bare-metal to support multiple architecture tuples
with the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH string.

To do this, custom configure, build and install commands are needed, so that
each step goes through a loop of the architecture tuples in the list.

To keep consistency with autotools, all the relevant host configurations have
been copied into the HOST_BINUTILS_BARE_METAL_CONF_OPTS while removing any
configurations that do not apply to binutils and removing redundant configs.

autotools redundant configs covered by $(HOST_CONFIGURE_OPTS):
	CFLAGS="$$(HOST_CFLAGS)"
	LDFLAGS="$$(HOST_LDFLAGS)"

autotools configs not applicable to binutils:
	--disable-gtk-doc
	--disable-gtk-doc-html
	--disable-doc
	--disable-docs
	--disable-documentation
	--disable-debug
	--with-xmlto=no
	--with-fop=no
	--disable-nls

One of the configurations already in the binutils-bare-metal package was not
needed.

--enable-static -> handled by --disable-shared

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/binutils-bare-metal/binutils-bare-metal.mk | 36 ++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 3525e9fdf2..709d072765 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -22,13 +22,45 @@ HOST_BINUTILS_BARE_METAL_MAKE_OPTS += MAKEINFO=true
 HOST_BINUTILS_BARE_METAL_INSTALL_OPTS += MAKEINFO=true install
 
 HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
-	--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
+	--prefix=$(HOST_DIR) \
+	--sysconfdir=$(HOST_DIR)/etc \
+	--localstatedir=$(HOST_DIR)/var \
+	$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
+	$(QUIET) \
 	--disable-gprof \
 	--disable-shared \
 	--enable-lto \
-	--enable-static \
 	--disable-initfini-array \
 	--disable-multilib \
 	--disable-werror
 
+define HOST_BINUTILS_BARE_METAL_CONFIGURE_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		cd $(@D)/build-$(arch_tuple) && \
+		$(HOST_CONFIGURE_OPTS) \
+		$(HOST_BINUTILS_BARE_METAL_CONF_ENV) \
+		CONFIG_SITE=/dev/null \
+		$(@D)/configure \
+			$(HOST_BINUTILS_BARE_METAL_CONF_OPTS) \
+			--target=$(arch_tuple)
+	)
+endef
+
+define HOST_BINUTILS_BARE_METAL_BUILD_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_BINUTILS_BARE_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
+define HOST_BINUTILS_BARE_METAL_INSTALL_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_BINUTILS_BARE_METAL_INSTALL_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
