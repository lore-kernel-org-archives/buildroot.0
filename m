Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CAFECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A533583E8D;
	Fri, 26 Aug 2022 06:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A533583E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzTWVEeR7NH4; Fri, 26 Aug 2022 06:49:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C45F583E82;
	Fri, 26 Aug 2022 06:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C45F583E82
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C7A61C11A9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E681E400F1
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E681E400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54u-WZX3W7kr for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FB3A40012
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FB3A40012
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:12 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id u9so1394515ejy.5
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=f80USLSyQMWOwgSoizGn0tNfksEKJqFruH+UqV2T8sw=;
 b=ZMtDRPk48al68RbWqSjcuW+Yv/L+zilKX8+ozypySqHWdmo2ca6l7JASdGIxmqqd4K
 Z+WUqqNaPZQ3Fv9mJR/1AcqByo9emN0lv9NDuE0JN2f38jpXb1AEC6eAjjRBiFN7agTb
 wQ8wJRPTHNLD8O+8EygoibewtBpE3y1IZry5fB2N7DtKdwtdZCeCNrDeDZt35XqezZv0
 rhwWICMlqNDmFWyUeYUIY58n1x4kY5SeP6lwqyJL4U2v+lOXGroQe06V34oCzeoRu033
 QUeTlpyd+DsXTWjNOak9whCj7Py0sUzeApp4j4E/idbCvCsMsKt49dyJQ5HAWg7aHLyI
 oBsw==
X-Gm-Message-State: ACgBeo1NLrjEroUJSIuitFieZgT16Ay54M3jy5CGn55auHJp/OnuDKKo
 ThHJqpN5dqDn6mVdQw83YjGWawU/nAu4sztD
X-Google-Smtp-Source: AA6agR7J6rFRvxiUAhqHqKItfX+UEAOUe3ia3Sn7b7wChESpbPBSN3WE/GH8QHr/dAYNsIl9GS7Vfg==
X-Received: by 2002:a17:907:6293:b0:73d:b27b:e594 with SMTP id
 nd19-20020a170907629300b0073db27be594mr4700095ejc.526.1661496489941; 
 Thu, 25 Aug 2022 23:48:09 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:09 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:37 +0200
Message-Id: <20220826064758.3968647-9-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=f80USLSyQMWOwgSoizGn0tNfksEKJqFruH+UqV2T8sw=;
 b=la7cRBmzG0qtdBAVxHlAqFZGAL2pjZWpBDZuSu99AM6A3I2kpQrttuY7b0Eq8Ky6pu
 ctq7Gk2h8+GOJAZbnjkcTlHrxmxf38M8dKo+vViesTYNASZpGKY1cun3uqDHomUBkPPa
 hJOxql7pEnSQmePioaijEnDBOLrZltiPKZNnS05IB0Q6oxIcZZuvQifEHfaIBgt+iIEu
 o5Zmg89qtyyMnP6RrP5HMCEJ4Yz44E3HaR8qXtJ/3AgvtpKAgPjP52CGMm3V6PRKhI18
 27soSL/vFecIEX9vgGRVjYfqSXERQMN37SmmK0kDiiz+VRAwblWjLD4+Sa4NjvD6g9Tv
 9Meg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=la7cRBmz
Subject: [Buildroot] [PATCH v2 08/29] package/qt6/qt6base: add support for
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
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/qt6/qt6base/Config.in  |  8 ++++++++
 package/qt6/qt6base/qt6base.mk | 11 +++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 061861880c..fb573303d5 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -44,4 +44,12 @@ config BR2_PACKAGE_QT6BASE_XML
 	help
 	  This options enables the Qt6Xml library.
 
+config BR2_PACKAGE_QT6BASE_DBUS
+	bool "DBus module"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_DBUS
+	help
+	  This option enables the D-Bus module.
+
 endif
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index f66610ea0c..bdb7f00e65 100644
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
 ifeq ($(BR2_PACKAGE_QT6BASE_EXAMPLES),y)
 QT6BASE_CONF_OPTS += -DQT_BUILD_EXAMPLES=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
