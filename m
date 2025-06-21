Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81303C7115C
	for <buildroot@archiver.kernel.org>; Sat, 21 Jun 2025 19:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3AE24173D;
	Sat, 21 Jun 2025 19:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 03nmoth30syW; Sat, 21 Jun 2025 19:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 332C241798
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 332C241798;
	Sat, 21 Jun 2025 19:08:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04E73C8
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 19:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D481041798
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 19:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Qq_SWplicyR for <buildroot@buildroot.org>;
 Sat, 21 Jun 2025 19:08:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 443F24173D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 443F24173D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 443F24173D
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 19:08:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b017.dip0.t-ipconnect.de [84.161.176.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 139A1A4C0F37;
 Sat, 21 Jun 2025 21:08:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38436)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uT3Zd-000000007xx-0dNL;
 Sat, 21 Jun 2025 19:08:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sat, 21 Jun 2025 21:08:19 +0200
Message-Id: <20250621190820.516046-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750532901;
 bh=C5XKmyTq7CAMGftI4A8KHpOeNxEA547gcka896ocaXg=;
 h=From:To:Cc:Subject:Date:From;
 b=drLfkX71JwysQiQYJya892HIgqEjrTuTnVJvDQ1qSbRqtCAGGHKvHV9BGxCG10EXQ
 2bujtSfjENWEN8JcNnfF8iSfRgMqVrMGAc8DQ1QrWU87lisNplycB99tPEzo2K4klz
 g12yuwpqpYw1MWuuGFh8/8Fe2e/9QBlPqtxroZu2zdGPLUn8pvczukP8bg5tWxq+mT
 gYwMV6Cw357pLuwGkJEAKlMAkFzPPPJJLe2+YrnYenT/4w72zs7fgJqqvnTUn8kViT
 bRXiaW9ZAcVDAkr9nNvAtIPUsZqQVRHHLvIN3ryHPS5tYJ5mv6KqWwYD2s5Gk1b2Nm
 lIHqhDSu8/gMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=drLfkX71
Subject: [Buildroot] [PATCH 1/2] package/freeswitch: add optional support
 for OpenCV4
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
 package/freeswitch/Config.in     | 3 +++
 package/freeswitch/freeswitch.mk | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 80d18e064d..4d700e549f 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -14,6 +14,9 @@ config BR2_PACKAGE_FREESWITCH
 	select BR2_PACKAGE_OPENCV3_LIB_HIGHGUI if BR2_PACKAGE_OPENCV3
 	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC if BR2_PACKAGE_OPENCV3
 	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT if BR2_PACKAGE_OPENCV3
+	select BR2_PACKAGE_OPENCV4_LIB_HIGHGUI if BR2_PACKAGE_OPENCV4
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC if BR2_PACKAGE_OPENCV4
+	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT if BR2_PACKAGE_OPENCV4
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SOFIA_SIP
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 1b4b5eed0e..3e9586e26b 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -283,6 +283,11 @@ FREESWITCH_DEPENDENCIES += opencv3
 FREESWITCH_ENABLED_MODULES += applications/mod_cv
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV4),y)
+FREESWITCH_DEPENDENCIES += opencv4
+FREESWITCH_ENABLED_MODULES += applications/mod_cv
+endif
+
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 FREESWITCH_CONF_ENV += \
 	ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
