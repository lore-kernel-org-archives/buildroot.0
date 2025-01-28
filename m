Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13535C0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 17:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB91061050;
	Tue, 28 Jan 2025 17:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o28Uu93Q1HFF; Tue, 28 Jan 2025 17:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A260161049
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A260161049;
	Tue, 28 Jan 2025 17:02:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9757831
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 850F983A0C
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NxBkVoaTEQI for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 17:01:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 739B283A0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 739B283A0A
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 739B283A0A
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:01:57 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-84cdacbc3dbso428562239f.2
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 09:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738083716; x=1738688516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FcJY8rlLeguHjEVx2wx1hPE9ZmCGkS76T3poqoqJv4M=;
 b=aA1cY49FD/bJBoizvudmNcp7SAtOg+gPBbhg0DDQkqT729Qf0jfQrotjAePJFS/qz9
 qsqgDMc6zwou9gbPcOLOqDNdTwVddMzlVLx3NYd+9Xew7srIbG7ZPLBsHxA7uhxuyC8W
 e9O5GH4uRf8gvJA7egCOc9CKgDskAUw8vodLhKH01pcBAvuY/bYSWlDpFOGZBZ4OYDiM
 pAi6GefwyKIQ8R+kYYXGPrQz4VvuA09/q3qGKkq5WIsaiUEEhkvS+h+cRhPSQHl1vShE
 AKZ6r/jkwyTKJpepTLlqvLHWlR9aETOc+CBpSVW2qpVn/gDkHUwZixyc36HK8Ch3Tagh
 5ZBw==
X-Gm-Message-State: AOJu0YzyT0sPzaXuZbn5PJacyA9SJx3S26R4mavvpYYGg633Erybf9Ue
 iGeA9+IBXzWN3Zi+v2zjbXTR6nYcq3SDptF+0z0qVuUp8wR9wd38TIXbZz8e
X-Gm-Gg: ASbGncu1sm/6QCgSXE13UXbVnWh7lgaGIGZ7xGQGn8N0lTBVEmm5o11W37drEe9nnPP
 pcSeb2dQKoiOGEM9MHTVdMdPwQxL/Os1Vj5YSSvpkb/rKEGqoPrJO2wmLZTH7BiHOiTOlA6bEwf
 L11aWzMuLlTVTJqVBGPWqE8zfV9Wd4W92g0KAdW9z8Sn1N62U6ANAJxaoskK8ab+kHHogeaZDMr
 Vz+PnRO4O7STgFJjcnB0vxAopDhjwKOMBlUTc58v3OlvYg3VvPyJjXzcNi4kBM3LPekdnV3vfuG
 RnCM2GYjnRqki+8IHj8gVfaRnLUbDfXbhuqN28RTNqq3XUT03KSMtxed6T314fb3EA==
X-Google-Smtp-Source: AGHT+IGFrdklMAiqkhLJSoC8zoeosTC1h60Qhzh8DW/tfpCAFJFYPZL8uBLuQpNSNCE3qXmHHJthsQ==
X-Received: by 2002:a05:6602:6b12:b0:849:d268:d75 with SMTP id
 ca18e2360f4ac-851b627f520mr3466715839f.9.1738083715868; 
 Tue, 28 Jan 2025 09:01:55 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8521e035927sm343086739f.43.2025.01.28.09.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 09:01:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 28 Jan 2025 10:01:44 -0700
Message-Id: <20250128170153.2298242-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738083716; x=1738688516; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FcJY8rlLeguHjEVx2wx1hPE9ZmCGkS76T3poqoqJv4M=;
 b=grZdnw3r5RNijA95vyig/pxq72TpzEMGZbHKkV3PGsBDX5zLl6iTKMiabKT3M1dbGU
 +SeAlsE8Kt2fnn6Z0Xv5dd+6FHeHD5hfB0WcypsbBTlt5gS7QY67PuTWSoURfXlYekgb
 KwB37GJSthmlkONDFWy7m/ykdNUJmeZrxplQ0dxWMl8P91a4Muxu+Bo/p9V6GuBO9TMc
 yvDHFrjDyHy6frVDvEy3wYQNdGop4hSh0bZg+9VsNzHE3iJB3npIR6Sn/jIsqsBlHdFZ
 fu8ynQ6K5okpyMN5xFwJJ+1HEEUGwJy+UXEG7vBqQShuuvGEzZ/KiKUPUv9tveS2y25F
 wC0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=grZdnw3r
Subject: [Buildroot] [PATCH v8 01/10] package/cpuinfo: new package
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
index fde9360ad6..8e33b20bba 100644
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
