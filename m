Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E32FCA17B
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 20:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41A41405EF;
	Mon,  9 Mar 2026 20:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rSqv00h-XsaW; Mon,  9 Mar 2026 20:07:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65A3240ADC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773086850;
	bh=lk8Zpg9wsFJ9buk5eHGmzJUQsCtfeIqHJh4Dbr6GrEs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cdKPKsMnsU4lro8bSDrvzTrWjbDi5Md5crE7LFeYKyU9Mj3wB8uyMYxMjvL5GkklJ
	 TipKTX/4Ivdvg1mAnSFWSU76f3+gdIsL8OMLlU/47D6//T+X+VkHADd04mpzeNEIAn
	 cUdBE1JxoqUmgGgnce78sscvPdSNpVukOPi/F2VdoHVD20nIdYDyI3q6ueISU2wYqt
	 niFwH3zXAgeFe4rOqQpDQbGvmHaDraKb4MmPFwEyETl0SeRF6TGOc9SwOe+0XZSobW
	 2x78S/9Ssb/RkdsNbsTQbYksorHR9WH61CEp2oa4XTYq7f/sW1XG+YetYEjeGIrg6w
	 +t7uZNrbHdzEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65A3240ADC;
	Mon,  9 Mar 2026 20:07:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 713D8119
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 20:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 562F74048E
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 20:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MZ_6wpd9zd9 for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 20:07:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12C4E4044B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12C4E4044B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12C4E4044B
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 20:07:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0224.dip0.t-ipconnect.de [91.58.2.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5E49FA4C083E;
 Mon,  9 Mar 2026 21:07:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51364)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vzgsh-000000008WG-3fVX;
 Mon, 09 Mar 2026 20:07:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Mon,  9 Mar 2026 21:07:09 +0100
Message-ID: <20260309200711.2255837-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309200711.2255837-1-bernd@kuhls.net>
References: <20260309200711.2255837-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773086832;
 bh=RNe7rxU8gKAS76DxAbRZZgrE34P0SIlBf1V6O2FX+k8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=WOqgJq0Hwc6kswhWpZdAW2VbGtClInmaGRc+WyoaC18hZ9x/+9cY2OyDsNXi2Q3LT
 hY2yuJ+zmrkGHojI/Lxi20brw6yTriwxwlVEAiVQfNZFCdHUKXkmgu/lxJZBZe2qSx
 ko00FDJ45eb6FtBjbioxLBfFOFnU+BwwmmNqSbWwXgUqbN/MyU61yDSCEpncFuGzoU
 VEIjb4j8SQAGkGLZAkc336IZuvzw4yHUUtPxxsxNH13kbxKCkzrSRQxCpM58PK+z/z
 3dg5mdF5fEGqMd6PWTgtsiNjoSLv30WRLR8aRGd8snG6GvBRxIArz/fd6elT8I/Rmh
 JnnPdH6KAKjxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=WOqgJq0H
Subject: [Buildroot] [PATCH v4 3/4] package/spirv-llvm-translator: bump
 version to 22.1.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v4: no changes
v3: no changes

 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 85ae98337c..5b7f13a570 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  43080fd5122c71cd93a3d174d59b9fc95ff8aeb1847d50f394088112f6b2a217  spirv-llvm-translator-21.1.3.tar.gz
+sha256  a5d476404ab88ac0d148211da50428178c89caef8af8042a3ca8e71e58ed9427  spirv-llvm-translator-22.1.0.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 0fb79e04d4..1ff8dc3401 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPIRV_LLVM_TRANSLATOR_VERSION = 21.1.3
+SPIRV_LLVM_TRANSLATOR_VERSION = 22.1.0
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,v$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
