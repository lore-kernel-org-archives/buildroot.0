Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAA9C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 665FF4032D;
	Sun,  9 Jan 2022 11:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SEZHPuiXxXhk; Sun,  9 Jan 2022 11:14:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAA184032B;
	Sun,  9 Jan 2022 11:14:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C30D01BF96B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF41B60B34
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XmitFu6jZoac for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:14:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 005E260B27
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:14:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9AD6A82B96; Sun,  9 Jan 2022 11:07:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 12:13:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91a5a2d317a02d7fb41e706a490fe5063039d55c
X-Git-Newrev: b6378631c2609742382984f6f7b93c1d9d2cdb78
X-Patchwork-Hint: ignore
Message-Id: <20220109110756.9AD6A82B96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cargo.mk: use
 CARGO_TARGET_<target>_LINKER instead of cargo config file
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6378631c2609742382984f6f7b93c1d9d2cdb78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

package/rustc/rustc.mk produces a config file in $(CARGO_HOME) that
points to the linker. We can simplify that by using the
CARGO_TARGET_<target>_LINKER environment variable.

This will also fix problems when host == target, where the target
linker gets picked up incorrectly.

Fixes:

  http://autobuild.buildroot.net/results/2183f1835f2ef553e45e83959910205127b2b259/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-cargo.mk          |  3 ++-
 package/rustc/cargo-config.in |  2 --
 package/rustc/rustc.mk        | 12 ------------
 3 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 7f63595831..77d2f66b17 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -43,7 +43,8 @@ PKG_CARGO_ENV = \
 	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
 	CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
 	CARGO_TARGET_APPLIES_TO_HOST="false" \
-	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)"
+	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
+	CARGO_TARGET_$(subst,-,_,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
 
 HOST_PKG_CARGO_ENV = \
 	$(PKG_COMMON_CARGO_ENV)
diff --git a/package/rustc/cargo-config.in b/package/rustc/cargo-config.in
deleted file mode 100644
index 47fad026be..0000000000
--- a/package/rustc/cargo-config.in
+++ /dev/null
@@ -1,2 +0,0 @@
-[target.@RUSTC_TARGET_NAME@]
-linker = "@CROSS_PREFIX@gcc"
diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk
index 52860b7eff..0513dd0b40 100644
--- a/package/rustc/rustc.mk
+++ b/package/rustc/rustc.mk
@@ -20,15 +20,3 @@ endif
 RUSTC_HOST_NAME = $(RUSTC_HOST_ARCH)-unknown-linux-gnu
 
 $(eval $(host-virtual-package))
-
-ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
-define RUSTC_INSTALL_CARGO_CONFIG
-	mkdir -p $(HOST_DIR)/share/cargo
-	sed -e 's/@RUSTC_TARGET_NAME@/$(RUSTC_TARGET_NAME)/' \
-		-e 's/@CROSS_PREFIX@/$(notdir $(TARGET_CROSS))/' \
-		package/rustc/cargo-config.in \
-		> $(HOST_DIR)/share/cargo/config
-endef
-# check-package disable TypoInPackageVariable - TOOLCHAIN intended
-TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += RUSTC_INSTALL_CARGO_CONFIG
-endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
