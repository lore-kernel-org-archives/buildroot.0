Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEACC433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 19:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 447566F4AD;
	Fri, 27 May 2022 19:12:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5xno3jZ80-c; Fri, 27 May 2022 19:12:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32EF96F4AE;
	Fri, 27 May 2022 19:12:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4321C1C1162
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6768342996
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pi0_FptzP9Hz for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61882429B0
 for <buildroot@buildroot.org>; Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7637D866BE; Fri, 27 May 2022 19:00:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 21:02:09 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a5841c18a45cf08146450fd0e0b510a02359253d
X-Git-Newrev: 4f5570f032d4efacff400d2173b472eca56c5675
X-Patchwork-Hint: ignore
Message-Id: <20220527190009.7637D866BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Revert
 "toolchain/toolchain-external: error if BR2_TOOLCHAIN_EXTERNAL_PATH is not
 set"
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f5570f032d4efacff400d2173b472eca56c5675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This reverts commit 8e91385a2cb81c5f8114354f4494230e2aebb93a.

This commit is incorrect, as it is perfectly valid for
BR2_TOOLCHAIN_EXTERNAL_PATH to be empty. The help text of
BR2_TOOLCHAIN_EXTERNAL_PATH even documents it as a supported case:

          If empty, the compiler will be searched in $PATH.

Commit 392b0a26f5fd8d3aedce7e0c15f9762a79312f01 ("toolchain-external:
default BR2_TOOLCHAIN_EXTERNAL_PATH to empty") even made that the
default saying "In addition, it in fact works correctly when it is
empty. In that case, the toolchain will be searched in PATH."

A user has reported that commit
8945ba49480a7885d104445ca855ef7681a374ff (the backport of 8e91385a2c to
the 2022.02.x LTS branch) breaks his use-case:

  https://lore.kernel.org/buildroot/CADBnMvhgaozAgZgy3njckjL1i0U6bZ0fLrq-kdFF-qpGhFWgmw@mail.gmail.com/

Reported-by: Kristof Havasi <havasiefr@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: reference 8e91385a2c on master]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 77fc4580254997c1f9f83efabd061e81de0b022e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index c7f4175c9e..299b6008aa 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -69,12 +69,7 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
 else
 TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(abspath $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH)))
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL)$(BR_BUILDING),yy)
-ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
-$(error No external toolchain path set, check your BR2_TOOLCHAIN_EXTERNAL_PATH setting)
-endif
 endif
-endif # BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
 
 ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
 ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
