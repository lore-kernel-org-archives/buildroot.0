Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742D2CCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 20:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 463A561510;
	Fri,  3 Oct 2025 20:14:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5g_fUafLQL2K; Fri,  3 Oct 2025 20:14:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58CB36151A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58CB36151A;
	Fri,  3 Oct 2025 20:14:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A23B118
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5017240E91
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kfrPHzSrO8j for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 20:14:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32B2E400E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32B2E400E2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32B2E400E2
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:14:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 63BF3A4C5BC6
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 22:14:02 +0200 (CEST)
Received: from [192.168.1.144] (port=39736 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4mAD-000000007eH-1ceP
 for buildroot@buildroot.org; Fri, 03 Oct 2025 20:14:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Oct 2025 22:14:01 +0200
Message-ID: <20251003201401.2430451-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759522442;
 bh=XpnINYvWcyk7soIRNBUu7mVKRD2eTN8z48heizWHk+Y=;
 h=From:To:Subject:Date:From;
 b=tijS1cVyulVW5ZMD+FU+w5xfoVsvNHG14Hze6U906sMJIcUofRqK19p+MKwwrvY7O
 zvx3734J7y9kZegsTVeM2tP+Ap6XCuraI8ESk7N2ztIMDMdvtASOkOYZlaKaCWIwan
 vwpBErETokB4PCI6n4d0LuehURHpX0fecNZ954Uh/TRZc3r4p7kMweggFW2NAvqH4e
 4M6XAVmYeGSV2popyGYKRh8AhNDRfSdFgmspr8kBoF0jD0Nb6re3mlLqaY4z+vo1Wy
 Ljnya9fRMStVr8pz+7m4PrQu94tZf7lYYO3hHTtEEq2fsIf9UNK8GEaPNeY16Ger9q
 IOoEpH/suQaqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=tijS1cVy
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.126
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
https://lists.x.org/archives/xorg-announce/2025-October/003632.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 8e8f6eb663..67a66ece0d 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-June/003606.html
-sha256  d4bae92797a50f81a93524762e0410a49cd84cfa0f997795bc0172ac8fb1d96a  libdrm-2.4.125.tar.xz
-sha512  faad141f48a49915c0312eb635df76968f0f4d41bb6851be625a7ae0e24826e7283b5ec9ec3b09ead9a96297bf42221c411288f9b000c3dbc159ed8dde93a7e4  libdrm-2.4.125.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-October/003632.html
+sha256  6cab16d4d259b6abc9f485233863454114a3c307eca806679aad3edbe967bf42  libdrm-2.4.126.tar.xz
+sha512  7cf2e2904025165562f0bf56faa57f3c3cca6f739c2afc299952bcb7bb1dcb86554c8060a7dbe070f2100d036b0ece615e0a55d9df00885679ae30b7e6ef0f0b  libdrm-2.4.126.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index c6a40c0f61..89a1a16eef 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.125
+LIBDRM_VERSION = 2.4.126
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
