Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D7FC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20C4984099;
	Mon, 19 May 2025 10:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFOAN6nyt4Wz; Mon, 19 May 2025 10:49:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AAFE8409D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AAFE8409D;
	Mon, 19 May 2025 10:49:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38D2BD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0367841812
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQVlNgYv8fdH for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E7D441929
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E7D441929
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37701872E7; Mon, 19 May 2025 10:40:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 09:07:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6cd8f95346aaf7dd7c26e83d263969e5406420bd
X-Git-Newrev: 359908d33ccf4b44a8b035f6c3ae6ffc52d40453
X-Patchwork-Hint: ignore
Message-Id: <20250519104006.37701872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ibm-sw-tpm2: add
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=359908d33ccf4b44a8b035f6c3ae6ffc52d40453
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
