Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEF3CAC583
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 14:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ABD74117E;
	Tue,  9 Sep 2025 14:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIcT_puWseRM; Tue,  9 Sep 2025 14:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26AA140AF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26AA140AF2;
	Tue,  9 Sep 2025 14:47:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72EBFCA
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 14:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6487D611C0
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 14:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FmLyU81-5vpd for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 14:47:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 75DB56116B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75DB56116B
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75DB56116B
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 14:47:26 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b043a33b060so903990566b.1
 for <buildroot@buildroot.org>; Tue, 09 Sep 2025 07:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757429244; x=1758034044;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Afj3MfRVfDdoaQWFVUQMvia+1gIEpJWlkIVIF49HDKk=;
 b=nVQry2T8eNMxG93wGjNKIdWlVlC3a3XFq1V2r4LtrM3U+xkT0e8Zd5PVjFzbP2paZr
 i6JgNuRQspAVuY2BAkFOVcDEkPEuSUUrPNVtBxphhW6MP5fls9BLC1MtlHheI5nhCgmL
 NaVHUpduZTb83+cXoQxYYy5n8AoYY73MAiHTwRgopyB/ILaWtU/HVpHO2iCEVYlzi2Au
 8es9lx1sJZuQs+7ZLAAnStIp/zJDDFNodi1YZyh+eWR1UMkwH2k3jgBGaL9K3dgw7cX8
 Itn7IfvNnMKeEIi1hHQ+/ITCiocPXyKPP3m/zBSTXbTt7P+VyFJC8Bov5kdtNKdC4kUG
 PGwQ==
X-Gm-Message-State: AOJu0YwsPdQIsux2vXjAjTbxXoRn/h0+frcezi4RdBATh+LsZz5vU3hE
 +j52PifhU93HNEuApld1z9eVHLK+aAfOChr5oIapsjbifqALQh0u1YKuDKA/3/1Uq/TBF/MfLU7
 YWNeo
X-Gm-Gg: ASbGncvr4rYxDx2gssH8DD4yjwfU5iucDYywhHkR9a0lifFiTVwYriv4mq3FySDzQqb
 PgEDhDU3Tsiff5ZyR0R1gRvcFiXzCSZtYW5hgONrUKncDhslHhivSgY/vvVMS5IqXbgdIkaaDkt
 VDFhudnGM/tWdcYAasFo/waLWygTelcHFMYSW3hK9LsKeHhSpw1DDnkJ9pIcUFM7zQn5WQe0cHk
 6EO1hHbv1g8OJqzIV/yLcbdF6qGO/90WoX5quQpBJA4R/MHUn2H42YjGrjG0yXMsRSg4UequLvD
 rSBc/Z6DbdSjCUiHtBeriu6FHqjKss7T3Ir7t06YvhzIG1emC7AczV5qMmPHGE6XFEN7ziLSU7m
 npVFRMZvZMmlq0+U4iOAeFGBifaNhf0hXrL6QsiGKPUMrIB7yeyg/jswsnwy+AYcpSE4HVQ+SBF
 8cWDKI2SD6OG0=
X-Google-Smtp-Source: AGHT+IHgQrGcv4m9ejtbHQ7AG/tEXFqnHJjXCHcljqLOGZbgUSHjftW9TsHXaDr5Wr9aMbd3rHdGwA==
X-Received: by 2002:a17:907:d8b:b0:afe:7909:f42a with SMTP id
 a640c23a62f3a-b04b1714531mr1117509966b.51.1757429244236; 
 Tue, 09 Sep 2025 07:47:24 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.149])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07830e8e78sm2668766b.48.2025.09.09.07.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:47:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue,  9 Sep 2025 16:47:13 +0200
Message-ID: <20250909144713.569514-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1757429244; x=1758034044;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Afj3MfRVfDdoaQWFVUQMvia+1gIEpJWlkIVIF49HDKk=;
 b=WfsTGDJ4sukfoJuFvYu0HVqidAsL7G5pHVSafpo2Q1JIwkDUAGv4Qa8Um9bWp6+/HN
 kMLYGCePMvaOv+WIknEqz+Xx7Jd6IbYMPj33JnqGBT/spDvO4MbQkPg8Hfa5BkfqNRUC
 GxswFlgIisLmIQHcvz7cdTsXRsU6I4NF6zi+I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=WfsTGDJ4
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6base: use QT6BASE_CONF_OPTS
 for Vulkan
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

The Vulkan option was appended to QT6BASE_CONFIGURE_OPTS instead of
QT6BASE_CONF_OPTS, which is the variable actually used during CMake
configuration. This prevented the feature from being enabled/disabled
as expected.

Fixes: 1c27f3a12d77b ("package/qt6base: add vulkan option")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/qt6/qt6base/qt6base.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 51a4f1b5be7f..3bf4a1221b43 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -183,9 +183,9 @@ QT6BASE_DEPENDENCIES += freetype
 
 ifeq ($(BR2_PACKAGE_QT6BASE_VULKAN),y)
 QT6BASE_DEPENDENCIES   += vulkan-headers vulkan-loader
-QT6BASE_CONFIGURE_OPTS += -DFEATURE_vulkan=ON
+QT6BASE_CONF_OPTS += -DFEATURE_vulkan=ON
 else
-QT6BASE_CONFIGURE_OPTS += -DFEATURE_vulkan=OFF
+QT6BASE_CONF_OPTS += -DFEATURE_vulkan=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_QT6BASE_LINUXFB),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
