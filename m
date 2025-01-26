Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541CDC02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 15:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02FC060BDD;
	Sun, 26 Jan 2025 15:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POWUa70g9Hf0; Sun, 26 Jan 2025 15:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F053860C17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F053860C17;
	Sun, 26 Jan 2025 15:47:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AB9294A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4626560C17
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBlS9hRcEWVB for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 15:47:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 417FF6072B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 417FF6072B
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 417FF6072B
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:41 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a7dd54af4bso8548305ab.2
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 07:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737906460; x=1738511260;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TVcUfgN+jHIrXSxAV+o7E1TkecyVQOkPGH8EMJr9XxM=;
 b=VYauCiR5ouxnW5G6ldQjY/jutyHkyzkrrmsfurlr8qQ7c9qxbaLxsq0QO2CJInxtoT
 LK/gqh83qxpgXZaklIWV5PtWClPhM8gIgwhTsHNPIHl6ag9yo1C2+WP9qoSY3iJ8fPgr
 7Su3eg1z5Zh4ZPbh5rGFgMmW9xmlfQLzrcDdLwnufs918Zj6G48ur2Kji2V7oiC9zLoQ
 1skD8RRjMQGPBE+mzLPcWGzMAtlk4sLDfwh2qWEd3ZJzUPZmazkNG/NxDu3kb2Dc1ebC
 AWEVHUT4b7rCVisd7MOcWPpthbcRKYpnJDzjzTEJ0y03yxvm+Ksp0l2UpYDYBR1qUNZo
 P4EQ==
X-Gm-Message-State: AOJu0YwheY2AiwuzPRPqVOI2uCF3ZTvPRyqUaTzECaRRUqBnPaDZf7s/
 94BLXuUKNNnBzeCf0hZT11MBcWScv9A/DpNDi+jDuIM6KwzYgGchcvr2BCTR
X-Gm-Gg: ASbGnct4FmOv66Az2cioP5qIz8Cw467VKF6Bqey1e6iOO5DStS5rBXvKnOZs7OC+5cY
 p/DFT4+rIW9dPca0UwRb7YkuYDSkLMf+aQB2FfKVBDmqfDpvoCNTQOWelQ7B/1VgOba1ezJwj28
 nZ7qAJ93Wh4tNRC3Thw7uLiKMRblxVc9n16yvoKkeD3ERyDm9lmptD65J/4aazjpquZ6D19qzTM
 qWFHZq8emwdOYS5kcAg+ISI5YwK8teaU0wYbZCzgEyq03ivthcNdzLcXjqEP+kZ1Eadt9aeRHtY
 njLX0Ovs/YW6kCyCPYmNTudZ+PHKg9Cubw1rTKjHfGAmcAKrUSi9XoU=
X-Google-Smtp-Source: AGHT+IF/LeQ80JZzxsK69EIcJBTU1PzvVHJodRj3kiCbm7KwjIF8NgK9AOzNNOBU2bbzErNic2u1FQ==
X-Received: by 2002:a05:6e02:1d1e:b0:3ce:6cb7:1e6 with SMTP id
 e9e14a558f8ab-3cf74406999mr251187485ab.10.1737906459850; 
 Sun, 26 Jan 2025 07:47:39 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc74ea0afsm20900715ab.47.2025.01.26.07.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 07:47:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 26 Jan 2025 08:47:23 -0700
Message-Id: <20250126154732.405055-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737906460; x=1738511260; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TVcUfgN+jHIrXSxAV+o7E1TkecyVQOkPGH8EMJr9XxM=;
 b=mnX302h8Mvz+aTBDz4iAVmLO85RYnSde0vkHXgX6F8/gao6kSKwKQTwAF5w/n7vpQw
 2Tiuq3A6DPi4K0p/ZDy2VI+ezrXX4hYlYUdqCxl1QhLBrVQua8+3npjupl9PP0trgyCU
 Vco/+gfW10r6XMMEjRMg8CDlSy/UteOsymi4lpqqyPr363EFHGVhy8/iW3ipD973Zsqm
 e4/gdNV6k1v4bjpyroz1ViEKTrajWVOGYON94UOQXDJml9hyPbymMES0Zx+3PntD54U5
 3/YO+ygPmx+v8w3oJprSfGhCmQioppaHSaLyAB+t1A5N4NsF6E4oqAiZIgIuQo0VuLYL
 MUnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mnX302h8
Subject: [Buildroot] [PATCH v7 01/10] package/cpuinfo: new package
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

From: Stefan Hager <stefan.hager@ginzinger.com>

This package is required by tensorflow-lite.

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v6 -> v7:
  - update to latest commit
  - drop patch which is now upstream
Changes v5 -> v6:
  - update patch to latest pull request version
  - add architecture restrictions
  - update to latest commit
Changes v4 -> v5:
  - don't require cpp
Changes v2 -> v3:
  - move to libraries->hardware handling
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/cpuinfo/Config.in    | 17 +++++++++++++++++
 package/cpuinfo/cpuinfo.hash |  4 ++++
 package/cpuinfo/cpuinfo.mk   | 17 +++++++++++++++++
 5 files changed, 42 insertions(+)
 create mode 100644 package/cpuinfo/Config.in
 create mode 100644 package/cpuinfo/cpuinfo.hash
 create mode 100644 package/cpuinfo/cpuinfo.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ff069b9c40..0c741ee2a3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3032,6 +3032,9 @@ F:	package/libvpx/
 F:	package/mesa3d-demos/
 F:	package/ti-gfx/
 
+N:	Stefan Hager <stefan.hager@ginzinger.com>
+F:	package/cpuinfo/
+
 N:	Stefan Nickl <Stefan.Nickl@gmail.com>
 F:	board/freescale/imx8dxlevk/
 F:	configs/freescale_imx8dxlevk_defconfig
diff --git a/package/Config.in b/package/Config.in
index 3f4dd42cbe..70ad2af568 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1801,6 +1801,7 @@ menu "Hardware handling"
 	source "package/bcm2835/Config.in"
 	source "package/c-periphery/Config.in"
 	source "package/ccid/Config.in"
+	source "package/cpuinfo/Config.in"
 	source "package/dtc/Config.in"
 	source "package/gnu-efi/Config.in"
 	source "package/hackrf/Config.in"
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
index 0000000000..499363cd09
--- /dev/null
+++ b/package/cpuinfo/cpuinfo.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  37bb2fd2d1e87102baea8d131a0c550c4ceff5a12fba61faeb1bff63868155f1  cpuinfo-8a1772a0c5c447df2d18edf33ec4603a8c9c04a6.tar.gz
+# License files, locally calculated
+sha256  8e7e60636c3aa0cb03571a1a841ce5697f9551ff92b3c426c2561613d15ade70  LICENSE
diff --git a/package/cpuinfo/cpuinfo.mk b/package/cpuinfo/cpuinfo.mk
new file mode 100644
index 0000000000..0aafb1b4dd
--- /dev/null
+++ b/package/cpuinfo/cpuinfo.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# cpuinfo
+#
+################################################################################
+
+CPUINFO_VERSION = 8a1772a0c5c447df2d18edf33ec4603a8c9c04a6
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
