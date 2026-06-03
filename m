Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BE3CD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 13:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4D4361492;
	Wed,  3 Jun 2026 13:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kq75zaAzN3pI; Wed,  3 Jun 2026 13:51:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 643C2613E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780494686;
	bh=Hpd8bFCh2U3tIpJXaEqWsVyvCCFl7NF990AcHF5VE/U=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NDnkxFajglY6BbbVB7VbPMh/YJ+j5GGTev+2IOycgFp0EPiAUtNVOr9XfzCKBEMhe
	 ct0Hf7jeIFXcJ+LG5TTw+pp5aNuoSbmml8S85m3Uwz5SO4xNOOQe1Rnm5h4GNFbKzi
	 mmcrR/y/u+1Zt17rhVk109aK+Xh8lCkNRV96yt0Gt+uYFC5VY2XZM4dDsYNn1cK2GX
	 uEewPcXCR363lk0G5PvbxvL6Z0JM1fwrOry5qkDzGCuS2EhzuGGztTMCS+9yqtaMY6
	 Td2POYYDfQ+xmXFoAwYpP2bAKuzt24ly7YJNRjnPkZyvpQKXOyaM1caH6dg5EYul7U
	 2bPKQwQUvJVsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 643C2613E4;
	Wed,  3 Jun 2026 13:51:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B324B353
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 13:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98FC4841CA
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 13:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MT_SOk_y0Rl4 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 13:51:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9C6D841C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9C6D841C6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9C6D841C6
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 13:51:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d62.dip0.t-ipconnect.de [91.58.13.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4F886A4C2E2B;
 Wed,  3 Jun 2026 15:51:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40748)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUm07-000000006nl-3zmO;
 Wed, 03 Jun 2026 13:51:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Wed,  3 Jun 2026 15:51:19 +0200
Message-ID: <20260603135119.3481791-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780494680;
 bh=rZpu9D60294bG7DZaUqDZrU0y6DtleBwb1zTgixN+IY=;
 h=From:To:Cc:Subject:Date:From;
 b=tosYQtwsI8yCo9X++cQcJDwjv4BLrKLskca/1g1s59706IIWwb8rhTBIVTzdd8Q9m
 PWYc8DtOOhrUOvgG9He2WGCGzY4fiYGJthPaiNtc38yOMfBUgWOEQQUhAKSggkw5OR
 oaHjv/+8pSrs72wG+XFq694g+V1fliYvsLp83d3ClfPGJr0FEwMX7ewVX4XcUfNti1
 f58GQA9DCQN0yzQRT/h/g30JaIJEFaEACZUxh5bQ3It+h+OPgh2Ry5YgBU7pSbPyOk
 mQwL2MPrO6eo4BJFqYYC9KCuKvySirDIWjUOXmV+W9Hm9pfCU3MbVEeJJiOdKX3GBq
 wQ37nyaoJDPeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tosYQtws
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to 22.1.7
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

Release notes of this bugfix release:
https://discourse.llvm.org/t/llvm-22-1-7-released/90961

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines stopped after reaching the 3h timeout:
https://gitlab.com/bkuhls/buildroot/-/commits/2473c919145c6371ad8d51c0c44f4578b54ff998

 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 4f2c07414e..d498fbe6e1 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.6
-sha256  6e0b376a1f6d9873e7dfb09ae6e04b9c7024400f01733fa4c29be69d5c138bc2  llvm-project-22.1.6.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.7
+sha256  5cc4a3f12bba50b6bdfb4b61bdc852117a0ff2517807c3902fc13267fb93562e  llvm-project-22.1.7.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 2f137b871b..7ddf25a37b 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.6
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.7
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
