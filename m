Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C5DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 10:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F76F41E0A;
	Sat,  9 Apr 2022 10:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_33s1K8rEsT; Sat,  9 Apr 2022 10:32:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9F1C41DFE;
	Sat,  9 Apr 2022 10:32:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB19F1BF5A8
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 10:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C682541E04
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 10:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7u5mYdBtUl8 for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 10:32:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1783F41DFB
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 10:32:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F3BA283515; Sat,  9 Apr 2022 10:22:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Apr 2022 12:26:57 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8945ba49480a7885d104445ca855ef7681a374ff
X-Git-Newrev: ae4ec7cde64c77ecb27cd7e7d67d6052ae435509
X-Patchwork-Hint: ignore
Message-Id: <20220409102238.F3BA283515@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 toolchain-external-custom: error if BR2_TOOLCHAIN_EXTERNAL_URL is not set
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae4ec7cde64c77ecb27cd7e7d67d6052ae435509
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Arnout: add BR_BUILDING condition]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d9a9d4df2b84350f7014b33b50af120c3915f4b5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external-custom/toolchain-external-custom.mk           | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/toolchain-external-custom.mk b/toolchain/toolchain-external/toolchain-external-custom/toolchain-external-custom.mk
index c4ae6125ef..f2ec01f88c 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/toolchain-external-custom.mk
+++ b/toolchain/toolchain-external/toolchain-external-custom/toolchain-external-custom.mk
@@ -10,6 +10,11 @@ TOOLCHAIN_EXTERNAL_CUSTOM_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERN
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CUSTOM),y)
 # We can't check hashes for custom downloaded toolchains
 BR_NO_CHECK_HASH_FOR += $(TOOLCHAIN_EXTERNAL_SOURCE)
+ifeq ($(BR_BUILDING)$(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),yy)
+ifeq ($(TOOLCHAIN_EXTERNAL_CUSTOM_SOURCE),)
+$(error No external toolchain url set, check your BR2_TOOLCHAIN_EXTERNAL_URL setting)
+endif
+endif
 endif
 
 $(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
