Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFE0C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 22:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE4E783F15;
	Fri, 29 Jul 2022 22:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE4E783F15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-NaoxihxXVh; Fri, 29 Jul 2022 22:02:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 691E583F06;
	Fri, 29 Jul 2022 22:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 691E583F06
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FC7C1BF31D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 22:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64A82401B7
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 22:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64A82401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CPjMIXIJDGUh for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 22:02:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B4D8400F6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B4D8400F6
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 22:02:01 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id tk8so10684551ejc.7
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 15:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=DkJi708XZWN3VPPy7AnHGH+lpIv10SuozpM+exWjjoE=;
 b=MAcr0mT1+xHnIGAhuqYf1IdDXeqP8xYINQRAH6HXN2vGEyY/78NHY8e/Z672Y4+T6J
 Ef/vgbmnnpAuzg2wujE++CgYthU/0QCw/mMhXQ1puNgNA330P/Zy5BWH4VZCPElbAi7U
 2IieR1z4jN1N1bn0UAe+MdDfXkFsoDYVWd4E6dGR8OOWcnKf+Mtwbnq/bU7ilfifJYzo
 p1p2qc6BemrFQIF4Ff33OG0k+ukso7F6hSpH3lCTV9Kxzn0no98WFtyZmVzqiwoKj8KH
 bhPQ8h6qmTFUqIiZSdZItWR2FJ3GPvu6mTWkNA0LXhnVcm78dHM+jTUO2i7RqMil9ryH
 /KrQ==
X-Gm-Message-State: AJIora9AhMb2We1Z2OlahRq1tW6a74mINWHK1Qg1YSwpfXKy0nCQFL/q
 4tTaua2CaZLIOOHhNyOYqcceJutiWpPEHw==
X-Google-Smtp-Source: AGRyM1uGtT7RS7dNNd6L3AN3payax7d+ER0/3OdcP+XLa4xXQZR+YNP7sqFWzRO0eH9OyyY8dGP2cw==
X-Received: by 2002:a17:907:2815:b0:72b:70f6:4ced with SMTP id
 eb21-20020a170907281500b0072b70f64cedmr4188382ejc.353.1659132119514; 
 Fri, 29 Jul 2022 15:01:59 -0700 (PDT)
Received: from angelo-ThinkPad-X270.. ([37.163.129.206])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a1709061da200b006fec4ee28d0sm2164945ejh.189.2022.07.29.15.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 15:01:59 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 30 Jul 2022 00:01:54 +0200
Message-Id: <20220729220154.341187-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=DkJi708XZWN3VPPy7AnHGH+lpIv10SuozpM+exWjjoE=;
 b=LaM9ndp9K0V5N9PTrE51AiAviKXAU7pWb15mHx5ZepeacLoaxMLV10VNgCLqzqBGxq
 SGGjcJr3P4d0bQA6aNGdkz5OYPVazVCRtqGB+ASWuL7l+XavXfUe7TGjQX2dinjuNpcv
 Wj//LI1U5ZRJdZ1cXj0l2Z9RT1/KbDCA7R9xE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=LaM9ndp9
Subject: [Buildroot] [PATCH v3] package/libdill: new package
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libdill is a C library that makes writing structured concurrent programs
easy.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v1->v2:
* Added comment to autoreconf (Romain)

v2->v3:
* Removed CPE info bacause unable to find te exact CPE id searching the archive (Thomas)
* Added else clause to the configure options to explicitly disable (Thomas)

The package was tested with test-pkg

 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libdill/Config.in    |  7 +++++++
 package/libdill/libdill.hash |  3 +++
 package/libdill/libdill.mk   | 28 ++++++++++++++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/libdill/Config.in
 create mode 100644 package/libdill/libdill.hash
 create mode 100644 package/libdill/libdill.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3d33e83e5a..88e0d02c69 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -164,6 +164,7 @@ F:	package/i2c-tools/
 F:	package/jq/
 F:	package/libapparmor/
 F:	package/libb64/
+F:	package/libdill/
 F:	package/mender/
 F:	package/mender-artifact/
 F:	package/mono/
diff --git a/package/Config.in b/package/Config.in
index 4ff1fb2f3c..fd0598c537 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1999,6 +1999,7 @@ menu "Other"
 	source "package/libcrossguid/Config.in"
 	source "package/libcsv/Config.in"
 	source "package/libdaemon/Config.in"
+	source "package/libdill/Config.in"
 	source "package/libeastl/Config.in"
 	source "package/libee/Config.in"
 	source "package/libev/Config.in"
diff --git a/package/libdill/Config.in b/package/libdill/Config.in
new file mode 100644
index 0000000000..0e6757b809
--- /dev/null
+++ b/package/libdill/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBDILL
+	bool "libdill"
+	help
+	  Libdill is a C library that makes writing structured concurrent
+	  programs easy.
+
+	  http://libdill.org
diff --git a/package/libdill/libdill.hash b/package/libdill/libdill.hash
new file mode 100644
index 0000000000..4a1fb91a57
--- /dev/null
+++ b/package/libdill/libdill.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  6df7527e8f1e91f5106c21c5bfeaa69eee470bec476c74585143e3e439864404  libdill-fa01648cf2a8d06e53c965b45eeacfb3ac57bd04.tar.gz
+sha256  3f78d9c42c8919cb6dc63e51de17b9eb40a49d9cdd876ce59e77392721e8c2c6  COPYING
diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
new file mode 100644
index 0000000000..b73184f117
--- /dev/null
+++ b/package/libdill/libdill.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# libdill
+#
+################################################################################
+
+LIBDILL_VERSION = fa01648cf2a8d06e53c965b45eeacfb3ac57bd04
+LIBDILL_SITE = $(call github,sustrik,libdill,$(LIBDILL_VERSION))
+LIBDILL_LICENSE = MIT
+LIBDILL_LICENSE_FILES = COPYING
+LIBDILL_INSTALL_STAGING = YES
+# Fetched from Github, with no configure script
+LIBDILL_AUTORECONF = YES
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBDILL_CONF_OPTS += --enable-threads
+else
+LIBDILL_CONF_OPTS += --disable-threads
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBDILL_DEPENDENCIES = openssl
+LIBDILL_CONF_OPTS += --enable-tls
+else
+LIBDILL_CONF_OPTS += --disable-tls
+endif
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
