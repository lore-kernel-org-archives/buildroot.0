Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E516FC54EED
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 00:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FCBF4059C;
	Mon, 30 Jan 2023 00:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FCBF4059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQvZhqX2Upd3; Mon, 30 Jan 2023 00:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96A8940567;
	Mon, 30 Jan 2023 00:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96A8940567
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC07C1BF869
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A72D140585
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A72D140585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 55KO7N1ZrjkV for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 00:29:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C74D40567
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C74D40567
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 00:29:03 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id m5so1377588iop.2
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LBNtOkSg17gszu/4xZoYtW+a4QXUagCUFvK7xUIUx4c=;
 b=R2Lp3GGoI1fO/WQosfgAJFTb4J5LU2DovHBL5Kzz6yzdEKo5zAMTEesT0eFFnhrjET
 aLfGc6OaxbvPD1oqCh6muOhR5J/PuwXtfyjlPgUnk9BDkfled9E40R7WYeoXuvUaPCoE
 jE+i+Ypbq6eQywKLzFmQZYvpSM1LKKTnaK6qK9Gx2uB5LDHFddNM1q7gOTXMKz302A2V
 bNfl4wYZLfc+qSpiALX6GEObH3DZgQvvBtw7p/e302N7xZcP3z7wERqFtJNKLAj7glT2
 2oJNHLiM1RwhfX6EcKl1kgzW/b+bezoWk5K0g1q2/fq0DG41j0f7id4I7LHev2h7JYWf
 9FqQ==
X-Gm-Message-State: AO0yUKWmmbVL3OZpoYdOrTFQ6waFqak5p2mbbnW6kOMnpNOqT6g9c1eU
 /5ujWJh2jBHNJieM04Aymz4FSFAabV0fmw==
X-Google-Smtp-Source: AK7set/yhQ4fcr2D29KCm9AtSFgyda4qXlM7EahhVn7u/sKbK+G8kUzeFyhbxeXyKRfh3+xWyWL9eA==
X-Received: by 2002:a6b:d90f:0:b0:713:7b7c:46d7 with SMTP id
 r15-20020a6bd90f000000b007137b7c46d7mr4973278ioc.21.1675038542457; 
 Sun, 29 Jan 2023 16:29:02 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 q4-20020a02c8c4000000b00363d6918540sm1676570jao.171.2023.01.29.16.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 16:29:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:28:47 -0700
Message-Id: <20230130002854.2300661-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130002854.2300661-1-james.hilliard1@gmail.com>
References: <20230130002854.2300661-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LBNtOkSg17gszu/4xZoYtW+a4QXUagCUFvK7xUIUx4c=;
 b=iFauwxMCdQuNx2g6mZCR/sWR0BSAnpV1/Xe4FL+oC+U2Y8OUdxeMyRL5AOmlljH2g2
 dMHzIngE6Xbygvdh0WRoMSRoHJ5r01t3dCB2DE0aurQgnjJqQmKeEJzO1sTsc0gBjvYA
 ReJ7LvcSZcy7csrL8EqUPalT83vRI/lQerTwqdibJ55ZBNCVa63K7iWQOv9ZQrgkHO28
 cPcDg0Z3uGqbf6ykpU68mBhLklhSGHLfE4GFDHKa65dWKig12eNlg+vFQ2yOZ/rBe0/x
 oAwKey/5gV3cDDARGNEguph9k/BLsY02o10+6CifrL3HYOmjFkUyusvd3kQHdlF2NLf1
 TY8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iFauwxMC
Subject: [Buildroot] [PATCH v5 03/10] package/gemmlowp: new package
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
index 57d364012c..01e64e5fc5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2725,6 +2725,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/gemmlowp/
 F:	package/ruy/
 
 N:	Stefan Ott <stefan@ott.net>
diff --git a/package/Config.in b/package/Config.in
index 0d3fd37796..8fd8f05bd6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2018,6 +2018,7 @@ menu "Other"
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
