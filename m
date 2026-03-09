Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3164FCA16D
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 18:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E525B61272;
	Mon,  9 Mar 2026 18:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gh91S2l00KJP; Mon,  9 Mar 2026 18:30:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C2C16126C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773081020;
	bh=YnaK63tOQefn9tBBb3tT1glQxStJCCU0MADId2yonow=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QFRzDw6wQcJ4Ke2QeY5eU/h0z9RJl3OHSlowitrXZQP7odSI1e24nbughWhzrqeNs
	 xlIK14scPtzG1tOW0Z/jSzkeTYv0GR+ZRUKpMFqIQLxcCnpNAcmykiUS04H7K5Gk8m
	 JCLVtK7RI3vpHfHlWmTN2RI8RRuW7JLM3VF9EwzBJ9lAdgj+X8Q9oGRJwDkZgrFYWr
	 B59fhy7MpQfV7Z5tlrm5XIULWUDI27+ICWSUU4GqboKFhqbQT9deFoyvrxe6e2sVbb
	 5s9hhBsThsbFXZdGISQv0lwzBADRFjV1ix+kb5OJL+yhY/XC1u38h+TDdpUFA+GLi7
	 42vo6YrFKgRqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C2C16126C;
	Mon,  9 Mar 2026 18:30:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7F78158
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 18:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9B7C6126C
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 18:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fEBxLAFYJM6 for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 18:30:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83A236126A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83A236126A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83A236126A
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 18:30:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0224.dip0.t-ipconnect.de [91.58.2.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1D262A4C078F;
 Mon,  9 Mar 2026 19:30:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56806)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vzfMr-000000008Ek-2Syu;
 Mon, 09 Mar 2026 18:30:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Mon,  9 Mar 2026 19:30:11 +0100
Message-ID: <20260309183013.1567302-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309183013.1567302-1-bernd@kuhls.net>
References: <20260309183013.1567302-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773081014;
 bh=dxZAriVrMc5uG6R2l09Z/jefindcVNbaziVwpvdDCgk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dloCVzSlVvZ2UqU0bneXSxKPcbVjFHq2pkD58VyXiY+zkT4J57iD44UMVpGtL3tGv
 q/A8cQM8NlmYbwsuO7nnJ/CrbGFvp5lTErXFMHDfDc1jTapo3QOkDQNTJIKWgF708P
 5VSiJw4J+avUEUTGT2pgRcFeWDFAwXe+inOgkRiMj+xC4Poj9yad51eS0Pta7zRoCY
 6P4CgYA+yI3MuF08w9kfpVdLaTFZDa0gSDQjrTopBHyeRaVDJP+2VgQ7gCSqi82+Gs
 wHMMufvZD2ICQqMN70W4nuqnufJe5JE8cZIMebYGOLxm3CqhNX5MLXRJ2+i0+S+3HW
 3R8BoSE9weTuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=dloCVzSl
Subject: [Buildroot] [PATCH v3 3/4] package/spirv-llvm-translator: bump
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
