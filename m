Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C89C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B5181D7D;
	Sun, 27 Mar 2022 16:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IXo1x5m1gC4G; Sun, 27 Mar 2022 16:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A79D81AD1;
	Sun, 27 Mar 2022 16:32:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E04ED1BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE3BA405CB
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 250Vms0cPVrM for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:32:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7B6F404D0
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:32:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4B18485E90; Sun, 27 Mar 2022 16:23:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 18:12:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39ceb94fdb96da47a350b92e86513ddc57a657eb
X-Git-Newrev: b848117699707390b6507e59e2e705c54acdc9fc
X-Patchwork-Hint: ignore
Message-Id: <20220327162300.4B18485E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-meson: add cmake dependency
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=b848117699707390b6507e59e2e705c54acdc9fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Meson dependencies and variables can be provided by cmake similar to
how they can be provided by pkgconfig, for this to work we need to
ensure that cmake_prefix_path is set for both cross and native
targets along with the cmake binary path.

See:
https://mesonbuild.com/Dependencies.html#cmake
https://mesonbuild.com/Dependencies.html#arbitrary-variables-from-dependencies-that-can-be-found-multiple-ways
https://mesonbuild.com/Machine-files.html#meson-builtin-options

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-meson.mk                   | 2 ++
 support/misc/cross-compilation.conf.in | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 85de98e03a..9e70d49b60 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -79,6 +79,7 @@ define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
         -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
         -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
+        -e "s%@BR2_CMAKE@%$(BR2_CMAKE)%g" \
         -e "s%@PKGCONF_HOST_BINARY@%$(HOST_DIR)/bin/pkgconf%g" \
         -e "s%@STAGING_DIR@%$(STAGING_DIR)%g" \
         -e "s%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g" \
@@ -136,6 +137,7 @@ define $(2)_CONFIGURE_CMDS
 		-Db_pie=false \
 		-Dstrip=false \
 		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
+		-Dbuild.cmake_prefix_path=$$(HOST_DIR)/lib/cmake \
 		$$($$(PKG)_CONF_OPTS) \
 		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
 endef
diff --git a/support/misc/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
index 18cf258a8e..1977a83501 100644
--- a/support/misc/cross-compilation.conf.in
+++ b/support/misc/cross-compilation.conf.in
@@ -8,6 +8,7 @@ c = '@TARGET_CC@'
 cpp = '@TARGET_CXX@'
 ar = '@TARGET_AR@'
 strip = '@TARGET_STRIP@'
+cmake = '@BR2_CMAKE@'
 pkgconfig = '@PKGCONF_HOST_BINARY@'
 g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
 g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
@@ -18,6 +19,7 @@ c_link_args = [@TARGET_LDFLAGS@]
 cpp_args = [@TARGET_CXXFLAGS@]
 cpp_link_args = [@TARGET_LDFLAGS@]
 wrap_mode = 'nodownload'
+cmake_prefix_path = '@STAGING_DIR@/usr/lib/cmake'
 
 [properties]
 needs_exe_wrapper = true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
