Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A21EC6FD19
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 08:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2962A81334;
	Thu, 16 Mar 2023 08:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2962A81334
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBhTXPxF1BEL; Thu, 16 Mar 2023 08:35:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2896C81F27;
	Thu, 16 Mar 2023 08:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2896C81F27
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12D3E1BF3D5
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0BA2408C2
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0BA2408C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0jQXNfcGNLd for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 08:35:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 990404088B
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 990404088B
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 08:35:01 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id m22so450196ioy.4
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 01:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678955700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fVHa0VpG7UiY+MPspdvIj7S1FvnvESv4LoUOBIVGOXY=;
 b=liBk6A7nr1aQM/uvieG9gGr3v+Mjfg5vF8hJDQXRimHQ4pBj5m2z7e93fdt1d9iVIx
 +P2H8884KDrzZieyUM7xr90W6eka/F4yx55tNpvU6bMFY1+GUP/NZ7fhMoJy0S9Wi41y
 I5FFgMWfkduZZFjNj9tLAmXqxPtGJA0KqT0qyuD0ndnOYjxUsKjnFn/05hvLxCY17QyK
 XN/5Q672cYxx4PLULAhAjwonkBO3ByJysVPDM357vZTIBIin4y8YuFc2QtemYExGKLNh
 iC+GCRkAbsLIVWi8DCJiCCknBcjOS5OWUrNW0gELJM+eroeLENavu5wsNXYRXeiLn9Vk
 4Wng==
X-Gm-Message-State: AO0yUKWO9SvxHKGX/cJsP4tEoDJbRI0cLofkHwuXkO9EC6+VhFoRYFNN
 EQlmT8Y/SBvXGghiGIK6JZ+NH/O4082Q3Q==
X-Google-Smtp-Source: AK7set/duIoPNuuIPXJA2XolOo2CtJA79pKxk1mRCA9c5ecj4peHMQPzzURJoYWUgpOXZdVVp4p4vg==
X-Received: by 2002:a5d:9cca:0:b0:753:738e:f90b with SMTP id
 w10-20020a5d9cca000000b00753738ef90bmr87551iow.3.1678955700431; 
 Thu, 16 Mar 2023 01:35:00 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 y34-20020a029525000000b003b331f0bbdfsm534630jah.97.2023.03.16.01.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:34:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 02:34:32 -0600
Message-Id: <20230316083440.3466725-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316083440.3466725-1-james.hilliard1@gmail.com>
References: <20230316083440.3466725-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678955700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVHa0VpG7UiY+MPspdvIj7S1FvnvESv4LoUOBIVGOXY=;
 b=H+u7ArtIF5Ulh30IkytdhlnrPHHYdCo60f/3Ho9C3d1ckTeDSYqWt7HJw9TzQDOhEv
 AdP47SDq6pY+DlruYq9Lep5y1/WgEavQsFhnKxw2wbGH/Q9l822HGQsoR/4nOwezDOHG
 Q+WrP41Bz9Trhp2QiVRvsUIWvxumBA55GcYlhkaB3B2YNxxY/twsDbFa76q1L5tyaCb2
 IBEcJ4KbDiyWwhxz81Eyec9rTXFpEGXXcjobhewiaFGFQAJ3Eer5dOKJm7u1A2c0gLJW
 gwNSvxNC02AzC3R4Yvk/P5Zh/XdNk3KngAx+2yjCusW1YaUgdpRF5D8MNYpUnQp7EJZ/
 WYmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H+u7ArtI
Subject: [Buildroot] [PATCH v6 02/10] package/ruy: new package
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

From: Stefan Hager <stefan.hager@ginzinger.com>

This package is required by tensorflow-lite.

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v5 -> v6:
  - add architecture dependency
  - update to latest version
Changes v2 -> v3:
  - add C++14 dependency
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/ruy/Config.in | 22 ++++++++++++++++++++++
 package/ruy/ruy.hash  |  4 ++++
 package/ruy/ruy.mk    | 18 ++++++++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 package/ruy/Config.in
 create mode 100644 package/ruy/ruy.hash
 create mode 100644 package/ruy/ruy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8ec32087a1..c338125a53 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2687,6 +2687,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/ruy/
 
 N:	Stefan Ott <stefan@ott.net>
 F:	package/unbound/
diff --git a/package/Config.in b/package/Config.in
index 60d6a115e0..7ff1bfb088 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2146,6 +2146,7 @@ endif
 	source "package/qlibc/Config.in"
 	source "package/reproc/Config.in"
 	source "package/riemann-c-client/Config.in"
+	source "package/ruy/Config.in"
 	source "package/shapelib/Config.in"
 	source "package/skalibs/Config.in"
 	source "package/sphinxbase/Config.in"
diff --git a/package/ruy/Config.in b/package/ruy/Config.in
new file mode 100644
index 0000000000..cc137a403c
--- /dev/null
+++ b/package/ruy/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_RUY_ARCH_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
+
+config BR2_PACKAGE_RUY
+	bool "ruy"
+	depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
+	select BR2_PACKAGE_CPUINFO
+	help
+	  Ruy is a matrix multiplication library. Its focus is to cover
+	  the matrix multiplication needs of neural network inference
+	  engines. Its initial user has been TensorFlow Lite, where it
+	  is used by default on the ARM CPU architecture.
+
+	  https://github.com/google/ruy
+
+comment "ruy needs a toolchain w/ C++14, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ruy/ruy.hash b/package/ruy/ruy.hash
new file mode 100644
index 0000000000..675b457b1c
--- /dev/null
+++ b/package/ruy/ruy.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  e151a5b55059a6e83ded001787e1a8889ba1e5e4eaa5bc836b9b660e7e1cb519  ruy-21a85fef159f9942f636a43b14c64b481c2a05b2.tar.gz
+# License files, locally calculated
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/ruy/ruy.mk b/package/ruy/ruy.mk
new file mode 100644
index 0000000000..1e8141f91b
--- /dev/null
+++ b/package/ruy/ruy.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# ruy
+#
+################################################################################
+
+RUY_VERSION = 21a85fef159f9942f636a43b14c64b481c2a05b2
+RUY_SITE = $(call github,google,ruy,$(RUY_VERSION))
+RUY_LICENSE = Apache-2.0
+RUY_LICENSE_FILES = LICENSE
+RUY_INSTALL_STAGING = YES
+RUY_DEPENDENCIES = cpuinfo
+RUY_CONF_OPTS = \
+	-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
+	-DRUY_FIND_CPUINFO=ON \
+	-DRUY_MINIMAL_BUILD=ON
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
