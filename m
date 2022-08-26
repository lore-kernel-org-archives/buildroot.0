Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DE8ECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 14:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B763183F27;
	Fri, 26 Aug 2022 14:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B763183F27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QyPCQ3TYlwpe; Fri, 26 Aug 2022 14:01:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E905E83336;
	Fri, 26 Aug 2022 14:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E905E83336
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 377FB1BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12AF36110C
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12AF36110C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FowtQchNIIEf for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2311F6110D
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2311F6110D
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:36 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id m1so2201764edb.7
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rYv+JiV7uKQLsSlljJrQkH3Kgz25sqxUJ5p1FEhH4kk=;
 b=XbHQEebrLQ21MJpclpNNq4DPCdw10OwvvLvxDUFktsv5aacNJad8RR9tmBZR3iY76a
 axNo0rvOW9q+iOIoHy1wiqdRIsFZRLNDemuVo6k3Ti8n4Np01VrA+r8PnEa1o2tH02nH
 WAZc4IVJ9Ehy9lo1ztz4Aqglbzv86hpkogvKMxE/mCh9It4e4ARs19chSaD3Ky35HcqE
 zIDetafE5dLP31PwLTGd9l8M6LOrDeLaZe+Wsyyu0hJg6Qktkcg7WbWTZgyYqCS40WI7
 nynAscYTVYA3nq61q4oXI8oqVL97W36jgS3zKJFjYO8EgSlZmywrXQ03CQfI61nJlOom
 0ZrA==
X-Gm-Message-State: ACgBeo2raf0fDb5cGdUaQUlN4BpCHgMCUfhnlLXONcxmM26/tDwYS284
 c+JaJFhWGaFJ5alQwKi0kwTU7LooKcoLyhNt
X-Google-Smtp-Source: AA6agR4vY9ZGpkPosObzwNQnqguDN1p+i80f4xQEOYN/tCXzwPpFWRtsZxZ/VEKEjvhLf0WzqtvobA==
X-Received: by 2002:aa7:d846:0:b0:447:d664:8409 with SMTP id
 f6-20020aa7d846000000b00447d6648409mr3390813eds.159.1661522135312; 
 Fri, 26 Aug 2022 06:55:35 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:34 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:55:03 +0200
Message-Id: <20220826135503.20612-30-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rYv+JiV7uKQLsSlljJrQkH3Kgz25sqxUJ5p1FEhH4kk=;
 b=Ur1knnanO4HNMe7KNZHzSJUJEtNgMB6zPdtsjFo4bP93Cz7A0y/AagVwHvlMdD7S55
 D9tNjtwSWqeBcioLGMnWH4G94Yw8EteOXkgyT4dxAcekoGl1jo7S0EKC3jERKwkqIqp6
 RZiAeFBUiITeLO1N0IierTlYHSofATIzduVeIr+b7iJga5cZwaNbH2qUWhd77sVunpTH
 qOLQH2oyRGS3Cx8eUnVVm2avKl8mMu3+mlBwpxTCxVAEXD3lqx0UHKXy51Cchf1ILEin
 kmpFQHDikqom+vSkfZZJZYUXQgG82yFsvDPrDTHhfEh0NuSRGh7iPvmou7vwMkzwWydr
 yBnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ur1knnan
Subject: [Buildroot] [PATCH v4 29/29] package/qt6/qt6base: add support for
 building examples
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

Now with dependency on DBus/OpenGL
A minimal set of Qt options was selected for which building the examples
started working.

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/Config.in  | 17 +++++++++++++++++
 package/qt6/qt6base/qt6base.mk |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index ffa5a56b40..5c751dc109 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -40,6 +40,23 @@ config BR2_PACKAGE_QT6BASE_DBUS
 	help
 	  This option enables the D-Bus module.
 
+config BR2_PACKAGE_QT6BASE_EXAMPLES
+	bool "Compile and install examples "
+	depends on BR2_PACKAGE_QT6_GL_AVAILABLE
+	select BR2_PACKAGE_QT6BASE_DBUS
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	select BR2_PACKAGE_QT6BASE_XML
+	select BR2_PACKAGE_QT6BASE_DBUS
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_WIDGETS
+	select BR2_PACKAGE_QT6BASE_OPENGL
+	select BR2_PACKAGE_QT6BASE_OPENGL_LIB
+	help
+	  If unsure, say N.
+
+comment "Building examples needs OpenGL/DBus support"
+	depends on !BR2_PACKAGE_QT6_GL_AVAILABLE || !BR2_PACKAGE_DBUS
+
 config BR2_PACKAGE_QT6BASE_GUI
 	bool "gui module"
 	select BR2_PACKAGE_FREETYPE
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 9b5328e5f2..2324d3825c 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -335,6 +335,12 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_icu=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_EXAMPLES),y)
+QT6BASE_CONF_OPTS += -DQT_BUILD_EXAMPLES=ON
+else
+QT6BASE_CONF_OPTS += -DQT_BUILD_EXAMPLES=OFF
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
