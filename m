Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3231CC61CE2
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 06:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEC3280E0B;
	Mon, 24 Aug 2026 06:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gy9UGffuJeVl; Mon, 24 Aug 2026 06:39:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787553541;
	bh=fQachwARkwkj4O2tpgpRx13pzFhOAdfG7nM+Ma5hAqU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=imOjIoY8xpOJAyMm0oKHZze7ATJXTZNJRbHP5frBFMAPTuJLXoBVTpZT5UXmwpeFV
	 3hBUrCXhTEu81LYhcnYG5MkJwCJf4G/s3SyibeFUtSzYFXTo3N3vvg7SAdFtIUsMD5
	 FNpTq1PmaRDL/EdD73CdKeLKxO0PsEeE3w3dQiWsclnIsU8GHlXyGjjSvtHFDbVuJP
	 4rQH61btFOc48pNS7IjNvjW5dBB5B81RE4a5ntA8AOskLDAYLtUl5fH29R6FN/Cqr/
	 nPtQKnp1M9MNL9K0W1uDH94mmXr17yPlBF8CrEoYN0W/4cI3iyKTaW3CVMHH5TWwrC
	 DI7SlRsl3+Eew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7F5880E03;
	Mon, 24 Aug 2026 06:39:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 940993DA
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 866074067A
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7y2sUZctSBoq for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 06:38:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XgRJP9uC
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F6CC4065D
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:56 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-69fc9f25118so3274441a12.2
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 23:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1787553534; x=1788158334;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=er3oZXQGJOQhQIpvbSAboeNSS5RwLyVd/2JZPOSSGzg=;
 b=XgRJP9uCARgaDmRS6aH1R3jDrcp3h/7/eYWoZ4UMgwhkxMQPUXHmxy6cJALf51woeP
 0oso+OcGU0KjzZJ7AsuyBW18MvhH2lDJNLgsQzNGqAr4RRT3dOWTOIlLmhSHkdHjnK9P
 TKe1sw9nL1ZaVymvdbM/dYVcoYEUdFuQU+w6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787553534; x=1788158334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=er3oZXQGJOQhQIpvbSAboeNSS5RwLyVd/2JZPOSSGzg=;
 b=nAvth0Bi37d2YbyAXGmiuLt/CiHab9hyU3B11Z21soDX55+i6d/THvFBiKumlcpV7a
 WKfbJcUrbbDfqSlXKi560dVOAPgf9LM+cV2RaZc0L0png+AycT8hphyfKmYLROLCYRu9
 1ts/eLTKoVLkBDDf4C9g72s82G8y49vVAMSO4maIYotZarGZM1jTaPgZ2DCsr6x9gzMX
 Q1V5gH0z1a0ItoJ4nQNNUd3PAtp22kgd5+7z2YdT+UhcSCdpe2C/FRVEwijddJLtQw46
 TeFQXDoqR1tDndfA9gTN3kC6qdS3VcSQ0z8xq2K6iOITxQMunm6bmq2cQvgEVixtZpvV
 EgYw==
X-Gm-Message-State: AFuF++ktB2LkJw+35e64mMoFdigoAAjOhXbdsgdiJDnvf2Vg3QhwlaH3
 L9WwvfHwtfvPYdDihQ6yOvGgFk/oRJ8K17gguYBEL7/DRHcAVL5SQs7MNUbew6DdGu7KFaQ7R4c
 Mw9iIDMM=
X-Gm-Gg: AR+sD10ahz10zv4yWTCeyzJxFsH7P5f+3vdFTbw54rzVeBS/eMVeJiT4+2vWWRwkYY/
 qCVSG9VzuWW9SR+6T+nX05PlGkS00MSFNwwsyXiVjLoCtfJPup9rk4cW/gJsMcQ2SCLk/a0nIWQ
 SphozUg56jdZcOTcC41+mY3j/L9S8YEyR0o71zuE6pKOfvue6xNagi1FLVWJHK8M1qCP5bL02sz
 MCkFWWt9bxDU3mjIU6MUgJLCxiEvPLG5Jam7J3FNipzj+j5+aZvEVzR3ifDpdTyg7+zifsRsCyQ
 Ku3PF91TTEtkvu4wjTAU2wbeyP13Ztdh67HaFOiaRV4Pafvl/T8wa9fDKSa+Ve+c9w5WM4Yc9Af
 Aqi4XWU7URuc83IVobzeGaEgYWLsC83nlMODGyX2gsf/QnvkwGRnA7xB2E+via/AwYStzMcPTug
 +XQnK3MXam2lt389x5bjiz0Aa/hgLnM5fT+DsWZLkZkDGSUKRbNM5qO42o2OKd5A5WkFMSdFa3R
 SVcHJnf2QnhvPGZZKyT+nAeALLJXl6oWzfW5rV9zgZIUWf1+JdTBh6HnLqEmDxbBv8Z3MNxSVq+
 JsClwSs4+zNJPCpxkAts6/9hNCwWN+YXKpll3g/97ohX68CWSbA7aJLw1Rw4a642Jfg=
X-Received: by 2002:a17:907:e90:b0:c20:33db:41d3 with SMTP id
 a640c23a62f3a-c246a5f45aamr3030335966b.11.1787553534435; 
 Sun, 23 Aug 2026 23:38:54 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249685ef7bsm1226186766b.52.2026.08.23.23.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 23:38:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Fischer <mf@go-sys.de>
Date: Mon, 24 Aug 2026 08:38:43 +0200
Message-ID: <20260824063843.839745-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824063843.839745-1-dario.binacchi@amarulasolutions.com>
References: <20260824063843.839745-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 6/6] package/canopenterm: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

CANopenTerm is an open-source tool for developing, testing, and
analyzing CANopen CC networks and devices. It provides a technical,
no-nonsense solution for professionals working with CAN CC-based
networks. Additionally, it supports SAE J1939 and OBD-II protocols,
making it versatile for various applications.

Project page: https://github.com/CANopenTerm/CANopenTerm

Tested on STM32MP257F-EV1

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/canopenterm/Config.in        | 27 ++++++++++++++++++++++++++
 package/canopenterm/canopenterm.hash |  3 +++
 package/canopenterm/canopenterm.mk   | 29 ++++++++++++++++++++++++++++
 5 files changed, 61 insertions(+)
 create mode 100644 package/canopenterm/Config.in
 create mode 100644 package/canopenterm/canopenterm.hash
 create mode 100644 package/canopenterm/canopenterm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 49c5b93c13ed..e14180673b6d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -820,6 +820,7 @@ F:	package/armadillo/
 F:	package/atf/
 F:	package/babeld/
 F:	package/bc/
+F:	package/canopenterm/
 F:	package/canvenient/
 F:	package/cmocka/
 F:	package/connman/
diff --git a/package/Config.in b/package/Config.in
index 8fae0a27e7f6..08946510df3e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2439,6 +2439,7 @@ endif
 	source "package/c-icap-modules/Config.in"
 	source "package/can-utils/Config.in"
 	source "package/cannelloni/Config.in"
+	source "package/canopenterm/Config.in"
 	source "package/casync/Config.in"
 	source "package/casync-nano/Config.in"
 	source "package/cfm/Config.in"
diff --git a/package/canopenterm/Config.in b/package/canopenterm/Config.in
new file mode 100644
index 000000000000..c39d7bede950
--- /dev/null
+++ b/package/canopenterm/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_CANOPENTERM
+	bool "canopenterm"
+	depends on BR2_PACKAGE_SDL3_ARCH_SUPPORTS # sdl3
+	depends on BR2_INSTALL_LIBSTDCPP # pocketpy
+	depends on BR2_PACKAGE_LUA
+	depends on BR2_TOOLCHAIN_HAS_THREADS # sdl3
+	depends on BR2_USE_WCHAR # sdl3
+	depends on !BR2_STATIC_LIBS # canvenient, pocketpy and SDL3
+	select BR2_PACKAGE_CANVENIENT
+	select BR2_PACKAGE_CJSON
+	select BR2_PACKAGE_INIH
+	select BR2_PACKAGE_ISOCLINE
+	select BR2_PACKAGE_POCKETPY
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_SDL3
+	help
+	  CANopenTerm is an open-source tool for developing,
+	  testing, and analyzing CANopen CC networks and
+	  devices.
+
+	  https://github.com/CANopenTerm/CANopenTerm
+
+comment "canopenterm needs a toolchain w/ C++, threads, wchar, dynamic library"
+	depends on BR2_PACKAGE_SDL3_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LUA
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/canopenterm/canopenterm.hash b/package/canopenterm/canopenterm.hash
new file mode 100644
index 000000000000..625853c2ada9
--- /dev/null
+++ b/package/canopenterm/canopenterm.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  46180a190bc64d3ca8779cdaf7855667c847ee6f51551a957c5bccd1287b1445  canopenterm-2.03.tar.gz
+sha256  8c1f56d8bea303fb856c0bf7a63cbb91e81e2441bba1bb9fd8a314909b0e10b3  LICENSE.md
diff --git a/package/canopenterm/canopenterm.mk b/package/canopenterm/canopenterm.mk
new file mode 100644
index 000000000000..931e8aa2c140
--- /dev/null
+++ b/package/canopenterm/canopenterm.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# canopenterm
+#
+################################################################################
+
+CANOPENTERM_VERSION = 2.03
+CANOPENTERM_SITE = $(call github,CANopenTerm,CANopenTerm,v$(CANOPENTERM_VERSION))
+CANOPENTERM_LICENSE = MIT
+CANOPENTERM_LICENSE_FILES = LICENSE.md
+CANOPENTERM_DEPENDENCIES = \
+	canvenient \
+	cjson \
+	inih \
+	isocline \
+	lua \
+	pocketpy \
+	readline \
+	sdl3
+
+# CANopenTerm sets CMAKE_RUNTIME_OUTPUT_DIRECTORY_<CONFIG> to its "export"
+# sub-directory, while the install rules look for the executables in
+# CMAKE_BINARY_DIR. Pass a fake build type so that the per-configuration
+# output directory is not applied and both agree again.
+CANOPENTERM_CONF_OPTS = \
+	-DCMAKE_BUILD_TYPE=Buildroot \
+	-DUSE_SYSTEM_LIBS=ON
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
