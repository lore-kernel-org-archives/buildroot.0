Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F785C54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 14:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE07D41824;
	Fri, 27 Jan 2023 14:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE07D41824
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x8XDdd9ZMdLf; Fri, 27 Jan 2023 14:11:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D552B41826;
	Fri, 27 Jan 2023 14:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D552B41826
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7E631BF39E
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E15F82FBE
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E15F82FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJgCu42ItawU for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 14:11:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C3E182F4A
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C3E182F4A
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 14:11:03 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id s26so1940919ioa.11
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 06:11:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HxiIk5b5RsOhHX2NxJcDXQsBEfCS6JaLqGGmfdhrJtY=;
 b=fVk8E6VHaBetI9L9m6MJ3O+DWxL+6pCCSdkoM987UN26kPCrIGoNqQwZlM9eeETcVs
 tD1meawXVto5AwQieshnT3nLj4rbQzZQ25HmUSlhIN/2NYwRHfFqMhgnbPQLHx5zrvNC
 zY6mBJOr1tp5UUN6z8Hl9NFjldAoI99yfg+bhZMeW8KfO1QJMsMU+WD99qTs5OaNGIrp
 G7QU1a6VhyCi0N6mucov9tlQBo1meYi/LzFryvJpXING/fZQHKFf7bkB+v1rZC2ECq40
 bP867C5bLV/MyTsFA5mSp8JMhSaFPJqiR/hyV/zM+NbZwcn0/YawvSqc9126V5T68Zgj
 AXCg==
X-Gm-Message-State: AFqh2ko1wNE9kkbpRzDZ5UbdE2XRi0XaskNsvBxUM+hThm4RSis4U7/u
 LAoTrN0/6UnPquHbZUGfpNc8ICPwSByo1Q==
X-Google-Smtp-Source: AMrXdXsiqinZ8xJiZk4JqD/JZWEaHIxOoOTGzDdFYzXwPhRfT7+Dg9hLjngEUk4n3oZ3jT2O8hgKhA==
X-Received: by 2002:a6b:3f06:0:b0:704:dbc5:1de4 with SMTP id
 m6-20020a6b3f06000000b00704dbc51de4mr26736744ioa.21.1674828662915; 
 Fri, 27 Jan 2023 06:11:02 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 n2-20020a6bed02000000b006d8b7bcaa6esm1290806iog.4.2023.01.27.06.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 06:11:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 07:10:49 -0700
Message-Id: <20230127141058.2180747-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127141058.2180747-1-james.hilliard1@gmail.com>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HxiIk5b5RsOhHX2NxJcDXQsBEfCS6JaLqGGmfdhrJtY=;
 b=d+CKyie0lcePY1mVifXM9oBJB59qPFwPMbE0GT5hEEFCTDnW5kbo9c1tPHQG9JEu8v
 nrC6Xk5keGa757cHwaRagH5rhmo+T0zXrUNCbE7VMk/rMW/+1xVprMo+S1D6WbtHUYLd
 9rz8R5m9xTo2XpvSmfUcIck5GmDHdtjL0IeKXgUPsYfp/6hAVSrvAiNhPHyMbjItM/lQ
 gwyD2VKNVkg+Ia7G6+b6Q8R+YZJx18BYaY02t9q/NGhHaT6ZnZNYskVJxxxLPD2ko+pw
 7j3B7wS2Unw+4NjjjGcaO70rgprkQhZR0Mhw1dFKTVoorhW2YqzaYYzZPUq5n62ECXyp
 U8hQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=d+CKyie0
Subject: [Buildroot] [PATCH v4 04/13] package/gemmlowp: new package
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
  - add C++11 dependency
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/gemmlowp/Config.in     | 12 ++++++++++++
 package/gemmlowp/gemmlowp.hash |  4 ++++
 package/gemmlowp/gemmlowp.mk   | 15 +++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/gemmlowp/Config.in
 create mode 100644 package/gemmlowp/gemmlowp.hash
 create mode 100644 package/gemmlowp/gemmlowp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ba26d5f999..f48ea66660 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2703,6 +2703,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/gemmlowp/
 F:	package/ruy/
 
 N:	Stefan Ott <stefan@ott.net>
diff --git a/package/Config.in b/package/Config.in
index 29d55ef2b3..8f78080963 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2009,6 +2009,7 @@ menu "Other"
 	source "package/flatcc/Config.in"
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
