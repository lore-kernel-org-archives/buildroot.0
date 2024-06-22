Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B3FC27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 08:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8420540185;
	Sat, 22 Jun 2024 08:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUsIDxSrjad7; Sat, 22 Jun 2024 08:40:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61258404F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61258404F5;
	Sat, 22 Jun 2024 08:40:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E91E31BF5EA
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4CB040735
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQKbdZ66K6zg for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 08:40:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CEBD640727
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEBD640727
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CEBD640727
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 08:40:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf60.dip0.t-ipconnect.de [79.214.207.96])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5E796A4C0D1F;
 Sat, 22 Jun 2024 10:39:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40940)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sKwHN-000000001A7-3X0J;
 Sat, 22 Jun 2024 08:39:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 10:39:25 +0200
Message-Id: <20240622083925.10149-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240622083925.10149-1-bernd@kuhls.net>
References: <20240622083925.10149-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719045566;
 bh=XxvL0AcVUlCKB72gsjyxRmxvYXHbEUaQxJGH+rERhxw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KyxoRDWC8bzLcpU4hQPQMh5faD59j1wLAmFxcFmOu82e9ezr4BO5nda/Two473NU9
 wm5vTZHqFzBj1bjeSozIl3O2v0FwT2Z/fZEUTr2pGY8qJIdyFXSHHnuYwK/hnhEvEp
 g0RUI2Ubx0c4k5psVDQC0Ny6k1kdzgyhVo/vc9ZJd8bw+XqAcP/GliIE7c2FnRqM7c
 mPPSpOvsVohtozCm0Erri2yu/eVRMtyfBQfYUfTVWMkgrgHP6H8pyi6SQohyGXm7mf
 aZzYiRam79OP1s9ky+xZAgQRjaughmi6ssGPyCy0YUBs4fhYjHwq6rQqI09nmi6NC3
 hAffO8y67672A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=KyxoRDWC
Subject: [Buildroot] [PATCH 6/6] package/kodi-skin-confluence: bump version
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index e8098abed4..482da25cf2 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  99b243b7ccb9e0f3e1455e8967f99fd7d98d8924be0d9fe82de12448fe2ecc4e  kodi-skin-confluence-f8479bece875313049943fba834e551f6b7d2cf5.tar.gz
+sha256  d66fe75a261c6c2b9ac2923dc51d469ccc1df45a2462188e6a024a87bbe27311  kodi-skin-confluence-7bd4a396c492adb2d424d7f51d415fb565cda358.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index 68d25e184c..03aa4261cd 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SKIN_CONFLUENCE_VERSION = f8479bece875313049943fba834e551f6b7d2cf5
+KODI_SKIN_CONFLUENCE_VERSION = 7bd4a396c492adb2d424d7f51d415fb565cda358
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
