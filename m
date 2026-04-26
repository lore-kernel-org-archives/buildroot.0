Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C10FF8850
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 07:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2775401C1;
	Sun, 26 Apr 2026 07:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwSfYRIw9SwM; Sun, 26 Apr 2026 07:20:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB148401BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777188015;
	bh=zEi8yTuMwzpctBSwt0RON0nA4N6QGroQgFnduNbVDgo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bdg72VoepL8WBd5ZxAL9R+/Ti+ZT7sLDInHCMYUa+8ySmHpO4eGWRb09is1fUnYmx
	 IeDa8Mp2tMf/IJnsd9Lh1aGNLqybExP77GHO+917d7TiAjfPZPBDsYDek3A4WaX9sq
	 qsxa3yasSenXkrM9WJnSX91nkfwfi7wLcOCfl7rn8RrBF5oC0EVr1sQ47yjC6vRuXt
	 ngS/W8B5E106Bbqm1g656WYuyD++52V6ELeUD2kj3KZ1loH2UyhSUEvUojVwBblgjW
	 XTpYHlQ8pV+cHCT6t8/4tr/v5YPzwMztNSjEnExrSGnpNPEloW+1dHUmvjASBUWy2s
	 HQPvBMJagmuMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB148401BC;
	Sun, 26 Apr 2026 07:20:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44183369
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 414604216B
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1FzvE686_jH for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 07:20:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 306144052F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 306144052F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 306144052F
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:20:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51204A4C0CF4
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:20:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57168)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGtmk-000000004Hi-2Y3J
 for buildroot@buildroot.org; Sun, 26 Apr 2026 07:20:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 09:20:10 +0200
Message-ID: <20260426072010.401358-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777188011;
 bh=zJVFhXuNzxLNosgP3fL3PPpeNtj7jdivEPugUhPfue0=;
 h=From:To:Subject:Date:From;
 b=QO9Ab65Q1pSGTayfArRpdRFB/5CYz8kG7SiwOBSsisTr3V8woUVa9KaME2LGITMVy
 FYBF0R4YzAICpl+BRbmQMsr0cU8GUbdAJ0i4CjlN09Nk+t7FzsS9z/I4w5b6Q2GiiX
 0Ve0mD6T8tCjhlmoNv+c9/Zwou2uSyRpOoGeX08nLWgRCtqXQNavOd9jFKw1QsXLmH
 h03haPgwUeves7bg7c/igj1z9yHd8EfsjamtOZMVdjd77vmX+TlRJGudBAtQdzdk0F
 g89ecgDI8E2KlDnPQDolLE5DvBV4YNjDaqZMMrI2yLsZCJgaZFKwbDP37FJWG5tycf
 cUeevioznjoRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=QO9Ab65Q
Subject: [Buildroot] [PATCH 1/1] package/spirv-llvm-translator: bump version
 to 22.1.1
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

https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v22.1.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 5b7f13a570..1f2886ec6c 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  a5d476404ab88ac0d148211da50428178c89caef8af8042a3ca8e71e58ed9427  spirv-llvm-translator-22.1.0.tar.gz
+sha256  83e7007b8b9b5536b30991661738a98e9cd607d4a203e9342b628aaea5ea32d7  spirv-llvm-translator-22.1.1.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 1ff8dc3401..0f5fbb814e 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPIRV_LLVM_TRANSLATOR_VERSION = 22.1.0
+SPIRV_LLVM_TRANSLATOR_VERSION = 22.1.1
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,v$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
