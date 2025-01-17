Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02263C02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB60C6FB44;
	Fri, 17 Jan 2025 10:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpAeJhA3K0OB; Fri, 17 Jan 2025 10:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB16F6FB4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB16F6FB4C;
	Fri, 17 Jan 2025 10:49:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90BC4B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B08840173
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVhNhSPynbrV for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:49:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 745F94013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 745F94013C
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 745F94013C
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:51 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5401bd6ccadso2038035e87.2
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:49:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737110989; x=1737715789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9sb2L06phURbXgb3O3fQd5F7HCam+oCHCnlsY0PJYxc=;
 b=rxjq8ou/3G31/XwxXvjyctfj1qHIZNpH0CSw23KyXyYWqGQ41saBjoYwg+PPUJsZgb
 m9Mc2AUnSDAvT8qcVLHh24aAKa/50n2m3k3GlUVHNEsr9kLwfPptbaayQZ1M0P8U88VJ
 6TrTJ/jNd8vCQJktxHrZXAgNG2NAB5MlxH2A9qd3Suzye8oJJk0sx44jxrm6Jht6aZqp
 63+rFPONzGfr4gNp8mvpPGOv0SSLnBfybpxy9W0Lbh8sHFFa3o5l51j3Q3uS+LsyJgu6
 rX/Nr/r3slT6/8Obs4vlDf/fOFWRpqvY7TAG2p+L80nJQXLnjHzuiDl1TP9qXVk//bzF
 YSBA==
X-Gm-Message-State: AOJu0Yy3LD6Tk7TGnaa555sF9Gxv3xgX0qvZ8ZfpJhE1253IE0I1eXL0
 JRoXRxvVRbM8cxeLK6mu7uUXWC+L6+iSKDSd6jbgsxZIi3YsaaBK0iq8TQ==
X-Gm-Gg: ASbGnctjJ7Y62ZpB1Nq/hMNhuNQnAUiJQ2zE9BYmlfdjzAlF6VgyNjvy3k2RwJj6kUh
 nxjXg9QJsmLp8bL/KIAFueVVbr/INTaltupOKOWcipsKXy38rHB1d61oWKAdL3edrdjVnm/vhwZ
 3d9B1CSo1am+IsUacY3w5QYyzbYRgYq7YO71qrDx+0VnNf/XMd+kLefX3AIDAPlWSQJ7O2FPh7D
 Vuo+7EJn14bG0WSqCfnsxx1Pe3Z562dgOGCSX5wvA/4LkvwahjN0s8hjWMKuOmD7IuGobi8Ym2H
 mpahTvpLSsc=
X-Google-Smtp-Source: AGHT+IHO12RfmJecZ+G5tuDFi8r4b6skFlRvDv+xbivDVva9HTkxKLrO5Uu2IAt2phBigXi7iMf2WA==
X-Received: by 2002:a19:7419:0:b0:542:218a:71a with SMTP id
 2adb3069b0e04-5439c2483e0mr486356e87.26.1737110988815; 
 Fri, 17 Jan 2025 02:49:48 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:49:48 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:47 +0100
Message-ID: <20250117104911.613221-7-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737110989; x=1737715789; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9sb2L06phURbXgb3O3fQd5F7HCam+oCHCnlsY0PJYxc=;
 b=LQhejK2sio38l7Hhmm6ibThJ9L4STfkj8fh07P6f1NOnPI86WnlOESjXgbH3y5/jD5
 x2s8XzTsTAZKrf5090S6XydCGhV1X/q3igbXf/9cU7SvJ4RFXdAAlhd+7aG6ZbB+vuEZ
 ANI4/JDI9Xhvdpd0MMmJxJ9pgoCxb6VvidxXNDFyzF11UacBshHc4x/0ONO+OaTddrDP
 AW90CrQuqj4X2Uhs1/7yTYdMHUX85iOwHvu/8RkKBCtQxwcJyypw+GWTVJoz011HNsuV
 2mS9KRbZWMwDBqTLi4Qsa9FToZBXp7Wj7NKESIImS/tn4j5zjc02f6jTkRpRzGv6IJFt
 lhrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LQhejK2s
Subject: [Buildroot] [PATCH 07/19] package/qt6/qt6multimedia: set
 dependencies after conf-opts
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

This way we get alphabetic ordering, and follow the same pattern as
elsewhere in the file.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/qt6multimedia.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 6aef78bf02..31c3405b5b 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -34,10 +34,6 @@ QT6MULTIMEDIA_LICENSE_FILES = \
 	src/3rdparty/pffft/COPYRIGHTS \
 	src/3rdparty/pffft/LICENSE
 
-QT6MULTIMEDIA_DEPENDENCIES = \
-	qt6base \
-	qt6shadertools
-
 QT6MULTIMEDIA_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DQT_BUILD_EXAMPLES=OFF \
@@ -56,6 +52,10 @@ QT6MULTIMEDIA_CONF_OPTS = \
 	-DFEATURE_spatialaudio_quick3d=OFF \
 	-DFEATURE_vaapi=OFF
 
+QT6MULTIMEDIA_DEPENDENCIES = \
+	qt6base \
+	qt6shadertools
+
 # for multimedia quick module
 ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
 QT6MULTIMEDIA_DEPENDENCIES += qt6declarative
@@ -104,8 +104,8 @@ QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=ON
 
 # for spatialaudio quick3d module
 ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)
-QT6MULTIMEDIA_DEPENDENCIES += qt6quick3d
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio_quick3d=ON
+QT6MULTIMEDIA_DEPENDENCIES += qt6quick3d
 endif
 endif
 
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
