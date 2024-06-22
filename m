Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30474C2BB85
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 08:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC69040185;
	Sat, 22 Jun 2024 08:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dC1TqZWF4q6b; Sat, 22 Jun 2024 08:39:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E4824056B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E4824056B;
	Sat, 22 Jun 2024 08:39:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CD701BF5EA
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0830260683
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2kNLWIEa_6no for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 08:39:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F1436067D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F1436067D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F1436067D
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 08:39:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf60.dip0.t-ipconnect.de [79.214.207.96])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EA946A4C0BE1;
 Sat, 22 Jun 2024 10:39:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40940)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sKwHN-000000001A7-1ujq;
 Sat, 22 Jun 2024 08:39:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 10:39:21 +0200
Message-Id: <20240622083925.10149-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240622083925.10149-1-bernd@kuhls.net>
References: <20240622083925.10149-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719045565;
 bh=nCjOF+wZFuSRhAFeXaU2VYfOA6K+SGFr7/t2+yZrHME=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gRWlBGkbQR8UVFQb1TOTTtcm66EUT7kuLgukZkO6OB8Xo3ehy3phPOGyHLBXREnp8
 DXykX/VXmsCNr+l+c5CVwMfALZVmEdSG402EQHplSW5IWNWoWNZ7xOt8Iw9jtHd7BF
 hHdTYlocgGUe5slhAQQv5t7FKvBKz3eSP3JLNSIgBtjvdcNJLtRs8W66oZfZP7yH90
 B9Eh+8YTSA9Det0kl39n/zZOdpdqzJP0QPKfhhg1/a+ju8A8yvy7xA9KdsRM1jsKq4
 akZYewT5BxR3etNM9SYwscOQywvUOnK0GcCoeB5tgN4t7roIsZlm1v/+vaerc6PW+L
 3SBfQtVUSHbLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=gRWlBGkb
Subject: [Buildroot] [PATCH 2/6] package/kodi-peripheral-joystick: bump
 version to 21.1.18-Omega
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
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index 9cea40965f..a9d27bd70d 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b152c6f17291ede48850bf307e6d619ff803e1b26217ccec532d5c49a3ef7b84  kodi-peripheral-joystick-21.1.15-Omega.tar.gz
+sha256  226366b69536579d1adccb8548ba20c1b094876ce481bab81f744affa71bb305  kodi-peripheral-joystick-21.1.18-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index 34ea45855e..aceefba55a 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 21.1.15-Omega
+KODI_PERIPHERAL_JOYSTICK_VERSION = 21.1.18-Omega
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
