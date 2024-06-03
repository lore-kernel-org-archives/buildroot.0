Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E80C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 11:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26F39414FD;
	Mon,  3 Jun 2024 11:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zipd54Uo_wa7; Mon,  3 Jun 2024 11:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CF214152B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CF214152B;
	Mon,  3 Jun 2024 11:52:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FC401BF383
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15DB340B12
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmT9TV0YJd0y for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 11:52:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E54F41176
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E54F41176
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E54F41176
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 11:52:30 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52b88740a93so3226416e87.3
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 04:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717415548; x=1718020348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c6CExmaojnHMOSpAXIJY+F0WB79qtqp5gTqaEjqrrBU=;
 b=pLmlHgxc3tb8h0jS/79zWsSk/+0C4qx+eAERe5PeaasR1yRpeXF16A2478QRWV0Voq
 78pkKOHzV9BU7GCfXZvXBuglS+/DWev9Q+lrtfOFiziJTIioAHMPuWpf9kvLm10Aba4Q
 5SgGnUdq+GQOqH7uyrbnIUne6GhoN28mMuN744V00Y7/EQ7jDR/fe5WxhXgrcl25Xln4
 QS036qMeu1iiILQ3YheIvu1TbftV6gSfsK9aCFrdGWErUAYvfcXBmyIkPsHLGG9gM0sO
 X5rpBVAel6s7l6d+dqdtbVbM935NiYevNGe54+cE47KlRYXBG262iENYP8Fj9sPLh5jk
 72YQ==
X-Gm-Message-State: AOJu0YzrYXdfXgDRLNfGN7PkWBl8rKPOFYPhfzadOBKs24EaRzJvqa3z
 mMlSZXZ3bUne1PFIcoBAyFaJ0MAyTAQNmyRMe246QzNDawglFcerJ8+XcJ6y
X-Google-Smtp-Source: AGHT+IGS6VeXd79h/3kF+CGulLpDg3mwGvPFOIu51OtsG3s0+eIJVdLCubt/cu9lz5zun81yPWI8Zw==
X-Received: by 2002:a19:7708:0:b0:51d:3f07:c93c with SMTP id
 2adb3069b0e04-52b89560924mr6170184e87.3.1717415548039; 
 Mon, 03 Jun 2024 04:52:28 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b96035a33sm529058e87.294.2024.06.03.04.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 04:52:27 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 13:51:45 +0200
Message-ID: <20240603115206.3583474-2-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
References: <20240531151325.2443323-9-roy.kollen.svendsen@akersolutions.com>
 <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717415548; x=1718020348; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c6CExmaojnHMOSpAXIJY+F0WB79qtqp5gTqaEjqrrBU=;
 b=ZpnM2sau8bSrjdIhjBVa2gPRqMKIsW78vrtpaR43nhjLY9Tnf2H4wHCxGrOpwaUa1Z
 3p+ik2GPhDrGM0XZ5va8oF45H4Q5JVRxvWl9cLQMxL+g20iMoefbv5uA/pz17v9SKJSi
 xVz8S2bVclAavdGKHXjomDk1ZlIBbaYRFx/ZKaz1EDJyDcBl2fqdZRCaI3a5J70/9jsy
 nKm3OGlO6SwXdiJfBLNAtFOTN+3d+2MMp71OpsxwNKY1OSrFfPk+iFyllVynOoLW/tcT
 +I36Ye0Kc3NwyY+ah7thK76S1VadtRW5u1ephrHnNNIwyAe8cqM9R/F5ax3i+9bmMBSK
 OovA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZpnM2sau
Subject: [Buildroot] [PATCH v6 02/14] package/qt6/qt6base: add blind option
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
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need host-qt6base with Gui support when building host-qt6shadertools,
otherwise the build is skipped and no qsb host tool is generated.
qt6shadertools fail to build if qsb is not available. qsb is also required
when building host-qt6declarative with Quick support, which is necessary for
the qmltime host tool to be built. qt6declarative fails to build if qmltime is
not available. Gui support is also required when building Svg support and
thereby the svgtoqml host tool. qt6declarative will also fail to build if
svgtoqml is not available.

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
Changes v5 -> v6:
  - Add explanation to commit message  (suggested by Yann)
  - Add explanation to qt6base blind host gui option

 package/Config.in.host             |  1 +
 package/qt6/Config.in.host         |  5 +++++
 package/qt6/qt6base/Config.in.host |  4 ++++
 package/qt6/qt6base/qt6base.mk     | 15 ++++++++++++++-
 4 files changed, 24 insertions(+), 1 deletion(-)
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
index 5bc5370834..5b9ddc4d77 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -83,7 +83,6 @@ HOST_QT6BASE_DEPENDENCIES = \
 	host-pcre2 \
 	host-zlib
 HOST_QT6BASE_CONF_OPTS = \
-	-DFEATURE_gui=OFF \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
@@ -97,6 +96,20 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_pcre2=ON \
 	-DFEATURE_system_zlib=ON
 
+# We need host-qt6base with Gui support when building host-qt6shadertools,
+# otherwise the build is skipped and no qsb host tool is generated.
+# qt6shadertools fail to build if qsb is not available. qsb is also required
+# when building host-qt6declarative with Quick support, which is necessary for
+# the qmltime host tool to be built. qt6declarative fails to build if qmltime is
+# not available. Gui support is also required when building Svg support and
+# thereby the svgtoqml host tool. qt6declarative will also fail to build if
+# svgtoqml is not available.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_GUI),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
