Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018EDC433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 17:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92BB583F38;
	Fri, 13 May 2022 17:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2UZFDcmQa6Y; Fri, 13 May 2022 17:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36048826FB;
	Fri, 13 May 2022 17:55:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D930F1BF2CD
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 17:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C810860EC7
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 17:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vvHLGAFWGt3W for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 17:55:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91F2160E2D
 for <buildroot@buildroot.org>; Fri, 13 May 2022 17:55:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3EC0920007;
 Fri, 13 May 2022 17:55:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1npZVw-00B6hd-82; Fri, 13 May 2022 19:55:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 19:55:39 +0200
Message-Id: <20220513175540.2647317-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/linux-headers: drop 5.16.x option
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 5.16.x series is now EOL upstream, so drop the linux-headers option and
add legacy handling for it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 806e995bd1..95b9d784d3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.05"
 
+config BR2_KERNEL_HEADERS_5_16
+	bool "kernel headers version 5.16.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.16.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_KERNEL_HEADERS_4_4
 	bool "kernel headers version 4.4.x are no longer supported"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 2a96eef8d3..3190813a0c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  22f67ef6b12ef6c0c0353be4b90b4bf4b9b18b858c16c346fa495b67ec718c99  linux-5.17.7.tar.xz
-sha256  d8060dc88f862baaae66b42a2dbc12298ed667c698eb5c55617a7786ee47bf25  linux-5.16.20.tar.xz
 sha256  888641634f9e0e38cd0efcfec92ea3c126d381b24a514740d3fe3dc9988fd7ad  linux-5.15.39.tar.xz
 sha256  f5e417b32f89318b6d0a230109a592ffd68997817463dc4692fa49ec7fe42f71  linux-5.10.115.tar.xz
 sha256  0d16d343956d311e3f4ab3f032fd626d8e6b67c0db94edd32f561407d374f2a0  linux-5.4.193.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5ff616fb34..afe849772a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -56,10 +56,6 @@ config BR2_KERNEL_HEADERS_5_15
 	bool "Linux 5.15.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 
-config BR2_KERNEL_HEADERS_5_16
-	bool "Linux 5.16.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
-
 config BR2_KERNEL_HEADERS_5_17
 	bool "Linux 5.17.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
@@ -389,7 +385,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.193"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.115"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.39"	if BR2_KERNEL_HEADERS_5_15
-	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16
 	default "5.17.7"	if BR2_KERNEL_HEADERS_5_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
