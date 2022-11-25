Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D403C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 16:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99E93401F1;
	Fri, 25 Nov 2022 16:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99E93401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ib0A0zz-BxMu; Fri, 25 Nov 2022 16:09:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4F8F405A8;
	Fri, 25 Nov 2022 16:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4F8F405A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 149F21BF5DA
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F231C611DE
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F231C611DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IV4qkDFdeWxC for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 16:08:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD7D1611D2
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD7D1611D2
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 16:08:06 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id g7so2178911ile.0
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 08:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+/UR+AP32JF4xzJacsTP0deBX+kUNIvU6O7VWLCP4w0=;
 b=xJnCxqExgRbCFfbKGLFg0y9d4rEPzlXQx/EZP1o0Mw8wSCmZI6MjE+LpKH0NYStdze
 h/PSlmhYKGAPnflKMfHsSWW9R50QYyfHAoyXjb3fN5vtprrftjYojQcO1s5QfU27K/aa
 YlFiYXeauHzmGHt38nuU436eHGxZjRWYLeyDS77amNdCeyMS53nTrLVJnLrD9mD1/LpP
 c3i9b5mMm8ptJh3PGIRB/q6/Gl4L9tBdVdhjk6QqkQ6HrPgiUskUapESVXioDoQWh8SJ
 wNoapsB2byT8fBo3+sFzHBSfj+9UZ4wuHoQUbHUBu19JGnpwdcohv3LUNaD9hBeR+Obn
 iZEA==
X-Gm-Message-State: ANoB5pnvgqlBF3VRt5bn2Fb8TWlE03ioucOc+tAuBgUKRtMBjikL02vV
 GJbL+AdT7iErDuyx1OtncNudpl5LwuapgQ==
X-Google-Smtp-Source: AA0mqf7EyTPI6pg5ULMXBrpAOQTURfz9pKsoOgu1EKeO/m7RU2IrqG1KjMmrxg9srp5qlWDRtNox1g==
X-Received: by 2002:a05:6e02:12ab:b0:302:e30d:c3f6 with SMTP id
 f11-20020a056e0212ab00b00302e30dc3f6mr5200415ilr.192.1669392485630; 
 Fri, 25 Nov 2022 08:08:05 -0800 (PST)
Received: from james-x399.localdomain (71-218-226-239.hlrn.qwest.net.
 [71.218.226.239]) by smtp.gmail.com with ESMTPSA id
 z28-20020a056638215c00b00363753f4730sm1497384jaj.91.2022.11.25.08.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 08:08:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 09:07:23 -0700
Message-Id: <20221125160724.1725476-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125160724.1725476-1-james.hilliard1@gmail.com>
References: <20221125160724.1725476-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+/UR+AP32JF4xzJacsTP0deBX+kUNIvU6O7VWLCP4w0=;
 b=OorMHpXW12znJmPnoQklDmU0SxTvzYZMHTZRIuHV7FLEtBWXSCUVQMWmMavXUIv9vT
 o/x725mPluleBcJQLz3S1B+/btB6032fjS/A1LYsoVfoPQpuEP3lnDxI2L802k3Y4NM3
 26V7kLnHs0pqVl9eXN+f2+E+eTg9HDIj38ZJzWIOFsIs4p2RmogesaHuuEMQWkVUeOjg
 7dWOXxl1UtAJ0HGvXpbEFbxawDeoq+ffSeYggSksFmtGyuKoQ+yhUZFnfN3IA4qS2MUV
 r8pd+/ywsvYvybD1r2fd/iedoSxdnlkwZoo+S403YDf6pYKpsHuSNKfAd0kJRkLYh95c
 Zvpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OorMHpXW
Subject: [Buildroot] [PATCH 7/8] package/farmhash: new package
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
 package/Config.in              |  1 +
 package/farmhash/Config.in     |  7 +++++++
 package/farmhash/farmhash.hash |  4 ++++
 package/farmhash/farmhash.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/farmhash/Config.in
 create mode 100644 package/farmhash/farmhash.hash
 create mode 100644 package/farmhash/farmhash.mk

diff --git a/package/Config.in b/package/Config.in
index fe636fde9d..a59d074430 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1988,6 +1988,7 @@ menu "Other"
 	source "package/elfutils/Config.in"
 	source "package/ell/Config.in"
 	source "package/falcosecurity-libs/Config.in"
+	source "package/farmhash/Config.in"
 	source "package/fft2d/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
diff --git a/package/farmhash/Config.in b/package/farmhash/Config.in
new file mode 100644
index 0000000000..0ad16f933b
--- /dev/null
+++ b/package/farmhash/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FARMHASH
+	bool "farmhash"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  FarmHash, a family of hash functions.
+
+	  https://github.com/google/farmhash
diff --git a/package/farmhash/farmhash.hash b/package/farmhash/farmhash.hash
new file mode 100644
index 0000000000..afdfc0f994
--- /dev/null
+++ b/package/farmhash/farmhash.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  18392cf0736e1d62ecbb8d695c31496b6507859e8c75541d7ad0ba092dc52115  farmhash-0d859a811870d10f53a594927d0d0b97573ad06d.tar.gz
+# License files, locally calculated
+sha256  4162dd091caae234f72d3b57e138174f733e736b2430a4c51b098b17d866fcb6  COPYING
diff --git a/package/farmhash/farmhash.mk b/package/farmhash/farmhash.mk
new file mode 100644
index 0000000000..6ab7d1a88b
--- /dev/null
+++ b/package/farmhash/farmhash.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# farmhash
+#
+################################################################################
+
+FARMHASH_VERSION = 0d859a811870d10f53a594927d0d0b97573ad06d
+FARMHASH_SITE = $(call github,google,farmhash,$(FARMHASH_VERSION))
+FARMHASH_LICENSE = MIT
+FARMHASH_LICENSE_FILES = COPYING
+FARMHASH_INSTALL_STAGING = YES
+FARMHASH_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
