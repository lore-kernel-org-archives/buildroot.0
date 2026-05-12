Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747D9CD343F
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 16:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68F8940AD2;
	Tue, 12 May 2026 16:19:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b32QqNFHTjoq; Tue, 12 May 2026 16:19:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D4CF408C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778602751;
	bh=Ctplnjhch2wurZ0/J7bnCbucirUES0wFA0zlWYCFFtg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AGFWxDpR1kmlt+Wc0X3vs9lqaCjB8QCo/ouTMyNlkOi9ltGcXSEXTomcW84mBh3K4
	 Lga7C8Tgbh34WDA66C/+hZeX+HF3lywvoNIoAoFuzxa3LTLSuNgscPYrEWB4TApSEk
	 3uUvrTRuGSkYNsFbArLlh0SuwZto6vcoWHGhPojgHBHxXi4XaLEio/eraQK7QAwwUn
	 ifCF30IVuNLq/F64AC393GR7CyVcJzsMJSU4cqsbTsGapKUBhX6aNsu+jSl0WuVV85
	 mb2Iem3fdFrJzb2yxNBT7G+zMoHJ8Pb7+8p75Hr9Vmk8bS92PNyrBIhwZTXgJ53QaY
	 Dcj9yDx//pYDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D4CF408C1;
	Tue, 12 May 2026 16:19:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F7B6223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15EEA4065A
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B99J9uanc68P for <buildroot@buildroot.org>;
 Tue, 12 May 2026 16:19:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DBB9B40291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBB9B40291
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBB9B40291
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:19:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 00AE5A4C0144
 for <buildroot@buildroot.org>; Tue, 12 May 2026 18:19:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36332)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMpp4-000000002iY-2lr7
 for buildroot@buildroot.org; Tue, 12 May 2026 16:19:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 18:19:06 +0200
Message-ID: <20260512161906.2942572-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778602747;
 bh=Y9XXi7/AbmUL/T6gJyMx8FkyQBZ3yNZfyInv0W3adCQ=;
 h=From:To:Subject:Date:From;
 b=pH42UfqSRVJt4WaDMko8xQBdJW+4cWbY5FbE8RCBiq51bWH1QrvWvVk/629Sy25aT
 CyE6xdEtpcBnR9kkNHUN3KdwMuf3kro+uIsIcyivmCev7NRetteNy/ZI/enz7jFJTO
 QsdbRZxDsxr1rbhIWQSRpuxtFslInwYbs+BiamXJ23qiuCRCWWkjZw6HahWb25PwU7
 OcxB3XbPlyHQ0ITqnNx9nQh8xt9YlC0K2y8YiLvbEwdWsQR+JT+vlvQDNYXuleEEHV
 ByFdWEPnT6mq28M1sDUL9xroktVPYh6dFQB9osNxDBV+0PDV5tkM1DwFT6d6REaUb9
 uEgypgoHy+L2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=pH42UfqS
Subject: [Buildroot] [PATCH/next 1/1] package/libunwind: bump to version
 1.8.3
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

https://github.com/libunwind/libunwind/releases/tag/v1.8.2
https://github.com/libunwind/libunwind/releases/tag/v1.8.3

Switched to tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libunwind/libunwind.hash | 4 ++--
 package/libunwind/libunwind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libunwind/libunwind.hash b/package/libunwind/libunwind.hash
index 512cc7b9b5..02aa2bcbd7 100644
--- a/package/libunwind/libunwind.hash
+++ b/package/libunwind/libunwind.hash
@@ -1,5 +1,5 @@
-# Locally calculated after checking pgp signature
-sha256  ddf0e32dd5fafe5283198d37e4bf9decf7ba1770b6e7e006c33e6df79e6a6157  libunwind-1.8.1.tar.gz
+# From https://github.com/libunwind/libunwind/releases/tag/v1.8.3
+sha256  be30d910e67f58d82e753231f1357f326a1a088acf126b21ff77e60aab19b90b  libunwind-1.8.3.tar.gz
 
 # Hash for license file
 sha256  6a0dbbdaec2b3136b7bf045586f4212bdf74e7af688bf9dfe9154607cf5ec156  COPYING
diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 3eb3b483d1..689902c787 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNWIND_VERSION = 1.8.1
+LIBUNWIND_VERSION = 1.8.3
 LIBUNWIND_SITE = https://github.com/libunwind/libunwind/releases/download/v$(LIBUNWIND_VERSION)
 LIBUNWIND_INSTALL_STAGING = YES
 LIBUNWIND_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
