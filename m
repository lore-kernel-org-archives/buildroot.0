Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E919AC38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 14:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C9B041814;
	Fri, 27 Jan 2023 14:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C9B041814
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odioJjRvZTTn; Fri, 27 Jan 2023 14:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74ED2408A5;
	Fri, 27 Jan 2023 14:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74ED2408A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B0DD21BF39E
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98ED6417DF
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98ED6417DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XveUoniLgK4H for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 14:11:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56E03408A5
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56E03408A5
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 14:11:03 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id c66so1938788iof.12
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 06:11:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d3qb+pxPf/Y+6T98sQQywvS5ACnuKYTUZhHhDXq7ezc=;
 b=rKHOYbfESB2XzE7naXVzqaDgDIG1U+paro8Oa0g3h2Q1nWFeppicGLDWJlUFFvRapt
 6ogFjZK2RjPIT+iRxXwo8gUVQ8BMRT5smgmtU4I3yjIuDRVgdyNhLW2kwIZQInaCg+Nu
 g8fOyxqixBN0bykqQyI9UaCsutyjCVnxyL9H3SONYYFo2o7fzUUdW4QBpaSerMrRiprg
 DEXr0TWaXZmJZo/ytN/zq0OZ1RZpgbS4KYfiJGMHR55/T3wDNWBUaqdttQ3M1/cQBcid
 yN7zi/8hoZym5Brdbd4YS8vJ9whooyFRl1t8QyaoaCWrCAio3RXyZM1zNwcqF6cc0pLq
 lJDA==
X-Gm-Message-State: AFqh2krR8Q71o8RiI3Y0NtLC+YtEC0PIKdADQNkaG9Uv7sn+hybLNfQU
 yQ7SsFHc+s7uesHXojpXklk7AJ/KKSsRRA==
X-Google-Smtp-Source: AMrXdXsbIn41MA3K17l5BMtv3JVP+KoArWxRch9wR9Fv+sOZvwIVnFT8oR87UnWEZHRQgrwZAEIUMQ==
X-Received: by 2002:a05:6602:1516:b0:707:67c0:43a6 with SMTP id
 g22-20020a056602151600b0070767c043a6mr25253266iow.5.1674828662214; 
 Fri, 27 Jan 2023 06:11:02 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 n2-20020a6bed02000000b006d8b7bcaa6esm1290806iog.4.2023.01.27.06.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 06:11:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 07:10:48 -0700
Message-Id: <20230127141058.2180747-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127141058.2180747-1-james.hilliard1@gmail.com>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d3qb+pxPf/Y+6T98sQQywvS5ACnuKYTUZhHhDXq7ezc=;
 b=mWPAWijyTw1Qekp9XlcS2R6viWyPOZmOwyVadi0xJbF9J9SfkgEG7pfxFJY1asAsF3
 AWjvICxumSupdZqfIuzzyE3aZGxA/7nF+BlewcoFJKQ/THXGuIJmACgRCJVXuC9v9ClP
 mHKsUHuagix11cYnIVBfXU3On3r8plEi7BILQsozoUYELzrvx59teQIhaj65KVQ5kZPQ
 /6iBatNTuETqePUMUeZke8qCSNBuybGAhizdyvbLjV+1zcsS2ZIMhdsn8CPvGKZIxSc/
 vkOrGTbFDdSTqg8gfE2H7tbkK1Xk3Irw8WfPu9HcRnMJayTKB92rpIcE+CCPyIsgooRY
 vtnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mWPAWijy
Subject: [Buildroot] [PATCH v4 03/13] package/ruy: new package
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
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
index 3fd5ea32bc..ba26d5f999 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2703,6 +2703,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/ruy/
 
 N:	Stefan Ott <stefan@ott.net>
 F:	package/unbound/
diff --git a/package/Config.in b/package/Config.in
index 5537699c86..29d55ef2b3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2110,6 +2110,7 @@ endif
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
