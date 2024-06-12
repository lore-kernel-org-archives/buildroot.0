Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5312C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 19:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E7F341304;
	Wed, 12 Jun 2024 19:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFhlr3Sb7VOX; Wed, 12 Jun 2024 19:22:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D1FA412E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D1FA412E0;
	Wed, 12 Jun 2024 19:22:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBB0A1BF369
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9892810D0
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pHKy_3GIHeqW for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 19:22:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BF3B810CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BF3B810CF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BF3B810CF
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 19:22:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cd5a.dip0.t-ipconnect.de [79.214.205.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B07FFA4C3199
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 21:21:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35246)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sHTXf-000000007h4-0QA0
 for buildroot@buildroot.org; Wed, 12 Jun 2024 19:21:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 12 Jun 2024 21:21:53 +0200
Message-Id: <20240612192154.52253-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240612192154.52253-1-bernd@kuhls.net>
References: <20240612192154.52253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1718220115;
 bh=45EbU9jCDmxFLwynGRe+Ym0CAMTf8HFidqUWdFZ6Meg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=giXNAvI9llMlu+hNDC+2NIOX0tOhP2QfsD9skM7625jmgunaTLWNiuAXG1lLy1MV/
 ld9/OxK2qJbr5Xp6ISF/B4UcEPTeSOTWpVzfeXFl/gMs5HBXDVwYnDCK3xRGlu6N0l
 iIezFV0rz5/RxBIII1qbk2iFmmnE95IsoBt4z6yR4jSjOHC5bCWpRtuvSZBXT5Qiby
 ilBdAE0EgyppCD93echiKLavd2gWMpnMtf6GgtPKnjRrXVu4d7tSXiJPHAI4Pdk2Ze
 ErH4PlziMMGvFnO2S1Ll+ww5cRhGoQMBKL6P5FESkzmUu25sH7s31JbRYUJbqqpHy6
 48/YNGFVwAyVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=giXNAvI9
Subject: [Buildroot] [PATCH 5/6] package/kodi-pvr-zattoo: bump version to
 21.0.2-Omega
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
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index acffc6a7ee..d97bfce5b3 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5908de86c038b3565d8b3a8d4578d4cac0d37287fc039808542b874d9fb2bffa  kodi-pvr-zattoo-21.0.1-Omega.tar.gz
+sha256  859a64e152eca06a6210a80ad199e8b545c9fc9b85562eb12f980c1659ace72a  kodi-pvr-zattoo-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index d764524fbb..cba9d0b2ef 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 21.0.1-Omega
+KODI_PVR_ZATTOO_VERSION = 21.0.2-Omega
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
