Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6F0CD1288
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 21:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 945D741E6A;
	Thu,  4 Apr 2024 21:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hODuIUYQ6gUN; Thu,  4 Apr 2024 21:06:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FE2F41E6C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FE2F41E6C;
	Thu,  4 Apr 2024 21:06:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93EF81BF361
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 21:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80A73610CE
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 21:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNRMRojreHZY for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 21:06:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D512610C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D512610C5
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D512610C5
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 21:06:45 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3434c6e1941so736235f8f.0
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 14:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712264802; x=1712869602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S4bffbvT4lg4UWLomm2qR5yIbQ1tHfnjIkp6BB1c8pg=;
 b=O+OD3cKh+1H4lxen61VYQqx30bZM/dy0bDElsh9Mj2j+Wjhg6QPbR4Mr8KaIEMhA9w
 Wv3xXoywoyOZhaWHhDIvOgeWspz+JCZLHLSLB8grl9j+Z4MfJ+A4PQMqiWHWn9uaoDm1
 NdHIG4B95JkfORPaGzoMnnEdQ0UuV8On+PtMfjcfFKtjIJxfRAiGJrcFwWDyK5DQDF58
 tzzQ99mVcR+6EvWigPaLFl2uMUSt+yoA3aRoG77XfQUliZrcnMEQR2IlO4s5aVr7RX1h
 M2yYej95qlFnw8yTeG1wxZHaZI2k5oEfEi4kq5dJhwz0WyDniSA2RSIq3/0ttSaCC7yy
 nUnA==
X-Gm-Message-State: AOJu0Yzo2Bdffm4mJoTB35tVbGrTQhdot0odiPDQASOcG4IIvPfjCh2t
 Xlgk1q+5TPBVcMuAf72f7ltHBDQDBWfp3uRTbCF1FMy9AqZ4AjWozEPCbm9H
X-Google-Smtp-Source: AGHT+IE9ofDXAjCDTF55+5NBkTxs/0RdsY5qHF0FzLk48rVHgknaoW/fTvVdiFxdzJGFg0SvCKY6rA==
X-Received: by 2002:adf:e3cb:0:b0:343:64ca:6cf1 with SMTP id
 k11-20020adfe3cb000000b0034364ca6cf1mr2653044wrm.61.1712264802562; 
 Thu, 04 Apr 2024 14:06:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e16-20020adff350000000b00343ca138924sm293939wrp.39.2024.04.04.14.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 14:06:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 23:06:40 +0200
Message-ID: <20240404210640.1926462-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712264802; x=1712869602; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S4bffbvT4lg4UWLomm2qR5yIbQ1tHfnjIkp6BB1c8pg=;
 b=KyiHCeMRmwoGeDVI3cLDNjc3w6pW3xLiuDxtxW8R2D0n6NpmZPOTOKj6u+InhYWi8m
 DwIMmaFdmHRgFQ5diiWUmZ56KK10XkZnMjAXFYVbFnYgcAdP65SlE1q5/5W9dgedHkU8
 O9Qf7brAv4G1kyJUBUEVbnGH53iXD9PfpZYFcBlHVSo+ll/Zn5qNLPpfBztKFzttToQ1
 GmF24YSTj1PX1wcW0iJXGCOXpZvorcineYmM+vagE/WwTOG9HQsN5q7s2KsbvrcEAnSg
 uPoScOPCw/CJ+2Y1hCn4wEKivqW/n5wKWDsOmbQW2tscHNzPlTyL2sBivV/sutvMoSHj
 Aigg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KyiHCeMR
Subject: [Buildroot] [PATCH 1/1] package/util-linux: add libxcrypt optional
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failures raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

configure: error: newgrp selected, but required crypt function not available

[...]

configure: error: sulogin selected, but required crypt function not available

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/961cd1221adf9ef8bfaff25b212351d10769c369
 - http://autobuild.buildroot.org/results/875a8d9ad76e844149d9a1c0c1983696e7313eff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/util-linux/Config.in                          | 2 ++
 package/util-linux/util-linux-libs/util-linux-libs.mk | 1 +
 package/util-linux/util-linux.mk                      | 1 +
 3 files changed, 4 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 73fa11380e..1f5dacec2f 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -280,6 +280,7 @@ config BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
 
 config BR2_PACKAGE_UTIL_LINUX_NEWGRP
 	bool "newgrp"
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Log in to a new group
 
@@ -402,6 +403,7 @@ comment "su needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library,
 config BR2_PACKAGE_UTIL_LINUX_SULOGIN
 	bool "sulogin"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Single-user login
 
diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index e1fe1ec191..0337e7e13a 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -24,6 +24,7 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
 UTIL_LINUX_LIBS_INSTALL_STAGING = YES
 UTIL_LINUX_LIBS_DEPENDENCIES = \
 	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(TARGET_NLS_DEPENDENCIES)
 UTIL_LINUX_LIBS_CONF_OPTS += \
 	--disable-rpath \
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index a9e5b0bf68..f2821978c5 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -37,6 +37,7 @@ UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs) \
 	$(TARGET_NLS_DEPENDENCIES)
 UTIL_LINUX_CONF_OPTS += \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
