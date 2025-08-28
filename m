Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7CDCA0FF6
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 21:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1FB7412FA;
	Thu, 28 Aug 2025 21:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXQZE8AWu8ko; Thu, 28 Aug 2025 21:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 855934123A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 855934123A;
	Thu, 28 Aug 2025 21:58:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2C2E6C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 21:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2C1884074
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 21:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0oMvYrim_Ste for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 21:58:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8DF9784072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DF9784072
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DF9784072
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 21:58:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B45CC1A0C87
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 21:58:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 833A760303
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 21:58:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E12ED1C22D34D; 
 Thu, 28 Aug 2025 23:58:34 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Aug 2025 23:58:17 +0200
Message-ID: <20250828215818.364295-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756418321; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=gQ2hvb0KIMN2cW/jX5Asa2Mu4qFWbAxq1epnK/tqMyU=;
 b=G8+CfO7vRnqVrhBb3BOtRwTf60yRfqXojER7w9nocmYViBXphAFrahnWQCT9c0skoZOjpt
 9NXxn8gfzUXBjQPDKup5/t/11dcu9L4GX7k8jiQgKqi62WboEHfnO62ua1b3vA2b8E1gnL
 rHSClaD2LqT7idmN1SsRAaNEBKSN93UCMP+jmUdbYRUlVZYEFlePqTpmYugIBnYnxITIOi
 g5Zty6pWNkATaLaFXyZZ0zsnxkT173HVy2hKk1uxIMg7f8XPNck0rjxstXw/KjW9T2gwr1
 6F7XnO398brjwZgAEHwUGguxs92f+nJsMyZX44MtCgLqaQOMMV7d99Ta+129EA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=G8+CfO7v
Subject: [Buildroot] [PATCH] package/lirc-tools: fix build with GCC 14.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since glibc 2.28, <sys/sysmacros.h> is no longer implicitly included
by <sys/types.h>, which means major() is only defined is you include
<sys/sysmacros.h>.

This wasn't really visible for a while in loadable plugins built by
lirc-tools as they could happily be built with undefined
symbols... except they would fail to load at runtime.

But then GCC 14.x brought more strict checking of having the function
prototype around, which now detects this issue at build time.

So the actual issue has been around since we switched to glibc 2.28,
but it only started failing to build since gcc 14.x. The first failure
is on August 2024, so this patch should be backported to our stable
branches.

The fix is backport from an upstream commit, post 0.10.2.

Fixes:

  https://autobuild.buildroot.net/results/2f64accd430d9467add3f1195f3f59eff8e99a4d/

Minimal reproducer:

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_LIRC_TOOLS=y
 # BR2_TARGET_ROOTFS_TAR is not set

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...03-Fix-default.so-plugin-not-loading.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/lirc-tools/0003-Fix-default.so-plugin-not-loading.patch

diff --git a/package/lirc-tools/0003-Fix-default.so-plugin-not-loading.patch b/package/lirc-tools/0003-Fix-default.so-plugin-not-loading.patch
new file mode 100644
index 0000000000..3b2d536055
--- /dev/null
+++ b/package/lirc-tools/0003-Fix-default.so-plugin-not-loading.patch
@@ -0,0 +1,39 @@
+From 515325a90a9007fa12737c93c5c47ffaf6fea983 Mon Sep 17 00:00:00 2001
+From: Milan Vit <milanvit@milanvit.net>
+Date: Fri, 24 May 2024 18:34:26 +0900
+Subject: [PATCH] Fix default.so plugin not loading
+
+Upstream: 5d9e0f17436a98aedd0da885bd0096e147e54423
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ lib/drv_enum.c    | 1 +
+ plugins/default.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/lib/drv_enum.c b/lib/drv_enum.c
+index 5fd74d0c..45abaa19 100644
+--- a/lib/drv_enum.c
++++ b/lib/drv_enum.c
+@@ -14,6 +14,7 @@
+ #include <stdbool.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <dirent.h>
+ #include <errno.h>
+ 
+diff --git a/plugins/default.c b/plugins/default.c
+index 79c942d6..37cba788 100644
+--- a/plugins/default.c
++++ b/plugins/default.c
+@@ -26,6 +26,7 @@
+ #include <stdint.h>
+ #include <stdlib.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
