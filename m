Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CB8C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 12:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 518E5605CD;
	Sat, 11 May 2024 12:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgL5NL6rBHoI; Sat, 11 May 2024 12:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6116F605FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6116F605FC;
	Sat, 11 May 2024 12:58:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10F7D1BF580
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 12:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F27AE605FC
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 12:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgBcdhyb4V2V for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 12:58:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 949C5605A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 949C5605A4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 949C5605A4
 for <buildroot@buildroot.org>; Sat, 11 May 2024 12:58:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a049f.dip0.t-ipconnect.de [91.58.4.159])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 95E82A4C2DD0
 for <buildroot@buildroot.org>; Sat, 11 May 2024 14:58:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41946)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s5mJ3-000000001IK-2Ozu
 for buildroot@buildroot.org; Sat, 11 May 2024 12:58:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 14:58:29 +0200
Message-Id: <20240511125829.158446-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1715432310;
 bh=m3jgWB3Oy5vg2dQTPDzfUBJeAK7HwYYaoQpCYgdsxb8=;
 h=From:To:Subject:Date:From;
 b=BY7QGYAiL/2ucW25e85nTPFnEae6ULFAffbL4O4YfoMgLme8OhT7KwewCFoY8kmhm
 auHrRM8bu7icQ4xvb9XUJJbbfCnRTpFD18kcF6ToftbdBxnkWxA4WrQ9h/XRyeM1ys
 6X0ugcmtRBH/h/kLN+CSns2ExjAacE7TAKw9zC2+A3O4Q4DSg5tG6Hx4yEnTQEl7Pr
 iqKi67jUQ2sS7A3xgbz3Xzhgar2tEeKoaFrm8bQh5sLsF5U3NASuI0IELHTE3UqXgp
 fu/B+6nhQQ2vcOGhxbJ0++up0QqkSkZtvjKEh4A0amJ9QKBSDIAO1MliRtJ277q30S
 vjN9Me4aruBPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=BY7QGYAi
Subject: [Buildroot] [PATCH 1/1] package/kodi: fix libudfread dependency
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

Buildroot c61934611111cb3ea04604707052b1387bde5134 commit added a broken
dependency to libudfread. In fact libudfread is still an optional
dependency, just the configure options changes due to upstream
commit https://github.com/xbmc/xbmc/commit/5f9b9cfa26f274e381e92d73cfa33fb55582436e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi/Config.in | 1 -
 package/kodi/kodi.mk   | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 10f46802a8..6c48168bf8 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -166,7 +166,6 @@ config BR2_PACKAGE_KODI_EVENTCLIENTS
 config BR2_PACKAGE_KODI_LIBBLURAY
 	bool "blu-ray"
 	select BR2_PACKAGE_LIBBLURAY
-	select BR2_PACKAGE_LIBUDFREAD
 	help
 	  Enable Blu-ray input support.
 	  Select this if you want to play back Blu-ray content.
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 09342ea1f0..62463b731e 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -45,7 +45,6 @@ KODI_DEPENDENCIES = \
 	libfribidi \
 	libplist \
 	libpng \
-	libudfread \
 	lzo \
 	openssl \
 	pcre \
@@ -388,6 +387,13 @@ else
 KODI_CONF_OPTS += -DENABLE_PULSEAUDIO=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUDFREAD),y)
+KODI_CONF_OPTS += -DENABLE_UDFREAD=ON
+KODI_DEPENDENCIES += libudfread
+else
+KODI_CONF_OPTS += -DENABLE_UDFREAD=OFF
+endif
+
 # Remove versioncheck addon, updating Kodi is done by building a new
 # buildroot image.
 KODI_ADDON_MANIFEST = $(TARGET_DIR)/usr/share/kodi/system/addon-manifest.xml
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
