Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C170FC433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 19:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ADA48186E;
	Tue,  4 Oct 2022 19:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ADA48186E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZ3uV0Aepv2Q; Tue,  4 Oct 2022 19:55:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A02AF817B3;
	Tue,  4 Oct 2022 19:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A02AF817B3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CE381BF9CB
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 19:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2239E4089C
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 19:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2239E4089C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6L7BVs42_0pt for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 19:54:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CFD840469
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CFD840469
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 19:54:48 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 65F70D2F56
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 19:51:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D40981BF20B;
 Tue,  4 Oct 2022 19:50:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1ofnwN-003uSj-2p; Tue, 04 Oct 2022 21:50:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 21:50:34 +0200
Message-Id: <20221004195039.931947-6-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221004195039.931947-1-peter@korsgaard.com>
References: <20221004195039.931947-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 06/11] package/linux-headers: drop 5.17.x option
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
