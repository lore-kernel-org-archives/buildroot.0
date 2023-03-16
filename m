Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C8AC6FD19
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 08:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0274581F16;
	Thu, 16 Mar 2023 08:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0274581F16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id scjG8c-m0kt0; Thu, 16 Mar 2023 08:36:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A4B981F2A;
	Thu, 16 Mar 2023 08:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A4B981F2A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60BF71BF3D5
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C1D5402C3
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C1D5402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IBMdwzgUEkjB for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 08:35:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32E3140220
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32E3140220
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 08:35:05 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id bp11so589403ilb.3
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 01:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678955704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Cc94vvj6E6WXnIdYmgxfrMKZsthMeTNXsD8GKMfEPo=;
 b=MaqYt7ivZ2IuYHqp1gWfTq2jezqgry44R7zNY2kZXSHWJMlK7Oz+pA8+pB1NT3Jg7a
 1EAh9ViZMmZVO8MuBzLUf4i4BHwrboHsgWaBOFchH5IXcXbfneKh+GkXbt3L0uMeSTzD
 Asqhc9fae34yk/hmUhH7tFy6USPmTjYafUKENDN30r6/900FP526bc+adhPVeVOWLPt7
 BrLJl5nP6FGtxxHrvq9aRl0vN0lCQO81x4so4jVu5SrWSQabIIfRJbrJveezuh/0+zxS
 GMqZLZ80/Gl6vLOJrUX9X06/Lry7Q769IuhD/3gCZKZsmPneMQFo1vb9XWQ9VQNUUVbg
 No2w==
X-Gm-Message-State: AO0yUKU2EDZJFaYMN78nSxqu6POugqfSKAE2YTXqSyutZ5/NGosMqMQi
 hn872CSeKODPmsNsXEycMew+USokq9quWA==
X-Google-Smtp-Source: AK7set+ZYrR5CwwfuAV+TOcFB3mc/zvt4ndT0/TOm1JcwikjV9bm37z6/idS0XSIyOtjBz4s7Of1bw==
X-Received: by 2002:a92:c909:0:b0:318:a974:ab4a with SMTP id
 t9-20020a92c909000000b00318a974ab4amr6638872ilp.6.1678955703997; 
 Thu, 16 Mar 2023 01:35:03 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 y34-20020a029525000000b003b331f0bbdfsm534630jah.97.2023.03.16.01.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:35:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 02:34:37 -0600
Message-Id: <20230316083440.3466725-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316083440.3466725-1-james.hilliard1@gmail.com>
References: <20230316083440.3466725-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678955704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Cc94vvj6E6WXnIdYmgxfrMKZsthMeTNXsD8GKMfEPo=;
 b=AuwYbAUpOccNyO3Wz4mOXNGrL7tzIpHILuxvP8qzSQRpaL+z44gPKxEgc2e39/vZEY
 ZzkSjXsgrCTfdrOLzm0JMFgef0/BH+U+NMeztqKMc5SFXcMPDpfq7oZDv1tOQG9rswNE
 zfgkmMV2oay2Dok7gV4w4fuqIvW0feHwlMeRu3F+Tlw/UQhu2+WZMBlS74r+R5jbEw6q
 +rECnondUNNj8hQY47bCDj/bPovXwNWDQINVpKtty2uBcu75v+AJ7dVgWOLy4asgI+C5
 xSRgdpwAedM5Ec7RRLOQ6vAygqlrJg1eGqFi9x5hr13dePqm9ph1daqkHI6cHNAlmp5v
 cCcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AuwYbAUp
Subject: [Buildroot] [PATCH v6 07/10] package/xnnpack: new package
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

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v5 -> v6:
  - add architecture dependency
  - update to latest version
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/xnnpack/Config.in    | 27 +++++++++++++++++++++++++++
 package/xnnpack/xnnpack.hash |  4 ++++
 package/xnnpack/xnnpack.mk   | 18 ++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/xnnpack/Config.in
 create mode 100644 package/xnnpack/xnnpack.hash
 create mode 100644 package/xnnpack/xnnpack.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 12b33c5fbc..90c0508105 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2692,6 +2692,7 @@ F:	package/gemmlowp/
 F:	package/psimd/
 F:	package/pthreadpool/
 F:	package/ruy/
+F:	package/xnnpack/
 
 N:	Stefan Ott <stefan@ott.net>
 F:	package/unbound/
diff --git a/package/Config.in b/package/Config.in
index 4878e8ba2f..6f6c5beca8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2163,6 +2163,7 @@ endif
 	source "package/uvw/Config.in"
 	source "package/volk/Config.in"
 	source "package/xapian/Config.in"
+	source "package/xnnpack/Config.in"
 endmenu
 
 menu "Security"
diff --git a/package/xnnpack/Config.in b/package/xnnpack/Config.in
new file mode 100644
index 0000000000..1b186ac055
--- /dev/null
+++ b/package/xnnpack/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_i386
+	default y if BR2_x86_64
+	depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
+
+config BR2_PACKAGE_XNNPACK
+	bool "xnnpack"
+	depends on BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
+	select BR2_PACKAGE_CPUINFO
+	select BR2_PACKAGE_FP16
+	select BR2_PACKAGE_FXDIV
+	select BR2_PACKAGE_PTHREADPOOL
+	help
+	  XNNPACK is a highly optimized solution for neural network
+	  inference on ARM, x86, WebAssembly, and RISC-V platforms.
+
+	  https://github.com/google/XNNPACK
+
+comment "xnnpack needs a toolchain w/ C++14, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/xnnpack/xnnpack.hash b/package/xnnpack/xnnpack.hash
new file mode 100644
index 0000000000..e31eb690e2
--- /dev/null
+++ b/package/xnnpack/xnnpack.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  fb519d082e5fcaa11e849386ad00e38b9ebde2cc9363032394516cd0d00295c3  xnnpack-e4b2b942b4a6d84b680ed690fee42ae99865945c.tar.gz
+# License files, locally calculated
+sha256  63f519e15726f4c4f830bd958f694c84fecb4e0a4cacc527d2696bb71ef95ada  LICENSE
diff --git a/package/xnnpack/xnnpack.mk b/package/xnnpack/xnnpack.mk
new file mode 100644
index 0000000000..f53f45dc74
--- /dev/null
+++ b/package/xnnpack/xnnpack.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# xnnpack
+#
+################################################################################
+
+XNNPACK_VERSION = e4b2b942b4a6d84b680ed690fee42ae99865945c
+XNNPACK_SITE = $(call github,google,XNNPACK,$(XNNPACK_VERSION))
+XNNPACK_LICENSE = BSD-3-Clause
+XNNPACK_LICENSE_FILES = LICENSE
+XNNPACK_INSTALL_STAGING = YES
+XNNPACK_DEPENDENCIES = cpuinfo fp16 fxdiv pthreadpool
+XNNPACK_CONF_OPTS = \
+	-DXNNPACK_BUILD_TESTS=OFF \
+	-DXNNPACK_BUILD_BENCHMARKS=OFF \
+	-DXNNPACK_USE_SYSTEM_LIBS=ON
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
