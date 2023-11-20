Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8255EC54E76
	for <buildroot@archiver.kernel.org>; Mon, 20 Nov 2023 10:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A52081766;
	Mon, 20 Nov 2023 10:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A52081766
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QXN998U5YvhY; Mon, 20 Nov 2023 10:34:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CB8781757;
	Mon, 20 Nov 2023 10:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CB8781757
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 971681BF35E
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 10:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EF6681587
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 10:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EF6681587
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dUSA3IG_jmOa for <buildroot@lists.busybox.net>;
 Mon, 20 Nov 2023 10:33:54 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 208BB8148B
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 10:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 208BB8148B
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-548ce39b101so689775a12.2
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 02:33:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700476432; x=1701081232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wpJ9bPVQANwEQPn1eaBDaFAdgzKqMfs4E6GFlwxYFzw=;
 b=COioIn3Qn4ubC3gaiTauvbf2kxcZayKES2uVzBEjpYLDMKgN7Qb1VNgI0Go1WE9c7m
 1IP/0P5j94DrFa7XaGI80bPP4I5vZf1z5Uf5pMdrlONgb20cgv9pYyvwGUYv1wzwTTFg
 QasFlXTYvq9vNCJz+qZCPqf3gV5nWDJaviQD9TgYy8LNPUbKulaQHEFef00ahMbAsO/N
 bVKWkDt2/3oZblPcDQRiYGAl2/o5aXi2xBRZBZsN94csteD1IdnIxmjnd1B6Q9FJmUp8
 QWnuxzg3tkrUv7t2FQ8ic4qLjFjGaTcHqFjMuX1YgrxNo7kmSvSBYeeQfN6c/ethwW/K
 Rixw==
X-Gm-Message-State: AOJu0YwJ8apkQobtXehs3aUdt7P34X0c2jCJuUDc1sulenl8N94S9GEf
 GV1aLqJWXQXTCIcuX5RiAMZCSgZeC3xPhA==
X-Google-Smtp-Source: AGHT+IHTwshnmG+ozbDuGJfAAXMQD0f9GU4S8U4MF9Cap9QnWu/V382dykanGIZQFYNZWJZZdQhgZg==
X-Received: by 2002:a17:906:2208:b0:9bf:1142:4361 with SMTP id
 s8-20020a170906220800b009bf11424361mr5287877ejs.10.1700476431828; 
 Mon, 20 Nov 2023 02:33:51 -0800 (PST)
Received: from wslxew193.ultratronik.de (mail.ultratronik.de. [82.100.224.114])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a170906090e00b009ae57888718sm3732153ejd.207.2023.11.20.02.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 02:33:51 -0800 (PST)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
X-Google-Original-From: Boerge Struempfel <bstruempfel@ultratronik.de>
To: 
Date: Mon, 20 Nov 2023 11:32:57 +0100
Message-ID: <20231120103304.89728-2-bstruempfel@ultratronik.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231120103304.89728-1-bstruempfel@ultratronik.de>
References: <20231120103304.89728-1-bstruempfel@ultratronik.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700476432; x=1701081232; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wpJ9bPVQANwEQPn1eaBDaFAdgzKqMfs4E6GFlwxYFzw=;
 b=UNWyAx+TiN4DEFsQR2L5Fqz8+yCe6sMFHkjDLzz4FR5PNwv8H4awJHKaT+Nydpzhpj
 dOn5/7xtTvi/z9pLyCRzRLJ2qhSep1jrJqSf4dKkBO8D1CwKUfGgEQMgCGJHyvOkS9Vh
 FdHY22nvsXuvgdQoTzRIEZLd/LqF84riZvkVOA2xyTWAl/loZfoHiZd/0A5YWYg/sV6F
 fYgugRFBvqbXjWfI97j1ZVJmjSi4/LbaJfbePbA6/8TRnITPEKctb4NcKwK1M1nhq94T
 89FrqCc1MUEa964WRilrBZ7VhwFGOObd3t4BMXhgzPnBO7XX+8mc4A5rV4VRfnT7l8SI
 1f6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UNWyAx+T
Subject: [Buildroot] [PATCH v2 1/2] package/libgpiod2: new package
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
 package/libgpiod2/Config.in      | 27 ++++++++++++++++++++
 package/libgpiod2/libgpiod2.hash |  4 +++
 package/libgpiod2/libgpiod2.mk   | 44 ++++++++++++++++++++++++++++++++
 5 files changed, 79 insertions(+)
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
index 0000000000..e9e68339a8
--- /dev/null
+++ b/package/libgpiod2/libgpiod2.mk
@@ -0,0 +1,44 @@
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
+# We're patching configure.ac
+LIBGPIOD2_AUTORECONF = YES
+LIBGPIOD2_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
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
