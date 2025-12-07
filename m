Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1983D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 18:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CE5981008;
	Sun,  7 Dec 2025 18:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKR7GxWAgrRg; Sun,  7 Dec 2025 18:03:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5494F81CBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765130624;
	bh=0hrsGs+/fAJ2fQUqr98X78HApdZkHJyXUGDEuix927U=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DGRjGbAFi4f819rFr80wiys20dsxFt5t+INqVeHPgCZNJuiNVY7bRcToesyW9VdAw
	 p4Xrbhs0s+ihggo9/hy47LK/AQNJ3bnVRDU3+pkSEaK5t5nV1RcCSWXlRV9MBExq/v
	 hb/2/5LbfGYJ/YnmOSwhVy2TZK1t7c6MZiIwwKSPAfPgXyhinS82T1n4GQJ9ZFFrsq
	 aXXr8r2Fr3gG53QXeMMLbjuDtBD5KbTJ0vkUWsCggE8VHg23rUc1fYtVIKuOnYR7Hs
	 tHi/yBLsDYrFUNDfYn3QcOgoHY6cPUlu3R4oXOEj5mbSNXlNO4CKZdkFsThe4qdtkW
	 XoaI2Aled2Blg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5494F81CBA;
	Sun,  7 Dec 2025 18:03:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A1C5151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C2E3405D6
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xoXG2o-mJhQh for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 18:03:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 34624405A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34624405A4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34624405A4
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:03:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6947BA4C0D8D;
 Sun,  7 Dec 2025 19:03:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48326)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSJ6U-000000005mO-387v;
 Sun, 07 Dec 2025 18:03:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Hitz <christian.hitz@bbv.ch>
Date: Sun,  7 Dec 2025 19:03:23 +0100
Message-ID: <20251207180325.25243-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207180325.25243-1-bernd@kuhls.net>
References: <20251207180325.25243-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765130607;
 bh=KSJyDSpHuhCRpTRJIzbYK+8kmfGWXs1TOgdgX+S1FMc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=E/Dym21B6FvCXXDlLbawaN1+hvlLK2mU2g6A93tRcLgzKRwPv3iCX9yaOSfZiuyXZ
 c/bLCR/751vVGvCUecVvErBdhu4w+MntSXP77/SxMDWzVCqDC+TCUfkIu47Vwpzx0x
 lVRK+qh9pOMOmWntdkpbaiRvbtNpBDs7lgpJFLB45jU42nUzgp92IMBgQCDgKjTxGg
 i+Kx/Jl8uyzsbwRtjBeP3EoObl5y47TltbPvYFHkrkQbNr9gIlH11iRKX/usUK2HA/
 aMDuxIAQxykZi3roeEWyFiI2frW6zT2deniM3nhAI44IAo6vOmrO6IBlhVogCqUArn
 yO3Y/vcehxRFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=E/Dym21B
Subject: [Buildroot] [PATCH/next v3 2/4] package/libvncserver: enable
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
v3: no changes
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
