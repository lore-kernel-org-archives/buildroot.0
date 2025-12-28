Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22160D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E07E74034E;
	Sun, 28 Dec 2025 21:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vh1vyTYH6AOd; Sun, 28 Dec 2025 21:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 062D640353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766956026;
	bh=vpI0KNbLOOedDyI5PnR0nmNbDict+adWkaZfvFpSIrM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=rO5Lb++/4galIIExTu0nJjCIISjlQuRByAeKJbA/a7GnMgEGBiQemAhA7Zbq81wzl
	 RU5xM9T0JSVk/WTi/kLWjUCQBk2ev9QvfQvSoB6G0gu5IbzN7QsBff1FoTqT5YaAcZ
	 RryRl2RmKxbNauhj5O27bEuF2CG6qgUjIozKSlHn1tVJE70EuiPvwJwDvXBxmGmGoE
	 cFt4pFprbrgEakE2LQpjZcELyBA0VF5OGxw+CK3R6suei2mlxpPw302W1IQl6gUFA6
	 5ZyU+O0hgsm0u3kyLGahPbNx74gWdBWC69G0zrUFcRhU+rfCGIiXEvwCWZ7lhfqoYK
	 UoYpTDugM4C4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 062D640353;
	Sun, 28 Dec 2025 21:07:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12B09B9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0426340134
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSgBePOi5tLX for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:07:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB1E94007C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB1E94007C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB1E94007C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:07:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0B1BF1A24CB
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:07:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D677360725
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:06:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1867911978CCC; Sun, 28 Dec 2025 22:06:58 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Dec 2025 22:06:48 +0100
Message-ID: <20251228210649.3057011-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766956019; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=PmMS99YGjXX3hDZr9o61ObSFmbNWa0tdXHoKhCisbNs=;
 b=pU73K2a1WxEj658xXrcLMoZYIZ1NQinH4Tisa42KI0jJtZrTIBhkYM6rX3csvCOj9cKUN4
 QwsuJ8PBtQsV3f5Nz4LB7oOcaQxJbaJXnA6p2greqV/cvYA0o2SxLzaoOaSjcLK+yZQykB
 JEOzrzj69bLQGkv8nsoyPcNE0Ka5uAzhyIeaSmQzSyfEaqqcEaeHbowQhWS9NwGF9oAaTw
 XnEYTN2CXaY6InSuqs78H4QCA7yY6hdmQaVhDHxTLwI1193OShngXaWt+qDIaZ2MPJvkJd
 1AsfrBejTr2tSMdS8QhnLCVDK0PL12KSL+UdNCC+A3U16wggzzXrC3SNSiUOwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=pU73K2a1
Subject: [Buildroot] [PATCH] package/soapy-sdr: add patch to fix CMake >= 4
 compatibility
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

CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 has been removed from CMake.

  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
  to tell CMake that the project requires at least <min> but has been updated
  to work with policies introduced by <max> or earlier.

  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.

Fixes:

  https://autobuild.buildroot.net/results/074098fef4f8a5e89a4f04efbdd1f545f4616772/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-bump-minimum-CMake-required-version.patch | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 package/soapy-sdr/0002-CMakeLists.txt-bump-minimum-CMake-required-version.patch

diff --git a/package/soapy-sdr/0002-CMakeLists.txt-bump-minimum-CMake-required-version.patch b/package/soapy-sdr/0002-CMakeLists.txt-bump-minimum-CMake-required-version.patch
new file mode 100644
index 0000000000..6f591a3682
--- /dev/null
+++ b/package/soapy-sdr/0002-CMakeLists.txt-bump-minimum-CMake-required-version.patch
@@ -0,0 +1,67 @@
+From 52ed7a5acc8059c87be88d2a930ddb28e03d6a91 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 28 Dec 2025 21:57:46 +0100
+Subject: [PATCH] CMakeLists.txt: bump minimum CMake required version
+
+Building with CMake >= 4 requires a minimum version of at least 3.5,
+otherwise the build fails with:
+
+CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/pothosware/SoapySDR/pull/477
+---
+ CMakeLists.txt               | 2 +-
+ ExampleDriver/CMakeLists.txt | 2 +-
+ python/CMakeLists.txt        | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index fe00bd0..f103daf 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ ########################################################################
+ # Project setup
+ ########################################################################
+-cmake_minimum_required(VERSION 3.1.0)
++cmake_minimum_required(VERSION 3.5)
+ project(SoapySDR)
+ enable_language(CXX)
+ enable_testing()
+diff --git a/ExampleDriver/CMakeLists.txt b/ExampleDriver/CMakeLists.txt
+index 4e83dbe..b907b70 100644
+--- a/ExampleDriver/CMakeLists.txt
++++ b/ExampleDriver/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ # Project setup -- only needed if device support is a stand-alone build
+ # We recommend that the support module be built in-tree with the driver.
+ ########################################################################
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ project(SoapySDRMyDevice CXX)
+ enable_testing()
+ 
+diff --git a/python/CMakeLists.txt b/python/CMakeLists.txt
+index 8cb1592..0253223 100644
+--- a/python/CMakeLists.txt
++++ b/python/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ ########################################################################
+ # Project setup
+ ########################################################################
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(SoapySDRPython CXX)
+ enable_testing()
+ 
+-- 
+2.52.0
+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
