Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A01C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Mar 2022 22:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E613409E1;
	Thu,  3 Mar 2022 22:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m-aXTNBz0oMx; Thu,  3 Mar 2022 22:00:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6B09409DD;
	Thu,  3 Mar 2022 22:00:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B7901BF385
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 22:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80F9F409DD
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 22:00:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kDVWIqlSlhEh for <buildroot@lists.busybox.net>;
 Thu,  3 Mar 2022 22:00:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FC0340363
 for <buildroot@buildroot.org>; Thu,  3 Mar 2022 22:00:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D1F5E8144C; Thu,  3 Mar 2022 21:52:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Mar 2022 22:57:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 610f52f3bea153a3293e67b95f7c4f31e74d2ffd
X-Git-Newrev: 5dc3cfbff11934a3b29f8b2b98aed22ec01e7c42
X-Patchwork-Hint: ignore
Message-Id: <20220303215200.D1F5E8144C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: default to 5.15
 series for _HEADERS_AS_KERNEL / KERNEL_LATEST_VERSION
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

commit: https://git.buildroot.net/buildroot/commit/?id=5dc3cfbff11934a3b29f8b2b98aed22ec01e7c42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #14611

BR2_KERNEL_HEADERS_LATEST_VERSION selects a 5.15.x series kernel (as that is
current LTS), but support for 5.16.x kernel headers has been added, so by
default the "custom kernel headers series" option ends up with 5.16.x (the
first option), leading to confusing errors:

Incorrect selection of kernel headers: expected 5.16.x, got 5.15.x

As a help, default to the correct 5.15.x series when this combination is
used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 248a9a2d97..8543f1cd21 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -127,6 +127,8 @@ endif
 
 choice
 	bool "Custom kernel headers series"
+	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15 if \
+		(BR2_KERNEL_HEADERS_AS_KERNEL && BR2_LINUX_KERNEL_LATEST_VERSION)
 	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_AS_KERNEL || \
 		   BR2_KERNEL_HEADERS_CUSTOM_TARBALL || BR2_KERNEL_HEADERS_CUSTOM_GIT
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
