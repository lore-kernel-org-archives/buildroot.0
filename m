Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6042BE92FCB
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 18:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37B0560B71;
	Mon, 29 Dec 2025 18:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1taxnxAJJlV; Mon, 29 Dec 2025 18:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4089560B73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767031293;
	bh=BuvZ+MVirUgIzEbVuogD6go+uALzIAuLf8xjWA9u4sk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=glQzSNP+ADSP6EE+Dmie2o7ngGdxHICpmA4DtZ1/xyGa/ljRV73uTW45asp47Cl/M
	 upS9xWaCF+B88sERqBvx6djT1+RwTYT77QjRkFG6/uqWG65rveWvj7gvVq4Z7XvfTs
	 A1bL6CjVb8oZYAzS6/1EWxTcl3TheZd1LYuNbx/Siby7qc32NtGy0P2mtFokI2dcr3
	 Ql2SeuMjNvqhYrvM/NskzhARbB0m1Z5qc3TOMPGCUf21qj1ly7I08qi6pye2eaV49W
	 TJjSe/OSi/0S7x6yl5nACMXRakkzJDrCwxtI4DO22iekYlCELdWhJ5Nwul9fn/DylH
	 fAQMW18enZPhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4089560B73;
	Mon, 29 Dec 2025 18:01:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 72B6A177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58EE7405B3
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQzkD3xpMMyp for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 18:01:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0BCB3400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BCB3400BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BCB3400BA
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:01:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22958A4C25A2;
 Mon, 29 Dec 2025 18:59:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53686)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHWt-000000002P5-2P9c;
 Mon, 29 Dec 2025 17:59:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Gilles Talis <gilles.talis@gmail.com>
Date: Mon, 29 Dec 2025 18:59:13 +0100
Message-ID: <20251229175938.3549882-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175938.3549882-1-bernd@kuhls.net>
References: <20251229175938.3549882-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767031187;
 bh=YO4P5cbJFGUqa96veMnSERtnPhD1bDLU2bYNsCOLE6o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LH14j0vNaI3p1oykv6Ip4Hw24GDJODX4/vJi98PVc5c5HFSZivTszxFxY8NelOCRb
 IHSht/yC+FjjnJbwTEx1dyBhoIwh1ExlsLIjvI6M5Cm9LtuxDw+gorU7nD/3Z9STl/
 Trv0QEwYYwYH/rXKwwCPp7YAJ50plq5/MX2eJ+zq4mryB+3VJzZBiOZGsOG1AY1UMi
 Hd6Ys5kyixeJLeHJbV124F7sCReNkvNB3nfW7U6pvwXd8mHZsL10yifwX/aU2Mm7jv
 k77C3MaDR3CKTDCCGrF2RrI9UHFcl4A8RgzpE3Uw8O+KHQymTxxTk/Glrudyi1mxg3
 9NBbx0rKZ82oA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LH14j0vN
Subject: [Buildroot] [PATCH v8 05/29] package/hawktracer: remove package
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

Analysis of https://github.com/amzn/hawktracer:
last commit: Aug 2023
last bug report: Nov 2023
last pull request: Nov 2020

The package is broken with cmake 4 and no other package depends on it.

Fixes:
https://autobuild.buildroot.net/results/c86/c86d4b2127f09f57c83bbc81bfec847055b67ae7/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Gilles Talis <gilles.talis@gmail.com>
---
 Config.in.legacy                   |  6 ++++
 DEVELOPERS                         |  1 -
 package/Config.in                  |  1 -
 package/hawktracer/Config.in       | 25 ----------------
 package/hawktracer/hawktracer.hash |  3 --
 package/hawktracer/hawktracer.mk   | 48 ------------------------------
 6 files changed, 6 insertions(+), 78 deletions(-)
 delete mode 100644 package/hawktracer/Config.in
 delete mode 100644 package/hawktracer/hawktracer.hash
 delete mode 100644 package/hawktracer/hawktracer.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 94d1c4ea08..e0ada2e10d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_HAWKTRACER
+	bool "hawktracer has been removed"
+	select BR2_LEGACY
+	help
+	  hawktracer is unmaintained and has been removed
+
 config BR2_PACKAGE_CONNMAN_GTK
 	bool "connman-gtk has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 3a0b2aafa2..44b1e97020 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1262,7 +1262,6 @@ F:	package/cctz/
 F:	package/clpeak/
 F:	package/faad2/
 F:	package/fdk-aac/
-F:	package/hawktracer/
 F:	package/httping/
 F:	package/iozone/
 F:	package/leptonica/
diff --git a/package/Config.in b/package/Config.in
index 06e3782e87..b6e6a31b14 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1952,7 +1952,6 @@ endmenu
 
 menu "Logging"
 	source "package/glog/Config.in"
-	source "package/hawktracer/Config.in"
 	source "package/liblog4c-localtime/Config.in"
 	source "package/liblogging/Config.in"
 	source "package/log4cplus/Config.in"
diff --git a/package/hawktracer/Config.in b/package/hawktracer/Config.in
deleted file mode 100644
index bee9c27b7d..0000000000
--- a/package/hawktracer/Config.in
+++ /dev/null
@@ -1,25 +0,0 @@
-config BR2_PACKAGE_HAWKTRACER
-	bool "hawktracer"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
-	help
-	  HawkTracer is a highly portable, low-overhead, configurable
-	  profiling tool built in Amazon Video for getting performance
-	  metrics from low-end devices.
-
-	  https://hawktracer.github.io/
-
-if BR2_PACKAGE_HAWKTRACER
-
-config BR2_PACKAGE_HAWKTRACER_TCP_LISTENER
-	bool "TCP listener"
-	default y
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-
-comment "TCP listener needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-endif
-
-comment "hawktracer needs a toolchain w/ C++, gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/hawktracer/hawktracer.hash b/package/hawktracer/hawktracer.hash
deleted file mode 100644
index 585b612c49..0000000000
--- a/package/hawktracer/hawktracer.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Computed locally
-sha256  12a689a1cfb2ae25ad777b1b2275dbba5cd64905627b0a20d17d6e26de003cef  hawktracer-0.11.0.tar.gz
-sha256  2f377333e64ad08ad3afec8ed6c2c96ced2a6d7d67443eb2784a931bb7b3fd59  LICENSE
diff --git a/package/hawktracer/hawktracer.mk b/package/hawktracer/hawktracer.mk
deleted file mode 100644
index 8e722080f5..0000000000
--- a/package/hawktracer/hawktracer.mk
+++ /dev/null
@@ -1,48 +0,0 @@
-################################################################################
-#
-# hawktracer
-#
-################################################################################
-
-HAWKTRACER_VERSION = 0.11.0
-HAWKTRACER_SITE = $(call github,amzn,hawktracer,v$(HAWKTRACER_VERSION))
-HAWKTRACER_LICENSE = MIT
-HAWKTRACER_LICENSE_FILES = LICENSE
-HAWKTRACER_INSTALL_STAGING = YES
-
-HAWKTRACER_CONF_OPTS = \
-	-DENABLE_ASAN=OFF \
-	-DENABLE_TESTS=OFF \
-	-DENABLE_CODE_COVERAGE=OFF \
-	-DENABLE_BENCHMARKS=OFF \
-	-DENABLE_DOC=OFF \
-	-DENABLE_PYTHON_BINDINGS=OFF \
-	-DENABLE_MAINTAINER_MODE=OFF \
-	-DENABLE_RELEASE_MODE=OFF \
-	-DENABLE_CLIENT=OFF \
-	-DENABLE_EXAMPLES=OFF
-
-ifeq ($(BR2_STATIC_LIBS),y)
-HAWKTRACER_CONF_OPTS += -DBUILD_STATIC_LIB=ON
-else
-HAWKTRACER_CONF_OPTS += -DBUILD_STATIC_LIB=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_HAWKTRACER_TCP_LISTENER),y)
-HAWKTRACER_CONF_OPTS += -DENABLE_TCP_LISTENER=ON
-else
-HAWKTRACER_CONF_OPTS += -DENABLE_TCP_LISTENER=OFF
-endif
-
-# Enable threads support if supported by toolchain
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-HAWKTRACER_CONF_OPTS += \
-	-DENABLE_CPU_USAGE_FEATURE=ON \
-	-DENABLE_THREADS=ON
-else
-HAWKTRACER_CONF_OPTS += \
-	-DENABLE_CPU_USAGE_FEATURE=OFF \
-	-DENABLE_THREADS=OFF
-endif
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
