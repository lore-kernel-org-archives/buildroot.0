Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94556C636D4
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 11:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E143818A1;
	Mon, 13 Feb 2023 11:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E143818A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TyO0UO3lAUrt; Mon, 13 Feb 2023 11:58:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CB878183D;
	Mon, 13 Feb 2023 11:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CB878183D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAEC11BF39E
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 11:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C557060F8F
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 11:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C557060F8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ehpn-VCCwWwF for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 11:58:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C429060F77
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C429060F77
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 11:58:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A9274C0010;
 Mon, 13 Feb 2023 11:58:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1pRXTJ-002RcS-DQ; Mon, 13 Feb 2023 12:58:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 12:58:10 +0100
Message-Id: <20230213115812.582772-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230213115812.582772-1-peter@korsgaard.com>
References: <20230213115812.582772-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/linux-headers: drop 4.9.x option
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

The 4.9.x series is now EOL upstream, so drop the linux-headers option and
add legacy handling for it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 6 ------
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 72deb03c35..e2dc854c78 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_KERNEL_HEADERS_4_9
+	bool "kernel headers version 4.9.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 4.9.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_DOCKER_PROXY
 	bool "docker-proxy removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index f797d5a61a..ae8b5e5f62 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -6,7 +6,6 @@ sha256  e7ed24f2690bf0e11158ccfa8ddc5c0e8a4816d83c4055d205218853da9c5dad  linux-
 sha256  d807f97812e566410cd13b3170009e0d7552748d4f22d608ffd4dbd7f85bf9c6  linux-5.10.167.tar.xz
 sha256  8dd0ea7f1db4c1e89d485255798e3c3dfb9be63c0f2af369912a1a37b75f36a8  linux-5.4.231.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  5385aaec55c766e3f462511453f5c63d7898b2d0e9ea74f22a23ebbedab0b3c6  linux-4.9.337.tar.xz
 sha256  a35bcde16b13aa423a1822675775a1b0abf17f5392454febabd8c3757187959a  linux-4.14.305.tar.xz
 sha256  489fb9368bd7ab808264dea1a4acdf607f057bf1ba19f647a17aa18d08f313f9  linux-4.19.272.tar.xz
 # Locally computed
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8a76f93d62..6970090855 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -24,11 +24,6 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on BR2_LINUX_KERNEL
 	select BR2_KERNEL_HEADERS_LATEST if BR2_LINUX_KERNEL_LATEST_VERSION
 
-config BR2_KERNEL_HEADERS_4_9
-	bool "Linux 4.9.x kernel headers"
-	depends on !BR2_riscv
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
-
 config BR2_KERNEL_HEADERS_4_14
 	bool "Linux 4.14.x kernel headers"
 	depends on !BR2_riscv
@@ -393,7 +388,6 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.9.337"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.305"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.272"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.231"	if BR2_KERNEL_HEADERS_5_4
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
