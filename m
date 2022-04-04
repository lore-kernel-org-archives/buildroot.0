Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B38C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EC27410AD;
	Mon,  4 Apr 2022 18:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wm4KuZatISaq; Mon,  4 Apr 2022 18:41:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DAF9410A8;
	Mon,  4 Apr 2022 18:41:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E78F1BF9AD
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A2C3410A9
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FBcOB7UvNfLZ for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:41:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41958410A4
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:41:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A6BE581518; Mon,  4 Apr 2022 18:31:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 20:23:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e67d335f0e46cf58e4040684208a1373683d8339
X-Git-Newrev: 8e91385a2cb81c5f8114354f4494230e2aebb93a
X-Patchwork-Hint: ignore
Message-Id: <20220404183149.A6BE581518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-external: error if
 BR2_TOOLCHAIN_EXTERNAL_PATH is not set
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e91385a2cb81c5f8114354f4494230e2aebb93a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Arnout: add BR_BUILDING condition]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 299b6008aa..c7f4175c9e 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -69,7 +69,12 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
 else
 TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(abspath $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH)))
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL)$(BR_BUILDING),yy)
+ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
+$(error No external toolchain path set, check your BR2_TOOLCHAIN_EXTERNAL_PATH setting)
+endif
 endif
+endif # BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
 
 ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
 ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
