Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA94FD9E02
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 19:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DECD810DC;
	Thu, 26 Feb 2026 19:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsMNL4t9YZfd; Thu, 26 Feb 2026 19:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BB95810D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772134839;
	bh=LPCUnSiC/ef1bzzWihTCB3qEAxQWxWsLQB9w68FeL48=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o4THxq+UclQFx4CoH35mLTQjxfWoUZGU8bOoj9W3T3llmaLkBCzSrAtw92DKQruEP
	 8mySbjNzh/aTZ5d/gnUU2G444fD6Lvp8rUxOSoB/qDfBAh096Dehvu0SzKMdXZle3m
	 tVVt0sTJ4LxYa9klk4HhyO6lx6Goe/fvqOLqPwMGF/p2vGgAsd8EMJJ000/WfL4Rls
	 7K70fX4A8RJ2RPfqTIobGprTy2YftpCSq6SrM/Nx430vVX7tlEuuGjJjnln4yW+z9Y
	 Q/O2+xejF+R9XAgeUIO9B08J6+GxNgwXo2VcKeFf04esQ2pNutfuEcF8zn9RN3ZoPO
	 /sWt0obW7jlBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BB95810D6;
	Thu, 26 Feb 2026 19:40:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EAA63204
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 19:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC06A810D2
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 19:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqdfnP1KqXeb for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 19:40:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 518D5810D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 518D5810D6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 518D5810D6
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 19:40:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D7EB1A4C2FC3;
 Thu, 26 Feb 2026 20:40:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55590)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vvhDs-0000000063M-3GeO;
 Thu, 26 Feb 2026 19:40:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Thu, 26 Feb 2026 20:40:30 +0100
Message-ID: <20260226194032.4110146-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226194032.4110146-1-bernd@kuhls.net>
References: <20260226194032.4110146-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772134832;
 bh=BvM6Lvhu5IkGpT5h6PrXZ40MqyQy9X71PnYwYJgaf7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Pn12Y11kD2juBNFmzcgiz6qTwuoR/M9Nlz8toWILZrJWaJ96edfvShsZH1YsObZGt
 GkL4Goq1z0nLh/1MWbAIWpwxAC0cf5gPA/cbLUypWIEzGvCy0O6dUPLuH9UB6Gm6c2
 87eiAZtaQ+z5RX1Gz3sd3mw2Yz2giTbh0R1H2ujS7ehEaDQGHgMaOTaMtb8IxoxJ3p
 vXdskt+wDeJEMTW77Z3j6KQB16vabR3Vu9KYgGatnLKVC0obPGsX3btLyIdfltlVex
 jzSa1rB+uUXym2AkO18csMwGP5o0HaWT0qhqvjWX3I1jYXRDUPj6A+aDxsttdzp6kz
 SgKudiQRlQG4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Pn12Y11k
Subject: [Buildroot] [PATCH/next 2/3] package/spirv-llvm-translator: bump to
 llvm_release_220 branch
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

No released tag for llvm 22 yet.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 85ae98337c..a6cf243eb8 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  43080fd5122c71cd93a3d174d59b9fc95ff8aeb1847d50f394088112f6b2a217  spirv-llvm-translator-21.1.3.tar.gz
+sha256  8903b22559c471b31cb0a2e85edbcc34d555dbc092e06416f317bd8313ecf737  spirv-llvm-translator-567786558a00e8b7ec0457f1706504784e229150.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 0fb79e04d4..ab8b66cff4 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SPIRV_LLVM_TRANSLATOR_VERSION = 21.1.3
-SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,v$(SPIRV_LLVM_TRANSLATOR_VERSION))
+SPIRV_LLVM_TRANSLATOR_VERSION = 567786558a00e8b7ec0457f1706504784e229150
+SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
 HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm host-spirv-headers
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
