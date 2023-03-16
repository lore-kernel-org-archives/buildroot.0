Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CA7C6FD19
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 08:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F8A581EE7;
	Thu, 16 Mar 2023 08:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F8A581EE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHcHPh_zTkJ7; Thu, 16 Mar 2023 08:35:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 619E681F16;
	Thu, 16 Mar 2023 08:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 619E681F16
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8241BF3D5
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0ED8408D4
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0ED8408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 38Wz8MTw0O7N for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 08:35:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A899408A5
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A899408A5
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 08:35:02 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id h11so569823ild.11
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 01:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678955701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gRx1NzVqlHa2pPRR06wITgCIV8S7jAfw33E1YQYcZh4=;
 b=3RlTEpSEC3yO2wh4CeFRHbjpGLMMC8gMrUJaMiSb8PzbcF/uiZ+ebtBmv8bvas0sil
 CwMHKxpob6gsW5uuvklbnHZ3X0rIypHgYxMGDpRDtBt+LdXtXjWKv86UMMqsBxQi1vRG
 yuBawbTCtnN4l96xoTsD1WbDF23PaJbYQCXZUpO+FIt9hSm+GLpKwh2hTi13PeZg8TuE
 YpaGGADnrJOnfYxEgn0nyyDXgLcxGV34AvM+nYps8CYF3coSgTaBbjhIXdb+cg4jrdjN
 TemjYsOpgbScTChynFuf5vVrmlKv7f+5lKQKvbPjf6f17lw30H4xgIGFWwg9W84op+3J
 xcHg==
X-Gm-Message-State: AO0yUKWmOSmzqERlifmhuA0VTHR5eEAl2632E9HlVHoh8/pgjWzcTSnF
 9bXr9ERyTYquwcMGlPZfUKlCt8mNIsn7Tw==
X-Google-Smtp-Source: AK7set9/ROe5mMOG50WSoyCw9SMNFyyD6i/QOMWD+oaXmeggjEPebpOjHnhTvnHrfaQzQqQekGAsRw==
X-Received: by 2002:a92:c54b:0:b0:322:fcb1:878a with SMTP id
 a11-20020a92c54b000000b00322fcb1878amr9605791ilj.29.1678955701193; 
 Thu, 16 Mar 2023 01:35:01 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 y34-20020a029525000000b003b331f0bbdfsm534630jah.97.2023.03.16.01.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:35:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 02:34:33 -0600
Message-Id: <20230316083440.3466725-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316083440.3466725-1-james.hilliard1@gmail.com>
References: <20230316083440.3466725-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678955701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gRx1NzVqlHa2pPRR06wITgCIV8S7jAfw33E1YQYcZh4=;
 b=UZX4nT1GPDUV1bULC55TqB+z8bIZxee17Od8bOr9XJbXJ3oqQVPyjbMVdC11Kfo4Ps
 ZpmDYc+HEtBwycw2bpBz9e4QAxJpSfeKLfOCdLIXCKPykRC5rG6GpXGuxdC2T+wuH6Lu
 SKcV0Pf7A6sBly1DloHbOQZYHKYpT/2tnQ2oUQfe6VjGloMuSHqBNJLIrbyPDIB/GY1p
 iTpbMHQVvhvZriqvz05FG3vq+ViXG/BDeOQJlVdU2bDtyIiuJmoXVt6lqk+sWv03PZkY
 5gseeIB81t0LJU+3rwW9GQ6O2VcC+4ZjrGfOypF3DNEGzBqoL7zFuzEiL834m5X+OfQb
 ne7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UZX4nT1G
Subject: [Buildroot] [PATCH v6 03/10] package/gemmlowp: new package
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
index c338125a53..40df433fbc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2687,6 +2687,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/gemmlowp/
 F:	package/ruy/
 
 N:	Stefan Ott <stefan@ott.net>
diff --git a/package/Config.in b/package/Config.in
index 7ff1bfb088..f506d79b0b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2039,6 +2039,7 @@ menu "Other"
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
index 0000000000..7c56a18bb6
--- /dev/null
+++ b/package/gemmlowp/gemmlowp.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  cc8a22b6f071c3781e6b4b72654c89b1cdc198e72ebadebb17638eac205344c1  gemmlowp-08e4bb339e34017a0835269d4a37c4ea04d15a69.tar.gz
+# License files, locally calculated
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/gemmlowp/gemmlowp.mk b/package/gemmlowp/gemmlowp.mk
new file mode 100644
index 0000000000..9489dccbe5
--- /dev/null
+++ b/package/gemmlowp/gemmlowp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# gemmlowp
+#
+################################################################################
+
+GEMMLOWP_VERSION = 08e4bb339e34017a0835269d4a37c4ea04d15a69
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
