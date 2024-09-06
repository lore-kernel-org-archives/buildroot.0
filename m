Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FD7E6FE4B
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 21:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08BF4401BD;
	Fri,  6 Sep 2024 21:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYY5fMT_NLI9; Fri,  6 Sep 2024 21:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C41AC40136
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C41AC40136;
	Fri,  6 Sep 2024 21:56:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FFF81BF37A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 21:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B39E400E7
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 21:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O70g-qDE9qLt for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 21:56:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D1FE40047
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D1FE40047
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D1FE40047
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 21:56:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc3e.dip0.t-ipconnect.de [79.214.204.62])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2415FA4C089D
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 23:56:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37300)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1smgwR-000000005uG-3gqR
 for buildroot@buildroot.org; Fri, 06 Sep 2024 21:56:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 23:56:30 +0200
Message-Id: <20240906215631.1737953-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240906215631.1737953-1-bernd@kuhls.net>
References: <20240906215631.1737953-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1725659792;
 bh=agPATNzvk+CJ52U+2B25NY1hvX5DBZa9n+mZp34Q5Dg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ga3Ecj4av5ToQiZtrynWGwfN75WbSesZ2pVT32VfIJFD3cF3tHPcoP6hTpku/P3lF
 1KkpGv0MpISjXWOYp5BxElB78QW0hkakrIShJsh+JdgyavxsQBrL8AQyk5gW+JqTfb
 mgfF5rCchtlF1+9HuyTyza5NwgSM/UWiRmMODHXc1qyHqe65t1tAQvtkN89L6CfXlF
 UMAJmbsdEGdgc0VIjRygGYteFPPIr9p0yQJLDye8Pt2xtRe/mKYMilzPGg5QLZ9eAG
 DHDKzULuMVfXD4SEf/s4yRYchBJL033CpUxiA4A9dL9YRfA8xAgtBTaE75FaKyo/x8
 8b+8f2y0AsuLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=ga3Ecj4a
Subject: [Buildroot] [PATCH 2/3] package/kodi-pvr-iptvsimple: bump version
 to 21.8.6-Omega
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index 560eea27e6..14fad490b9 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  aa463ad43e0dda1aaf10f5fca562823d91762671ad5b5077f5dbaeb7dc425fa7  kodi-pvr-iptvsimple-21.8.5-Omega.tar.gz
+sha256  191a56c10fc3639a6d3d5dffeaac38425c70b5196afa23b623cb205d5c3be4a6  kodi-pvr-iptvsimple-21.8.6-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 04b8327344..50a221857d 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 21.8.5-Omega
+KODI_PVR_IPTVSIMPLE_VERSION = 21.8.6-Omega
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
