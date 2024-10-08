Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1675DCEFC38
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 17:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D86CB6069D;
	Tue,  8 Oct 2024 17:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1pzgTzEaV1r; Tue,  8 Oct 2024 17:50:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0A08607FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0A08607FA;
	Tue,  8 Oct 2024 17:50:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89EF51BF344
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 17:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 786F5404CA
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 17:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VAmx3kxsmJME for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 17:50:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3788C4024E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3788C4024E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3788C4024E
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 17:50:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a86.dip0.t-ipconnect.de [91.58.10.134])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 13A6DA4C042A
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 19:50:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46770)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1syEM3-000000005Qn-1upv
 for buildroot@buildroot.org; Tue, 08 Oct 2024 17:50:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 19:50:39 +0200
Message-Id: <20241008175039.3626059-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1728409840;
 bh=C6i/a3mCjwz31S9cBhzMnnbHjelFKarP2otaBJht/rQ=;
 h=From:To:Subject:Date:From;
 b=ktUuTlMQ3b/f1Fg05g16TI49BCCwMMshME0K2zij9t4y2jnION1BmC3RGGgUEiP0n
 7czxsJVqcaFIPHcjp1+hO7Bs46LMPKyMCr9KUZYi8mz10fFrwHAWnVBgt8Lx1e1M6n
 w3gz5D3D7o2wEbRaXltnzcojujz0nEI+IdtxYjDY9w9fK4Eiv1VBPtKGvKnov31Z9N
 8jChFpQ/23xFjwpzg/XJoBGQGVAYDSavPu3CJoGoXbUD1uFReEFw6B/Olxq26Muqxe
 vLeHvVRnZW7ErRi/E1+hgdU3w1ewrLvpGk2PG/PTCDN6MFliealbkSgYaO8a4DKfm7
 q2SiXTpO4apng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=ktUuTlMQ
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-iptvsimple: bump version
 to 21.9.2-Omega
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
index c9509abc75..9e6e6a05f1 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fb526d408b5a707c169399aa41e6a111045c4c78d28b4971f4e51ccf02930b4a  kodi-pvr-iptvsimple-21.8.7-Omega.tar.gz
+sha256  e7c880c8298702a767e91c6735abc34baf0d3deea2f2ad96ccab1ea839b6ee18  kodi-pvr-iptvsimple-21.9.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 31175a978f..5c9615da3c 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 21.8.7-Omega
+KODI_PVR_IPTVSIMPLE_VERSION = 21.9.2-Omega
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
