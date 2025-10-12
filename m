Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E48ACCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 20:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CF2181178;
	Sun, 12 Oct 2025 20:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLOz2TRUBf6O; Sun, 12 Oct 2025 20:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 626D481189
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 626D481189;
	Sun, 12 Oct 2025 20:51:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9A7CBC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB5F940580
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yMtyDH_6BF0 for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 20:51:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AEC364009C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEC364009C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEC364009C
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:51:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D6E18A4C671B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 22:51:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60092)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8328-0000000022e-0h3C
 for buildroot@buildroot.org; Sun, 12 Oct 2025 20:51:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 22:51:12 +0200
Message-ID: <20251012205112.822488-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012205112.822488-1-bernd@kuhls.net>
References: <20251012205112.822488-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760302272;
 bh=wNgR4EFhFd3B/2qrWzX/CKh/oHfY4h4NRGl5cmnuHtE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=APpEw5A1XgT+d0/2SnZtPegun/0MAP9lUciA+OB7ucTXSCyLs5raJIQte8mO1rqjW
 /ZakrRCU8kIfkKfXrYEuL00zS7mEIFcOskBnduwUTYNn6OQAr3Om+PgyYLGxip5XRA
 PMC5CDbwFhXFaX+C8G+TPvDbkfYKjYEG5X+EfqYXmML7DW5aLIplv2TztgyRjRd+Rm
 hplU5mTxPiBlAbagkGI0x/r3DPdsD+SsGIj9RGmm9gDGDG47vN3e6Mw7UenEwKQXCK
 6VKwTaWio2svywIP7bi4Kcl7JdFREP04awVM4/CxmQFd/mReqnZEuZ6TAFnsbVVXDS
 nG7fKYq9G8Row==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=APpEw5A1
Subject: [Buildroot] [PATCH 2/2] package/linux-headers: drop 6.16.x option
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

The 6.16.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 576df20114..a326d782f5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_KERNEL_HEADERS_6_16
+	bool "kernel headers version 6.16.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.16.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_MURATA_CYW_FW_CYW4339_1CK
 	bool "This firmware has been removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 5b56aebb58..de40c6b7b6 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  fdebcb065065f5c1b8dc68a6fb59cda50cdddbf9103d207c2196d55ea764f57f  linux-6.17.2.tar.xz
-sha256  7ca4debc5ca912ebb8a76944a5c118afd5d09e31ef43c494adb14273da29a26e  linux-6.16.12.tar.xz
 sha256  b4850cf670a032c70f38b713a27d62046c5f747caf028c5f50b18f98606a9eb1  linux-6.12.52.tar.xz
 sha256  04c470e130d659ef05217ac695422c28d817d19daa50643fe28b945e6ab646c7  linux-6.6.111.tar.xz
 sha256  c29387aeee085fbcbd91236224b9df805063bac43615e75cea2c6b29604a5c73  linux-6.1.155.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e7ba0cac24..75de52e94a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -54,10 +54,6 @@ config BR2_KERNEL_HEADERS_6_12
 	bool "Linux 6.12.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 
-config BR2_KERNEL_HEADERS_6_16
-	bool "Linux 6.16.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
-
 config BR2_KERNEL_HEADERS_6_17
 	bool "Linux 6.17.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
@@ -468,7 +464,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.155"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.111"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.52"	if BR2_KERNEL_HEADERS_6_12
-	default "6.16.12"	if BR2_KERNEL_HEADERS_6_16
 	default "6.17.2"	if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
