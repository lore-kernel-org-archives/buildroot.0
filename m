Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF29C2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 21:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF88A403C2;
	Tue, 25 Jun 2024 21:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSu_fpRm2HBQ; Tue, 25 Jun 2024 21:20:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AE7540592
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AE7540592;
	Tue, 25 Jun 2024 21:20:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DC151BF417
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 21:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78880402D9
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 21:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jK1M_rdK7g9W for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 21:19:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B990402B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B990402B5
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B990402B5
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 21:19:05 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2eaea28868dso79483981fa.3
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 14:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719350343; x=1719955143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNwEmPQPeYYTlmMNm+OOPXc5GtdF8/d+e6ZpfjGLwng=;
 b=m8w/qIGbxrlRoGSGEDA8t2Zm8qcMNNig7u/kR6DHQk8EsN8kCqiWAAto3+jouycIbc
 G7ds33Tyg7VNMGdMxQAf212r5qVe19UXzQUjgsMJLA7+/UINgUhpZ8uY7aDfP+DQFQph
 cPCodfqC1fmGOsnRzAHTsi5Uldh38fmTVm2L58RJ7cxD9lDMoSDqAAG7uKdxwU/yulIS
 1Hjt+17zfDjtyCcsWM2ZiUpYE6zq5UhLDBZBSI1L3lrLtvCB21943hjXnANyWrIKPu5o
 78AvI3W3nwhCG6X+t+z6FFTthhXek0J0bht+3a8paB7vj/Zy3f9uceGyCQ245jaY6kMb
 mcuw==
X-Gm-Message-State: AOJu0Yx+OPmqlDPu3mPq5Z8qyxYPm5muUjmnQd/sCeKolcy2zu7S+AdG
 f5yR4qjJ0TYvp4OIIhoyqUH6fCyCo1tJhQ/Y6wACdS8bpvWUe3U5GCtkOg==
X-Google-Smtp-Source: AGHT+IGc5mjIUNxP1mq1iDsP6D0oLJ0AhH9cR+qHq8iD+pXhO6CHm6GSY+fYhXVZjGl9b+YGrqfY9A==
X-Received: by 2002:a2e:7211:0:b0:2ea:e74c:40a2 with SMTP id
 38308e7fff4ca-2ec5b2d5b95mr58687531fa.20.1719350342961; 
 Tue, 25 Jun 2024 14:19:02 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec592b6158sm8908971fa.3.2024.06.25.14.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 14:19:02 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jun 2024 23:18:26 +0200
Message-ID: <20240625211847.1419944-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240625211847.1419944-1-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719350343; x=1719955143; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNwEmPQPeYYTlmMNm+OOPXc5GtdF8/d+e6ZpfjGLwng=;
 b=SIhmltsfe6Ba62MIIKvpvStgjMtRqJF2BHUurACBycBoYucpv9CZCCryDFfyIRsVsG
 eX1/2gn+U7/CIO6N+SwEUwyZ1232j0VaMgP44jKIxuSl8BmEIeZZQm03cbkVK8NljjT/
 pFrp6uryIEf6bM7r2OOuGPrchqlDgRjB+fOpCtYulNxgWVEKd9nz++07ZvhHPUmkbiet
 JcoqdqU+kY3Kxi5ticQI0L+kJZyq6CApQLT7ozJPx4b6qMxEHiyGox5NWVlfUu30xav3
 pRPyFPTD64fgdOuT34ZxLEfV4fJJNZnlHvqhuBRsBcXVe2CqFeNrTKMYqaW9PSpWeT8e
 AhEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SIhmltsf
Subject: [Buildroot] [PATCH v9 02/14] package/qt6/qt6base: add blind option
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
