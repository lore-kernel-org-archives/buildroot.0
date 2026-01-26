Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC13CF65E2
	for <buildroot@archiver.kernel.org>; Mon, 26 Jan 2026 11:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5611460B9F;
	Mon, 26 Jan 2026 11:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIJAOvo0ysZb; Mon, 26 Jan 2026 11:43:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B3D60B9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769427783;
	bh=S78WeCw97SoaSphxLC21jzMdIXSqpLG8yHTjX30jEpU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HwMmH7nnVe3PxPFq2ml122KGO9iCuUj1DpPCbr99sonZdl+AL/1kOYgDT6VvwNaNK
	 hWfUbdZIjTU0HJhlr8eqUbKWqNFvH8pPAAnJyRJEQrhk49ba2AnlSo0QOfZoZIB1c0
	 8vHA8QwH70u11hIVkfQZB8c6usgy6J5PPNIv77CHpbrbTeltKlPapUodWuRoLbvDMe
	 RZX1KAQ8Imza/3bb6DMiqM6YFkfUWqdtMgl6qbuGk330k2xsrdFDI5zQhpc/ntRX0w
	 h00Nv+xKtS2OXYROjXC8QbPt7OUdg5dVeIOvZRxmztnjOiYjAms1NZ1ZDLFRuwGu3X
	 uvgbLWH2SXong==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51B3D60B9A;
	Mon, 26 Jan 2026 11:43:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D827B1CE
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 11:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDEB960B9A
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 11:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HX3egQ2NM7Sg for <buildroot@buildroot.org>;
 Mon, 26 Jan 2026 11:43:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=nolange79@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D821D60B99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D821D60B99
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D821D60B99
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 11:43:00 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47eddddcdcfso25272835e9.1
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 03:43:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769427778; x=1770032578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=slCZr2Zi37nH+zRVmXGOdGyGUcp5QJEtQCAZybUlkv8=;
 b=rsOsPl5S5P5ufM8jyLTcPDGiOaZiQT/D02BFH3P6MeMeBCplNK23M5leI+jGPEZqFS
 ruDFlnkNmx+cRXoVE1PpXgo3OGPq9TIgQXGdxY1CUo5sXOCCc6kD52tUEc1/8fwykU95
 HKiSMF3+OgJAtBI7zIPYcbKZPOyL/b9xiVvdIoyhB+dy2cm0L173OCkxB2hF7RKKH8u3
 2XWgl0o4O3m4FPLVxPk3UzcAeFvbwA+KRIec5rTWC/2qCG1T/C7av3Bg66Q56ok5TR5N
 g13i47DNEVSli+eoyjb1aA4YJjfdlORNVFusA5pB09Lz3QsYd/Y8+wxraflsah1mREzX
 OGfw==
X-Gm-Message-State: AOJu0YwSU/hcfntKNrcdpxl9VZelNgIWCGd2rZ/WdLo1KKiHrQJ5m5DN
 DYfOsTgsJ9s0WUInm7I1zcmlwNhAPZObqRYHlGgHnmbReY/Ybgbjxr84wmQXRA==
X-Gm-Gg: AZuq6aK+J6qJoYptpuagKNZmM/QSNbkaUTzL13QFDl5W/He/VSWylAYYOu8846Xhwkx
 mhne+Dsx5ukA6jjKGGh1dwmBnVd1ZAGmLTLOL9VY8jxdUqOi/CNbUSkbgDfJndsscc6lFfnKL/m
 brUQSyoAtcP4zSme8o1EsEzJrpv75C4THi17FHoz5VWTh//68bYZH1iyycJqTnHDNXHOInOb+hQ
 E77kQy4W3tN8pd6aZHL/RlhcsVPLvs1Q0Tm5UALc0RB3DyedKNoUa2HxSxVHi1P1aCRykTe8Er+
 9px1tuAF+mMe87GqmeCeKbusluTIQzTX+4nrg4kr8lLHeSVKWVwSxYImK+JQZF98dEq4zjO3UUN
 rmhiiOZBGsHp57hdmB9C7rZ3E4eODDnTZgtAz5AP2FQ9PH/lluJwhXXp5GS9OyyLdLontAwGDFZ
 L1q8MHyc5zzX0yawD1Pajp87TRSK6x/esmnvIdeL1ydEs=
X-Received: by 2002:a05:600c:1e0f:b0:47e:e807:a042 with SMTP id
 5b1f17b1804b1-4805ce50189mr78566905e9.15.1769427778255; 
 Mon, 26 Jan 2026 03:42:58 -0800 (PST)
Received: from vcllano-01.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804703b5b4sm375523365e9.5.2026.01.26.03.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 03:42:57 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>
Date: Mon, 26 Jan 2026 12:42:45 +0100
Message-ID: <20260126114246.410725-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769427778; x=1770032578; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=slCZr2Zi37nH+zRVmXGOdGyGUcp5QJEtQCAZybUlkv8=;
 b=hLsYoxxE1ZBBsCYSOJkDY+yXkepEOPZ9UhLYOPnEFveKghHSpY3c3aQoj5oA9OWiQS
 HMMi1sASOvw5IYjz/kpcIpzlO/bn+cs+S38iVanJi7THF844Il6SzCQhpQSssFx0fn/S
 jwzNF/p4ugZD1xTt1YsFBgo0tPTYV2o9eE7t5dw6pXL5nKxLQed4VlghexvmiVM0AJkh
 ZVU2Z0dlMGp7JFtjiKcXlTZppA519rJMdxwV1t6OoIVn8QgyhoOPuRNBwA8LXe+AOleH
 qaOQpDOaVhH69fqx4IH7J/yGgwMFd2DblfvEnJ1uIKcVyg5Fw8jbu4rAERV1tNWh8bPm
 NNIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hLsYoxxE
Subject: [Buildroot] [PATCH v2] package/dbus-broker: install dbus.socket for
 session bus
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

The unit file for the per-user session bus was missing,
copy the file from the dbus package and install it.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/dbus-broker/dbus-broker.mk   | 14 ++++++++++++++
 package/dbus-broker/dbus-user.socket |  6 ++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/dbus-broker/dbus-user.socket

diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index 7e029879f9..5c53df8754 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -62,8 +62,22 @@ define DBUS_BROKER_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/share/dbus-1/system.conf
 	$(INSTALL) -D -m 0644 $(DBUS_BROKER_PKGDIR)/dbus.socket \
 		$(TARGET_DIR)/usr/lib/systemd/system/dbus.socket
+	$(INSTALL) -D -m 0644 $(DBUS_BROKER_PKGDIR)/dbus-user.socket \
+		$(TARGET_DIR)/usr/lib/systemd/user/dbus.socket
+	mkdir -p $(TARGET_DIR)/usr/lib/systemd/user/sockets.target.wants
+ifeq ($(BR2_PACKAGE_DBUS),y)
+	# switch with systemctl en/disable --global dbus-broker
+	$(HOST_MAKE_ENV) ln -sf /usr/lib/systemd/user/dbus-broker.service \
+		$(TARGET_DIR)/etc/systemd/user/dbus.service
+else
+	# unconditional dbus-broker (mask dbus.socket to disable)
+	$(HOST_MAKE_ENV) ln -sf dbus-broker.service \
+		$(TARGET_DIR)/usr/lib/systemd/user/dbus.service
+endif
 	$(HOST_MAKE_ENV) ln -sf ../dbus.socket \
 		$(TARGET_DIR)/usr/lib/systemd/system/sockets.target.wants/dbus.socket
+	$(HOST_MAKE_ENV) ln -sf ../dbus.socket \
+		$(TARGET_DIR)/usr/lib/systemd/user/sockets.target.wants/dbus.socket
 endef
 
 $(eval $(meson-package))
diff --git a/package/dbus-broker/dbus-user.socket b/package/dbus-broker/dbus-user.socket
new file mode 100644
index 0000000000..dc5ed8995d
--- /dev/null
+++ b/package/dbus-broker/dbus-user.socket
@@ -0,0 +1,6 @@
+[Unit]
+Description=D-Bus User Message Bus Socket
+
+[Socket]
+ListenStream=%t/bus
+ExecStartPost=-/usr/bin/systemctl --user set-environment DBUS_SESSION_BUS_ADDRESS=unix:path=%t/bus
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
