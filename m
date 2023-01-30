Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C2FC05027
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 00:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43616817C3;
	Mon, 30 Jan 2023 00:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43616817C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B11ctcg7R5yo; Mon, 30 Jan 2023 00:29:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 920E4817F5;
	Mon, 30 Jan 2023 00:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 920E4817F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 380A71BF8B4
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EB9E60B3D
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EB9E60B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E53BFT794QqK for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 00:29:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C83DB60ADA
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C83DB60ADA
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 00:29:02 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id p12so4567686ilq.10
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:29:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TSVX4buE4+xqwjNhDhiBz27AeuhebjvbDY84v9CuOJs=;
 b=KFT/w9x9lFoRrpwDaSDucBgw7QyjlQYk7voHAw4Ou4wLhi6uPn8Lcebzch8+8Yp6ew
 kalVqFFNzOe9H9bw4Vbm7vfNE84tQYRJKZe3ahmNV/PriDZLtx8NA+fHMkV2Mnl+VJ3+
 k1649gS7J1NqOw+ou58XZ1/Rz3Xv4Jmt4kztNr26BH5/w9jxDPID/xlDILRVY4FxkFk3
 umz7z03p9zyV+hCK7SRadciQmZBAmHt+ff5Mjy/b8QbqBEroaA2pml5XCTMEPjJTs1e2
 v/9C4zQOD8xPF1oiUrYsEvtKDXrM89yebw6mnep+V1rRSxfnCyvU+AV0BJa4VFjGdmyQ
 Zw5g==
X-Gm-Message-State: AO0yUKX2/TnosUD2lvqzePMltbUZSePaSVLclte6Z55SMFc0CXa908PE
 JK6vlbNcDifZfoJF8NCVhmEMtgVmtPAkNg==
X-Google-Smtp-Source: AK7set8/b+1VPNnDcvIziqWrcGrHhdZghyYbwDKMWqeze7cijdrxJkOY6TLl/7M/a4t2Nz81MD02Pw==
X-Received: by 2002:a05:6e02:b48:b0:310:aa02:4902 with SMTP id
 f8-20020a056e020b4800b00310aa024902mr12446014ilu.19.1675038541687; 
 Sun, 29 Jan 2023 16:29:01 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 q4-20020a02c8c4000000b00363d6918540sm1676570jao.171.2023.01.29.16.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 16:29:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:28:46 -0700
Message-Id: <20230130002854.2300661-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130002854.2300661-1-james.hilliard1@gmail.com>
References: <20230130002854.2300661-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TSVX4buE4+xqwjNhDhiBz27AeuhebjvbDY84v9CuOJs=;
 b=iSz4FfDtWBBV4/3406oLmdh849Cb/YBo8c3RwakxdVMDH+T9+DJNHMtrWj9Dry6va6
 jSztjGIrqB8iVGiYHYmprzHVlt3jhXSCulaLo+leyfKTBAn8VgOM6sD30UWt2fBMjfzy
 UMlUA/0LFv/B/VfR0zYHX54FaQxrpSPYuxzsADvrlHv9kRdBnTwnuRZOzs01tolbpMCe
 NP3PGI7fYkdQQGbmNZQG3EIFUtPbLSM5xvl+2TQruX5BwnSZv+IHlN+e7eqDxPubHq9p
 e/MPXoMDAXWrrJZE9gWDvHV3qYduTgfN2LRVexqsE8zezR6trG4wgT01w0GY/kU9IkXI
 ecOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iSz4FfDt
Subject: [Buildroot] [PATCH v5 02/10] package/ruy: new package
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
Changes v2 -> v3:
  - add C++14 dependency
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/ruy/Config.in | 16 ++++++++++++++++
 package/ruy/ruy.hash  |  4 ++++
 package/ruy/ruy.mk    | 18 ++++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/ruy/Config.in
 create mode 100644 package/ruy/ruy.hash
 create mode 100644 package/ruy/ruy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 53f1052b07..57d364012c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2725,6 +2725,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/ruy/
 
 N:	Stefan Ott <stefan@ott.net>
 F:	package/unbound/
diff --git a/package/Config.in b/package/Config.in
index 3a07074b10..0d3fd37796 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2120,6 +2120,7 @@ endif
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
 	source "package/riemann-c-client/Config.in"
+	source "package/ruy/Config.in"
 	source "package/shapelib/Config.in"
 	source "package/skalibs/Config.in"
 	source "package/sphinxbase/Config.in"
diff --git a/package/ruy/Config.in b/package/ruy/Config.in
new file mode 100644
index 0000000000..c46f5c6cc9
--- /dev/null
+++ b/package/ruy/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_RUY
+	bool "ruy"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	select BR2_PACKAGE_CPUINFO
+	help
+	  Ruy is a matrix multiplication library. Its focus is to cover
+	  the matrix multiplication needs of neural network inference
+	  engines. Its initial user has been TensorFlow Lite, where it
+	  is used by default on the ARM CPU architecture.
+
+	  https://github.com/google/ruy
+
+comment "ruy needs a toolchain w/ C++14"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/ruy/ruy.hash b/package/ruy/ruy.hash
new file mode 100644
index 0000000000..98266b5881
--- /dev/null
+++ b/package/ruy/ruy.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  4da8572946007603378c5d0280f48c5b77f4d38763209f5306b57c7513d9a82e  ruy-3168a5c8f4c447fd8cea94078121ee2e2cd87df0.tar.gz
+# License files, locally calculated
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/ruy/ruy.mk b/package/ruy/ruy.mk
new file mode 100644
index 0000000000..ceeea8cd58
--- /dev/null
+++ b/package/ruy/ruy.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# ruy
+#
+################################################################################
+
+RUY_VERSION = 3168a5c8f4c447fd8cea94078121ee2e2cd87df0
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
