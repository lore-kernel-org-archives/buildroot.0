Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC53C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:46:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B9AB60E0C
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B9AB60E0C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 792B9834E3;
	Sat, 24 Jul 2021 21:46:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9FuEns2zAmnq; Sat, 24 Jul 2021 21:46:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E7BD83503;
	Sat, 24 Jul 2021 21:46:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07E681BF2AA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9E0B605F0
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:45:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f-g7QZhLl8-5 for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:45:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E174A6060A
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 21:45:37 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id df26so6351986edb.9
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 14:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JaG8CKA2vPLCfq3y6FllyYMizAOR2blo2+IJpDBW+k8=;
 b=caT7ORcFf11tj0zfN9X+D1wfdXNKFr2ao2+D6boKfH25jn0PoRjCNMcjO9NhLxEdbq
 Z6WFAC6WH65UEkvvpFBKR3m2Dj5RTXS3BNHs53YjF1rh8d6vDdWbfY9FqjSoyIwyrrdf
 SHb4oag2aMYqqMyBH6wREnyhRSDEFJ/WjLQgUioi6gEScPkL2BCXBnsrPgctdKKoJ5VJ
 voCWVh+6uJ54F27TqQtCBFlQm/X4nuLMVLZDGcwakFaCN5pX+QjxpawFC/MwoXCkj7Op
 HPD+1BQavaDhTDhSp5I5dR9XdL8pjuhGcReM2wk3nNkDOtcyDM8d6ihusXlPe3iKb9Dn
 1o5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JaG8CKA2vPLCfq3y6FllyYMizAOR2blo2+IJpDBW+k8=;
 b=QdajbW8Jh27lYRRWLkMO9izHuVjgTERBKDCLqCXEiBr1Tp1C9/w2zkmXpQyviDf2+h
 2reAkGy968iF9jXwuVWufUIamTiEnSlrLFeD6xNwCNDK1pgYtR/7ucR+nAFyyvmmrJaK
 f2g6+Bvjn+2v0INi9WuHAd3nAmfV4b7jCftE5cgrqirBHurBFHY0eu+Tent/+olb3E0M
 IAme2FCiduuo8rCB8bAiLue9KrEpsqJ4KZ2my9unexdnrJAJSGiCI6w3hdkaQLngjcgA
 +77HcSvAEaweHdqtTmwvJSGtLHo7DO1OxBRTnroX0x6mDlknp7UnW6jjimeESkp047r3
 D6qA==
X-Gm-Message-State: AOAM530I8N1ms3rhtmV+1JCCnGxM05D8dOCiFHuYDgXg7CcpJcpszvSw
 jHlCF5k2pIEL1ONcVOnv5QAA+PCmZBqqtxj0
X-Google-Smtp-Source: ABdhPJxODTALMqPe5Dy+sXL4KGDZIpYJvIWzPvmiCxKbHpnvjJhl41GNw288Nn6LOwTKboc9a+Ksvw==
X-Received: by 2002:a05:6402:430e:: with SMTP id
 m14mr10284075edc.120.1627163135974; 
 Sat, 24 Jul 2021 14:45:35 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n26sm12325235eds.63.2021.07.24.14.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 14:45:35 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 23:45:26 +0200
Message-Id: <20210724214526.47637-3-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724214526.47637-1-arnout@mind.be>
References: <20210724214526.47637-1-arnout@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 3/3] package/armadillo: allows to select
 between clapack, lapack or openblas
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

armadillo can use clapack, lapack or openblas as BLAS provider and
clapack or lapack as LAPACK provider.

This patch
- adds hidden variable to check dependencies/requirement for each of them
- adds an option to use openblas as BLAS provider

The choice is required since applications may potentially need
lapack/clapack.

Note that a choice between lapack and clapack is hard to do in Kconfig,
because it inevitably leads to a circular dependency.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v3 -> v4: [Done by Arnout]
- Split off lapack/clapack arch depends in separate patches
- Simplify the comments (no need for the powerpc complexity)
- Remove the choices because clapack/lapack choice doesn't work. Keep a
  single config for openblas.
Changes v2 -> v3:
- drop all default statements for choice (Thomas)
- add explicit -l since blas libary is called liblas for (c)lapack and
  libopenblas for openblas (Thomas)
- add a choice for lapack selection between lapack, clapack or none
Changes v1 -> v2:
- add openblas as blas provider
---
 package/armadillo/Config.in    | 32 +++++++++++++++++++++++---------
 package/armadillo/armadillo.mk | 28 +++++++++++++++++++++++++++-
 2 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index b2b61a3233..710da0314f 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -1,20 +1,34 @@
+config BR2_PACKAGE_ARMADILLO_LAPACK_BLAS_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_CLAPACK_ARCH_SUPPORTS
+	default y if BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN
+	default y if BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
+
 comment "armadillo needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_ARMADILLO_LAPACK_BLAS_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_powerpc
-	depends on !BR2_m68k_cf
-
-comment "armadillo needs a glibc toolchain w/ C++"
-	depends on BR2_powerpc
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_ARMADILLO
 	bool "armadillo"
+	depends on BR2_PACKAGE_ARMADILLO_LAPACK_BLAS_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
-	depends on !BR2_m68k_cf # clapack
-	select BR2_PACKAGE_CLAPACK
+	select BR2_PACKAGE_CLAPACK if !BR2_PACKAGE_LAPACK && !BR2_PACKAGE_ARMADILLO_BLAS_OPENBLAS
 	help
 	  Armadillo: An Open Source C++ Linear Algebra Library for
 	  Fast Prototyping and Computationally Intensive Experiments.
 
 	  http://arma.sourceforge.net/
+
+if BR2_PACKAGE_ARMADILLO
+
+config BR2_PACKAGE_ARMADILLO_BLAS_OPENBLAS
+	bool "use openblas"
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
+	select BR2_PACKAGE_OPENBLAS
+	help
+	  Use OpenBLAS as BLAS library. Without this option, clapack or lapack
+	  will be used.
+
+endchoice
+
+endif
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 624b842ef6..82df7602be 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -7,11 +7,37 @@
 ARMADILLO_VERSION = 9.900.2
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
-ARMADILLO_DEPENDENCIES = clapack
 ARMADILLO_INSTALL_STAGING = YES
 ARMADILLO_LICENSE = Apache-2.0
 ARMADILLO_LICENSE_FILES = LICENSE.txt
 
 ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
 
+# blas support may be provided by lapack, clapack or openblas
+# blas library from (c)lapack is libblas.a, libopenblas.a otherwise
+ARMADILLO_CONF_OPTS += -DBLAS_FOUND=ON
+ifeq ($(BR2_PACKAGE_ARMADILLO_OPENBLAS),y)
+ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lopenblas
+ARMADILLO_DEPENDENCIES = openblas
+else
+ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lblas
+ifeq ($(BR2_PACKAGE_CLAPACK), y)
+ARMADILLO_DEPENDENCIES = clapack
+else
+ARMADILLO_DEPENDENCIES = lapack
+endif
+endif
+
+# lapack support may be provided by lapack or clapack
+# but not by openblas
+ifeq ($(BR2_PACKAGE_CLAPACK),y)
+ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
+ARMADILLO_DEPENDENCIES += clapack
+else ifeq ($(BR2_PACKAGE_LAPACK),y)
+ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
+ARMADILLO_DEPENDENCIES += lapack
+else
+ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
