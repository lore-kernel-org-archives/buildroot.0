Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B836AD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C9D782235;
	Sun,  7 Dec 2025 14:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4z1wcCXPI1ND; Sun,  7 Dec 2025 14:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D20C821FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118919;
	bh=OIoSp48NxCkcaBnvUZNb/YOprLumHAcG3Al5iJGHjSI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Zd0/SgduY4qBskLN8AMeIW4QRuMifMzyyJLTOdrtg83FYWCy44OVndlYMs0lTVDOh
	 Oyb1kuoqBPwPSgI7ZNll6ySn2InNOxqHJH62i9gwcxHc6It+5WYuTs68cm1LqlnR6Q
	 TJuKk0w7P6r5/I4v5S6EasyeqlSFC5E/cm2loqSOVVtoD7osUfA2AnYq5Ofatdl4Ji
	 BquyZx3vufXlApKCaKg8JiI4DozKjcoiK5tzDHEYpl2DFEf6WqZXO5i1Niz9d+xXUw
	 oVJMu8J3FG6/a8CX9ogfLuzhP6+WN/4TpByzDQ9UzK9MPNhqUZIbkHfo6F3j/TtW09
	 6TwBYAA6liR5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D20C821FB;
	Sun,  7 Dec 2025 14:48:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86143151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7839240166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWBVaSSETreK for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:48:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 648BD40208
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 648BD40208
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 648BD40208
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:48:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 95E25A4C101D;
 Sun,  7 Dec 2025 15:43:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyI-00000000416-3rab;
 Sun, 07 Dec 2025 14:42:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:39 +0100
Message-ID: <20251207144243.3696572-30-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118580;
 bh=QLAgz5ukF32GPNvFM4hdXuoKYsTiDFz2LcVFgBaGsHM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GalOFJ0G0yKnXAfbc6hMWMFipeH3cs/nTO+kb3GTYXtei2A+cDTaEO/6DTzFD8BcQ
 5BaxQCPPBxOy7YQOEMftUOBtCpT7gqQ9jrZohKxmdJMZA0Zd2f2sUz58Aoro5D1e5n
 lpbdknYMaB4fmecLYjGv8bqqipsopV7fbMxjADTPdTTRDAGrbLeWmAXgjpvjWm7UJD
 26shJZCyuu0XOzA85QupLZUCr4xxzT/5l+UUrT5nHlMTXshFm167zCUzGvAisbE/zo
 DsYS70AKbXI36AIO2/bW1gH9r1twSuV1NP1u80YYV+sJUsiWaE5fxT9YQGYR+zLSCU
 YdK0zfrUeV+SQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=GalOFJ0G
Subject: [Buildroot] [PATCH/next 30/33] package/x11r7/xdriver_xf86-video-nv:
 bump version to 2.1.23
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
https://lists.x.org/archives/xorg-announce/2024-March/003489.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash  | 6 +++---
 .../x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
index ec7d198c18..4154efb612 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003196.html
-sha256  6218932db5c389878d853b11b8fbb667c321b65276f55aa6842a56fb1a30d288  xf86-video-nv-2.1.22.tar.xz
-sha512  a54767e9060404cafbb028ea36e582e8cfb7431a746cfc1d698c435fa73e41c4dfc12f84e50d002a582ac61e2d4c377f4defdf407250ee9e8656e5ff989b3cda  xf86-video-nv-2.1.22.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003489.html
+sha256  c68dbda431f3d47000606f8173b977b811c76ba9dda1a5d2e3ee122bbbb98aca  xf86-video-nv-2.1.23.tar.xz
+sha512  ce09f37bd29bbe588a8788d643240c9b0324654ea37b8e7f0f127494999f24b3048ca0c7ea91b33ef94efd12b570bfb73c8a5e20bf63749b01cbdc5669136b9e  xf86-video-nv-2.1.23.tar.xz
 # Locally calculated
 sha256  10d10e1ec37594d481c3de8dda22a40b731ebd43be7ccd462baaa7394738a9f3  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index 2aab60aaf9..cec2101d3c 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.22
+XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.23
 XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_NV_SITE = https://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NV_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
