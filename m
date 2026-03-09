Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8759FFCA17D
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 20:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B82D41CDC;
	Mon,  9 Mar 2026 20:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gy1j9vqSp9DP; Mon,  9 Mar 2026 20:07:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A52740A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773086861;
	bh=JvDUG+mb7OgZQMWMmbLRkh16Ham3TLdwrBxQkkn6AsM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TDxcQRGw5iR3m2YT34wTGzpirliFTb94OybLGo7INXCaMlMwezmZVDQCTTi/8MWPQ
	 vG3pcBHPRAxkRtqdXakn469eH+ROnE4930NMMP4SccE9yOSBw53g0SIgW+ZFHDCQN9
	 9GZ5GIMrtzyRtNNzdd/7FCdDE5a/5i1VeRMqEX2wUrIcs3qg6p3nSVcaht2PShqH/G
	 9ECTAV0arET2O/0K8EiQ3lGpm/ZphBKL4gI1EcXnuafyVg2WrYP7ktlFc414bhWPbB
	 hCJrZJ5Vk5U2afu16yOQFuIfnlf/LEa675RmFpKlsufiMFYtjYfA4XVn6kR43HsW6o
	 Ron+kycqbCZZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A52740A9E;
	Mon,  9 Mar 2026 20:07:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DD20119
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 20:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3ED6860856
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 20:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwJ51SK2LEpK for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 20:07:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BFAF607A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BFAF607A6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BFAF607A6
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 20:07:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0224.dip0.t-ipconnect.de [91.58.2.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4FA7BA4C068F;
 Mon,  9 Mar 2026 21:07:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51364)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vzgsh-000000008WG-3J59;
 Mon, 09 Mar 2026 20:07:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Mon,  9 Mar 2026 21:07:08 +0100
Message-ID: <20260309200711.2255837-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309200711.2255837-1-bernd@kuhls.net>
References: <20260309200711.2255837-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773086832;
 bh=/OvaDKXcBE8BRP0dAGyUCFxWSRFpVB/Cp3JQwAN6JIQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SgYvl6KwAQOj+C0JDHwY6LmPzekmCXo/BhY/YPAuo0n+EBb2rUodkg/456g5z/EpP
 oC6wxzD9wSJneisI7dKv0rC1n+Bj/18ukdyLNed6f7nKcuyaNUK+Bs2XJJlJSreGqr
 IJs7Wq307DWTO6Ai2gmsgvASO7uvWL0YWUXEfpAD3DFHe6SOvpuM8ogwB3pK8TinvK
 bR6zff71Unb6UHQA57XcmCyysvMAwRd7Pc4CLauGeXYYVcTd5c7YQrqK4AIQ3PaG9t
 CawlWgFn5XFcX37RGTtyre3O6b19kEzAqW9xfRUcZpcqYUpY4T7xKjPk1OcyY1ZWt0
 ZDTXS5q9luHxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=SgYvl6Kw
Subject: [Buildroot] [PATCH v4 2/4] package/spirv-{headers,
 tools}: bump to version 1.4.341.0
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

https://github.com/KhronosGroup/SPIRV-Tools/blob/vulkan-sdk-1.4.341.0/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v4: no changes
v3: no changes

 package/spirv-headers/spirv-headers.hash | 2 +-
 package/spirv-headers/spirv-headers.mk   | 2 +-
 package/spirv-tools/spirv-tools.hash     | 2 +-
 package/spirv-tools/spirv-tools.mk       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
index 019145f959..2ddd887076 100644
--- a/package/spirv-headers/spirv-headers.hash
+++ b/package/spirv-headers/spirv-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1c47ca6342ebe86f57b46b8dbeb266fa655a1ca8e10d07e45370ff2d9c36312e  spirv-headers-1.4.335.0.tar.gz
+sha256  cab0a654c4917e16367483296b44cdb1d614e3120c721beafcd37e3a8580486c  spirv-headers-1.4.341.0.tar.gz
 sha256  ea43b1de38a6f90c488800d66dec1ed671e68cda530266bc96951fb5b6307613  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
index 0d0ee949bd..413f7c3586 100644
--- a/package/spirv-headers/spirv-headers.mk
+++ b/package/spirv-headers/spirv-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-tools version
-SPIRV_HEADERS_VERSION = 1.4.335.0
+SPIRV_HEADERS_VERSION = 1.4.341.0
 SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,vulkan-sdk-$(SPIRV_HEADERS_VERSION))
 SPIRV_HEADERS_LICENSE = MIT
 SPIRV_HEADERS_LICENSE_FILES = LICENSE
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
index cba67d7d8d..37f8046545 100644
--- a/package/spirv-tools/spirv-tools.hash
+++ b/package/spirv-tools/spirv-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8b3d5637061b52675e506ffa1100740031e38bdd96b8177978acfd898a705da2  spirv-tools-1.4.335.0.tar.gz
+sha256  15bfb678138cdf9cd1480dfb952547bbb66b763a735b6d5582578572f5c2e6f9  spirv-tools-1.4.341.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index f0e76bb9ad..af3cc659f5 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-headers version
-SPIRV_TOOLS_VERSION = 1.4.335.0
+SPIRV_TOOLS_VERSION = 1.4.341.0
 SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,vulkan-sdk-$(SPIRV_TOOLS_VERSION))
 SPIRV_TOOLS_LICENSE = Apache-2.0
 SPIRV_TOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
