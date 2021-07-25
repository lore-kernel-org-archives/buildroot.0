Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6D6C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 11:13:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A715160F11
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 11:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A715160F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 766C5834F4;
	Sun, 25 Jul 2021 11:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0HYMOeJ1-Smg; Sun, 25 Jul 2021 11:13:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3F6E834B6;
	Sun, 25 Jul 2021 11:13:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 175B81BF48B
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 11:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0298A60645
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 11:12:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TjHjAjhm4KXM for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 11:12:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3F1560632
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 11:12:43 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id hb6so10935135ejc.8
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 04:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MQUd5Kajc3kzke56QVwEm+Tp7Sw8pVFmkSWQJsc+y1s=;
 b=I4AjKjFGmPlae4HXhilPN6Hz1SDx7J6ggKYEnXQFxlaPib4D5Jo35fQQ8OYcAiSlJL
 crHz1n1EyfgSFe0rPHBeJNXQAZ8391+cTnbIE7cYhf6166BoRVqg8A8VN11Kx1Brk6gw
 gUTFgkTLZawJeL7ePIWd5bvd00IKkSu5ccs2XckTreKgE5KIvsH44kJnIMtwuHMzO9mJ
 a9HLcC0hgymAQksS8t1kBYR9xFP4DSS6VJHdOuWpakpxbT8/YP8R4R8EeTNZYZgY6nuQ
 STJx0PdBbXfFBbeB7Vest5Byb2SphppNuWOy5YP6oyhICD8iZkR+cKJdC3LixIRMDvZp
 YCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MQUd5Kajc3kzke56QVwEm+Tp7Sw8pVFmkSWQJsc+y1s=;
 b=CIhJc6xX4T2tPZsKJLcvD0qxGH0xYDG1Cd1K9x+mAuaovGD6+IP3aDQXsjXBcTW3Mx
 3aBxIKXkbYynMmjSotiTXwieronnTmpDRg+PtwTNQ5m2unrRxF3yuZ7xHIsA7p9iOCHs
 T5i+zuf6VOIoAt4gpB1ji9R7W9PyA7qS5suW2smCyyIjjbDaJ40jG2OL0ZanwOnk0jJd
 oflTLq8FQDa8ZMI3h1qWyqqd91VqsE6e6CYGd0qfOMTPx4HRbEuRdOaejVTP009DcfzB
 hw+lbQwP1/WpmsOSlG7BEkeYz9l2tA7OOZiE4XLSRGrJ7DEomaYoeFr2caPBXrgY137b
 s2xg==
X-Gm-Message-State: AOAM532oTHK+6mxPYJVmAS63vBgvJqevVpQBwxX35SDkULB/5cVsjDUE
 pYdpf+ck+4ZyHrgEdZlmbxR4PtOCSDT7uLpH
X-Google-Smtp-Source: ABdhPJxfEiNhdvwZmLDtMOFzxRsEP1KTE8fS9dYfY2KkKLAGsq+9V95eplHH0JpirkGyUvWbg48uOA==
X-Received: by 2002:a17:906:c9cb:: with SMTP id
 hk11mr12421908ejb.544.1627211561665; 
 Sun, 25 Jul 2021 04:12:41 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v13sm13190255ejh.62.2021.07.25.04.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 04:12:41 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 13:12:31 +0200
Message-Id: <20210725111231.359830-3-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210725111231.359830-1-arnout@mind.be>
References: <20210725111231.359830-1-arnout@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 3/3] package/armadillo: allow to select
 between lapack or openblas
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

armadillo can use lapack or openblas as BLAS provider. LAPACK support is
optional.

This patch
- adds an _ARCH_SUPPORTS variable to check if one is available
- adds an option to choose lapack or openblas as BLAS provider

The choice is required since applications may potentially need lapack.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v4 -> v5: [Done by Arnout]
- Consistent naming of BR2_PACKAGE_ARMADILLO_OPENBLAS (Yann E. Morin)
- Remove double dependency on lapack/clapack (Yann E. Morin)
- Remove stray 'endchoice'
- "Solve" circular dependency by removing clapack
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
 package/armadillo/Config.in    | 34 ++++++++++++++++++++++++++--------
 package/armadillo/armadillo.mk | 18 +++++++++++++++++-
 2 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index b2b61a3233..7aed4fd02f 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -1,20 +1,38 @@
 comment "armadillo needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_powerpc
-	depends on !BR2_m68k_cf
 
-comment "armadillo needs a glibc toolchain w/ C++"
-	depends on BR2_powerpc
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_USES_UCLIBC
+comment "armadillo needs a toolchain w/ fortran, C++"
+	depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # otherwise, see comment above
+	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_ARMADILLO
 	bool "armadillo"
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS || \
+		(BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN)
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
-	depends on !BR2_m68k_cf # clapack
-	select BR2_PACKAGE_CLAPACK
 	help
 	  Armadillo: An Open Source C++ Linear Algebra Library for
 	  Fast Prototyping and Computationally Intensive Experiments.
 
 	  http://arma.sourceforge.net/
+
+if BR2_PACKAGE_ARMADILLO
+
+choice
+	prompt "BLAS implementation"
+
+config BR2_PACKAGE_ARMADILLO_OPENBLAS
+	bool "openblas"
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
+	select BR2_PACKAGE_OPENBLAS
+
+config BR2_PACKAGE_ARMADILLO_LAPACK
+	bool "lapack"
+	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_PACKAGE_LAPACK
+
+endchoice
+
+endif
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 624b842ef6..dcac2bf8cd 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -7,11 +7,27 @@
 ARMADILLO_VERSION = 9.900.2
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
-ARMADILLO_DEPENDENCIES = clapack
 ARMADILLO_INSTALL_STAGING = YES
 ARMADILLO_LICENSE = Apache-2.0
 ARMADILLO_LICENSE_FILES = LICENSE.txt
 
 ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
 
+# blas support may be provided by lapack (libblas.a) or openblas (libopenblas.a)
+ARMADILLO_CONF_OPTS += -DBLAS_FOUND=ON
+ifeq ($(BR2_PACKAGE_ARMADILLO_OPENBLAS),y)
+ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lopenblas
+ARMADILLO_DEPENDENCIES = openblas
+else
+# Since BR2_PACKAGE_LAPACK is selected in this case, the dependency on it is
+# added below.
+ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lblas
+endif
+
+# lapack support is optional and can only be provided by lapack, not openblas
+ifeq ($(BR2_PACKAGE_LAPACK),y)
+ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
+ARMADILLO_DEPENDENCIES += lapack
+endif
+
 $(eval $(cmake-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
