Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BADC71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 17:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A08E60603;
	Thu, 12 Jun 2025 17:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TymowDlxodFZ; Thu, 12 Jun 2025 17:11:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A1AF60BC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A1AF60BC1;
	Thu, 12 Jun 2025 17:11:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2581D1BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 17:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 170BE83AA4
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 17:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1HnoAJmnLeK for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 17:11:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77835820CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77835820CC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77835820CC
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 17:11:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c09e.dip0.t-ipconnect.de [79.214.192.158])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 25506A4C2AB9;
 Thu, 12 Jun 2025 19:11:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40306)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uPlSQ-0000000068d-0u8v;
 Thu, 12 Jun 2025 17:11:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Jun 2025 19:11:16 +0200
Message-Id: <20250612171117.3475778-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250612171117.3475778-1-bernd@kuhls.net>
References: <20250612171117.3475778-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749748278;
 bh=F58wHWl1las5tUr3XpD/p5k7F5tsZwBhFDOb2S0Psfo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y2RgX+IDGheRnGhZdaMaPfCrCXuHazLhIMDS6qjflNs1SBtRR0DEqeHzibBp3UvtC
 FjbK/8Q59i4d4FXNuZoeSeZktTzPB7JvUx0Sy1u37KQzvtPJ3wZ4WJDJLVnWI39UeM
 WJ8ZzUblLqrLwYAYsJD+xdm8cjOn4fTTBcNFPkb/Hd29UeIPGbOqA0ZVqXxfSgBkm+
 dJo30ZfbnJTzHQWk23Medr/BvZM1jjUFqb9KvRtWh/uhs97FfuW72i3ZdKPHcqSkjh
 +UMYOgWU/JEaO9LVtFK/N0u7Yd4JcHfZGEMMc1yLBbfJ4jEJA1uMl5N2oYb9lnLJ9f
 Ioe2abLNqlJZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=Y2RgX+ID
Subject: [Buildroot] [PATCH 3/4] linux: bump latest version to 6.15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ef81474ffc..0ac84aa4b4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.14)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.15)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15 if BR2_KERNEL_HEADERS_AS_KERNEL
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.14.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.15.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
