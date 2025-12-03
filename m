Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9A7D1BDD4
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 19:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 836FE4091E;
	Wed,  3 Dec 2025 19:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSFcAkB84BLk; Wed,  3 Dec 2025 19:56:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B54794092B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764791818;
	bh=vunWVsbe9maXQ6zFHRbO0+dU7K7btnsGrNcCMOJy/xg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U42P6gjUxlhDMUuiqfdgOpry5Q36gyQPsgjSHgGUwM/JNpyIH+6eouBlq03CYhuKw
	 6PCVsdwOinDvT5XYeP64x/ItZIJkwqebWBDDee3AhoiIu5EyICec8fOOt/UdEVw6P3
	 mrZfHuwApWhXGggw2w6ExU2oYuP5A47WDZBmfrrjifZYpnv72wiDSDmFgzuS9kp3oB
	 qOKpc9UcpdRd8qiCNYBaoSHBPS0doOxGI7iXC8Uq+ItaeFDOkNjI+Yni+Xg4KWGqi0
	 OlhmYjCoTsW7PgaqoyPyZhHQVC7auCfGAYHQnFUAux5A3hyaMowKsbIXLJtrnleiaF
	 B7h3BpWc566nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B54794092B;
	Wed,  3 Dec 2025 19:56:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C4BDD3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5295882664
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IhSBuNUHT4lW for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 19:56:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FD9B82531
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FD9B82531
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FD9B82531
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:56:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83404A4C7982;
 Wed,  3 Dec 2025 20:56:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36768)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQsxt-0000000056X-3IdV;
 Wed, 03 Dec 2025 19:56:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Hitz <christian.hitz@bbv.ch>
Date: Wed,  3 Dec 2025 20:56:39 +0100
Message-ID: <20251203195640.2297610-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203195640.2297610-1-bernd@kuhls.net>
References: <20251203195640.2297610-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764791802;
 bh=z9bSKcLVD5bUVNhwvilF7r+wFu/q+/NcUEMEE3YzVEo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=huJgY9+yoYlLIPR4tM12bLUNM3x5SLGu+huQjTTiGJZaMT4ehH4zu/GsCB3LfRlbo
 CvjOtqG9g2Xc3VtVexeph/ARvhpx7w7XwIEiGylCqDsge8W/1bQuHVrKJ55DHOWaar
 a1NKjtKlKY47oF/1tV534PVriEr89P6NGNt5bnipr/Mglio8IoGSRF3/3NloZGN89u
 c6qojpiMGCL3CwZNBRir1uYrkFyM6ovmJpfiUQPSg+gAaCfgV5vfaXkQG+be4hb+aJ
 iNO00ssVMSUn/UILlHitxsgXp7sGH7/6kzQGn//R8/9SoT6lv8zy+L70lvT4P8UyOP
 ulqkTJvgWKlXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=huJgY9+y
Subject: [Buildroot] [PATCH/next v2 3/4] package/libvncserver: install
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
