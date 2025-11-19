Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253F5CF58E2
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 20:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2266883D85;
	Wed, 19 Nov 2025 20:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veUeR6A_GUCk; Wed, 19 Nov 2025 20:19:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D3B183B83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D3B183B83;
	Wed, 19 Nov 2025 20:19:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 582AE37D
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EE2F40165
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6fggidteo5j for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 20:19:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EFA5740086
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFA5740086
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFA5740086
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:19:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8C733A4C72B4
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:19:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37158)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vLoeI-00000000566-10AN
 for buildroot@buildroot.org; Wed, 19 Nov 2025 20:19:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 19 Nov 2025 21:19:30 +0100
Message-ID: <20251119201930.459536-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763583570;
 bh=cKgAtVuxQHa+Zmi9DUpSMPyJMyo1PjuzARgzmHcnXUo=;
 h=From:To:Subject:Date:From;
 b=uPlIrn6h/cXgoepuYLsSN3tnPXa+WBedCLxW0VPShPFdRfn/QKvYzm1wNd0VoTP/q
 6cMXtP6qESGJHcE7Bc4KZQavMtKo9hQ5d7rqJL5zT62KoRCdzhqAZCKC7mxRsJz4EB
 Q8AfovL7VNN2p9vj8oMudrEP4u8xTHa0kMl4b+hcR+m3D0k57O7eZiZ7aiTz3Jf3be
 1ueQpMLLTlitVmvSRmDDAsoqKrPMLuZw88x3F1nVSuZZBWVesfYzLQU72xHt6Eixi5
 QCLoyzO9PtG+nKOdEiNEkzUGtUP+ue9GZANjWew16Uyzks1ReXAXv+ZbkW0OtlDT2E
 WMKBHQ+uEEYzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=uPlIrn6h
Subject: [Buildroot] [PATCH 1/1] package/spirv-llvm-translator: bump version
 to 21.1.2
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

Release notes:
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v21.1.2

Changelog:
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/compare/v21.1.1...v21.1.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index f0b8214976..0263689519 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  954ef00a48fc440f3624f78cc80ffa98c961510bf558489ea0a940e397c7a871  spirv-llvm-translator-v21.1.1-2-ga37544fc0bb90b4e8b8d755580119c018891dfa4.tar.gz
+sha256  8db031b9e23c1dd47154751cf74f8a3c5d5e8d92896789c6a7eb956946287677  spirv-llvm-translator-v21.1.2-5-g3c0231e56b7a9ecc4875e8696ea53d54d6776f85.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 62a24f1ff1..28bdb4d26f 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -6,7 +6,7 @@
 
 # Generate version string using:
 #   git describe --tags --match 'v21*' --abbrev=40 origin/llvm_release_210
-SPIRV_LLVM_TRANSLATOR_VERSION = v21.1.1-2-ga37544fc0bb90b4e8b8d755580119c018891dfa4
+SPIRV_LLVM_TRANSLATOR_VERSION = v21.1.2-5-g3c0231e56b7a9ecc4875e8696ea53d54d6776f85
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
