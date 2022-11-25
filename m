Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25119C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 16:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C62B2611CF;
	Fri, 25 Nov 2022 16:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C62B2611CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yWYPAD3Z8LxH; Fri, 25 Nov 2022 16:08:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F05FF611CE;
	Fri, 25 Nov 2022 16:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F05FF611CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A91FA1BF5DA
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D192611DB
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D192611DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kbB70-nm9WXb for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 16:08:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 948A7611CE
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 948A7611CE
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 16:08:03 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id r81so3342582iod.2
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 08:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NkxPNA5F3tLQheb8jim0Blgupw3YYdZGZC25ymbd0qc=;
 b=z73NBXUqn0L1MAaEHqbBbR0SQQHApBqRSmUw+X1mGWlNdzVjIr6CNSo3iRWT4gdKid
 G4/a6xKKwGIDBbvCyJtCZdy0IGRL/PH/aDL10+g8fH1Sm2zlADxfAon+GnGYw+fumApk
 WPzBPde56N+/P+IXzGgdP16RykGDbuygjJvQUIZ5dx17JVTcMaMvxMFEhw1R2yGsPwG/
 UlaTE/PnLrFsXll5Fzl0xwGcPfE1ZYtuDRkfwQp6RkX14wzXLP9teRsJanIIgLn+eoGZ
 /19QyDrkbdyFbfqtw62cKIvF1cCL4Oeh8oVYy2qF1wMvg6V2sOlyLQ/Aj/C8R36QfkEa
 +JTQ==
X-Gm-Message-State: ANoB5pnPgKzUTGNInEDt2MlD0fkaA2ZC1isGLS6QtrJ+enFR7ayVDZuI
 2JloIoHXyN0Y8a1vhsF/QpdpIadb2xAtiw==
X-Google-Smtp-Source: AA0mqf5mXn3qTBfGn9RjvFHeNV9tqM87c2mQX13z3FdjKMDhkGbMYzulDISf068YQoatHUSJegtPkg==
X-Received: by 2002:a6b:ec0b:0:b0:6db:6299:112f with SMTP id
 c11-20020a6bec0b000000b006db6299112fmr8091466ioh.25.1669392482167; 
 Fri, 25 Nov 2022 08:08:02 -0800 (PST)
Received: from james-x399.localdomain (71-218-226-239.hlrn.qwest.net.
 [71.218.226.239]) by smtp.gmail.com with ESMTPSA id
 z28-20020a056638215c00b00363753f4730sm1497384jaj.91.2022.11.25.08.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 08:08:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 09:07:20 -0700
Message-Id: <20221125160724.1725476-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125160724.1725476-1-james.hilliard1@gmail.com>
References: <20221125160724.1725476-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NkxPNA5F3tLQheb8jim0Blgupw3YYdZGZC25ymbd0qc=;
 b=CbmCz13Vs9YoDVe0bCWLlLB/4CChQ7cl5LUJBKfvIrYNqEbLV6wTAIPnLTtwRW7Mc2
 VVNrCb+3KQQ+ObsDqK9clY0ksv9ZpE4JECeBa8i9IuBKGUYG2UJLc+YiStzCDwTvOLKT
 9Hk+ZuNTXw898P5fDpfHNTUH4LazQZpCO8AQzE9g0eUw06PpUL84dI2UKf6mdGJ4QwKt
 Rw4899Kd/aYb2fueBn54g5+ZLZh0rzlQre0+K3FNOm3AhpGblzkoYxVWguR66RvxYXkR
 kgwb2jEbyP5k6ShjiVJvRHaGwqtXaP+WWcz9Jn0X58Oz8mBPPP3F0NN9fOMJpYpH+6aW
 n9SQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CbmCz13V
Subject: [Buildroot] [PATCH 4/8] package/gemmlowp: new package
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
 package/gemmlowp/Config.in     |  7 +++++++
 package/gemmlowp/gemmlowp.hash |  4 ++++
 package/gemmlowp/gemmlowp.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/gemmlowp/Config.in
 create mode 100644 package/gemmlowp/gemmlowp.hash
 create mode 100644 package/gemmlowp/gemmlowp.mk

diff --git a/package/Config.in b/package/Config.in
index 45e66caa8c..d0d9d2905c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1994,6 +1994,7 @@ menu "Other"
 	source "package/flatcc/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gdal/Config.in"
+	source "package/gemmlowp/Config.in"
 	source "package/gflags/Config.in"
 	source "package/gli/Config.in"
 	source "package/glibmm/Config.in"
diff --git a/package/gemmlowp/Config.in b/package/gemmlowp/Config.in
new file mode 100644
index 0000000000..24ba6e9768
--- /dev/null
+++ b/package/gemmlowp/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_GEMMLOWP
+	bool "gemmlowp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Low-precision matrix multiplication.
+
+	  https://github.com/google/gemmlowp
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
index 0000000000..1a36fc48f7
--- /dev/null
+++ b/package/gemmlowp/gemmlowp.mk
@@ -0,0 +1,15 @@
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
