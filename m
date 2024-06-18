Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4D3C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 13:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FF1C60777;
	Tue, 18 Jun 2024 13:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPpCIx1rkFCQ; Tue, 18 Jun 2024 13:20:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8237E60B93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8237E60B93;
	Tue, 18 Jun 2024 13:20:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 820E21BF3BB
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FA2781754
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYZphFHUoiJ8 for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 13:19:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6169981753
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6169981753
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6169981753
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 13:19:49 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52c89d6b4adso4929447e87.3
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 06:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718716787; x=1719321587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aYnaJe8p+RANoImx1jhUfEUhXvHuL3zwjc9uVT6hQ5I=;
 b=CIktr7DvUrG0HFqh2eKug1dr1AE81NK0WvZPPeMiJeTi7NS7by0eo62xs02nte+sG/
 Su1Rfan+qFYIPbNUyfBAZjyCyhC0p4xvcaYDsTmcoy3N82OkoSRBP85TBf2FdPyFz9e6
 0rmtXaQwctoQ5UxnYX3ZwJ2e5tGOtHmh/OJqYZt9LdlrDTg7ge8sE57qE90BW5RFV6/s
 RaVrRRnkh8vo+7UoOpQwPfJP3AlHAMoGLwqytbUOD3oO9TiqSAyLjrnyupkbqcVT9k90
 ZukIz8wAPkjDuIEcdcN5ndCqOrH7CGnZn0hIBshHo0bNYhg8DC35zDnDE0LatU3F2rGP
 pUMA==
X-Gm-Message-State: AOJu0YxbuHyV0y83U95yIPiDlmxt22xBizrTdtMY5XfWLbcoA8LHeXaE
 KkDJSnwvBMzdOtQCFGqDI/ODm+mx++I1aKGAPYf2cY5U+jX1YeLb6v39Cg==
X-Google-Smtp-Source: AGHT+IF1p7KL7drTGNo/tcFQAiwZrAkTEzIQTPW3tUQNAnHGf+98+l/3hU0bR8zfXigUdnwskS7ehw==
X-Received: by 2002:a19:a40c:0:b0:52b:f2ab:1303 with SMTP id
 2adb3069b0e04-52ca6e67da6mr7012695e87.28.1718716786609; 
 Tue, 18 Jun 2024 06:19:46 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287228bsm1497540e87.163.2024.06.18.06.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:19:46 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 15:18:23 +0200
Message-ID: <20240618131902.2912459-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618131902.2912459-1-roykollensvendsen@gmail.com>
References: <20240603115206.3583474-9-roy.kollen.svendsen@akersolutions.com>
 <20240618131902.2912459-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718716787; x=1719321587; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aYnaJe8p+RANoImx1jhUfEUhXvHuL3zwjc9uVT6hQ5I=;
 b=EAIvJQfBtBP1t7q4zHWs+WyiLabIG0+fwMTX2K0t8yF847zVJ4935SSGP2sHKK9tYn
 ezFKDnfHKMN3cxcs+La1FXT2hHCwrO7EQaMnviucx880o3qRzzmxUZ8X/adAqbE/RFq5
 ep/+kePmfUIHhpicXsQTECMAD7YC4yNwEdKaAdTaNA3MYE/yz9TDfCk6q9nwoE5uSqqV
 TmICWuGVJ84KtyVmOtv423yMYm8VrKk8gZ6/lJ+IRFC78NfzhvINR5Sp5ugOVsGj4eB3
 bVM7BkBOvMXx1/E+6PW+5eSIhcoNbnlHy0hqr+MBO4B3H4wk1rv2XXEqvkwtXCEa8cD8
 PlTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EAIvJQfB
Subject: [Buildroot] [PATCH v7 02/14] package/qt6/qt6base: add blind option
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need host-qt6base with Gui support when building host-qt6shadertools,
otherwise the build is skipped and no qsb host tool is generated.
qt6shadertools fail to build if qsb is not available.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v6 -> v7:
  - Simplify explanation in commit message
  - Simplify explanation for blind host gui option

 package/Config.in.host             |  1 +
 package/qt6/Config.in.host         |  5 +++++
 package/qt6/qt6base/Config.in.host |  4 ++++
 package/qt6/qt6base/qt6base.mk     | 10 +++++++++-
 4 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 package/qt6/Config.in.host
 create mode 100644 package/qt6/qt6base/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 9cdca62633..66f3a6fa9d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -92,6 +92,7 @@ menu "Host utilities"
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
index 13999bbd44..a229c62844 100644
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
@@ -97,6 +96,15 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_pcre2=ON \
 	-DFEATURE_system_zlib=ON
 
+# We need host-qt6base with Gui support when building host-qt6shadertools,
+# otherwise the build is skipped and no qsb host tool is generated.
+# qt6shadertools fail to build if qsb is not available.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_GUI),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
