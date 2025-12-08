Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A283BD3B7EA
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 20:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0766C610AD;
	Mon,  8 Dec 2025 20:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMrlnQRKw6CY; Mon,  8 Dec 2025 20:35:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCEF060BEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765226101;
	bh=KzmEXT4FUDzc5xoNCTO4r/QodmYfrWOObX6RYPRgFyo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JXcLsGDf2uJ7eGnNzcDZa69QR8kCfSeWetCgAuP0NzRigHo0gkVUFcTChUTC+9oif
	 GTrxJS8V9gMB2O8g+9uGK+5FnPDM3sGJdfrSqDvTJKc2mhiu/ltPQTLx25zM+IMDVx
	 H4dQxwjngreoNHxCKJi5lDCw54h8hDQbFt4v8FX89aY7TRPaYc440j5rD7MuDShUrb
	 5VfLzGc2pKj+gQJnevsLVPIOTJrSHyOJffrB0bh9PbPh85+ZhbgLzcEMKo5e5+Ceie
	 2ACioxHRXb6muXJutAfA6mz2GgGW/RDIFe/Sfw+gMcU/kofB5HSJtD/sHq6k46YzPV
	 5wnqSQj0GLtxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCEF060BEA;
	Mon,  8 Dec 2025 20:35:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85552E7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77D42810E9
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jl1regZOlFkD for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 20:34:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59E29810DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59E29810DA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59E29810DA
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:34:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 26DFCA4C120A;
 Mon,  8 Dec 2025 21:34:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36038)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vShwe-000000000YN-20tM;
 Mon, 08 Dec 2025 20:34:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  8 Dec 2025 21:34:56 +0100
Message-ID: <20251208203456.3656837-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765226097;
 bh=1rBse3YR1zJ+Ahzw+UeVc83/T+7QHIgOwZhyIFz/ahY=;
 h=From:To:Cc:Subject:Date:From;
 b=OHQIE7wbqYPCmeJMmWu3FWIMLkSZ5x8T2FwGj3+ycd4C0YR+Jgp+wvzeZMRa1n3uW
 TNYKRzMo8NQyDENh/xf7SvSxM333CHi019y4jpqOlM7oOLyVoSCnqdxV06dMfeQjnO
 mEMS+0lpf2fP3U9KOZy063El063mhkoTNxtQOmHKat+lwjUrk7D2EO+tTQMAsD2OLC
 0Pkjg+ie5gkZB/TbJvVZ1GfikbiHomiaSNLJMAuhHglpfoK9pcJ3cI6cUA0lEr+f53
 w64IPKRy/VCRJf8JGvHauF2NxyqWi6PTm02lmLy6NmBj7AiKWM8TsiDcBgH3Ii29I/
 wMNk9twz9u1/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=OHQIE7wb
Subject: [Buildroot] [PATCH 1/1] package/libxslt: security bump version to
 1.1.45
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

Release notes:
https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.45.news

Fixes
CVE-2025-7424, CVE-2025-9714 & CVE-2025-11731.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libxslt/libxslt.hash | 4 ++--
 package/libxslt/libxslt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
index 98c68eded1..0523c51362 100644
--- a/package/libxslt/libxslt.hash
+++ b/package/libxslt/libxslt.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.43.sha256sum
-sha256  5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403f0183a  libxslt-1.1.43.tar.xz
+# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.45.sha256sum
+sha256  9acfe68419c4d06a45c550321b3212762d92f41465062ca4ea19e632ee5d216e  libxslt-1.1.45.tar.xz
 
 # Hash for license file:
 sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  Copyright
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index e92b383b89..229f3de2f6 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXSLT_VERSION = 1.1.43
+LIBXSLT_VERSION = 1.1.45
 LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
 LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
 LIBXSLT_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
