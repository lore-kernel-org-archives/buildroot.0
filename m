Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D12D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 18:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48A986070F;
	Sun,  7 Dec 2025 18:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kS4ITugXycZ; Sun,  7 Dec 2025 18:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 431AF60674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765130611;
	bh=t9rUO4uJIZpLq5AaJNSSe0V6YyXHJuCgksH9RArzOcc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IbSkYedT8shzAc2zt2kx8TUmmUb87mJugWiXzEjsybKJCWAGvLCgmbaenY3CSb+SB
	 HGPLHYIEX887WhjKBL1y8PhoflVfpc3LtM1R4WtzkuCOU/0wCCVsTlk1QH0SQ0F95h
	 3goP7LdotQ/7G8v5A9ds3iyU+j1+xega2nPag2Fncww7qEJWDRoQ8YiYAXJ+9O4Wyn
	 hJNezTxE6amBNUOVycPzjtUdzMka7xvbeNxGDOUgL56zgMmbrGC9cuty2enVmDst5/
	 /JWv4eirBRlVHucidpX0PEqd9jA+NUacOwr+YVkAWnJBvI+N/EKeHE/kXpCDGCT8uG
	 NQ8WGpm5Wq4wA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 431AF60674;
	Sun,  7 Dec 2025 18:03:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F7C2E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90AA481008
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bv9SzV_8p8JG for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 18:03:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C955581007
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C955581007
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C955581007
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:03:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 753A8A4C1009;
 Sun,  7 Dec 2025 19:03:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48326)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSJ6U-000000005mO-3QbY;
 Sun, 07 Dec 2025 18:03:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Hitz <christian.hitz@bbv.ch>
Date: Sun,  7 Dec 2025 19:03:24 +0100
Message-ID: <20251207180325.25243-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207180325.25243-1-bernd@kuhls.net>
References: <20251207180325.25243-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765130607;
 bh=7I/8gbhBrpMKGOg1NgsbBzhZN+lkDLv65Rf3bRspYsQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HyNcqnXLoYkjP15+ReXqON1Jz0DKRI4lKRPiAU2/KNmHzKzPd4Jv2YAn+PnY+nmra
 CJzeqz8snofEUdIXICuYfeDLhDELZrN6JjnJ8QFyEEkS30BZWry51kQ7ZjA5ApPH2O
 Z9V1ZV2A8xjFH3hdUpuw5wzqQg1dulxD1xakcePFkL4I2xvaU5wF4XONquKWYjtl+v
 Ca8Wj9+Y8RHyjIDM9yf3eU/ImHVo7V9Kw6HcnmdTcmamXGX9Pt8V+mRAGdYh5PAa0J
 WexWKMBwmVtzvJXrbLGfoJTT/IZ5Sc3cLm/GBVKB3jpqorbEvCKHfTXyVCHO8jw/M/
 xce6ENIuwjpRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=HyNcqnXL
Subject: [Buildroot] [PATCH/next v3 3/4] package/libvncserver: install
 storepasswd tool
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

From: Christian Hitz <christian.hitz@bbv.ch>

storepasswd is used to dynamically create a VNC password on target

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: no changes
v2: no changes

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
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
