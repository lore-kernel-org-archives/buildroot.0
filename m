Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54639C05027
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 00:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F16AB40585;
	Mon, 30 Jan 2023 00:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F16AB40585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDuMqiMsDDYH; Mon, 30 Jan 2023 00:30:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24B9B405A7;
	Mon, 30 Jan 2023 00:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24B9B405A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D57EC1BF869
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFCBA60B3D
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFCBA60B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YAm-Z5W9yU3I for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 00:29:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C749D60ADA
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C749D60ADA
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 00:29:05 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id i17so4570071ila.9
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MmgwGlEJ6x5O/ZN6McQ9kWiIFFfqBmMb4wK4RCAa++s=;
 b=qVYByfjSvKNrKWl/OxAImL4z5jglBYVoRFKWOyVs3yLnsanAQ3PRjNo5sAkOoX2VBz
 ABH+oZgla6LpJSsIsjcT5aIUc3QL1C1NwXVGaisgfgUrsYs7fPZaI4q8XqaKNLDiBoUZ
 QzWBb8j+QzSmyqW9pvCn/6Pf5UR4gc03t98XOaBO+qVxrc2eOMobNBkAnAzJAqqC6tPR
 jctFRMFO9+l2k0tWkSEQzSUnZXC/FBtTXpLzVe1xFDtVwHsh5Lrm2Tb+z90tMCXPyGlc
 hHrOBx5+OXL6g7WmrcgoYLHdjJx3zAy8kTus7Kx1WPrhtPuJyhIJUhUPvZk0Efg4wAVi
 +AIQ==
X-Gm-Message-State: AO0yUKWVe8b2E0sVO41dYRB9j+JDbgCOe9RZq53PrLretz/6bT1CkokW
 j6GAn254iO+Iac3U7UTutI2vsapr/s4t7w==
X-Google-Smtp-Source: AK7set+JMkNOYuv0bppXoAPoi6Y9pbWSC/SrxboQB0zUqEGMC7+o4mRObxuATECb+/zR+WFrTXYDFQ==
X-Received: by 2002:a05:6e02:15c6:b0:310:ae72:32a0 with SMTP id
 q6-20020a056e0215c600b00310ae7232a0mr5778620ilu.21.1675038544755; 
 Sun, 29 Jan 2023 16:29:04 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 q4-20020a02c8c4000000b00363d6918540sm1676570jao.171.2023.01.29.16.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 16:29:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:28:50 -0700
Message-Id: <20230130002854.2300661-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130002854.2300661-1-james.hilliard1@gmail.com>
References: <20230130002854.2300661-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MmgwGlEJ6x5O/ZN6McQ9kWiIFFfqBmMb4wK4RCAa++s=;
 b=HpjE3S+p9mEjipV6jSnkTNpuixSwubmAZbmKfxaXAukxlGmNXEgC9A7ib4rdw4gZpu
 LxAFnzMYElG2YvHE6HATjBy87mS+TR3+VojkwPeQPGAThr6tkHiDOXEac7bTksjzF587
 y8cnu2L4QlR1kpAyFbqnROmjA3ce8sNZ12NoI4fNvnRSRuY2C9UYfuomsih9vceZITtp
 kuclO3Uc8BpTp2NHhhZDUFPyeprjXqLm64cvW1DffoxTNsD5LVuTkT/kiNnJdGM+dNIB
 TxbXMhoYaQRpVPHeIBHWRgMM5Fp9oDRU7iaskKd5TlRBL/F1W11twtNJfT8IW/FnQBE8
 49JQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HpjE3S+p
Subject: [Buildroot] [PATCH v5 06/10] package/fp16: new package
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

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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
index 67187f29ac..daf0f89430 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2725,6 +2725,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/fp16/
 F:	package/gemmlowp/
 F:	package/psimd/
 F:	package/pthreadpool/
diff --git a/package/Config.in b/package/Config.in
index 186c7403ef..867159fa2b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2015,6 +2015,7 @@ menu "Other"
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
index 0000000000..63634eb2cf
--- /dev/null
+++ b/package/fp16/fp16.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  a91f4770ff9c39f4d72e339c379f566b3bbb359fa66122d85fc0bae3dde7abc7  fp16-0a92994d729ff76a58f692d3028ca1b64b145d91.tar.gz
+# License files, locally calculated
+sha256  17e4f539024be2749ee729d1e2f01d24cef12ece8c9bf18e91a4349be29c80bf  LICENSE
diff --git a/package/fp16/fp16.mk b/package/fp16/fp16.mk
new file mode 100644
index 0000000000..80710523fb
--- /dev/null
+++ b/package/fp16/fp16.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# fp16
+#
+################################################################################
+
+FP16_VERSION = 0a92994d729ff76a58f692d3028ca1b64b145d91
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
