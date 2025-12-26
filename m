Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286A1E8FDAC
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 17:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E35A3404B9;
	Fri, 26 Dec 2025 17:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYrsjIJxXL6J; Fri, 26 Dec 2025 17:15:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C3E940516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766769309;
	bh=X1y+cQ6iuTGbFJruQyjg1Iig6QunP/8a4cNB0E/mfQg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=q75ck1JpO0f1QfZ8ECYsQWnwarW8a4sw7lALqy03P03uMCRbMLh/f3r++VwHp7bkI
	 TbLfoZIza7Kgjaduh2kO5nn3A14ADP0ZHAWwdA/r+AuzTq3IY2rrKxGZMEjpCs2OXk
	 BSqTa5qL53ryzvMGrLCKCoeIhJBxLFoYUXFIrNHOBcD1u4IHE8lThmiMgsLWgQKtTz
	 hHfG6zlOEQ4nUkCBKyd1h1oPaXr08DlEFmI1PcMtREH1Xo8y6z7ApjONJAX3K3GeWd
	 lfuCwg2CzP52Woei9wukGQNnAlrDaabRhkRIkkBbv9A5rCy1PX9gxVXzD4jUuMnIBf
	 fkSi6+bmEZC9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C3E940516;
	Fri, 26 Dec 2025 17:15:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32022119
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1967E40516
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7sTBipZyfpC for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 17:15:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96282404B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96282404B9
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96282404B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:15:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C9B26C1D186
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:14:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E1A35606E4
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:15:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 07A8511978051; Fri, 26 Dec 2025 18:15:00 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Dec 2025 18:14:45 +0100
Message-ID: <20251226171448.1213664-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766769301; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=WFgSho46T6KY9cGrrv9zuowoBRuYoh3YHO+fMNVxnrY=;
 b=dL6IHTSvCQo6OcSiR9WAnckDuXtLCLFKgu/OBB1z5C6Jp+CgGwRm59JIl52SP9h7t5hjVA
 zpp4101fqd8SwREamKpRXIqta2hv8huHpyxugTvcGrQrpPPkfjcC4hZHmgBrkLPN+3lVN8
 VsZ2Thw63tjnKN8bPXtYobyJeNF4ZoTOAmBiHBvOq0vxhTkk3t0GDF/wV0fXPMUKzduRte
 Fcfrx/ncM7m2SjlQhn112gi9k3QaKw8qedGOg83HK6V7PzedawlifSG8OkAg+HKXAF+PPK
 8cuOHrL/DfZATLlrfKIflJ/GgHZnP2BmUowlviAsKTY7jtTx6EfKtm/saHVeeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dL6IHTSv
Subject: [Buildroot] [PATCH 1/3] package/opencv3: add patch to fix CMake 4
 build issue
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

Add a small patch to fix CMake 4 build issues. Unfortunately, while
cmake/OpenCVMinDepVersions.cmake provides a MIN_VER_CMAKE that we
could pass on the command line, cmake/OpenCVGenPkgconfig.cmake doesn't
use it, so we anyway have to patch the package.

Since opencv3 is basically unmaintained, there is no point sending
this patch upstream.

Fixes:

  https://autobuild.buildroot.net/results/cc857993920607958dd817c6a877ed9386c05738/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...inimum-required-CMake-version-to-3.5.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/opencv3/0001-cmake-set-minimum-required-CMake-version-to-3.5.patch

diff --git a/package/opencv3/0001-cmake-set-minimum-required-CMake-version-to-3.5.patch b/package/opencv3/0001-cmake-set-minimum-required-CMake-version-to-3.5.patch
new file mode 100644
index 0000000000..46009de302
--- /dev/null
+++ b/package/opencv3/0001-cmake-set-minimum-required-CMake-version-to-3.5.patch
@@ -0,0 +1,41 @@
+From 3b7311f48ef70127ddad7c7ea9c008fa6af3a9a1 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 25 Dec 2025 23:11:27 +0100
+Subject: [PATCH] cmake: set minimum required CMake version to 3.5
+
+This fixes build with CMake 4.
+
+Upstream: N/A, opencv 3.x is no longer maintained
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ cmake/OpenCVGenPkgconfig.cmake   | 2 +-
+ cmake/OpenCVMinDepVersions.cmake | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/OpenCVGenPkgconfig.cmake b/cmake/OpenCVGenPkgconfig.cmake
+index 425c0faa3b..9642a4b983 100644
+--- a/cmake/OpenCVGenPkgconfig.cmake
++++ b/cmake/OpenCVGenPkgconfig.cmake
+@@ -110,7 +110,7 @@ endif()
+ # =============================================================================
+ else() # DEFINED CMAKE_HELPER_SCRIPT
+ 
+-cmake_minimum_required(VERSION 2.8.12.2)
++cmake_minimum_required(VERSION 3.5)
+ cmake_policy(SET CMP0012 NEW)
+ include("${CMAKE_HELPER_SCRIPT}")
+ include("${OpenCV_SOURCE_DIR}/cmake/OpenCVUtils.cmake")
+diff --git a/cmake/OpenCVMinDepVersions.cmake b/cmake/OpenCVMinDepVersions.cmake
+index e67856bb97..eb7a6d861e 100644
+--- a/cmake/OpenCVMinDepVersions.cmake
++++ b/cmake/OpenCVMinDepVersions.cmake
+@@ -1,5 +1,5 @@
+ if(NOT DEFINED MIN_VER_CMAKE)
+-  set(MIN_VER_CMAKE 2.8.12.2)
++  set(MIN_VER_CMAKE 3.5)
+ endif()
+ set(MIN_VER_CUDA 6.5)
+ set(MIN_VER_PYTHON2 2.7)
+-- 
+2.52.0
+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
