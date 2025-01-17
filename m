Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3E8C02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4522D423C7;
	Fri, 17 Jan 2025 10:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DlApGBxAHw3; Fri, 17 Jan 2025 10:54:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DA194148F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DA194148F;
	Fri, 17 Jan 2025 10:54:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D8DDB89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA4CC41FD1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CX1A81_F2SuN for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15A23412AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15A23412AE
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15A23412AE
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:39 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5401bd6ccadso2041847e87.2
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111278; x=1737716078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RfQXVVXHHRaZClapKvYvD0x+NWLl0dK2ZPHKPIepgmI=;
 b=DEYoj1tr3RN4QnRBaaj8T15EzH8fu9sEiJbsLOtvCZTjVCXYtORuSv9w1Zj2+LINN3
 jfrZDoMIivoGdt0p12SR0MEaUNxRXf/9iYGe+16dixwn3BY1XyXeJ5TQtqdsIEZV7B7o
 6uuLWn1zNkb/doL5PreGR71ie9uxs0paHbVD+gt+sBCTpWBwRStJd7li0N1sX/huijas
 V1zj+jZcA6uMVAOgRytUy70CsaE+bOQ2+Dhkvcz2oFit9CsElclHMFZwhM23aUv5q32E
 CUrqClxI/Kz8lmdA/P6Wgeyz/qwrph5kGar9WbeZkt1K6H4UXC0XHinqP925O+O7pL3c
 9+4w==
X-Gm-Message-State: AOJu0YyiYK1pa0wgnXqENizDThnnWu6BEAESy2Fjt4AQvEOeiPUL6Sxj
 /jE+GLypsSg3cOn1EZEsW2BSTWSzeKlBemQ7i/0FUywU386DcGMOrjGNQw==
X-Gm-Gg: ASbGnctmgQI3Q1LE0IdFA1co9yvjWDuBA1cezRClXuQTRETckKxaxXhJifPoA7lbjDv
 06G6UbHrBVTmada5QQBIGNBcHf/LZueY1wRVMdjYOB46zeepT3r7id+htbyAuNU2IPs8vmbVEjE
 rhYIAJt5nQQBw7tIAaQkyXKsG3OoUFldFSPD+CNL8I8zRFY1dsZGV3O8b7Gh1YhPV8LvhG1wDt8
 4ZKRmri/OifIJQPO9bnI9DRxfXPTB3k0+cOdIijclHvoB7iUCdjMFru3u41mpFdUC/KDWqYI2Xq
 YoLFIpih//8=
X-Google-Smtp-Source: AGHT+IFbNGQeNcAPQqMXH1kEzr1YnNgTrtSxU/yP9BFFPLUkJ++X1OLRqJF/CmVSdA4PjIU0Mwzd2w==
X-Received: by 2002:ac2:511e:0:b0:542:98bb:5678 with SMTP id
 2adb3069b0e04-5439c248293mr461668e87.25.1737111277583; 
 Fri, 17 Jan 2025 02:54:37 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:36 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:37 +0100
Message-ID: <20250117105354.618220-14-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111278; x=1737716078; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RfQXVVXHHRaZClapKvYvD0x+NWLl0dK2ZPHKPIepgmI=;
 b=Msx5B35casSYWMo6EXzmLTsIzN/FKNBVs25/MDSFyvK3ti7ivdiosFApuHiYlymmhm
 U6hppZ+BOTeK/0k9jjNwCDgFSasXaRSGtijie49gs7+nOoajLDRsQHb4uo84Q0rRpOuc
 dSac0nucHrhJOdeNUXh6QvwVyaLYg7VPgM5CVyB/asDzjB6HQcgB4/3kXnwqnPR/9bK0
 m2mghewuO+hFMSU2ApxR/hrIqVsDP/kvjTH/Hn9eKxfiFycwAjMvVKJniB2JMbxWH4KI
 nI3J7bsbGtAtuBU/LsnjV3kOH1OTMfFgacxyDi0VXQCMQFDG0ft/89/um1H+KPWOPZ/T
 OMcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Msx5B35c
Subject: [Buildroot] [PATCH 14/19] package/qt6/qt6multimedia: split lists
 over multiple lines
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

Visually separating the elements in the lists to increase readability.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/qt6multimedia.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 032eadefa5..d4a1b8ec50 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -75,7 +75,9 @@ QT6MULTIMEDIA_CONF_OPTS += \
 	-DFEATURE_gstreamer=ON \
 	-DFEATURE_gstreamer_1_0=ON \
 	-DFEATURE_gstreamer_app=ON
-QT6MULTIMEDIA_DEPENDENCIES += gstreamer1 gst1-plugins-base
+QT6MULTIMEDIA_DEPENDENCIES += \
+	gst1-plugins-base \
+	gstreamer1
 else
 QT6MULTIMEDIA_CONF_OPTS += \
 	-DFEATURE_gstreamer=OFF \
@@ -92,7 +94,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_dmabuf=ON
-QT6MULTIMEDIA_DEPENDENCIES += libgbm libegl
+QT6MULTIMEDIA_DEPENDENCIES += \
+	libgbm \
+	libegl
 else
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_dmabuf=OFF
 endif
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
