Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78BFC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E51B40A71;
	Tue,  7 Feb 2023 17:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E51B40A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIVvq8SdjB1F; Tue,  7 Feb 2023 17:20:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9136840AA1;
	Tue,  7 Feb 2023 17:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9136840AA1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 04E511BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D05E2418A0
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D05E2418A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4m0u7Ajwxy6m for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:17:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3CCE418BD
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3CCE418BD
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:17:41 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a2so14000349wrd.6
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vyREN/yozjt7byg437S3Yz/Vb1hitehJLbYXJdpiuzU=;
 b=CPRe2AFd/K9fcBb22mtzkSV4VKkKaU3VjplmZg48rmwiabQAxC92IgyUeLTuGReUeK
 6G7TAdi7Es4yrCbnKG1yykZqMpOcZRDsRYuWml4G7yB20AK7W/Rt0rgU+C+rI6cKvAou
 jL+TA5BXDmhTqmHJ8ls61odXGqpKgml5k/qYFL4G9IiTV0v6DJG6It+3rmX9Om7E/tnM
 lHDoeZKkgDGUlL+mkmMv4GFMCNPh6kXBSkxjm0s4pZo/ZMlCNzJqQCEGBSf5oKN02SK1
 mIBcfXsXq7eyrINMpaBlJuiiF3QEwaqLtGgaCPxlj9JrQ6OyldLcBytavsBQUtarDC7a
 caug==
X-Gm-Message-State: AO0yUKXkKBqZwYVqs/ZrU2FkRTsuim1SLJeuowURwOPRr8k3DG2Z+4+s
 JbyKAT4JjppuLAhHDPRVlbUowT1jzv8DkiCSDCdNsA==
X-Google-Smtp-Source: AK7set/JoOEH+xATt4/U8glAeIs+Mp4Kt7LKBkd2r54vCnTXpDcQT5wyQKyVfhGIfyO8N6A+eZuHiA==
X-Received: by 2002:a5d:54c5:0:b0:242:5563:c3b with SMTP id
 x5-20020a5d54c5000000b0024255630c3bmr3452609wrv.59.1675790261019; 
 Tue, 07 Feb 2023 09:17:41 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bff574a250sm11708801wrr.2.2023.02.07.09.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 09:17:40 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:17:19 +0100
Message-Id: <20230207171721.2973997-12-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207171721.2973997-1-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vyREN/yozjt7byg437S3Yz/Vb1hitehJLbYXJdpiuzU=;
 b=Qz9bHEUK1rczSQiNEhMamSy9DHT1YQdSgm7UTJD2WZvRZXQ3UcRJ+6VyhLTQCM6uWL
 zYqo2MZvC9zVU5n086RpD3ZArvF94YrZw9MPCGu+hiJ5udeP+8xkzokuahrbFAktSOMy
 1qKA3gd0zcntmypaGejVbGAOT6GlJdgQAOrLs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Qz9bHEUK
Subject: [Buildroot] [PATCH v6 11/13] package/qt6/qt6base: add support for
 printsupport/cups
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
Cc: jesseevg@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jesse Van Gavere <jesseevg@gmail.com>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/qt6/qt6base/Config.in  |  4 ++++
 package/qt6/qt6base/qt6base.mk | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index d5d6d3569d..4d13128661 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -168,6 +168,10 @@ config BR2_PACKAGE_QT6BASE_NETWORK
 	help
 	  This options enables the Qt6Network library.
 
+config BR2_PACKAGE_QT6BASE_PRINTSUPPORT
+	depends on BR2_PACKAGE_QT6BASE_WIDGETS
+	def_bool y
+
 config BR2_PACKAGE_QT6BASE_SQL
 	bool "sql module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 4a64886a3f..97986a3c2b 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -206,6 +206,18 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_jpeg=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_PRINTSUPPORT), y)
+QT6BASE_CONF_OPTS += -DFEATURE_printsupport=ON
+ifeq ($(BR2_PACKAGE_CUPS), y)
+QT6BASE_CONF_OPTS += -DFEATURE_cups=ON
+QT6BASE_DEPENDENCIES += cups
+else
+QT6BASE_CONF_OPTS += -DFEATURE_cups=OFF
+endif
+else
+QT6BASE_CONF_OPTS += -DFEATURE_printsupport=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 QT6BASE_CONF_OPTS += -DFEATURE_kms=ON
 QT6BASE_DEPENDENCIES += libdrm
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
