Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3C0CAC5A5
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 20:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 003384144F;
	Wed, 24 Sep 2025 20:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJtFgdzpn04P; Wed, 24 Sep 2025 20:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1DA741448
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1DA741448;
	Wed, 24 Sep 2025 20:20:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2FCF199
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A12AB40F2E
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLWGb0RWGhEY for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 20:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1DD241440
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1DD241440
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:20:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF5B2863D7; Wed, 24 Sep 2025 20:20:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Sep 2025 21:45:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7937c52b6da69c4ff7de5ce40d836a0636c775c
X-Git-Newrev: f2c94578197f06bd84a9e3d70c080fa3430d3906
X-Patchwork-Hint: ignore
Message-Id: <20250924202005.BF5B2863D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-bare-metal-buildroot:
 add multilib option
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2c94578197f06bd84a9e3d70c080fa3430d3906
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sometimes the default GCC and newlib libraries built for a given
architecture tuple are not based on the desired ABI. Since ABI definitions are
different between architectures, the simplest solution is to allow users to
build bare-metal toolchains with --enable-multilib. This way, the libraries
for every available ABI will be built and users will be able to select the
desired library for their user applications.

This patch adds the option BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB to give
users the choice to enable multilib, if desired.

Please note that when using a string of architecture tuples, this option will
apply to all architectures in the string, so it can significantly increase
build time.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Jesse Taube <Mr.Bossman075@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/binutils-bare-metal/binutils-bare-metal.mk |  8 +++++++-
 package/gcc-bare-metal/gcc-bare-metal.mk           |  8 +++++++-
 package/newlib-bare-metal/newlib-bare-metal.mk     |  8 +++++++-
 toolchain/toolchain-bare-metal-buildroot/Config.in | 14 ++++++++++++++
 4 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 709d072765..bb04b79c2f 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -21,6 +21,12 @@ HOST_BINUTILS_BARE_METAL_CONF_ENV += MAKEINFO=true
 HOST_BINUTILS_BARE_METAL_MAKE_OPTS += MAKEINFO=true
 HOST_BINUTILS_BARE_METAL_INSTALL_OPTS += MAKEINFO=true install
 
+ifeq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB),y)
+HOST_BINUTILS_BARE_METAL_MULTILIB = "--enable-multilib"
+else
+HOST_BINUTILS_BARE_METAL_MULTILIB = "--disable-multilib"
+endif
+
 HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
 	--prefix=$(HOST_DIR) \
 	--sysconfdir=$(HOST_DIR)/etc \
@@ -31,7 +37,7 @@ HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
 	--disable-shared \
 	--enable-lto \
 	--disable-initfini-array \
-	--disable-multilib \
+	$(HOST_BINUTILS_BARE_METAL_MULTILIB) \
 	--disable-werror
 
 define HOST_BINUTILS_BARE_METAL_CONFIGURE_CMDS
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 88fc56ac09..6c2c8a5e26 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -31,6 +31,12 @@ HOST_GCC_BARE_METAL_MAKE_OPTS = \
 
 HOST_GCC_BARE_METAL_INSTALL_OPTS = install-gcc install-target-libgcc
 
+ifeq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB),y)
+HOST_GCC_BARE_METAL_MULTILIB = "--enable-multilib"
+else
+HOST_GCC_BARE_METAL_MULTILIB = "--disable-multilib"
+endif
+
 HOST_GCC_BARE_METAL_CONF_OPTS = \
 	--prefix=$(HOST_DIR) \
 	--sysconfdir=$(HOST_DIR)/etc \
@@ -49,7 +55,7 @@ HOST_GCC_BARE_METAL_CONF_OPTS = \
 	--without-long-double-128 \
 	--without-headers \
 	--enable-languages=c \
-	--disable-multilib \
+	$(HOST_GCC_BARE_METAL_MULTILIB) \
 	--with-gmp=$(HOST_DIR) \
 	--with-mpc=$(HOST_DIR) \
 	--with-mpfr=$(HOST_DIR) \
diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index bd740046c9..f1e54d6f9e 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -22,6 +22,12 @@ NEWLIB_BARE_METAL_INSTALL_STAGING = YES
 NEWLIB_BARE_METAL_INSTALL_TARGET = NO
 NEWLIB_BARE_METAL_MAKE_OPTS = MAKEINFO=true
 
+ifeq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB),y)
+NEWLIB_BARE_METAL_MULTILIB = "--enable-multilib"
+else
+NEWLIB_BARE_METAL_MULTILIB = "--disable-multilib"
+endif
+
 NEWLIB_BARE_METAL_CONF_OPTS = \
 	--build=$(GNU_HOST_NAME) \
 	--prefix=/usr \
@@ -35,7 +41,7 @@ NEWLIB_BARE_METAL_CONF_OPTS = \
 	--enable-newlib-io-long-long \
 	--enable-newlib-io-float \
 	--enable-newlib-io-long-double \
-	--disable-multilib \
+	$(NEWLIB_BARE_METAL_MULTILIB) \
 	--with-tooldir=/usr
 
 define NEWLIB_BARE_METAL_CONFIGURE_CMDS
diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index 19c97410c6..7ba579b570 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -12,6 +12,20 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
 	  metal toolchain, use the following definition:
 	  "microblazeel-buildroot-elf riscv32-buildroot-elf"
 
+config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB
+	bool "Enable multilib"
+	help
+	  Sometimes the default GCC and newlib libraries for a given
+	  architecture are not the desired ABI. Since ABI
+	  definitions are different for each architecture, this
+	  option will enable multilib configuration, so that all
+	  available ABI libraries are built which will guarantee
+	  that the desired version will be available for user
+	  applications.
+
+	  When enabled, this option will apply to all architecture
+	  tuples in the list.
+
 source "package/newlib-bare-metal/Config.in"
 
 endif # BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
