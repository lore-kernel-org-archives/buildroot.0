Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFDCC4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 17:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1255860844;
	Thu, 11 Apr 2024 17:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64eksnkDV__3; Thu, 11 Apr 2024 17:44:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1031C608F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1031C608F4;
	Thu, 11 Apr 2024 17:44:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A960A1BF3FC
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 17:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95B0F41EC9
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 17:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDJRlRanFvOx for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 17:44:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57B8F41EC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57B8F41EC5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57B8F41EC5
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 17:44:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1be10.dip0.t-ipconnect.de [84.161.190.16])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4611DA4C3232
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 19:44:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48060)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1ruyTT-000000002Ll-31j0
 for buildroot@buildroot.org; Thu, 11 Apr 2024 17:44:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 19:44:35 +0200
Message-Id: <20240411174435.2499446-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240411174435.2499446-1-bernd@kuhls.net>
References: <20240411174435.2499446-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712857476;
 bh=oLKUtyPUBoHfZULOgI6ByBUFMWXiHw23VJUVRaFphBc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IkKOX4NI97SU/vicx/ugh5yTV7a5k2f8zY41LVRbsHrljX9daYBv0JAUMIxNcQDrT
 QH/zImaTAhkSKEMh8IyNEKvOLk7N2ZKKpa+ojzJaDDiaoZ/KSQsvIkCVRVT4J03TmF
 7PSYMJFSWzKgvBMypjEAeHToonsZJH+99zSXKSJP5jMhwlW4RZGms3XjbmOBGbi0/H
 btE8Af4rcDIBBYHpruaf61lvzAsij0eJBR0m430Or0Fi1dDx2FQOHgm6/Cdmg+aLFw
 V0C7XUMCyQwijR/+ZlEoMl3FSbgBrPXTO6O9FnlbgQh7gOruv98oIyHPdOtULziKBZ
 /5R9R/zhsMiOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=IkKOX4NI
Subject: [Buildroot] [PATCH 2/2] package/linux-headers: drop 6.7.x option
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

The 6.7.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 76af1da348..98a4125f4b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_KERNEL_HEADERS_6_7
+	bool "kernel headers version 6.7.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.7.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_TARGET_TI_K3_IMAGE_GEN
 	bool "ti-k3-image-gen removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index e382ba48e7..0c77282fa6 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  138923e5d73748b4bdbe9b5a0b8f36dfac9fcc16753a9222928dc6c963effa89  linux-6.8.5.tar.xz
-sha256  6c2979e3948806a0dbacba193f8453ea42c179c1eb9f6136e3c35d87e5707984  linux-6.7.12.tar.xz
 sha256  af54b449f4fb93b8e8daa346144a7309e8e95174bd962c4b5917cf56120456d9  linux-6.6.26.tar.xz
 sha256  33fe9bcc597c60021a2b2abacd4e0f6f546200ab99594c9a07ad600258b86274  linux-6.1.85.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0091afd39c..9b75375879 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -48,10 +48,6 @@ config BR2_KERNEL_HEADERS_6_6
 	bool "Linux 6.6.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 
-config BR2_KERNEL_HEADERS_6_7
-	bool "Linux 6.7.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
-
 config BR2_KERNEL_HEADERS_6_8
 	bool "Linux 6.8.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
@@ -425,7 +421,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.154"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.85"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.26"	if BR2_KERNEL_HEADERS_6_6
-	default "6.7.12"	if BR2_KERNEL_HEADERS_6_7
 	default "6.8.5"		if BR2_KERNEL_HEADERS_6_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
