Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83EEC7618E
	for <buildroot@archiver.kernel.org>; Wed, 26 Apr 2023 16:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 630676155B;
	Wed, 26 Apr 2023 16:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 630676155B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2NRCmxLGrmP; Wed, 26 Apr 2023 16:14:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 873A361557;
	Wed, 26 Apr 2023 16:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 873A361557
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 83F771BF30D
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 16:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C00740180
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 16:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C00740180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xAmr65gqpZym for <buildroot@lists.busybox.net>;
 Wed, 26 Apr 2023 16:14:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6494400F2
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6494400F2
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 16:14:23 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f19ab99540so49817445e9.2
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 09:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682525661; x=1685117661;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c703MHL+xSb8/uuZDEzk8/4E0FGGLUYbRi4dAn69nFY=;
 b=eC9OV+FOO/skg+G0z3aggkUX3UkekFp3D/t+eQZ+z9XabnEq9zriCOr/GL9TQPvZPA
 5m768Yat1utjz0zkSMuZzIu1oGcj5OIzmtS+1fuzurlc7cCWYglOnffCQtqHvB+o9tnW
 U0ze2UpUrLCvMjEMB4u/SmjxpqiDUyntk7VXizGY1YC9c4vXjmEthmq28F2F3wD9pZoc
 VFWM9/bylV9b5j4Sj9XA5NideGoVFmxVOceNpxQThYYi7TEQ9Qexfiu0bXZJJh2iz+0I
 TWxDzKQWuoTwfJoTIv+QPZ1iAKAL8lCHsDYpAWtgvy5X2CaeCPB5XumdIA5Yapm+beCm
 s48g==
X-Gm-Message-State: AAQBX9cdsyQRa1dbq9mohm/Aa7n2zYJJO2v9DW+kYmN77uije74RSey4
 +URGmLKYT3N3jd+GLqdPWID7xyuBVn0=
X-Google-Smtp-Source: AKy350amr23lT9wXtSA5IMh5ngteM5KJbZKYz5dBqtqVdvxewp6tnNLxQqDl4UzrE+5j5PojoYaSWA==
X-Received: by 2002:a7b:c3d5:0:b0:3ee:b3bf:5f7c with SMTP id
 t21-20020a7bc3d5000000b003eeb3bf5f7cmr13016434wmj.23.1682525660716; 
 Wed, 26 Apr 2023 09:14:20 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1cf202000000b003f190dfc404sm15538307wmc.18.2023.04.26.09.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 09:14:20 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Apr 2023 19:14:02 +0300
Message-Id: <20230426161402.3251010-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682525661; x=1685117661;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c703MHL+xSb8/uuZDEzk8/4E0FGGLUYbRi4dAn69nFY=;
 b=MoV4BXdJBJnPYN0BDvxD5jM3xMNhIT6AkqNCLKRoNcVdiif/VfvVtZ92oLcJ5ccGM2
 wCeZK8cCxY9yNUJJzaPHaSpAIRc6GcreBQlK90EmCDZMdH323//5w6rSrkQJ+0N9teuT
 LNYud4jCc/ITkpbkHJHNStXOZ23EO8Nig4RQQ1dywvWJsqyqensjUM821ZXQCRc0dLsO
 H4Kv4MEEctDxYjd24P+uV92A/41mK30uN7Mzy5Dw7FJVNOWvldulo4OITtTRqrsWe7+3
 4NJPcLtaZPJxTErLqhJ0vQ72oGQvAeJYccC3q0OCYJ+vX2AbZ5NErZoesrqLELr0xXiq
 mzcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=MoV4BXdJ
Subject: [Buildroot] [PATCH] package/libdatachannel: new package
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
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new package for libdatachannel.

libdatachannel is an open-source software library implementing WebRTC Data
Channels, WebRTC Media Transport, and WebSockets. It is written in C++17
and offers C bindings.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 package/Config.in                          |  1 +
 package/libdatachannel/Config.in           |  7 +++++
 package/libdatachannel/libdatachannel.hash |  3 ++
 package/libdatachannel/libdatachannel.mk   | 32 ++++++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 package/libdatachannel/Config.in
 create mode 100644 package/libdatachannel/libdatachannel.hash
 create mode 100644 package/libdatachannel/libdatachannel.mk

diff --git a/package/Config.in b/package/Config.in
index eaac32a01a..c323409e37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1408,6 +1408,7 @@ menu "Audio/Sound"
 	source "package/libcodec2/Config.in"
 	source "package/libcue/Config.in"
 	source "package/libcuefile/Config.in"
+	source "package/libdatachannel/Config.in"
 	source "package/libebur128/Config.in"
 	source "package/libg7221/Config.in"
 	source "package/libgsm/Config.in"
diff --git a/package/libdatachannel/Config.in b/package/libdatachannel/Config.in
new file mode 100644
index 0000000000..84ade9a879
--- /dev/null
+++ b/package/libdatachannel/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBDATACHANNEL
+	bool "libdatachannel"
+	help
+	  C/C++ WebRTC network library featuring Data Channels,
+	  Media Transport, and WebSockets.
+
+	  https://github.com/paullouisageneau/libdatachannel
diff --git a/package/libdatachannel/libdatachannel.hash b/package/libdatachannel/libdatachannel.hash
new file mode 100644
index 0000000000..fd1112acf7
--- /dev/null
+++ b/package/libdatachannel/libdatachannel.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  cecd359c6c261676bde42ab8b912c851d13d73759b16eb03496903833fdf4306  libdatachannel-v0.18.3-br1.tar.gz
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/libdatachannel/libdatachannel.mk b/package/libdatachannel/libdatachannel.mk
new file mode 100644
index 0000000000..d86eed9bef
--- /dev/null
+++ b/package/libdatachannel/libdatachannel.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# libdatachannel
+#
+################################################################################
+
+LIBDATACHANNEL_VERSION = v0.18.3
+LIBDATACHANNEL_SITE_METHOD = git
+LIBDATACHANNEL_SITE = https://github.com/paullouisageneau/libdatachannel
+LIBDATACHANNEL_GIT_SUBMODULES = YES
+LIBDATACHANNEL_INSTALL_STAGING = YES
+LIBDATACHANNEL_LICENSE = MPL-2.0
+LIBDATACHANNEL_LICENSE_FILES = LICENSE
+
+LIBDATACHANNEL_CONF_OPTS = -DPREFER_SYSTEM_LIB=1
+
+ifeq ($(BR2_PACKAGE_JSON_FOR_MODERN_CPP),y)
+LIBDATACHANNEL_CONF_OPTS += -DUSE_SYSTEM_JSON=1
+LIBDATACHANNEL_DEPENDENCIES += json-for-modern-cpp
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNICE),y)
+LIBDATACHANNEL_CONF_OPTS += -DUSE_NICE=1
+LIBDATACHANNEL_DEPENDENCIES += libnice
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSRTP),y)
+LIBDATACHANNEL_CONF_OPTS += -DUSE_SYSTEM_SRTP=1
+LIBDATACHANNEL_DEPENDENCIES += libsrtp
+endif
+
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
