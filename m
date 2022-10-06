Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E76C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 18:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0F5683FBF;
	Thu,  6 Oct 2022 18:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0F5683FBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IS58WdQ_YAfK; Thu,  6 Oct 2022 18:02:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBDBD83FBC;
	Thu,  6 Oct 2022 18:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBDBD83FBC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96E731BF3FB
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44E7D83FBA
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44E7D83FBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mw3LvZxf2HfG for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4426883FB5
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4426883FB5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 331908693A; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 19:53:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 374e39b6344246b94d58750bcf20f3f61f8e9078
X-Git-Newrev: 9647bf80a9375f508cdc0f32307e64071b9e0b74
X-Patchwork-Hint: ignore
Message-Id: <20221006175949.331908693A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 5.17.x option
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

commit: https://git.buildroot.net/buildroot/commit/?id=9647bf80a9375f508cdc0f32307e64071b9e0b74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 5.17.x series is now EOL upstream, so drop the linux-headers option and
add legacy handling for it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 package/linux-headers/Config.in.host | 5 -----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 93d921160a..0e63d59a98 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.11"
 
+config BR2_KERNEL_HEADERS_5_17
+	bool "kernel headers version 5.17.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.17.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_iwmmxt
 	bool "ARM iwmmxt variant removed"
 	select BR2_LEGACY
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4847cd4c87..7aee67de56 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -53,10 +53,6 @@ config BR2_KERNEL_HEADERS_5_15
 	bool "Linux 5.15.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 
-config BR2_KERNEL_HEADERS_5_17
-	bool "Linux 5.17.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
-
 config BR2_KERNEL_HEADERS_5_19
 	bool "Linux 5.19.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
@@ -402,7 +398,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.212"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.142"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.67"	if BR2_KERNEL_HEADERS_5_15
-	default "5.17.15"	if BR2_KERNEL_HEADERS_5_17
 	default "5.19.13"	if BR2_KERNEL_HEADERS_5_19
 	default "6.0"		if BR2_KERNEL_HEADERS_6_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
