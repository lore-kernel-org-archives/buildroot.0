Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351D7C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF5EF4035D;
	Mon,  4 Apr 2022 18:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id brYrJk1diV2f; Mon,  4 Apr 2022 18:42:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0DE24027F;
	Mon,  4 Apr 2022 18:42:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57A6F1BF294
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43981410A4
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hKkh0PWpuAOB for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:41:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 603E2410A8
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:41:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C907D81518; Mon,  4 Apr 2022 18:31:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 20:38:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c5f78f8906d8b36e099ca13c257bbaba4b49374
X-Git-Newrev: 4ff6a0587fa733ef6ebf131c095226a606c09420
X-Patchwork-Hint: ignore
Message-Id: <20220404183149.C907D81518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: error if headers
 version is not set
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ff6a0587fa733ef6ebf131c095226a606c09420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Validate that BR2_DEFAULT_KERNEL_VERSION is set when required.

Fixes:
http://autobuild.buildroot.net/results/2b9/2b91cb82a290348843a2422c01b10e49f45be9ca

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Arnout: add BR_BUILDING condition]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/linux-headers/linux-headers.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 1102e76f0f..e2a0b7a7c9 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -33,6 +33,12 @@ LINUX_HEADERS_REPO_URL = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_REPO_URL))
 LINUX_HEADERS_CIP =
 endif # BR2_KERNEL_HEADERS_AS_KERNEL
 
+ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR_BUILDING),yy)
+ifeq ($(LINUX_HEADERS_VERSION),)
+$(error No kernel headers version set, check your BR2_DEFAULT_KERNEL_VERSION setting)
+endif
+endif
+
 # Compute LINUX_HEADERS_SOURCE and LINUX_HEADERS_SITE from the configuration
 ifeq ($(LINUX_HEADERS_CUSTOM_TARBALL),y)
 ifeq ($(BR_BUILDING),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
