Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CBFC5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 11:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44DB6806E5;
	Wed, 28 May 2025 11:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bS3NByaW-jA1; Wed, 28 May 2025 11:15:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51B52806AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51B52806AE;
	Wed, 28 May 2025 11:15:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C5D1DCA
 for <buildroot@buildroot.org>; Wed, 28 May 2025 11:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5285540B23
 for <buildroot@buildroot.org>; Wed, 28 May 2025 11:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYshYzlONVEo for <buildroot@buildroot.org>;
 Wed, 28 May 2025 11:15:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2689640ADA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2689640ADA
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2689640ADA
 for <buildroot@buildroot.org>; Wed, 28 May 2025 11:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id B111D16530;
 Wed, 28 May 2025 13:15:34 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavis, port 10224) with ESMTP
 id nLg05KbQzyEZ; Wed, 28 May 2025 13:15:34 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id 2550716503;
 Wed, 28 May 2025 13:15:33 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Christian Hitz <christian.hitz@bbv.ch>
Date: Wed, 28 May 2025 13:15:15 +0200
Message-ID: <20250528111518.1961416-2-christian@klarinett.li>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528111518.1961416-1-christian@klarinett.li>
References: <20250528111518.1961416-1-christian@klarinett.li>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from; s=
 sel2011a; t=1748430934; bh=PcGoIGAz9N71zEBy4dLgc091BddKumrcNAijR
 8uS4+0=; b=Ltm9N1FyrC60IL5gyZuZGRJEh3IUsIUFWQL//OYhYgRn9deFUeoo6
 g7Gck5zVf6DnigSlIL43+65X/x5hYlKSM6WdXRVxQFnfUvK1Rgk+nGD/Z+I9h1P9
 cUloiko4qWux18qVFhkKJ0CSSGJ0I7qiIEc09L/KDed18CwLDhbwuk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=Ltm9N1Fy
Subject: [Buildroot] [PATCH 2/3] package/libvncserver: enable websocket
 server
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

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
 package/libvncserver/Config.in       |  5 +++++
 package/libvncserver/libvncserver.mk | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
index a3dce57271..904c805404 100644
--- a/package/libvncserver/Config.in
+++ b/package/libvncserver/Config.in
@@ -21,6 +21,11 @@ config BR2_PACKAGE_LIBVNCSERVER_TIGHTPNG
 
 	  http://wiki.qemu.org/VNC_Tight_PNG
 
+config BR2_PACKAGE_LIBVNCSERVER_WEBSOCKETS
+	bool "WebSockets support"
+	help
+	  Enable WebSocket support (e.g. for noVNC)
+
 endif
 
 comment "libvncserver needs a toolchain w/ dynamic library"
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index c6cbc834f6..9935a32dda 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -77,4 +77,17 @@ else
 LIBVNCSERVER_CONF_OPTS += -DWITH_ZLIB=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVNCSERVER_WEBSOCKETS),y)
+HBT_LIBVNCSERVER_CONF_OPTS += -DWITH_WEBSOCKETS=ON
+
+define LIBVNCSERVER_INSTALL_VNC
+	$(INSTALL) -D -m 644 $(@D)/webclients/index.vnc \
+		$(TARGET_DIR)/usr/share/vnc/index.vnc
+endef
+
+LIBVNCSERVER_POST_INSTALL_TARGET_HOOKS += LIBVNCSERVER_INSTALL_VNC
+else
+LIBVNCSERVER_CONF_OPTS += -DWITH_WEBSOCKETS=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
