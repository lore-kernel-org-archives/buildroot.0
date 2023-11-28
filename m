Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0998C4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 13:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4484441621;
	Tue, 28 Nov 2023 13:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4484441621
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPFi7XzYFD_Q; Tue, 28 Nov 2023 13:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 536DC4167F;
	Tue, 28 Nov 2023 13:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 536DC4167F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 102EF1BF3C4
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 13:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB21F60FE0
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 13:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB21F60FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5WyQNHLEfZLd for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 13:17:01 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B272E60608
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 13:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B272E60608
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so7410295e87.0
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 05:17:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701177418; x=1701782218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zMaPCJPOx/q9cQwPZ4nR2F+iw/18TNAvHB8kecqCzvY=;
 b=BReuZdtOobiRqUc8CpYnOicGhuJup3gbGaErlVg9q0ugxpVTzGSmeECoHvAE1DUt8g
 OlFDJcJFxXm3tGFEiuhIt79LVgnwg3A0iL2zgIfaC8hsHHiCGz1AkvIACkQCCw7v5ogk
 kI6+rEjnyG/CZXcNW58bPeovqASqf0cQCA0+Csg5OBh6+LVAhW5qeGOiZ93y9kUpasNG
 LDtbUaDl30tIr0VJO4bK2BP2/P8eCF6vvtpIf1LweO8BXHpb3OFrMV2i/I/5ksG1GBPU
 +DDZAhwFG8FoTbXnlWw2ojsLqwRTn/upnmgGgyQBGBUZrN6GJ+M5sQphxN+5d5tIACyV
 IzPg==
X-Gm-Message-State: AOJu0YzOPMCmPConPdGT422CRh24mS/a+EdDvKZmsG7Ds/s0as+wv0RO
 BnaDJUzRbHRh3Ape3izf6Oo=
X-Google-Smtp-Source: AGHT+IGzkcptzVC8CTbmBVLfe6q38f5SksY7vEgkZ1mjTZaUj3/EZTrqwtMYZX7NC238lgyH3RtjGA==
X-Received: by 2002:a05:6512:3990:b0:509:4424:2e0e with SMTP id
 j16-20020a056512399000b0050944242e0emr12607307lfu.0.1701177418111; 
 Tue, 28 Nov 2023 05:16:58 -0800 (PST)
Received: from wslxew193.ultratronik.de (mail.ultratronik.de. [82.100.224.114])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a056402048b00b00537963f692esm6243150edv.0.2023.11.28.05.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 05:16:56 -0800 (PST)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
X-Google-Original-From: Boerge Struempfel <bstruempfel@ultratronik.de>
To: 
Date: Tue, 28 Nov 2023 14:15:50 +0100
Message-ID: <20231128131557.44045-2-bstruempfel@ultratronik.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128131557.44045-1-bstruempfel@ultratronik.de>
References: <20231128131557.44045-1-bstruempfel@ultratronik.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701177418; x=1701782218; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zMaPCJPOx/q9cQwPZ4nR2F+iw/18TNAvHB8kecqCzvY=;
 b=VQg0Ej1PQ7ATD9Ft0lq40H77g0U5BMaZt/5Ohhm9d0dGCwM84g+5q8aoNtK4BSJP/m
 G3Eh56uxrmn6BnIRF37nhoNgWJ5E+HnOn9cX6UrBUgSCkVyo8KyKRg1mkJGx8MmT1M7T
 lMmlxgQkbLE17CJWSfC/gRuXcEqgaScQ8V1Nu+Rw7LH65OooO5pPecpUg4jvY/+13ZG3
 fD6t7b96gIQyD+0RZn7sHJFGcSAOt+0O8DQ8WguSWmvKJEumJxDcPXgmm7cDCr/lG8u+
 uTW2csZL5ngG2jdLQl+ujDbeO1TCkLNNWX3x3U2ggvfzXVWhjTMMEEJxrR93wId9myb4
 egwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VQg0Ej1P
Subject: [Buildroot] [PATCH v3 1/2] package/libgpiod2: new package
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
Cc: vfazio@xes-inc.com, bonet@grenoble.cnrs.fr, bstruempfel@ultratronik.de,
 buildroot@buildroot.org, boerge.struempfel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Boerge Struempfel <boerge.struempfel@gmail.com>

Due to a significant api change as well as more recent kernel version
requirements, we introduce a separate package for version 2.0 and higher.
The newpackage is incompatible to libgpiod 1.x. This allows for iteratively
updating all dependent packages without breaking anything as a result.

For now we will have libgpiod2 depend on !libgpiod. However, in the
future, it might be preferable to have it the other way around,
such that packages, which select libgpiod2 don't have to also add the
the !libgpiod dependency.

Note that this package does not correspond to the debian libgpiod2 package,
which currently uses only version 1.6.3

Signed-off-by: Boerge Struempfel <bstruempfel@ultratronik.de>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/libgpiod2/Config.in      | 27 +++++++++++++++++++++
 package/libgpiod2/libgpiod2.hash |  4 ++++
 package/libgpiod2/libgpiod2.mk   | 41 ++++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+)
 create mode 100644 package/libgpiod2/Config.in
 create mode 100644 package/libgpiod2/libgpiod2.hash
 create mode 100644 package/libgpiod2/libgpiod2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f26e9bc81..cb06b69ffb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -524,6 +524,9 @@ N:	Bilal Wasim <bilalwasim676@gmail.com>
 F:	board/chromebook/elm/
 F:	configs/chromebook_elm_defconfig
 
+N:	Boerge Struempfel <boerge.struempfel@gmail.com>
+F:	package/libgpiod2/
+
 N:	Bogdan Radulescu <bogdan@nimblex.net>
 F:	package/iftop/
 F:	package/ncdu/
diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..33d4ef3baa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1718,6 +1718,7 @@ menu "Hardware handling"
 	source "package/libftdi1/Config.in"
 	source "package/libgphoto2/Config.in"
 	source "package/libgpiod/Config.in"
+	source "package/libgpiod2/Config.in"
 	source "package/libgudev/Config.in"
 	source "package/libhid/Config.in"
 	source "package/libiio/Config.in"
diff --git a/package/libgpiod2/Config.in b/package/libgpiod2/Config.in
new file mode 100644
index 0000000000..9775ed42f9
--- /dev/null
+++ b/package/libgpiod2/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_LIBGPIOD2
+	bool "libgpiod2"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+	depends on !BR2_PACKAGE_LIBGPIOD
+	help
+	  This is a C library that abstracts the GPIO character
+	  device operations on linux.
+
+	  https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
+
+	  This package is the continuation of the libgpiod package
+	  for versions 2.0 and above.
+
+	  Note that a kernel of 5.10 or above is required for the
+	  ioctls to work.
+
+if BR2_PACKAGE_LIBGPIOD2
+
+config BR2_PACKAGE_LIBGPIOD2_TOOLS
+	bool "install tools"
+	help
+	  Include a set of command-line tools for managing GPIOs.
+
+endif
+
+comment "Consider upgrading to libgpiod2"
+	depends on BR2_PACKAGE_LIBGPIOD
diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
new file mode 100644
index 0000000000..b5488496b2
--- /dev/null
+++ b/package/libgpiod2/libgpiod2.hash
@@ -0,0 +1,4 @@
+# From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
+sha256  fa4024a080121c958502f9a46a5bda44bea85e7a4dd7fcb3dead463b6fc4261c  libgpiod-2.1.tar.xz
+# Hash for license file
+sha256  eb17a56966db5d986bec449ee44ed61f01f9e3fafa952e527db67a8f9594fd11  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
new file mode 100644
index 0000000000..0749ec3cc4
--- /dev/null
+++ b/package/libgpiod2/libgpiod2.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# libgpiod2
+#
+################################################################################
+
+# Be careful when bumping versions.
+# Dependency on kernel header versions may change.
+LIBGPIOD2_VERSION = 2.1
+LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
+LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
+LIBGPIOD2_LICENSE = LGPL-2.1+
+LIBGPIOD2_LICENSE_FILES = COPYING
+LIBGPIOD2_INSTALL_STAGING = YES
+LIBGPIOD2_DEPENDENCIES = host-pkgconf host-autoconf-archive
+LIBGPIOD2_CONF_OPTS = --disable-tests --disable-examples
+
+ifeq ($(BR2_PACKAGE_LIBGPIOD2_TOOLS),y)
+LIBGPIOD2_CONF_OPTS += --enable-tools
+else
+LIBGPIOD2_CONF_OPTS += --disable-tools
+endif
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
+else
+LIBGPIOD2_CONF_OPTS += --disable-bindings-cxx
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBGPIOD2_CONF_OPTS += --enable-bindings-python
+LIBGPIOD2_DEPENDENCIES += python3
+LIBGPIOD2_CONF_ENV += \
+	PYTHON=$(HOST_DIR)/bin/python3 \
+	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
+	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
+else
+LIBGPIOD2_CONF_OPTS += --disable-bindings-python
+endif
+
+$(eval $(autotools-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
