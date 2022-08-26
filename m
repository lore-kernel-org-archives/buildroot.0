Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69914ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ED3782A26;
	Fri, 26 Aug 2022 13:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ED3782A26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZXa6i_bL-Cx; Fri, 26 Aug 2022 13:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D17381B71;
	Fri, 26 Aug 2022 13:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D17381B71
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45A301BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2054083EF9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2054083EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUGFYgRBErDH for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F02782FA9
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F02782FA9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:25 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bj12so3263585ejb.13
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ggaSdDab8pxVm2HnNlQ1iKqv/BSZ8EhwmtGc3VFuv9Q=;
 b=hHyAMTUuOhT1aol2OfjV71UwpSrPxRHkYJdtu6R0kfcZHzoqt0Dtsl7fhHMzG45bWI
 +VFSexUVnvKOAAAvz5+vu4q/OJmU01LLT/4ZFwJxmQG7N5euDyxOJ3lcDDJ9GBTb+lhu
 JiRMxsRNd0ZhrVBBrMSwntIZlW+ZYUL6laZx5xV1DOPwguCzw0+ggHPza04qznfRE74W
 gPEvkATS2Bs3aDwqHCYm5hT31IE7uEf4J52VvQDPsVu9n723WOuNRkHfPqNF/DJhYYAN
 /57NGDxetf5QutXVYqEah7gm1jpNed1RXLO4PfNq3x9HHeZeBDAfgkESCPe9zhyA4n9B
 mE5g==
X-Gm-Message-State: ACgBeo2y2vS/HNsoYMTqlxBWEx2NiPZ/QExSXBpkDJ2r+oeVKmz8X9Vo
 owgnAwDG32tC/S4k+XfI/YgqBq9s/PBFsRZO
X-Google-Smtp-Source: AA6agR7GVsBlcBz/EAiMUAYA5LdVPh0rEKpjieUk1z44RU0uNSuv94t81PxQ3/1pmu1hsz325ghM8w==
X-Received: by 2002:a17:907:b04:b0:73d:d98f:7628 with SMTP id
 h4-20020a1709070b0400b0073dd98f7628mr3915355ejl.245.1661522123208; 
 Fri, 26 Aug 2022 06:55:23 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:22 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:51 +0200
Message-Id: <20220826135503.20612-18-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ggaSdDab8pxVm2HnNlQ1iKqv/BSZ8EhwmtGc3VFuv9Q=;
 b=qzbyGh3874u6g9igAEFaRfL6dPZyeLsWJN4fl/Q3TIbI0UjwbD8CtihSeHjhGgzvHE
 f2hgo10B4YqIwuAjX/fcd38MnMhGTLmWoHmg8qCxH69NoopXoIPXT1nJvxSgCv9e+ukq
 7TUpyurZaf9AdJbnFOCoW1EWFWdlQChJn41ED9b4iUul7ElYyrIeTQ1e8WUs4OrYST0I
 aAafAKkgFgtCqNbjgRaZ1QPZtEWBx3z26spuUoKJc3Bo6P3XJbzebBV9pntLUy8Nmw6f
 3nRXInxmLrVyC3xBJZ72cm0Qs3YP44OTrrde4+VW12jV21r4YMDNva62Dlz0Zr/4ffKO
 /yhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qzbyGh38
Subject: [Buildroot] [PATCH v4 17/29] package/qt6/qt6base: add support for
 passing custom options
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
 package/qt6/qt6base/Config.in  | 10 ++++++++++
 package/qt6/qt6base/qt6base.mk |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 0fc54a6c27..25f848f7a7 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -22,6 +22,16 @@ config BR2_PACKAGE_QT6BASE_CONCURRENT
 	help
 	  This options enables the Qt6Concurrent library.
 
+config BR2_PACKAGE_QT6BASE_CUSTOM_CONF_OPTS
+	string "Custom configuration options"
+	help
+	  Define custom qt6 configuration options which can be used to
+	  enable or disable options not managed by buildroot. These
+	  options are appended to the ones generated by buildroot and
+	  passed to qt6base during configuration.
+
+	  Use cmake style '-Doption_name=ON' or -Doption_name=OFF'.
+
 config BR2_PACKAGE_QT6BASE_DBUS
 	bool "DBus module"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 87ebc59cd6..ffb03314ec 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -184,5 +184,8 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 QT6BASE_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-latomic"
 endif
 
+# Must be last so can override all options set by Buildroot
+QT6BASE_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_QT6BASE_CUSTOM_CONF_OPTS))
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
