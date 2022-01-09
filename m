Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2E4C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D20B60B3A;
	Sun,  9 Jan 2022 11:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g4RxlLUT0vRp; Sun,  9 Jan 2022 11:14:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC9CF60B34;
	Sun,  9 Jan 2022 11:14:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A70361BF969
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 939604032E
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ePNIBBFbnPrO for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:14:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB6B44032A
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:14:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7F7DC82B9C; Sun,  9 Jan 2022 11:07:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 12:13:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5ead094e18cd4a5a9a22b69a42e687f43ee8a8b
X-Git-Newrev: 0894937f7fc4ac9d04d65bc6cdd5fc1927483976
X-Patchwork-Hint: ignore
Message-Id: <20220109110756.7F7DC82B9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cargo.mk: split PKG_CARGO_ENV
 into target/host variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=0894937f7fc4ac9d04d65bc6cdd5fc1927483976
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some variables should only be passed for target packages, such as the
target-applies-to-host variable. Additional target-specific variables
will also be added.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-cargo.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 47ae86bfae..5f09f39a3f 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -20,15 +20,21 @@
 #
 ################################################################################
 
+PKG_COMMON_CARGO_ENV = \
+	CARGO_HOME=$(HOST_DIR)/share/cargo
+
 # __CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS is needed to allow
 # passing the -Z target-applies-to-host, which is needed together with
 # CARGO_TARGET_APPLIES_TO_HOST to fix build problems when target
 # architecture == host architecture.
 PKG_CARGO_ENV = \
-	CARGO_HOME=$(HOST_DIR)/share/cargo \
+	$(PKG_COMMON_CARGO_ENV) \
 	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
 	CARGO_TARGET_APPLIES_TO_HOST="false"
 
+HOST_PKG_CARGO_ENV = \
+	$(PKG_COMMON_CARGO_ENV)
+
 ################################################################################
 # inner-cargo-package -- defines how the configuration, compilation and
 # installation of a cargo package should be done, implements a few hooks
@@ -97,7 +103,7 @@ define $(2)_BUILD_CMDS
 	$$(HOST_MAKE_ENV) \
 		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
 		$$(HOST_CONFIGURE_OPTS) \
-		$$(PKG_CARGO_ENV) \
+		$$(HOST_PKG_CARGO_ENV) \
 		$$($(2)_CARGO_ENV) \
 		cargo build \
 			--offline \
@@ -139,7 +145,7 @@ define $(2)_INSTALL_CMDS
 	$$(HOST_MAKE_ENV) \
 		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
 		$$(HOST_CONFIGURE_OPTS) \
-		$$(PKG_CARGO_ENV) \
+		$$(HOST_PKG_CARGO_ENV) \
 		$$($(2)_CARGO_ENV) \
 		cargo install \
 			--offline \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
