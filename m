Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32920C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 10:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9AEA418D4;
	Sat,  9 Apr 2022 10:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-Vaxxn6JPNC; Sat,  9 Apr 2022 10:33:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2435418A4;
	Sat,  9 Apr 2022 10:33:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AAB31BF5A8
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 10:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15C07844A7
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 10:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AiWCsD0ES7Qu for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 10:32:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 233B9844A9
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 10:32:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0BF0B83518; Sat,  9 Apr 2022 10:22:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Apr 2022 12:27:37 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ae4ec7cde64c77ecb27cd7e7d67d6052ae435509
X-Git-Newrev: fabeb698adc3c4006cfa15d439c8a58f0032d548
X-Patchwork-Hint: ignore
Message-Id: <20220409102239.0BF0B83518@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/linux-headers:
 ensure tarball location is set
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

commit: https://git.buildroot.net/buildroot/commit/?id=fabeb698adc3c4006cfa15d439c8a58f0032d548
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Validate that BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION is set when
required.

Fixes:
http://autobuild.buildroot.net/results/f5e/f5e25cbb571c42f8a1728afa856a4fd54f4ad105

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Arnout: add BR_BUILDING condition]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 6c5f78f8906d8b36e099ca13c257bbaba4b49374)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
