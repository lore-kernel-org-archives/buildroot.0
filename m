Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157B1C0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 17:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F4F383A6E;
	Tue, 28 Jan 2025 17:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQiNwfnzA3Tm; Tue, 28 Jan 2025 17:02:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 399B283A77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 399B283A77;
	Tue, 28 Jan 2025 17:02:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C36BEAF7
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA83B413C4
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oO4GuBR7vscL for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 17:01:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A89F413BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A89F413BD
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A89F413BD
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:01:59 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-844d555491eso156126239f.0
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 09:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738083718; x=1738688518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dn0YzACfgs0PcTPdFHCNI2/pbcI5QcEc3yi3nqCdDpA=;
 b=JLGoQ8BlQB7FKfSGHU3hRSgjidtj6nMgaFw3ZjvIyO3FsYwPc6lRvEcG6p1qp8tOwn
 afbXmncy3APNBt3PbZKjPCz4MJlaH0BjeVJsWu/Q8+WzWyS2x2CxBMbeW4vbIBiXyijD
 XYyqwkjwcy1uFBYGn3GNJncFiW1WVJlIrBNnFgyJlrTGQ96vQmvASwLeO/OZFJ/7PG0k
 cbscuGSVt/tPvP29Tl2+cQOnQkLZ+UtmzcUUgyfJFtGc2ddUXRsjLaNOCfM5MNssJDKF
 r4PmAaw2X1Dw6RMhlXNtR+pOeI3qkA6blxPdjmqTQBD3YoMCP7WJd2YGLlyvBOl2tNwY
 WAPQ==
X-Gm-Message-State: AOJu0YzpMNs3WGum52uA1kSe2Xx8A7cO+pXmkpjhJoSLXglvSgMBSEzo
 NBDluVrmTytB6GP7jpRzLTl5o5RBgokkFt+9GRzNqpC+IOi8ZVP1hbiqjnod
X-Gm-Gg: ASbGnctp6f2lngX8EM9ZWwwAlmafllNT3fsbAkmnS/1FmJFZzH/CFDtHMLZ9Y9KpVSZ
 zjgYrnAeS19HorCSetkzsmDBfUrusGu55C9H2kfL5fbNx8dc4miTjKyGaq4fpnNTAQCYp9SpbPR
 ybXzsDg/o8t00D1pwjgaG8DSCoaEA7nO8zpWuYSWkCl3QUQ8ps1S82Z+kdLuhUVaRmEPE6sc6Og
 1CLyi/Ta4jyBE5qQ8Y4Vb52psX939YUn8glWsS8JckxgkCIuskrPN2DrXE8rXYuKGgtugkonJVv
 EWgNf0f2D+7ew6nHSnQkXyc/Sts5n/gZzAIoJ6v8BQLlgL8M50LMr7MjtPml9hM7Ig==
X-Google-Smtp-Source: AGHT+IG4+fEW5rAiBTcHDS9r5k0ZLcvTDTB6HUiT/bbPXi8QzCI0n63izxyq7fEg8IjqJL5I/6ivPg==
X-Received: by 2002:a05:6602:3f85:b0:835:4278:f130 with SMTP id
 ca18e2360f4ac-851b62b4465mr3552063639f.13.1738083718152; 
 Tue, 28 Jan 2025 09:01:58 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8521e035927sm343086739f.43.2025.01.28.09.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 09:01:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 28 Jan 2025 10:01:46 -0700
Message-Id: <20250128170153.2298242-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128170153.2298242-1-james.hilliard1@gmail.com>
References: <20250128170153.2298242-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738083718; x=1738688518; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dn0YzACfgs0PcTPdFHCNI2/pbcI5QcEc3yi3nqCdDpA=;
 b=FUrTgmosANg1nSZkm1fekLCt1sEgnYis85UthlSOJxbs6SjLuwRZm4g6ELyzfGBSP/
 pitDCQ2Xb4Gisit1ExRkVmF+WLEUK9lnCysKtrOCPLk/vZc9wLD7aWu6eyYG+BruEXZL
 rlXp6Rd7Xx34q8iCU+WuR5w4LXPLYSuRJKNVm2D3Eyrkeo7+ddvwpIsszrUBPI1E0YT7
 z4s4V3LskVu+tAcXed2+T4EBMCFwP5Fr/3AWqWc83myAcCGi+jSTFoAuEQ2a1wjV00s6
 4IQJyaSl4BBhKuTtg71k57GsIj1tkDDctGBJYftVyxXo5FvaA3lSFogS6chyBJgvxpiu
 XeiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FUrTgmos
Subject: [Buildroot] [PATCH v8 03/10] package/gemmlowp: new package
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

From: Stefan Hager <stefan.hager@ginzinger.com>

This package is required by tensorflow-lite.

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v6 -> v7:
  - update to latest version
Changes v4 -> v5:
  - add comment indicating library is header only
Changes v2 -> v3:
  - add C++11 dependency
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/gemmlowp/Config.in     | 12 ++++++++++++
 package/gemmlowp/gemmlowp.hash |  4 ++++
 package/gemmlowp/gemmlowp.mk   | 16 ++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/gemmlowp/Config.in
 create mode 100644 package/gemmlowp/gemmlowp.hash
 create mode 100644 package/gemmlowp/gemmlowp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e9e106e250..f5abea5a16 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3034,6 +3034,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/gemmlowp/
 F:	package/ruy/
 
 N:	Stefan Nickl <Stefan.Nickl@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index f982b7332a..594ee41d06 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2190,6 +2190,7 @@ menu "Other"
 	source "package/fxdiv/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gdal/Config.in"
+	source "package/gemmlowp/Config.in"
 	source "package/gflags/Config.in"
 	source "package/gli/Config.in"
 	source "package/glibmm/Config.in"
diff --git a/package/gemmlowp/Config.in b/package/gemmlowp/Config.in
new file mode 100644
index 0000000000..379450d1b0
--- /dev/null
+++ b/package/gemmlowp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_GEMMLOWP
+	bool "gemmlowp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  Low-precision matrix multiplication.
+
+	  https://github.com/google/gemmlowp
+
+comment "gemmlowp needs a toolchain w/ C++11"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/gemmlowp/gemmlowp.hash b/package/gemmlowp/gemmlowp.hash
new file mode 100644
index 0000000000..07b15e0e5f
--- /dev/null
+++ b/package/gemmlowp/gemmlowp.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  c3feb896a1b42595cf9a508ed64ed0dc3cd84fffdb8eed790d02d0534ab322ce  gemmlowp-16e8662c34917be0065110bfcd9cc27d30f52fdf.tar.gz
+# License files, locally calculated
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/gemmlowp/gemmlowp.mk b/package/gemmlowp/gemmlowp.mk
new file mode 100644
index 0000000000..708a82169a
--- /dev/null
+++ b/package/gemmlowp/gemmlowp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# gemmlowp
+#
+################################################################################
+
+GEMMLOWP_VERSION = 16e8662c34917be0065110bfcd9cc27d30f52fdf
+GEMMLOWP_SITE = $(call github,google,gemmlowp,$(GEMMLOWP_VERSION))
+GEMMLOWP_LICENSE = Apache-2.0
+GEMMLOWP_LICENSE_FILES = LICENSE
+GEMMLOWP_INSTALL_STAGING = YES
+# Only installs a header
+GEMMLOWP_INSTALL_TARGET = NO
+GEMMLOWP_SUBDIR = contrib
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
