Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287C0C369D9
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 06:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8209280CED;
	Wed, 30 Apr 2025 06:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6kDz9HU-ATF; Wed, 30 Apr 2025 06:00:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72F3880C22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72F3880C22;
	Wed, 30 Apr 2025 06:00:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD20E1C4
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 06:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9D0F80C80
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 06:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AC7mTdhUaxvC for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 06:00:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C57BB805B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C57BB805B7
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C57BB805B7
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 06:00:02 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-acb2faa9f55so862736366b.3
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 23:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745992799; x=1746597599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zqAa97r9/K0sRmKqMBA8gR7mV5AsmX4H+f4iiJOim2M=;
 b=RzO1ZxLbYNbifBshZFCVWxJFudmVPS8SV16JRuJZsuonZt+ouYc995JBqcUi0kRiYA
 nvBlhTPyAb9foNryvVyqqWQxnhPIyWPiLPBntJWusSMjODEBsjjjWD85OPWaYX5cgti7
 QIPqNEZmYspipIR+2rdzIHOvw/qRChRQipTDbfQGLTfM/+sBjcy4EM+lXAiYhB+dqefl
 3BEKKe2qX1gclSvAi9YG0U4FlBJBXTBojAO1KKtsgA2AbO6Q1XmyPMYlmxWnl17lqoXL
 QXFCZMkhe2CUWgZsVC946TBArXgtzXkmBLUxSdhBRNDT4gT1+j0/VACc/nNuOTC0A6gw
 jqtw==
X-Gm-Message-State: AOJu0Yy+amj4CsvH+03ekH/c1f+YscHcAZdWwulLlsTpJWVVXkdetCLl
 1ospUeGND/+0TS66FVc0ajHYKGWFF8/mOnsiqS68eaYZmnvfwnvpuHEbeA==
X-Gm-Gg: ASbGncvzF2prgqSXZ78uCPbm2ZPxqaPODyB+18geIsJSxENdzXTBVipnBdBrmxgsQEU
 SyTEBOt7i8KlmwF1l6k/GiGlrJrqyifrFpFhmcR+TaYpwj77buD9MOGoKiyL3jDajTXd0rhlxG9
 8jVr9xSc5TAze/ghlAv4HF+rnyX68EUp2k6/hX+FsTiYKpHQs/Xf9ShwTjLeCwMiv1tsjosXh8H
 qshU9I9XagwRXtC4dOWieme4/24k9gBDW4ug45eofkl8V6Y2ncfKDTp7ZLZP0Pr4t6BMGyHhIxb
 CtCxE8W9RoQRrn/ZnpPYk489GqAmSALKCHy7gTaJ21AUySw5emfsUQYrPULdhsdyofN+t7/rp7e
 6Jel+RaoPz3NGX5Yt/1KfUw==
X-Google-Smtp-Source: AGHT+IH9WxfaccUgv2DOARL610Of7Cf7ktZNg9tM27j5/IyUW4duQZBuI6QH0zyFgjzUtsPCRS2qAw==
X-Received: by 2002:a17:907:3e14:b0:ace:3c0b:1947 with SMTP id
 a640c23a62f3a-acee215cf66mr124184666b.4.1745992799233; 
 Tue, 29 Apr 2025 22:59:59 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6eda63aesm872122266b.164.2025.04.29.22.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 22:59:58 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 30 Apr 2025 07:59:56 +0200
Message-Id: <20250430055956.288191-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1745992799; x=1746597599; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zqAa97r9/K0sRmKqMBA8gR7mV5AsmX4H+f4iiJOim2M=;
 b=I7/xJ1b6EC7H0zECJCAV0aoCc7eicM66kkYx7sqIsHuZ2lCDt1PIE3VZlPlazmUCoj
 m+SwHI1UX611aK6BbrLWwXgGNkfeTHQrfxOziJ8/Tb+aXLuANsnlJIoteDo5HttRjKJk
 4h4EF/yNIXFMhz09qkApLxL/GPtxBqVDtC2K+6ercaUGH0nugH8IE+hqxdjj2/tqyzty
 wqfdXXPdP4V9dz0aMcUcVpTNA4C7Uq86z5t6JrnEJ1UsThOpal1V5cZI/TnVYjjyf7lg
 76iTx4bSPrynO8TkFZtI895Pchxo2lSdS1X8s+7CfMga0ykvqaT1qZYXUex0Ps0VyPU8
 P+Dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I7/xJ1b6
Subject: [Buildroot] [PATCH v2] package/lpac: new package
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - add libqmi dependency for qrtr case

 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/lpac/Config.in | 16 ++++++++++++++++
 package/lpac/lpac.hash |  5 +++++
 package/lpac/lpac.mk   | 41 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 package/lpac/Config.in
 create mode 100644 package/lpac/lpac.hash
 create mode 100644 package/lpac/lpac.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 15389d530b..01ba341522 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3490,6 +3490,7 @@ F:	package/libuci/
 F:	package/libxmlb/
 F:	package/linux-firmware/
 F:	package/linux-serial-test/
+F:	package/lpac/
 F:	package/modem-manager/
 F:	package/ncftp/
 F:	package/nftables/
diff --git a/package/Config.in b/package/Config.in
index 167965d64b..44030c09f5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2553,6 +2553,7 @@ endif
 	source "package/linux-zigbee/Config.in"
 	source "package/linuxptp/Config.in"
 	source "package/lldpd/Config.in"
+	source "package/lpac/Config.in"
 	source "package/lrzsz/Config.in"
 	source "package/lynx/Config.in"
 	source "package/macchanger/Config.in"
diff --git a/package/lpac/Config.in b/package/lpac/Config.in
new file mode 100644
index 0000000000..6cfe11cc67
--- /dev/null
+++ b/package/lpac/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LPAC
+	bool "lpac"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite
+	depends on BR2_USE_MMU # pcsc-lite
+	depends on !BR2_STATIC_LIBS # pcsc-lite
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
+	select BR2_PACKAGE_PCSC_LITE
+	help
+	  C-based eUICC LPA.
+
+	  https://github.com/estkme-group/lpac
+
+comment "lpac needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/lpac/lpac.hash b/package/lpac/lpac.hash
new file mode 100644
index 0000000000..bf93ef245f
--- /dev/null
+++ b/package/lpac/lpac.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  3d87080a625b10430eebb82f89e2d24e16a84a8435a9c40b3718fd88c82028ba  lpac-2.2.1.tar.gz
+sha256  8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef  src/LICENSE
+sha256  b673293d21e887eaa9b971696b33f0f9141839900c65c83e560afa469d291ba6  euicc/LICENSE
+sha256  163766832b15cc9c90d593216360c67af579b8b36932b297fca2aeb61544de2f  cjson/LICENSE
diff --git a/package/lpac/lpac.mk b/package/lpac/lpac.mk
new file mode 100644
index 0000000000..3b0efc7c3a
--- /dev/null
+++ b/package/lpac/lpac.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# lpac
+#
+################################################################################
+
+LPAC_VERSION = 2.2.1
+LPAC_SITE = $(call github,estkme-group,lpac,v$(LPAC_VERSION))
+LPAC_LICENSE = LGPL-2.0+ (library), AGPL-3.0 (programs), MIT (cjson)
+LPAC_LICENSE_FILES = src/LICENSE euicc/LICENSE cjson/LICENSE
+LPAC_DEPENDENCIES = pcsc-lite
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LPAC_DEPENDENCIES += libcurl
+LPAC_CONF_OPTS += -DLPAC_WITH_HTTP_CURL=ON
+else
+LPAC_CONF_OPTS += -DLPAC_WITH_HTTP_CURL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBQMI),y)
+LPAC_DEPENDENCIES += libqmi
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_QMI=ON
+else
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_QMI=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
+LPAC_DEPENDENCIES += libqmi libqrtr-glib
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_QMI_QRTR=ON
+else
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_QMI_QRTR=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMBIM),y)
+LPAC_DEPENDENCIES += libmbim
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_MBIM=ON
+else
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_MBIM=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
