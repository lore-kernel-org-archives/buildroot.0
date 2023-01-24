Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F04C54EB4
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 09:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA9B661021;
	Tue, 24 Jan 2023 09:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA9B661021
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j_vX2AfHc_vq; Tue, 24 Jan 2023 09:23:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3179660FFF;
	Tue, 24 Jan 2023 09:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3179660FFF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69F9F1BF2B0
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 09:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5047161021
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 09:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5047161021
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7hupApsaCWGU for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 09:22:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4770260FFF
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4770260FFF
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 09:22:45 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id f8so7178443ilj.5
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 01:22:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d3qb+pxPf/Y+6T98sQQywvS5ACnuKYTUZhHhDXq7ezc=;
 b=pC044inKODv1HJf4qd6MReJ7O8Lb1wzbBmG7OfvEMsfvPTbWwAMndV3wXnHmtWSE92
 Ga0i4cF5IkTK0eQTfnvn3KDQ8yRVUwwCRI9tMv4gf7kyzcBlFA3/P1mMKs+uW2U/JTiZ
 4nTavVB66CSuFlbB3mX4TSuXrmqQoAkaa+KYjNMB2pRtKwkgBJUD1jw4KakUCShldrmi
 iAd1XJxYkP2OjsHm197teb733TyBInVtqjpwhB9xbNo3dd9kWmHEK7nT5YlpeZSxyGSH
 OCoQPKjWiG4Okz1eIxZmSD74kvEaV0Ondsse1JUZ+JycTsjOZgk9KNUs6pNPQ8bQB7Ig
 xU7A==
X-Gm-Message-State: AFqh2kpGvaBEwP8LZRGarWKBJbNlBftZgpt+MPc2ILeYXfosOSBCb82T
 eG0UKlivK5SvBu18Thz385Pff1VnTsfwTQ==
X-Google-Smtp-Source: AMrXdXtZ0J9Zm1RFrV0lDV2v3Kyk7igjMz5Kz0yQTAYNdX8mFbhIUp/VEebacDwmaEVlAfez5W2vbg==
X-Received: by 2002:a92:c261:0:b0:30f:641b:d12b with SMTP id
 h1-20020a92c261000000b0030f641bd12bmr13872901ild.21.1674552164230; 
 Tue, 24 Jan 2023 01:22:44 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 v26-20020a02b91a000000b003a7d5061e1bsm524923jan.111.2023.01.24.01.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:22:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Jan 2023 02:22:30 -0700
Message-Id: <20230124092235.806969-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124092235.806969-1-james.hilliard1@gmail.com>
References: <20230124092235.806969-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d3qb+pxPf/Y+6T98sQQywvS5ACnuKYTUZhHhDXq7ezc=;
 b=puaP4DL26DkUnLzaPbwqfBQHXZgydHJb9JfiJH3LVRF1zqPir1j+F34Uijslg/J4C1
 Y11/7IKXcS2P/M9MH9j5Ww5kbvuaAC26t28dkIo+nxz9OBo4RFDdK2xR/rZEtIkr2FaR
 dTW/Po1+jf9OOR+eKzPQPJHWy3792CcMjp3sMaN4Pq+LSOb1NzHLNU0gYHA2aZOHuYUq
 1+W4spHCIUW/+Uu/leZgG9CoWAr6HbHecdFZcIranNiDdncMK9IvAMyB6mhFEyFEBlRD
 8YAku94XMoAYhxQXgyfNsmRBsn2Z7I6zHVCI5IFVKul0oM1uO2pkseUa7ye+JSMPJ4H2
 ZSCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=puaP4DL2
Subject: [Buildroot] [PATCH v3 3/8] package/ruy: new package
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
