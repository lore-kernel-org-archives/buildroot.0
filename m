Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BFDC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 09:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3545417B5;
	Fri, 16 May 2025 09:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JpKWYXMK6z0f; Fri, 16 May 2025 09:51:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05327417B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05327417B4;
	Fri, 16 May 2025 09:51:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 213DE185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0640C417AD
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhGgT24sPNR0 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 09:50:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4935A417B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4935A417B4
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:50:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37BED8695A; Fri, 16 May 2025 09:50:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 11:42:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 211e822d433806893c1395b55c1d891343a07aa0
X-Git-Newrev: 4e95062f820a64ecd2402115ee552dbcf2874f02
X-Patchwork-Hint: ignore
Message-Id: <20250516095058.37BED8695A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-meson: use buildroot-build for
 build directory
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4e95062f820a64ecd2402115ee552dbcf2874f02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://gitlab.com/buildroot.org/buildroot/-/issues/64

Some source tarballs (E.G.  libopenh264) may already contain a build/
subdir, so switch to the more unique bildroot-build for the build directory,
similar to how it is done for cmake.

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
Co-Authored-By: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Peter: reword commit text]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-meson.mk | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index bc805b799c..30271e35e5 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -147,12 +147,12 @@ $(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
 #
 #
 define $(2)_CONFIGURE_CMDS
-	rm -rf $$($$(PKG)_SRCDIR)/build
-	mkdir -p $$($$(PKG)_SRCDIR)/build
+	rm -rf $$($$(PKG)_SRCDIR)/buildroot-build
+	mkdir -p $$($$(PKG)_SRCDIR)/buildroot-build
 	sed -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
 	    -e "/^\[properties\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_PROPERTIES),\n$$(x)):" \
 	    $$(call PKG_MESON_CROSSCONFIG_SED,$(2)_CFLAGS,$(2)_CXXFLAGS,$(2)_LDFLAGS,$(2)_FCFLAGS) \
-	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
+	    > $$($$(PKG)_SRCDIR)/buildroot-build/cross-compilation.conf
 	PATH=$$(BR_PATH) \
 	CC_FOR_BUILD="$$(HOSTCC)" \
 	CXX_FOR_BUILD="$$(HOSTCXX)" \
@@ -162,21 +162,21 @@ define $(2)_CONFIGURE_CMDS
 		--libdir=lib \
 		--default-library=$(PKG_MESON_DEFAULT_LIBRARY) \
 		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
-		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
+		--cross-file=$$($$(PKG)_SRCDIR)/buildroot-build/cross-compilation.conf \
 		-Db_pie=false \
 		-Db_staticpic=$(if $(BR2_m68k_cf),false,true) \
 		-Dstrip=false \
 		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
 		-Dbuild.cmake_prefix_path=$$(HOST_DIR)/lib/cmake \
 		$$($$(PKG)_CONF_OPTS) \
-		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
+		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/buildroot-build
 endef
 else
 
 # Configure package for host
 define $(2)_CONFIGURE_CMDS
-	rm -rf $$($$(PKG)_SRCDIR)/build
-	mkdir -p $$($$(PKG)_SRCDIR)/build
+	rm -rf $$($$(PKG)_SRCDIR)/buildroot-build
+	mkdir -p $$($$(PKG)_SRCDIR)/buildroot-build
 	$$(HOST_CONFIGURE_OPTS) \
 	$$($$(PKG)_CONF_ENV) $$(MESON) setup \
 		--prefix=$$(HOST_DIR) \
@@ -188,7 +188,7 @@ define $(2)_CONFIGURE_CMDS
 		--wrap-mode=nodownload \
 		-Dstrip=true \
 		$$($$(PKG)_CONF_OPTS) \
-		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
+		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/buildroot-build
 endef
 endif
 endif
@@ -203,12 +203,12 @@ ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
+		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build
 endef
 else
 define $(2)_BUILD_CMDS
 	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
+		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build
 endef
 endif
 endif
@@ -220,7 +220,7 @@ endif
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
+		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build install
 endef
 endif
 
@@ -231,7 +231,7 @@ endif
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
+		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build install
 endef
 endif
 
@@ -242,7 +242,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
+		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build install
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
