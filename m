Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D33ECAAD2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0DC5610B1;
	Fri, 26 Aug 2022 06:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0DC5610B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RtUJeH3CLcU7; Fri, 26 Aug 2022 06:50:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20C7F60B63;
	Fri, 26 Aug 2022 06:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20C7F60B63
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C888F1BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC2FC40292
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC2FC40292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gHzdmxV6OkHi for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B086140336
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B086140336
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:11 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id u6so933778eda.12
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=lwgwjQjZ5r+fBFGgWaHJ/4glwKiNHQX3ubcenkd8z60=;
 b=frFpmzY4lW6ImyVWtqjWNewxJHlEGfdul9mS9NYSVx8hlOK9FALV6tZsevMHRjCgFJ
 OYtGi3AgiXqWwpaj3jM7KodCnKj3lO2mdXPWVOQUqsdipKK9gENp6Tj+U5bn2iOhXrfr
 I1DN9fTZZR4SqLXBJNW+mB+1Nxipo6SFFt4hUG730vcU4sPFGz/xlBdERPMFCQ1iHeaz
 PSHfC+8MErmguQONEuBzher+6bD5YUf63NAjabJ6JqXS9hrMO/vYK+J6ljqwMEzR92xi
 wfT/G0JMooh1EANzZ3xK7gBmysnjQc9k7idDWeFfDAsbEhhrVfbWWYyep5X7NH+EsbFH
 pJtA==
X-Gm-Message-State: ACgBeo1IgnOZCbNOyMgx5R0v/yZP54wuMmKBbXG/BACoqJWoj37BXWbQ
 BQ9SkFfodYnh0shL7EmG7K1mGOmJcVh5/woV
X-Google-Smtp-Source: AA6agR5/WVwdvUSxBAnVYcz3FTlpdJBAh4MFq3LYvF0DAshmXY8gRXgynBOKmzNqEfU1NnhjfTrPYA==
X-Received: by 2002:a05:6402:5ca:b0:445:c80a:3c2 with SMTP id
 n10-20020a05640205ca00b00445c80a03c2mr5698670edx.247.1661496490879; 
 Thu, 25 Aug 2022 23:48:10 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:10 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:38 +0200
Message-Id: <20220826064758.3968647-10-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=lwgwjQjZ5r+fBFGgWaHJ/4glwKiNHQX3ubcenkd8z60=;
 b=XHy4mAsKHYz/z/a1QBZs/fB21BVzPse0CuFdBfRGNErkjq+GyMuA34tGpLX08fEXmp
 9SAFNFvwLR79uhEWdLBos0efUmRUjC8U4dD17HZtJLuz2g4hI5LnaPjKpbL1+pO97BKe
 gdwfkS644FBjnNSaJxnxhsuU7YUHjCH4oOjbrn8cNnOAoHC5G6i+zOdejL+vQgQQiEnJ
 OqWHACIu+kajySyHlK1+Q8sCBkdxCd2nQekveCCSw/p0z7iFAu57IVFAfAWMnjawH+1W
 u6y7DcoY+Y9JVxYVzOvGBwh4O7NLUBRsXMTsVegSEQJODhniS2Q5LH9j+jCvKAEa1avC
 vO6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XHy4mAsK
Subject: [Buildroot] [PATCH v2 09/29] package/qt6/qt6base: add support for
 syslog backend
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
 package/qt6/qt6base/Config.in  | 5 +++++
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index fb573303d5..4d75fcb111 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -44,6 +44,11 @@ config BR2_PACKAGE_QT6BASE_XML
 	help
 	  This options enables the Qt6Xml library.
 
+config BR2_PACKAGE_QT6BASE_SYSLOG
+	bool "syslog support"
+	help
+	  Logs to the standard UNIX logging mechanism.
+
 config BR2_PACKAGE_QT6BASE_DBUS
 	bool "DBus module"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index bdb7f00e65..7d6a79d00a 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -118,5 +118,11 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_xml=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_SYSLOG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_syslog=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_syslog=OFF
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
