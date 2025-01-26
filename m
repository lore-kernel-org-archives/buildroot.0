Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AD0C0218D
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 15:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 620A4410C8;
	Sun, 26 Jan 2025 15:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0h9-YNvicfDU; Sun, 26 Jan 2025 15:47:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA707410A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA707410A6;
	Sun, 26 Jan 2025 15:47:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C6DC94A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 388AE408E2
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n61S74Z3mEO6 for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 15:47:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5CC4C40557
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CC4C40557
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CC4C40557
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:50 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3cfcf8b7455so15167585ab.3
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 07:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737906469; x=1738511269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XbKchJpJs3Hv+kGO1ln2kSMF0rKblhyi8npSX73s3ho=;
 b=WZNJVUi3C1cA8/j+BGQ+Fz/qtkFT7S2BF1L4A7jzPNDpt8SX+fsKSjJZ/Btt8tS5VE
 4VEz7grCqyJp/NHZ84XgO3cANDnBI3z2Sj2Bmqob3EXvjgmvkHd0Es2CzFHYcCKmh1u8
 uCnvQVxmg4rly+mpslN5WinUWr9AHYQVutCj4QPdql3VzTY7Bv+swfB+PhSOHBnCv6XM
 L0cM0j6pq88KI0EoLf7fAUeTSbT7OadVTysqSv6KT3YDvKIOcziWvEYtPVnIeDt2FsBt
 jZ/90vC9RobyFewZykuQXVHcH0p6SjpROO5pOWj5kGa7QM4jXsbZhY1cs05mmjN9BWEm
 UOUQ==
X-Gm-Message-State: AOJu0YzKUFZB6SrIig1FzYJUooq6Qui2toLGXFVFnGrOVZ/M1ZjzNQKd
 pbD3pWfYeofWmIQGOBOG+V6cL/cRutAqNp/BoKQwhX8onzW2o4fulixFKJbH
X-Gm-Gg: ASbGnctZSbtUAY59sRTmKYAmBmtPH32chkfSFxwGKI8nXDxJM+pOhbHhnG8Qq/BU7bg
 bAzTaE2ooDW+CnaF1P3BEFqMIMnwsw0IBeTEmJgi+TaAC7vep34Ba+RtI17slCBud8Lw+09sdCH
 08gSkKQIe/U3BMxoQVc1GFFZ6XktcPxfgEML2GsEZee5UpSwKQvlhJNYqVytHfNakdp8V9sdfrW
 0GtA+V7VphY4h+hL47nYe5B1Uo8XTfjLf1Ehkkk8zYxjcSIBzksnps2kXjkm2S9ghp5sCIYCC04
 ABkRAzJzRiRtuzUh2WxjjPrRwbCeP1QRP6cMbk567gRuL7JtM1sbNag=
X-Google-Smtp-Source: AGHT+IGG7VuNoYhZofcmw7+YuTKF3dQK8Qii57I0NNJdIT7xs0HQvxj1XbYfBOacFj9qjECE1hrpCw==
X-Received: by 2002:a05:6e02:1f09:b0:3cf:cedd:b5bd with SMTP id
 e9e14a558f8ab-3cfceddb8efmr80550485ab.1.1737906469084; 
 Sun, 26 Jan 2025 07:47:49 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc74ea0afsm20900715ab.47.2025.01.26.07.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 07:47:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 26 Jan 2025 08:47:28 -0700
Message-Id: <20250126154732.405055-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250126154732.405055-1-james.hilliard1@gmail.com>
References: <20250126154732.405055-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737906469; x=1738511269; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbKchJpJs3Hv+kGO1ln2kSMF0rKblhyi8npSX73s3ho=;
 b=XeeZlZbTJUsr1uNJPQoiIzy4i6LtapauDbtGyYFq5i2E0L73u3eeGQ2q3gZpV1jfRL
 EaZ0zbtYOeECtDziSplM7SxMfA5FqASN4xamfb61Zz7YCwbV7vwfSdxPGoX9j+tUXZqw
 4HQwVBCqAiJlBEIJJ5ZHIcgjdNAMpU3aCPCgTrhvkY285FO5szlhKD/dYaZZ+bsRWXiq
 3vsjMKdDJOjAQCCnsqmoElKNjls+G5GHuuNr2jyv1Jhb3qtq/Yz9z7NECEF3f9Tpv1Cn
 zbzW8Asgk9Igll9o1187QLKlUBwR9/BwEnv6JY7BBCaHmly9JukR8zjxyMC31FGFPflK
 bftg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XeeZlZbT
Subject: [Buildroot] [PATCH v7 06/10] package/fp16: new package
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
  - bump to latest version
  - drop patch which is now upstream
Changes v5 -> v6:
  - add patch fixing build without c++
Changes v4 -> v5:
  - add comment indicating library is header only
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/fp16/Config.in |  8 ++++++++
 package/fp16/fp16.hash |  4 ++++
 package/fp16/fp16.mk   | 20 ++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/fp16/Config.in
 create mode 100644 package/fp16/fp16.hash
 create mode 100644 package/fp16/fp16.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 789e86ce3a..c916ac8050 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3034,6 +3034,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/fp16/
 F:	package/gemmlowp/
 F:	package/psimd/
 F:	package/pthreadpool/
diff --git a/package/Config.in b/package/Config.in
index beb6f08064..cccb95b869 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2187,6 +2187,7 @@ menu "Other"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
 	source "package/flatcc/Config.in"
+	source "package/fp16/Config.in"
 	source "package/fxdiv/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gdal/Config.in"
diff --git a/package/fp16/Config.in b/package/fp16/Config.in
new file mode 100644
index 0000000000..e07c6ebb8a
--- /dev/null
+++ b/package/fp16/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FP16
+	bool "fp16"
+	select BR2_PACKAGE_PSIMD
+	help
+	  Header-only library for conversion to/from half-precision
+	  floating point formats.
+
+	  https://github.com/Maratyszcza/FP16
diff --git a/package/fp16/fp16.hash b/package/fp16/fp16.hash
new file mode 100644
index 0000000000..a2b7d83c41
--- /dev/null
+++ b/package/fp16/fp16.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  e7b509c76a2ea162ebdda77fb6b6f51f2f37dedee0866077d428e214516f0c2b  fp16-98b0a46bce017382a6351a19577ec43a715b6835.tar.gz
+# License files, locally calculated
+sha256  17e4f539024be2749ee729d1e2f01d24cef12ece8c9bf18e91a4349be29c80bf  LICENSE
diff --git a/package/fp16/fp16.mk b/package/fp16/fp16.mk
new file mode 100644
index 0000000000..d50d84366d
--- /dev/null
+++ b/package/fp16/fp16.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# fp16
+#
+################################################################################
+
+FP16_VERSION = 98b0a46bce017382a6351a19577ec43a715b6835
+FP16_SITE = $(call github,Maratyszcza,FP16,$(FP16_VERSION))
+FP16_LICENSE = MIT
+FP16_LICENSE_FILES = LICENSE
+FP16_INSTALL_STAGING = YES
+# Only installs a header
+FP16_INSTALL_TARGET = NO
+FP16_DEPENDENCIES = psimd
+FP16_CONF_OPTS = \
+	-DFP16_BUILD_TESTS=OFF \
+	-DFP16_BUILD_BENCHMARKS=OFF \
+	-DPSIMD_SOURCE_DIR="$(PSIMD_DIR)"
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
