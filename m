Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EEFC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55CA5418A0;
	Tue,  7 Feb 2023 17:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55CA5418A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id quNbAmeQqZrW; Tue,  7 Feb 2023 17:19:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 460BB418C0;
	Tue,  7 Feb 2023 17:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 460BB418C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 240F21BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B93240A68
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B93240A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YdRIxA7IVcss for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:17:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3176E40120
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3176E40120
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:17:39 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h3so6431956wrp.10
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:17:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CT9fxk0HFbYt2zMQ30QJ3hxYUP6ca7tpI0QLhgB7kLU=;
 b=N/5ezmNPmVUpxjE/mupFr1aHMfKRyNm6Wrzx/ssjhDNjPRROOsS2wLUzFf7N0luhWn
 LF0Y+0tnT3rYPmv0tWWrzPJAH3LjhKU59of4qonGGhDg2lr48Yjj7awD3rZwT3R+VltU
 cAWAyKeMAkPe/hlQJsiRBHwRWbNA2OqePuHpTfDx6mkfYgFw0jJL2NCkU33Op+kYQTv4
 xKaV721mbJSRIm5iANzSPYgIH7eeAXdnKuswr2rleY+ZISLLFcgc971jKgN6/Zk/qKAE
 NaRp+cJsYOdPaC/5GVvxV4saMXk7dwmfmIjoEupbblDqKJnq/13e8KG/EgomgpA68/sc
 K2MQ==
X-Gm-Message-State: AO0yUKWBx5RWXqxK/5+zNur6LOhZo7SWWgVmD8EEm4MpYgQiasuZhR9G
 d0m7dlIIM0Q/I2h4ghjfALuMY6tj2Fp8qk0NS+vsbw==
X-Google-Smtp-Source: AK7set9GF6+HJWfByK7DbD9djpcymxQXF0a3mSnVAopH80AzD92rWnrIniT54K/69FmSh3C/bMsckQ==
X-Received: by 2002:adf:ea81:0:b0:2c3:f90a:7076 with SMTP id
 s1-20020adfea81000000b002c3f90a7076mr1241229wrm.57.1675790256726; 
 Tue, 07 Feb 2023 09:17:36 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bff574a250sm11708801wrr.2.2023.02.07.09.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 09:17:36 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:17:15 +0100
Message-Id: <20230207171721.2973997-8-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207171721.2973997-1-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CT9fxk0HFbYt2zMQ30QJ3hxYUP6ca7tpI0QLhgB7kLU=;
 b=O1/+2xOQUcAKirqVRWE3p+L/tlDkV2Fr8Wrj0XVHdMoEk56AxrwCVDaDm2661i44VN
 mIkcCYlo/O0Av7p3i7V0PD0hsFEZwJU8rBdPangsMjKoi7K4KuCrLMKgx0qae2RDnJbH
 iGW0vc0Zueb+xnY0eal5DZQdtmw7KT1iuvWeo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=O1/+2xOQ
Subject: [Buildroot] [PATCH v6 07/13] package/qt6/qt6base: add QPA backend
 selection
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
Cc: jesseevg@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/qt6/qt6base/Config.in  | 13 +++++++++++++
 package/qt6/qt6base/qt6base.mk |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index a33ffcd511..065725049d 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -60,6 +60,19 @@ config BR2_PACKAGE_QT6BASE_XCB
 comment "X.org XCB backend available if X.org is enabled"
 	depends on !BR2_PACKAGE_XORG7
 
+config BR2_PACKAGE_QT6BASE_DEFAULT_QPA
+	string "Default graphical platform"
+	help
+	  Choose the default platform abstraction to use for graphical
+	  applications (e.g xcb, linuxfb, eglfs, ...). If this is
+	  empty, the default for your architecture will be used
+	  (usually this is eglfs).
+
+	  You can get a list of supported platforms by running a Qt
+	  application with the option "-platform help" on your
+	  target. You can choose a different platform at runtime with
+	  the -platform option.
+
 config BR2_PACKAGE_QT6BASE_OPENGL
 	bool "OpenGL support"
 	depends on BR2_PACKAGE_QT6_GL_SUPPORTS
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index e9a3396fb6..a3c0c20d6e 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -249,6 +249,9 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
 
+QT6BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT6BASE_DEFAULT_QPA))
+QT6BASE_CONF_OPTS += $(if $(QT6BASE_DEFAULT_QPA),-DQT_QPA_DEFAULT_PLATFORM=$(QT6BASE_DEFAULT_QPA))
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 QT6BASE_CONF_OPTS += -DINPUT_openssl=yes
 QT6BASE_DEPENDENCIES += openssl
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
