Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78679C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 14:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C764051E;
	Tue,  7 Feb 2023 14:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C764051E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3Pw7-dnMC-n; Tue,  7 Feb 2023 14:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA352404BE;
	Tue,  7 Feb 2023 14:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA352404BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DEA51BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26014409FA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26014409FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bCQpEE_0--ew for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 14:30:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59C2A409EE
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59C2A409EE
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 14:30:19 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so13296583wmb.4
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 06:30:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhwfVuz8/6qqrk482V/VEaiHl+0yyxAT0dtNAdt4MaA=;
 b=2VDw9XeDomObvNXpNvy3NrPHtbBWoYSL6WJ1+4/jljjHzTN/oVxd3dGQQIGR5L6EnN
 V6gnOXojkmMQKdeg373kpxvf3Zuyq+bprockT/SmJwU03Ne8ePYvLwZIegUvOAAVU07M
 wsNu3jtHTU/Ldo8aKHnd4AT88Bb37Ztp7cXhGO9g6f87uPWlB1C6Z0RKibZec1Ojx57M
 tZD2n7w2tlaZJC4tNe9pgb7a6HnKW45iZ5FgttWJ7JUlqRLRBhX/R7kI6an2lSzVaRvd
 RSXvrFtyiKOSa70ts+VPeHP/AAaBC2NWfyRrw31m7rRYAI6OecfAG8EyWbFdNbaOSBdH
 o95w==
X-Gm-Message-State: AO0yUKXCBZ42+RkMDBWbCQdww0PigKr8gdtod3hl8c53ej2MoZm0mjZx
 sfu2dk18VoiYlydYCICvIHLSdgMnI3iy28ly/TATjg==
X-Google-Smtp-Source: AK7set9kn5KKaYm05N96rEySObdt6X8rX5yW4MjrfuxtH9yR7bdqUgU/QJHZdM6xBO9/r8z68utEIw==
X-Received: by 2002:a05:600c:1608:b0:3df:dc0d:f0b3 with SMTP id
 m8-20020a05600c160800b003dfdc0df0b3mr3399704wmn.9.1675780217277; 
 Tue, 07 Feb 2023 06:30:17 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003dc1d668866sm18537074wme.10.2023.02.07.06.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:30:16 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 15:30:01 +0100
Message-Id: <20230207143006.2681335-8-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207143006.2681335-1-angelo@amarulasolutions.com>
References: <20230207143006.2681335-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhwfVuz8/6qqrk482V/VEaiHl+0yyxAT0dtNAdt4MaA=;
 b=c1zFG5Jx0boaGl5tZ4whTop1kyuH2HBO4pSMU9JvPSaKCOKWPjjinu+tAX5f+lTiy4
 hgKbxH+M1dmh6RGHmSs0Hv9aEoeA/ccY5WFV0YT/3YdzmyrEFRE89qUH0nNuNYlCiDT0
 kV04+8xkJqf+c1AQPL5ru0kmNX/ogOyP40iOQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=c1zFG5Jx
Subject: [Buildroot] [PATCH v5 07/12] package/qt6/qt6base: add QPA backend
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
 package/qt6/qt6base/Config.in  | 18 ++++++++++++++++++
 package/qt6/qt6base/qt6base.mk |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 732b81abe3..0f1c9fccd2 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -33,6 +33,11 @@ config BR2_PACKAGE_QT6BASE_DBUS
 config BR2_PACKAGE_QT6BASE_GUI
 	bool "gui module"
 	select BR2_PACKAGE_FREETYPE
+	# At least one graphic backend must be enabled, so enable
+	# linuxfb if nothing is enabled.
+	select BR2_PACKAGE_QT6BASE_LINUXFB if \
+	       !BR2_PACKAGE_QT6BASE_XCB && \
+	       !BR2_PACKAGE_QT6BASE_EGLFS
 	help
 	  This option enables the Qt6Gui library.
 
@@ -61,6 +66,19 @@ config BR2_PACKAGE_QT6BASE_XCB
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
index bfa44ae74c..41c7a8b350 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -252,6 +252,9 @@ else
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
