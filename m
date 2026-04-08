Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3458E10F9964
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 17:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 542064101B;
	Wed,  8 Apr 2026 17:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6rgU7Dhg0jNV; Wed,  8 Apr 2026 17:17:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EA2040FED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775668644;
	bh=6mG3DgP8iZN0ntsBK9euPJsfgdYSwumaoHuQtTvCeBQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m67gGuhQmG0yT6KiXmWH85XWOkGaTSmnIcfpCWNdbFY5D8hVWv3LJiTwmZoaETKmY
	 HjhIHwd489uQVAldcWOUwL+mJCsRHj2PHK7ARaHSTewrEEdhtO4JlrRCNytws5THi+
	 WHfI+XKmUhlTXkJnJgDAhuYOkgQ1RtaR3y93lMYbxjrDdla9uoZQ/wN+8fEnsbPpHs
	 ZcBlwQeNtCbTNHGQcnzbwwnxrcVAkWt81hxmghUDbA62Q0hbbEicF3P/ymCzl55Gm1
	 oo3SedrBNY2rLAnPGj+YElxEYPi61xBnOgZYSaO4AZsqrs+zANZBlg22R58guTNUTb
	 dYB2AsD44QTaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EA2040FED;
	Wed,  8 Apr 2026 17:17:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B798237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 17:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D1B640377
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 17:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1zibpJpdP6d for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 17:17:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83944403C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83944403C4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83944403C4
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 17:17:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 27968A4C3469;
 Wed,  8 Apr 2026 19:17:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36146)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAWWj-000000007Hq-3I26;
 Wed, 08 Apr 2026 17:17:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Wed,  8 Apr 2026 19:17:17 +0200
Message-ID: <20260408171717.3533474-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775668638;
 bh=OFV1n9j2pvIIAr2u/N+PKl2I7OxJWOiQIyfLQIPUM/U=;
 h=From:To:Cc:Subject:Date:From;
 b=dwJ1eVxSSM99EFbDlrO0SbSqFAv8bvTkicw1eAO/enrdbmCxI5qidNy1PHt9vitBo
 L8UD2owlpofJskvKZLb7SnrpOEfoPcizY5gYN2sAriCHn1v0Ea9yVeX93x99+rjegu
 AoVY/faBjSPV8LBzJ1NMXkliD+G/3WYXFB43jz36dq3SPsGb92T/m88EElYlzkh0/m
 uMlDCk4QT2NcLOkFRUeWTOHlYaoZpdSZAOPGVYunF9IiR7ITzafM7hV9R0cexsTjC3
 g4dQFyhd+l9QAotS321iD3QBHJsaom8NXIYlWa1GvnwUxtLUlFhdNw9nek4qMQfLkM
 /efPpABKEkfGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=dwJ1eVxS
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to 22.1.3
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

https://discourse.llvm.org/t/llvm-22-1-3-released/90467

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 095dc76dfd..282bca63f7 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.2
-sha256  62f2f13ff25b1bb28ea507888e858212d19aafb65e8e72b4a65ee0629ec4ae0c  llvm-project-22.1.2.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.3
+sha256  2488c33a959eafba1c44f253e5bbe7ac958eb53fa626298a3a5f4b87373767cd  llvm-project-22.1.3.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index becbcc0612..6f12cbaa58 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.2
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.3
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
