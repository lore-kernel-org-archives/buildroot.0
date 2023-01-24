Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7319FC25B4E
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 09:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 236B082075;
	Tue, 24 Jan 2023 09:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 236B082075
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQGj5ChmMQaa; Tue, 24 Jan 2023 09:24:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07EB681EEC;
	Tue, 24 Jan 2023 09:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07EB681EEC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FD941BF2B0
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 09:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7642481E83
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 09:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7642481E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oSW_gvYGQkZn for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 09:22:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 793EC81BD4
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 793EC81BD4
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 09:22:48 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id z194so6794295iof.10
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 01:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ehqOOusYKpsoRMV1tNT8jMQ4aoWF6QQCMTPB22KnXuc=;
 b=AOricToaF19YF9nIam439tOpmIMc4QMmyDXJbosgVmz3ZpYS9PW+zJ2n0e6GuSZFUB
 M69KLoOiZ+U1mteOlGdLBXsn95pJFlnIAMymy+390R/doqeMAZhXR7wF620osDAtCORe
 JqvRL6zi3IRz9vvUztRrJ/LJn3rwaey/vlsW0DTmJ+ZOLqMYye4XYNDQX+Nhk8ZaTXQ8
 FUQhk6JbLIN5khxZzzXM0AQswE21v1GnzC1rnDwa9L4zfrPgQu6W8zCTvbjXwp7sZzEZ
 dTtzh7MdsegTRY0fYp61J2cLGvw8Pxtd9EZLvpUAZy28eZHiJb9rc5lhQtU+TVXYlumK
 l4Mg==
X-Gm-Message-State: AFqh2kryfxLX92wDmvqyTMj8RrUzxdADTHhtQ+02DJJx8/Qo3LL988hd
 L2hoeAw2KJ3m1imLA8+/HZ7uHXNfA1tvGw==
X-Google-Smtp-Source: AMrXdXs0rYrXAmGpxZ5rVmNAHtoDCEVfoWmQvdxsWQlOWMsSHLr+EY0NyIDi+V1UVaJRFO5NrNyO2w==
X-Received: by 2002:a6b:b4d2:0:b0:6df:e3ad:1e1c with SMTP id
 d201-20020a6bb4d2000000b006dfe3ad1e1cmr19830647iof.12.1674552167415; 
 Tue, 24 Jan 2023 01:22:47 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 v26-20020a02b91a000000b003a7d5061e1bsm524923jan.111.2023.01.24.01.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:22:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Jan 2023 02:22:34 -0700
Message-Id: <20230124092235.806969-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124092235.806969-1-james.hilliard1@gmail.com>
References: <20230124092235.806969-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ehqOOusYKpsoRMV1tNT8jMQ4aoWF6QQCMTPB22KnXuc=;
 b=Xc+VL8CDRQnbL8NPem3qCt24AoyHSM7q7BkJl1pVXCLk5ey3AOSD+YQ8L9oOhz/GL9
 r/gN7bVdR4WXQizRazsdWw4O1B2uUkHH2fyTmkk9KumcggMdVwqLpsXeubLzkafUd5VJ
 tavnRXiZcG60PNJaNvafnskBfetO6Pr9n4ro12mBywt51K+m4unp7f21WPAETNzsBxTy
 TDOoQQw4WqVgYJUfYy6CPSiunfulr1UF2WwBWzODv1YOnwU7klyXJZZFF6XLkKktL4BR
 ZJeXEL2/UlvieCcMLIFXD50ALR1vMnoLFL/LEGTl4QbZDGe4lQW82nYjCNyupbcNxTnB
 KuBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Xc+VL8CD
Subject: [Buildroot] [PATCH v3 7/8] package/farmhash: new package
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
 package/farmhash/Config.in     | 12 ++++++++++++
 package/farmhash/farmhash.hash |  4 ++++
 package/farmhash/farmhash.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/farmhash/Config.in
 create mode 100644 package/farmhash/farmhash.hash
 create mode 100644 package/farmhash/farmhash.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a2411bc749..d4f3a3e2f8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2703,6 +2703,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/farmhash/
 F:	package/fft2d/
 F:	package/gemmlowp/
 F:	package/neon-2-sse/
diff --git a/package/Config.in b/package/Config.in
index dd16df061c..9e16084148 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2003,6 +2003,7 @@ menu "Other"
 	source "package/elfutils/Config.in"
 	source "package/ell/Config.in"
 	source "package/falcosecurity-libs/Config.in"
+	source "package/farmhash/Config.in"
 	source "package/fft2d/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
diff --git a/package/farmhash/Config.in b/package/farmhash/Config.in
new file mode 100644
index 0000000000..ef22898774
--- /dev/null
+++ b/package/farmhash/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FARMHASH
+	bool "farmhash"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  FarmHash, a family of hash functions.
+
+	  https://github.com/google/farmhash
+
+comment "farmhash needs a toolchain w/ C++11"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
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
