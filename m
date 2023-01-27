Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BF8C54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 14:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD8AD417DF;
	Fri, 27 Jan 2023 14:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD8AD417DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cptl7b6dlfU4; Fri, 27 Jan 2023 14:12:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14D6840A71;
	Fri, 27 Jan 2023 14:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14D6840A71
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28D0C1BF976
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01DEF82FBE
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01DEF82FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CHe0eA5u-OHL for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 14:11:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD9A882F3D
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD9A882F3D
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 14:11:07 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id s26so1941008ioa.11
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 06:11:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/AxlrULlPl5y/LjLhyenXxquJzr7GQTjeAH9N9wX1k4=;
 b=6AEQFZx5miVXXFKgjBmSYX5SofYVHOVkSpZAx/ZiPBgvhI7DVTt1woA4K+w0r78tie
 scivA4E+a6chrLXdZTz008DGM4vdTyoZdR+Bm6VODSFk9/OWHNI6aCaWuzt/orMukUGt
 7O2QVYKXsiOvzp16mTqLaaf/IpgFgtIHX1Z0Vsey+EXxPi0hUUT+meuAyXgzJ8g6vrls
 kSZ74dtJdMxZV8FhOGbV0Wh8XeXdOKno6t7c8Tr75s74+h1QR13JkbkVSUtWSWX4T7t/
 TXTWHbz0HmN0hA7mi+JRCVvRCBIuX7bxbT0AVy0wkhvLXsa4WaZaVuvUPr9pUFggBgzy
 Qfmw==
X-Gm-Message-State: AFqh2koyp4l/bdohDx/b0dGL1zirEkibhWhauVY5/Q+nJcH8LwK2P9vj
 VmDXfmOKMy88OXFfDw9x+c1nqXSGDdoddw==
X-Google-Smtp-Source: AMrXdXuvttiRRJ0lzyArHNoZ19nGBYImz9CEtaAQS4q8bHnq5TYWPd92Qis85QL2/aSDhTTygZCDNA==
X-Received: by 2002:a5d:805a:0:b0:6bc:d714:520f with SMTP id
 b26-20020a5d805a000000b006bcd714520fmr29092013ior.15.1674828667225; 
 Fri, 27 Jan 2023 06:11:07 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 n2-20020a6bed02000000b006d8b7bcaa6esm1290806iog.4.2023.01.27.06.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 06:11:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 07:10:55 -0700
Message-Id: <20230127141058.2180747-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127141058.2180747-1-james.hilliard1@gmail.com>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/AxlrULlPl5y/LjLhyenXxquJzr7GQTjeAH9N9wX1k4=;
 b=Qo5KaB2i+RZPexN6Zhx6SWoAauRINweo+oA7s9hxJ3i2BVu9dHzG9/pgbnMTX0zcF6
 ZYGwMYTxj+50Fgcj1+ZuXPqflwe6Q+obcsgmuXhS02hCPV4nTC1h4Q2fN72d8o/vtmJ4
 TZN4vC7bd8roZK+e6sf2wAp7BspatpnXFOXUWX/Vu0iGJupcn89+GPu5EaCL1I3li2eI
 FmjV96Spx+74txBnijVzF9pkkIUcwNRflwNQxcJX3JiS1XPVp0gxmrGAw2ojvXOOLcXe
 h9Lo1NDCyGevbrRVHBFWzdg/dJ2Y+VphQaElkNJdhGXGLDfz8o3w3RXtCWiF7e/DdixZ
 UsJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Qo5KaB2i
Subject: [Buildroot] [PATCH v4 10/13] package/xnnpack: new package
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

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/xnnpack/Config.in    | 17 +++++++++++++++++
 package/xnnpack/xnnpack.hash |  4 ++++
 package/xnnpack/xnnpack.mk   | 18 ++++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/xnnpack/Config.in
 create mode 100644 package/xnnpack/xnnpack.hash
 create mode 100644 package/xnnpack/xnnpack.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fc74c089fe..cfb0a8228d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2710,6 +2710,7 @@ F:	package/neon-2-sse/
 F:	package/psimd/
 F:	package/pthreadpool/
 F:	package/ruy/
+F:	package/xnnpack/
 
 N:	Stefan Ott <stefan@ott.net>
 F:	package/unbound/
diff --git a/package/Config.in b/package/Config.in
index d33806a013..26e37e2687 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2128,6 +2128,7 @@ endif
 	source "package/uvw/Config.in"
 	source "package/volk/Config.in"
 	source "package/xapian/Config.in"
+	source "package/xnnpack/Config.in"
 endmenu
 
 menu "Security"
diff --git a/package/xnnpack/Config.in b/package/xnnpack/Config.in
new file mode 100644
index 0000000000..2016ce9817
--- /dev/null
+++ b/package/xnnpack/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_XNNPACK
+	bool "xnnpack"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	select BR2_PACKAGE_CPUINFO
+	select BR2_PACKAGE_FP16
+	select BR2_PACKAGE_FXDIV
+	select BR2_PACKAGE_PTHREADPOOL
+	help
+	  XNNPACK is a highly optimized solution for neural network
+	  inference on ARM, x86, WebAssembly, and RISC-V platforms.
+
+	  https://github.com/google/XNNPACK
+
+comment "xnnpack needs a toolchain w/ C++14"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/xnnpack/xnnpack.hash b/package/xnnpack/xnnpack.hash
new file mode 100644
index 0000000000..249f553f2a
--- /dev/null
+++ b/package/xnnpack/xnnpack.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  5d70dde70c0b1aef9e608f5d193c148aa1e538574a98d912278b51e60f2457f2  xnnpack-1f7f6131f7be587d0a657d03bdd0161d67ba2700.tar.gz
+# License files, locally calculated
+sha256  63f519e15726f4c4f830bd958f694c84fecb4e0a4cacc527d2696bb71ef95ada  LICENSE
diff --git a/package/xnnpack/xnnpack.mk b/package/xnnpack/xnnpack.mk
new file mode 100644
index 0000000000..d46b4c22de
--- /dev/null
+++ b/package/xnnpack/xnnpack.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# xnnpack
+#
+################################################################################
+
+XNNPACK_VERSION = 1f7f6131f7be587d0a657d03bdd0161d67ba2700
+XNNPACK_SITE = $(call github,google,XNNPACK,$(XNNPACK_VERSION))
+XNNPACK_LICENSE = BSD-3-Clause
+XNNPACK_LICENSE_FILES = LICENSE
+XNNPACK_INSTALL_STAGING = YES
+XNNPACK_DEPENDENCIES = cpuinfo fp16 fxdiv pthreadpool
+XNNPACK_CONF_OPTS = \
+	-DXNNPACK_BUILD_TESTS=OFF \
+	-DXNNPACK_BUILD_BENCHMARKS=OFF \
+	-DXNNPACK_USE_SYSTEM_LIBS=ON
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
