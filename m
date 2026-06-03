Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16DDCD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 13:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88B8E80689;
	Wed,  3 Jun 2026 13:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kR7vSymcW37p; Wed,  3 Jun 2026 13:54:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC0D9806C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780494864;
	bh=tChiM+MwnXvrD9JggZQgryMEuXfWUf+GIafznAtsA3A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EiTdooZbjsfTpDntPJbduucGUnctOkaavbLAHfRx8J9zFPXWtHUpSlCc12POwMPof
	 QQ8khS7HtiXnHuilthOTAkiENqZcIg9FCBS/S45uGUYErgID0FrDeBYKAkijnzPJzD
	 cxbdAe07p1v6MDG/wG9b3BV5s222afm34vNMuVhzaJSiG7MsTOGIty4KPmjUmYa5Fx
	 RWDW9vh8oreiFAKpdCO679T7p4Wp+JeVJJjZ03a1BqMXF44NHm8MvmTaP7m4PFFDp7
	 GXyywyOSQxKGma6XA4oZGD+OY8PMsESY2GnFmomcJg+R1DubLTtDR8wBuE16fC/rUd
	 aL/T/Vi6Cq9sA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC0D9806C1;
	Wed,  3 Jun 2026 13:54:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB37B372
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 13:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD04C403B4
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 13:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-FLZfR0IeSl for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 13:54:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE0B840361
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE0B840361
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE0B840361
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 13:54:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d62.dip0.t-ipconnect.de [91.58.13.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5D78DA4C3C28
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 15:53:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36168)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUm2c-000000007Ea-0Gni
 for buildroot@buildroot.org; Wed, 03 Jun 2026 13:53:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Jun 2026 15:53:53 +0200
Message-ID: <20260603135353.3482326-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603135353.3482326-1-bernd@kuhls.net>
References: <20260603135353.3482326-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780494834;
 bh=MTyK7l6+qW/9knaPCyUc0uJHiXk0KXkJACcST+q7Zt0=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=PZ2q/MHR/cwSGlhqbezR4Kwex9e/AHqkWu8b5xAkfqWf1sW7CozMnXQJzBcf3aHVv
 MAi1xBpC6kSqBY3mS0hVhdAsuZXME0EqZtSG0EQrz5VXv0ugGBDBp8+tnHc3qI/PPq
 0ylb5hfZdvaJ2r1KnqEdsHwXm6xxKaXRWac7hy1uyKMu8nd8Ru3QRnBobxJwnB3wg2
 xA+25CkKRqm98sV+upOeFwZCMAraKD5g7hjCH7MHi015YD9/o/v+dBKWsvm2XOC3al
 28JFSQrJsfOeYsiH31BkvzFcTbQqMCucN3cJhfDMRJbTH4oyD2SCt/H6QAMCf9w67k
 z0OAO35MTsT2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PZ2q/MHR
Subject: [Buildroot] [PATCH/next 3/3] package/spirv-llvm-translator: bump
 version to 22.1.3
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

https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v22.1.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines stopped after reaching the 3h timeout:
https://gitlab.com/bkuhls/buildroot/-/commits/c506187f32ed69268ecbc57f190e27346a67e333

 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 59edb3f70d..c511c79785 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  b37196b1a1a60282a24cf937ab7d6807d7d54dc718f2a37a78e211be26df57ac  spirv-llvm-translator-22.1.2.tar.gz
+sha256  8d3d5c31c1ff355dbbf87046f1b94cd1ab5390439a817679ec71484df74cac18  spirv-llvm-translator-22.1.3.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 2d8170fc80..98e8f45037 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPIRV_LLVM_TRANSLATOR_VERSION = 22.1.2
+SPIRV_LLVM_TRANSLATOR_VERSION = 22.1.3
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,v$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
