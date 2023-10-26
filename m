Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219CCC25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE32240A71;
	Thu, 26 Oct 2023 09:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE32240A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Iz1L1YIbZzn; Thu, 26 Oct 2023 09:27:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A9A341790;
	Thu, 26 Oct 2023 09:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A9A341790
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 307E11BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BDE140911
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BDE140911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k4LgZchqQMPQ for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:09 +0000 (UTC)
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F58241F77
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F58241F77
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-53d9b94731aso1066262a12.1
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312427; x=1698917227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L3Y9u/B3GvvSbwla4QdWzXMD+/lnWWec65y/vd2NmM4=;
 b=LwPUybtT8kTIXcf5sWTzVl/eFEa8G3Ooop0P+a7FW53p6ulE7mO3+0ZGLsAw/uBOMz
 kH24mji23U3zwfIZU87tPOMO80NnVgCyp3szE2CnBxWe5adeEZmvpankNA5pWCGMNvAt
 zv3h/cw7WZHNvwllbSk7/EsRT4UyTGvZfOmcP+lN+RKtCDDPXrsGNoEmSYcB2XT8cjqX
 EJg6ZQ40CY0uNb9I8YSslZjQlN5SifVJsLsWFAiLxgF/ea3+XzxOcNp9PL6+l/ZXMuZU
 6pk2uo4QxuOJsQsAMMVuLAVe+5VBLjZzCXNy+tSq8OngMObw3QmP8gEkiaqcFPK8WYCM
 uolw==
X-Gm-Message-State: AOJu0YxJeQnxsAqPJxxf7lZArAlvGiqHGPrPOPibAGs05euFDBZM7Mym
 yadzP4WLNCh0XNwWYdq2UVpFBScB9NnWTX+r4RxNuzbYL9S2hUV/
X-Google-Smtp-Source: AGHT+IEYjfU1vPUoOf6+bDfiwPRMgfxoBj0zjZRm31RtRkcQeBqZmmDbNBfsq31FkJElJRTmeHC36w==
X-Received: by 2002:a17:907:d8d:b0:9b2:df16:851d with SMTP id
 go13-20020a1709070d8d00b009b2df16851dmr14444645ejc.57.1698312426819; 
 Thu, 26 Oct 2023 02:27:06 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:06 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:34 +0200
Message-ID: <20231026092701.12345-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312427; x=1698917227;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L3Y9u/B3GvvSbwla4QdWzXMD+/lnWWec65y/vd2NmM4=;
 b=HZqXvqnTUSaU80XVOM0hS7GP+y+QKxz3WRPesnj813pHNJULxvg7OMH6er5tpOIuiM
 eG5heDsmykEzQAZm6Q5uuyRG0JzXxqnZ4+cKOMvaEMEmNBrhdtWLlfcHLUazYsUqq1x4
 Kq8C+a+4+1NuZXmxXcDP21icLZA51V7dWGPzo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=HZqXvqnT
Subject: [Buildroot] [PATCH 03/30] package/python3: use upstream build
 system to disable bzip2/zlib/xz modules
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd@kuhls.net>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .checkpackageignore                           |  1 -
 ...to-disable-zlib-bzip2-and-xz-modules.patch | 42 -------------------
 package/python3/python3.mk                    |  8 ++--
 3 files changed, 4 insertions(+), 47 deletions(-)
 delete mode 100644 package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 4425eb6859..f8216dd255 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1175,7 +1175,6 @@ package/python3/0021-Add-an-option-to-disable-decimal.patch Upstream
 package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch Upstream
 package/python3/0023-Add-an-option-to-disable-openssl-support.patch Upstream
 package/python3/0024-Add-an-option-to-disable-the-readline-module.patch Upstream
-package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch Upstream
diff --git a/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
deleted file mode 100644
index 70a0d6cd15..0000000000
--- a/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 988a335cb34b5fc25ea345ba04ff5ddffe2e946c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 23:31:11 +0100
-Subject: [PATCH] Add options to disable zlib, bzip2 and xz modules
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 19875d7d30..ca6c16491a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4231,6 +4231,24 @@ AC_ARG_ENABLE(readline,
- 	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
- 	  fi])
- 
-+AC_ARG_ENABLE(bzip2,
-+	AS_HELP_STRING([--disable-bzip2], [disable bzip2]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _bz2"
-+	  fi])
-+
-+AC_ARG_ENABLE(zlib,
-+	AS_HELP_STRING([--disable-zlib], [disable zlib]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} zlib"
-+	  fi])
-+
-+AC_ARG_ENABLE(xz,
-+	AS_HELP_STRING([--disable-xz], [disable xz]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _lzma"
-+	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7f31f3308c..555afdab4f 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -52,7 +52,7 @@ HOST_PYTHON3_DEPENDENCIES = \
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_BZIP2),y)
 HOST_PYTHON3_DEPENDENCIES += host-bzip2
 else
-HOST_PYTHON3_CONF_OPTS += --disable-bzip2
+HOST_PYTHON3_CONF_ENV += py_cv_module__bz2=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
@@ -130,19 +130,19 @@ PYTHON3_CONF_ENV += py_cv_module__uuid=n/a
 ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
 PYTHON3_DEPENDENCIES += bzip2
 else
-PYTHON3_CONF_OPTS += --disable-bzip2
+PYTHON3_CONF_ENV += py_cv_module__bz2=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_XZ),y)
 PYTHON3_DEPENDENCIES += xz
 else
-PYTHON3_CONF_OPTS += --disable-xz
+PYTHON3_CONF_ENV += py_cv_module__lzma=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_ZLIB),y)
 PYTHON3_DEPENDENCIES += zlib
 else
-PYTHON3_CONF_OPTS += --disable-zlib
+PYTHON3_CONF_ENV += py_cv_module_zlib=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
