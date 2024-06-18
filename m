Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F93DC27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 13:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D80D60EF3;
	Tue, 18 Jun 2024 13:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PCgUB7FInJCS; Tue, 18 Jun 2024 13:20:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB8D060EE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB8D060EE4;
	Tue, 18 Jun 2024 13:20:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C9991BF3BB
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68E924093B
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dO5CgR5cY6hj for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 13:19:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6741540584
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6741540584
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6741540584
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 13:19:52 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52c84a21b8cso4963652e87.1
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 06:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718716790; x=1719321590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7TQZdR3rgNALMznLtPfCIXMpuUhTyUUWDpEn2e3WYH8=;
 b=jVsINeiOtwL6O1Ai7eoBIcshaNfk7BxTy3LWIJLyi+xbCpbXPnIVhAPAeswfEtwkTq
 D0WW7rLh0P0HFM0pwCGfAVGkH+3476Fi9P83bhsmTf05qRsD5wnYbtKO7ddSh+KgQPhX
 mJDqTORWSkPp2dEIzpyR6lAtwQZVxdx/CWkS3gEZPi38qJZ/T9D4SrR/23Fh7oEEGJ7W
 wwalg8C5Pg7SOE7OvXFdATFW054XaVCY9Jzr8GKSovJrncD2wUIznQw3jrRE63GsNmFu
 n/j6DRsctVz67DZ+6+WjrO2q/UIhQALmwZ40uRoR2dhr4UXtdL4WF4OoA8Iw9eGZq/gj
 Hzlw==
X-Gm-Message-State: AOJu0Yz1ECerdJ7e6TIdWNqWZrOwCPom748onLI/tcB+UjJZ3Vi+ngcG
 2wLJDnUJpg9F/laRw+K+4lwk3XJXX80VLS73Pg/VzuQNkMm+JTv/X2LSPg==
X-Google-Smtp-Source: AGHT+IFHXjP38ZbKW9SI4skGt2ltDW1kzsqcJ2y6C2fuNTzHNEvuT7/rI5wEJx83D971ckH7hZ0xZg==
X-Received: by 2002:a05:6512:15a1:b0:52c:89b3:6d74 with SMTP id
 2adb3069b0e04-52cc47cb6b8mr850990e87.6.1718716790026; 
 Tue, 18 Jun 2024 06:19:50 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287228bsm1497540e87.163.2024.06.18.06.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:19:49 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 15:18:24 +0200
Message-ID: <20240618131902.2912459-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618131902.2912459-1-roykollensvendsen@gmail.com>
References: <20240603115206.3583474-9-roy.kollen.svendsen@akersolutions.com>
 <20240618131902.2912459-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718716790; x=1719321590; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7TQZdR3rgNALMznLtPfCIXMpuUhTyUUWDpEn2e3WYH8=;
 b=R8B9vyFuuv0tW6uQsNvUC/RsbCJzXFFswbgSesQcRhcxgXaB4QmvsYXXovmiXqHzM8
 xNNITBE/IdkqmanqKZEj7w6A+PPfNF7BUDE6SHMVK46F6E2n4DVficOCmcvN/M6FSpEK
 Q0O7qhsrxErS6eYn1ZZx4Sr9BlnGjuBK1jX80i2t/uZtZhx7n9vpx177F5/xTuiFsjIA
 uuqaQHRyNSiCxxMJX9vr+/Kgqxx0x4PYDpbW/TYsBnBD9Q68d7JNH1FoXdyxbBB0G5AS
 psGHOIjtcpguyl3zBBl4laKiRwYtWWpJHqg1IJb9EmgmKOzpbYZN9kHkTnMjxemzBOiv
 d1xg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R8B9vyFu
Subject: [Buildroot] [PATCH v7 03/14] package/qt6/qt6base: add blind option
 to enable Network support on host
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

The Network module is explicitly required by qt6tools.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/Config.in.host | 5 +++++
 package/qt6/qt6base/qt6base.mk     | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 326c06278e..286da0ff03 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -2,3 +2,8 @@
 # Qt Shader Baker(qsb)).
 config BR2_PACKAGE_HOST_QT6BASE_GUI
 	bool
+
+# Select this if you need host qt6 tools that require the Qt::Network module
+# (e.g. Qt Tools).
+config BR2_PACKAGE_HOST_QT6BASE_NETWORK
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index a229c62844..509c6b0066 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -87,7 +87,6 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
 	-DFEATURE_testlib=OFF \
-	-DFEATURE_network=OFF \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
@@ -105,6 +104,13 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
 
+# The Network module is explicitly required by qt6tools.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_NETWORK),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
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
