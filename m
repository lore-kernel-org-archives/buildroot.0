Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E340C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C89D182443;
	Wed, 27 Jul 2022 13:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C89D182443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Famdg-x3z-yr; Wed, 27 Jul 2022 13:26:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06B0682416;
	Wed, 27 Jul 2022 13:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B0682416
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 884801BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64A4C82416
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64A4C82416
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rHZhnrI66Qib for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:26:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84F398198D
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84F398198D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:26:40 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h8so24146762wrw.1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GzGZO99/Of8vxYUMjYCvZbsaWC0pxOu9G96RQaDQaMU=;
 b=6PGpS91nKu450zbQbAawhnUqNV5XrKEzpmBwRedbBwSbgBjyZWy0r3i70jByb0tmpg
 RJ3LlgIDZwFQLx4mHIbSEMhR8MfsmpFHukHCG1yuwVK4oLmnFOwhHMoLjQrLgSAKH2bS
 xMu6bvFQ399yNS83MHp3CkwRSZrrgGY3O/J+H8d5coq7PUiup19P1aqIsAltLZs34xMx
 /bHfxsarXJoqA54pDcDrMtd1DN7C6pZMrDor8K+ea2gPOp+fOZskG0yHbvOMGPuhOXC4
 eC0TX3ltnrzeVMWLNH1CR9gD/OKcMvI3GV8uODxQDp+AwGZ9yreHIl0ifLzt/QC/9fuP
 rlBQ==
X-Gm-Message-State: AJIora8qweL2ft9b3XpO/blBT10QmryR0EkCBLXVnN9l17BH7tIcz+mn
 jv8WJBmX3WRCPq8zHJq0par/xfIWwJE=
X-Google-Smtp-Source: AGRyM1umnAI43/msGpsQC6b13uXZlNZuO4Ukr/K95HNJnFMIHfgra63w4qwNHJmuMWn5DV2coTKQLw==
X-Received: by 2002:adf:db8e:0:b0:21e:3fff:6bae with SMTP id
 u14-20020adfdb8e000000b0021e3fff6baemr13704983wri.184.1658928398403; 
 Wed, 27 Jul 2022 06:26:38 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c4ec900b003a3080eacb9sm2662863wmq.24.2022.07.27.06.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 06:26:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 15:26:28 +0200
Message-Id: <20220727132630.1323856-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220727132630.1323856-1-fontaine.fabrice@gmail.com>
References: <20220727132630.1323856-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GzGZO99/Of8vxYUMjYCvZbsaWC0pxOu9G96RQaDQaMU=;
 b=oh8p7IfFRN4bkoIQ96qlenUTDhkGe57S3G2VqKNgHSYoSfdDZHVgdYiBhasNu8wMXN
 qOZ3SJ6kznGMB9kI4MPyEQqDSfTTK7XYMrwQs2nllhh858/BnQx6YGg2x5VSeGpwhpsq
 SUk1qFP5jFx2nN3wKaBXKe7d8cVzcfsjCojkAw6I0obDw5qKiCp83yldl6bK049Lk++T
 A1QyKAo1txSyntBC+FewnVv+Y5I80DPAaBGZFkj4aXK3a+laVywY3QGxgaBWFE49E2cK
 60yYA0pZVJnqvJnKewRKr/UAg6/zliSyfBZ/BEWsCFIC3rjfRZTFP9KVwWogBK2y+4Ue
 e4GQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oh8p7IfF
Subject: [Buildroot] [PATCH 2/4] package/jack2: libsndfile is optional,
 not mandatory
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
index e02449ba87..f5ac0399eb 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_JACK2
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_HWDEP
 	select BR2_PACKAGE_ALSA_LIB_SEQ
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 4059fa689c..3b45474cc4 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -9,7 +9,7 @@ JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_LICENSE_FILES = COPYING
 JACK2_CPE_ID_VENDOR = jackaudio
-JACK2_DEPENDENCIES = libsndfile alsa-lib
+JACK2_DEPENDENCIES = alsa-lib
 JACK2_INSTALL_STAGING = YES
 
 JACK2_CONF_OPTS = --alsa
@@ -26,6 +26,13 @@ else
 JACK2_CONF_OPTS += --samplerate=no
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+JACK2_DEPENDENCIES += libsndfile
+JACK2_CONF_OPTS += --sndfile=yes
+else
+JACK2_CONF_OPTS += --sndfile=no
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
