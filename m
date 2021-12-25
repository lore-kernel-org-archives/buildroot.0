Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7243EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 14:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB50F605D8;
	Sat, 25 Dec 2021 14:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJc9ElWp8QYd; Sat, 25 Dec 2021 14:59:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ED776060A;
	Sat, 25 Dec 2021 14:59:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 26EBD1BF239
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 14:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EEC24056B
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 14:59:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0JwHYO02Lou2 for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 14:59:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0788540110
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 14:59:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 40F4182A75; Sat, 25 Dec 2021 14:54:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Dec 2021 15:59:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 443abba065d396514de73535898a91993f377afa
X-Git-Newrev: b98ed34072f07f0c367b23d1e018f5b9487b3c34
X-Patchwork-Hint: ignore
Message-Id: <20211225145403.40F4182A75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: fix xtensa overlay for gcc
 ccache hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=b98ed34072f07f0c367b23d1e018f5b9487b3c34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b3b60706221d (arch/xtensa: allow specifying path to tarball file)
missed a place where the xtensa overlay was referenced, thus breaking
the calculation for the ccache hash.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index fcc352aa25..3adc1d4e16 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -283,7 +283,7 @@ HOST_GCC_COMMON_CCACHE_HASH_FILES += \
 		$(addsuffix /gcc/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
 		$(addsuffix /gcc/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
 ifeq ($(BR2_xtensa),y)
-HOST_GCC_COMMON_CCACHE_HASH_FILES += $(ARCH_XTENSA_OVERLAY_TAR)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += $(ARCH_XTENSA_OVERLAY_FILE)
 endif
 
 # _CONF_OPTS contains some references to the absolute path of $(HOST_DIR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
