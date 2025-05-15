Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E67EC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 12:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30ABD61175;
	Thu, 15 May 2025 12:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BXCWnV3SH08; Thu, 15 May 2025 12:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3671D61176
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3671D61176;
	Thu, 15 May 2025 12:10:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 98B34119
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EA324154F
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4S460X-UAuf for <buildroot@buildroot.org>;
 Thu, 15 May 2025 12:10:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56EDD41516
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56EDD41516
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56EDD41516
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:38 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5faaa717cfbso153436a12.0
 for <buildroot@buildroot.org>; Thu, 15 May 2025 05:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747311036; x=1747915836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RSnpW8vV8LEj6YD/aAOkQ8edkXuj5el51lqHfjllLdg=;
 b=OOO7b6V+SlulnJkG+96JkVtxm74C2IpVQgQp8eTJwLff3vHVxjOFoTog/p6exumvKA
 qizpcKxenWaJkzPp1ejefG2ODQQgbhOhj5FG7vv30YatI419uFTFPJxYAEGacuHd4N6U
 1Sc70NOT+5RnHIRHtX/a95q4pzD1QN+YxZZH6BV8zxKqB9Ywv7QWwvoXd30mRlIJ5p9s
 puG1Rrd1pTVL2hnA2vKW3NHJj/H2cm1qKSzPhyXz714JXLw7sXDqH63jd78QGwfW71o7
 7I2q9BhprmuL8drM+w0dzDA7qFfgotFYArinrCOyHVKVHVt8YPRTWFYp10tPB7VL+Lwo
 Oi3g==
X-Gm-Message-State: AOJu0YxW5E8iIQs3TL0UojWWvLjWRXa7+HG7VAeqmBr1hM0vdAgQGVUy
 3HTO6Pp5lXAjR0eqf6O9fO5Ln4NY5CmqnUMzamPi4x/keIR6HOpbjt7u6Jd1UAUkdUozi8pCNTR
 c
X-Gm-Gg: ASbGncu4E3+/VfPk+HeYHCJuRZHg/7zv3ZKK3DbzE4mYeb/ni8H1+U4VObKCm+nxVsJ
 5B06hR3GX6vBNee3kdTpiRjKJBap5DstJLckMbG0OczWsp4W8fLApQ7wiQfzQzjQ7o/d1LI7pmm
 ZTSiT9eCKu9D3jMxsqqZlJhINHk9cjzQZHl6eph7HgtXSsGdDlcxf1aHuJS2311w140DstJfmxX
 nDVNY+6SLRAwjkVw83nkd4H5kss6rXjjzKbe6kkwc1CWQQfMCjvVeuom+NWJgnADHerwSAYrBxR
 UEjEnkHld9+/xdCaUeWAN/dMfUv25gJ7W8+n5Q1dE3C7zXsQKMNScOJh6qr3/aev5FluL4G/ivu
 KAebN+VEtGN7VazWTq1R/KOPFFbgj62LnPaF8zOHmvrSKG65rbvmbDo3Td2A81HpfCJualV6H+z
 GVZJTSczkUqkIl/b8H1CqI
X-Google-Smtp-Source: AGHT+IGXLnmWd5z4de2BoirVusRe5dFTwx0ORJGmQkvBhY7QYQLHb8Cjrf1v4BXV+fuQHqqgutsVsA==
X-Received: by 2002:a05:6402:518e:b0:5f6:d52f:5606 with SMTP id
 4fb4d7f45d1cf-5ff988e7c25mr2408118a12.11.1747311035941; 
 Thu, 15 May 2025 05:10:35 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cbe523bsm10218214a12.12.2025.05.15.05.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 05:10:34 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 14:10:21 +0200
Message-ID: <20250515121027.561571-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
References: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747311036; x=1747915836;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RSnpW8vV8LEj6YD/aAOkQ8edkXuj5el51lqHfjllLdg=;
 b=Fh3o/7uaGIz9Bj2nizV3NwtgEqqrMGMQPO0/gQTAkxPGSWahaxQ3QiY7AFs+/AueK9
 btjEcR1U2xaL32DjKQI2LOrU2qS3q/muXeMvzdGb9mCUMony5tI9Jbuo4fxMHAsXcV39
 h3ZX/VeCmNjRV+RvBMMjhvJBXlAZ06bqC342I=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Fh3o/7ua
Subject: [Buildroot] [PATCH 04/10] package/libselinux: bump to version 3.8.1
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...1-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch | 2 +-
 package/libselinux/libselinux.hash                              | 2 +-
 package/libselinux/libselinux.mk                                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch b/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
index 3bdb1d0f46..0d6db785ec 100644
--- a/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
+++ b/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
@@ -36,7 +36,7 @@ index 190016e2af34..7ee22fd35da3 100644
  RUBYINC ?= $(shell $(RUBY) -e 'puts "-I" + RbConfig::CONFIG["rubyarchhdrdir"] + " -I" + RbConfig::CONFIG["rubyhdrdir"]')
  RUBYLIBS ?= $(shell $(RUBY) -e 'puts "-L" + RbConfig::CONFIG["libdir"] + " -L" + RbConfig::CONFIG["archlibdir"] + " " + RbConfig::CONFIG["LIBRUBYARG_SHARED"]')
  RUBYINSTALL ?= $(shell $(RUBY) -e 'puts RbConfig::CONFIG["vendorarchdir"]')
-@@ -193,7 +192,7 @@ install: all
+@@ -195,7 +194,7 @@ install: all
  install-pywrap: pywrap
  	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
  	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index fac9d3cef2..0933398f1e 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  ea03f42d13a4f95757997dba8cf0b26321fac5d2f164418b4cc856a92d2b17bd  libselinux-3.7.tar.gz
+sha256  ec2d2789f931152d21c1db1eb4bc202ce4eccede34d9be9e360e3b45243cee2c  libselinux-3.8.1.tar.gz
 
 # Hash for license file
 sha256  86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364  LICENSE
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 360ab063ca..e19bb4dd2d 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 3.7
+LIBSELINUX_VERSION = 3.8.1
 LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSELINUX_VERSION)
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
