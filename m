Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0192C25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 20:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D14D820A7;
	Sun, 12 May 2024 20:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IGsXM5KmkC2l; Sun, 12 May 2024 20:19:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC12C81F8E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC12C81F8E;
	Sun, 12 May 2024 20:19:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFB621BF3E0
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD40060616
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_Q88H4Y8nLH for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 20:19:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 82A2B60600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82A2B60600
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82A2B60600
 for <buildroot@buildroot.org>; Sun, 12 May 2024 20:19:11 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2e1fa1f1d9bso65778461fa.0
 for <buildroot@buildroot.org>; Sun, 12 May 2024 13:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715545149; x=1716149949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+4eW0GfLoMZpazdr6dtKioijZzsmFDGkAmpEkHCBKk=;
 b=IedgTH7iiTuKaZ6Knc0exf7HXnM0z2c/d02w8ovLn28L1+YilShxvVptaz2s7n39D8
 kwmpMhAGAhuulfhMoCJXlyBwGo9KVzxUGXG+tNYlD11R15pz0Ku+wfMuwAqatW/wuN29
 6APTUOGE2O7yO04BRtMaFnr+S9kOi7b7b3dz/16LvZkZx53U165IHRisVjvTAUQe+Ff0
 xNRaFHeBr4X1oiaPuKDTmRQlkRXxvuDbVeMy49LF4SKFS1npTWWRBTThX6uNyM4yXqNp
 R25Ml0iNTabNsqmUQgLn622F3tlvdFVuorRs43gc82rzN/pE7tmC33K8NKAKqEUb/6oy
 KtnQ==
X-Gm-Message-State: AOJu0YwKNLbxNipI373urnl3HPVrW7mXhDQXY+5l15MGj/b9Dxht+hrq
 tr5kqEQL6dk634Q4E/NvBfHKug5OKNSSIZZW87FEEy4UcTYrwBF+XffkrK1k
X-Google-Smtp-Source: AGHT+IHUW2AaZOcVrvcrdH2/XFhF5cnTkHGKeai3jORjh+JCb5moZHisRwPr7OAQzInOj8lozgv/UA==
X-Received: by 2002:a05:651c:149:b0:2e2:9842:a9d3 with SMTP id
 38308e7fff4ca-2e52039dc3emr62702911fa.46.1715545149043; 
 Sun, 12 May 2024 13:19:09 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d1515580sm11400791fa.79.2024.05.12.13.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 13:19:08 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 13:45:50 +0200
Message-ID: <20240512114617.2564569-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240512114617.2564569-1-roykollensvendsen@gmail.com>
References: <1924535>
 <20240512114617.2564569-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715545149; x=1716149949; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+4eW0GfLoMZpazdr6dtKioijZzsmFDGkAmpEkHCBKk=;
 b=HfoWwq2fN+rc/tWxtoNdS9pfynfg0xzSdiRzc75rX7O5YpxqYObHUlArN/m9K05+bG
 W0xAi6yaYE7Ea9Yj3/TxiXGsCdowScfQFGf7STrE6PnpC/JOBGLpXeIWwpeOLI2r9P9t
 HM9v4iAgxYOdIWYkqW+6n1YAZ09OfbtjYaHA/JsL+LLaQXGWWZPYDbhsRBMM5QF0LtQn
 5tx3tovJfdgJ3PvVK8XFpSfRtpJROsVCKG6eN/XDh2kvxOpdB1iv80nIbn4Cj9wgCt/7
 yEo9OVtWMTBITF9CHGhYL4fVIE/OHbDPDhzSVyxYR8ubiXxEg/FabTmv+6D7kJYlrsN2
 evig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HfoWwq2f
Subject: [Buildroot] [PATCH v3 03/14] package/qt6/qt6base: add blind option
 to enable GUI support on host
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>

The Qt6::Gui module is needed when building the 'Qt Shader Baker'
(qsb) host tool.

Qsb is needed for converting the Qt6 Vulkan GLSL source code to
platform specific shader languages which is then later copied to
target.

For more details take a look at:

https://doc.qt.io/qt-6/qtshadertools-overview.html

and

https://doc.qt.io/qt-6/qshaderbaker.html
Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v2 -> v3:
  - Add explanation for why this option is necessary. (suggested by Thomas)
  - Move blind host option into Config.in.host (suggested by maintainers)
  - Move this change to separate patch. (suggested by Yann)

 package/Config.in.host             | 1 +
 package/qt6/Config.in.host         | 5 +++++
 package/qt6/qt6base/Config.in.host | 4 ++++
 package/qt6/qt6base/qt6base.mk     | 7 ++++++-
 4 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 package/qt6/Config.in.host
 create mode 100644 package/qt6/qt6base/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 986b2854d0..cbf54f5752 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -95,6 +95,7 @@ menu "Host utilities"
 	source "package/python3/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/qoriq-rcw/Config.in.host"
+	source "package/qt6/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
 	source "package/riscv-isa-sim/Config.in.host"
diff --git a/package/qt6/Config.in.host b/package/qt6/Config.in.host
new file mode 100644
index 0000000000..dfe7865c57
--- /dev/null
+++ b/package/qt6/Config.in.host
@@ -0,0 +1,5 @@
+if BR2_PACKAGE_QT6
+
+source "package/qt6/qt6base/Config.in.host"
+
+endif
diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
new file mode 100644
index 0000000000..326c06278e
--- /dev/null
+++ b/package/qt6/qt6base/Config.in.host
@@ -0,0 +1,4 @@
+# Select this if you need host qt6 tools that require the Qt::Gui module (e.g.
+# Qt Shader Baker(qsb)).
+config BR2_PACKAGE_HOST_QT6BASE_GUI
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 6857725ef5..47f47b6f8c 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -84,7 +84,6 @@ HOST_QT6BASE_DEPENDENCIES = \
 	host-pcre2 \
 	host-zlib
 HOST_QT6BASE_CONF_OPTS = \
-	-DFEATURE_gui=OFF \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
@@ -98,6 +97,12 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_pcre2=ON \
 	-DFEATURE_system_zlib=ON
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_GUI),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
