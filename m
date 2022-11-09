Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFA3C433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 08:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D65D340AF5;
	Wed,  9 Nov 2022 08:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D65D340AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-gM748jL_V3; Wed,  9 Nov 2022 08:35:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11F3F40AE2;
	Wed,  9 Nov 2022 08:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11F3F40AE2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 902591BF301
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 08:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BA0180FFE
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 08:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BA0180FFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4zn7AfmgjCgz for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 08:34:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7763580FB7
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7763580FB7
 for <buildroot@busybox.net>; Wed,  9 Nov 2022 08:34:57 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l14so24650754wrw.2
 for <buildroot@busybox.net>; Wed, 09 Nov 2022 00:34:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KUNFv8nfN6SGLTNk9Xb1Yjl4HFDy0TkYAMx/B3RV2pQ=;
 b=ToQaHxCi7yALujTFFiZ8qTpFiJ+u7iWSD6vJk+4rz8uDZVIstuqCJLCFfjAoZpS9Bp
 SR6m9IHeixhUz24IW2BiYRgiC9BA30evQ0JW6jIy5GySC59UHNYEQ9rnM6HUSfEULNuw
 2DxZS3AviCHsksXyGmV/VpFiX3v+AGBInBsNpx47JNCtv84xXaHDnENTytjGMBzXCKeA
 O8vfOy2u22Fqq6qeMaP52mFjTlwj06rGd/JWLQbvi4MImGraq8uHP+FXFMqejwNQOF0T
 DHCUrZFjdfN83Fh+JRZtkaIearEiOsW7awGgFyCswKFzLkWbjPA2FhZC76jIsrm9ERfm
 49Fg==
X-Gm-Message-State: ACrzQf2i9cneBvfX8XpGJqhUYrSaiEa+b9mUg91/7VfxSysad6cPbu7E
 s99Ix3FRVLK9RNqvsAUcWEhlVNMvxNQ=
X-Google-Smtp-Source: AMsMyM6okF+pj1H0E6MUb+eAQwIZ/QMsuQ7Yq0Hx5fI0dOKiHzbACGEL6SH2oi+D2rlgNodSXix3/A==
X-Received: by 2002:a5d:694e:0:b0:236:65a0:e7ed with SMTP id
 r14-20020a5d694e000000b0023665a0e7edmr37530865wrw.233.1667982895447; 
 Wed, 09 Nov 2022 00:34:55 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a5d6346000000b0022e66749437sm12198253wrw.93.2022.11.09.00.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 00:34:54 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  9 Nov 2022 09:34:40 +0100
Message-Id: <20221109083440.1254693-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KUNFv8nfN6SGLTNk9Xb1Yjl4HFDy0TkYAMx/B3RV2pQ=;
 b=F5CgfMQKhn/QuT08SBqD1I/6azPBCkYlMId3ZLFesrmDhkOOAERCiADX79m5+q+Jpu
 xIB//Uk7+LcQnBIGohmlPLkl/ANWSAwSMvKvDkyaLZI8hWEZRcPZJbj+q3uSSfYcVcr8
 U7AIpYGvNzqz6upzJ3bJXXCtBFz8EQcTO7teGUmsEzOc8fsQtDcrfFUHHvcd91IXTPE7
 V+qoIJzi3QEgqjkyzK1BNsT+ByIM/7c+wVNfwz1xxUDGyywWzHxa/pVFzbjodp8hR+uJ
 2fx9xYWDoyqnK6TPloRTI1xU6IifYVzuB73p89eBky/ZOmKRqVz5M243Ds46JNDW7iRw
 GXTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=F5CgfMQK
Subject: [Buildroot] [PATCH] package/lua-mqtt: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in              |  1 +
 package/lua-mqtt/Config.in     | 11 +++++++++++
 package/lua-mqtt/lua-mqtt.hash |  3 +++
 package/lua-mqtt/lua-mqtt.mk   | 11 +++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/lua-mqtt/Config.in
 create mode 100644 package/lua-mqtt/lua-mqtt.hash
 create mode 100644 package/lua-mqtt/lua-mqtt.mk

diff --git a/package/Config.in b/package/Config.in
index 78d4d924d..1894fc0b3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -722,6 +722,7 @@ menu "Lua libraries/modules"
 	source "package/lua-lyaml/Config.in"
 	source "package/lua-markdown/Config.in"
 	source "package/lua-messagepack/Config.in"
+	source "package/lua-mqtt/Config.in"
 	source "package/lua-msgpack-native/Config.in"
 	source "package/lua-periphery/Config.in"
 	source "package/lua-resty-http/Config.in"
diff --git a/package/lua-mqtt/Config.in b/package/lua-mqtt/Config.in
new file mode 100644
index 000000000..b71331905
--- /dev/null
+++ b/package/lua-mqtt/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LUA_MQTT
+	bool "lua-mqtt"
+	depends on BR2_PACKAGE_LUA_5_3 || BR2_PACKAGE_LUA_5_4
+	help
+	  client library for MQTT 3.1.1 & 5.
+
+	  https://fperrad.frama.io/lua-mqtt
+
+comment "lua-mqtt needs a Lua >= 5.3"
+	depends on !BR2_PACKAGE_LUA_5_3
+	depends on !BR2_PACKAGE_LUA_5_4
diff --git a/package/lua-mqtt/lua-mqtt.hash b/package/lua-mqtt/lua-mqtt.hash
new file mode 100644
index 000000000..3636e9e6a
--- /dev/null
+++ b/package/lua-mqtt/lua-mqtt.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  986ec63dd9f0761f9c5231f6e19529138602c289e13da5c71dc1449f5f247152  lua-mqtt-0.1.0-1.src.rock
+sha256  e86d7c8adfabcb7c6515cc6e524bf0a76f7b3a86560a7ac47d7cabae5f8391a2  lua-mqtt-0.1.0/COPYRIGHT
diff --git a/package/lua-mqtt/lua-mqtt.mk b/package/lua-mqtt/lua-mqtt.mk
new file mode 100644
index 000000000..a2f17d2b2
--- /dev/null
+++ b/package/lua-mqtt/lua-mqtt.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# lua-mqtt
+#
+################################################################################
+
+LUA_MQTT_VERSION = 0.1.0-1
+LUA_MQTT_LICENSE = MIT
+LUA_MQTT_LICENSE_FILES = $(LUA_MQTT_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
