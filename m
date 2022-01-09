Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E10AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AB1881779;
	Sun,  9 Jan 2022 11:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TbXihEgNLL_O; Sun,  9 Jan 2022 11:15:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AB18819B4;
	Sun,  9 Jan 2022 11:15:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A8AB1BF370
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0CEB4032A
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cwIQrmyluSfD for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:14:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E52DC4032C
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:14:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8863282BA0; Sun,  9 Jan 2022 11:07:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 12:13:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0894937f7fc4ac9d04d65bc6cdd5fc1927483976
X-Git-Newrev: 98c7ea3ddf11d08acd11e30be36b4b56c682d239
X-Patchwork-Hint: ignore
Message-Id: <20220109110756.8863282BA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cargo.mk: enable -Z
 target-applies-to-host via env
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

commit: https://git.buildroot.net/buildroot/commit/?id=98c7ea3ddf11d08acd11e30be36b4b56c682d239
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This should be more reliable and fix the host == target bug when
doing indirect invocations using the cargo env.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-cargo.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 5f09f39a3f..c8dfc62db2 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -27,9 +27,21 @@ PKG_COMMON_CARGO_ENV = \
 # passing the -Z target-applies-to-host, which is needed together with
 # CARGO_TARGET_APPLIES_TO_HOST to fix build problems when target
 # architecture == host architecture.
+
+# __CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" is to allow
+# using nighly features on stable releases, i.e features that are not
+# yet considered stable.
+#
+# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" "enables the nightly
+# configuration option target-applies-to-host value to be set
+#
+# CARGO_TARGET_APPLIES_TO_HOST="false" is actually setting the value
+# for this feature, which we disable, to make sure builds where target
+# arch == host arch work correctly
 PKG_CARGO_ENV = \
 	$(PKG_COMMON_CARGO_ENV) \
 	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
+	CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
 	CARGO_TARGET_APPLIES_TO_HOST="false"
 
 HOST_PKG_CARGO_ENV = \
@@ -94,7 +106,6 @@ define $(2)_BUILD_CMDS
 			$$(if $$(BR2_ENABLE_DEBUG),--debug,--release) \
 			--manifest-path Cargo.toml \
 			--locked \
-			-Z target-applies-to-host \
 			$$($(2)_CARGO_BUILD_OPTS)
 endef
 else # ifeq ($(4),target)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
