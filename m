Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648F4E8FDAC
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 17:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3D794069E;
	Fri, 26 Dec 2025 17:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kxXrWAVNoM3; Fri, 26 Dec 2025 17:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C81FB40516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766769145;
	bh=wL9MtGFTlKdChCDbLw80QvdxQD/wTmeu+8eG2KaJhJ0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VXclcNrEORB3IRTf1cYMZrtba0Vd3AM896xe5KoVjLdCPJjKDQQzagY1Jj3EbMoDE
	 dwHY+lcYMvdE/Fe3dw6gzZZZpbElwdX6LDKKko8dlTqyS+xERFbRziOOpJDIHngTkA
	 Jp1dH1HW26fY8gi3RrcMNLstwO0iMb/DvdDvLCtivsHr5c7kkPkzLP96Qn/897YV5m
	 KLMDmIvBW5gIMRk3DNh3RM1hYW6I2ih5vU5k6rZFRZqgqkHVBERSXwX8Yz/FCynPCs
	 OIBBScEEwizivW7Y5XOhNFD1K/+5F+jeCBOrnRc6/gARJLHQnA4Nz+UzQS9rvynvIa
	 I8lbY5xgYG4Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C81FB40516;
	Fri, 26 Dec 2025 17:12:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3520119
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89A686084F
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SlPUbC2-GAz for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 17:12:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE52F6083C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE52F6083C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE52F6083C
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:12:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B19544E41DD4
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:12:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 73E4C606E4
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:12:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D599E1197806D; Fri, 26 Dec 2025 18:12:18 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Dec 2025 18:12:06 +0100
Message-ID: <20251226171207.1211941-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766769139; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=KcZ8w7oXNv0egMcRCjlEZIhczvBjiUuSe+0CfSWYRQk=;
 b=hGAixkmjA+oMsLNSyhSPKJ6a3549+w3xPkoQDbwTKDsH4lHaL+r2XSPJalqvX9w+/iaBm9
 LlmrOm8/TrA9L3LfAQzj4MD8IoXEcCV+zMehTmcidGK7KiIupdacwk3a+7qICS/BEsVGPr
 QG7kp8FHJDTMNF6PTNtbcW4PrC7PTDcid8g+ldwx5aXu8UJaYJ+kkyLrSAnmJdLByq5mEv
 NXw0ogyYHewY3EHlv2SJx6oNaGJjJUK3ii44rmC2L8TiG+ZB7hyh/0XeNeI8P5HcK5qvl2
 LHjYCkYJdTTPiuj2DQFIydsU3dM50d1PAtldtm6Csnm1hT+kXrZFdoBpK6uCkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hGAixkmj
Subject: [Buildroot] [PATCH] package/gli: add patch to fix CMake 4 build
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

Fixes:

CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 has been removed from CMake.

  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
  to tell CMake that the project requires at least <min> but has been updated
  to work with policies introduced by <max> or earlier.

  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.

Fixes:

  https://autobuild.buildroot.net/results/30c1645d04b9d2b581aa7a866aa19c4001538e17/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ump-CMake-minimum-required-version-f.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/gli/0001-CMakeLists.txt-bump-CMake-minimum-required-version-f.patch

diff --git a/package/gli/0001-CMakeLists.txt-bump-CMake-minimum-required-version-f.patch b/package/gli/0001-CMakeLists.txt-bump-CMake-minimum-required-version-f.patch
new file mode 100644
index 0000000000..962beb465a
--- /dev/null
+++ b/package/gli/0001-CMakeLists.txt-bump-CMake-minimum-required-version-f.patch
@@ -0,0 +1,39 @@
+From 69a4897efca9c1c8546872d021b57d9e12764441 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 26 Dec 2025 18:08:35 +0100
+Subject: [PATCH] CMakeLists.txt: bump CMake minimum required version for CMake
+ 4 compliance
+
+CMake 4 will refuse to build if the cmake_minimum_required() version
+is not at least 3.5:
+
+CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+So bump the required CMake version accordingly.
+
+Upstream: https://github.com/g-truc/gli/pull/196
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6f70f493..b705dbaf 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1 FATAL_ERROR)
++cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
+ cmake_policy(SET CMP0054 NEW)
+ 
+ project(gli)
+-- 
+2.52.0
+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
