Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FDCC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 21:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 744B360646;
	Fri,  3 Dec 2021 21:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZERw3F43q5RJ; Fri,  3 Dec 2021 21:54:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F3CC606B4;
	Fri,  3 Dec 2021 21:54:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0EBA1BF2CA
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 21:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED501403CB
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 21:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3yKulJ9iwBPT for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 21:54:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0C5A403BF
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 21:54:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i5so8547519wrb.2
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 13:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rnqGCxJUTJqTc9XISvXzy1b33K3Q51SfY6gguu8X10g=;
 b=XoeDR1TqC9rHW7iZ6OWuObAftQyM7FiHV2FxA0KQ4cakpmsmgayPnrv8m9DMqpDK/p
 vYegziyeoHE16V8dYAAO2dDXkcDI3QkwgJ7eOYn/gSrD3z9IjSLUcStGZHkAV2gznbiY
 adbJXabN74kixuviQp4g5s4Ukf9YcjQqX1jEK+zcVUgkMMuc2Cx81YlbOCFAhkJGxHT0
 znxdUJXoZWbVX9GAgJd6IQ4KFFZNTpGsMdywAvG6a5QF76S1NgSAzUoQJsoMco0VYRQw
 62Pnd4hLR8o10BwOAULypo3J+JEDfplWGEGuR8Rt/SJXplm3dISlsaYW+5qpCQJ3LkjC
 qboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rnqGCxJUTJqTc9XISvXzy1b33K3Q51SfY6gguu8X10g=;
 b=71suK3hQJ614xYoSBvbtmLP25AdtE5yOrNDeAlDgyEu5vQz+B9NbI6tXEUqO1rzUC4
 Qayqk6j5O8wuOpUFsyJxJAa5vue0bPl69Fj6Bj/bT6VPqiCNEydR6AhX1cYgxeqXRxn8
 RSXmJJmgYK4Pk57tPm47/OuzUgbzwUyX8T5GBlE8IH+ypVGI2PshR/onxugDXJ7EhZmW
 0c/aNSBMPlxAnJWCRmPyhZSuesZJWyzhiyMQl6LhpaI6E9iufX/qrj+uyuuWKkz3orGF
 w93f7t/Jxq0v/rYix00VIWELmprdSWndbbKBDVYvE+A4JfqZm3FJRjWzTQfmuptYccsJ
 MH/w==
X-Gm-Message-State: AOAM532ILXoznvxSHlVLJF8mr+fG0q4T1XCUlSDvgWmYwICyqtwV/srb
 u/rZgBHRamUcF93bqZmHUTu3uzYyYXTCtmSJ
X-Google-Smtp-Source: ABdhPJw8Wj8nrNMGTmepSy17kpy1hnzbu5CBfMbAz7Yn2Ph+s1vLPZ7720szjwG28VlTt9BRQGOQhA==
X-Received: by 2002:adf:fb86:: with SMTP id a6mr24641880wrr.35.1638568485937; 
 Fri, 03 Dec 2021 13:54:45 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id q24sm5966889wmj.21.2021.12.03.13.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 13:54:45 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 22:54:37 +0100
Message-Id: <20211203215438.213437-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/2] package/pkg-meson: separate
 infrastructure logic from package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move all logic related to handling meson packages to the
package/pkg-meson file. This now mirrors the other build
systems and keeps the package itself clean.

Correctly prefix variables with PKG_MESON_

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v2->v3:
-   rebase, split up the moving

v1->v2:
-   squash 2 commits, really hard to separate as moving and renaming
    variables from 2 to one location affects alot code.
-   use TOOLCHAIN_POST_INSTALL_STAGING_HOOKS again.
-   consistently use double quotes for sed patterns

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/meson/meson.mk | 38 --------------------------------------
 package/pkg-meson.mk   | 40 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index a8c846126a..5553c15d91 100644
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
index 16a90d157b..4914486665 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -185,9 +185,47 @@ meson-package = $(call inner-meson-package,$(pkgname),$(call UPPERCASE,$(pkgname
 host-meson-package = $(call inner-meson-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
 
 ################################################################################
-# Generation of the Meson cross-compilation.conf file
+# Generation of the Meson compile flags and cross-compilation file
 ################################################################################
 
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
 # Generate a Meson cross-compilation.conf suitable for use with the
 # SDK; also install the file as a template for users to add their
 # own flags if they need to.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
