Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCD5CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 21:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 938CB80F30;
	Sun, 12 Oct 2025 21:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZg3_78Gx7rM; Sun, 12 Oct 2025 21:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A40DE80F29
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A40DE80F29;
	Sun, 12 Oct 2025 21:30:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26BA291C
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 21:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D723404F0
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 21:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYqNEpTF-MhD for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 21:30:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0ECAA40503
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ECAA40503
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0ECAA40503
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 21:30:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 21E8CA4C6703
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 23:30:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v83eC-000000000ed-1rrw
 for buildroot@buildroot.org; Sun, 12 Oct 2025 21:30:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 23:30:32 +0200
Message-ID: <20251012213032.3512805-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760304633;
 bh=bRnAtix7B7o4rMLG8kGoEDEZ+nF5wJGu22pW/Xh7P8k=;
 h=From:To:Subject:Date:From;
 b=Ww4q/T+mSnn744P3tshJjJZo2kl1/hFRb7NPRBp+s2vVaYKB0T334f4tRC2GfL2Ye
 xkqO2k+s3hRl+faSh333tv2xF3MziuEUKGVph2nRGDoVJYzauNHITU6Iz58s99S0dw
 DsR7a2gj4IEO5Dm/MunGSiiTF2f4PnRaih5lRS/oQCh7j8/fcD8e7qCCNFEOA8pQSH
 z7cIF5Yj3Y12aDeN190fEVc1oO0Jpv+9sOynMDp0+PVBJOYCjIoYCtBMGQI27poe5T
 fPrExblG+tbQUzuykvtBOuPPOTKfcpmTLY63OsKiNX6tMakMIFJRzGbUKw8a2zKjj7
 yLE+rjh7ZqPPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=Ww4q/T+m
Subject: [Buildroot] [PATCH 1/1] package/spirv-{headers,
 tools}: bump to version 1.4.328.1
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

Updated spirv-headers license hash due to upstream commit:
https://github.com/KhronosGroup/SPIRV-Headers/commit/e87f5a873192cdfddc94aea0a4dbd63059b0773c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/spirv-headers/spirv-headers.hash | 4 ++--
 package/spirv-headers/spirv-headers.mk   | 2 +-
 package/spirv-tools/spirv-tools.hash     | 2 +-
 package/spirv-tools/spirv-tools.mk       | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
index 6e3cc33d6b..c62d12a79a 100644
--- a/package/spirv-headers/spirv-headers.hash
+++ b/package/spirv-headers/spirv-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f68be549d74afb61600a1e3a7d1da1e6b7437758c8e77d664909f88f302c5ac1  spirv-headers-1.4.313.0.tar.gz
-sha256  ff04ae7e6a468587fe59434fee2e67c0e2a749b592c794b764ff80f30b94a084  LICENSE
+sha256  602364ab7bf404a7f352df7da5c645f1c4558a9c92616f8ee33422b04d5e35b7  spirv-headers-1.4.328.1.tar.gz
+sha256  ea43b1de38a6f90c488800d66dec1ed671e68cda530266bc96951fb5b6307613  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
index 675cef9f16..9312e96d41 100644
--- a/package/spirv-headers/spirv-headers.mk
+++ b/package/spirv-headers/spirv-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-tools version
-SPIRV_HEADERS_VERSION = 1.4.313.0
+SPIRV_HEADERS_VERSION = 1.4.328.1
 SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,vulkan-sdk-$(SPIRV_HEADERS_VERSION))
 SPIRV_HEADERS_LICENSE = MIT
 SPIRV_HEADERS_LICENSE_FILES = LICENSE
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
index de118b378e..e3652a48cd 100644
--- a/package/spirv-tools/spirv-tools.hash
+++ b/package/spirv-tools/spirv-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6b60f723345ceed5291cceebbcfacf7fea9361a69332261fa08ae57e2a562005  spirv-tools-1.4.313.0.tar.gz
+sha256  d00dc47df7163c2bacd70f090441e8fad96234f0e3b96c54ee9091a49e627adb  spirv-tools-1.4.328.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index 1aa0cc6199..c71a0f8299 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-headers version
-SPIRV_TOOLS_VERSION = 1.4.313.0
+SPIRV_TOOLS_VERSION = 1.4.328.1
 SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,vulkan-sdk-$(SPIRV_TOOLS_VERSION))
 SPIRV_TOOLS_LICENSE = Apache-2.0
 SPIRV_TOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
