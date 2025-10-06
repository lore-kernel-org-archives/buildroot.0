Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E816DCCA471
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 07:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73C1083F68;
	Mon,  6 Oct 2025 07:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQN45-LqHIeI; Mon,  6 Oct 2025 07:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92DDA83F52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92DDA83F52;
	Mon,  6 Oct 2025 07:22:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 734E4226
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 07:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AB0F83F52
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 07:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGFYImPJBxdZ for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 07:22:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9502883F4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9502883F4E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9502883F4E
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 07:22:51 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 467501910; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 06 Oct 2025 07:22:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1v5fYV-000UOs-2F;
 Mon, 06 Oct 2025 09:22:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  6 Oct 2025 09:22:45 +0200
Message-Id: <20251006072246.116846-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=VQdqDw+RGRVwDugpT6BRs9j4RUaDo2BInDeQIP+R+59I3bg/QlwTRdiQJ2aCWtfiJg7RbRJ5ILzy9DzVpyKoZ5tTNoSxeiJqAti0J5Am5ZPtLZTdcHjADxJU0/lobAwEa1a/G22gwoYGChcjs5c6HwzxGHGE/ZpZtGAW+pAHvpwy/lBk3NSdys7JZzGmbJMGpSH3MrXK1IPGh1mOY8KZiaBmf9xUjV9fySnyvVMqbrBQ9rSegZmdka/VaTMD80Fq+FlggLVTHWx5Ydjv4FSx9RTOh/ag2BWTKSDN5pWth5JceUiM5R9q5SJ82g1tDGNtHiyA8l8keL2obA698ase/A==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=i65bNeYq2RCfvFAB3whDG5oFso+Dl7B1y9uH9QV1eEs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=VQdqDw+R
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] boot/shim: bump to version 16.1
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

For various bugfixes. For details, see:

https://github.com/rhboot/shim/releases/tag/16.1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/shim/shim.hash | 2 +-
 boot/shim/shim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/shim/shim.hash b/boot/shim/shim.hash
index 14b0aa64cf..f36abd655d 100644
--- a/boot/shim/shim.hash
+++ b/boot/shim/shim.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  d503f778dc75895d3130da07e2ff23d2393862f95b6cd3d24b10cbd4af847217  shim-16.0.tar.bz2
+sha256  46319cd228d8f2c06c744241c0f342412329a7c630436fce7f82cf6936b1d603  shim-16.1.tar.bz2
 sha256  15edf527919ddcb2f514ab9d16ad07ef219e4bb490e0b79560be510f0c159cc2  COPYRIGHT
diff --git a/boot/shim/shim.mk b/boot/shim/shim.mk
index 0e5698b432..1bd3fac103 100644
--- a/boot/shim/shim.mk
+++ b/boot/shim/shim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHIM_VERSION = 16.0
+SHIM_VERSION = 16.1
 SHIM_SITE = https://github.com/rhboot/shim/releases/download/$(SHIM_VERSION)
 SHIM_SOURCE = shim-$(SHIM_VERSION).tar.bz2
 SHIM_LICENSE = BSD-2-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
