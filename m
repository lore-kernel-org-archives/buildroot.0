Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46AB1125858
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 17:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9836E4102E;
	Wed, 11 Mar 2026 17:58:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jWGLYMJgvC-X; Wed, 11 Mar 2026 17:58:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DF6C4102B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773251886;
	bh=uhIfHpN0uspUDJAeLOCcPPHDwOo0LsAFM9vYAjaAoxs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dc04HCSLHqe4gP+uF7h5FeWhxoo4Tvo4t6ULsLcfxTrChJ8/wxxQ85adwLIrnusGQ
	 vxjdbIrWkHRrw6mZYqAiQeJe9KXNrk+0DK7PxkrxA1A3elKf5D8m7j9o4YlCG42arm
	 lOsbShNXz0LEjlvkRCf1vuJfxSFucQk4Z+qpcTBHGy40T2BmGHLfauIpYBAOxgDHlH
	 rGJMC6iOn+CpQ7+Yd60oJDWS07L6r907mWWivJ1izXyLxEgyHOXFRbTVTut75DW3lt
	 LBvOD5RnXQkziOLkxnwdMZ6doTcIwbX0JaLIXsUaqYn4ch1JmVpHyKacXXXJrimVIZ
	 HcPe3ZTTu1YPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DF6C4102B;
	Wed, 11 Mar 2026 17:58:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CA1F228
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 17:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A37E40667
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 17:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wsHj-T9IGmA for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 17:58:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BDA4440647
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDA4440647
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDA4440647
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 17:58:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0224.dip0.t-ipconnect.de [91.58.2.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3B1CEA4C03FE;
 Wed, 11 Mar 2026 18:57:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37470)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w0Nok-000000006fT-354u;
 Wed, 11 Mar 2026 17:57:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Wed, 11 Mar 2026 18:57:58 +0100
Message-ID: <20260311175758.3371395-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773251879;
 bh=pr8mpBv8RsMTJM2J4sbZyRC7NxqboR/g1QFJbMKlJUY=;
 h=From:To:Cc:Subject:Date:From;
 b=joCa5y0A+gqn68rBOsOzC7m52lQS8ojAxIqs449tyQKqJfkDiLF0LLS2Mqh7Be+Mc
 jl7c/wDP2O0QvbzYgxulpo8Q4+5rmT/7ykB/9M3hhAxKqQLaaID1KyoNxXvrMikDsD
 zJV4QdA0kH7QwKZEcJ3sFDdvQvEaAykQGeLPCi8fbOWD4esm5Hzicocpb4t+XRkrFX
 uYNKZFw4/K6fwxqZO3g1UaxUXBG7dQfzzKLcLVPC52LzBrnJJoZb30JAXGUw4sLTlO
 eOJEprqghc+8LA3A2KAxEvhAZzNGz+Ijl3GqwwOdEWJwIYbB6JZMQGfnQdxEBftZ7C
 lzOH7oJoa3/ww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=joCa5y0A
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to 22.1.1
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

https://discourse.llvm.org/t/llvm-22-1-1-released/90150

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 99e5dc666a..528591ba09 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.0
-sha256  25d2e2adc4356d758405dd885fcfd6447bce82a90eb78b6b87ce0934bd077173  llvm-project-22.1.0.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.1
+sha256  9c6f37f6f5f68d38f435d25f770fc48c62d92b2412205767a16dac2c942f0c95  llvm-project-22.1.1.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index d9820d7d12..b358b80e23 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.1
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
