Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF1BCD1292
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 01:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA23C81E34;
	Mon,  8 Apr 2024 01:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1sDpcgGVP7a; Mon,  8 Apr 2024 01:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28B2E81A23
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28B2E81A23;
	Mon,  8 Apr 2024 01:39:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D9931BF2BD
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 01:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34FDC81B14
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 01:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvtrQorY5Og2 for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 01:39:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=matt.stav.taylor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1F4181A23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1F4181A23
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1F4181A23
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 01:39:22 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41550858cabso25612655e9.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 18:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712540361; x=1713145161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=agda8WwTnE8FCdu7PqdrkesrbevsxunOjfZjmmIdqYk=;
 b=q/Ugcv9EtwIYKHNxU9BcKv9HippkttiWiLtz/TyPXXKaC+jIAhwixPEqkl5bEO2+H5
 v8oG5d42woTyw+lBHbvc6cd/dbWuHXuUcSRGLFqMzQp/tPTVjgLQfBfqOgUNqOEFGHvP
 ob8/2xQMeI7Ibl5a4b+iaND9BBT0rBth6A6pd5yIg2vPeb21P0L5KrPGE5NMJsfpLyxg
 dxYjY191E12BK88SX01oQYW7MGSLaPbeorE2DbFQrKSeYaSX9nMDdg2KvkB8bozJyT8i
 Pvd9XeyFnfvZyECgHFGTck/S1+ETSoS4SqgDRSy7gSW9gBJ8JBXXUKzL/oxcjImfC8AJ
 L3sQ==
X-Gm-Message-State: AOJu0Yy47X7fPTrR7u4VUS/jx2B/DUaWZztfzqPFcShi0TwtzpqVHFz/
 bnf8wJQFiMOh2QTsHlavauAUlMgbd8ZMVPCFbFLa1BgwYDnw8CM5FXbf2vY4aXM=
X-Google-Smtp-Source: AGHT+IHl5sIS6jv85mtgfY7qHvi8YdpRsx5BfMPe4m3lcGXiuQQUtdy1p1zaNy4A1EHcLVyGfo+O0Q==
X-Received: by 2002:a05:600c:3c99:b0:414:8e02:e435 with SMTP id
 bg25-20020a05600c3c9900b004148e02e435mr5374874wmb.3.1712540360501; 
 Sun, 07 Apr 2024 18:39:20 -0700 (PDT)
Received: from arch-linux-pc.home ([2a00:23c4:b436:9101:9ba4:f365:9eb6:5e88])
 by smtp.gmail.com with ESMTPSA id
 m28-20020adfa3dc000000b003435e1c0b78sm7784068wrb.28.2024.04.07.18.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 18:39:20 -0700 (PDT)
From: Matt Staveley-Taylor <matt.stav.taylor@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Apr 2024 02:38:44 +0100
Message-ID: <20240408013859.732937-2-matt.stav.taylor@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240408013859.732937-1-matt.stav.taylor@gmail.com>
References: <20240408013859.732937-1-matt.stav.taylor@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712540361; x=1713145161; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=agda8WwTnE8FCdu7PqdrkesrbevsxunOjfZjmmIdqYk=;
 b=h6ThaGYcsU2EC2CqGcppj5yrZ/vxcXEx4/oH6XwjuZdwo6KOjIQE7uHa5ZO/0d5kcW
 PCzPGWYo/ySD95PWtemrT08xC4iQQqKiGiCIz7lyupwqzlNxBBsUAht1OTaMEGabh+wj
 0bBQvD+gX0cutZzLuW3AoptCln+YJP4rzBWiIwLeAnTyHQ9ZsVWA6GSvVPF+4lu5MKov
 MLLuoorqFLth+xemtpc32UpB0cpYq+4tz0FOu5PcFkR67J1zaJC9oT829iLxtALggIQL
 z7LQxoF8PFnSfwcqjMv3pvnHE7+aaWobO8jjXHwhGFNHJRTg8zOO2SJd1ch+rcWNeDdd
 O1aw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h6ThaGYc
Subject: [Buildroot] [PATCH 1/2] package: add support for extracting zstd
 archives
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
Cc: Matt Staveley-Taylor <matt.stav.taylor@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Teach the generic package handling code how to extract zstd (.tar.zst)
archives. When zstd is not installed on the host, host-zstd gets built
automatically.

Signed-off-by: Matt Staveley-Taylor <matt.stav.taylor@gmail.com>
---
 Config.in                               |  7 +++++++
 Makefile                                |  1 +
 package/pkg-utils.mk                    |  2 ++
 support/dependencies/check-host-zstd.mk |  4 ++++
 support/dependencies/check-host-zstd.sh | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 support/dependencies/check-host-zstd.mk
 create mode 100755 support/dependencies/check-host-zstd.sh

diff --git a/Config.in b/Config.in
index e4f58f3f66..13514b78c9 100644
--- a/Config.in
+++ b/Config.in
@@ -173,6 +173,13 @@ config BR2_LZCAT
 	  Command to be used to extract a lzip'ed file to stdout.
 	  Default is "lzip -d -c"
 
+config BR2_ZSTDCAT
+	string "zstdcat command"
+	default "zstdcat"
+	help
+	  Command to be used to extract a zstd'ed file to stdout.
+	  Default is "zstdcat"
+
 config BR2_TAR_OPTIONS
 	string "Tar options"
 	default ""
diff --git a/Makefile b/Makefile
index d1caec63b5..a9840abe95 100644
--- a/Makefile
+++ b/Makefile
@@ -444,6 +444,7 @@ ZCAT := $(call qstrip,$(BR2_ZCAT))
 BZCAT := $(call qstrip,$(BR2_BZCAT))
 XZCAT := $(call qstrip,$(BR2_XZCAT))
 LZCAT := $(call qstrip,$(BR2_LZCAT))
+ZSTDCAT := $(call qstrip,$(BR2_ZSTDCAT))
 TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 6181ae7a99..5cc44c8b5c 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -59,6 +59,7 @@ INFLATE.tbz  = $(BZCAT)
 INFLATE.tbz2 = $(BZCAT)
 INFLATE.tgz  = $(ZCAT)
 INFLATE.xz   = $(XZCAT)
+INFLATE.zst  = $(ZSTDCAT)
 INFLATE.tar  = cat
 # suitable-extractor(filename): returns extractor based on suffix
 suitable-extractor = $(INFLATE$(suffix $(1)))
@@ -66,6 +67,7 @@ suitable-extractor = $(INFLATE$(suffix $(1)))
 EXTRACTOR_PKG_DEPENDENCY.lzma = $(BR2_XZCAT_HOST_DEPENDENCY)
 EXTRACTOR_PKG_DEPENDENCY.xz   = $(BR2_XZCAT_HOST_DEPENDENCY)
 EXTRACTOR_PKG_DEPENDENCY.lz   = $(BR2_LZIP_HOST_DEPENDENCY)
+EXTRACTOR_PKG_DEPENDENCY.zst  = $(BR2_ZSTD_HOST_DEPENDENCY)
 
 # extractor-pkg-dependency(filename): returns a Buildroot package
 # dependency needed to extract file based on suffix
diff --git a/support/dependencies/check-host-zstd.mk b/support/dependencies/check-host-zstd.mk
new file mode 100644
index 0000000000..fa595ef201
--- /dev/null
+++ b/support/dependencies/check-host-zstd.mk
@@ -0,0 +1,4 @@
+ifeq (,$(call suitable-host-package,zstd,$(ZSTDCAT)))
+BR2_ZSTD_HOST_DEPENDENCY = host-zstd
+ZSTDCAT = $(HOST_DIR)/bin/zstdcat
+endif
diff --git a/support/dependencies/check-host-zstd.sh b/support/dependencies/check-host-zstd.sh
new file mode 100755
index 0000000000..81602497ff
--- /dev/null
+++ b/support/dependencies/check-host-zstd.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+candidate="$1"
+
+zstdcat=`which $candidate 2>/dev/null`
+if [ ! -x "$zstdcat" ]; then
+	zstdcat=`which zstdcat 2>/dev/null`
+	if [ ! -x "$zstdcat" ]; then
+		# echo nothing: no suitable zstdcat found
+		exit 1
+	fi
+fi
+
+echo $zstdcat
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
