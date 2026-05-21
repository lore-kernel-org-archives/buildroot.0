Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB59CD343F
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 06:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AC0541DAC;
	Thu, 21 May 2026 06:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9xi8NC7Kkyv; Thu, 21 May 2026 06:27:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6376141DA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779344850;
	bh=Dp+0JVNNYuTEHXw2dH8bt3UUWnbbnEoJmhiLX6POsSE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gcc6HFvVLvoDyC29sZ1Fo4mEa7o9Z1bFMBJw05WFe8Kxv3rBggcOhupikexXIV0hZ
	 GiFUgOTNnNF2H/uje939Q6YzriKSV7mP2SxTwP1nebmuJTuRYJQoi6ggE9074xs+VQ
	 buIn4RN+uH+8TLZEbRooTGp3oiem+kT3tkmSdTRfuaOwFHpXSFH3rwyhDWU3ElNZF6
	 gfamYPKI7NKqyqd1mvgz/u3rey/JXee9kcUkmsXx2LEaUjqcuO6qWmbKWETK79cFWj
	 eh4ZLEsG9ig3UhhcSz33/nl1TTWoOfScc2l2ai0Sucw8GmNYGMsUSdM2WExXqJwhlR
	 b2PafHgIW5xVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6376141DA8;
	Thu, 21 May 2026 06:27:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7047D3
 for <buildroot@buildroot.org>; Thu, 21 May 2026 06:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8ED2413C2
 for <buildroot@buildroot.org>; Thu, 21 May 2026 06:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZ5fX1kpQone for <buildroot@buildroot.org>;
 Thu, 21 May 2026 06:27:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B4C4413BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B4C4413BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B4C4413BA
 for <buildroot@buildroot.org>; Thu, 21 May 2026 06:27:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5dd.dip0.t-ipconnect.de [84.161.181.221])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4BEB2A4C00FD;
 Thu, 21 May 2026 08:27:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wPwsM-000000005rQ-0FKw;
 Thu, 21 May 2026 06:27:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Thu, 21 May 2026 08:27:22 +0200
Message-ID: <20260521062722.122772-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779344843;
 bh=CNfR6DHg5t/yhIIev7N4kbaQtcWuhDqB8qFJBq6UyWY=;
 h=From:To:Cc:Subject:Date:From;
 b=GYlVt4heX2jJZeSptmUty9dEjhdHZe0gitErdmJcCiAY6e9nrKWNTGTSwpx5rMROs
 B6UdLekeMezwOhNeGvjDoXWSpMBFQd5iVTuD4e/GUd636Qwzp7gGejX0EURkKqrjuS
 weSj+K5dRApCWuKcUb9rddA1Ure77GMJOl1KNFThb9jQHm7UNwTnowZra8mdKYxsGC
 I2KYrhDq5SPhxuoGzKfjsfTUWGCLbZHQhKz4mcCMl12dj5bXYeQ5D74NbVFVbauOry
 PS38bIB6NZMsV/sI4R25BVWzj4hxAbFkcqGrjWdEklV65SpVX96ywUAPFpiRNARbe6
 N2CHqJUBsw48Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=GYlVt4he
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to 22.1.6
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
https://discourse.llvm.org/t/llvm-22-1-6-released/90838

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 9155ba8c53..4f2c07414e 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.5
-sha256  7972b87b705a003ce70ab55f9f0fb495d156887cba0eb296d284731139118e2c  llvm-project-22.1.5.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.6
+sha256  6e0b376a1f6d9873e7dfb09ae6e04b9c7024400f01733fa4c29be69d5c138bc2  llvm-project-22.1.6.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index eedef3a1c5..2f137b871b 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.5
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.6
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
