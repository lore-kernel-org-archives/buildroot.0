Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771F2D66B85
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 19:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4697F40D60;
	Wed, 17 Dec 2025 19:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfTH8sUPvxH6; Wed, 17 Dec 2025 19:24:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71DCB40EE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765999478;
	bh=umFZJPyDMeo20XJ/jxujBIAbbg/16E01nJmZQBdJclI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q61UXgFlGTiUuct4I40owvBK6uYG10yixjFhd+8/FJiammXZfiuEBvwoOGhSzKICS
	 o9iMbpmNQt9TcuHKtvVYWK2sZx5uUKSRV+wBMKZGgxUc+wAdg1wgK8PlMSCl3Xy8bd
	 OtnGErEe7vti2ZL4JWEoWQ3Xzilxma4QdNHe6Yo5ooYUMoZ5zpD48D1DqscwQejCvN
	 ns5QWuu19NW4JK97QYUkUGhnfIx4wJt2GETIyIodpVgtd1KmsS6IqmkKsMIRYr0kUy
	 0eWvDWFtzxQ1EO6YhgAtWS13xRJIfsJ6UcEG0vzCi+fQEX8c3oYodebBTYg2TJAijJ
	 E601wTtC9wilA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71DCB40EE2;
	Wed, 17 Dec 2025 19:24:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8A21361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D64F583B56
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tibi7vzP_h4H for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 19:24:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A17DE83B54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A17DE83B54
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A17DE83B54
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:24:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 819A9A4C4657;
 Wed, 17 Dec 2025 20:23:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51964)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVx7S-000000000pX-3IcM;
 Wed, 17 Dec 2025 19:23:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Gilles Talis <gilles.talis@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Jan Heylen <jan.heylen@nokia.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Simon Dawson <spdawson@gmail.com>, Ben Boeckel <mathstuf@gmail.com>
Date: Wed, 17 Dec 2025 20:23:16 +0100
Message-ID: <20251217192330.3769476-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217192330.3769476-1-bernd@kuhls.net>
References: <20251217192330.3769476-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765999411;
 bh=U3EEllWxaIuwyWxqWqZDPAlSn6kTCjIIX9j/Ee09j0s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=svaxSk+pOjRl6k9FRrFdQPWhAHJZxdUvX+MGFQlNn4YMzPclaKYR9joPZfOs/q7CI
 Tre37iF1Qyr4A1Qosg6mJb1VQnJKH/JWvyr1lu6FHX4iQAELoRS67SN3dNBPM4ZUE8
 +mMtik8vbF+ULTtiPq+ad1nW4UZndsS7TecygIHn40udNxkfoPBTVRsSwQTBEecBvI
 X0y9VtAupVlRk21/OZKZUH1Wa1pAJbaCxGnU2D7O72n64HrZPdQTUmDOPeJKeO+Cku
 qTOHm6qH5e64zdeiAYD8eCWUJi3vCVeg41RL7IM1V2LumVn4ix5qUXc0z8ri17h4DQ
 nBLAQmrPFcHRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=svaxSk+p
Subject: [Buildroot] [PATCH v3 05/18] package/hawktracer: remove package
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
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
index 8a4f26e72e..0b7d456e20 100644
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
index f2ff1a9c05..1de4c9467e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1258,7 +1258,6 @@ F:	package/cctz/
 F:	package/clpeak/
 F:	package/faad2/
 F:	package/fdk-aac/
-F:	package/hawktracer/
 F:	package/httping/
 F:	package/iozone/
 F:	package/leptonica/
diff --git a/package/Config.in b/package/Config.in
index 87c91e3439..85b7e02dcc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1949,7 +1949,6 @@ endmenu
 
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
