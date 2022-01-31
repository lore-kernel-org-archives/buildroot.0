Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E37C433FE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 23:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 218BD40189;
	Mon, 31 Jan 2022 23:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n-SdQVOguqa2; Mon, 31 Jan 2022 23:01:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3D0340932;
	Mon, 31 Jan 2022 23:01:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3DA81BF836
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 23:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAFA240936
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 23:01:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jVvbgB76m3qY for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 23:01:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B4A040189
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 23:01:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D227C82803; Mon, 31 Jan 2022 22:54:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 22:21:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 391f70b6893e0b502b69f40c69df412f24519060
X-Git-Newrev: 56e31ff9dbbff8774c29875cf4316e403cb89691
X-Patchwork-Hint: ignore
Message-Id: <20220131225416.D227C82803@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-meson: separate infrastructure
 logic from package
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

commit: https://git.buildroot.net/buildroot/commit/?id=56e31ff9dbbff8774c29875cf4316e403cb89691
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move all logic related to handling meson packages to the
package/pkg-meson file. This now mirrors the other build
systems and keeps the package itself clean.

Correctly prefix variables with PKG_MESON_

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/meson/meson.mk | 38 --------------------------------------
 package/pkg-meson.mk   | 40 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index e63dc725bf..6c0d1ab08e 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -13,44 +13,6 @@ MESON_SETUP_TYPE = setuptools
 HOST_MESON_DEPENDENCIES = host-ninja
 HOST_MESON_NEEDS_HOST_PYTHON = python3
 
-HOST_MESON_TARGET_ENDIAN = $(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))
-HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)
-
-# https://mesonbuild.com/Reference-tables.html#cpu-families
-ifeq ($(BR2_arcle)$(BR2_arceb),y)
-HOST_MESON_TARGET_CPU_FAMILY = arc
-else ifeq ($(BR2_arm)$(BR2_armeb),y)
-HOST_MESON_TARGET_CPU_FAMILY = arm
-else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
-HOST_MESON_TARGET_CPU_FAMILY = aarch64
-else ifeq ($(BR2_i386),y)
-HOST_MESON_TARGET_CPU_FAMILY = x86
-else ifeq ($(BR2_m68k),y)
-HOST_MESON_TARGET_CPU_FAMILY = m68k
-else ifeq ($(BR2_microblazeel)$(BR2_microblazebe),y)
-HOST_MESON_TARGET_CPU_FAMILY = microblaze
-else ifeq ($(BR2_mips)$(BR2_mipsel),y)
-HOST_MESON_TARGET_CPU_FAMILY = mips
-else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
-HOST_MESON_TARGET_CPU_FAMILY = mips64
-else ifeq ($(BR2_powerpc),y)
-HOST_MESON_TARGET_CPU_FAMILY = ppc
-else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
-HOST_MESON_TARGET_CPU_FAMILY = ppc64
-else ifeq ($(BR2_riscv),y)
-HOST_MESON_TARGET_CPU_FAMILY = riscv64
-else ifeq ($(BR2_sh4)$(BR2_sh4eb)$(BR2_sh4a)$(BR2_sh4aeb),y)
-HOST_MESON_TARGET_CPU_FAMILY = sh4
-else ifeq ($(BR2_sparc),y)
-HOST_MESON_TARGET_CPU_FAMILY = sparc
-else ifeq ($(BR2_sparc64),y)
-HOST_MESON_TARGET_CPU_FAMILY = sparc64
-else ifeq ($(BR2_x86_64),y)
-HOST_MESON_TARGET_CPU_FAMILY = x86_64
-else
-HOST_MESON_TARGET_CPU_FAMILY = $(ARCH)
-endif
-
 # Avoid interpreter shebang longer than 128 chars
 define HOST_MESON_SET_INTERPRETER
 	$(SED) '1s:.*:#!/usr/bin/env python3:' $(HOST_DIR)/bin/meson
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index ec535174b6..91f0f3244b 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -29,6 +29,44 @@ MESON		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
 NINJA		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/ninja
 NINJA_OPTS	= $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
 
+# https://mesonbuild.com/Reference-tables.html#cpu-families
+ifeq ($(BR2_arcle)$(BR2_arceb),y)
+PKG_MESON_TARGET_CPU_FAMILY = arc
+else ifeq ($(BR2_arm)$(BR2_armeb),y)
+PKG_MESON_TARGET_CPU_FAMILY = arm
+else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
+PKG_MESON_TARGET_CPU_FAMILY = aarch64
+else ifeq ($(BR2_i386),y)
+PKG_MESON_TARGET_CPU_FAMILY = x86
+else ifeq ($(BR2_m68k),y)
+PKG_MESON_TARGET_CPU_FAMILY = m68k
+else ifeq ($(BR2_microblazeel)$(BR2_microblazebe),y)
+PKG_MESON_TARGET_CPU_FAMILY = microblaze
+else ifeq ($(BR2_mips)$(BR2_mipsel),y)
+PKG_MESON_TARGET_CPU_FAMILY = mips
+else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
+PKG_MESON_TARGET_CPU_FAMILY = mips64
+else ifeq ($(BR2_powerpc),y)
+PKG_MESON_TARGET_CPU_FAMILY = ppc
+else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
+PKG_MESON_TARGET_CPU_FAMILY = ppc64
+else ifeq ($(BR2_riscv),y)
+PKG_MESON_TARGET_CPU_FAMILY = riscv64
+else ifeq ($(BR2_sh4)$(BR2_sh4eb)$(BR2_sh4a)$(BR2_sh4aeb),y)
+PKG_MESON_TARGET_CPU_FAMILY = sh4
+else ifeq ($(BR2_sparc),y)
+PKG_MESON_TARGET_CPU_FAMILY = sparc
+else ifeq ($(BR2_sparc64),y)
+PKG_MESON_TARGET_CPU_FAMILY = sparc64
+else ifeq ($(BR2_x86_64),y)
+PKG_MESON_TARGET_CPU_FAMILY = x86_64
+else
+PKG_MESON_TARGET_CPU_FAMILY = $(ARCH)
+endif
+
+HOST_MESON_TARGET_ENDIAN = $(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))
+HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)
+
 ################################################################################
 # inner-meson-package -- defines how the configuration, compilation and
 # installation of a Meson package should be done, implements a few hooks to
@@ -181,7 +219,7 @@ meson-package = $(call inner-meson-package,$(pkgname),$(call UPPERCASE,$(pkgname
 host-meson-package = $(call inner-meson-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
 
 ################################################################################
-# Generation of the Meson cross-compilation.conf file
+# Generation of the Meson compile flags and cross-compilation file
 ################################################################################
 
 # Generate a Meson cross-compilation.conf suitable for use with the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
