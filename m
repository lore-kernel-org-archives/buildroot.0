Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEB8C25B06
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 20:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EFC340141;
	Thu,  4 Aug 2022 20:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EFC340141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id feqpI91gQk2X; Thu,  4 Aug 2022 20:36:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52FB340338;
	Thu,  4 Aug 2022 20:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52FB340338
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E89E1BF402
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 20:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5C8360E90
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 20:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5C8360E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wq-DXB__5T4Q for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 20:36:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B437C60D62
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B437C60D62
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 20:36:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id A6890240002;
 Thu,  4 Aug 2022 20:36:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu,  4 Aug 2022 22:35:54 +0200
Message-Id: <20220804203555.29029-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220804203555.29029-1-thomas.petazzoni@bootlin.com>
References: <20220804203555.29029-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659645362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4/FZ6/XIwNufjcpQaeQbEyeZKTQYlDKyS6jBaqEE4/k=;
 b=UjL52b0ATqTl+v+UyNd/+qWA3fLQ0f6B0i5kjWcYQLuLYp0e8huTtEFArZ+LGXvhsFm1uH
 cbVi3kVvp2ynbw6bEUTJX6b8gmhz0QXJc6N13/7sEC7GMlauyto1besLGrrAx7c+iWCPud
 PAdoyXPD5gMPTQQRnxNOo2j6hBajakJN6oB+zfZrW6TcWb2ui5wyErwfkUqcYY5DWfiXtK
 pvnK+kKGL2W6773eK5VjTxFo+2Q5Hz7Y+Eii7VhGw5RBzI6cHrTgQxTAtYVVjzZslh1eew
 0Vxr+U347KF1Bdj5QKkGbK11HlMnQciNK+Q5CBBHhezYYYFKaI7rbgxg4efbQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UjL52b0A
Subject: [Buildroot] [PATCH 2/2] package/pistache: enable on uClibc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Ruschival <thomas@ruschival.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pistache couldn't build on uClibc due to just one missing
definition. In addition, the Config.in comment was wrong as it said
that a glibc toolchain was needed, while in fact it could be glibc or
musl.

Cc: Thomas Ruschival <thomas@ruschival.de>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...port.cc-fallback-value-for-RUSAGE_TH.patch | 33 +++++++++++++++++++
 package/pistache/Config.in                    |  4 +--
 2 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch

diff --git a/package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch b/package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch
new file mode 100644
index 0000000000..327933e26d
--- /dev/null
+++ b/package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch
@@ -0,0 +1,33 @@
+From 5feed6d2f86750bfe1e7c26d6fd4e8d2195ea81f Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 4 Aug 2022 19:54:23 +0200
+Subject: [PATCH] src/common/transport.cc: fallback value for RUSAGE_THREAD
+
+uClibc-ng currently does not define RUSAGE_THREAD, so let's add a
+fallback value until it gets fixed in uClibc-ng. The value is the same
+on all Linux systems, regardless of the CPU architecture.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream bug: https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/MEXOUSFSH46UFS3AEMEIEPTL5U4HVEFL/
+---
+ src/common/transport.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/common/transport.cc b/src/common/transport.cc
+index 62efb8c..0f3abb0 100644
+--- a/src/common/transport.cc
++++ b/src/common/transport.cc
+@@ -515,6 +515,10 @@ namespace Pistache::Tcp
+ 
+         rusage now;
+ 
++#if !defined(RUSAGE_THREAD)
++#define RUSAGE_THREAD 1
++#endif
++
+         auto res = getrusage(RUSAGE_THREAD, &now);
+         if (res == -1)
+             loadRequest_.reject(std::runtime_error("Could not compute usage"));
+-- 
+2.37.1
+
diff --git a/package/pistache/Config.in b/package/pistache/Config.in
index 53a4b73a58..3acf1f53f0 100644
--- a/package/pistache/Config.in
+++ b/package/pistache/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_PISTACHE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	select BR2_PACKAGE_RAPIDJSON
 	help
@@ -14,9 +13,8 @@ config BR2_PACKAGE_PISTACHE
 
 	  https://github.com/oktal/pistache
 
-comment "pistache needs a glibc toolchain w/ C++, gcc >= 7, threads, wchar, not binutils bug 27597"
+comment "pistache needs a toolchain w/ C++, gcc >= 7, threads, wchar, not binutils bug 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		   BR2_TOOLCHAIN_USES_UCLIBC || \
 		   !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		   !BR2_TOOLCHAIN_HAS_THREADS || \
 		   !BR2_USE_WCHAR || \
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
