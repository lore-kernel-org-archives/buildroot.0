Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E91C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E51B8250B;
	Wed, 27 Jul 2022 15:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E51B8250B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dj7EHGPqfaFc; Wed, 27 Jul 2022 15:11:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78FDA824EF;
	Wed, 27 Jul 2022 15:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78FDA824EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 714A11BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C79E60D74
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C79E60D74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t_ZjeVoehYAr for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:10:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ECE960B94
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3ECE960B94
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:10:53 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v17so5858842wrr.10
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 08:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hTkpl9zyNfxJLTREDf/rBsXU2r+EJVJ1gXFvNq9/XAQ=;
 b=Din5cqZEhqgiIRMyFUBKM/LmO0YOfxKB0cieGHJdc7WNDiy/VhHOdxltxNNTCnl6GZ
 tlBhrVKuxoJg+FpDP21A7p5gggbYrM88mCVhJyNeND8RA4rf/aa/AYJRtrNoSraWXJeN
 WacM/Xp+XTsM+qU/f/bMZn0AhmCM883GslFHZx6R7DGJK3PHJFCE2FWngU8KklnM+/gz
 hkyjrUQUPxtqESgOLfknO2tMHfj7jkuM5Qgm6u3NFdENn/2Pfq0gDcqMNZjgey6IYUBj
 Prx8Iy6BGWvmiT3EMlaSrUiJ5lkmrVKOJLA9ciB8kz6NMtUhgQrEC99aG97Qo0+gJljK
 fdEg==
X-Gm-Message-State: AJIora/BRZQpvr8snFlBDfhfGadjBdgarNJnDuHxfjFh4TtmnglESjwt
 20RteUGLpP/f5QLSfUhlpYeJNf7Pi2w=
X-Google-Smtp-Source: AGRyM1sUoth52qYQAHGjFz4bz1Ev43iDcRlmcp5PXKhIwd5yBEEs4guwL1xS6MY7SLcsE3VNDpPGkg==
X-Received: by 2002:a05:6000:1549:b0:21d:c154:486d with SMTP id
 9-20020a056000154900b0021dc154486dmr15294446wry.50.1658934651281; 
 Wed, 27 Jul 2022 08:10:51 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c358e00b003a32297598csm2704022wmq.43.2022.07.27.08.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 08:10:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 17:10:37 +0200
Message-Id: <20220727151037.1362328-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220727151037.1362328-1-fontaine.fabrice@gmail.com>
References: <20220727151037.1362328-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hTkpl9zyNfxJLTREDf/rBsXU2r+EJVJ1gXFvNq9/XAQ=;
 b=eVaobVtoobxaDm1e3IaCEobD2x3cje0DUwStKOrgbgIgBrgrXYo1pVtwJ5W0x2nc8o
 B61XpZQQDENdJUXH1Bze3jNDsvT3UjZV2fgv8kjTzslF1pSL5ebxwe0qltbNhbebIG4T
 24GwbGHnrXuEH8t2w8Lx4D0NdMomhm2B20ViVW/dvTM1rN15yllrwN0SIb33BGtR8e3S
 OTW4UlCukGfQ4eqab1OC8+Oiqaj7z0PwJ1ITxIbEW3LqhPaqp+UUCds/Gm+egYKe7QFF
 xPe5Wr0tiIxES6S7dSZK2/VUfWGdLTXrWV2KEMGucAeyqOIaOdwMDimtlEZ2AklQtFlI
 rVHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eVaobVto
Subject: [Buildroot] [PATCH v2,2/2] package/domoticz: selects minizip-zlib
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Selects minizip-zlib and so drop git submodules

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/Config.in     | 1 +
 package/domoticz/domoticz.hash | 2 +-
 package/domoticz/domoticz.mk   | 8 ++++----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 4324d13cee..85361eecf0 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_DOMOTICZ
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_MINIZIP_ZLIB
 	select BR2_PACKAGE_MOSQUITTO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_SQLITE
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index 18bf57b7e0..9de241015c 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b7faf959c4f1dbfec3b0c17ab495f29b3d1437bc2251579c5252be82247e7ff9  domoticz-2022.1-br1.tar.gz
+sha256  8282cb71c924b6ef92503976d50f966f2c785eab8f8cffa1136ac133f0241157  domoticz-2022.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 5edc10e8d8..f21c52d432 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -5,9 +5,7 @@
 ################################################################################
 
 DOMOTICZ_VERSION = 2022.1
-DOMOTICZ_SITE = https://github.com/domoticz/domoticz
-DOMOTICZ_SITE_METHOD = git
-DOMOTICZ_GIT_SUBMODULES = YES
+DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
 DOMOTICZ_CPE_ID_VENDOR = domoticz
@@ -19,6 +17,7 @@ DOMOTICZ_DEPENDENCIES = \
 	jsoncpp \
 	libcurl \
 	lua \
+	minizip \
 	mosquitto \
 	openssl \
 	sqlite \
@@ -34,10 +33,11 @@ DOMOTICZ_CONF_OPTS += \
 	-DUSE_OPENSSL_STATIC=OFF
 
 # Do not use any built-in libraries which are enabled by default for
-# jsoncpp, fmt, sqlite and mqtt
+# jsoncpp, fmt, minizip, sqlite and mqtt
 DOMOTICZ_CONF_OPTS += \
 	-DUSE_BUILTIN_JSONCPP=OFF \
 	-DUSE_BUILTIN_LIBFMT=OFF \
+	-DUSE_BUILTIN_MINIZIP=OFF \
 	-DUSE_BUILTIN_SQLITE=OFF \
 	-DUSE_BUILTIN_MQTT=OFF
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
