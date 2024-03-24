Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FA9C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 21:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C767817A1;
	Sun, 24 Mar 2024 21:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BKOrVlb7HGxO; Sun, 24 Mar 2024 21:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8536F81AD7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8536F81AD7;
	Sun, 24 Mar 2024 21:17:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50D911BF4E5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D62F403C7
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdeyrOtoHcj7 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 21:17:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 180DD403A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 180DD403A5
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 180DD403A5
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 21:17:08 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33ec7e38b84so2677040f8f.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711315026; x=1711919826;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tSKisFUrOTplysmTOdpX3HbTvlstdIkSunGIrouvSi0=;
 b=i9kyN6csf0OzZBDPW1jYV5bjcoWtJCM8TVZSRRYN4KGgLfqTBNznnhv6a5RUTLyJCB
 t7+SVKAWPIXEOWPtcOzwdWU8b94jKKccmSfAUm9FFfkgnXo8sg/HHCPNd+Hn1mvz56gC
 RT/xLv3kodQiYNoDJM0L7GQPmQcv25zuBG1buUcAwdg6C5yUChRS9QwuwId2gqNJ+7Ua
 YDanSs1DugLdXPWe9GlXk618ao9/3i9yz++9Ur3egW8S2XEw6bvhDcVt1srfgZICjxWw
 XikmbUEOhdYtstb6PK8eWlDi5XRs1Vib7ETKp1EN6SmbVmb290a1JDY3IzNnVgauro1S
 kkGw==
X-Gm-Message-State: AOJu0YyUEIgt3R7JGce1db0UzwmT5r5t66e1a+sa/OesY9b47lF0+gbC
 zCBJisfB4SWapAIM7FeiG0k7cxrswpmYIvGU6g4ukDwnbKnihSMg00mgtg3s
X-Google-Smtp-Source: AGHT+IGYa1XIkP8+ENzux4D1Y2+hAchK0fpfCd1sxPtbKjgOy7WqfSj9EfcwvdEeJ92ARsiz3xxPYg==
X-Received: by 2002:a5d:5f93:0:b0:341:c58e:fb5b with SMTP id
 dr19-20020a5d5f93000000b00341c58efb5bmr2839834wrb.26.1711315026081; 
 Sun, 24 Mar 2024 14:17:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 cl1-20020a5d5f01000000b0033e72e104c5sm6605767wrb.34.2024.03.24.14.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 14:17:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 22:17:00 +0100
Message-ID: <20240324211700.729359-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711315026; x=1711919826; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tSKisFUrOTplysmTOdpX3HbTvlstdIkSunGIrouvSi0=;
 b=QQLvaSEvxOCIZNX/qqzy8IjjLuSaHzk0thVb8p7ZjJgb0R5lnn8mwBL6gqeXz5Yhyk
 +tEdQTKBgKcfWbyGgU+WLJL5kC9/l1T9JtGcMLtS00IAN9ZhJwQ8sSwIYkK11VuXayNL
 NrRSOh8tzUCDsfqe//tYI+dASRRnHJw9PrUNIBpbPobL0t1fQpmxF5/StiyW0fpRtuZS
 DitBnag7qwAOIfAoLCS6VGUqIE+es5D2sjAPBKDvIqqkYkU9H5ypFCC5Em+wEc78oKl+
 IVobhwuiIU+KEsDDO1mv5KffX2rWTI/qXIyi1jTNGRjwM1KM5XHMgSPBPunPEbRSnbyH
 joKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QQLvaSEv
Subject: [Buildroot] [PATCH 1/1] package/domoticz: bump to version 2024.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

openzwave dependency is back since
https://github.com/domoticz/domoticz/commit/b0eadaa2ec6d6340df7eeba0e6e373b71ba393fc

https://github.com/domoticz/domoticz/blob/2024.4/History.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/domoticz.hash |  2 +-
 package/domoticz/domoticz.mk   | 12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index 546177332e..ae86a67b79 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9effa792f856d8d9036c53b9ae500ee3bffa1488addf9d6f1fe4bf960f73f740  domoticz-2024.1.tar.gz
+sha256  d87113d7cacd0b52b9126fcc1ef24e140a4f7042d5bc6262e86e4b4752f5cf38  domoticz-2024.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 88bad15427..95d3335adb 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 2024.1
+DOMOTICZ_VERSION = 2024.4
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
@@ -51,6 +51,16 @@ else
 DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENZWAVE),y)
+DOMOTICZ_DEPENDENCIES += openzwave
+
+# Due to the dependency on mosquitto, domoticz depends on
+# !BR2_STATIC_LIBS so set USE_STATIC_OPENZWAVE to OFF otherwise
+# domoticz will not find the openzwave library as it searches by
+# default a static library.
+DOMOTICZ_CONF_OPTS += -DUSE_STATIC_OPENZWAVE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 DOMOTICZ_DEPENDENCIES += python3
 DOMOTICZ_CONF_OPTS += -DUSE_PYTHON=ON
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
