Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0F5C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 11:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DA1A81E8B;
	Sun, 18 May 2025 11:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yWUFZRGdT5P; Sun, 18 May 2025 11:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74B9781E80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74B9781E80;
	Sun, 18 May 2025 11:56:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A9E41BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BE40818D4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zN2CHOfYlPMs for <buildroot@buildroot.org>;
 Sun, 18 May 2025 11:56:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23DBF818D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23DBF818D0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23DBF818D0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:56:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CA143A4C2276;
 Sun, 18 May 2025 13:55:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51560)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGcby-0000000008Y-3dVF;
 Sun, 18 May 2025 11:55:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Sun, 18 May 2025 13:55:18 +0200
Message-Id: <20250518115519.3649662-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250518115519.3649662-1-bernd@kuhls.net>
References: <20250518115519.3649662-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747569323;
 bh=QXDLsjdJFKApd4ToII5sJXKm5KKuIklnUIJIYfUDF/E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m/oM6msfKHw7rcypCV+NH80/VEWq3z6J5Sgmqz0pA9W8JpD4V9njCEg/DN4t0eWLG
 nPWhcZEtyxhI7ssljaYtMnUYTu93GxQVY/Amsn+JOMdHnsqUCp1CIQDCCd9b92kW15
 yOB7uy9J+dMr+xJ4Ij03+iL/lY8PRrxLtX1afzaZ4JAyX0tGxbanB/NkxE52ojrJB5
 FZ04v/EPFGLQiMB+fKvwpJFN+3hjuMez+IMpuHHjo4KbSv19SKkv+9r2myuginxohg
 2Bm6en1E3A1Mp80Zzvn9WlHtU+tX9J08VI6jvYANBCs53Qm0ETL2a+6pNb/fPAvW/B
 K6ENewga9fRgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=m/oM6msf
Subject: [Buildroot] [PATCH v2 4/5] package/spirv-{headers,
 tools}: bump to version 1.4.313.0
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

From: El Mehdi YOUNES <elmehdi.younes@smile.fr>

Update SPIR-V headers and SPIR-V tools to version 1.4.313.0 from the
Vulkan SDK.

This versions are required for compatibility with updated
spirv-llvm-translator (v20.1.2).
The source archive now follows the vulkan-sdk- prefix convention.

release:
https://github.com/KhronosGroup/SPIRV-Headers/releases/tag/vulkan-sdk-1.4.313.0
https://github.com/KhronosGroup/SPIRV-Tools/releases/tag/vulkan-sdk-1.4.313.0

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Bernd:
 bumped to 1.4.313.0
 Updated license hash of spirv-headers due to upstream commits:
 https://github.com/KhronosGroup/SPIRV-Headers/commit/1c9115b562bab79ee2160fbd845f41b815b9f21f
 https://github.com/KhronosGroup/SPIRV-Headers/commit/23d4a398c2ccca05fc623cca8785ce7741c5345d]
---
v2:
- bumped to 1.4.313.0
- Updated license hash of spirv-headers due to upstream commits:
  https://github.com/KhronosGroup/SPIRV-Headers/commit/1c9115b562bab79ee2160fbd845f41b815b9f21f
  https://github.com/KhronosGroup/SPIRV-Headers/commit/23d4a398c2ccca05fc623cca8785ce7741c5345d]

 package/spirv-headers/spirv-headers.hash | 4 ++--
 package/spirv-headers/spirv-headers.mk   | 4 ++--
 package/spirv-tools/spirv-tools.hash     | 2 +-
 package/spirv-tools/spirv-tools.mk       | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
index 136f3df733..6e3cc33d6b 100644
--- a/package/spirv-headers/spirv-headers.hash
+++ b/package/spirv-headers/spirv-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  32b4c6ae6a2fa9b56c2c17233c8056da47e331f76e117729925825ea3e77a739  spirv-headers-1.3.261.1.tar.gz
-sha256  9b243f6f0bf44e295ff411a0f7b7642d1d0dff7cdc42507e9f7206f439e51b5a  LICENSE
+sha256  f68be549d74afb61600a1e3a7d1da1e6b7437758c8e77d664909f88f302c5ac1  spirv-headers-1.4.313.0.tar.gz
+sha256  ff04ae7e6a468587fe59434fee2e67c0e2a749b592c794b764ff80f30b94a084  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
index 9f84c42b2d..675cef9f16 100644
--- a/package/spirv-headers/spirv-headers.mk
+++ b/package/spirv-headers/spirv-headers.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # Keep in sync with spirv-tools version
-SPIRV_HEADERS_VERSION = 1.3.261.1
-SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,sdk-$(SPIRV_HEADERS_VERSION))
+SPIRV_HEADERS_VERSION = 1.4.313.0
+SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,vulkan-sdk-$(SPIRV_HEADERS_VERSION))
 SPIRV_HEADERS_LICENSE = MIT
 SPIRV_HEADERS_LICENSE_FILES = LICENSE
 
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
index 65cb9c619b..de118b378e 100644
--- a/package/spirv-tools/spirv-tools.hash
+++ b/package/spirv-tools/spirv-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ead95c626ad482882a141d1aa0ce47b9453871f72c42c0b28d39c82f60a52008  spirv-tools-1.3.261.1.tar.gz
+sha256  6b60f723345ceed5291cceebbcfacf7fea9361a69332261fa08ae57e2a562005  spirv-tools-1.4.313.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index 51b1c9f22a..1aa0cc6199 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # Keep in sync with spirv-headers version
-SPIRV_TOOLS_VERSION = 1.3.261.1
-SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,sdk-$(SPIRV_TOOLS_VERSION))
+SPIRV_TOOLS_VERSION = 1.4.313.0
+SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,vulkan-sdk-$(SPIRV_TOOLS_VERSION))
 SPIRV_TOOLS_LICENSE = Apache-2.0
 SPIRV_TOOLS_LICENSE_FILES = LICENSE
 SPIRV_TOOLS_DEPENDENCIES = spirv-headers
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
