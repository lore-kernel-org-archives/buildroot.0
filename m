Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DB6ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2209941A2D;
	Fri, 26 Aug 2022 13:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2209941A2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id atIRTN8lI2Qo; Fri, 26 Aug 2022 13:57:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 549C741A10;
	Fri, 26 Aug 2022 13:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 549C741A10
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E3811BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD9D383F12
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD9D383F12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NWMwlCloYrSf for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 171EF82FA9
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 171EF82FA9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:21 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id lx1so3275455ejb.12
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=78YYMkUeEwaTr41w9qvTcNZvwNS6VeJOPsGCfIO6vm8=;
 b=Xtvk6/gFt4sTBeF5Fb0JMUQdkDSfMAIlOtaUI7hjgjENcSNYFocXkOny/zUZLA6ZsG
 KHKZn48e1+sjXhGuonw0BUB3AtJANDxrcRZhqrgu0Qo4DOlR0xv76SfYBZVrCyoiEeo3
 aB0QBYEi2ALFq55UrwAKm3QdprHbIy1sJVv/m+sNxZMz71ZXYrUJBkchq3SU/tSfvqcs
 tetOP0N4qeYDsKfCrdkuZpBiBdZcPtY6n7XZbXDJb1S2/dpPQbR6wgHo94z4MaO2ABBI
 tnPGZ9Ck3ho6XbNI3eCnPq21RtwP7s1qTZYlU83jBX79ZlVBBdKFTEwHFZd0e9UeJvUv
 RJoQ==
X-Gm-Message-State: ACgBeo2amQg4whX7LUibH5jdpJg5frsvRYDHAWKOVx0DAA3/XdYNjZ/D
 rTcfSeP7Q4BVnGkcQzMdLfX+2K5Z2AzL2VcV
X-Google-Smtp-Source: AA6agR4jGpo94EPQG5BsrKkcAqyEjtmybyWE52CKZrn9vuclcSlAKzx8yzgb5jHGCYowaaobaps2TQ==
X-Received: by 2002:a17:906:fe46:b0:73d:939a:ec99 with SMTP id
 wz6-20020a170906fe4600b0073d939aec99mr5643263ejb.169.1661522120261; 
 Fri, 26 Aug 2022 06:55:20 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:19 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:48 +0200
Message-Id: <20220826135503.20612-15-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=78YYMkUeEwaTr41w9qvTcNZvwNS6VeJOPsGCfIO6vm8=;
 b=LrCdPwDJ4sjomGFLBb90yyqJJl1YQhLvAVeCuGvC88e7JFXp8H7Up+EMwbPZ+T2diS
 k7Zh/eq4RmjR3X1WCe7tzTmb6UydAa/m3YmhQL+vdFs02HpkEY6CJqZVZcSP8I2TDRUB
 ayP3ow/KNfO/xB9MUjzrG4bOvCOECCD4mGrSpt0fLxTEtudbFaviVw6ccHPIrwIm5irY
 +Kr0OxQFysohMrJ8NlXJpRXAZRfi7ww3cfEd+TXE25B8KFD70MQVp2tJead5QJ1gj57z
 ggFn5e2ssIEkGhzX3ujat3aJeEXEhDNZ+SnUZyRh7hv3Osf4GJQ8y0azos4GjbCC1vGE
 lg4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LrCdPwDJ
Subject: [Buildroot] [PATCH v4 14/29] package/qt6/qt6base: add qt icu support
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
 package/qt6/qt6base/Config.in  | 15 +++++++++++++++
 package/qt6/qt6base/qt6base.mk |  7 +++++++
 2 files changed, 22 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index f3e56aefa4..0fc54a6c27 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -30,6 +30,21 @@ config BR2_PACKAGE_QT6BASE_DBUS
 	help
 	  This option enables the D-Bus module.
 
+config BR2_PACKAGE_QT6BASE_ICU
+	bool "Enable ICU support"
+	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
+	select BR2_PACKAGE_ICU
+	help
+	  This option enables ICU support in Qt6. This is for example
+	  needed for Qt6Webkit.
+
+comment "icu support needs a toolchain w/ gcc >= 4.9, host gcc >= 4.9"
+	depends on !BR2_BINFMT_FLAT
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_QT6BASE_NETWORK
 	bool "network module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 0826a0be07..47512fcab6 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -114,6 +114,13 @@ QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_ICU),y)
+QT6BASE_CONF_OPTS += -DFEATURE_icu=ON
+QT6BASE_DEPENDENCIES += icu
+else
+QT6BASE_CONF_OPTS += -DFEATURE_icu=OFF
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
