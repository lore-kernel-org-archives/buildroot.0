Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFA4C4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 17:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6E3340580;
	Mon, 28 Nov 2022 17:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6E3340580
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EqmGgaHW2fkr; Mon, 28 Nov 2022 17:59:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0162740643;
	Mon, 28 Nov 2022 17:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0162740643
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 956A81BF335
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 17:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F4F6408AC
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 17:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F4F6408AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mTcG0LuIcI-I for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 17:58:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90468408A1
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90468408A1
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 17:58:58 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id z9so5396666ilu.10
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 09:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jV91SKhb/jzmsnlD/kJwcSI5+/8b4CpmUHUfX+vNsbw=;
 b=Zy/Pytx2EZNIH0fynmm7majB7y5it7Memdso5WvxRSvmO1dsUoDI+cWsmb5yLS+ZTT
 zE1yTyHZkf8bl57p1Xb1GtCRpNQxry7FKmrwGYAUjzlGlZvAYXiFa8dr/oxTEYvpfj8Q
 rcMxBAST4RVpv7K5hM7vOoP2FyVDKsmQEQP3IE1t0anfmrN8pzP0tCrf1/7AYS88qS6u
 1wBEhOk1RYExS13XWjaOvs+km7izLa0D4KzRgIXE5mJr5Ldoz57VXqkp8D/tMj0njcky
 69qngWyQKT6RYG6zvtOrWaOhOeA3ieFG/UXq7Nr4SGmWzru2UnQLO5VgNfjUSRVmXn53
 MHcw==
X-Gm-Message-State: ANoB5plEKodsIGwEe0zdV/7v+tXovoCNVmhXkaZSWi14bBj4D7CO8+Lr
 rqKOsswylxK54bP3328mKbjX3Zr1HdXU4pgQ
X-Google-Smtp-Source: AA0mqf7oqg2d5aC6Gq2b2XTFXS5iplvazcfK1UgmyM9xg9k1bS0UWV8NawPeNkaHtp4LKEzIlevU8A==
X-Received: by 2002:a05:6e02:c82:b0:302:a9a5:d60f with SMTP id
 b2-20020a056e020c8200b00302a9a5d60fmr15401605ile.238.1669658337222; 
 Mon, 28 Nov 2022 09:58:57 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y16-20020a056638229000b00363781b6bccsm4564802jas.49.2022.11.28.09.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 09:58:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 10:58:46 -0700
Message-Id: <20221128175851.1913859-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128175851.1913859-1-james.hilliard1@gmail.com>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jV91SKhb/jzmsnlD/kJwcSI5+/8b4CpmUHUfX+vNsbw=;
 b=Eg9pyuFZEhYsorJF2j9RGQSabmnX1++BxCkQPkaZh5BnqbCsKslMfKJHQzTMt7mT9d
 WIMt102/Y353rihqWDnoxOA6brbGppzH2vyQqsyYPyUTBpUWhKWRh5ISD/RhcGlEyod3
 oXIHlAj9dqsyaUh9nE0rHFnhsGG+AWtVHFRwg0OjCB5w98UXNWFi7+WCreRIC7L96R1z
 OtSOUxLWXljm3us8BV7YCv/HmDjqVEfpteHE6yiMWZAYAjr76wFeM6aOxGzYTVdWuiQg
 v6sCSGf4LDhqmUJ7ECcWGb5G0ltw4joz7lgYWouNxJ3HKABqmJMrMNnUb7Z12bjn+E6Y
 Sr9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Eg9pyuFZ
Subject: [Buildroot] [PATCH v2 3/8] package/ruy: new package
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

Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in     |  1 +
 package/ruy/Config.in | 11 +++++++++++
 package/ruy/ruy.hash  |  4 ++++
 package/ruy/ruy.mk    | 18 ++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/ruy/Config.in
 create mode 100644 package/ruy/ruy.hash
 create mode 100644 package/ruy/ruy.mk

diff --git a/package/Config.in b/package/Config.in
index e09fa0b3bd..45e66caa8c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2095,6 +2095,7 @@ endif
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
 	source "package/riemann-c-client/Config.in"
+	source "package/ruy/Config.in"
 	source "package/shapelib/Config.in"
 	source "package/skalibs/Config.in"
 	source "package/sphinxbase/Config.in"
diff --git a/package/ruy/Config.in b/package/ruy/Config.in
new file mode 100644
index 0000000000..ce7ab5d585
--- /dev/null
+++ b/package/ruy/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_RUY
+	bool "ruy"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_CPUINFO
+	help
+	  Ruy is a matrix multiplication library. Its focus is to cover
+	  the matrix multiplication needs of neural network inference
+	  engines. Its initial user has been TensorFlow Lite, where it
+	  is used by default on the ARM CPU architecture.
+
+	  https://github.com/google/ruy
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
