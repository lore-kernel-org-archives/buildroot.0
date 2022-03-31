Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FC9C433F5
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 11:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F89D83F2E;
	Thu, 31 Mar 2022 11:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YWQMTXrI58dU; Thu, 31 Mar 2022 11:34:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 435DC83F17;
	Thu, 31 Mar 2022 11:34:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1119D1BF3D2
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 11:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F36C041CE5
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 11:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gmRxIY6Oo-7l for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 11:34:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D497419D9
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 11:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1978885FEA; Thu, 31 Mar 2022 11:25:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 13:23:00 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f976d735e96a2b82542d3eddd599b6ed5a36e393
X-Git-Newrev: a28617d676bd223c7440c1c00d58a1869e5a121c
X-Patchwork-Hint: ignore
Message-Id: <20220331112525.1978885FEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pkg-meson: add
 cmake dependency support
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

commit: https://git.buildroot.net/buildroot/commit/?id=a28617d676bd223c7440c1c00d58a1869e5a121c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit b848117699707390b6507e59e2e705c54acdc9fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
