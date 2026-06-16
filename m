Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA85CD98DA
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 15:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAA20852FE;
	Tue, 16 Jun 2026 15:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9el8jkyu_OF; Tue, 16 Jun 2026 15:56:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8423853A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781625404;
	bh=W0+4GJAenrQf1EZDfXozCaIprRTomgk1E3iljk4TWSU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dD2hUKesEnTShijAIqvQGvx9cfT/UjpOVFZ3AALUueUAZIvXPkdpoNPaI1QFy+Hdr
	 trcAlD67mcwfw05MFthFE07WfSaNYLoAdcVdTDyHQBQGl17QsPH4pImIJfxsBYPSX0
	 ghjEaBtepLq+8JdAt6Njb2kJoaX7WpTkt60080aedroLvFn7X6+H5JzibMfDxnfFQi
	 VJE73sJ86iz40ZaniOzXZEu7MmooMMntfXkFixIijKVfW9xnUGtb4aJ2QTCfuGWeEf
	 dy6noCKm0EmM6dpwFEcHrsRmsYTHkziEE2NLZ2LO0vE7LsUXuipf06KYKh3s+FkTaX
	 FRsZhRPh/CV0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8423853A3;
	Tue, 16 Jun 2026 15:56:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFDE1169
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 15:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9817761789
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 15:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tB3qu5Vncd2K for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 15:56:42 +0000 (UTC)
X-Greylist: delayed 351 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 16 Jun 2026 15:56:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A5AB361587
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5AB361587
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=54.252.183.203;
 helo=embla.dev.snart.me; envelope-from=dxdt@dev.snart.me; receiver=<UNKNOWN> 
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5AB361587
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 15:56:42 +0000 (UTC)
Received: from embla.dev.snart.me (localhost [IPv6:::1])
 by embla.dev.snart.me (Postfix) with ESMTP id 7D55C1D484;
 Tue, 16 Jun 2026 15:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 7D55C1D484
Received: from maya.d.snart.me ([182.226.25.243])
 by embla.dev.snart.me with ESMTPSA id /NGvC9lwMWra0AUA8KYfjw
 (envelope-from <dxdt@dev.snart.me>); Tue, 16 Jun 2026 15:50:49 +0000
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 David Timber <dxdt@dev.snart.me>
Date: Wed, 17 Jun 2026 00:49:47 +0900
Message-ID: <20260616154947.315883-1-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=dev.snart.me; s=00; 
 t=1781625050; bh=g/clnw/xV8JyAP9pk12od8NooxJpArNCAALbMCrT91s=;
 h=From:To:Cc:Subject:Date:From;
 b=BpBfKmuk5juRQQoMks27ZA1HYxZB5/ntK4cn/9BJx06pS0KHg0WTxCqBvx8K745W7
 uWZVVUJisub3d+7aLQfEsuqRi15SeTlzxCVROFK9vGwAnumR+0gzGjq9zSr64G2IZD
 MGGgvBvX/RkllrZTPOISVP4mwDddaFw1OB7Lqbtc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=dev.snart.me
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256
 header.s=00 header.b=BpBfKmuk
Subject: [Buildroot] [PATCH] package/exfatprogs: bump to version 1.4.2
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
From: David Timber via buildroot <buildroot@buildroot.org>
Reply-To: David Timber <dxdt@dev.snart.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 package/exfatprogs/Config.in       | 4 ++++
 package/exfatprogs/exfatprogs.hash | 4 ++--
 package/exfatprogs/exfatprogs.mk   | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/exfatprogs/Config.in b/package/exfatprogs/Config.in
index 4f50427a68..07b5f7ed26 100644
--- a/package/exfatprogs/Config.in
+++ b/package/exfatprogs/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_EXFATPROGS
 	bool "exfatprogs"
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # util-linux/libblkid
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  exFAT filesystem userspace utilities.
 
diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
index e73d9d884b..56515cd8f7 100644
--- a/package/exfatprogs/exfatprogs.hash
+++ b/package/exfatprogs/exfatprogs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/exfatprogs/exfatprogs/releases/download/1.2.9/exfatprogs-1.2.9.tar.xz.sha256
-sha256  d9a42197c6ff9e6a8e923789413008e317415cf7a4ab85c486c5ffcaf49ca175  exfatprogs-1.2.9.tar.xz
+# From https://github.com/exfatprogs/exfatprogs/releases/download/1.4.2/exfatprogs-1.4.2.tar.xz
+sha256  47c7c8ddeccbf50d39b903353f2cb3df79134367a4fd764fe2ce3755ff5877bf  exfatprogs-1.4.2.tar.xz
 
 # Hash for license file
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index 638cb9caa4..8bb6bfac00 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFATPROGS_VERSION = 1.2.9
+EXFATPROGS_VERSION = 1.4.2
 EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
 EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
 EXFATPROGS_LICENSE = GPL-2.0+
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
