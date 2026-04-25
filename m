Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0765BFF885D
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 08:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3FE260DBD;
	Sat, 25 Apr 2026 08:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxG5c2rRe-GQ; Sat, 25 Apr 2026 08:08:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C12C260DB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777104520;
	bh=l6PU30erpl3fm405835Ld9MXhZLVyPhIt+H+iDkrcvg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qmjsg0szY0cd54nkDtWFDj3lCK8kqaFUJv2thQjY7MFJby6ipG5lvxVHxBB+7fEwh
	 sQGF+cKAduS6VaTOXnQJHfb/TZXX/sUSU5qBRlNdKJFHJNguIm9eDCwDPZhVA8QQhC
	 ZQCYViqsR7aDK9j8UznlQ7ZkveMt9X4hYGFq3I4rBeBvPq9LKoXIkq3o3Ly7G6gGCc
	 nTVKvwmTFsPQ7w+ZrenHrsCH/ZTMCrKZA+ny5YlseP+0FKyn5x8x1VTQoQpR+mBQ43
	 Zgl4iujXVpbplZdsdBJEvFclNUbkE4kwido8FjQRnoZ9y/6vvcZBaIK+h6pUKY49lD
	 /WBpGs9psbfCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C12C260DB8;
	Sat, 25 Apr 2026 08:08:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28AA3231
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EBAE83033
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFLBhKp1jN69 for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 08:08:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67E0A8302F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67E0A8302F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67E0A8302F
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:08:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a07a9.dip0.t-ipconnect.de [91.58.7.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 039FEA4C0432
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 10:08:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38742)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGY41-000000001PT-2ong
 for buildroot@buildroot.org; Sat, 25 Apr 2026 08:08:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 25 Apr 2026 10:08:33 +0200
Message-ID: <20260425080833.786167-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777104514;
 bh=VXB7IGq2bSkyGAnbGAMYBbrVkDLs0TsNjJvNqMHYky4=;
 h=From:To:Subject:Date:From;
 b=MvAcl37fVrkEmqEC+SObrxBf9rWrJYEgvfWjGOpVgYN4Aj1FDmT/+sv/IQVgdPQEX
 i1fzE3h0+f01YjfQaOri4bP9XUSHWD9FZRtjxAU9thybSOaZd/iuXwV5Pab5rTAQnV
 YNciM2TvEBIDe2BmZMjlNqzLkYBi5823IXFCKvHGsV2v1WFaWks8o3XxTzjZPS3+Nt
 Qho/EW1I2KVTFMrV2Mq1A6fG2Nkvd1e7wEEUdBCBFR3msfGTpWRm+7R1M7bHuXQxpK
 /JE9+PbN8mUMZqdhh3PTnaVbvA/FKnCupFaGydXv9OLCgAwwCeKZwu07fGlfD209V0
 be2YcdOvpfAFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=MvAcl37f
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.24.1
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

https://www.samba.org/samba/history/samba-4.24.1.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index d9bb2eac01..a8edb75297 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.24.0.tar.asc
-sha256  1b1e457fd651a612cd08226cc6efd04e5d01e36d918c8b4c4e470e74e86881ea  samba-4.24.0.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.24.1.tar.asc
+sha256  217151ca318a5576f8e0de72ba0acdf08157ecf12adac42d1af86db0b09a5f5a  samba-4.24.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index e5d73a43ef..295571ccf2 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.24.0
+SAMBA4_VERSION = 4.24.1
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
