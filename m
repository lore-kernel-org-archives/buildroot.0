Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BA5F47CC6
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 19:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D26C141871;
	Thu,  5 Mar 2026 19:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UIPlebmaFxKK; Thu,  5 Mar 2026 19:50:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A87EC41859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772740209;
	bh=imp6B4iyVRT5QUHYpIzeh1jfeHzu16w4YW4ajZXZcG8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lj5qP3Z2bU2eewdovymK1ekzCbpj4IebKlZRohg33VKV3P/yN//08psMJ7Q5UwW6s
	 kjR0ZfM4/PSlzugQqstAa/79kOsF6lJx9SFS89iIo210gcgBcTFK8QKCydYdAdrGDX
	 pb3ZTaEd5nzM0svnsDOx8dC2NCPbG7aqovvyoi4WXZc9lOrqaQGesVKqlGoEwiEqxD
	 lDiHhDsCfoa1TSPK8DSeOvOV2VTeUhh7KXkkiuoJ7gF/Va6rj8oIGjjrDAVKpmbgsT
	 Pjwi23ES2W+Xnb5eKFCtyvbQeR10NItVnChMv+Ouawpx13qUhpPdBEpWcHodx5fgYK
	 KbZAohNq8o39A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A87EC41859;
	Thu,  5 Mar 2026 19:50:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E1F4223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 19:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 400F382660
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 19:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLtw9t36RMAI for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 19:50:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3ABA682477
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ABA682477
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3ABA682477
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 19:50:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 13614A4C3715;
 Thu,  5 Mar 2026 20:50:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54384)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyEhv-0000000062g-31tG;
 Thu, 05 Mar 2026 19:50:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Thu,  5 Mar 2026 20:50:01 +0100
Message-ID: <20260305195003.147773-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305195003.147773-1-bernd@kuhls.net>
References: <20260305195003.147773-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772740204;
 bh=QHbnLnQwq9Qik3RgvdEBAhZce2T9oTRp+QLqKOU5hlQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=eYIejG5rhsPyxLtt5uAtlgR3IZDURUgof5dthSpSHDbzLfHNcs42TT7QucPDagibj
 g6Ja4bz+4+uX+raeKjwbvJ4yLmWg3zXWpMJJ2G6zmF9v0aFa+8wVxKbNjTmAci5TFx
 KwqKpqDOIGxHf+6mglRO3fYunFphSQ1nnNzXBxg2OCnDZ3X6oahv9JVoUEzay++afu
 EozouaV96U3KgRCJh1Z92CbNLdJLy+izhZXgdTihgphnOwZm2dB7+NJu6M8vmz0l/Q
 sc7Ui4oMDoH+Y+Dc6Dk9bt+Rb/3TrvrQFLL6xA+HkFlXelfOOditrDtpXxC/1QxOLz
 Lx1p5y/Z4eobg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=eYIejG5r
Subject: [Buildroot] [PATCH 2/3] package/spirv-llvm-translator: bump version
 to 22.1.0
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
