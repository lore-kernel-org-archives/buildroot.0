Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E67C02190
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 17:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2BDF83942;
	Tue, 28 Jan 2025 17:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QawwEdjd_6Fp; Tue, 28 Jan 2025 17:02:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE8C383AA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE8C383AA1;
	Tue, 28 Jan 2025 17:02:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9EDD2019
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C152683A6E
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pL3n5PybIiin for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 17:02:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A859983A0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A859983A0A
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A859983A0A
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:02 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-844e7bc6d84so187839839f.0
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 09:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738083721; x=1738688521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lOQEb1ukFSgsWHXrlkuQpyjrluRfV0nwHYKIHBglJBg=;
 b=VkZLw4kfn17eafgN1ACNVTH0xTwGAvVr+OIee+lw39/Ra6bAtW3RZufW2P78D+OEvt
 f/07qyK2c+hXHgAMZyYVQ7JnAoKrcHMmnf8lDKvXzxhUhia1gSKJVy8bPtdX6xg/VbQa
 FNHCzmI/vaYcVyRlGoqYjGR7tktTD3gNdIudWDvr29xmMZMS9lMkIp1qGGWT/cl5KIa7
 MkgBSGBNeNVjg4RHTv2hTYwkVCqUDgSY2gIEHRKuhvhfmipOSFtUgtzc5uUroaP7xfhf
 v+NIlSZ/rY2JKydKu5UxO3mMsnyho+5gYQaeHFQn6hsdEMb6wsOejdAmYdbfPHcB4YYa
 eFzw==
X-Gm-Message-State: AOJu0YxhNir0n1BJ+AHSBUky8FVeGLj2SzeQXISTHVrCip/Ty6FJEXz5
 uv6JOvu5bNFxzSUTP/6DZQPgMvwMfBHK2ffdM8WEqTmD8eoA3SiNA3WVvjn0
X-Gm-Gg: ASbGncvJpWf/S491l9dEFkPmrcMP25ZA4CFkzcR7WsKn8Tl0ZqF5hk7KSmLiyhPMU3p
 AZK67ti0w5wq6IeJqeWpnLn+PvJ2TP1IjF2Uxhwhw8S+R9clU7J0qKPDtWDwDTYiYknE25s85iD
 oo7F5I7b80ND3P1Rxu9WJy2BXj6J8ZYTs4mfnTq9ZI1nlurzW3kR1I/TZuTN5yEVBfYvJvRx1iF
 I7LW0hmni0wPoJ3rBG0OkEhkC5O1NOes1ZA8zrKjJfF302nOcWA16lF3jWTZOvivd7VDglqhn2X
 gAfFNTQBU6gkMCSo6BcHsLWQV7mPlgLjuW8yggvjTFXcC7bln764qKUN5z8LrOvWww==
X-Google-Smtp-Source: AGHT+IE8PO4ox6yXnnNrzz69lMMLy/k8YJt7QU+w4/cbguv2eyb3yr4ElchCNi6jpBlGrHBCLnEKSw==
X-Received: by 2002:a05:6602:4c10:b0:84f:70b6:d827 with SMTP id
 ca18e2360f4ac-85256bb9514mr296849839f.8.1738083720748; 
 Tue, 28 Jan 2025 09:02:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8521e035927sm343086739f.43.2025.01.28.09.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 09:02:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 28 Jan 2025 10:01:49 -0700
Message-Id: <20250128170153.2298242-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128170153.2298242-1-james.hilliard1@gmail.com>
References: <20250128170153.2298242-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738083721; x=1738688521; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lOQEb1ukFSgsWHXrlkuQpyjrluRfV0nwHYKIHBglJBg=;
 b=NuLtYJJA7nqaCykp7t337RV1u2iJsJF7+KM5lCUoUkI6+LHGHGYf/EYeMmxWePsWum
 2Qk+1TV6jPaIhog3rNZ/4wTmwcPvdlz+8+y0X/h47rza38kP1WY0eTKXMJwLZVVS1kyw
 oFZH3q+RV+BlaL9G2G4fLCXMbcPkHGIsvl2LaucOFp/bLxb3ftC5EeP3m/YwKOQdIJiA
 HeJKI/Mxe+S6GHIo9Fj60Wo2I+vpbxf3XG7thmEE41Pdqc5p3CDMdgc6UTj3T6PIt4mi
 d8QgRlfvEgAj+Z/deKnXqcUI4vEaw2HED/TYNmIAjxeBO0EdvQ+EkI8gKEJZslCO2+Vd
 fLww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NuLtYJJA
Subject: [Buildroot] [PATCH v8 06/10] package/fp16: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v6 -> v7:
  - bump to latest version
  - drop patch which is now upstream
Changes v5 -> v6:
  - add patch fixing build without c++
Changes v4 -> v5:
  - add comment indicating library is header only
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/fp16/Config.in |  8 ++++++++
 package/fp16/fp16.hash |  4 ++++
 package/fp16/fp16.mk   | 20 ++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/fp16/Config.in
 create mode 100644 package/fp16/fp16.hash
 create mode 100644 package/fp16/fp16.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f56d2eb38b..a5d0b2ddb3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3034,6 +3034,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/fp16/
 F:	package/gemmlowp/
 F:	package/psimd/
 F:	package/pthreadpool/
diff --git a/package/Config.in b/package/Config.in
index beb6f08064..cccb95b869 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2187,6 +2187,7 @@ menu "Other"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
 	source "package/flatcc/Config.in"
+	source "package/fp16/Config.in"
 	source "package/fxdiv/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gdal/Config.in"
diff --git a/package/fp16/Config.in b/package/fp16/Config.in
new file mode 100644
index 0000000000..e07c6ebb8a
--- /dev/null
+++ b/package/fp16/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FP16
+	bool "fp16"
+	select BR2_PACKAGE_PSIMD
+	help
+	  Header-only library for conversion to/from half-precision
+	  floating point formats.
+
+	  https://github.com/Maratyszcza/FP16
diff --git a/package/fp16/fp16.hash b/package/fp16/fp16.hash
new file mode 100644
index 0000000000..a2b7d83c41
--- /dev/null
+++ b/package/fp16/fp16.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  e7b509c76a2ea162ebdda77fb6b6f51f2f37dedee0866077d428e214516f0c2b  fp16-98b0a46bce017382a6351a19577ec43a715b6835.tar.gz
+# License files, locally calculated
+sha256  17e4f539024be2749ee729d1e2f01d24cef12ece8c9bf18e91a4349be29c80bf  LICENSE
diff --git a/package/fp16/fp16.mk b/package/fp16/fp16.mk
new file mode 100644
index 0000000000..d50d84366d
--- /dev/null
+++ b/package/fp16/fp16.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# fp16
+#
+################################################################################
+
+FP16_VERSION = 98b0a46bce017382a6351a19577ec43a715b6835
+FP16_SITE = $(call github,Maratyszcza,FP16,$(FP16_VERSION))
+FP16_LICENSE = MIT
+FP16_LICENSE_FILES = LICENSE
+FP16_INSTALL_STAGING = YES
+# Only installs a header
+FP16_INSTALL_TARGET = NO
+FP16_DEPENDENCIES = psimd
+FP16_CONF_OPTS = \
+	-DFP16_BUILD_TESTS=OFF \
+	-DFP16_BUILD_BENCHMARKS=OFF \
+	-DPSIMD_SOURCE_DIR="$(PSIMD_DIR)"
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
