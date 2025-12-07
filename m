Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88976D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6314D6065F;
	Sun,  7 Dec 2025 14:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_LNHFdJIa-S; Sun,  7 Dec 2025 14:48:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB63A60670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118894;
	bh=g6U0EzyZwGilMEvMPDJCcEvbJGWiBGtvXDp6s7MEgdk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MS4GUAgj5a5XUs+JC2CrycvaU6Hv3JTRSxW4reneqaw7WtO/qv2wagKHITyj6vJw5
	 SJExm0umoql3evYskSic3jjGbc9NiAzx2ksi4CCtTz45IgOS2B3RdrAsrHbhBIqJOi
	 vHSNbgrpB1IqSp/uPGioUrNmVYXdtvEtxYFOx3khUH5A/4zTRjoky/BTot5YRLuhpH
	 RNNOGNuObUwtJgAxv0RMn5+ZIgKEsn1fQpPjqeIQdU10rW++MhmB8Tmrv/0v4X+fdB
	 GELP1qbx2NW+qUEw11dK8mIwpbMJ2GulnomFcDaUDGFE1RIrpFOb0EJZNhgGBdKpd2
	 HCjyb83C3MKKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB63A60670;
	Sun,  7 Dec 2025 14:48:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 485302CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A2F882218
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOanQbNI4y47 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:48:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C10F821FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C10F821FB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C10F821FB
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:48:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 13410A4C0FFB;
 Sun,  7 Dec 2025 15:43:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyI-00000000416-2uDg;
 Sun, 07 Dec 2025 14:42:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:37 +0100
Message-ID: <20251207144243.3696572-28-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118580;
 bh=m5G3IFrk9mALuGuIZsenPOi64HuU/+4UOlRXqU4IW0k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TZGMcS6o1xmb1KO9aqg94XGfeTe29PXCaxkf1KXVGc6z0MMDsDFHsI9YsI0yGcrEX
 u2nwwsQoTJzZV+kuew1RiJbmEAHP7kunJ38lqFXUCm8XXF2XbrDYDuT5WBZICEEcwi
 ztltTeh3QxjMHFST9Dc8pk1Y3WIx8gZZ/eYFywfwqL8yEcbMNn38oQntLchhlhx7pl
 3iiAG5KPy8DUh0P0VfiFXZWIvvlmo+XxYLwF0oJ37adk07p7MpHrw5O1aPtK4KD0JN
 b1gsFM4iFyqlObTyxc/16ugmp7lPG1KSZIa7wkeWp4sOupqt4bmtMTdINCS/SA0auB
 n0i+FanC2Xi6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TZGMcS6o
Subject: [Buildroot] [PATCH/next 28/33] package/x11r7/xapp_xprop: bump
 version to 1.2.8
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2024-November/003558.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xprop/xapp_xprop.hash | 6 +++---
 package/x11r7/xapp_xprop/xapp_xprop.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xprop/xapp_xprop.hash b/package/x11r7/xapp_xprop/xapp_xprop.hash
index 9db2fb9125..166650086b 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.hash
+++ b/package/x11r7/xapp_xprop/xapp_xprop.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003269.html
-sha256  580b8525b12ecc0144aa16c88b0aafa76d2e799b44c8c6c50f9ce92788b5586e  xprop-1.2.6.tar.xz
-sha512  ab25d4b8bf9de8fb37149060ad4870ffed4d6846ac3b31903a42c36301fcb0d50d3ba15949fdd9079507db97d3f05d4bbd11711d825e5470482cc30772cc3f25  xprop-1.2.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-November/003558.html
+sha256  d689e2adb7ef7b439f6469b51cda8a7daefc83243854c2a3b8f84d0f029d67ee  xprop-1.2.8.tar.xz
+sha512  bdd9b02c4ee738bb4661c3acc901330e635b9967de5efb1615297f6b0ff3cdbd0eab6f63f80a605539090e8d62c611bb603da17477e16e3c0b26ff4314d0b664  xprop-1.2.8.tar.xz
 # Locally computed
 sha256  f19ff982936cca133b9593a6561c3817512207e0b4c951d0e4eb5956d30d4415  COPYING
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
index 888e9d3a69..ad03e23e60 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ b/package/x11r7/xapp_xprop/xapp_xprop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XPROP_VERSION = 1.2.6
+XAPP_XPROP_VERSION = 1.2.8
 XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.xz
 XAPP_XPROP_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XPROP_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
