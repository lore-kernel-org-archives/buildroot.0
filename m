Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4167C5B552
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 08:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CD4B4086F;
	Sun,  1 Jun 2025 08:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UIrZlQr71pot; Sun,  1 Jun 2025 08:46:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B491C41DDE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B491C41DDE;
	Sun,  1 Jun 2025 08:46:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A575222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F43A41DE9
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFdiQlVVnGAZ for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 08:46:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2BAFD407D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BAFD407D1
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BAFD407D1
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:30 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5532a30ac45so3523448e87.0
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 01:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748767588; x=1749372388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gSGYknjlBO6UPjYnWePlZbgn9fINQTtS0gZIY7YbvgI=;
 b=nETts3DT8n1K5lZqJQkYuF0vZS98+AH5STdmOcGFoON4SZaZSTh2b58uClHOxkknES
 +pJJ3/Y0iHckYHlP621fbTnEedoiPU+ZpPRPdaRKhK/zRNc8drROz4ciwwifJVKdn6E2
 F1f6WBk9Jm8Acn9IQjVBT8aa9p+losmqpRQLVPtXp2w6iGnkZJIB0iPWbQwdkv2gKs5/
 sUE/NjMzT4Y70oEwPFDd33wFG6UuUKHcL0fwgzpsnqGx+BQJBROq4zkCjCX80wVY9T7H
 nz8Mts33VJYiM2cFFhQE0GzqmOFv+kIKrb7c/d+l6yNv1RNEKlEzgMo64miUKJufoVYr
 fOFw==
X-Gm-Message-State: AOJu0Yw3J8MBX/PZ5R8mrukSxTHoaHPGWnf+5bMXPJTipQP2VIrO2INZ
 pTCkEQxCrFQ3znc56T2HChtUQz2p+i3+YPiSUW4RgiqRSTkTFVqV9pjTwcxS7A==
X-Gm-Gg: ASbGncsGgKveZbluUpMk6dycccRg9/3365UELiYN0Xf4oPgqgHwFMkld9P9GnIoFxBl
 kzIl+GwKIe+9K+xmzaswDXWjhzC7H7tNgNjAXPVw+O4nyilT/Y/w9fRWs9qL2jb7X7Cfie9sR0G
 7NW2hZOKCjhOITdfRKpVx2kr7k1d/AQmfJzlc+0uIhL9Di3uAJWYTfz4wm27Y8sPwk1Gxr6zbg9
 NXgjF3oAngXdqgyzLRxnaCjHO6LSLsexcCtA7tILa542qH3PgL7PfufFHw5jsQa5oSZEisownn9
 B1ZtaiPPtNj7iu2UfJ1BCY2QqDzAOhyeW7w1OP9z+yRa6u8cAhXW881cZVZvJ6RfXrp47nqnPRM
 wQFatqmeHnsJQeJfJ5x7mUI1dcJ4AlsY=
X-Google-Smtp-Source: AGHT+IEXcFe28YFMRMGWF5yFgYbr3XMPOTqke59tMHzZBDVisKvfzhb0A3sWlxkUKttSlJ9CP6qrog==
X-Received: by 2002:a05:6512:1327:b0:551:eb1b:f41d with SMTP id
 2adb3069b0e04-55335b45f8dmr4310131e87.27.1748767587808; 
 Sun, 01 Jun 2025 01:46:27 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55337937764sm1227020e87.231.2025.06.01.01.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 01:46:27 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 10:46:10 +0200
Message-ID: <20250601084616.3104736-4-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601084616.3104736-1-roykollensvendsen@gmail.com>
References: <20250601084616.3104736-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748767588; x=1749372388; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gSGYknjlBO6UPjYnWePlZbgn9fINQTtS0gZIY7YbvgI=;
 b=cSMat6ajm4ZKeQrvUIO/EEFVzslhpveBS9IJCWbusUL2UBQ0EaBbu83AYeaCyXv/O8
 eMGHI+NPa4IpMtLqS06M2E0SHr8krn23x0JyQmB+EzW3mHgpvQc7u+SyLuUd5wbvDY9D
 8no3t4ikqq2NRTXU2oLol8z/18U0pKzSYKYNV4YWQn3TPYMMY5JWAwPqLV8/96j2fDqz
 9hwO9MHaNsKyC0t499y1T8L0h++Pze30wE8wx2lk/BA3eDE7/gdNySqtjECSsjos+Qpj
 BN/uS9SNL9tLMcsmV0PUoogMNFnFM/sVe3W6RkfdjJbzvQ+PFgsilKvqFs6ZX2zNYYl3
 l2XQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cSMat6aj
Subject: [Buildroot] [PATCH 3/5] package/qt6/qt6tools: fix designer build
 failure
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

Fixes:
CMake Error at <...>/output/build/qt6base-6.8.1/cmake/QtPublicWalkLibsHelpers.cmake:267 (message):
  The Xml target is mentioned as a dependency for Designer, but not declared.
Call Stack (most recent call first):
  <...>/output/build/qt6base-6.8.1/cmake/QtPrlHelpers.cmake:8 (__qt_internal_walk_libs)
  <...>/output/build/qt6base-6.8.1/cmake/QtPrlHelpers.cmake:47 (qt_collect_libs)
  <...>/buildroot/output/build/qt6base-6.8.1/cmake/QtModuleHelpers.cmake:1027 (qt_generate_prl_file)
  <...>/buildroot/output/build/qt6base-6.8.1/cmake/QtScopeFinalizerHelpers.cmake:24:EVAL:1 (qt_finalize_module)
  src/designer/src/lib/CMakeLists.txt:DEFERRED

The above error can be triggered by the following defconfig:
BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_GUI=y
BR2_PACKAGE_QT6BASE_PNG=y
BR2_PACKAGE_QT6BASE_WIDGETS=y
BR2_PACKAGE_QT6TOOLS=y
BR2_PACKAGE_QT6TOOLS_LINGUIST=y

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6tools/Config.in   | 11 +++++++++++
 package/qt6/qt6tools/qt6tools.mk |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index 8fff08b3e6..5828715aa6 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -14,6 +14,17 @@ config BR2_PACKAGE_QT6TOOLS
 
 if BR2_PACKAGE_QT6TOOLS
 
+config BR2_PACKAGE_QT6TOOLS_DESIGNER
+	bool "designer"
+	select BR2_PACKAGE_QT6BASE_GUI # https://code.qt.io/cgit/qt/qttools.git/tree/src/designer/src/designer/CMakeLists.txt?h=6.8.1#n41
+	select BR2_PACKAGE_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n64
+	select BR2_PACKAGE_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n64
+	select BR2_PACKAGE_QT6BASE_WIDGETS # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n64
+	select BR2_PACKAGE_QT6BASE_XML # https://code.qt.io/cgit/qt/qttools.git/tree/src/designer/src/lib/CMakeLists.txt?h=6.8.1#n182
+	help
+	  Graphical tool for designing and building Qt user interfaces
+	  with a drag-and-drop editor.
+
 config BR2_PACKAGE_QT6TOOLS_LINGUIST
 	bool "linguist"
 	select BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS # lconvert is needed for linguist to build
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index 25cbb82c84..f5f2dc64b0 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -41,6 +41,12 @@ ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
 QT6TOOLS_DEPENDENCIES += qt6declarative
 endif
 
+ifeq ($(BR2_PACKAGE_QT6TOOLS_DESIGNER),y)
+QT6TOOLS_CONF_OPTS += -DFEATURE_designer=ON
+else
+QT6TOOLS_CONF_OPTS += -DFEATURE_designer=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6TOOLS_LINGUIST),y)
 QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
 else
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
