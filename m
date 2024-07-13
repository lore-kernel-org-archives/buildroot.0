Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF541C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 12:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A47483EDC;
	Sat, 13 Jul 2024 12:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CjsKWMKuGc-r; Sat, 13 Jul 2024 12:24:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41E1882046
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41E1882046;
	Sat, 13 Jul 2024 12:24:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE4A91BF5AE
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7A4E60626
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SyKbuR-F1N8W for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 12:24:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3014D60621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3014D60621
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3014D60621
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:24:23 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa6b3so1778166a12.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 05:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720873460; x=1721478260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JWErk14YQ5y/XAusLG396th3nxpdmWF5Id5bT3QbwPw=;
 b=p4rxjzKrQYM6YniA2tBBQX8H5CVlI8AFvoDXQDJlkHtpruT3sb71LsiCXu3K6C5IWG
 cy6RM6EYy5BDA0c3q3OK1ZOazZntwCcKI4bHAMBT50yXqhM7uDHa15jWKdnajOy/1bjo
 +qUhRcsdAPM2BaqggE7OWP4DDNtsXeM5NcPP4E0kdVu1DGOtlEPdlP4WJmlMPxDhxVfP
 X5ap9eUbLQJIGDw7hbJMfv8iVIhVI9wcqyAe/c/dVC4F9K56ShRrGxGt1Ji6qvEBa6BE
 di2qRgLMFWM4Q5CCzpFYP0QzOcvbYAx/MomSmBQSflmPir5LYVe33wLew6dfyDP4QGMD
 R5Lg==
X-Gm-Message-State: AOJu0YyjPSfBplHw3XF1lkvHgjZc16nkxGih0l7Bmwn66Rv6dawbX3nL
 lUp2rLi1+LpFmwkQoTXnKYmHsufxj4YwSMfOk0NHq3qidpC/MiCEGVHczA==
X-Google-Smtp-Source: AGHT+IHCed7FWZAwda3AiR9Sd/cLdbuRN+zMnY7X5DjOvsngB3L/cZgIzRKNOmBrj3Boq16gyMbo4w==
X-Received: by 2002:a05:6402:348c:b0:58f:2087:7983 with SMTP id
 4fb4d7f45d1cf-594bcba842bmr12643662a12.40.1720873460246; 
 Sat, 13 Jul 2024 05:24:20 -0700 (PDT)
Received: from hthiery.fritz.box (ip5f5ba0e6.dynamic.kabel-deutschland.de.
 [95.91.160.230]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b26f621b8sm700586a12.85.2024.07.13.05.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 05:24:19 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org,
	Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Jul 2024 14:23:36 +0200
Message-Id: <20240713122331.298786-5-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240713122331.298786-1-heiko.thiery@gmail.com>
References: <20240713122331.298786-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720873460; x=1721478260; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JWErk14YQ5y/XAusLG396th3nxpdmWF5Id5bT3QbwPw=;
 b=TrggIEp5YKW7NBLq6rb54mpjyC8taUKXrU0OifyjlJJkXTFdpyOrzPJ77oV3+YgvVs
 WDPO3JmvcSH/EQbI+OfFGsU0PLb96iwL/3I4FmKCr+zXTtIKbtfZg5Up5mq0crzsdKjy
 I2DgcD2MFhOF9gwQ8o6c5I1Gmy6YE7THfqvMFgapZkhdV4qsTp5XJU4gwK+UmxKqG1Tw
 wWYlWvHwlevbtNAATrKa03b1YdTXa+IYiUTKWNDynVk7gm6xeSi/sibALEC0zR+2VtBl
 B42mMsMkUIJhRGRVi7yc4ap+wlr+XEynRa2Z2e1V4H5ZYbZkJzaDztSuF9Gjj/mfDKbs
 sBAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TrggIEp5
Subject: [Buildroot] [PATCH v4 4/4] package/pkg-generic.mk: add variable to
 skip ccache dependency
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
Cc: Lance Fredrickson <lancethepants@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As more and more packages are required to build the host ccache package
and therefore they has to be filtered out for ccache dependency the list
growed up.

By adding the variable <PKG>_ADD_CCACHE_DEPENDENCY with the default
value to 'yes' we can remove that dependency for each package that is
needed by ccache by setting the value to 'no'. This can be done  in the
package makefile instead of tracking the list in the core pkg-generic.mk file.

This behavior is similar to the skeleton and toolchain dependency.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v4:
    - new commit

 package/blake3/blake3.mk     |  3 +++
 package/ccache/ccache.mk     |  4 ++++
 package/cmake/cmake.mk       |  3 +++
 package/fakedate/fakedate.mk |  3 +++
 package/hiredis/hiredis.mk   |  3 +++
 package/lzip/lzip.mk         |  3 +++
 package/pkg-generic.mk       | 13 +++++++------
 package/pkgconf/pkgconf.mk   |  3 +++
 package/skeleton/skeleton.mk |  3 +++
 package/tar/tar.mk           |  3 +++
 package/xxhash/xxhash.mk     |  3 +++
 package/xz/xz.mk             |  3 +++
 package/zstd/zstd.mk         |  3 +++
 13 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
index 5625046db6..3b1ccb44cc 100644
--- a/package/blake3/blake3.mk
+++ b/package/blake3/blake3.mk
@@ -10,6 +10,9 @@ BLAKE3_SUBDIR = c
 BLAKE3_LICENSE = Apache-2.0, CC0-1.0
 BLAKE3_LICENSE_FILES = LICENSE
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_BLAKE3_ADD_CCACHE_DEPENDENCY = NO
+
 # We may be a ccache dependency, so we can't use ccache; reset the
 # options set by the cmake infra.
 HOST_BLAKE3_CONF_OPTS += \
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index d92608512c..f727ca04bd 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -9,6 +9,10 @@ CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSI
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
 CCACHE_LICENSE_FILES = LICENSE.adoc GPL-3.0.txt
+
+# Do not add a recursive dependency to its own
+HOST_CCACHE_ADD_CCACHE_DEPENDENCY = NO
+
 HOST_CCACHE_DEPENDENCIES = host-hiredis host-zstd host-xxhash host-blake3
 
 # We are ccache, so we can't use ccache
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index eacecdc0ee..842457eb34 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -14,6 +14,9 @@ CMAKE_CPE_ID_VALID = YES
 # Tool download MITM attack warning if using npm package to install cmake
 CMAKE_IGNORE_CVES = CVE-2016-10642
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_CMAKE_ADD_CCACHE_DEPENDENCY = NO
+
 # CMake is a particular package:
 # * CMake can be built using the generic infrastructure or the cmake one.
 #   Since Buildroot has no requirement regarding the host system cmake
diff --git a/package/fakedate/fakedate.mk b/package/fakedate/fakedate.mk
index 99ea748e07..3db9145e63 100644
--- a/package/fakedate/fakedate.mk
+++ b/package/fakedate/fakedate.mk
@@ -7,6 +7,9 @@
 # source included in buildroot
 HOST_FAKEDATE_LICENSE = GPL-2.0+
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_FAKEDATE_ADD_CCACHE_DEPENDENCY = NO
+
 define HOST_FAKEDATE_INSTALL_CMDS
 	$(INSTALL) -D -m 755 package/fakedate/fakedate $(HOST_DIR)/bin/date
 endef
diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index 476b079336..86f35bd4cd 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -12,6 +12,9 @@ HIREDIS_LICENSE_FILES = COPYING
 HIREDIS_CPE_ID_VENDOR = redislabs
 HIREDIS_INSTALL_STAGING = YES
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_HIREDIS_ADD_CCACHE_DEPENDENCY = NO
+
 HIREDIS_CONF_OPTS = -DENABLE_NUGET=OFF -DDISABLE_TESTS=ON
 HOST_HIREDIS_CONF_OPTS = -DENABLE_NUGET=OFF -DDISABLE_TESTS=ON -DENABLE_SSL=OFF
 
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index 31b5750767..9e09e578db 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -9,6 +9,9 @@ LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_LZIP_ADD_CCACHE_DEPENDENCY = NO
+
 define LZIP_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) ./configure --prefix=/usr \
 		$(TARGET_CONFIGURE_OPTS) )
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index eeb7531dbb..0dd9f6b26d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -761,6 +761,9 @@ endif # ifeq ($$($(2)_CPE_ID_VALID),YES)
 # Similarly for the skeleton.
 $(2)_ADD_TOOLCHAIN_DEPENDENCY	?= YES
 $(2)_ADD_SKELETON_DEPENDENCY	?= YES
+ifeq ($$(BR2_CCACHE),y)
+$(2)_ADD_CCACHE_DEPENDENCY	?= YES
+endif
 
 
 ifeq ($(4),target)
@@ -772,6 +775,10 @@ $(2)_DEPENDENCIES += toolchain
 endif
 endif
 
+ifeq ($$($(2)_ADD_CCACHE_DEPENDENCY),YES)
+$(2)_DEPENDENCIES += host-ccache
+endif
+
 ifneq ($(1),host-skeleton)
 $(2)_DEPENDENCIES += host-skeleton
 endif
@@ -792,12 +799,6 @@ $(2)_EXTRACT_DEPENDENCIES += \
 		$$(call extractor-pkg-dependency,$$(notdir $$(dl))))
 endif
 
-ifeq ($$(BR2_CCACHE),y)
-ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache host-cmake host-hiredis host-pkgconf host-zstd host-xxhash host-blake3,$(1)),)
-$(2)_DEPENDENCIES += host-ccache
-endif
-endif
-
 ifeq ($$(BR2_REPRODUCIBLE),y)
 ifeq ($$(filter host-skeleton host-fakedate,$(1)),)
 $(2)_DEPENDENCIES += host-fakedate
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 1d73b691e1..a8c7b48287 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -11,6 +11,9 @@ PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
 PKGCONF_CPE_ID_VENDOR = pkgconf
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_PKGCONF_ADD_CCACHE_DEPENDENCY = NO
+
 # We are a ccache dependency, so we can't use ccache
 HOST_PKGCONF_CONF_ENV = \
 	CC="$(HOSTCC_NOCCACHE)" \
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 4eaaf32ead..1bb3971191 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -11,6 +11,9 @@
 SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_ADD_SKELETON_DEPENDENCY = NO
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_SKELETON_ADD_CCACHE_DEPENDENCY = NO
+
 # Although the $(HOST_DIR)/usr symlink is mostly for backward compatibility,
 # there are weird packages that still require it (see host-systemd, and
 # commit 35c11a027c88).
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index a7e85afb72..b9de082603 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -13,6 +13,9 @@ TAR_CPE_ID_VENDOR = gnu
 TAR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 TAR_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_TAR_ADD_CCACHE_DEPENDENCY = NO
+
 # busybox installs in /bin, so we need tar to install as well in /bin
 # so that we don't end up with two different tar
 #
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index fde8e464f9..f16a784966 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -10,6 +10,9 @@ XXHASH_LICENSE = BSD-2-Clause (library), GPL-2.0+ (xxhsum)
 XXHASH_LICENSE_FILES = LICENSE cli/COPYING
 XXHASH_INSTALL_STAGING = YES
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_XXHASH_ADD_CCACHE_DEPENDENCY = NO
+
 XXHASH_TARGETS = xxhsum libxxhash.pc
 XXHASH_INSTALL_TARGETS = \
 	install_libxxhash.includes \
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index fa4f6dbda9..e295144ed1 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -13,6 +13,9 @@ XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
 XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_XZ_ADD_CCACHE_DEPENDENCY = NO
+
 XZ_CONF_OPTS = \
 	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
 	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index a2da0dd479..575bb2c838 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -12,6 +12,9 @@ ZSTD_LICENSE_FILES = LICENSE COPYING
 ZSTD_CPE_ID_VENDOR = facebook
 ZSTD_CPE_ID_PRODUCT = zstandard
 
+# The package is a dependency to ccache so ccache cannot be a dependency
+HOST_ZSTD_ADD_CCACHE_DEPENDENCY = NO
+
 ZSTD_OPTS += PREFIX=/usr
 ZSTD_OPTS += ZSTD_LEGACY_SUPPORT=0
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
