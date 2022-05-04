Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C5AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 08:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E218D8149C;
	Wed,  4 May 2022 08:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DeDU23QqjV41; Wed,  4 May 2022 08:22:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 111998148E;
	Wed,  4 May 2022 08:22:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6CF31BF475
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 08:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4A2140218
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 08:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6CE6JE9QVhKI for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 08:22:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 302FE4013D
 for <buildroot@buildroot.org>; Wed,  4 May 2022 08:22:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CAA2010000A;
 Wed,  4 May 2022 08:22:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nmAGn-00DTjI-K5; Wed, 04 May 2022 10:22:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  4 May 2022 10:21:56 +0200
Message-Id: <20220504082157.3212469-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504082157.3212469-1-peter@korsgaard.com>
References: <20220504082157.3212469-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/linux-headers: drop 4.4.x option
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

The 4.4.x series is now EOL upstream, so drop the linux-headers option and
add legacy handling for it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 7 -------
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6d2c82ab7f..806e995bd1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.05"
 
+config BR2_KERNEL_HEADERS_4_4
+	bool "kernel headers version 4.4.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 4.4.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_BINUTILS_VERSION_2_32_X
 	bool "binutils 2.32.x has been removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 077bc4d4d7..7a3308546f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -4,7 +4,6 @@ sha256  18bf091a2157faa8d92a1aba2ecb66b5124bb0e033fc7797343984e069a2c026  linux-
 sha256  82516a02bb52456f6e8057217dde6e02b78003b1e058117557c2ae9661696dfc  linux-5.10.113.tar.xz
 sha256  288ca85fcdad18e950ccbe3d640594ee36d5aac226321ed935076fadb0cc0a3a  linux-5.4.191.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  35017bb40b604e0b577fc2b87e727632b46608a2ba3a4f5858b9177f58f376b3  linux-4.4.302.tar.xz
 sha256  fa2fb1fb5ba2e6ed99603063474804bd5fddeb8a5ad769d47786f82109e5c627  linux-4.9.312.tar.xz
 sha256  e3dcacc2459c91586ae94121f54eb54a7cae9c424766fe20498169f682fd1b15  linux-4.14.277.tar.xz
 sha256  4c6269d3c14e593151b035a55227110e632642d848032ef6992135c18488fe13  linux-4.19.241.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 229c5a0ca8..b030996dff 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -27,12 +27,6 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on BR2_LINUX_KERNEL
 	select BR2_KERNEL_HEADERS_LATEST if BR2_LINUX_KERNEL_LATEST_VERSION
 
-config BR2_KERNEL_HEADERS_4_4
-	bool "Linux 4.4.x kernel headers"
-	depends on !BR2_riscv
-	depends on !BR2_csky
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
-
 config BR2_KERNEL_HEADERS_4_9
 	bool "Linux 4.9.x kernel headers"
 	depends on !BR2_riscv
@@ -381,7 +375,6 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.302"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.312"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.277"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.241"	if BR2_KERNEL_HEADERS_4_19
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
