Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B88C83030
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 21:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C83980DC1;
	Thu,  3 Jul 2025 21:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fTGBVkNWV64P; Thu,  3 Jul 2025 21:01:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DAC280F6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DAC280F6A;
	Thu,  3 Jul 2025 21:01:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A917D15F
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 21:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FCDC615CB
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 21:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdl5Hh_maOGR for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 21:01:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 975636063C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 975636063C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 975636063C
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 21:01:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a07af.dip0.t-ipconnect.de [91.58.7.175])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B1460A4C3858
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 23:01:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54080)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uXR3c-000000004Ab-38px
 for buildroot@buildroot.org; Thu, 03 Jul 2025 21:01:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  3 Jul 2025 23:01:24 +0200
Message-Id: <20250703210124.1519578-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751576484;
 bh=8KQfMOsZCuAm53Ot4xYx/RaUv0QtqssawexTwKEpK70=;
 h=From:To:Subject:Date:From;
 b=tVxhyueDsogN2PuDuu4QsJmBnKz8lrGf+M1Nv22vyw5SLzjj0WiAm9wFFmfnC5/0e
 VBZl6YjrJYSBY6A9+TXAL8zz8HlvMPhUC/tyHSh14L6Seg7lVWhcLmUFO/rkx64D15
 grapeyLef8vZPpSDnsjN5hdXVEfP+PeE5YXQehfd0hPRrEyjrbFKQBDe1xuoV+aiuQ
 QVP14wHR6B9e3kn31W2xhlJ4bD+AuJwYboTlKG3rZzoDsT4YtYhi352MKBgqHkZmOU
 7opwVk6ztFXVXXXSw6rDImfo9ejt+ry693WLIlrBruh1F9IlRj3oXqVCSzi0uBFmI4
 aIxRZbTrnJG3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=tVxhyueD
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-iptvsimple: bump version
 to 21.11.0-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index 59082d01be..56598d88f7 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4ab62a6ee946de406fa2ae502f9e7b1c591ff6aabc2777b5c26ad5b748e2cd02  kodi-pvr-iptvsimple-21.10.2-Omega.tar.gz
+sha256  377fb3c69d39866c0b3b8a3a7d4c790241b15997b140f45443209c4e44e62418  kodi-pvr-iptvsimple-21.11.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index aa75fc5f65..0a4d9f5f1a 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 21.10.2-Omega
+KODI_PVR_IPTVSIMPLE_VERSION = 21.11.0-Omega
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
