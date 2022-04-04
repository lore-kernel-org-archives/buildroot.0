Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9715FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DEE760FE2;
	Mon,  4 Apr 2022 18:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bd8qxkJjqsQA; Mon,  4 Apr 2022 18:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EBF160AF4;
	Mon,  4 Apr 2022 18:41:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E612A1BF294
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3D62827A9
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:41:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gCO5Agvqa0iS for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:41:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54E588278F
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:41:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BD17781530; Mon,  4 Apr 2022 18:31:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 20:37:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9a9d4df2b84350f7014b33b50af120c3915f4b5
X-Git-Newrev: 6c5f78f8906d8b36e099ca13c257bbaba4b49374
X-Patchwork-Hint: ignore
Message-Id: <20220404183149.BD17781530@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: ensure tarball
 location is set
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c5f78f8906d8b36e099ca13c257bbaba4b49374
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Validate that BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION is set when
required.

Fixes:
http://autobuild.buildroot.net/results/f5e/f5e25cbb571c42f8a1728afa856a4fd54f4ad105

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Arnout: add BR_BUILDING condition]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/linux-headers/linux-headers.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index a8d1c2ccaf..1102e76f0f 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -35,6 +35,11 @@ endif # BR2_KERNEL_HEADERS_AS_KERNEL
 
 # Compute LINUX_HEADERS_SOURCE and LINUX_HEADERS_SITE from the configuration
 ifeq ($(LINUX_HEADERS_CUSTOM_TARBALL),y)
+ifeq ($(BR_BUILDING),y)
+ifeq ($(LINUX_HEADERS_CUSTOM_TARBALL_LOCATION),)
+$(error No kernel headers tarball location set, check your BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION setting)
+endif
+endif
 LINUX_HEADERS_SOURCE = $(notdir $(LINUX_HEADERS_CUSTOM_TARBALL_LOCATION))
 LINUX_HEADERS_SITE = $(patsubst %/,%,$(dir $(LINUX_HEADERS_CUSTOM_TARBALL_LOCATION)))
 else ifeq ($(LINUX_HEADERS_CUSTOM_GIT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
