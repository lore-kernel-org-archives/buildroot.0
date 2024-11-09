Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC27D5E37A
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 17:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BED6605B7;
	Sat,  9 Nov 2024 17:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLDl5zZwuLlQ; Sat,  9 Nov 2024 17:55:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59AD3605CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59AD3605CB;
	Sat,  9 Nov 2024 17:55:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A7161C2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91D1040167
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QER-_ggRc6Vg for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 17:55:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F74B400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F74B400D0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F74B400D0
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:55:25 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F1EC6B00579;
 Sat,  9 Nov 2024 18:55:19 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Sat,  9 Nov 2024 18:55:08 +0100
Message-ID: <20241109175509.1364647-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731174922;
 bh=/nkULZz3eG+tlMEvImRWBmXq7U8vV98Zp1Ecvpsh1io=;
 h=From:To:Cc:Subject:Date:From;
 b=sbEJj5x+Z/EBLwZC5Axi0AIWZkwgugfLoKjG3B2O3WVQGB8U6BldtL51uEOcuU6Wy
 Yp3mCrmj2nPZRL67bq4QT4i+vLKSBg7plQBuEwwHR4YlFtcbOYDqdDSk+Nlbi0sUb0
 gRBK1H3eyFaSllmjlvpVCB/WdqKj9mJbbhM3j4Y2T1nBU+FnIO77cL1T31HuotcJLU
 L9XWwELAZwWNhHayMk5UaqNtlEhqFS1UOCRzrl8U4tkOdthyQ0QfNB99CgsS17KG7G
 z3pFFWeTn+hPziIvuTsJtwaDTvGzesEGwn/fF/vOvpuKNVQ3CKUtWp4mNsv9y8Q2sF
 qRtDLSdFYwZLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sbEJj5x+
Subject: [Buildroot] [PATCH 1/2] package/proj: add an option to build and
 install apps
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

The proj package includes command line applications. Those have always
been disabled in Buildroot. Those applications can be useful for
scripting, and also for runtime testing the libraries.

This commit adds a package Kconfig option to enable those apps.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/proj/Config.in | 12 ++++++++++++
 package/proj/proj.mk   |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/proj/Config.in b/package/proj/Config.in
index 6d172e2ee9..86966a4d10 100644
--- a/package/proj/Config.in
+++ b/package/proj/Config.in
@@ -14,6 +14,18 @@ config BR2_PACKAGE_PROJ
 
 	  http://proj4.org/
 
+if BR2_PACKAGE_PROJ
+
+config BR2_PACKAGE_PROJ_APPS
+	bool "build apps"
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Build and install proj command line apps. Those command line
+	  applications are: cct, cs2cs, geod, gie, invgeod, invproj,
+	  proj, projinfo, projsync.
+
+endif
+
 comment "proj needs a toolchain w/ C++, gcc >= 4.7, NPTL, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index a17a0a1feb..d6457b0e5b 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -20,7 +20,7 @@ PROJ_CXXFLAGS += -O0
 endif
 
 PROJ_CONF_OPTS = \
-	-DBUILD_APPS=OFF \
+	-DBUILD_APPS=$(if $(BR2_PACKAGE_PROJ_APPS),ON,OFF) \
 	-DCMAKE_C_FLAGS="$(PROJ_CFLAGS)" \
 	-DCMAKE_CXX_FLAGS="$(PROJ_CXXFLAGS)"
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
