Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF350D1BDD8
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 19:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9204840EA2;
	Wed,  3 Dec 2025 19:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7QYTkuxCwrs; Wed,  3 Dec 2025 19:57:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B557D40EB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764791830;
	bh=HHXUFsnVPwyEbQzI3gqrycOBPfXf2dG6+9TlBuxuS2o=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LszwZgSiI3hyCNAfJbIGVc0f6F5cr3afwUeLViXz+Hoy2DfrAw1QSMxDW6RF00jXm
	 v/B3Hqv5c4Q+3+/svDx5rg/P9/cNjiYt7GY1WUl3SCqzI04X3a6ZGmwmW1tLNcIxIi
	 lTVgLWRLnbobWuOzSWLjpP9vS3CCKZnM3ilrxPH5vqGe2djxCTavw6vKDFKCUASIbO
	 Q02rNHKiuuI85IVFfw6TgiuO0m2RQL4/SgrsLTBVuvTn0qTEALaTaJ6A2/kmVHtpvL
	 D3zHmRBsWwxpPt4uP62FV0T0avM2qZGFQYxtEG7ZWG6VOmCba6kefXjFeBCWl2vyq5
	 d401Y0dLDPAbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B557D40EB0;
	Wed,  3 Dec 2025 19:57:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AACCCD3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CE2B400B0
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7PIOhsFeI9VQ for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 19:57:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 661B940028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 661B940028
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 661B940028
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:57:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 72343A4C7980;
 Wed,  3 Dec 2025 20:56:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36768)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQsxt-0000000056X-31N3;
 Wed, 03 Dec 2025 19:56:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Hitz <christian.hitz@bbv.ch>
Date: Wed,  3 Dec 2025 20:56:38 +0100
Message-ID: <20251203195640.2297610-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203195640.2297610-1-bernd@kuhls.net>
References: <20251203195640.2297610-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764791802;
 bh=jykABDDpgNR2gz6l+PlqagjzFXPwRgQApQF61ZNS3vk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=If0iAI0aFhvvBpMD7LHaA27e4sxqzO9Oxno7edAKmrXbvMP0dbxAXo4sd8zgkC1cy
 hbbrzi/KK8HBpuRx0VRFHLx4UH8tf9fPNxLUWbELD7/Tczfa3B0t6awGwJsvQMvN8T
 KQzfJkTKdzgUNlSorIEig05rXL3z3tiy4W1wHkI6anEhtOvkF2RdyBnhW/5yH9gU6p
 vXK4dLEizBI191r5YoBGjioKwEwj/tkJMDp3JGSaxrPbDl1uEL09dKnRtU51+D44gZ
 OAvxLWbIp18923jrBPP05hCeRgZFfjVzrKHxmwoVIIhNxPQMsxDjpZWTeDfHcYoOZ1
 XRf1ot5jFQWWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=If0iAI0a
Subject: [Buildroot] [PATCH/next v2 2/4] package/libvncserver: enable
 websocket server
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

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

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
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
