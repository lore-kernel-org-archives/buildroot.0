Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AD4D68BF5
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 18:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4575680336;
	Sat, 16 Nov 2024 18:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gQG6WmTkAzDt; Sat, 16 Nov 2024 18:29:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FDB084767
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FDB084767;
	Sat, 16 Nov 2024 18:29:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DD18B14
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A7EF40430
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKtsvnlPJ7WV for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 18:29:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0460040129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0460040129
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0460040129
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:29:26 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9a850270e2so135972666b.0
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 10:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731781765; x=1732386565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+y0l4WpizQA0AZoPJp6GhwgGfqY0qLIOd332k3BqO8=;
 b=wcLO85DEUd+/ZQLlfbiInRZ+D5HADXm2vtCJt0UgJSd9Ts9FOj1S/K6wBhVD9PHbiH
 BnAsegVbyxk4h7spX78A0FIuZ0RGaQ7N7LLGKbyJ7vuUSrARmDPuWP/mgA000PP6ljl+
 tn33Ty5QnvHTtmapruDyqN/Zk1xQfLJF8PA8OiTO1pq9lSTN8gcZI/ZYjMk4+2F1AmPx
 KUET6skEYSMc9sdI6oYZbQWQqBFOAy5zde1XrIyPmLD33G/K1QE9kOhg1r9vimtenVst
 lXEfUPLzlUw0FsvxSJYX/Us3n4f/yoGwu4PHPn6pVmbkO8wJCYStH95kiTOXn1Rmw2R/
 r/Ow==
X-Gm-Message-State: AOJu0YyH37KNT6+QNRadjBZ8WvOfII9wIBYaw/3nY7e74Fd3yTMaaDAy
 7zhbh6+YUMHwIOsLraUkdtnY0GVhIABAwPkyfWena/M2RwCmhcoDpRjd+S4GIlrHZ3l11XBzKYK
 /
X-Google-Smtp-Source: AGHT+IGF/ESBnAsC0zH0w662hBg7HBUg2tbed52x6y7ssxRkiM6MEdxaSVsKCFfopBRidX4ObLqw1g==
X-Received: by 2002:a17:907:3e0f:b0:a99:8a0e:8710 with SMTP id
 a640c23a62f3a-aa48342150amr613078166b.14.1731781764901; 
 Sat, 16 Nov 2024 10:29:24 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df568easm332405366b.73.2024.11.16.10.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Nov 2024 10:29:23 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sat, 16 Nov 2024 19:29:18 +0100
Message-ID: <20241116182919.4169370-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241116182919.4169370-1-dario.binacchi@amarulasolutions.com>
References: <20241116182919.4169370-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1731781765; x=1732386565;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L+y0l4WpizQA0AZoPJp6GhwgGfqY0qLIOd332k3BqO8=;
 b=QVCudG9DHB6R6Am8rOieBPicYnsnsVqh4oiq7OF+EzVBJa2O5VgCGymculP7Zy4eDe
 bkdeqmk4ALK7X9Pom/wIkTQc0Vpv/5IMUPEqmFG/jhOTb4/iCBbiH2BJKdDFswWKvVBE
 zRFiWhw9lr2pGG8WddOsCnfSvo3qQ0s71J5Cc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=QVCudG9D
Subject: [Buildroot] [PATCH 1/2] package/armadillo: bump to version 14.0.2
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

The commit f69fe48404eda ("package/armadillo: temporarily update the
site URL") changed the download URL only to continue to build the
9.900.2 version. This is an outdated and no longer supported version
and as suggested by Conrad Sand, the project maintainer, it is
recommended upgrading to the latest version, which is currently 14.0.2,
and it's downloadable from the URL containing the most recent versions.

- Drop ARMADILLO_EXTRACT_CMDS added to fix an issue only related to
  the previous version building.
- C++14 is now mandatory.

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/Config.in      |  4 +++-
 package/armadillo/armadillo.hash |  2 +-
 package/armadillo/armadillo.mk   | 12 ++++--------
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index 7aed4fd02fe9..7a93343d41f8 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -2,16 +2,18 @@ comment "armadillo needs a toolchain w/ C++"
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
 
-comment "armadillo needs a toolchain w/ fortran, C++"
+comment "armadillo needs a toolchain w/ fortran, C++, gcc >= 4.9"
 	depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # otherwise, see comment above
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_ARMADILLO
 	bool "armadillo"
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS || \
 		(BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN)
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	help
 	  Armadillo: An Open Source C++ Linear Algebra Library for
 	  Fast Prototyping and Computationally Intensive Experiments.
diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 9b19b8c8c4a2..4e8652192303 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d78658c9442addf7f718eb05881150ee3ec25604d06dd3af4942422b3ce26d05  armadillo-9.900.2.tar.xz.RETIRED
+sha256  248e2535fc092add6cb7dea94fc86ae1c463bda39e46fd82d2a7165c1c197dff  armadillo-14.0.2.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 81684a44f72f..608f8fb229f2 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 9.900.2
-ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz.RETIRED
-ARMADILLO_SITE = https://sourceforge.net/projects/arma/files/retired
+ARMADILLO_VERSION = 14.0.2
+ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
+ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
 ARMADILLO_LICENSE = Apache-2.0
 ARMADILLO_LICENSE_FILES = LICENSE.txt
 
-ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
+ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false -DBUILD_SMOKE_TEST=false
 
 # blas support may be provided by lapack (libblas.a) or openblas (libopenblas.a)
 ARMADILLO_CONF_OPTS += -DBLAS_FOUND=ON
@@ -30,8 +30,4 @@ ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
 ARMADILLO_DEPENDENCIES += lapack
 endif
 
-define ARMADILLO_EXTRACT_CMDS
-	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) $($(PKG)_DL_DIR)/$(ARMADILLO_SOURCE)
-endef
-
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
