Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D39C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4250F60C1F;
	Wed, 27 Jul 2022 13:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4250F60C1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3JUFzOl475U; Wed, 27 Jul 2022 13:26:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4824F60BDD;
	Wed, 27 Jul 2022 13:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4824F60BDD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 474C51BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E256409F0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E256409F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6p9H1EckNqrS for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:26:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18E20410E9
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18E20410E9
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:26:39 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id l22so2607701wrz.7
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q9FaU4IK/EgzkWESDjAvRlo6HY++r53S2nzCc0EtjgI=;
 b=1hXaU4eNDhTl2HyWgb92rJ5EKtKG7sZIBy2swg2cUP9hwkG50ZFDVhlTgONg1onHp9
 na3xbxYlZ3G80zvnrlqwuZgo9d57VFGBgK6UoSPh/H1JjHgT1pgtfnoMgHPzyDPnjBWS
 jn2n2EYbjvIsOT6INr5avwLtQ+Xp1Cz47Q0t11QdEjE2w+qxltJhfu4SPax6CCFatefX
 bv49XIFOu5tvv/3aQVlJeLc82OptmTX78qA77W1uzDOKGMQu8XsjMzY1a2ZbnOLtJUFe
 kyh1mJamrTcumu+9TfxPMa9Cl9CfX+ZXS2WCUcbh1KQZOanvRpgLSKOtEZF+UIuCQmlh
 +2jQ==
X-Gm-Message-State: AJIora+UwYVHi7FW0PPE/T0mlsIkvzdn40zVnxaUps5hqDlx1KqHKmeh
 WIxxzh5vcahKxSK/aESLOR+zbl4InqI=
X-Google-Smtp-Source: AGRyM1vqeIlwrDZ2How2xIDisvH//DT1zZB6eeZJuoQ9fH/xle7ce1go6xnBMklKzkH3lJNtoKxA+w==
X-Received: by 2002:a5d:5887:0:b0:21d:bb2f:eee5 with SMTP id
 n7-20020a5d5887000000b0021dbb2feee5mr14086705wrf.288.1658928396370; 
 Wed, 27 Jul 2022 06:26:36 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c4ec900b003a3080eacb9sm2662863wmq.24.2022.07.27.06.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 06:26:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 15:26:27 +0200
Message-Id: <20220727132630.1323856-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q9FaU4IK/EgzkWESDjAvRlo6HY++r53S2nzCc0EtjgI=;
 b=Q6wHS3zv5Am741QF66XMMNM2n+ELGAybbdMbDdYJfWc0syqWuOnLKdA1b3ajHyYoQY
 6ZeITwjXgzOJPdtutlYpeCleaRLubob0Lvqo7p8jK6pp1vfX3wzAMEeYT5HZakCg8Iby
 nuQFupZ11Zl6BmmiQ4uDzQkOF7jTJ7X5PfDdKGj4lGrt7ZHEqG2NKplUMZgN+mtO50gm
 jXiBt+RgZHmdvkH21sIHqlqPsPel71UdbTIh53L+qrw2jmRcc8EShMNDbN5Rcacf7F+5
 0shj6MCERpOMwfQbdUKaq2vEIKEi0XseJoeWtbuSqenCp0tqB0FiD0L1gFh1Sbs6kDh5
 jqzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Q6wHS3zv
Subject: [Buildroot] [PATCH 1/4] package/jack2: libsamplerate is optional,
 not mandatoy
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jack2/Config.in | 1 -
 package/jack2/jack2.mk  | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index 8abdda6376..e02449ba87 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_JACK2
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_HWDEP
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 6939aac9a6..4059fa689c 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -9,7 +9,7 @@ JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_LICENSE_FILES = COPYING
 JACK2_CPE_ID_VENDOR = jackaudio
-JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib
+JACK2_DEPENDENCIES = libsndfile alsa-lib
 JACK2_INSTALL_STAGING = YES
 
 JACK2_CONF_OPTS = --alsa
@@ -19,6 +19,13 @@ JACK2_DEPENDENCIES += libexecinfo
 JACK2_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lexecinfo"
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
+JACK2_DEPENDENCIES += libsamplerate
+JACK2_CONF_OPTS += --samplerate=yes
+else
+JACK2_CONF_OPTS += --samplerate=no
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 JACK2_DEPENDENCIES += opus
 JACK2_CONF_OPTS += --opus=yes
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
