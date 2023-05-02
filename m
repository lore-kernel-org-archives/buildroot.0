Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721A7C77B7E
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 15:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A31580DBF;
	Tue,  2 May 2023 15:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A31580DBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y4GaGNTsGrBY; Tue,  2 May 2023 15:49:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FEB0819B4;
	Tue,  2 May 2023 15:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FEB0819B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51C921BF41B
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 15:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AE8C61456
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 15:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AE8C61456
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UInE5ZpT5BCq for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 15:48:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0767461455
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0767461455
 for <buildroot@buildroot.org>; Tue,  2 May 2023 15:48:12 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1950f5628so38699155e9.3
 for <buildroot@buildroot.org>; Tue, 02 May 2023 08:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683042491; x=1685634491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WQL7fUXR/2QFK7tJINnIYmo7GkmVnY2gCznp53bJNUM=;
 b=EjigLAtPqRm8O3u2cbDbfdsLpBISkKAqqbicWsEkRLnP2Cp/O64Zfoo7iLwgOdPC3h
 k08YB2ZuWZ+n5quWHm4uNrcxdigIXTdMmFRXbG6NJNKqiem8FOSYxtwjdxSYGsCSJWK2
 sikGw9QkRsy+1grKL07d0/pKaCgcwy+nAsBdgd7tzQeNwyM0xuagOCs3yqP6lsEO2CL2
 mIlz0HuzWnzvBy2xAzP88mVyF5Fm9QmCV2SJ8dXU+MaQ3qwnwOuXn0egYI4/SZs30emw
 9lYRh8i2YzCtnX+cBkrduB7p5zlv17XGWL9IQvj1rAVkVCyLsKl9vSXxXk7mkGmcJbQv
 ivGQ==
X-Gm-Message-State: AC+VfDyK0b8TQwghodtOTMIW3RYPZAfI2WDBx9jx1483Ft4iZ7UUT2LT
 /thvONl5cm3ADcbbj0088oX49b347jSrs73+mMU=
X-Google-Smtp-Source: ACHHUZ7LLDayqT1y2gkrUs9nIUCWW66nf5zO3D+Jwf3xXosHD8pO5qRs45GuflKrxzpZrgARfJQA5Q==
X-Received: by 2002:adf:da43:0:b0:2f4:fcd:98dd with SMTP id
 r3-20020adfda43000000b002f40fcd98ddmr12555273wrl.4.1683042490692; 
 Tue, 02 May 2023 08:48:10 -0700 (PDT)
Received: from lmecxl1178.lme.st.com ([80.215.39.12])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm31342990wrp.59.2023.05.02.08.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 08:48:10 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  2 May 2023 17:47:13 +0200
Message-Id: <20230502154713.1490788-6-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230502154713.1490788-1-etienne.carriere@linaro.org>
References: <20230502154713.1490788-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683042491; x=1685634491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WQL7fUXR/2QFK7tJINnIYmo7GkmVnY2gCznp53bJNUM=;
 b=e5WkLa4IAhOhgimwbenE9eckH2BfJhYT8Ki0PuodSK4Wvgm6PJYDDeYqI0XKf2t+jv
 aT5sKRBX7iPMARgeHyK7UE0SCewfAHkAEFHkP2Aq9EPQhH77Pasn0Yo/W5CJ6ueAKjy0
 EfVRzX9fK5WmX/wRJqrwsH+kx6ycYvQQnAbe42VEw4U8X6gdIhyLL4w+kXTT7r6qQO5M
 2QoGlTFPnQUM02nvh9oNEOi+jDPBmKLYbF8jSMOTk7X8lWKN8hkTkvl77CcWlE0p8GOh
 rP7hNoqPSRLAtQsCghOFr6VCCC9sxDnByufx5Lnd78ymFRUiA93d8X9DdVvyx12pY7Qj
 ku5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=e5WkLa4I
Subject: [Buildroot] [PATCH 6/6] package/optee-benchmark: remove deprecated
 package
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removes package optee-benchmark that is no more maintained as
pointed by discussion thread [1].

Link: [1] https://github.com/OP-TEE/optee_os/issues/5909
Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/Config.in                            |  1 -
 package/optee-benchmark/Config.in            | 20 --------------------
 package/optee-benchmark/optee-benchmark.hash |  4 ----
 package/optee-benchmark/optee-benchmark.mk   | 14 --------------
 4 files changed, 39 deletions(-)
 delete mode 100644 package/optee-benchmark/Config.in
 delete mode 100644 package/optee-benchmark/optee-benchmark.hash
 delete mode 100644 package/optee-benchmark/optee-benchmark.mk

diff --git a/package/Config.in b/package/Config.in
index eaac32a01a..53c2d3b077 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2565,7 +2565,6 @@ menu "Security"
 	source "package/apparmor/Config.in"
 	source "package/checkpolicy/Config.in"
 	source "package/ima-evm-utils/Config.in"
-	source "package/optee-benchmark/Config.in"
 	source "package/optee-client/Config.in"
 	source "package/optee-examples/Config.in"
 	source "package/optee-test/Config.in"
diff --git a/package/optee-benchmark/Config.in b/package/optee-benchmark/Config.in
deleted file mode 100644
index 2070582fbb..0000000000
--- a/package/optee-benchmark/Config.in
+++ /dev/null
@@ -1,20 +0,0 @@
-config BR2_PACKAGE_OPTEE_BENCHMARK
-	bool "optee-benchmark"
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
-	depends on !BR2_STATIC_LIBS # optee-client
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # optee-client
-	select BR2_PACKAGE_OPTEE_CLIENT
-	select BR2_PACKAGE_LIBYAML
-	help
-	  Enable the OP-TEE benchmark package that brings facilities
-	  for profiling traversal and execution timings when
-	  invoking OP-TEE. OP-TEE benchmark is a component delivered
-	  by the OP-TEE project.
-
-	  http://github.com/linaro-swg/optee_benchmark
-
-comment "optee-benchmark needs a toolchain w/ threads, dynamic library, headers >= 4.3"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
deleted file mode 100644
index d74a24c8ab..0000000000
--- a/package/optee-benchmark/optee-benchmark.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From https://github.com/linaro-swg/optee_benchmark/archive/3.19.0/optee-benchmark-3.19.0.tar.gz
-sha256  32f41854bf07eb7bb89dfc702da023c3a99518c33fbe7edf0e1f004e29a8c90c  optee-benchmark-3.19.0.tar.gz
-# Locally computed
-sha256  0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
deleted file mode 100644
index 338a51ada4..0000000000
--- a/package/optee-benchmark/optee-benchmark.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# optee-benchmark
-#
-################################################################################
-
-OPTEE_BENCHMARK_VERSION = 3.19.0
-OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
-OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
-OPTEE_BENCHMARK_LICENSE_FILES = LICENSE
-
-OPTEE_BENCHMARK_DEPENDENCIES = optee-client libyaml
-
-$(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
