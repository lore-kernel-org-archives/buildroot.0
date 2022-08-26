Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E3BECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D7D883F29;
	Fri, 26 Aug 2022 13:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D7D883F29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJC5Vw7ffy_D; Fri, 26 Aug 2022 13:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A794983F1C;
	Fri, 26 Aug 2022 13:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A794983F1C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F0081BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69E3361113
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69E3361113
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SOJsoisUfWGo for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0C036110D
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0C036110D
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:15 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z8so2255552edb.0
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=02f+DaRMsn9nZGR8pOE7oaQnPXhfAUEVH6zzIplolAo=;
 b=h8vb0H/g0rsLueYbjnyHVVQ6mE3mzitVwqL42AI7a4gMDBCmC2ySYfbRYz6q6dWt4y
 Z0C5hcetBe4Q2X3UX5wBNNAG16K2yd5cgKPgRExDA6JOWSi1T8FaVrMsIOOSgLrcuJJy
 62Fi+vZRL3EuKgJ0btiC5zPAC2LKarpMhCU1dn6LX8qos1IsBaEv3M6AnYqI6d7+1j4f
 RfmhEWiHaK9DfWGg/ppCLBYiK1VJi4/XIyVn1XQT/V9IXaJERRoQa4ziAP8TNx1K01Sf
 XZxL2caiAtrLZ7iOlxD2YqzMt8JFmP//31LO9dMVjFvwRwznbnUDQyavlNz108svtn4+
 zMHA==
X-Gm-Message-State: ACgBeo1govXEMteNShJqxBzDlyNo71r4mP71TGto1XY9XqsCNLMsrHha
 o3tqFNn1OkLynunzd5zFc+rc1ucWS/3rID/G
X-Google-Smtp-Source: AA6agR4D/jgWJ0+8toGKspm3WVPf3O76a8gf/dztLHyWIAK/qNXvbzSQMikNnpEMYTmnXevWohZT6Q==
X-Received: by 2002:a05:6402:14e:b0:443:f58:17e9 with SMTP id
 s14-20020a056402014e00b004430f5817e9mr7134911edu.106.1661522113456; 
 Fri, 26 Aug 2022 06:55:13 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:12 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:41 +0200
Message-Id: <20220826135503.20612-8-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=02f+DaRMsn9nZGR8pOE7oaQnPXhfAUEVH6zzIplolAo=;
 b=kn7UcDE7pO/lqOCRce/5qTqeKy/b8hpvAozhViz3z0AoIenCMs8Pt801YBtjhrFpB7
 m9FGurFarjEuq0feRLh8Nje/mOnBnpwf+D/7M1oIg9cZ3Mb1w2bApJcXMk9Hr6GBj4PD
 L9fZM8aGxJTtCLHag43ohlRF7udATLJvRx7IaqleFm1h64H5RJEzfk11li2SkV55oWYW
 qqe9rObA7It1/Kr4ncljiY8RW30tghDZ8YMjGS9QYtfOrOZEzUXeCOqaTEHXuKEEhC9T
 7BDANhb6omXcZORD7Ci000xio3MYf+x9fF61hm3m51cu2PRpIvBPo1YxL+kAlUJRNRql
 gRxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kn7UcDE7
Subject: [Buildroot] [PATCH v4 07/29] package/qt6/qt6base: add support for
 dbus module
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
 package/qt6/qt6base/Config.in  |  8 ++++++++
 package/qt6/qt6base/qt6base.mk | 11 +++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 354e02280a..2d4a4df223 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -22,6 +22,14 @@ config BR2_PACKAGE_QT6BASE_CONCURRENT
 	help
 	  This options enables the Qt6Concurrent library.
 
+config BR2_PACKAGE_QT6BASE_DBUS
+	bool "DBus module"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_DBUS
+	help
+	  This option enables the D-Bus module.
+
 config BR2_PACKAGE_QT6BASE_NETWORK
 	bool "network module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index fd1e0a2847..fdb3377eb4 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -77,6 +77,17 @@ define HOST_QT6BASE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
 endef
 
+ifeq ($(BR2_PACKAGE_QT6BASE_DBUS),y)
+QT6BASE_CONF_OPTS += -DFEATURE_dbus=ON
+QT6BASE_CONF_OPTS += -DINPUT_dbus=linked
+QT6BASE_DEPENDENCIES += dbus
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=ON
+HOST_QT6BASE_DEPENDENCIES += host-dbus
+else
+QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_NETWORK),y)
 QT6BASE_CONF_OPTS += -DFEATURE_network=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
