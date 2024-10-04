Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B1CCF885F
	for <buildroot@archiver.kernel.org>; Fri,  4 Oct 2024 21:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2269840D33;
	Fri,  4 Oct 2024 21:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id knYO98qxl_RK; Fri,  4 Oct 2024 21:55:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D49E40E52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D49E40E52;
	Fri,  4 Oct 2024 21:55:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D90FA1BF5F5
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 21:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8410841C4
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 21:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7WCtYKvlT2i for <buildroot@lists.busybox.net>;
 Fri,  4 Oct 2024 21:54:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E7F4841C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E7F4841C3
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E7F4841C3
 for <buildroot@buildroot.org>; Fri,  4 Oct 2024 21:54:57 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42cb60aff1eso24993035e9.0
 for <buildroot@buildroot.org>; Fri, 04 Oct 2024 14:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728078895; x=1728683695;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5N4rQwuNgNQaEjQlMdG74f84j6N+VSrSjS8S6uOLZqU=;
 b=V9W9nWreK6Dfv4+HISXnOihIQ4iZLGMan8gzY2m126ujJREF/5gppOl0XXlkTg4KwC
 ytnxOIKlbkwfEy0CLiJfmG0xdu6zbafk2oAzs+vyOE+9EmEV/T5+BOHaPctmjjp0eKIC
 +ndrwkPjGkT1aAZvh8g0Ctl+9csXI8JOI/tlXnRK38HTPk6h5upGoOaAzgi+xhp0CgTI
 +PwUB30GEyNDtZudpQ49O+Dn9jM15kK37XsbJik+obL0aFoa/MMuDmi7dhml77VlSMjP
 qUAH4ekeL9dVl3Gssf+PO4kWrBmrk1CvYIhYavdp1KcrZXUiajwvvYqYHiGpSZm3tYIn
 /Egw==
X-Gm-Message-State: AOJu0YzZB52O8ae6qt9+MUSqWXEKFrwcLLzCFQ1+5wuS7ZEuM4WJjsv7
 VwR0RTYhz6CcUHya1wpvPra006M9slNlbsjVkNhzWZX9gR0vV1JFkYsCRtNLtSP32St9v3H5IsM
 RqNk=
X-Google-Smtp-Source: AGHT+IF1CP2Fjgs9U6LfH53naXDpDefNMkDbiDxe0eAGkqoy138VDtbGnJtb/OXmoILCP038Loaqcg==
X-Received: by 2002:a05:600c:4f81:b0:426:5fe1:ec7a with SMTP id
 5b1f17b1804b1-42f85aef815mr33339025e9.31.1728078894803; 
 Fri, 04 Oct 2024 14:54:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.206])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f89e39aebsm6972005e9.0.2024.10.04.14.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 14:54:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  4 Oct 2024 23:54:44 +0200
Message-ID: <20241004215451.1198861-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728078895; x=1728683695;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5N4rQwuNgNQaEjQlMdG74f84j6N+VSrSjS8S6uOLZqU=;
 b=kE8aFrO26yodBt4oIsT7xjcQfRqF1NyQpFGdeesVRA+bWu3T7zievY3jRtxVZpDp+I
 IwJneNxpewlMFoKLU23ba6WGOTWZjWwQR4V4AMA5HnmSRssEElRJ4q+muwnWOJQYkYJ3
 tN/lc+nKcbfuT3YlfpW2IzAeBRqZhFqgY3SkY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=kE8aFrO2
Subject: [Buildroot] [PATCH 1/3] package/libdivsufsort: new package
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Colin Percival <cperciva@freebsd.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit adds the libdivsufsort library. This library implements a
lightweight suffix array construction algorithm.

I set the package version to the most recent commit because the latest
released version (i. e. 2.0.1) had license and compilation issues, which
were fixed in subsequent commits.

Cc: Colin Percival <cperciva@freebsd.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/libdivsufsort/Config.in          |  7 +++++++
 package/libdivsufsort/libdivsufsort.hash |  3 +++
 package/libdivsufsort/libdivsufsort.mk   | 23 +++++++++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/libdivsufsort/Config.in
 create mode 100644 package/libdivsufsort/libdivsufsort.hash
 create mode 100644 package/libdivsufsort/libdivsufsort.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 44b19474876b..458da4e4e051 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -798,6 +798,7 @@ F:	configs/stm32f769_disco_sd_defconfig
 F:	package/armadillo/
 F:	package/babeld/
 F:	package/iana-assignments/
+F:	package/libdivsufsort/
 F:	package/sscep/
 F:	package/tinyinit/
 F:	package/uuu/
diff --git a/package/Config.in b/package/Config.in
index e1ceb81dc0a2..40caa6fb3461 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2209,6 +2209,7 @@ menu "Other"
 	source "package/libdaemon/Config.in"
 	source "package/libdex/Config.in"
 	source "package/libdill/Config.in"
+	source "package/libdivsufsort/Config.in"
 	source "package/libeastl/Config.in"
 	source "package/libee/Config.in"
 	source "package/libev/Config.in"
diff --git a/package/libdivsufsort/Config.in b/package/libdivsufsort/Config.in
new file mode 100644
index 000000000000..b00e9c77e5fe
--- /dev/null
+++ b/package/libdivsufsort/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBDIVSUFSORT
+	bool "libdivsufsort"
+	help
+	  libdivsufsort is a software library that implements a
+	  lightweight suffix array construction algorithm.
+
+	  https://github.com/y-256/libdivsufsort
diff --git a/package/libdivsufsort/libdivsufsort.hash b/package/libdivsufsort/libdivsufsort.hash
new file mode 100644
index 000000000000..ed99c2272dd8
--- /dev/null
+++ b/package/libdivsufsort/libdivsufsort.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  705a122a142eda16f05996e56b45247319d140928eec32bd9db6753da13f5b5b  libdivsufsort-5f60d6f026c30fb4ac296f696b3c8b0eb71bd428.tar.gz
+sha256  29f948fde0da0929ee6ed6bf82a96114b992d54a5d906c77a42473df520da764  LICENSE
diff --git a/package/libdivsufsort/libdivsufsort.mk b/package/libdivsufsort/libdivsufsort.mk
new file mode 100644
index 000000000000..1ae2ee487e25
--- /dev/null
+++ b/package/libdivsufsort/libdivsufsort.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# libdivsufsort
+#
+################################################################################
+
+LIBDIVSUFSORT_VERSION = 5f60d6f026c30fb4ac296f696b3c8b0eb71bd428
+LIBDIVSUFSORT_SITE = $(call github,y-256,libdivsufsort,$(LIBDIVSUFSORT_VERSION))
+LIBDIVSUFSORT_LICENSE = MIT
+LIBDIVSUFSORT_LICENSE_FILES = LICENSE
+LIBDIVSUFSORT_INSTALL_STAGING = YES
+
+LIBDIVSUFSORT_CONF_OPTS = \
+	-DBUILD_EXAMPLES=OFF \
+	-DBUILD_DIVSUFSORT64=ON
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBDIVSUFSORT_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
+else
+LIBDIVSUFSORT_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
+endif
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
