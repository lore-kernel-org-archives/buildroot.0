Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F506D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1778D60AC8;
	Sun,  7 Dec 2025 14:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCk3ZamaiGqI; Sun,  7 Dec 2025 14:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3827160B8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118930;
	bh=w+q2V6zc8LcxCGqPPLkcJ9KZduoWPea0bOsmnhDT48Q=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=R5rzC7cVNgWN1rGtqTkMm4qEeAQMUCz0UVMrcPVooAm5B+zP8v3J5n7Z6t8Hmpehi
	 /Lb+R7rcmc3RGcG1pUdUzCYRsbCDQmwkCt2s4aQB7N4BPtx21jHtb8EJ8KK7JtwN6E
	 r8EoA3IOc9ZZ5ywnrICFxiXj0peNVQx7D6J4pBGoAiC1Fo9UCULnQxLVyucUZkAllJ
	 uSTtfirFn7R7JTM5835xCShSnRgVoCJlsK1C971diyZmVr3a4tvZSYNjHMduNiCkCW
	 y7LKv1VldjjaN84q+jdiwu9FYkBuiVBSwW1haB2khrBj186wUJB2UD3GQ3Hmnudn3y
	 XzVLGOWCQzvpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3827160B8E;
	Sun,  7 Dec 2025 14:48:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB7B82CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD95A60701
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXv0Nvpbc69m for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:48:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D1C15605A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1C15605A2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1C15605A2
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:48:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D214BA4C1069;
 Sun,  7 Dec 2025 15:43:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyJ-00000000416-02rQ;
 Sun, 07 Dec 2025 14:42:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:40 +0100
Message-ID: <20251207144243.3696572-31-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118580;
 bh=NiLdLpBrdhXlwWMucXAAOIYB346cOwGegxoNlrnC7VY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ToL89DUcXASl7C5YGMaMy2tRfCXPq+KiBokEG2J7JJl2nY7VMzyeU3ED68NfO6W6O
 cHqXV5BxutHym+CozPZuyAlhrgJBcIMyWAuRGoj1N3NBMfW9y5TOGTFMiF8iG3QoRa
 42Ku97osYcDZpyzPGWoGrjMue46hByjxf+YfuUyYfhsV1H6a7IqXzuBgSksqpZToH3
 Ql+8vNjlHaUcv67DRvJKoM5OQCgBdU7KjciZvMjXhITyjSVi88olQlP/38/WXUG6sT
 souBybrDWNy7PHYQG1NGdYWuezI2PpyKFDlG1ntt7YX4CllNV5ySK+bJbyh0By1/NF
 nXzNVLQ6KuMjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ToL89DUc
Subject: [Buildroot] [PATCH/next 31/33]
 package/x11r7/xdriver_xf86-video-savage: bump version to 2.4.1
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
https://lists.x.org/archives/xorg-announce/2024-March/003490.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xdriver_xf86-video-savage.hash                          | 6 +++---
 .../xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
index 4482ff5991..c7a3aadfc5 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-April/003381.html
-sha256  b36cf02cfdd08a39423bb977c45397fbca5813267c727f0fd3c963ac38b601fd  xf86-video-savage-2.4.0.tar.xz
-sha512  a4db097c200f1430887e4c52bbe14aeaaa2c73dfc392beeed104c682114bd067f89b69994d649829cdc5d188cdbe7a41b22c82b0b49e3a02cdf366013ebbc161  xf86-video-savage-2.4.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003490.html
+sha256  674191160c61982199c582233c5f1df5163a09f3ecbcb3d5bb5079b31a7d10af  xf86-video-savage-2.4.1.tar.xz
+sha512  7928dafa148340e4a6c0ecd2324a69a67aa8fec55d316468c7e68fd79d1a388fd0e1f593d39b6dab0c8a5876b23e7c65c037a3285d340fa82b27ec7c2d5c8713  xf86-video-savage-2.4.1.tar.xz
 # Locally calculated
 sha256  611f4020815e3d5011a39a58f0958262715cd3becd9cb1ef14cc166fd84ec5a6  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index 03983d5cdc..ceca5a38a1 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.4.0
+XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.4.1
 XDRIVER_XF86_VIDEO_SAVAGE_SOURCE = xf86-video-savage-$(XDRIVER_XF86_VIDEO_SAVAGE_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_SAVAGE_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_SAVAGE_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
