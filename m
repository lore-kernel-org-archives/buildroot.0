Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81670C0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 17:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30323610B0;
	Tue, 28 Jan 2025 17:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMGzkMZMGXEi; Tue, 28 Jan 2025 17:02:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B39E6610B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B39E6610B3;
	Tue, 28 Jan 2025 17:02:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C0042AF7
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A351B413C5
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OurLoqtM5bhu for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 17:02:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6BA544139B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BA544139B
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BA544139B
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:00 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-844bff5ba1dso436640139f.1
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 09:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738083719; x=1738688519;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/g8mCFuunurc3rptVdmi9kg5yHatq+6hMslIOanp+VI=;
 b=dzOO9u4SS2Pus0C8AcsGrHj8bpCgpMD3TR03Ft5awthsD/E6jZmvycHFHy+cDgyWpZ
 WuuG2VVxyF50EyFnf+nbXfwfQwF/aEG9NBFb6PZ7650VdjoDZKbVcm68bxLrZBsvX4z9
 sSIrrOozrzHJgSsNYa1DCfbe8KYeaDugLpbeQ2CV4gcRLudgUUm6uU2/fQUCcSvdVkLh
 UY0Uo6Bl5aKAEQAqRyr/qGo0dvmQsr/DgQrlGgWa2RUqKJ6L7+M+dWKr4hR0S0ojMcra
 bzHOxQhaaU3HkpdLUTp7yA5AXtbsqaGPSXESabDh/VGIjozyJu3J8gGu5YttoHDcEd1y
 Qz/Q==
X-Gm-Message-State: AOJu0YxJ7iWoYhtkrFucQ8B+wrenWXAuCu50gtPUWLgvKcBZh7XhRWH+
 ps37Bpf0zlrT1owtOEDTj1G6YKQfhDRADVMOw4MItu62spJrmFHiBLkj3/Si
X-Gm-Gg: ASbGncsmzoIoNKZf0Dv5oYHbKQmiYA3DR/lsX/4B2HlMCPdgWL/sEPab6IyY4hEFz7+
 m1DPt6C0yPewIYZ6AIM9YdoC8p83KbN2jOOCBEkqo9jIQbKt8wr8mHkdPbtKg9ysGyXwHgWUcyC
 w4ehpJVXv86v96bUpuwuDLOG0KmzmcnRge059VdtSLvBIwVKPr4gOq0VlttipxUgv/BLJEF/GdE
 Vq0aUNkJUbDE7ErrktetbMEGGtOv7pwwgco2sr9JnSQeicAGRFMV/HhBr+SCllL5mVT50RzGqVQ
 bglKhmKPYZgEvw/ER/Yil2EZ2JrNBtgB/L+Yp3r4XnYs0ghyjDYrkB+C5tUlqkBStA==
X-Google-Smtp-Source: AGHT+IHjR+ANzjtly5a/QHuMgIqCu1U1AgVr03slbpx1DgpK/Os94NH1g+nWXabQh2hNunpGU0aChQ==
X-Received: by 2002:a05:6602:608b:b0:852:e746:5d3 with SMTP id
 ca18e2360f4ac-854110b5ec7mr4100439f.0.1738083718949; 
 Tue, 28 Jan 2025 09:01:58 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8521e035927sm343086739f.43.2025.01.28.09.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 09:01:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 28 Jan 2025 10:01:47 -0700
Message-Id: <20250128170153.2298242-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128170153.2298242-1-james.hilliard1@gmail.com>
References: <20250128170153.2298242-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738083719; x=1738688519; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/g8mCFuunurc3rptVdmi9kg5yHatq+6hMslIOanp+VI=;
 b=hdtAMRknYg4TvZusOtUCz3dORpoisyFKBy7MQrr96EaF+0Zj+0JhS5ArgUU+SUS3Hk
 FEQyrCDATIjPk6BLM6M6A9r74q4ikfFxW3cTfu54FKa5HOKlXUVQ0x0XqVAYqOACQOhi
 ujQVtSyBg5+jzvbw9Q8Kca8Mv43tJdTW3look3Y6zO7LzogM1mTjaIQrr6gLVapTcGcH
 WZgr2vSIs17mTjbWTi6rr/YWPki2WRYCp3kcnq2WANLTvT4JXiQAQLheYN2RJLPmHkj7
 nX/E3N8ItKTxCi528Ped0HEIm8IHUakfqcMO4ag6nhI5d9V/ihTjvo91WvmvSRrt937F
 n35Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hdtAMRkn
Subject: [Buildroot] [PATCH v8 04/10] package/pthreadpool: new package
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

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v6 -> v7:
  - update to latest version
Changes v5 -> v6:
  - update to latest version
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/pthreadpool/Config.in        |  8 +++++++
 package/pthreadpool/pthreadpool.hash |  4 ++++
 package/pthreadpool/pthreadpool.mk   | 33 ++++++++++++++++++++++++++++
 5 files changed, 47 insertions(+)
 create mode 100644 package/pthreadpool/Config.in
 create mode 100644 package/pthreadpool/pthreadpool.hash
 create mode 100644 package/pthreadpool/pthreadpool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f5abea5a16..b7d4958aec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3035,6 +3035,7 @@ F:	package/ti-gfx/
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
 F:	package/gemmlowp/
+F:	package/pthreadpool/
 F:	package/ruy/
 
 N:	Stefan Nickl <Stefan.Nickl@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 594ee41d06..13caddec34 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2297,6 +2297,7 @@ endif
 	source "package/protobuf/Config.in"
 	source "package/protobuf-c/Config.in"
 	source "package/protozero/Config.in"
+	source "package/pthreadpool/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
 	source "package/reproc/Config.in"
diff --git a/package/pthreadpool/Config.in b/package/pthreadpool/Config.in
new file mode 100644
index 0000000000..194ae33f85
--- /dev/null
+++ b/package/pthreadpool/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PTHREADPOOL
+	bool "pthreadpool"
+	select BR2_PACKAGE_FXDIV
+	help
+	  Pthreadpool is a portable and efficient thread pool
+	  implementation.
+
+	  https://github.com/Maratyszcza/pthreadpool
diff --git a/package/pthreadpool/pthreadpool.hash b/package/pthreadpool/pthreadpool.hash
new file mode 100644
index 0000000000..4adc1507f9
--- /dev/null
+++ b/package/pthreadpool/pthreadpool.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  8d8ebab96df6aa12922643060e72c43bfdca9fd80cf5aacaf7391bc6850560a3  pthreadpool-560c60d342a76076f0557a3946924c6478470044.tar.gz
+# License files, locally calculated
+sha256  57814a606b4d0fb087d9a534919084b6c11b58a4174cb5a4aef200187780dc3a  LICENSE
diff --git a/package/pthreadpool/pthreadpool.mk b/package/pthreadpool/pthreadpool.mk
new file mode 100644
index 0000000000..6a05256461
--- /dev/null
+++ b/package/pthreadpool/pthreadpool.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# pthreadpool
+#
+################################################################################
+
+PTHREADPOOL_VERSION = 560c60d342a76076f0557a3946924c6478470044
+PTHREADPOOL_SITE = $(call github,Maratyszcza,pthreadpool,$(PTHREADPOOL_VERSION))
+PTHREADPOOL_LICENSE = BSD-2-Clause
+PTHREADPOOL_LICENSE_FILES = LICENSE
+PTHREADPOOL_INSTALL_STAGING = YES
+PTHREADPOOL_DEPENDENCIES = fxdiv
+
+PTHREADPOOL_CFLAGS = $(TARGET_CFLAGS)
+PTHREADPOOL_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_PACKAGE_CPUINFO),y)
+PTHREADPOOL_DEPENDENCIES += cpuinfo
+PTHREADPOOL_CFLAGS += -DPTHREADPOOL_USE_CPUINFO=1
+PTHREADPOOL_CXXFLAGS += -DPTHREADPOOL_USE_CPUINFO=1
+else
+PTHREADPOOL_CFLAGS += -DPTHREADPOOL_USE_CPUINFO=0
+PTHREADPOOL_CXXFLAGS += -DPTHREADPOOL_USE_CPUINFO=0
+endif
+
+PTHREADPOOL_CONF_OPTS = \
+	-DCMAKE_C_FLAGS="$(PTHREADPOOL_CFLAGS)" \
+	-DCMAKE_CXX_FLAGS="$(PTHREADPOOL_CXXFLAGS)" \
+	-DFXDIV_SOURCE_DIR="$(FXDIV_DIR)" \
+	-DPTHREADPOOL_BUILD_TESTS=OFF \
+	-DPTHREADPOOL_BUILD_BENCHMARKS=OFF
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
