Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110D6C35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 09:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A57A34065A;
	Sun, 15 Sep 2024 09:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZIznv9FzXn2; Sun, 15 Sep 2024 09:05:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33F1C4065C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33F1C4065C;
	Sun, 15 Sep 2024 09:05:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A71E1BF357
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 651CA4065C
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d4YRlLqrt1XP for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 09:05:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E03694065A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E03694065A
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E03694065A
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 09:05:54 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c40942358eso1947062a12.1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 02:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726391153; x=1726995953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L+y0l4WpizQA0AZoPJp6GhwgGfqY0qLIOd332k3BqO8=;
 b=wgoTFKse5EoFO+ZpmPY+sKvuUFFAywI47v6CzHXScm4jxg50ZeupATPUwcbxc+dt5D
 DRu5rBChIsuOq3v7kgmuCSLX9p5bDEXvqF6ag+FrHNb7r0fG/qjXhCdLfqGjHFdnPBaa
 F6xUdMYct4+FPE2BVna7Mqm/DH3LIpuhL/Hhuke779EQ/WHXwT6eSBjR9N4VZntedfCj
 nBRWz5zlDghA4vK+y/+E+sUyPlRhbVZBCX4klAMxy4j0UaFYr5lN09UL1Ykz8H11lw3/
 1Ry0dMdloEz0ApUK9c4yygyVoE9foHIJwyEGD5Z9EV1aOHxf45O7XJZqty72qQRuc7Y7
 z8iA==
X-Gm-Message-State: AOJu0YwGdyTLmPNmQ37f7Eoxpj+6dTkcm1ccKVOdh69T/ujYBs3b0ACB
 ryjeSYgeb9mTxa1INHiDQJCAKe1Sw/D82FukNM8VkB6K/YGp01k+T04N37OX0laSV6t0IlE3e35
 58IHdcw==
X-Google-Smtp-Source: AGHT+IFQsCmELdldLKHMBdQv7vqO85Zy2YhVQl+9YDmDIj5aRb/V5tMfeGAtM2c79FNvfiC4E0t7ug==
X-Received: by 2002:a05:6402:5004:b0:5c4:156:7edd with SMTP id
 4fb4d7f45d1cf-5c401602770mr20266865a12.14.1726391152009; 
 Sun, 15 Sep 2024 02:05:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([62.18.213.32])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb53122sm1486514a12.32.2024.09.15.02.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 02:05:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 11:05:37 +0200
Message-ID: <20240915090537.12330-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726391153; x=1726995953;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L+y0l4WpizQA0AZoPJp6GhwgGfqY0qLIOd332k3BqO8=;
 b=CqzJyb3S9M29FqkJ626uYKIMei2In0daif1NFIWgAC2RudIFjKbkhsiocpXAGwB4Xp
 81qCF8xEoA8GvrgMWW4GFMNN33s2LKl9qMbiU6AShqbGQes5kW5v6WGCRDwUvL7jdSBG
 +5xd17MxHX2RiAOU9Ufr/mmniN1s2kYFu/hn4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=CqzJyb3S
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 14.0.2
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
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit f69fe48404eda ("package/armadillo: temporarily update the
site URL") changed the download URL only to continue to build the
9.900.2 version. This is an outdated and no longer supported version
and as suggested by Conrad Sand, the project maintainer, it is
recommended upgrading to the latest version, which is currently 14.0.2,
and it's downloadable from the URL containing the most recent versions.

- Drop ARMADILLO_EXTRACT_CMDS added to fix an issue only related to
  the previous version building.
- C++14 is now mandatory.

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/Config.in      |  4 +++-
 package/armadillo/armadillo.hash |  2 +-
 package/armadillo/armadillo.mk   | 12 ++++--------
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index 7aed4fd02fe9..7a93343d41f8 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -2,16 +2,18 @@ comment "armadillo needs a toolchain w/ C++"
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
 
-comment "armadillo needs a toolchain w/ fortran, C++"
+comment "armadillo needs a toolchain w/ fortran, C++, gcc >= 4.9"
 	depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # otherwise, see comment above
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_ARMADILLO
 	bool "armadillo"
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS || \
 		(BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN)
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	help
 	  Armadillo: An Open Source C++ Linear Algebra Library for
 	  Fast Prototyping and Computationally Intensive Experiments.
diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 9b19b8c8c4a2..4e8652192303 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d78658c9442addf7f718eb05881150ee3ec25604d06dd3af4942422b3ce26d05  armadillo-9.900.2.tar.xz.RETIRED
+sha256  248e2535fc092add6cb7dea94fc86ae1c463bda39e46fd82d2a7165c1c197dff  armadillo-14.0.2.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 81684a44f72f..608f8fb229f2 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 9.900.2
-ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz.RETIRED
-ARMADILLO_SITE = https://sourceforge.net/projects/arma/files/retired
+ARMADILLO_VERSION = 14.0.2
+ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
+ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
 ARMADILLO_LICENSE = Apache-2.0
 ARMADILLO_LICENSE_FILES = LICENSE.txt
 
-ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
+ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false -DBUILD_SMOKE_TEST=false
 
 # blas support may be provided by lapack (libblas.a) or openblas (libopenblas.a)
 ARMADILLO_CONF_OPTS += -DBLAS_FOUND=ON
@@ -30,8 +30,4 @@ ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
 ARMADILLO_DEPENDENCIES += lapack
 endif
 
-define ARMADILLO_EXTRACT_CMDS
-	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) $($(PKG)_DL_DIR)/$(ARMADILLO_SOURCE)
-endef
-
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
