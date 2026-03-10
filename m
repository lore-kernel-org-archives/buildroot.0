Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E64AFCC9D3
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 07:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C869842021;
	Tue, 10 Mar 2026 07:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzUpRYapca04; Tue, 10 Mar 2026 07:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE92E42011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773126574;
	bh=QxrNhLJB/TN7Yj2d9BDkYBVVmsnxrrLdfqVsKv1cUsI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BaTJtwwp2gzeV4qsE6xPDoPVyPTvFqYCIExASKOTsCdtOJMhIgzsERBIzPz0lmsmy
	 93TkvifqFa1yEWKXE5Lbr33rQsAnQ7R7pai1iJnFuJFtjxP2ujlDfQdbW68qZlYlFJ
	 bqFYrCJxdFmYR6TP3AFacs93HJmh2TrB+OWAI/UmRJvovyJn9xGaBZwD4gE0fpQ9mk
	 e1Q5LkyZtPVlQ2c5HaltkIlfAh7vDFhrKFrqnOHeCOhfHF7JN6hkWkqeCBILt271BG
	 5zPGSHsHZ2ZCjVmvnAGT5CR8EDPg15pkWMovHTaoWZONzcJS8E2yxQlBrcvsxro09m
	 rlw77UHqfum3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE92E42011;
	Tue, 10 Mar 2026 07:09:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DA4DB8
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 07:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F52584239
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 07:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCOxDlNFmXZN for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 07:09:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC15C8414E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC15C8414E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC15C8414E
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 07:09:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0224.dip0.t-ipconnect.de [91.58.2.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 46F2AA4C0C8C;
 Tue, 10 Mar 2026 08:09:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60220)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vzrDb-000000005TG-3AeX;
 Tue, 10 Mar 2026 07:09:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Tue, 10 Mar 2026 08:09:25 +0100
Message-ID: <20260310070927.510748-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310070927.510748-1-bernd@kuhls.net>
References: <20260310070927.510748-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773126568;
 bh=OgsDm3pUQ1mRAW7RmNVvlvKfCamYSNlKVaeCPXBQn3g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hqMalFjidkXlOtUbvdix+UOBuYT/3XhnVkIUwLi7nmv4exNDzTmIACPhDZLlHJ+0z
 VVPntxGN3Zk7tsDBEVgdxmQqsgZRFVGHewGmh8WZB0d5JW+i1FtN+f+pldADnPb7lB
 UklyxJSTqixYjqsOmyGW2oOvEauerJTvoPtEKBZ0qya0tajVpe7Fxj+wzwSx7R9mPF
 yyfDsqmzAv12PpjXQwRPMCSeBvHaG8IZOQng8fp6SDBsa1Huj4i9vAi+vrXUVutOPk
 eIfRnfGhWh5+Z1zQEeXYm+c1AxABiTnHWEShZ5kRKawSZcBcS5z0xw3I7GlFT3JW/s
 Y8ywZ+IutlC0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=hqMalFji
Subject: [Buildroot] [PATCH v5 3/4] package/spirv-llvm-translator: bump
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
v5: no changes
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
