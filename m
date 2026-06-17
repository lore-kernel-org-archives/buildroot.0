Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17433CD98F2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 18:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94A8C80E69;
	Wed, 17 Jun 2026 18:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VA9uKgDrN2Eh; Wed, 17 Jun 2026 17:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64E7A80E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781719198;
	bh=SI2gsoeD4a3ZeWJvckhHzBmPRbzPf8WqIeKA7NJi9GU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YI1j6z3CHaO6G12INAbzMdw2Pn8lMVftRYEKGzcFo+FweNuzV4eDlY0NinDXeNq7D
	 M8fn+InZm8OSxbeXIkVRsiraI+yTTzrcJUjo35qELOTN+sKkflfj1OYrbnzY7DBC03
	 PBM4vfAMzuOWlqV12pZfBSQyVVMLtTwPM5af19QN6MMYenMUHF40CXwCh/JLbZfoHQ
	 Dolj9sreNL5BVpeU/2I/NrWWWT87ZYb/ZpxfbmTH/cnWMqF+u/+3YAQWGkxmP47Rna
	 peQy9m1304/1JO0z7oNI5hxxH71yarG4B1C6LX6LsnWIPihtgTu4RdYZj1fyciM7LB
	 FwMx5HWzMWFdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64E7A80E64;
	Wed, 17 Jun 2026 17:59:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C478E3A9
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA206606BD
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMdZEbl5_V9g for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 17:59:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D61F3606B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D61F3606B6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D61F3606B6
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:59:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a06cf.dip0.t-ipconnect.de [91.58.6.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8664FA4C015A;
 Wed, 17 Jun 2026 19:59:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36520)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZuYI-0000000066t-2Cw6;
 Wed, 17 Jun 2026 17:59:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Wed, 17 Jun 2026 19:59:50 +0200
Message-ID: <20260617175950.2925532-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781719190;
 bh=DCtzvMyZBwzbr5BRCPZjkqjjR2rWokqnsxixhFCdIds=;
 h=From:To:Cc:Subject:Date:From;
 b=Hrql4m6Mz6Ps85LpcAArbPOPoVbnuPOcf1ZxEU2Z/42ByS73YQiO6LdcdAFS8FTxl
 8AZZ7hp8nrEA6KkLMT+NhNdQt/HGReCQiUlXS7bEfOPqBsIGS3Kwi5XsA0qF4xDE8J
 IkqD0dkcfuFuGXlW1PM/DhncTUmnqCfJvWsa8kOKR1NdhG2MViXrPsEQ264LrgIx2M
 EJ7Y6kb6/NglSYfNJv0sh+sU/VH9E/UDTjx2wcOGXlbC5H2uwDExwhQ+HMDvKYlR3T
 1TDqROd90YUDr8mTc+N8tm6tikJ96zhWFDwwVa9Fa95ocjoDNvMa2TvLPcswWqXv+A
 IJpyki+t+geww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Hrql4m6M
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to 22.1.8
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

https://discourse.llvm.org/t/llvm-22-1-8-released/91084

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/be8733a731fbc33bb5bf2d53420ae6eb7627ffa4

 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index d498fbe6e1..96cdd76c92 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.7
-sha256  5cc4a3f12bba50b6bdfb4b61bdc852117a0ff2517807c3902fc13267fb93562e  llvm-project-22.1.7.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.8
+sha256  922f1817a0df7b1489272d18134ee0087a8b068828f87ac63b9861b1a9965888  llvm-project-22.1.8.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 7ddf25a37b..5cbbda6e06 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.7
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.8
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
