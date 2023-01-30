Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5312C54EED
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 00:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B596817C3;
	Mon, 30 Jan 2023 00:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B596817C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BbNccknbjYq4; Mon, 30 Jan 2023 00:29:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 703FB817E4;
	Mon, 30 Jan 2023 00:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 703FB817E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 131E51BF869
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA44B40585
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA44B40585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 49iMCjupugJz for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 00:29:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D78140220
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D78140220
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 00:29:02 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id q6so1245228ior.12
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:29:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U/3lvft9edmDpME2GpkPPGZyjrHfe5++eUrlTNWLA+k=;
 b=raGNOD/NDqZodh8Dw7U4VCbT8znIeK7i2Uq3Gicijd1b2w5e1SRh7ju4g3Irj38uv/
 Y3odf5Acq+wNw82v6aWn9PuvQ3S8HUADA69Vl9DORJ+roJty95TP4E8SYYjb230Wg53z
 bnejbbunra7WpYKRxMZpsoCytvg9l8bIN+zLpZSSnHX1KAl+depCN/ZgaUmbvCNRN15K
 VODa12LscqZtvjCTBrJ17+Z3xXwE//1sm5QbIHsmxc06xowKkizVo7WR5vUz3WKyWxMz
 EBvtDuVnAdaB+wVFOrkfhT905X7j2Zj8KembBJd4qBumdDCV+dpHDD2v65rm1Jav+qsN
 1E4g==
X-Gm-Message-State: AFqh2ko3F+BCQZfcOJXmZD/qHAAp6MHc3z+lz424GbiwSMRZLc1GtJdp
 Jk/FkfcwaIUbqBNTWTLJ52TnZpyVYzsu0g==
X-Google-Smtp-Source: AMrXdXv6H1LAAWVvrtEvSVoRQCjKRTcwHbOIxut3vA6GWJJRb/j+dJhQ4nbsxJHmZzqczoR0AIjY5A==
X-Received: by 2002:a5d:9158:0:b0:707:e4ef:deb0 with SMTP id
 y24-20020a5d9158000000b00707e4efdeb0mr14462820ioq.16.1675038540871; 
 Sun, 29 Jan 2023 16:29:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 q4-20020a02c8c4000000b00363d6918540sm1676570jao.171.2023.01.29.16.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 16:29:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:28:45 -0700
Message-Id: <20230130002854.2300661-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U/3lvft9edmDpME2GpkPPGZyjrHfe5++eUrlTNWLA+k=;
 b=A7mJhkn6lL2vtktQNvqkrXIsSaj6nI267RGu39Y0tC+jlT2qi4Mof5UfTp4zW7UUxT
 NO0Ac3n1GB2JGnxlJDL5BvAx/aVw1LyyCmyWMB+QvDj7pocQ70RFxGeGrbmaihQyTL+K
 FPF7Hm6JS9Dku1o1dnKOR0+y5hs0XuvU4Y7MruyfLQH8XJBxCBxXKFKoX/vt7wtFXISo
 cbCwBkHID3CkuoF7yRR7LAUF8A3B2m2CBoqtGDseDDdWOLagih8Rkznjd7QARn58yoMB
 h+UBoqT09oUYPITwz7fR6GHPncznkcNhm598Ypf5UCphg4caa5H/7PDxkLW8uzWVHkM3
 qVvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=A7mJhkn6
Subject: [Buildroot] [PATCH v5 01/10] package/cpuinfo: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Hager <stefan.hager@ginzinger.com>

This package is required by tensorflow-lite.

Add a patch removing cpp requirement when not building tests.

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v4 -> v5:
  - don't require cpp
Changes v2 -> v3:
  - move to libraries->hardware handling
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 ...nable-CXX-only-when-needed-for-tests.patch | 36 +++++++++++++++++++
 package/cpuinfo/Config.in                     |  8 +++++
 package/cpuinfo/cpuinfo.hash                  |  4 +++
 package/cpuinfo/cpuinfo.mk                    | 17 +++++++++
 6 files changed, 69 insertions(+)
 create mode 100644 package/cpuinfo/0001-Enable-CXX-only-when-needed-for-tests.patch
 create mode 100644 package/cpuinfo/Config.in
 create mode 100644 package/cpuinfo/cpuinfo.hash
 create mode 100644 package/cpuinfo/cpuinfo.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 706ee80ece..53f1052b07 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2723,6 +2723,9 @@ F:	package/libvpx/
 F:	package/mesa3d-demos/
 F:	package/ti-gfx/
 
+N:	Stefan Hager <stefan.hager@ginzinger.com>
+F:	package/cpuinfo/
+
 N:	Stefan Ott <stefan@ott.net>
 F:	package/unbound/
 
diff --git a/package/Config.in b/package/Config.in
index 83fddf316f..3a07074b10 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1645,6 +1645,7 @@ menu "Hardware handling"
 	source "package/bcm2835/Config.in"
 	source "package/c-periphery/Config.in"
 	source "package/ccid/Config.in"
+	source "package/cpuinfo/Config.in"
 	source "package/dtc/Config.in"
 	source "package/gnu-efi/Config.in"
 	source "package/hackrf/Config.in"
diff --git a/package/cpuinfo/0001-Enable-CXX-only-when-needed-for-tests.patch b/package/cpuinfo/0001-Enable-CXX-only-when-needed-for-tests.patch
new file mode 100644
index 0000000000..ebd6ed36cd
--- /dev/null
+++ b/package/cpuinfo/0001-Enable-CXX-only-when-needed-for-tests.patch
@@ -0,0 +1,36 @@
+From b1261baefd2bb9095af56859c1cac6b1166fb13f Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 29 Jan 2023 16:55:08 -0700
+Subject: [PATCH] Enable CXX only when needed for tests
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/pytorch/cpuinfo/pull/133]
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b2f9434..879c9fa 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,7 +3,7 @@ CMAKE_MINIMUM_REQUIRED(VERSION 3.5 FATAL_ERROR)
+ # ---[ Setup project
+ PROJECT(
+     cpuinfo
+-    LANGUAGES C CXX
++    LANGUAGES C
+     )
+ 
+ # ---[ Options.
+@@ -763,6 +763,7 @@ ENDIF()
+ 
+ # ---[ cpuinfo unit tests
+ IF(CPUINFO_SUPPORTED_PLATFORM AND CPUINFO_BUILD_UNIT_TESTS)
++  ENABLE_LANGUAGE(CXX)
+   ADD_EXECUTABLE(init-test test/init.cc)
+   CPUINFO_TARGET_ENABLE_CXX11(init-test)
+   CPUINFO_TARGET_RUNTIME_LIBRARY(init-test)
+-- 
+2.34.1
+
diff --git a/package/cpuinfo/Config.in b/package/cpuinfo/Config.in
new file mode 100644
index 0000000000..d3c3b08400
--- /dev/null
+++ b/package/cpuinfo/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CPUINFO
+	bool "cpuinfo"
+	help
+	  CPU INFOrmation library, cpuinfo is a library to detect
+	  essential for performance optimization information about
+	  host CPU.
+
+	  https://github.com/pytorch/cpuinfo
diff --git a/package/cpuinfo/cpuinfo.hash b/package/cpuinfo/cpuinfo.hash
new file mode 100644
index 0000000000..c3f70fa90f
--- /dev/null
+++ b/package/cpuinfo/cpuinfo.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  0936848904943381b2c01321101614776e43d583840ee0f3ceeea1e3fb7405f7  cpuinfo-de2fa78ebb431db98489e78603e4f77c1f6c5c57.tar.gz
+# License files, locally calculated
+sha256  8e7e60636c3aa0cb03571a1a841ce5697f9551ff92b3c426c2561613d15ade70  LICENSE
diff --git a/package/cpuinfo/cpuinfo.mk b/package/cpuinfo/cpuinfo.mk
new file mode 100644
index 0000000000..ab6a0269ec
--- /dev/null
+++ b/package/cpuinfo/cpuinfo.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# cpuinfo
+#
+################################################################################
+
+CPUINFO_VERSION = de2fa78ebb431db98489e78603e4f77c1f6c5c57
+CPUINFO_SITE = $(call github,pytorch,cpuinfo,$(CPUINFO_VERSION))
+CPUINFO_LICENSE = BSD-2-Clause
+CPUINFO_LICENSE_FILES = LICENSE
+CPUINFO_INSTALL_STAGING = YES
+CPUINFO_CONF_OPTS = \
+	-DCPUINFO_BUILD_UNIT_TESTS=OFF \
+	-DCPUINFO_BUILD_MOCK_TESTS=OFF \
+	-DCPUINFO_BUILD_BENCHMARKS=OFF
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
