Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264D7C433FE
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 22:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 845B1403B4;
	Sat, 22 Oct 2022 22:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 845B1403B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RgQFR7JpE1Ty; Sat, 22 Oct 2022 22:08:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6479340322;
	Sat, 22 Oct 2022 22:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6479340322
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4BD11BF328
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 22:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75DDD81CEF
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 22:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75DDD81CEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEvVSPbJqivL for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 22:08:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4118B80BBE
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4118B80BBE
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 22:08:16 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a14so7239456wru.5
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 15:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CZjxK34mM8vM5GmlK6bX+y3VjNXt+7rkxCtoxRC9AsY=;
 b=dcmBaeegyyYtv0rzgUsN1/3cnyug6kWYJLCbsP6kIw6U598Iac24EWgbODAvYM8GZK
 ppfMYRCIf/4JfQ4VsDIwaMSiZckE6pq5i49gbyyveFq4U629OimO5weDzJmha9okw6Pl
 BOW0sxZkelhLm3ZHWxTCqt3Y+ikcFEup8YNxGFv2f2nYR5pdm1980OwvGJqukMRQUxhF
 xKXrScpWrJz5qXp2KUAavY/XfOdosNA2sBmfWQSRKU8HJlMaQ4lJiXySbrNSFL0RCykI
 pX3COSuoy2Yx/U0s603LJADXPm+cKnSiFnnU9UPf5tnasr6VsnNqnMmMSgqxh4Ru3kul
 u3Xw==
X-Gm-Message-State: ACrzQf23F5abWngzbIJH9KVPkFA2HyFtBSnh7z3RnymzWTJjq7YzHJrr
 N8BQN/Tv4zCAK8FRZJFG66Yd2HfqOw4=
X-Google-Smtp-Source: AMsMyM687CvaPQcTfTPuYKLZQoZY7nX6OEhbuntJrGoMccw6rhQ0c4ptUDUGKSZ0vDDAFg2HdpugUg==
X-Received: by 2002:adf:e944:0:b0:236:5fe3:c482 with SMTP id
 m4-20020adfe944000000b002365fe3c482mr2514449wrn.441.1666476493678; 
 Sat, 22 Oct 2022 15:08:13 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c0a0300b003a682354f63sm4100899wmp.11.2022.10.22.15.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 15:08:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 00:08:07 +0200
Message-Id: <20221022220808.191363-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CZjxK34mM8vM5GmlK6bX+y3VjNXt+7rkxCtoxRC9AsY=;
 b=i5/UNNzA6AlEcqUJPf3ubVlPFCvf+036fkXmPCpcHJNGrLKFQBRaTgGcjJbWdnXNNt
 f/VXZB3+fo6DC/E1IBHO5g5lKPu6i6TBrPoGM7YOxE3QF2ghuc/JCZ5oVGPZn7LoC0rL
 BPBp3XISFlXtsRk120VDk+R0fe+irujApIBgVDfKXoWBm++jZj7EuKpf7IJvVBcppSpP
 lAOSTqa4QWzUc3ohg6y0C85O8+d5A9cozv6QTGKnaGVIb9r4Om3gLrukAxKGtUyRpAVE
 22BmBWskCKfR+M9RFTcfH55LuSsmAA2ydjvvDCQ5WQ4RPdVTcf9LEewNStBKt4aFbX9D
 Us2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=i5/UNNzA
Subject: [Buildroot] [PATCH 1/2] package/lv2: bump to version 1.18.10
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update hash of COPYING (standard ISC text used since
  https://github.com/lv2/lv2/commit/0030682770cdab7069c8c96e2fdf0e99f9b42b65)
- meson must be used since
  https://github.com/lv2/lv2/commit/d4a970f6962dda28133290194832b726b566ddab

https://github.com/lv2/lv2/blob/v1.18.10/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lv2/lv2.hash |  6 +++---
 package/lv2/lv2.mk   | 13 ++++++-------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/lv2/lv2.hash b/package/lv2/lv2.hash
index ed21620bee..0814958887 100644
--- a/package/lv2/lv2.hash
+++ b/package/lv2/lv2.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-# https://lv2plug.in/spec/lv2-1.18.2.tar.bz2.asc
-sha256  4e891fbc744c05855beb5dfa82e822b14917dd66e98f82b8230dbd1c7ab2e05e  lv2-1.18.2.tar.bz2
-sha256  0b0b07d852e3ce7fa04986e141f73001bd7f260683968f0a19e02dbcc4131aa6  COPYING
+# https://lv2plug.in/spec/lv2-1.18.10.tar.xz.sig
+sha256  78c51bcf21b54e58bb6329accbb4dae03b2ed79b520f9a01e734bd9de530953f  lv2-1.18.10.tar.xz
+sha256  1e6bb175e193608b767ff25a4ed68b82c4db599491cf0d2694435cf60e9a4841  COPYING
diff --git a/package/lv2/lv2.mk b/package/lv2/lv2.mk
index 13ffaa34b0..2dde9b907c 100644
--- a/package/lv2/lv2.mk
+++ b/package/lv2/lv2.mk
@@ -4,18 +4,17 @@
 #
 ################################################################################
 
-LV2_VERSION = 1.18.2
+LV2_VERSION = 1.18.10
 LV2_SITE = https://lv2plug.in/spec
-LV2_SOURCE = lv2-$(LV2_VERSION).tar.bz2
+LV2_SOURCE = lv2-$(LV2_VERSION).tar.xz
 LV2_LICENSE = ISC
 LV2_LICENSE_FILES = COPYING
 LV2_DEPENDENCIES = host-pkgconf
 LV2_INSTALL_STAGING = YES
 
 LV2_CONF_OPTS += \
-	--no-coverage \
-	--no-check-links \
-	--copy-headers
+	-Ddocs=disabled \
+	-Dtests=disabled
 
 ifeq ($(BR2_PACKAGE_CAIRO),y)
 LV2_DEPENDENCIES += cairo
@@ -30,7 +29,7 @@ LV2_DEPENDENCIES += libgtk2
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-LV2_CONF_OPTS += --no-plugins
+LV2_CONF_OPTS += -Dplugins=disabled
 endif
 
-$(eval $(waf-package))
+$(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
