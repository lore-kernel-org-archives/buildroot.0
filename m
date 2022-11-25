Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85564C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 16:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 081DF611DB;
	Fri, 25 Nov 2022 16:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 081DF611DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPxBTquSjaBF; Fri, 25 Nov 2022 16:08:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3328C611DC;
	Fri, 25 Nov 2022 16:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3328C611DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A77D61BF5DA
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9145F820C8
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9145F820C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R5smHZZiMDdt for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 16:08:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A729981A27
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A729981A27
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 16:08:01 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id y6so3324614iof.9
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 08:08:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jV91SKhb/jzmsnlD/kJwcSI5+/8b4CpmUHUfX+vNsbw=;
 b=2+vA2MSY3/AOVSuuYY464pseNTorhkVepXYwEz1OXMUQfnNVnS3fcZF+JislbqrVI+
 iedWLhQCakGvdtTInKOax5CqhjL4OZmcnkqfeDtALWQk38DTBd36W6cj7F6QKZWebSap
 d/ebhXkQcY+kg9OtpOzvK3wLZ3M2M+wbhdB/EBYObyC4YhiWwJg8+dOWo612nHmN3l/S
 qjasZN7DjEWHTzWCB1qMTzZVdiqTNVsc1KGa+xp0oiuIhVh5XAr6YsR3i2a+HVPS36p0
 jg2M5t2FCpaOP6d3mxXyS2kEv2LPLIBEK2QrBhYR92B6yzhQ2REvrWfgpQt/S9va4+Om
 3clw==
X-Gm-Message-State: ANoB5pkA48Dq3zpvltf2XGv55QZBRn4iQo515jVR6SYlTJ5wFqvksx3R
 IxOonnVzIjpouoQu9bEdYwq5ZaoV7xR/aQ==
X-Google-Smtp-Source: AA0mqf4pJaWfPPJtyIP+jSY3Ohpva3jc65sTWQ0Yx6NjPEDD2PBIbWlA385rSCcnMBtqLuoH7hSspA==
X-Received: by 2002:a02:6602:0:b0:375:451f:8eb2 with SMTP id
 k2-20020a026602000000b00375451f8eb2mr16913211jac.43.1669392480932; 
 Fri, 25 Nov 2022 08:08:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-226-239.hlrn.qwest.net.
 [71.218.226.239]) by smtp.gmail.com with ESMTPSA id
 z28-20020a056638215c00b00363753f4730sm1497384jaj.91.2022.11.25.08.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 08:07:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 09:07:19 -0700
Message-Id: <20221125160724.1725476-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125160724.1725476-1-james.hilliard1@gmail.com>
References: <20221125160724.1725476-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jV91SKhb/jzmsnlD/kJwcSI5+/8b4CpmUHUfX+vNsbw=;
 b=JC4nuWpY5mwiwczHUCaI5+Hz/8MBMF72M6WG99RT9Fg1B4l2vN5zF6xZd140usBo6m
 1ItZk1vNBZ+OsWwoTDS959wPl12XE8O7SU28UiYh0SQURL8F2zhH8hfN+bX2ueXv9JY8
 ZRMycSAZ2Dxbfp4xqWLre94HcMKBCckzvkke2uuketN4JPMxlbNnq4dNOL3d1h4MdT4Y
 02twm42ybcXIyD6qDhhHtDd0irx2JnGJRRCTexUSM6y6CyndiQD4Z/8EY3J9ZAEhxD16
 AeC/2XKn2iQbK/m+/E3MoOjTQ1LXztnadOgskSSuaReXxJQ1qgl/yEmNqfzoaYw6XqWl
 +sQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JC4nuWpY
Subject: [Buildroot] [PATCH 3/8] package/ruy: new package
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
