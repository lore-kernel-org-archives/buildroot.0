Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3E4D64099
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 23:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0EC960898;
	Fri,  8 Nov 2024 23:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNLWHoSdC88P; Fri,  8 Nov 2024 23:13:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFB6560A77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFB6560A77;
	Fri,  8 Nov 2024 23:13:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 078ADC2
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 23:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD1674249E
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 23:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SW57Sgy_2DFO for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 23:13:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f44; helo=mail-qv1-xf44.google.com;
 envelope-from=git@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35EE542490
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35EE542490
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35EE542490
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 23:13:04 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id
 6a1803df08f44-6cbf2fc28feso16028246d6.0
 for <buildroot@buildroot.org>; Fri, 08 Nov 2024 15:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731107583; x=1731712383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NCMWmpccVzj7ax7arfE44EAlwxOyFNrUD4ZZoFXr/7I=;
 b=D+0JQ7P4kFmQR5dYCA5qzlizrx1u9nmZgLc2mhSnrzeZ9VFps8atmdgSryS5Gya5Hv
 QNJvPKbYYJjEBJb2lKZOwm5jS27cW5cOwmkGEcmV0dhrVUwgIg4ZaNMYAUfuwH/jFHQm
 mKmr3KjEteUoisyQFACGpf1905Vt2fRrxXWmXo+gR1vFcbmOzjgqa5A3mzY8zYQNT7rh
 cwGUZo8fCshSA58E/U/zgJzqhw74GFGb0bbIAhsKAFnKZH6vIbZRh0EMtEw4lWnAZKve
 vsaTxJA8agDzeoTV1mKBaZgC6KyK+oL9fIzHV1bPvauco1/NFee3n/hpx7yWhdHBy1Ep
 zgtg==
X-Gm-Message-State: AOJu0Yx8uzBj9Gs5arTRwSJ9qGgnr0t2AUFvD+WOvlkELXLRccVnCxnc
 j/wCvnhTRZzFV1nIYUt2IomJBqHFlGcapeEEo6ct9i4vyHx3xevLWgaTL+Lg5x56EcPl2ysN2AX
 TQH2kS+xl
X-Google-Smtp-Source: AGHT+IEIK08AxBeDPDWiKUK//vjh1c9xP96tkkyAY9XrLmLcf3xlirmKVvHDwm+WA2om1pej4InzfA==
X-Received: by 2002:a05:6214:5992:b0:6cb:ef96:c79e with SMTP id
 6a1803df08f44-6d39e1cebc5mr63129816d6.34.1731107583359; 
 Fri, 08 Nov 2024 15:13:03 -0800 (PST)
Received: from localhost.localdomain
 (bras-base-jkvlon0513w-grc-47-76-71-165-74.dsl.bell.ca. [76.71.165.74])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b32ac88721sm204327085a.65.2024.11.08.15.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 15:13:02 -0800 (PST)
From: James Knight <git@jdknight.me>
To: buildroot@buildroot.org
Cc: James Knight <git@jdknight.me>
Date: Fri,  8 Nov 2024 18:12:35 -0500
Message-ID: <20241108231236.2838-1-git@jdknight.me>
X-Mailer: git-send-email 2.46.2.windows.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1731107583; x=1731712383;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NCMWmpccVzj7ax7arfE44EAlwxOyFNrUD4ZZoFXr/7I=;
 b=jDSscpFWqGVOcfttlUp2Yo2wINWnvobSIxzZXeCToMeoSdNDAlc/QGnLUmstTatKuM
 fELCkgU6OrUfqrza/+poclX9br2KvmhDpLfJ+dhRByT3Zpzm13ILLvvyad2DEPmtNCrr
 VqfJDFz/mdyFsWE7W11phKbH2AxU5DxEvnWGh7Khao+t/OTqrS5FlJ7TCCsmO4g2QmWu
 A4K9ZK7ZhJBDv/nUr55UOIi7k5bz4P2KlcmJ4aXUgmJZo9hJ2bd5X615RYpQDCd0iHCO
 nbSu8GG0bbr1wFgbWHbYUfuuWAIaYIXuY8Wx8EM2ohgD/my0EU/T6pv+Gqo4EP9R0F/k
 a7Bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=jDSscpFW
Subject: [Buildroot] [PATCH v2 1/2] linux: support each linux latest lts
 version
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

Provides support for a board configuration to use the latest version of
the Linux kernel for a specific LTS. While the existing
`BR2_LINUX_KERNEL_LATEST_VERSION` allows desired configurations to roll
with a latest stable release, in some scenarios, a user may want the
same ability but for a specific Linux LTS. For example, if a user is
using an external toolchain that is also tied to a specific Linux LTS.

Having these new options avoids the need for rolling configuration to
rely on `BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE` with the
`BR2_DOWNLOAD_FORCE_CHECK_HASHES` option disabled.

Signed-off-by: James Knight <git@jdknight.me>
---
Changes v1 -> v2:
  - Updated versions to use latest versions tracked in `linux.hash`.

See also: https://lore.kernel.org/buildroot/CALAjcgXZKYjpsFV1E7Ry-0N5NEGV01hebSb8tEgoAtHvkfvCOA@mail.gmail.com/
---
 linux/Config.ext.in                  |  4 +--
 linux/Config.in                      | 45 ++++++++++++++++++++++++++++
 linux/linux.mk                       |  2 +-
 package/linux-headers/Config.in.host |  4 +--
 4 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 3cbf42d3447615105a67ca369fd728784c58ca8b..fe4abd779cfbb969dd1a865821b78fd62c7ca425 100644
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
index 16c015b41261e0a12940c1cc1cca4745211b56b9..667601d6f010b6bd7fa1c1481ec54eb19043766a 100644
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
 	bool "Latest version (6.11)"
+	select BR2_LINUX_KERNEL_LATEST_SERIES
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11 if BR2_KERNEL_HEADERS_AS_KERNEL
 
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
 	default "6.11.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.59" if BR2_LINUX_KERNEL_LATEST_LTS_6_6_VERSION
+	default "6.1.115" if BR2_LINUX_KERNEL_LATEST_LTS_6_1_VERSION
+	default "5.15.170" if BR2_LINUX_KERNEL_LATEST_LTS_5_15_VERSION
+	default "5.10.228" if BR2_LINUX_KERNEL_LATEST_LTS_5_10_VERSION
+	default "5.4.284" if BR2_LINUX_KERNEL_LATEST_LTS_5_4_VERSION
+	default "4.19.322" if BR2_LINUX_KERNEL_LATEST_LTS_4_19_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.mk b/linux/linux.mk
index 1d3d8fffa6085c58d024a8519377365d19766521..477d1e16143bea2f106e7f3f9212d0efefc98db1 100644
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
index 2f7a731d369ad7ac8f2a353fefa1a94c3740e8b1..d47f9fde29e327a05287aa874a46337963f620aa 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -114,9 +114,7 @@ endif
 choice
 	bool "Custom kernel headers series"
 	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
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
