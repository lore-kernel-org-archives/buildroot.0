Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18CFF436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CE6760E21;
	Fri, 17 Apr 2026 15:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNcFfx6rjHt5; Fri, 17 Apr 2026 15:20:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F45560E22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439214;
	bh=WHxa9Ev684LwPa0RX7Y6bu8BroECm7EyIGkVIH+7sbI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lhxs7avoeDzYTD3ckJaSEj6RRxStK/Fas+APnO9O/Jf8r01dp4buektLlUZfo6TTW
	 YiIrN0f25XK3YBJQ3MJ2PDgjtM3x5zyNWAkh2acjRV0uqLBNqwvynSM84aPgsNgGPR
	 bf76s8GhuDTU1he+Me/jQCxRN8P8jdaFyGjkaTRwLGqGPqrijt046ZoptipvJxx6CY
	 hBYCn/zRwXCuVyU1cSmi8R5TxBJ7P85Ykc5yZdg8IFRbSOUPqz8S6KYLxQFIj/VXgB
	 c6uCMISfk8ToE6Hefy1u6zyJRqgmWdAySLtUeqqUssK4UDuG0KZWA/25AJ/R+hV4OW
	 KiIPkZanYjyKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F45560E22;
	Fri, 17 Apr 2026 15:20:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D6B0259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 396C04054F
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzF4q-dTKYfD for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C71E40541
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C71E40541
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2444819B9; Fri, 17 Apr 2026 15:20:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 14:01:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2827b497468b416d01a0077765f46e94e519c743
X-Git-Newrev: 20f7059c1aa30c24f87c0c63d78a3ed05fca9f79
X-Patchwork-Hint: ignore
Message-Id: <20260417152007.E2444819B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ibm-sw-tpm2: add
 upstream patch to fix builds against libopenssl 3.5.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/20f7059c1aa30c24f87c0c63d78a3ed05fca9f79
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 359908d33ccf4b44a8b035f6c3ae6ffc52d40453)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0004-tpm-Update-to-OpenSSL-3.5.patch           | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/ibm-sw-tpm2/0004-tpm-Update-to-OpenSSL-3.5.patch b/package/ibm-sw-tpm2/0004-tpm-Update-to-OpenSSL-3.5.patch
new file mode 100644
index 0000000000..36a9cb97dc
--- /dev/null
+++ b/package/ibm-sw-tpm2/0004-tpm-Update-to-OpenSSL-3.5.patch
@@ -0,0 +1,39 @@
+From 720ed4b8c74c3b517a46b442be9482319ed027dd Mon Sep 17 00:00:00 2001
+From: Ken Goldman <kgold@linux.ibm.com>
+Date: Fri, 18 Apr 2025 13:41:59 -0400
+Subject: [PATCH] tpm: Update to OpenSSL 3.5
+
+Accept 3.5 as a supported version
+
+Signed-off-by: Ken Goldman <kgold@linux.ibm.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+Upstream: https://github.com/kgoldman/ibmswtpm2/commit/720ed4b8c74c3b517a46b442be9482319ed027dd
+---
+ src/BnToOsslMath.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
+index 165304d..5fd5323 100644
+--- a/src/BnToOsslMath.h
++++ b/src/BnToOsslMath.h
+@@ -54,7 +54,7 @@
+ /*    arising in any way out of use or reliance upon this specification or any 	*/
+ /*    information herein.							*/
+ /*										*/
+-/*  (c) Copyright IBM Corp. and others, 2023				  	*/
++/*  (c) Copyright IBM Corp. and others, 2023 - 2025			  	*/
+ /*										*/
+ /********************************************************************************/
+ 
+@@ -77,7 +77,7 @@
+ #include <openssl/ec.h>
+ #include <openssl/bn.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x30400ff0L
++#if OPENSSL_VERSION_NUMBER >= 0x30500ff0L
+ // Check the bignum_st definition against the one below and either update the
+ // version check or provide the new definition for this version.
+ #  error Untested OpenSSL version
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
