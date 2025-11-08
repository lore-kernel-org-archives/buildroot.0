Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C64DCCFA1A
	for <buildroot@archiver.kernel.org>; Sat,  8 Nov 2025 08:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BD9140533;
	Sat,  8 Nov 2025 08:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id knAWNASzkOoz; Sat,  8 Nov 2025 08:24:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81BDA4053A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81BDA4053A;
	Sat,  8 Nov 2025 08:24:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F2FE2B8
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 08:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80D0881130
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 08:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qmRPTGP6-Sd for <buildroot@buildroot.org>;
 Sat,  8 Nov 2025 08:24:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B82281127
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B82281127
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B82281127
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 08:24:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd38.dip0.t-ipconnect.de [84.161.189.56])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 07FE5A4C3A0C
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 09:24:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48012)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vHeEr-000000001HN-2sDB
 for buildroot@buildroot.org; Sat, 08 Nov 2025 08:24:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Nov 2025 09:24:01 +0100
Message-ID: <20251108082401.14941-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762590242;
 bh=0baLAD8ZFeaRX3+x9qzU/pkfAZtZjoO+b4l8Bgc8KyA=;
 h=From:To:Subject:Date:From;
 b=D+sC1Tz7dIc871R3iRao+I6BNL+TkPkMECfLGAK2HbpL5R1+P55nu0qLCPzqfcwyw
 VJBihBphIZJ06UdRC4udDJJ0tulhIMsHGeBZZLZy0UjWdmJC3ITJ11rfIPiu7LqMZj
 8Dt1EVmUb1cJUNplEnNyFjGw6XjlLOwsAWlcqjk/GwQKDDjusAEKcYGfwaBHyysm+Y
 QQNFZrUz1+EeS0vztFFkKlu95/A+Kcg/nwTmT408NAH0RoHB2iMNdPwfDE4+K6yAn9
 TZ6n1JUmnk9/KuL22eQxFluyroRqetDcz6f0VmkILaZ/fj7yt2XWWkncHf6JisD4Fk
 MsW97H4eqbWyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=D+sC1Tz7
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.23.3
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
https://www.samba.org/samba/history/samba-4.23.3.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 462c3c919b..ec28ced087 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.23.2.tar.asc
-sha256  2de330647e1486683597e261285d04a9b7514ab5c7da27711736e22c7f2b9c2e  samba-4.23.2.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.23.3.tar.asc
+sha256  06cdbb27a6956978b045455fe0696d998ffbac8d24ba24de87a4ef8200813320  samba-4.23.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index fb2aab01c6..439e5452af 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.23.2
+SAMBA4_VERSION = 4.23.3
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
