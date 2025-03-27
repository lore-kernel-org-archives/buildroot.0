Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CB1C3600B
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 18:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3A584FD8;
	Thu, 27 Mar 2025 18:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnogPHFajO7S; Thu, 27 Mar 2025 18:28:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41E6184FB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41E6184FB3;
	Thu, 27 Mar 2025 18:28:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40BDA1B7
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 18:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 327EF4026C
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 18:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bauTJqQU2zMA for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 18:28:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D8D2040126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8D2040126
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8D2040126
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 18:28:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6caaa.dip0.t-ipconnect.de [79.214.202.170])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 075FFA4C027A
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 19:28:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47136)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1txryH-000000007ai-2jJw
 for buildroot@buildroot.org; Thu, 27 Mar 2025 18:28:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Mar 2025 19:28:53 +0100
Message-Id: <20250327182853.944114-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1743100134;
 bh=FRq+7yzxKUi2lEA//Mf3ifE4lmC4ETrw0xJ6DQnv/lo=;
 h=From:To:Subject:Date:From;
 b=YU17so8lsbien8X73JpJguR6w2DHgD0LtOHWc/uBRZ9YTRCSrkfQ5eqXaTvzu50hR
 9n2RhmSX1ji82sOlQi5Odd/ih3+Ao8R+pNUEYSWE7yKINjzIF+hFpDGyhAtht2XTxd
 lwlKY4MMV/PBvNnlYkEVzFgMsRWMK1LjIw0zRNuBZ84oOYfrNvTMLXYB/EDdGBR1d2
 ipgKilHrlOI3uu5lbCfc/zhkBKJM6ZHYUOx7bobW02m6kxOfowG7YsPm+MvpbuLji6
 r6CoWGGrtIBiUR86vGBdnC0OvEOo1r+IjigTUlTGp5vI9AiUlm/f2oBbdUms4U1KnC
 Al8+GPWggSd6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=YU17so8l
Subject: [Buildroot] [PATCH] package/samba4: bump version to 4.21.4
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

Release notes: https://www.samba.org/samba/history/samba-4.21.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 144894fd60..86b11b4d1f 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.21.3.tar.asc
-sha256  ae2179a613e7a5d4088735ab100d4ca1cae0f92374d6307e22eaec13ad90125c  samba-4.21.3.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.21.4.tar.asc
+sha256  50acf030db0ce6be1ee8a6c3a7636e54576c60a7f814e64becfa840f7b30eced  samba-4.21.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 70200279a4..ac3141f3d9 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.21.3
+SAMBA4_VERSION = 4.21.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
