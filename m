Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7391FC54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 13:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39D0740A06;
	Mon, 18 Mar 2024 13:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lUx7aGzhYJp8; Mon, 18 Mar 2024 13:32:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CAA940A66
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CAA940A66;
	Mon, 18 Mar 2024 13:32:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 727A21BF363
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 804CE40A07
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l4SEJWHgtCQM for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 13:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9631440608
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9631440608
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 13:32:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9147882A14; Mon, 18 Mar 2024 13:32:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 14:26:03 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 19fadb7db083752afb3b8dfee6480c4433539450
X-Git-Newrev: 1f80b009be9444033d9fef2be7acff158dd22401
X-Patchwork-Hint: ignore
Message-Id: <20240318133246.9147882A14@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] boot/shim: force arm mode
 instead of Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f80b009be9444033d9fef2be7acff158dd22401
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Use OPTIMIZATIONS parameter to pass -marm to fix the following build
failure in Thumb mode:

/tmp/ccEjPM4h.s:941: Error: selected processor does not support `mrc p15,0,r2,c9,c13,0' in Thumb mode

CFLAGS can't be overridden as it is defined as:
CFLAGS		= $(FEATUREFLAGS) \
		  $(OPTIMIZATIONS) \
		  $(WARNFLAGS) \
		  $(if $(findstring clang,$(CC)),$(CLANG_WARNINGS)) \
		  $(ARCH_CFLAGS) \
		  $(WERRFLAGS) \
		  $(INCLUDES) \
		  $(DEFINES)

Fixes:
 - http://autobuild.buildroot.org/results/580156f89cfd72122fef07aa2fe37b4fdd4c316b
 - http://autobuild.buildroot.org/results/8980c0f422516c7263d8d0c9cc6123f30c4b7ee4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 66a202325a98a48013bad70de29d88f733ce5903)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/shim/shim.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/boot/shim/shim.mk b/boot/shim/shim.mk
index 19b11f4086..ae57677320 100644
--- a/boot/shim/shim.mk
+++ b/boot/shim/shim.mk
@@ -13,10 +13,19 @@ SHIM_CPE_ID_VENDOR = redhat
 SHIM_INSTALL_TARGET = NO
 SHIM_INSTALL_IMAGES = YES
 
+SHIM_CFLAGS = $(TARGET_CFLAGS)
 SHIM_MAKE_OPTS = \
 	ARCH="$(GNU_EFI_PLATFORM)" \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	DASHJ="-j$(PARALLEL_JOBS)"
+	DASHJ="-j$(PARALLEL_JOBS)" \
+	OPTIMIZATIONS="$(SHIM_CFLAGS)"
+
+# shim has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `mrc p15,0,r2,c9,c13,0' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+SHIM_CFLAGS += -marm
+endif
 
 define SHIM_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(SHIM_MAKE_OPTS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
