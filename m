Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1AFC71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 17:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84EAB408C3;
	Thu, 12 Jun 2025 17:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id peZRTEy_9fm1; Thu, 12 Jun 2025 17:11:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1460408B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1460408B4;
	Thu, 12 Jun 2025 17:11:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03BEF183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 17:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE41B61083
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 17:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6_e3bK1M5n5 for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 17:11:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E44D60FBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E44D60FBD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E44D60FBD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 17:11:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c09e.dip0.t-ipconnect.de [79.214.192.158])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 44B47A4C2AB7;
 Thu, 12 Jun 2025 19:11:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40306)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uPlSQ-0000000068d-1Nq5;
 Thu, 12 Jun 2025 17:11:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Jun 2025 19:11:17 +0200
Message-Id: <20250612171117.3475778-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250612171117.3475778-1-bernd@kuhls.net>
References: <20250612171117.3475778-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749748278;
 bh=JuY12/9qhNay5TPWgDnqP7Z8xWxBBV10MVHta45Am5Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mA6dtQuR65ao/Kca8NPqYuijzxt9Y9NOuP/y/hgdNBfA3ihe6vgeE/xw48LqCNSl6
 AX06Ifq/8Uy4SVz2lX5XxQ69KAwQxrD9hWqxZ76ydAhr1dK8NkKhW2e+lKD3bXtMpr
 /yuXYsjH02D0ied63RyVDODbtYWxPOKz3bfkdPXj8385rWIitHIuBhoDnu+I+sztYz
 4935V10UEdfO1NFHN8rZ+TOZD6COk9GA/GRWNLKwA6BmJY6ToqN01HvgGUBKP0ryv6
 uEONYCwNGCbf0erEAHKkNNif7aK0+A3nGWS8rtsCR3tsSnsexmdNPJOsAfEbihvUY5
 CgkJ4DVF/Le8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=mA6dtQuR
Subject: [Buildroot] [PATCH 4/4] package/linux-headers: drop 6.14.x option
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

The 6.14.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7cb3d945a1..3084e7336e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_KERNEL_HEADERS_6_14
+	bool "kernel headers version 6.14.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.14.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_GPSD_OCEANSERVER
 	bool "gpsd OceanServer removed upstream"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index de6e89dda8..38ba9b474d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  3458cd6a6c508e161dbc5406e72b99d5dbdf929faf704a67db9ba46d07514858  linux-6.15.2.tar.xz
-sha256  3f1ccd0a6dc9c9777cb6fcef357c77e4a2386c84c52b6d5bbcda79c16af33b1b  linux-6.14.11.tar.xz
 sha256  c0a575630f2603a20bb0641f8df8f955e46c9d7ac1fae8b54b21316e6b52a254  linux-6.12.33.tar.xz
 sha256  0d79ff359635e9f009f1e330deed5f3aefd8c452b80660bffdc504b877797719  linux-6.6.93.tar.xz
 sha256  bc3c45faf6f5f0450666c75fa9dad9bc7c0cf7c7cba0dbd94e5cfdc58229c116  linux-6.1.141.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 15ca78c890..d16aa265d8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -48,10 +48,6 @@ config BR2_KERNEL_HEADERS_6_12
 	bool "Linux 6.12.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 
-config BR2_KERNEL_HEADERS_6_14
-	bool "Linux 6.14.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
-
 config BR2_KERNEL_HEADERS_6_15
 	bool "Linux 6.15.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
@@ -454,7 +450,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.141"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.93"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.33"	if BR2_KERNEL_HEADERS_6_12
-	default "6.14.11"	if BR2_KERNEL_HEADERS_6_14
 	default "6.15.2"	if BR2_KERNEL_HEADERS_6_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
