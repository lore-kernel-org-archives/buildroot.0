Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D26EA7946
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 20:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9565582391;
	Wed,  4 Feb 2026 20:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jRksrs4xrdn5; Wed,  4 Feb 2026 20:05:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D3A182423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770235549;
	bh=R9OLOTPIMXZsOxtS46zkIs+ILZe34xNwLQf0/UUnelM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cRqJ+gqu0S8xHWhtuv4Xhm2E0Ib6sUL1BhDOM+pu9R3F4/2wE+9WhicmPtcO0gzui
	 UYcJxlS/Kve1HgX9wSvq5xET+5zmi4E9N0hL/gQcKT4n3dpJ2Yxfo8NgCYbPEfWOvL
	 yeZdDELhlbZ7dpuKxgL8Ps3nbRXQxC9mlXFMEIoC7mAyB/ytfJAr5WvCuYeWpLPbq2
	 ZCF88uAXJpU9ejhK6ey4+4wOHGGcEcfmomBJ7aI7F/La7cAhv5iS9euUiy8IUHTn0z
	 ThPGl9l6x7iemiB02GhtLhRwp31933sYzwT+SROyPJfWsHcTi8ycJR9Hue/JqKbCJy
	 Y2CLQkVgs11HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D3A182423;
	Wed,  4 Feb 2026 20:05:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA92F173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 20:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C6F740C3A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 20:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G04Gdld5B8LR for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 20:05:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0DBA4050D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0DBA4050D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0DBA4050D
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 20:05:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4D02BA4C534A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 21:05:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42250)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vnj8D-000000008Jp-0arA
 for buildroot@buildroot.org; Wed, 04 Feb 2026 20:05:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 21:05:43 +0100
Message-ID: <20260204200544.3753631-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770235545;
 bh=oLcJBSx4a7w9J0iSQr0EBEmzQnTbHlXVH8XtRBgo1ms=;
 h=From:To:Subject:Date:From;
 b=Yykox7Pq/fvO3Fef9fLigL+tC9bb3ejDUIsushDaOJ0ETYR62jO42VPIlCSUB0+XF
 pbwagfbfZr7/3VsxsC8InqDJ2douRZF/KFwcrxjX4McgUPiNFcv8hgvrJVwY61NA+k
 1zDKv8AZKEJMJmnbGNpNQjIIRiZOEeGoC+tTv/Xrf59qeiTxnq4wPXcTsLE4kIrxh+
 lFOBQ0Vbcq+vNl5Tk4Pnc9Zz541HoeALxrHeQ9H6TyG/rJIJ6TWzKaFrYKid/xaPng
 FUJhIZymKuZKXoMRDQg655duphSggavL4RUnzQlS+pGcVrkt9Pc441vdhyLM1mNMxz
 ZTAItpeAmbYGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Yykox7Pq
Subject: [Buildroot] [PATCH 1/2] package/kodi-pvr-waipu: bump version to
 21.12.6-Omega
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

https://github.com/flubshi/pvr.waipu/releases/tag/21.12.6-Omega

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index d97f9ca7a9..96cfeb940b 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  28750b8513ca2df69d2d661a1d832689a1571b6793e98243eb29e3aed03c7f26  kodi-pvr-waipu-21.12.5-Omega.tar.gz
+sha256  80e4723a228b27447fe6e83c9e2aa4e9ebfc0d2a3618fbe0491b6d2440124b64  kodi-pvr-waipu-21.12.6-Omega.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 03525b295b..177c1236b1 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.12.5-Omega
+KODI_PVR_WAIPU_VERSION = 21.12.6-Omega
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
