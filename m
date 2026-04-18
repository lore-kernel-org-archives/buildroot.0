Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88001F99C82
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 13:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38D508226E;
	Sat, 18 Apr 2026 13:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4wugWuoVFN0; Sat, 18 Apr 2026 13:52:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B7DE8225B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776520353;
	bh=dIqexpNZhIfnie3DInCVlTUts2WzbGnjObfYRQYsv7s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l1vgEarlKjdfIJtSx5QbqI5ELPtNPsGACBGvfX6ONU6lTSPAe1eTrq1+Hc/OCM6Ks
	 LaJuWkf8R9Acs9ll6i01755b8tVE9NzSOvM/3tGqoJtLgzhRVZQDBbpOULBoLrDqFP
	 6pdLx0bc9MrKNwndWvlI5AUR6YbFHdLamGEEF4K0hIvNI89X3TgvKZsJA73yTF3Ywe
	 PEGFYIqcJe3GBwJXyKxvsVjsOW2p93w54BgdBhebJR3DApiOK8SB0k4RJ/DJ5CMSgo
	 93pS4oBWQqYPFqKHGNGlgcB/2nyksm9wq3nM4pPaTdmyzKOddiZ5tr6XxPOkUStnkP
	 apFiUW+XZ8e2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B7DE8225B;
	Sat, 18 Apr 2026 13:52:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC53035B
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 13:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE7614071B
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 13:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_fyyHy7EO9H for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 13:52:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F0C6406DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F0C6406DD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F0C6406DD
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 13:52:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cdea.dip0.t-ipconnect.de [79.214.205.234])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A0E35A4C11EB
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 15:52:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50430)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wE661-0000000009X-2nHY
 for buildroot@buildroot.org; Sat, 18 Apr 2026 13:52:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 18 Apr 2026 15:52:29 +0200
Message-ID: <20260418135229.1371349-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776520349;
 bh=SlixEPdcTRviWwZV1ExBglSq81fN/6OdFLuexV9+9TE=;
 h=From:To:Subject:Date:From;
 b=s8MVWcntzrv8gGI2HJBkvFjZ/2JO1FGMvKHHax7XaFQKmyUqfEflwmozlsynYOOi7
 XM6mUi1gs/K+MNVODJsg0Qht3xAIla+fQ1+CVThmfflB+9Jclmju25dAhBdbIuhnjs
 0gLdRmvl1W4oRIcFOkV7FZe+YjRaiwYtr6D0hiy5wKeCLVftsWaoXOSSFH8kxXs7pF
 67Jm5/pIki5QNNGm0OpMKdntleDMUEJTqXpu+z7OEZJv2wHiLjJk/e3x9QLaeD8jZT
 3MjJTCXRJJO/Uk2PtJfZlsjl4dCLi5/TjnUa32BQV3CIus9NsT1z0hdVQCxbnyiDfh
 qh/3oNXwCx4Ag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=s8MVWcnt
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version to
 21.3.5-Omega
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

https://github.com/janbar/pvr.mythtv/blob/21.3.5-Omega/pvr.mythtv/changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index dde8406aae..004ad86448 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8dbbc12e5b95adeda229a572e24202abda52284f59a96c30798d7d3a855f6a42  kodi-pvr-mythtv-21.3.3-Omega.tar.gz
+sha256  37e7ffd44707d135fd5512d560fce34ad02880410142df1b3b607a834634bc99  kodi-pvr-mythtv-21.3.5-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 9ab39ac092..063b39f582 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 21.3.3-Omega
+KODI_PVR_MYTHTV_VERSION = 21.3.5-Omega
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
