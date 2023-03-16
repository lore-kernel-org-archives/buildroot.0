Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB0CC6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 08:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A65C81321;
	Thu, 16 Mar 2023 08:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A65C81321
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kuNb0o_imqLe; Thu, 16 Mar 2023 08:35:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54AAD81329;
	Thu, 16 Mar 2023 08:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54AAD81329
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29A4D1BF3D5
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02DE681329
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02DE681329
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8HqWnqxz87oX for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 08:35:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB46E81321
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB46E81321
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 08:35:00 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id b5so469496iow.0
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 01:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678955699;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ejfGx3KL8ico0Of0qmuZnA9+LZavJOlW5yh5+737Nos=;
 b=WgwJcyqOj5glPF/XPJf2VRanTqfFTarYIxt4XYmvCGdJO3lX+Zgcke/ik8CYj/xLLu
 vbpnqgGc4xL9Q3PxfQH8XAyyy9G8+xoWY0j0OWQjdPqcdne3XWItsYQKAMkrFH/hqYyS
 8lQVLQVD7gVzi827KutmV+RgDIjZH6hnv0xNawkToy4OD7FkvLb9Z6dM4x/cfWihdxgS
 EweHytxMDDifAmLHwJ242BSGjShkHPHQb9te3Kv1gEt0fglbI6M/M3GRl1og1F17xdG+
 uALpFHkaeMtTtFVLBPF/2ASi39ujDclYz+RV9hVVp6QwhEKbagKQoxG/EDbZfYYjPMI6
 hOLA==
X-Gm-Message-State: AO0yUKU+2kcqD1twlVzezbReqzau/Md8tt5Sn1EgnE0bGAUR078TGoBt
 Vw4WWVavAXVNuk9e2qJsja+whTR43mGzMg==
X-Google-Smtp-Source: AK7set86aBAX1rOhJcN305jOyZPaq2L4DZVFicEeY/cd770vf+aIxYCkLl6FbEp5YQpwYRKfYJ+6kQ==
X-Received: by 2002:a5e:cb4d:0:b0:752:2f97:80bb with SMTP id
 h13-20020a5ecb4d000000b007522f9780bbmr5547153iok.19.1678955699625; 
 Thu, 16 Mar 2023 01:34:59 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 y34-20020a029525000000b003b331f0bbdfsm534630jah.97.2023.03.16.01.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:34:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 02:34:31 -0600
Message-Id: <20230316083440.3466725-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678955699;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ejfGx3KL8ico0Of0qmuZnA9+LZavJOlW5yh5+737Nos=;
 b=fPohuLuZ2cWpX6NwjdY8gKEJUSR9mfa8bWhNxR71+Z29+j/Wzyvjqghpng9FD3JS8T
 LJZxRbDdxdmBEysy6Avrsm3s8qqcx9sHtUaBRuUdrQfxO/dDtWGCkH8TxOiT9toIboZS
 3eW5IyhQhx3WzS2/jRG6IWqUm7Bi7rhr/CCXCiy35mUj4GY4G0xGQdqKYqylbKPCCQsT
 RmsO2bSYSPMhomF9lOxggbqliSnZQJQ8T0/kIVLiwsrk1k3Bn1zMxzaG05IwLfeMkyzi
 Lj9eRgHL4Al3KQXEOkb/AqE6pMh8MIGuVMnCoI9iIQrhCOPk5LthWkmBzBsCPVZbdt68
 6acQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fPohuLuZ
Subject: [Buildroot] [PATCH v6 01/10] package/cpuinfo: new package
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
Changes v5 -> v6:
  - update patch to latest pull request version
  - add architecture restrictions
  - update to latest commit
Changes v4 -> v5:
  - don't require cpp
Changes v2 -> v3:
  - move to libraries->hardware handling
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 ...nly-when-needed-for-tests-benchmarks.patch | 41 +++++++++++++++++++
 package/cpuinfo/Config.in                     | 17 ++++++++
 package/cpuinfo/cpuinfo.hash                  |  4 ++
 package/cpuinfo/cpuinfo.mk                    | 17 ++++++++
 6 files changed, 83 insertions(+)
 create mode 100644 package/cpuinfo/0001-Enable-CXX-only-when-needed-for-tests-benchmarks.patch
 create mode 100644 package/cpuinfo/Config.in
 create mode 100644 package/cpuinfo/cpuinfo.hash
 create mode 100644 package/cpuinfo/cpuinfo.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b6d288c54f..8ec32087a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2685,6 +2685,9 @@ F:	package/libvpx/
 F:	package/mesa3d-demos/
 F:	package/ti-gfx/
 
+N:	Stefan Hager <stefan.hager@ginzinger.com>
+F:	package/cpuinfo/
+
 N:	Stefan Ott <stefan@ott.net>
 F:	package/unbound/
 
diff --git a/package/Config.in b/package/Config.in
index 0f8dab3e71..60d6a115e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1664,6 +1664,7 @@ menu "Hardware handling"
 	source "package/bcm2835/Config.in"
 	source "package/c-periphery/Config.in"
 	source "package/ccid/Config.in"
+	source "package/cpuinfo/Config.in"
 	source "package/dtc/Config.in"
 	source "package/gnu-efi/Config.in"
 	source "package/hackrf/Config.in"
diff --git a/package/cpuinfo/0001-Enable-CXX-only-when-needed-for-tests-benchmarks.patch b/package/cpuinfo/0001-Enable-CXX-only-when-needed-for-tests-benchmarks.patch
new file mode 100644
index 0000000000..7aeef0edc0
--- /dev/null
+++ b/package/cpuinfo/0001-Enable-CXX-only-when-needed-for-tests-benchmarks.patch
@@ -0,0 +1,41 @@
+From 66dbf4fbe202318860caeab3b1ef9c2fe70e2c4c Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 29 Jan 2023 16:55:08 -0700
+Subject: [PATCH] Enable CXX only when needed for tests/benchmarks
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/pytorch/cpuinfo/pull/133]
+---
+ CMakeLists.txt | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9f4d1d1..9e1c153 100644
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
+@@ -103,6 +103,12 @@ ELSEIF(NOT CMAKE_SYSTEM_NAME MATCHES "^(Windows|WindowsStore|CYGWIN|MSYS|Darwin|
+   ENDIF()
+ ENDIF()
+ 
++IF(CPUINFO_SUPPORTED_PLATFORM)
++  IF(CPUINFO_BUILD_MOCK_TESTS OR CPUINFO_BUILD_UNIT_TESTS OR CPUINFO_BUILD_BENCHMARKS)
++    ENABLE_LANGUAGE(CXX)
++  ENDIF()
++ENDIF()
++
+ # ---[ Download deps
+ SET(CONFU_DEPENDENCIES_SOURCE_DIR ${CMAKE_SOURCE_DIR}/deps
+   CACHE PATH "Confu-style dependencies source directory")
+-- 
+2.34.1
+
diff --git a/package/cpuinfo/Config.in b/package/cpuinfo/Config.in
new file mode 100644
index 0000000000..257480f068
--- /dev/null
+++ b/package/cpuinfo/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_i386
+	default y if BR2_x86_64
+
+config BR2_PACKAGE_CPUINFO
+	bool "cpuinfo"
+	depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  CPU INFOrmation library, cpuinfo is a library to detect
+	  essential for performance optimization information about
+	  host CPU.
+
+	  https://github.com/pytorch/cpuinfo
diff --git a/package/cpuinfo/cpuinfo.hash b/package/cpuinfo/cpuinfo.hash
new file mode 100644
index 0000000000..7dd0d57172
--- /dev/null
+++ b/package/cpuinfo/cpuinfo.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  cf243e7ac07cd5e2ac58dcb29f8a9047b7887452212aead2ddf1ceda45cc66dd  cpuinfo-eb4a6674bfe9cf91b63b9817412ae5f6862c8432.tar.gz
+# License files, locally calculated
+sha256  8e7e60636c3aa0cb03571a1a841ce5697f9551ff92b3c426c2561613d15ade70  LICENSE
diff --git a/package/cpuinfo/cpuinfo.mk b/package/cpuinfo/cpuinfo.mk
new file mode 100644
index 0000000000..d59513eea3
--- /dev/null
+++ b/package/cpuinfo/cpuinfo.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# cpuinfo
+#
+################################################################################
+
+CPUINFO_VERSION = eb4a6674bfe9cf91b63b9817412ae5f6862c8432
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
