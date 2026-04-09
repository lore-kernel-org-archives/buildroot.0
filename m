Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1507DE9DE6C
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4390410FE;
	Thu,  9 Apr 2026 08:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugGjozQvMHPW; Thu,  9 Apr 2026 08:46:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A159941100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775724387;
	bh=tYktNsChYKylHaHbTfaxBx54IOFzPKo/ff9OWqeSB8w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YVJxbUKK95HBrrZTsQL/300etitUmm/aN+iMnKjeTN0C8ZhqbX/04aM15aAS7O0C2
	 X9ZBJrOaBNiYTYIgcjTUH0lKNegJfRdi//aeG8AVfjtem69BYRGLjpLLUasfmxwzid
	 vu8MXwTOPRwWvAzn8L9HYOoZ2ogSVtlk8TxNyEKHmVnvfrUT4BlVj49ykAvK1D+aR8
	 M2Z20qkmCikquwJDvkg8tOYrLTUdwi5EkTV0+fVbPIno/y0OqRFrqKLsXyqJ72AYsz
	 DlXCl0OFKmbkq8OkKhX7Dlg9PPvt65hiY0Md1kUS6QzJ/lOIMu/k2/dGcFiaSemGqB
	 R9x3PUv/Vc/RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A159941100;
	Thu,  9 Apr 2026 08:46:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25DA71F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 235524039B
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBuvPOUgU7sv for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:46:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DAADD40246
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAADD40246
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAADD40246
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:46:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DA63BA4C09C3;
 Thu,  9 Apr 2026 10:43:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAkyk-000000004SH-3GME;
 Thu, 09 Apr 2026 08:43:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Mario Lang <mlang@blind.guru>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Thu,  9 Apr 2026 10:43:04 +0200
Message-ID: <20260409084305.3960494-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409084305.3960494-1-bernd@kuhls.net>
References: <20260409084305.3960494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775724200;
 bh=uq6O/yAm3difCCEyvLg2ojJPKI0YHKU45NuLdweU3Rg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ApfXylndPRqV05mdZh6MVPqE1Gfq96m8FLveSI+mDJYQZ48i1mgt7UCZJ/1I2KtAL
 b1BsMym3kt+aBtlPha4C9gGTbU+xph35r0Dw3B9pNZGG+ZMY7Pt1F6KNYBntiASr+j
 oplHFVvwn3vUCetAIQ7KiZDuDkUOIS1TqN/e0FKHmoT4WsV7rX7ztvnvCRLgZE2bRR
 XewhY10MI48VXk1h6/4HPptfhRS6gF0jzPzSMZ8JgyZwSh+Rqdcn6UUPvAOQJnP9/h
 m4OxO4pGq5pCsw3sjKOvMCbrU/mRCbCFXPQnCOjarTLDUvF+/QLfHEM1KpUuK9/7oF
 j6ryGBzYseJJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ApfXylnd
Subject: [Buildroot] [PATCH 20/20] package/pcre: remove package
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

Quoting https://www.pcre.org/
"The older, but still widely deployed PCRE library, originally released
 in 1997, is at version 8.45. This version of PCRE is now at end of
 life, and is no longer being actively maintained. Version 8.45 is
 expected to be the final release of the older PCRE library, and new
 projects should use PCRE2 instead. [...]"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  2 -
 Config.in.legacy                              |  7 +++
 package/Config.in                             |  1 -
 .../pcre/0001-Kill-compatibility-bits.patch   | 46 -------------------
 package/pcre/0002-Disable-C-unit-tests.patch  | 42 -----------------
 package/pcre/Config.in                        | 34 --------------
 package/pcre/pcre.hash                        |  4 --
 package/pcre/pcre.mk                          | 31 -------------
 8 files changed, 7 insertions(+), 160 deletions(-)
 delete mode 100644 package/pcre/0001-Kill-compatibility-bits.patch
 delete mode 100644 package/pcre/0002-Disable-C-unit-tests.patch
 delete mode 100644 package/pcre/Config.in
 delete mode 100644 package/pcre/pcre.hash
 delete mode 100644 package/pcre/pcre.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 900057f11c..e0fef8f92d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -743,8 +743,6 @@ package/paxtest/0001-genpaxtest-move-log-location.patch lib_patch.Upstream
 package/paxtest/0002-paxtest-page-alignment-ARM-and-NIOS2-arch.patch lib_patch.Upstream
 package/pcm-tools/0001-pmu-query.py-fix-python3-errors-add-linux-platform-s.patch lib_patch.Upstream
 package/pcmanfm/0001-po-de-po-fix-build-with-gettext-tiny.patch lib_patch.Upstream
-package/pcre/0001-Kill-compatibility-bits.patch lib_patch.Upstream
-package/pcre/0002-Disable-C-unit-tests.patch lib_patch.Upstream
 package/pdmenu/0001-autoconf-makeinfo.in-link-with-INTLLIBS-if-needed.patch lib_patch.Upstream
 package/pdmenu/0002-Makefile-autoconf-makeinfo.in-support-build-install-.patch lib_patch.Upstream
 package/perl-net-ssleay/0001-fix-build-system.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 078e2fdeac..af093ff3e1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_PCRE
+	bool "pcre removed"
+	select BR2_LEGACY
+	help
+	  pcre was no longer maintained upstream, so it has been
+	  dropped. Look at pcre2 for an alternative.
+
 config BR2_PACKAGE_SNORT
 	bool "snort removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index f12112c1d6..901f19042a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2326,7 +2326,6 @@ menu "Text and terminal handling"
 	source "package/ncurses/Config.in"
 	source "package/newt/Config.in"
 	source "package/oniguruma/Config.in"
-	source "package/pcre/Config.in"
 	source "package/pcre2/Config.in"
 	source "package/popt/Config.in"
 	source "package/re2/Config.in"
diff --git a/package/pcre/0001-Kill-compatibility-bits.patch b/package/pcre/0001-Kill-compatibility-bits.patch
deleted file mode 100644
index d2cf76bf8d..0000000000
--- a/package/pcre/0001-Kill-compatibility-bits.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e180a4085d8d2f82a05f037e465708cfc16bd2bf Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 14 Jun 2016 20:31:12 -0300
-Subject: [PATCH] Kill compatibility bits
-
-Kill ABI compatibility bits, we don't need them.
-Fixes build failures on non-ELF targets.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Fabrice: update for 8.44]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- pcrecpp.cc | 16 ----------------
- 1 file changed, 16 deletions(-)
-
-diff --git a/pcrecpp.cc b/pcrecpp.cc
-index d09c9ab..6910db0 100644
---- a/pcrecpp.cc
-+++ b/pcrecpp.cc
-@@ -58,23 +58,6 @@ static const int kVecSize = (1 + kMaxArgs) * 3;  // results + PCRE workspace
- // Special object that stands-in for no argument
- Arg RE::no_arg((void*)NULL);
- 
--// This is for ABI compatibility with old versions of pcre (pre-7.6),
--// which defined a global no_arg variable instead of putting it in the
--// RE class.  This works on GCC >= 3, at least.  It definitely works
--// for ELF, but may not for other object formats (Mach-O, for
--// instance, does not support aliases.)  We could probably have a more
--// inclusive test if we ever needed it.  (Note that not only the
--// __attribute__ syntax, but also __USER_LABEL_PREFIX__, are
--// gnu-specific.)
--#if defined(__GNUC__) && __GNUC__ >= 3 && defined(__ELF__) \
--       && !defined(__INTEL_COMPILER) && !defined(__LCC__)
--# define ULP_AS_STRING(x)            ULP_AS_STRING_INTERNAL(x)
--# define ULP_AS_STRING_INTERNAL(x)   #x
--# define USER_LABEL_PREFIX_STR       ULP_AS_STRING(__USER_LABEL_PREFIX__)
--extern Arg no_arg
--  __attribute__((alias(USER_LABEL_PREFIX_STR "_ZN7pcrecpp2RE6no_argE")));
--#endif
--
- // If a regular expression has no error, its error_ field points here
- static const string empty_string;
- 
--- 
-2.7.3
-
diff --git a/package/pcre/0002-Disable-C-unit-tests.patch b/package/pcre/0002-Disable-C-unit-tests.patch
deleted file mode 100644
index 1c9f26eb2e..0000000000
--- a/package/pcre/0002-Disable-C-unit-tests.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From e3c636b8c7f9912d8d3a9fabdaa0a96ba69f7b29 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 14 Jun 2016 20:32:44 -0300
-Subject: [PATCH] Disable C++ unit tests
-
-They fail to build on static targets and they're not installed anyway.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- Makefile.in | 9 ---------
- 1 file changed, 9 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 6d03912..2c42b3e 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -133,12 +133,6 @@ noinst_PROGRAMS = $(am__EXEEXT_2) $(am__EXEEXT_3) $(am__EXEEXT_4)
- @WITH_PCRE8_TRUE@am__append_20 = libpcreposix.la
- @WITH_GCOV_TRUE@@WITH_PCRE8_TRUE@am__append_21 = $(GCOV_CFLAGS)
- @WITH_PCRE_CPP_TRUE@am__append_22 = libpcrecpp.la
--@WITH_PCRE_CPP_TRUE@am__append_23 = pcrecpp_unittest \
--@WITH_PCRE_CPP_TRUE@	pcre_scanner_unittest \
--@WITH_PCRE_CPP_TRUE@	pcre_stringpiece_unittest
--@WITH_PCRE_CPP_TRUE@am__append_24 = pcrecpp_unittest \
--@WITH_PCRE_CPP_TRUE@	pcre_scanner_unittest \
--@WITH_PCRE_CPP_TRUE@	pcre_stringpiece_unittest
- @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE@am__append_25 = $(GCOV_CXXFLAGS)
- @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE@am__append_26 = $(GCOV_LIBS)
- @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE@am__append_27 = $(GCOV_LIBS)
-@@ -190,9 +184,6 @@ libpcreposix_la_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CC \
- 	"$(DESTDIR)$(includedir)"
- @WITH_REBUILD_CHARTABLES_TRUE@am__EXEEXT_2 = dftables$(EXEEXT)
- @WITH_JIT_TRUE@am__EXEEXT_3 = pcre_jit_test$(EXEEXT)
--@WITH_PCRE_CPP_TRUE@am__EXEEXT_4 = pcrecpp_unittest$(EXEEXT) \
--@WITH_PCRE_CPP_TRUE@	pcre_scanner_unittest$(EXEEXT) \
--@WITH_PCRE_CPP_TRUE@	pcre_stringpiece_unittest$(EXEEXT)
- PROGRAMS = $(bin_PROGRAMS) $(noinst_PROGRAMS)
- am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
- am__vpath_adj = case $$p in \
--- 
-2.7.3
-
diff --git a/package/pcre/Config.in b/package/pcre/Config.in
deleted file mode 100644
index 9d3a143365..0000000000
--- a/package/pcre/Config.in
+++ /dev/null
@@ -1,34 +0,0 @@
-config BR2_PACKAGE_PCRE
-	bool "pcre"
-	help
-	  Perl Compatible Regular Expressions. By default, only the
-	  8-bits libpcre is built. To get the 16-bits and/or 32-bits
-	  variants libpcre16/libpcre32, use the package sub-options.
-
-	  http://www.pcre.org/
-
-if BR2_PACKAGE_PCRE
-
-config BR2_PACKAGE_PCRE_16
-	bool "16-bit pcre"
-	help
-	  This option builds the 16-bits pcre library, i.e 'libpcre16'
-
-config BR2_PACKAGE_PCRE_32
-	bool "32-bit pcre"
-	help
-	  This option builds the 32-bits pcre library, i.e 'libpcre32'
-
-config BR2_PACKAGE_PCRE_UTF
-	bool "UTF-8/16/32 support in pcre"
-	help
-	  This option builds the pcre library with UTF-8/16/32 support
-
-config BR2_PACKAGE_PCRE_UCP
-	bool "Unicode properties support in pcre"
-	select BR2_PACKAGE_PCRE_UTF
-	help
-	  This option builds the pcre library with Unicode properties
-	  support (implies UTF-8/16/32 support)'
-
-endif
diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
deleted file mode 100644
index 6150303e24..0000000000
--- a/package/pcre/pcre.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated after checking pgp signature
-sha256  4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8  pcre-8.45.tar.bz2
-# License files, locally calculated
-sha256  51b3dea44f63338b84b9c97b3d793826a8397309068cf9379a423216ab8ea5b2  LICENCE
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
deleted file mode 100644
index 59750c28e7..0000000000
--- a/package/pcre/pcre.mk
+++ /dev/null
@@ -1,31 +0,0 @@
-################################################################################
-#
-# pcre
-#
-################################################################################
-
-PCRE_VERSION = 8.45
-PCRE_SITE = http://downloads.sourceforge.net/project/pcre/pcre/$(PCRE_VERSION)
-PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
-PCRE_LICENSE = BSD-3-Clause
-PCRE_LICENSE_FILES = LICENCE
-PCRE_CPE_ID_VENDOR = pcre
-PCRE_INSTALL_STAGING = YES
-PCRE_CONFIG_SCRIPTS = pcre-config
-
-# They're required for host-libglib2
-HOST_PCRE_CONF_OPTS = --enable-unicode-properties
-
-ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
-# pcre will use the host g++ if a cross version isn't available
-PCRE_CONF_OPTS += --disable-cpp
-endif
-
-PCRE_CONF_OPTS += --enable-pcre8
-PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_16),--enable-pcre16,--disable-pcre16)
-PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_32),--enable-pcre32,--disable-pcre32)
-PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_UTF),--enable-utf,--disable-utf)
-PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_UCP),--enable-unicode-properties,--disable-unicode-properties)
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
