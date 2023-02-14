Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F21DC61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 17:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CDE440BEB;
	Tue, 14 Feb 2023 17:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CDE440BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YEKC36eaB8tD; Tue, 14 Feb 2023 17:17:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7598E40C04;
	Tue, 14 Feb 2023 17:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7598E40C04
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1721A1BF4DB
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 925F440B8A
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 925F440B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OwcbfSG98LvU for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 17:16:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FCCE40B91
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 17:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FCCE40B91
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E09C85E9E; Tue, 14 Feb 2023 17:16:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 18:12:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6634710cdb12ec5b972c2c4068636dfd591cae4d
X-Git-Newrev: e2b70aa9492517717f948f199e99f055a5c1dde1
X-Patchwork-Hint: ignore
Message-Id: <20230214171654.8E09C85E9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 6.0.x option
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2b70aa9492517717f948f199e99f055a5c1dde1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 6.0.x series is now EOL upstream, so drop the linux-headers option and
add legacy handling for it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e2dc854c78..7f69462f2e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_KERNEL_HEADERS_6_0
+	bool "kernel headers version 6.0.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.0.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_KERNEL_HEADERS_4_9
 	bool "kernel headers version 4.9.x are no longer supported"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index ae8b5e5f62..52eb534b40 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  581b0560077863c5116512c0b5fd93b97814092c80e6ebebabe88101949af7a1  linux-6.1.11.tar.xz
-sha256  abe37eb0e2e331bdc7c4110115664e180e7d43b7336de6b4cd2bd1b123d30207  linux-6.0.19.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  e7ed24f2690bf0e11158ccfa8ddc5c0e8a4816d83c4055d205218853da9c5dad  linux-5.15.93.tar.xz
 sha256  d807f97812e566410cd13b3170009e0d7552748d4f22d608ffd4dbd7f85bf9c6  linux-5.10.167.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6970090855..18c179ec8d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -45,10 +45,6 @@ config BR2_KERNEL_HEADERS_5_15
 	bool "Linux 5.15.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 
-config BR2_KERNEL_HEADERS_6_0
-	bool "Linux 6.0.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
-
 config BR2_KERNEL_HEADERS_6_1
 	bool "Linux 6.1.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
@@ -393,7 +389,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.231"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.167"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.93"	if BR2_KERNEL_HEADERS_5_15
-	default "6.0.19"	if BR2_KERNEL_HEADERS_6_0
 	default "6.1.11"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
