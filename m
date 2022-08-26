Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A99ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 744E3610CA;
	Fri, 26 Aug 2022 06:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 744E3610CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7oPEBE3goyw; Fri, 26 Aug 2022 06:51:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95CAA610AF;
	Fri, 26 Aug 2022 06:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95CAA610AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F38591BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBA3E400F1
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBA3E400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7CUvaaa4nITF for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10A8440012
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10A8440012
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:21 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id h22so1392999ejk.4
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=nsimSi9e1JHrG5y/4+npUQvPME5pyPX5LS4V1ggkqf8=;
 b=R9t4H6FwBp3PzE8QGv8o7Zz6l9CgAVAvXLap2JWKyz45+OY/gA1F5M5hMYqWf8jaOh
 vo7dmGngXUtX7E0zgvLFJ36c+nXa1OZVJo3S8u3gPqLQ5Nu+nhwDlRkTwfnvc93l11oG
 S/L8QNKAFRUbj4gaWcUg9QukcRDwjJ85DSqdcFuKkol3N0uXqEEz1La/8BOxsCC+4BC7
 9xZeARb/E7CpQVszP5mW27qNLJCh0j0qLXD0EIYXATKlmkzZJWJxP7ebmIz+LsunO69v
 jWa3o3lpr29GaiYBbRdVS1hHALJt7Ecc3yXBBgV5zk6ZVsOl+waymEnQZqvGQPz+tO3A
 mvxw==
X-Gm-Message-State: ACgBeo1CQ/hiwCx6cs5bIpsG1VGFgKGqevaUOmMClIDGH9Z9XV6ovqFx
 ReXNkUFiK2zuahw/7e2P+Z4mhL7Znz50uLKZ
X-Google-Smtp-Source: AA6agR7NBAsbefjbv9xEbQIXom6vGYdq9ZjKHVkFGUklgLCfLI8UmByIux4a2vCW5d0ZeOhyLnF9vw==
X-Received: by 2002:a17:907:3f0c:b0:73d:60fc:6594 with SMTP id
 hq12-20020a1709073f0c00b0073d60fc6594mr4746287ejc.669.1661496500186; 
 Thu, 25 Aug 2022 23:48:20 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:19 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:47 +0200
Message-Id: <20220826064758.3968647-19-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=nsimSi9e1JHrG5y/4+npUQvPME5pyPX5LS4V1ggkqf8=;
 b=FgnBdMscAaFdfRigP0b5w/quMwIWRytfT7i0pxUcmc3h6fL2GAe5duodvxQvNZZokA
 KpDX0usuH3donfdUFfTh1JCsM5PRg2PGkgGRFJdkxjTkIlIKgniPAZGkepqPoAK/IZtp
 7vLWb/PUvknWjXuEblqQAMijwmq10CNA5edF2MGR2v9FEnJvSnE+FwOYtxXx9E7x5MKj
 5Fn8UtGnC9Ks4AVTRIvCACSpcAuoeDl3qmp7pE0U2VGLW96cInLD18oIvc2FaPHESGxD
 8nMtDDnJD6EmvuBzNcSZfOIoC4xuz6YlAv0eP0bgCV/yP68L/WHusxAb97C8f1Vahlfd
 0pAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FgnBdMsc
Subject: [Buildroot] [PATCH v2 18/29] package/qt6/qt6base: add support for
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
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/qt6/qt6base/Config.in  | 10 ++++++++++
 package/qt6/qt6base/qt6base.mk |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index e9bb7602a9..949bf26843 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -17,6 +17,16 @@ config BR2_PACKAGE_QT6BASE
 
 if BR2_PACKAGE_QT6BASE
 
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
 config BR2_PACKAGE_QT6BASE_EXAMPLES
 	bool "Compile and install examples (with code)"
 	select BR2_PACKAGE_QT6BASE_NETWORK
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 4a51d530d7..ce937300d0 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -190,5 +190,8 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
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
