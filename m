Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC1AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 23:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A609282C9C;
	Mon, 31 Jan 2022 23:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IEoQ5gODirxs; Mon, 31 Jan 2022 23:01:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACD0E82B34;
	Mon, 31 Jan 2022 23:01:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 084281BF973
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 23:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDAC840189
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 23:01:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQEHFmGAB2dF for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 23:01:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2A2F40932
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 23:01:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DEC9B80F72; Mon, 31 Jan 2022 22:54:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 23:36:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56e31ff9dbbff8774c29875cf4316e403cb89691
X-Git-Newrev: 675f02fd3f0b11b24eab62b781038e492c40bf90
X-Patchwork-Hint: ignore
Message-Id: <20220131225416.DEC9B80F72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-meson: improve generation of
 cross-compilation file
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

commit: https://git.buildroot.net/buildroot/commit/?id=675f02fd3f0b11b24eab62b781038e492c40bf90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed a few variables, as they were only used to communicate
between the meson package and pkg-meson.mk and are not needed
anymore.

Moved cross-compilation.conf.in out of meson package.

Creating the cross-compilation.conf files for packages is now
using the original template.
To avoid duplicate code, the common sed pattern is stored in
a make variable.

Use explicit Buildroot variables for compiler tools,
and some fixes. (TARGET_LDFLAGS and TARGET_CXXFLAGS
were mixed up with PKG_TARGET_CFLAGS)

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[Arnout: keep PKG_MESON_INSTALL_CROSS_CONF in
TOOLCHAIN_TARGET_FINALIZE_HOOKS]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-meson.mk                               | 56 +++++++++++-----------
 .../misc}/cross-compilation.conf.in                | 10 ++--
 2 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 91f0f3244b..85de98e03a 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -64,8 +64,26 @@ else
 PKG_MESON_TARGET_CPU_FAMILY = $(ARCH)
 endif
 
-HOST_MESON_TARGET_ENDIAN = $(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))
-HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)
+# Generates sed patterns for patching the cross-compilation.conf template,
+# since Flags might contain commas the arguments are passed indirectly by
+# variable name (stripped to deal with whitespaces).
+# Arguments are variable containing cflags, cxxflags, ldflags.
+define PKG_MESON_CROSSCONFIG_SED
+        -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
+        -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
+        -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
+        -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
+        -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
+        -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
+        -e "s%@TARGET_ENDIAN@%$(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))%g" \
+        -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
+        -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
+        -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
+        -e "s%@PKGCONF_HOST_BINARY@%$(HOST_DIR)/bin/pkgconf%g" \
+        -e "s%@STAGING_DIR@%$(STAGING_DIR)%g" \
+        -e "s%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g" \
+        $(TOPDIR)/support/misc/cross-compilation.conf.in
+endef
 
 ################################################################################
 # inner-meson-package -- defines how the configuration, compilation and
@@ -101,19 +119,9 @@ $(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
 define $(2)_CONFIGURE_CMDS
 	rm -rf $$($$(PKG)_SRCDIR)/build
 	mkdir -p $$($$(PKG)_SRCDIR)/build
-	sed -e 's%@TARGET_CROSS@%$$(TARGET_CROSS)%g' \
-	    -e 's%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g' \
-	    -e 's%@TARGET_CPU@%$$(HOST_MESON_TARGET_CPU)%g' \
-	    -e 's%@TARGET_ENDIAN@%$$(HOST_MESON_TARGET_ENDIAN)%g' \
-	    -e "s%@TARGET_CFLAGS@%$$(call make-sq-comma-list,$$($(2)_CFLAGS))%g" \
-	    -e "s%@TARGET_LDFLAGS@%$$(call make-sq-comma-list,$$($(2)_LDFLAGS))%g" \
-	    -e "s%@TARGET_CXXFLAGS@%$$(call make-sq-comma-list,$$($(2)_CXXFLAGS))%g" \
-	    -e 's%@HOST_DIR@%$$(HOST_DIR)%g' \
-	    -e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
-	    -e 's%@STATIC@%$$(if $$(BR2_STATIC_LIBS),true,false)%g' \
-	    -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
+	sed -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
 	    -e "/^\[properties\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_PROPERTIES),\n$$(x)):" \
-	    package/meson/cross-compilation.conf.in \
+	    $$(call PKG_MESON_CROSSCONFIG_SED,$(2)_CFLAGS,$(2)_CXXFLAGS,$(2)_LDFLAGS) \
 	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
 	PATH=$$(BR_PATH) \
 	CC_FOR_BUILD="$$(HOSTCC)" \
@@ -227,22 +235,12 @@ host-meson-package = $(call inner-meson-package,host-$(pkgname),$(call UPPERCASE
 # own flags if they need to.
 define PKG_MESON_INSTALL_CROSS_CONF
 	mkdir -p $(HOST_DIR)/etc/meson
-	sed -e 's%@TARGET_CROSS@%$(TARGET_CROSS)%g' \
-	    -e 's%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g' \
-	    -e 's%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g' \
-	    -e 's%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g' \
-	    -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@%g" \
-	    -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_CFLAGS@%g" \
-	    -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g" \
-	    -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
-	    -e 's%@STAGING_DIR@%$(STAGING_DIR)%g' \
-	    -e 's%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g' \
-	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
+	sed -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@%g" \
+	    -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_LDFLAGS@%g" \
+	    -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CXXFLAGS@%g" \
+	    $(call PKG_MESON_CROSSCONFIG_SED) \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
-	sed -e 's%@PKG_TARGET_CFLAGS@%%g' \
-	    -e 's%@PKG_TARGET_LDFLAGS@%%g' \
-	    -e 's%@PKG_TARGET_CXXFLAGS@%%g' \
-	    $(HOST_DIR)/etc/meson/cross-compilation.conf.in \
+	sed $(call PKG_MESON_CROSSCONFIG_SED,TARGET_CFLAGS,TARGET_CXXFLAGS,TARGET_LDFLAGS) \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
 endef
 
diff --git a/package/meson/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
similarity index 84%
rename from package/meson/cross-compilation.conf.in
rename to support/misc/cross-compilation.conf.in
index 7a7ece97ae..18cf258a8e 100644
--- a/package/meson/cross-compilation.conf.in
+++ b/support/misc/cross-compilation.conf.in
@@ -4,11 +4,11 @@
 # - Buildroot's 'target' is Meson's 'host'
 
 [binaries]
-c = '@TARGET_CROSS@gcc'
-cpp = '@TARGET_CROSS@g++'
-ar = '@TARGET_CROSS@ar'
-strip = '@TARGET_CROSS@strip'
-pkgconfig = '@HOST_DIR@/bin/pkgconf'
+c = '@TARGET_CC@'
+cpp = '@TARGET_CXX@'
+ar = '@TARGET_AR@'
+strip = '@TARGET_STRIP@'
+pkgconfig = '@PKGCONF_HOST_BINARY@'
 g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
 g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
