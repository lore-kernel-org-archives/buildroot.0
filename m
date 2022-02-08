Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE735C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 20:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87447827DD;
	Tue,  8 Feb 2022 20:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ieLLiC5MmzEv; Tue,  8 Feb 2022 20:56:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB13C82893;
	Tue,  8 Feb 2022 20:56:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F1901BF390
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DAF6410D0
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wZHHANIr0cZW for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 20:56:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD298410B6
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 20:56:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1420882DC5; Tue,  8 Feb 2022 20:48:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 8 Feb 2022 21:51:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ecfdc093227c37ed1083e43404b748e8ee8a323
X-Git-Newrev: 0b28ee9267f790792eb8335ee2ceba268ea6152e
X-Patchwork-Hint: ignore
Message-Id: <20220208204854.1420882DC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-external: Allow
 relative paths in BR2_TOOLCHAIN_EXTERNAL_PATH.
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b28ee9267f790792eb8335ee2ceba268ea6152e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Convert BR2_TOOLCHAIN_EXTERNAL_PATH to an absolute path when used.

Otherwise the symbolic links to the external toolchain binaries are
not installed in host/bin when BR2_TOOLCHAIN_EXTERNAL_PATH is relative.
This happens because TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
changes directory into host/bin to create the symbolic links.
From there the tools are no longer found via the relative path and
a single symbolic link host/bin/$(prefix)-* is created instead.

Although relative paths sounds like something less than ideal to put in
a Buildroot configuration, it's actually rather typical to put the
buildroot sources as a submodule (or subdirectory) of custom sources
(either in a BR2_EXTERNAL or not), in which case the relative path is
well-defined.

Signed-off-by: Juergen Stuber <juergen@jstuber.net>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 68d7a3fe21..299b6008aa 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -68,7 +68,7 @@ TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR = $(HOST_DIR)/opt/ext-toolchain
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
 else
-TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
+TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(abspath $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH)))
 endif
 
 ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
