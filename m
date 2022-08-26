Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324EBECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC48B40FD1;
	Fri, 26 Aug 2022 13:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC48B40FD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18yKk9ZcSP91; Fri, 26 Aug 2022 13:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE9D540FE4;
	Fri, 26 Aug 2022 13:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE9D540FE4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C0E41C2742
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 275CD82FA9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 275CD82FA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mb4aN_PaMp3u for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AE5E83EF9
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AE5E83EF9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:11 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id sd33so3298647ejc.8
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=fQr1n6fMjoFlK5JUkkRsnY87tBvb6HRYnhwowQuimHQ=;
 b=zBfyqXL/Y2mRaKrkZ7YFUj3fn5eJ9yr6lYH1/Ek5NHm4lf/Ku1c3lwNPUdLWWDXFKb
 nK3I9OfVwZ3pYL2xlTvyKTdJEXvUGnlBU6NisT88Q16Qlp2X0uG3WjMEgCXMnzemlkD+
 /NiLh2DsncmgTVjHD6G4jTgu+GXulYaHhtTYtGRbOc2pmqAT3l7DfnkxtlAOydcRKGWB
 0i6tCfjXntvMM3gbovtcVRAhutypH9IQBENuj1TIYDWuF2NYcEYkTMghv4uy3IqneR8/
 hA2ekwMF1x/i18NCGK6jrLhrrrl/IOpwBOtYoqzBLxzfsUcJkPMnhhJAsf6ixDnCtxi4
 D0Fg==
X-Gm-Message-State: ACgBeo1Uqq+hirwFnoWsHe7xEDpA07+mnf9TKey4Bpy2249schrzJhwC
 QJ4jG034h3BSNJnT+jYfSwtY5pHevSS0x7RC
X-Google-Smtp-Source: AA6agR6mubEvCucgw4J21T4XNC8U0LJiYl58Ut5Vcx2GYcuV3ff7ZhQSNuIYrkCTP6EajBjZx84q7Q==
X-Received: by 2002:a17:907:284a:b0:73d:a818:5a2a with SMTP id
 el10-20020a170907284a00b0073da8185a2amr5397907ejc.159.1661522110465; 
 Fri, 26 Aug 2022 06:55:10 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:09 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:38 +0200
Message-Id: <20220826135503.20612-5-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=fQr1n6fMjoFlK5JUkkRsnY87tBvb6HRYnhwowQuimHQ=;
 b=UhzcYy9R7oWv0q/e3U4lu20I4tKLi/IpRjgin2moYq9VqyUSecIIGBgVOqIdBCUfMo
 Ofba7c+KYGzBwu+HePnB+rpnsxl26Sy2w1Ktg76uwpEwJESdDJsKDJCqnBvN7gISgRUu
 FyyCzk2YBHSyPfraladZX0MSP6krZ99qDbLGMoppzx7/Iw2f400Ywx5BtnqazTNdU8bA
 jTszatNpFFPqh8P5C9OgQV6k2DSmbYNZ6LFFhXNNnhmrcEQPmmmy2xm69WIM8BR6uKP4
 jbRhKq/B5ZmGxleQFv+clZ5oEI66n/JHY1Q2NwGiaA71wC42TTBsmSXG//wju33l/fdS
 ifIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UhzcYy9R
Subject: [Buildroot] [PATCH v4 04/29] package/qt6/qt6base: add support for
 concurrent module
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/Config.in  | 5 +++++
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 68bca728e2..fe488f1cc9 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -17,6 +17,11 @@ config BR2_PACKAGE_QT6BASE
 
 if BR2_PACKAGE_QT6BASE
 
+config BR2_PACKAGE_QT6BASE_CONCURRENT
+	bool "concurrent module"
+	help
+	  This options enables the Qt6Concurrent library.
+
 config BR2_PACKAGE_QT6BASE_NETWORK
 	bool "network module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index b4b6450bf1..302aecab31 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -83,5 +83,11 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_CONCURRENT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_concurrent=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
