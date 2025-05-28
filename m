Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3CAC5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 11:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B06C806AE;
	Wed, 28 May 2025 11:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JK5VUux3RNRg; Wed, 28 May 2025 11:15:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76243806E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76243806E8;
	Wed, 28 May 2025 11:15:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5613DCA
 for <buildroot@buildroot.org>; Wed, 28 May 2025 11:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7633403FE
 for <buildroot@buildroot.org>; Wed, 28 May 2025 11:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvTfJwyP_q6y for <buildroot@buildroot.org>;
 Wed, 28 May 2025 11:15:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D9DDD404AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9DDD404AC
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9DDD404AC
 for <buildroot@buildroot.org>; Wed, 28 May 2025 11:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 3207716585;
 Wed, 28 May 2025 13:15:36 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavis, port 10224) with ESMTP
 id EDtCXEPap1K4; Wed, 28 May 2025 13:15:35 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id 9B3B016503;
 Wed, 28 May 2025 13:15:35 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Christian Hitz <christian.hitz@bbv.ch>
Date: Wed, 28 May 2025 13:15:16 +0200
Message-ID: <20250528111518.1961416-3-christian@klarinett.li>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528111518.1961416-1-christian@klarinett.li>
References: <20250528111518.1961416-1-christian@klarinett.li>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from; s=
 sel2011a; t=1748430935; bh=3mtIKrk+ONlZ6Tfco/I7/fiK05T71ChVSQih5
 qOu5RQ=; b=f3iH+li+4AXbwih+hsv+5FLRe551oNFPZ3E4iToOsV11sbOU0HET/
 PXsEt+1Opy0BJTJhvwWKwMSADBq+6inBB8A2NZwOIQYPZEa2BlcVUtRBw09FXeMV
 RfxXb6SuEZJEkcf1GUoMXzVOapnEeRhnyuyYzf2g7CvMUJFV42Jpf0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=f3iH+li+
Subject: [Buildroot] [PATCH 3/3] package/libvncserver: install storepasswd
 tool
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
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

storepasswd is used to dynamically create a VNC password on target

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
 package/libvncserver/Config.in       |  5 +++++
 package/libvncserver/libvncserver.mk | 13 ++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
index 904c805404..4ea9697168 100644
--- a/package/libvncserver/Config.in
+++ b/package/libvncserver/Config.in
@@ -26,6 +26,11 @@ config BR2_PACKAGE_LIBVNCSERVER_WEBSOCKETS
 	help
 	  Enable WebSocket support (e.g. for noVNC)
 
+config BR2_PACKAGE_LIBVNCSERVER_INSTALL_STOREPASSSWD
+	bool "storepasswd tool"
+	help
+	  Install storepasswd tool used to create VNC passwords
+
 endif
 
 comment "libvncserver needs a toolchain w/ dynamic library"
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 9935a32dda..1180fc8dc7 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -15,7 +15,6 @@ LIBVNCSERVER_CONF_OPTS = -DWITH_LZO=ON
 
 # only used for examples
 LIBVNCSERVER_CONF_OPTS += \
-	-DWITH_EXAMPLES=OFF \
 	-DWITH_FFMPEG=OFF \
 	-DWITH_GTK=OFF \
 	-DWITH_SDL=OFF \
@@ -90,4 +89,16 @@ else
 LIBVNCSERVER_CONF_OPTS += -DWITH_WEBSOCKETS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVNCSERVER_INSTALL_STOREPASSSWD),y)
+LIBVNCSERVER_CONF_OPTS += -DWITH_EXAMPLES=ON
+define LIBVNCSERVER_INSTALL_STOREPASSWD
+	$(INSTALL) -D -m 0755 $(@D)/examples/server/storepasswd \
+		$(TARGET_DIR)/usr/bin/storepasswd
+endef
+
+LIBVNCSERVER_POST_INSTALL_TARGET_HOOKS += LIBVNCSERVER_INSTALL_STOREPASSWD
+else
+LIBVNCSERVER_CONF_OPTS += -DWITH_EXAMPLES=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
