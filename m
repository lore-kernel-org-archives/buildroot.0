Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B748CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 13:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26D4E61588;
	Wed,  3 Jun 2026 13:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sy859d-3Nm4R; Wed,  3 Jun 2026 13:53:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD8B8613E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780494839;
	bh=lSv5Ze8dFLpgcW1G3wu7mRJF3qYj0EDkj/CVmMkDpvE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GUzeHy524q1gRVcxF1e75eRLzsxSk9prpP/orTyg8mwtFhhBQuNfTX2ue7PeJKFBP
	 prMJE38gV/tUky9h72AmHhMZGZwpoTCQHoBK/F9xSSYaIGr2WpchlS6l3IgIn2zahW
	 243lbKUFIjiKh8J7DLr+Gu4h9r0i5vHO9zCW9q2E0gqEljsX/abL4gVv7SpNEeMAfW
	 MreZ6UKLs6SWT43ws2be+u5IFPAXdBN9RJcMB/kQk2p1rYMNRCZkUJ6TrtJ7er/A49
	 6N5wTsc3ydLeYLY5pvC2qbgezdwZq8UpiH3h0rFPFm7xXJEf2WM42DFdkaC47HTHO8
	 iJH8HOzc4j7dA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD8B8613E4;
	Wed,  3 Jun 2026 13:53:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A9BF353
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 13:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55D3242404
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 13:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCLQx_OaWVj4 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 13:53:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9260A423B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9260A423B4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9260A423B4
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 13:53:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d62.dip0.t-ipconnect.de [91.58.13.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05C31A4C2E2B
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 15:53:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36168)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUm2b-000000007Ea-2lNk
 for buildroot@buildroot.org; Wed, 03 Jun 2026 13:53:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Jun 2026 15:53:51 +0200
Message-ID: <20260603135353.3482326-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780494834;
 bh=LIezRszkTcnvt2/yIHnwC7ZHARLu7lc8AaEpphp4C7I=;
 h=From:To:Subject:Date:From;
 b=nfwk07+raRgvD9gWMn3elfYNbwvMezr/TWLDeMT6EoXVxdtYh+T+vndZpJcJyeoDR
 DYLr0LtvHnbexsj2TonmHlFB+73NYKdp7dyKsNT/cYVsOpQS/b4/GGO9E/J8x1OuRN
 8R+agN4D8Q3MKr4rg8T7WZ7c0apdlli9t01s7QkGaN7nup9i5pr1kn3AZk32/L1mL/
 Cyvb1iGBtcoUY4ueXzHwbHaEUDmQc40ijEz7meXmkIP8Ie99hJywKjlbZacokVp3b4
 Fw46nZtPX0acIL1qDq/hWwUopAYFc+2ha7/xqiK0umxpgLdZpS04KvfhauShWCaDCl
 1wA4/RI7VXb5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nfwk07+r
Subject: [Buildroot] [PATCH/next 1/3] package/spirv-{headers,
 tools}: bump to version 1.4.350.0
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

https://github.com/KhronosGroup/SPIRV-Tools/blob/vulkan-sdk-1.4.350.0/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines stopped after reaching the 3h timeout:
https://gitlab.com/bkuhls/buildroot/-/commits/c506187f32ed69268ecbc57f190e27346a67e333

 package/spirv-headers/spirv-headers.hash | 2 +-
 package/spirv-headers/spirv-headers.mk   | 2 +-
 package/spirv-tools/spirv-tools.hash     | 2 +-
 package/spirv-tools/spirv-tools.mk       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
index 2ddd887076..1d0057fb60 100644
--- a/package/spirv-headers/spirv-headers.hash
+++ b/package/spirv-headers/spirv-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cab0a654c4917e16367483296b44cdb1d614e3120c721beafcd37e3a8580486c  spirv-headers-1.4.341.0.tar.gz
+sha256  9905d9341f20388adb852c77dd982f2c4d539fd68e6c1f1bcebf034715f2d1d5  spirv-headers-1.4.350.0.tar.gz
 sha256  ea43b1de38a6f90c488800d66dec1ed671e68cda530266bc96951fb5b6307613  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
index 413f7c3586..87c4eb1888 100644
--- a/package/spirv-headers/spirv-headers.mk
+++ b/package/spirv-headers/spirv-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-tools version
-SPIRV_HEADERS_VERSION = 1.4.341.0
+SPIRV_HEADERS_VERSION = 1.4.350.0
 SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,vulkan-sdk-$(SPIRV_HEADERS_VERSION))
 SPIRV_HEADERS_LICENSE = MIT
 SPIRV_HEADERS_LICENSE_FILES = LICENSE
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
index 37f8046545..9b7133016a 100644
--- a/package/spirv-tools/spirv-tools.hash
+++ b/package/spirv-tools/spirv-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  15bfb678138cdf9cd1480dfb952547bbb66b763a735b6d5582578572f5c2e6f9  spirv-tools-1.4.341.0.tar.gz
+sha256  446b288fe76d3f31bbf9a405d62b97020ac0f135edb0ed5dbdf1136c488138f5  spirv-tools-1.4.350.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index af3cc659f5..c9735d7ecd 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-headers version
-SPIRV_TOOLS_VERSION = 1.4.341.0
+SPIRV_TOOLS_VERSION = 1.4.350.0
 SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,vulkan-sdk-$(SPIRV_TOOLS_VERSION))
 SPIRV_TOOLS_LICENSE = Apache-2.0
 SPIRV_TOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
