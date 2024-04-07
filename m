Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E333CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3044A606EC;
	Sun,  7 Apr 2024 14:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2Vs75BzVnXl; Sun,  7 Apr 2024 14:07:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4260B60902
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4260B60902;
	Sun,  7 Apr 2024 14:07:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A708F1BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93F8960902
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaDq39xevJor for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:07:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5ABC5606EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ABC5606EC
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5ABC5606EC
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 14:07:35 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41551639550so25325875e9.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 07:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712498853; x=1713103653;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V9zrGZGq332GnBuXkD9Gz3WDR31M9OTP31/SS2c9h3w=;
 b=VY/GqplrkdfA4shNlQN8H5SjbtuSV3g+BITAPUYLDgcq0AXTK8SPKGnxFmmLDuEMth
 BY9DRQJiGMgy7+5ye0BMGYRP76cKug5e8DK+CSGwhih527yTa9KGynGEqf1tu5S2R/zE
 LoJLgvq6zFMv1oZ5l1/WayvTEAnabb+Pxjc/sTZ3mrQ3dodyk204DZ73owd2MYoZDRao
 YvVM4Uh/+m0MwLfWdGkw1zBaQKyVvDfVJrtZqcuDslKTrQkGZzDeZPtmM4y/BdDgNF6Z
 SOFxmlUZ+l75tv/ItW46qwD05HpUS69vliiTa8IrtCimSUh6cF/oW0z5ubJ8YU9fJUwF
 EASw==
X-Gm-Message-State: AOJu0YwbnTHxfl4TI4WV+wAjKR28IOEPg9sDUgRxzGd/nJVu80u/BuRE
 iGBIB/stYnrX1G9vIvx+v2Et54IIjwky5aCSgP1sS1kVpzhPucsl9apY1qri
X-Google-Smtp-Source: AGHT+IHpKNJv9lkqukw2z4Jig1is/Ys5TuhaY2aNS0VA7gzzK9x1iJtgT9uknWikBS2NEoze1UdGPA==
X-Received: by 2002:a05:600c:1f0a:b0:416:3762:cea0 with SMTP id
 bd10-20020a05600c1f0a00b004163762cea0mr2950415wmb.13.1712498852968; 
 Sun, 07 Apr 2024 07:07:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b004148d7b889asm13761336wmq.8.2024.04.07.07.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 07:07:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 16:07:24 +0200
Message-ID: <20240407140724.1872790-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712498853; x=1713103653; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V9zrGZGq332GnBuXkD9Gz3WDR31M9OTP31/SS2c9h3w=;
 b=CeevKkSLEdFj9Xv94rit+QWQDYY01kaI5lhAP8pyQaGX7edSgFWcU/8Mn2LF+4K71C
 rCaWu9ivlhO3Q6CBb8obD90jsLyY37dSjXE1VD+GynILPMaJHAy5xNdIvSATUp6TZnOK
 d4G2Pln6xBUqqCD/dqySJBh/7Eac3bDtLiu+q/Jil+Uw3iKHkFeUX1nj2toK7tcubRfb
 oXo4nYUYYO3iSochH5nXW0FLFD90HcTUNEvSMKtLA5ERh2NvyfH4DCGNVqmXihh/eUJu
 VEt2O2qSi/FEVX1I2y8siOGxiU20zp4NHmyfBMaCbGBaohgTTu1VapgbBWmH1950M/RC
 i5IQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CeevKkSL
Subject: [Buildroot] [PATCH 1/1] package/apache: add libxcrypt optional
 dependency
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/buildroot/instance-0/output-1/host/lib/gcc/arc-buildroot-linux-gnu/13.1.1/../../../../arc-buildroot-linux-gnu/bin/ld: /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/lib/libaprutil-1.so: undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/f0f55d9d66b07cb3408086d2632f8cd1bebb670e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apache/Config.in | 1 +
 package/apache/apache.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/apache/Config.in b/package/apache/Config.in
index 270296bce4..bc3133ea00 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_APACHE
 	depends on BR2_USE_MMU # apr
 	select BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_PCRE2
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  The Apache HTTP Server Project is an effort to develop and
 	  maintain an open-source HTTP server for modern operating
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 1b095c5eb1..619d13726e 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -52,6 +52,10 @@ else
 APACHE_CONF_OPTS += --disable-brotli
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+APACHE_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 APACHE_DEPENDENCIES += libxml2
 # Apache wants the path to the header file, where it can find
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
