Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23DDC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 19:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6364040701;
	Thu,  9 May 2024 19:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mW74ISzPSba9; Thu,  9 May 2024 19:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5488541EF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5488541EF2;
	Thu,  9 May 2024 19:38:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 196081BF2EC
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 19:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0638B41DE0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 19:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYUGexNPN0RH for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 19:37:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 21036405C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21036405C8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21036405C8
 for <buildroot@buildroot.org>; Thu,  9 May 2024 19:37:58 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 524FAB0051B;
 Thu,  9 May 2024 21:37:53 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  9 May 2024 21:37:36 +0200
Message-ID: <20240509193737.168634-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715283475;
 bh=H8V9qAJGRngjx8DioqAKI7RWXd/AxN41OtFb1wWY6bQ=;
 h=From:To:Cc:Subject:Date:From;
 b=qkl8QfjX749AtmiePS/S1wenh9ffQv3vD0oBb/uQ72o5jakz8WQpwW+9K4LjKPUoT
 uBlr5G3WmY67SFD9F1w/fm8Y0lyf2fwlbFQwUPHvlZJ8NlKyLbBFNyJ3BZKnQVa/11
 M84MQrUXdma7dsbtAWVsOF8BOLMRxF50GZsPEfYI8+m1XTWn8nw2F8vZIG2dmFll3K
 BDLEEDy3yEZP8ls7FHf3d19cZikJrHkwk88qaPvYUGnHeygqCSPFt4VF8W1RbQ8crX
 RT+BRzmzB95UEUW9NS45OCn78MiRBZ7uaMAUcaN5hdmD+dLEsZZDSrO46g2tnIcgYo
 oB1WT/Fy/3cRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qkl8QfjX
Subject: [Buildroot] [PATCH 1/2] package/zbar: add the optional imagemagick
 dependency
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
Cc: Julien Olivain <ju.o@free.fr>, Volkov Viacheslav <sv99@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When ImageMagick is selected, the "zbarimg" program is compiled and
installed on target. It allows to decode a QR code from an image file.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zbar/zbar.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index 0e79004bb30..86f33796a24 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -18,7 +18,6 @@ ZBAR_CONF_ENV = \
 	LIBS=$(TARGET_NLS_LIBS)
 ZBAR_CONF_OPTS = \
 	--disable-doc \
-	--without-imagemagick \
 	--without-qt \
 	--without-qt5 \
 	--without-gtk \
@@ -32,6 +31,13 @@ else
 ZBAR_CONF_OPTS += --without-dbus
 endif
 
+ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
+ZBAR_DEPENDENCIES += imagemagick
+ZBAR_CONF_OPTS += --with-imagemagick
+else
+ZBAR_CONF_OPTS += --without-imagemagick
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 ZBAR_DEPENDENCIES += host-python3 python3
 ZBAR_CONF_OPTS += --with-python=python3
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
