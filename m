Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D51C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 13:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA6B040791;
	Sun, 18 May 2025 13:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHSl-REr_XmG; Sun, 18 May 2025 13:03:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1669A40795
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1669A40795;
	Sun, 18 May 2025 13:03:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69956DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B4CC6087F
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:03:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTvlKLKQbegC for <buildroot@buildroot.org>;
 Sun, 18 May 2025 13:03:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D75160608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D75160608
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D75160608
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:03:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20544A4C2059
 for <buildroot@buildroot.org>; Sun, 18 May 2025 15:03:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39012)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGdfn-000000003VX-1Nzm
 for buildroot@buildroot.org; Sun, 18 May 2025 13:03:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 15:03:23 +0200
Message-Id: <20250518130323.2598282-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747573404;
 bh=gATxv8u/gTPDmIbtfhcfO1aTH3xhua6/MbsSki3Q3eQ=;
 h=From:To:Subject:Date:From;
 b=e0DfJyELkuC96H2S/YFnxHK2uS+eP5oQPNE/5EAE4RlxW71vJPPO+1etu5GW6ZVSB
 24eV7pSz2KmpReqPTUjvdUhgeOFKmT5j3AZMgPeRjJPSJ73GTBagZJlaSoRgSEcIik
 qnuCecbdMTOQASKzlFT4RjMt18fRHTVOLoTWod/SeKDUNOtd6mVHy3oUXoRr4lbnjG
 d0KFlaVvLu1JFal1dn/btxHl9mpBioaPG4YQX5OjT2o2rR2JKsHSo2i8pGRPDjKkq9
 kVomBNwA0JemRysOEpxRsTMm5pMC3XG6RHeDdUz43dOfqI+mXFH+Gs2HhVTxlutnWz
 UwV7ioXvLfMJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=e0DfJyEL
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: remove autoreconf
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

Buildroot commit 96a7db5a4b7526ecf744d89d9c19986b91626325 removed
0011-configure.ac-fix-UMP-support-detection.patch but forgot to remove
ALSA_UTILS_AUTORECONF = YES as well.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/alsa-utils/alsa-utils.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 5620cc0e41..64da2201bf 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -9,8 +9,6 @@ ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
 ALSA_UTILS_LICENSE_FILES = COPYING
-# 0011-configure.ac-fix-UMP-support-detection.patch
-ALSA_UTILS_AUTORECONF = YES
 ALSA_UTILS_INSTALL_STAGING = YES
 ALSA_UTILS_DEPENDENCIES = host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses) \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
