Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B82CC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 383D860B50;
	Wed, 27 Jul 2022 09:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 383D860B50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTW4FFUN1Dne; Wed, 27 Jul 2022 09:44:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D15360B64;
	Wed, 27 Jul 2022 09:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D15360B64
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E66911BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE4B960B51
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE4B960B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mo4asXnkXmyt for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:43:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76E6960B50
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76E6960B50
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:43:58 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d8so23305303wrp.6
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 02:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n3m92OXKZG2oBjuHem+tOgRHBolmhiTwRkxdsh8O4Ew=;
 b=jVJy/XTrJ3A9YcLtb0zSBOWoBP5+SiMElmfpTt89nh4uG3RuwXhq6CDeoosNIdhKm1
 E0iHHjW8Ax1yjVjDMhf/EJA0aHmYETiKAI4W3TSKzoXkyhNwWWzh8BWC95kVjO+TALPN
 116nGg6WuK1SIgJQObRzFwa0TXJld2WVfA26bL3Hz5K/QVB6en+QSfCGZpBehmySIhdp
 whJKB4RgP2ZlJPyzmqda6yUaAZmwVgtgaWMomrOWBRdVnDXZIhKfB6DKV6yrjoJ5U1uS
 uI0Diy8mh+0N9GvldGPjNsc6/9+wLV83lnqbaJCEddUbG+rCgxO5emaRgqDZ2w/8cM7G
 laYQ==
X-Gm-Message-State: AJIora9JySmxhE3OzOLYMN4i/Y+nhKHvEd2cBMAGh+qrEdpdmdbG7ztw
 LdnPfJFJnJReminTE8TFTdJasnZUM7A=
X-Google-Smtp-Source: AGRyM1tdoZRdAqeqL7+iWJKnNGIssp0Skxe/ce1jPy+1d2eGRb29Te8WAQGYzyWEKr/RBSwVDetusg==
X-Received: by 2002:a5d:6d84:0:b0:21e:824d:59bf with SMTP id
 l4-20020a5d6d84000000b0021e824d59bfmr11026989wrs.291.1658915036090; 
 Wed, 27 Jul 2022 02:43:56 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a05600c0a4e00b003a37b7e0780sm1419525wmq.8.2022.07.27.02.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 02:43:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:43:50 +0200
Message-Id: <20220727094352.1051200-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n3m92OXKZG2oBjuHem+tOgRHBolmhiTwRkxdsh8O4Ew=;
 b=jnEcCD96lyfiJmg644BRhRWbqc18y8/6wziH9SU7+4tnPxV9GRoSBWbKlneRyGtpxq
 260ZxVlPqnO308cNMT/MkniLW7xilnYQR5rheaNSboEJVRtg5Jb5ux3ZUcPTNYaA3Qed
 dWLLQ7Pf+rz80s1pcZy9FO6SJtD9WGhWhJ1mLUyauhtQhLzORZaaUTLXmVSaAwnkZZ8P
 GaLsWmoCE8C69Uhv/Ut4bV9N9G8WaSMEiWPEIUQ9Zixgm4Gfcfk2i4IVZzjgLHVgZow6
 Icm++AczLDz+lyVxPYD8V/fGQlSFvi+m9LiwhvxPF48L7se4bo81OsKd5TQvrIHOqfHd
 C3wg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jnEcCD96
Subject: [Buildroot] [PATCH 1/3] package/sconeserver: reorder options
 alphabetically
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
Cc: Simon Dawson <spdawson@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sconeserver/Config.in      | 42 +++++++++++++++---------------
 package/sconeserver/sconeserver.mk | 42 +++++++++++++++---------------
 2 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index d46ba85fbc..4ade8b4590 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -15,24 +15,6 @@ if BR2_PACKAGE_SCONESERVER
 
 comment "Sconeserver modules"
 
-config BR2_PACKAGE_SCONESERVER_EXAMPLES
-	bool "examples"
-	help
-	  Example modules for Sconeserver
-
-config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
-	bool "http::sconesite"
-	select BR2_PACKAGE_LIBXML2
-	help
-	  http::sconesite module for Sconeserver
-
-config BR2_PACKAGE_SCONESERVER_MYSQL
-	bool "mysql"
-	depends on BR2_USE_MMU # mysql
-	select BR2_PACKAGE_MYSQL
-	help
-	  MySQL module for Sconeserver
-
 config BR2_PACKAGE_SCONESERVER_BLUETOOTH
 	bool "bluetooth"
 	depends on BR2_USE_WCHAR # bluez5_utils -> libglib2
@@ -51,11 +33,16 @@ comment "bluetooth support needs a toolchain w/ wchar, threads, dynamic library,
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 
-config BR2_PACKAGE_SCONESERVER_RSS
-	bool "rss"
+config BR2_PACKAGE_SCONESERVER_EXAMPLES
+	bool "examples"
+	help
+	  Example modules for Sconeserver
+
+config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
+	bool "http::sconesite"
 	select BR2_PACKAGE_LIBXML2
 	help
-	  RSS module for Sconeserver
+	  http::sconesite module for Sconeserver
 
 config BR2_PACKAGE_SCONESERVER_LOCATION
 	bool "location"
@@ -76,6 +63,19 @@ config BR2_PACKAGE_SCONESERVER_MATHS
 	help
 	  Mathematics module for Sconeserver
 
+config BR2_PACKAGE_SCONESERVER_MYSQL
+	bool "mysql"
+	depends on BR2_USE_MMU # mysql
+	select BR2_PACKAGE_MYSQL
+	help
+	  MySQL module for Sconeserver
+
+config BR2_PACKAGE_SCONESERVER_RSS
+	bool "rss"
+	select BR2_PACKAGE_LIBXML2
+	help
+	  RSS module for Sconeserver
+
 config BR2_PACKAGE_SCONESERVER_TESTBUILDER
 	bool "testbuilder"
 	help
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 2b28f8015c..bad050210e 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -40,6 +40,13 @@ else
 SCONESERVER_CONF_OPTS += --without-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_SCONESERVER_BLUETOOTH),y)
+SCONESERVER_DEPENDENCIES += bluez5_utils
+SCONESERVER_CONF_OPTS += --with-bluetooth
+else
+SCONESERVER_CONF_OPTS += --without-bluetooth
+endif
+
 ifeq ($(BR2_PACKAGE_SCONESERVER_EXAMPLES),y)
 SCONESERVER_CONF_OPTS += --with-examples
 else
@@ -53,6 +60,20 @@ else
 SCONESERVER_CONF_OPTS += --without-sconesite
 endif
 
+ifeq ($(BR2_PACKAGE_SCONESERVER_LOCATION),y)
+SCONESERVER_DEPENDENCIES += gpsd
+SCONESERVER_CONF_OPTS += --with-location
+else
+SCONESERVER_CONF_OPTS += --without-location
+endif
+
+ifeq ($(BR2_PACKAGE_SCONESERVER_MATHS),y)
+SCONESERVER_DEPENDENCIES += mpfr
+SCONESERVER_CONF_OPTS += --with-maths
+else
+SCONESERVER_CONF_OPTS += --without-maths
+endif
+
 ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
 SCONESERVER_DEPENDENCIES += mysql
 SCONESERVER_CONF_OPTS += \
@@ -63,13 +84,6 @@ else
 SCONESERVER_CONF_OPTS += --without-mysql
 endif
 
-ifeq ($(BR2_PACKAGE_SCONESERVER_BLUETOOTH),y)
-SCONESERVER_DEPENDENCIES += bluez5_utils
-SCONESERVER_CONF_OPTS += --with-bluetooth
-else
-SCONESERVER_CONF_OPTS += --without-bluetooth
-endif
-
 ifeq ($(BR2_PACKAGE_SCONESERVER_RSS),y)
 SCONESERVER_DEPENDENCIES += libxml2
 SCONESERVER_CONF_OPTS += --with-rss
@@ -77,20 +91,6 @@ else
 SCONESERVER_CONF_OPTS += --without-rss
 endif
 
-ifeq ($(BR2_PACKAGE_SCONESERVER_LOCATION),y)
-SCONESERVER_DEPENDENCIES += gpsd
-SCONESERVER_CONF_OPTS += --with-location
-else
-SCONESERVER_CONF_OPTS += --without-location
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_MATHS),y)
-SCONESERVER_DEPENDENCIES += mpfr
-SCONESERVER_CONF_OPTS += --with-maths
-else
-SCONESERVER_CONF_OPTS += --without-maths
-endif
-
 ifeq ($(BR2_PACKAGE_SCONESERVER_TESTBUILDER),y)
 SCONESERVER_CONF_OPTS += --with-testbuilder
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
