Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC19EB64DD
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 08:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36E54409FB;
	Sat,  5 Aug 2023 08:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36E54409FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Re2TYQdDC6u; Sat,  5 Aug 2023 08:58:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA39B40340;
	Sat,  5 Aug 2023 08:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA39B40340
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39C4F1BF303
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 08:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45BAF40102
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 08:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45BAF40102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b3ZA-B2dwB_I for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 08:57:36 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8135D400A4
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 08:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8135D400A4
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A10CFA4C0366
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 10:57:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59650)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSD6M-0004Mc-1O
 for buildroot@buildroot.org; Sat, 05 Aug 2023 10:57:34 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 10:57:34 +0200
Message-Id: <20230805085734.3616790-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691225854;
 bh=hvQ5DzJpBrQC8iNGMZJ/FcXMIx2aI/LVpupVSXLFCbQ=;
 h=From:To:Subject:Date:From;
 b=LuMPgDbExMG3t39ogzIjuIVnTNFmJU1gxOEIIfaXX1OI9ZBd+8BEg9t5pimNua2Rm
 dUdbEGLDnygubi+Zy2szDMOhO6RYL6zKDGbey3vAoJytEusjRXdo+odZmJkCEBjX6Q
 KN2HKQV9AoFFhR1eQr9RgSNjZrWFNY/D6Qt33sPBKKi3LkR7VRM3Yc6PqVP2D4iWVQ
 Cd/FMQwAhFg/oXl3Wqrej7xV8Hcg9R/1Uxm2xzk1+TCDQVKzKrT7mYn92Z5+oEbyFa
 wsN9eDvuzoXXH8GL14l/hDIqtKlOVKoLQSd87iUoD28z8dXD+VNv3/J/aKVqz6k6Bv
 WM5pyuomRqSLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=LuMPgDbE
Subject: [Buildroot] [PATCH 1/1] package/kodi: add optional support for
 pipewire
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
 package/kodi/Config.in | 14 ++++++++++++++
 package/kodi/kodi.mk   |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 6b68e6d504..de70be7e56 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -217,6 +217,20 @@ config BR2_PACKAGE_KODI_RENDER_SYSTEM_GLES
 
 endchoice
 
+config BR2_PACKAGE_KODI_PIPEWIRE
+	bool "pipewire"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pipewire
+	depends on BR2_USE_MMU # pipewire
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # pipewire
+	select BR2_PACKAGE_PIPEWIRE
+	help
+	  Enable Pipewire support.
+
+comment "pipewire needs a toolchain w/ NTPL, gcc >= 5"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 config BR2_PACKAGE_KODI_PULSEAUDIO
 	bool "pulseaudio"
 	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index aff272d014..0f558372cd 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -361,6 +361,13 @@ else
 KODI_CONF_OPTS += -DENABLE_OPTICAL=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_PIPEWIRE),y)
+KODI_CONF_OPTS += -DENABLE_PIPEWIRE=ON
+KODI_DEPENDENCIES += pipewire
+else
+KODI_CONF_OPTS += -DENABLE_PIPEWIRE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_PULSEAUDIO),y)
 KODI_CONF_OPTS += -DENABLE_PULSEAUDIO=ON
 KODI_DEPENDENCIES += pulseaudio
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
