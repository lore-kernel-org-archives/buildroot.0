Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE32CF6D2C
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 14:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73CD181F12;
	Wed,  2 Oct 2024 14:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vv_vINRoWHa4; Wed,  2 Oct 2024 14:33:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52D1381F13
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52D1381F13;
	Wed,  2 Oct 2024 14:33:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8E901BF232
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 14:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D590D81F13
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 14:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8va9q4oV5WaK for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 14:33:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com;
 envelope-from=jdknight@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 44EAC81F12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44EAC81F12
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44EAC81F12
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 14:33:20 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-45812fdcd0aso8610921cf.0
 for <buildroot@buildroot.org>; Wed, 02 Oct 2024 07:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727879599; x=1728484399;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xXMC2VyVlxCf83PRMyRDpgyp45k/pq0uFMoeU0/TWVs=;
 b=sf+s0n4ws4hVvYP042pKNpjS5M5by7VvAFEm1Ifstzq0kPn8kLjjj7eSOw6zsSaztq
 lRen6lHTUmJGm8jS/AMhEPwc0nHMiIwUSVBzSzbjiZncsXk9Q5vvcWfNhjvKCknOk7qB
 nuCeb70TN0pR3P7lnoAEl4u1NRKDkDhOrztyyeIAdxz1QhpnRFpcWcqrvGGJFVIKZIro
 s5cidxZAIK1aw0daiMBlFB2rgHGBZASZm46bs0jmK5v5nqAdYH6xUX1AKPsnqHWv8/hS
 WQkFP6LyN9iNFoPwErqXuTGgQ882poYimnWqnYAPQvBU24faX5prSWW1sgCNKyvmBrHH
 TU+w==
X-Gm-Message-State: AOJu0YxHWYXy27DtTlMQUbAj9S/8NcRx1smdXl9YvrBaTSD9McBv2eSA
 GSF4jMs4U3+ViCFM5o6BWbTU0WXOQasJJnr8Hb7lWtcVroclRLpsED3mYUZL+dMQ3Kd3r/VyWJg
 GJY0=
X-Google-Smtp-Source: AGHT+IGBXWkh3AD7xjJL//c5DRbGyvbQ6UeI+d4LHIyAQpRUlSocAWLvhpXIa2OUkN/dzd8KVXT5lQ==
X-Received: by 2002:a05:6214:451e:b0:6cb:49d2:c700 with SMTP id
 6a1803df08f44-6cb816dd922mr58755186d6.22.1727879599235; 
 Wed, 02 Oct 2024 07:33:19 -0700 (PDT)
Received: from localhost.localdomain ([74.15.0.190])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cb3b62da07sm60783026d6.68.2024.10.02.07.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 07:33:18 -0700 (PDT)
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Wed,  2 Oct 2024 10:32:56 -0400
Message-ID: <20241002143256.702-1-james.d.knight@live.com>
X-Mailer: git-send-email 2.46.2.windows.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1727879599; x=1728484399;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=xXMC2VyVlxCf83PRMyRDpgyp45k/pq0uFMoeU0/TWVs=;
 b=jCaclPnMlsfcphecVoaZ6aefGLv64tquvPu5ZCacXs8GEiFczFxDBH4av1UZh4Aqi4
 3jK4cpktdr5X9eI91s9V7cz9BtV0ydUx76HtQk6reXwblHXGXLuar28YRppJ/YqE9B0E
 Xn8BFiccSJViOWT2EVVxrxG59b0hC2VBAfJoEvaErXG7dT7jgL7Cb26k6HgTVA+uE3Gu
 I5PadxAoBB4/8oYT/gprTWYIcp4CISy5PbRXRET73dk++rBi9xLY1SpXvBkf0XFF+62A
 9THl0/acnNpqAe+ymM6PwzXtwD+L9yiJwSU0JsCW47m5MNE/MxzWNWwPyI248CQ2p9tw
 ZfIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=live.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=jCaclPnM
Subject: [Buildroot] [PATCH 1/1] linux: support each linux latest lts version
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Provides support for a board configuration to use the latest version of
the Linux kernel for a specific LTS. While the existing
`BR2_LINUX_KERNEL_LATEST_VERSION` allows desired configurations to roll
with a latest stable release, in some scenarios, a user may want the
same ability but for a specific Linux LTS. For example, if a user is
using an external toolchain that is also tied to a specific Linux LTS.

Having these new options avoids the need for rolling configuration to
rely on `BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE` with the
`BR2_DOWNLOAD_FORCE_CHECK_HASHES` option disabled.

Signed-off-by: James Knight <james.d.knight@live.com>
---
See also: https://lore.kernel.org/buildroot/CALAjcgXZKYjpsFV1E7Ry-0N5NEGV01hebSb8tEgoAtHvkfvCOA@mail.gmail.com/
---
 linux/Config.ext.in                  |  4 +--
 linux/Config.in                      | 45 ++++++++++++++++++++++++++++
 linux/linux.mk                       |  2 +-
 package/linux-headers/Config.in.host |  4 +--
 4 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 3cbf42d344..fe4abd779c 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -48,9 +48,7 @@ comment "xenomai needs a uClibc or glibc toolchain w/ threads"
 # RTAI
 config BR2_LINUX_KERNEL_EXT_RTAI
 	bool "RTAI Real-time patch"
-	depends on !BR2_LINUX_KERNEL_LATEST_VERSION
-	depends on !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	depends on !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	depends on !BR2_LINUX_KERNEL_LATEST_SERIES
 	select BR2_PACKAGE_RTAI
 	help
 	  RTAI Kernel part.
diff --git a/linux/Config.in b/linux/Config.in
index e8c0722de0..8692031559 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -16,6 +16,12 @@ if BR2_LINUX_KERNEL
 config BR2_LINUX_NEEDS_MODULES
 	bool
 
+# Track if the selected kernel version is a "latest" series. This can be
+# used handle certain configurations such as preventing the use of the
+# RTAI Real-time patch.
+config BR2_LINUX_KERNEL_LATEST_SERIES
+	bool
+
 #
 # Version selection. We provide the choice between:
 #
@@ -29,10 +35,42 @@ choice
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (6.10)"
+	select BR2_LINUX_KERNEL_LATEST_SERIES
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 
+config BR2_LINUX_KERNEL_LATEST_LTS_6_6_VERSION
+	bool "Latest LTS 6.6 version"
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6 if BR2_KERNEL_HEADERS_AS_KERNEL
+
+config BR2_LINUX_KERNEL_LATEST_LTS_6_1_VERSION
+	bool "Latest LTS 6.1 version"
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1 if BR2_KERNEL_HEADERS_AS_KERNEL
+
+config BR2_LINUX_KERNEL_LATEST_LTS_5_15_VERSION
+	bool "Latest LTS 5.15 version"
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15 if BR2_KERNEL_HEADERS_AS_KERNEL
+
+config BR2_LINUX_KERNEL_LATEST_LTS_5_10_VERSION
+	bool "Latest LTS 5.10 version"
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
+
+config BR2_LINUX_KERNEL_LATEST_LTS_5_4_VERSION
+	bool "Latest LTS 5.4 version"
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 if BR2_KERNEL_HEADERS_AS_KERNEL
+
+config BR2_LINUX_KERNEL_LATEST_LTS_4_19_VERSION
+	bool "Latest LTS 4.19 version"
+	select BR2_LINUX_KERNEL_LATEST_SERIES
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19 if BR2_KERNEL_HEADERS_AS_KERNEL
+
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
+	select BR2_LINUX_KERNEL_LATEST_SERIES
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  CIP launched in the spring of 2016 to address the needs of
@@ -53,6 +91,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	bool "Latest CIP RT SLTS version (5.10.162-cip24-rt10)"
+	select BR2_LINUX_KERNEL_LATEST_SERIES
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
@@ -135,6 +174,12 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "6.10.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.51" if BR2_LINUX_KERNEL_LATEST_LTS_6_6_VERSION
+	default "6.1.110" if BR2_LINUX_KERNEL_LATEST_LTS_6_1_VERSION
+	default "5.15.167" if BR2_LINUX_KERNEL_LATEST_LTS_5_15_VERSION
+	default "5.10.226" if BR2_LINUX_KERNEL_LATEST_LTS_5_10_VERSION
+	default "5.4.284" if BR2_LINUX_KERNEL_LATEST_LTS_5_4_VERSION
+	default "4.19.322" if BR2_LINUX_KERNEL_LATEST_LTS_4_19_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.mk b/linux/linux.mk
index 0a213d17b5..c59075621b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -49,7 +49,7 @@ LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(firstword $(subst ., ,$(LINUX_
 endif
 endif
 
-ifeq ($(BR2_LINUX_KERNEL)$(BR2_LINUX_KERNEL_LATEST_VERSION),y)
+ifeq ($(BR2_LINUX_KERNEL)$(BR2_LINUX_KERNEL_LATEST_SERIES),y)
 BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
 endif
 
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 067c3b96aa..70eec06498 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -113,9 +113,7 @@ endif
 
 choice
 	bool "Custom kernel headers series"
-	depends on !BR2_LINUX_KERNEL_LATEST_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
-	depends on !BR2_LINUX_KERNEL_LATEST_CIP_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
-	depends on !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
+	depends on !BR2_LINUX_KERNEL_LATEST_SERIES || !BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_AS_KERNEL || \
 		   BR2_KERNEL_HEADERS_CUSTOM_TARBALL || BR2_KERNEL_HEADERS_CUSTOM_GIT
 	help
-- 
2.46.2.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
