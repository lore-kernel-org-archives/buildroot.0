Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1162CC982ED
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 23:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E4B16068D;
	Mon, 21 Sep 2026 23:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCYz7nTfskus; Mon, 21 Sep 2026 23:53:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6A67D60644
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790034791;
	b=Drj/G5uAWWfA6RpjFYoSScmw+oXdjkTnGchKkkhOFRTY1ctUQWhFnW+Rxle8bJC7rab8
	 y5YJ9paPJWdVtkOVERxMSsrBCALWYjBvy4Cz4z8jup+aJ8iVayTmgLluTKCN82pZRHiSv
	 wIvBAH6+JpdPjd5pJQF+NPxLGJ+naYtnG7gZ0rhJLH2G4byCcji5ecm6rjO6M+UVZ3w4N
	 l93qCjcZ1DCIId73Uoqle4TCfuB9PiHOW99egwFLBtNlcX1NQc7YH4DpRmYBM2aS7wE9E
	 nFn2N+COzHQBMtBFcc1wfOP26FelfkWtKH5cHhm4SkU3e6UpICIDzfucGBbNLtgviVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790034791;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OnhjeAHZQleiFbFaP/3nUWm3OSXmAh9ZmxNuphXQdmQ=;
	b=jE4j6OqbwONJ6D2RTfcNAZb6qM6Qo0dtbEx3KkhwF4UcgDMxzXxJ3ieNFnl380oNRsdK
	 TK+FmibTZVFhTAnmjgAX0PACA5zxGCcN9/k3rkO2hJO4aihvKftbgCW7brqjxaoksEp6v
	 idqqrsbMaOOfRsVRpJx3ZvzSOapN0QQwYWj6Ch8MBu7z5NRobGI6OgEQnSBblTy/6moD9
	 2Eg8mO9yrZhTV/WuMlXrvtGbj7wK8bYFCYpmutY3pwHdaS9FGZBWayEW1l7BzqZqfIAOA
	 bOqO1qYx13wJDheBt0Ip4Aqfbkf9UnGRsWrxQ1id6MvkjuNVv0OLFQs7/G+CdgzsYJw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790034791;
	bh=OnhjeAHZQleiFbFaP/3nUWm3OSXmAh9ZmxNuphXQdmQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=PbWn+KfQjJmGKYmyhBU/pklbtyXnXUVCBTOXq0UyBNN0zD0W32XpEbw9V8w57wx22
	 zxHlb93COkxgfHXisBjDd1PE+wIRgm6dQ3nAWmNC3F+2Bn6MWlBc667uvahcLf81E0
	 jVePUazndDw+GoAL5vU/A/msqFZfQ16uRSgDyfJ6lp819KdiIqNI2S+JdA9vi2MWD5
	 i0q4xhnpZDq6rz5HmXm5rRhb7jK8sIaPegRS9Fw0E4ndqsg/KNjLAPru/2Q9Qp1OpR
	 0E4Umokx1xUTpexmXaK5DI/aNN5PKw1zS/0vsR4O0Ne5mL6G2FnK/YkxfkRtRtCFAT
	 o0vX/3p4l2VAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A67D60644;
	Mon, 21 Sep 2026 23:53:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C43EC3A9
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 23:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA89540194
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 23:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9frFuVfUzbqO for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 23:53:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CB4AE40116
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790034788;
 b=MQBidUxNv7sq8cYAusHzrewJvat1dynI8y8Tr+EeDBucMSY3SeXyGE1N4pK3pxt4TB9z
 44cwoDMHYxVSHkvgb7YCN7jqn40C6gRk+mGRhmJETcGn2/0UCVwfOh8OFnPYOORULrLFL
 zb+gtEjYHCRw7TZS2ilQmRBIh/GgEcXG47cC+a40f+O0vbk80+yejMbXBFN/4hRJA6GXg
 h+gjQfQAR/s9RyLqcfm5mlQdpG12QK61Fxx7tofR437TNC5HAAmI+KTs5djB7qGhvb7nG
 n3e9e99cUu1r5XC1SniwXfOhkCmv5tbimoOmjGK/71kDft2X4Dfx75cyS+q9LWb5kow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790034788;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=iNTCIZNxia/VN9VidfcM4KWfiEkw9/oWBJ0NgNLZjWs=;
 b=nOnG11BN4QZcnSdA67Jl5k/HB/D7M212dG26dguezV6+eeWExFwyoVC8rdj+XEcHp6A5
 4H5/pFf89LFptCS//rNXEJ5TdA/kx2Wd/kh0ZugGSy3bvWeQZDxg5Kd199u2fjWZm1avl
 JqYUgS6HQWkzjcyHj7VwWmnr7i9V9JhhPIYMirNh0W6W8IAlPYB6ygvrSyWyzMgQmkdgQ
 Sg4y0hfz1j3kT7krmjDM3T5Y6kRwkBBvC39g+JXlEPVJzVkIdfwip5m/XUBz2Qlgu3lHy
 geXwaWEnGf1hjbr9HTMM0LeKqzHTF9IlPzwUgnsl0iDA3cykf2tNNw2ECBwHbpMsxhQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=JeW23DEg; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB4AE40116
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 23:53:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49lJ-1whxNG1fsn-017vtb; Tue, 22
 Sep 2026 01:52:55 +0200
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Tue, 22 Sep 2026 01:52:39 +0200
Message-ID: <20260921235239.3826789-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:gw03IsbT14eRrXjp+H6RBJY3B40zMwRzVIOkpXctR0mnVlPVfE/
 GK8L+EhIU99G5peoeta7H/cPVQ8NZFgYJHAFUKkZ6XCLISwycS1bJb7YS+a6stKPaHYnBfJ
 dsIwBHphXUQXxxMmIdOGktiADS8OOTHZUykp2pMRwscD/dwD4Obt7FAixfq1nSYteEv+zVe
 8QmgNs8eX5etPEOhQYhDA==
UI-OutboundReport: notjunk:1;M01:P0:EYmM+sR9lGU=;lqI18wDx0Krc4hPZhdkusVuBwgX
 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
 WiPHaRao1bs6KEekUKKFBBTHXw==
Subject: [Buildroot] [PATCH 1/1] package/kbd: fix static build with uClibc
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since upstream commit 7fdd8debe37ae52812b77d82e08713bd62c607f4 [1]
(included from release 2.9.0) libkbdfile unconditionally includes
dlfcn.h. uClibc provides this header only if shared library support is
enabled [2], so building kbd fails if BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
and BR2_STATIC_LIBS=y (BR2_SHARED_STATIC_LIBS=y works).

The issue has been fixed upstream [3], backport the patch.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git/commit/?id=7fdd8debe37ae52812b77d82e08713bd62c607f4
[2] https://github.com/wbx-github/uclibc-ng/blob/v1.0.59/Makefile.in#L260
[3] https://github.com/legionus/kbd/issues/159

Fixes: 930660890bf8b40d9bd55cd9e202e574b53d5d49
Fixes: https://autobuild.buildroot.org/results/872d12bf869717ae8aec9a2ed6295cf8f7e8b098/
Fixes: https://autobuild.buildroot.org/results/056b5fe4ca230989041a1ed166c1b509f8bb0908/

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Upstream fix was quick, so this replaces my previous patch to disable
static kbd builds with uclibc. test-pkg fails with
bootlin-aarch64-glibc-old, but that also happens on current master, so
isn't a regression.

 ...re-dlopen-and-memfd_create-for-libra.patch | 146 ++++++++++++++++++
 package/kbd/kbd.mk                            |   4 +
 2 files changed, 150 insertions(+)
 create mode 100644 package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch

diff --git a/package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch b/package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
new file mode 100644
index 0000000000..3c83146d75
--- /dev/null
+++ b/package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
@@ -0,0 +1,146 @@
+From 8e552683fa36fe9d09ee3e0909e600350d0bc3cb Mon Sep 17 00:00:00 2001
+From: Alexey Gladkov <legion@kernel.org>
+Date: Mon, 21 Sep 2026 12:15:00 +0200
+Subject: [PATCH] libkbdfile: Require dlopen and memfd_create for library
+ decompressors
+
+The library decompressors need dlopen() to load compression libraries
+and memfd_create() to hold decompressed data. Building them without
+these facilities can fail even though external decompression commands
+remain available.
+
+Enable the library backends and ELF note support only when both
+requirements are met, and apply the same condition to the ELF note
+test. Otherwise, retain the external-command fallback.
+
+Also restrict the libbz2 fallback probe to failed pkg-config lookups
+so that --without-bzip2 does not inadvertently enable bzip2 support.
+
+Link: https://github.com/legionus/kbd/issues/159
+Signed-off-by: Alexey Gladkov <legion@kernel.org>
+Upstream: https://github.com/legionus/kbd/commit/6ff3161c1e5d448920d412a269716cf42be155b5
+[Fiona: backport to 2.9.0]
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+---
+ configure.ac               | 19 ++++++++++++-------
+ src/libkbdfile/Makefile.am |  9 +++++++--
+ src/libkbdfile/elf-note.c  |  3 +++
+ 3 files changed, 22 insertions(+), 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 05cecab..0691167 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -81,7 +81,7 @@ AC_FUNC_STAT
+ AC_FUNC_MALLOC
+ AC_FUNC_REALLOC
+ AC_FUNC_STRERROR_R
+-AC_CHECK_FUNCS([alarm dup2 endpwent memset setlocale strcasecmp strerror \
++AC_CHECK_FUNCS([alarm dup2 endpwent memset setlocale strcasecmp strerror memfd_create \
+ 		strdup strndup strchr strrchr strspn strstr strtol])
+ 
+ AC_SEARCH_LIBS([timer_create], [rt])
+@@ -263,13 +263,18 @@ AS_IF([test "$VLOCK_PROG" = "yes"], [
+ ])
+ AM_CONDITIONAL(VLOCK, test "$VLOCK_PROG" = "yes")
+ 
++AS_IF([test "$enable_dlopen" = "yes" -a "$ac_cv_func_memfd_create" = "yes"],
++      [enable_kbdfile_elfnote=yes],
++      [enable_kbdfile_elfnote=no])
++AM_CONDITIONAL(USE_ELFNOTE, test "$enable_kbdfile_elfnote" = "yes")
++
+ AC_ARG_WITH([zlib],
+ 	[AS_HELP_STRING([--with-zlib],
+ 			[support zlib compression @<:@default=auto@:>@])],
+ 	[],
+ 	[: m4_divert_text([DEFAULTS], [with_zlib=yes])]
+ )
+-AS_IF([test "$with_zlib" != "no"],
++AS_IF([test "$with_zlib" != "no" -a "$enable_kbdfile_elfnote" = "yes"],
+ 	[PKG_CHECK_MODULES(ZLIB, zlib, [HAVE_ZLIB=yes], [HAVE_ZLIB=no])],
+ 	[HAVE_ZLIB=no]
+ )
+@@ -284,11 +289,11 @@ AC_ARG_WITH([bzip2],
+ 	[],
+ 	[: m4_divert_text([DEFAULTS], [with_bzip2=yes])]
+ )
+-AS_IF([test "$with_bzip2" != "no"],
+-	[PKG_CHECK_MODULES(BZIP2, bzip2, [HAVE_BZIP2=yes], [HAVE_BZIP2=no])],
++AS_IF([test "$with_bzip2" != "no" -a "$enable_kbdfile_elfnote" = "yes"],
++	[PKG_CHECK_MODULES(BZIP2, bzip2, [HAVE_BZIP2=yes], [HAVE_BZIP2=auto])],
+ 	[HAVE_BZIP2=no]
+ )
+-AS_IF([test "$HAVE_BZIP2" = "no"], [
++AS_IF([test "$HAVE_BZIP2" = "auto"], [
+ 	AC_CHECK_LIB(bz2, BZ2_bzDecompressInit, [
+ 		HAVE_BZIP2=yes
+ 		BZIP2_LIBS=-lbz2
+@@ -306,7 +311,7 @@ AC_ARG_WITH([lzma],
+ 	[],
+ 	[: m4_divert_text([DEFAULTS], [with_lzma=yes])]
+ )
+-AS_IF([test "$with_lzma" != "no"],
++AS_IF([test "$with_lzma" != "no" -a "$enable_kbdfile_elfnote" = "yes"],
+ 	[PKG_CHECK_MODULES(LZMA, liblzma, [HAVE_LZMA=yes], [HAVE_LZMA=no])],
+ 	[HAVE_LZMA=no]
+ )
+@@ -321,7 +326,7 @@ AC_ARG_WITH([zstd],
+ 	[],
+ 	[: m4_divert_text([DEFAULTS], [with_zstd=yes])]
+ )
+-AS_IF([test "$with_zstd" != "no"],
++AS_IF([test "$with_zstd" != "no" -a "$enable_kbdfile_elfnote" = "yes"],
+ 	[PKG_CHECK_MODULES(ZSTD, libzstd, [HAVE_ZSTD=yes], [HAVE_ZSTD=no])],
+ 	[HAVE_ZSTD=no]
+ )
+diff --git a/src/libkbdfile/Makefile.am b/src/libkbdfile/Makefile.am
+index 2511064..ebdb28d 100644
+--- a/src/libkbdfile/Makefile.am
++++ b/src/libkbdfile/Makefile.am
+@@ -10,14 +10,17 @@ headers = \
+ libkbdfile_la_SOURCES = \
+ 	$(headers) \
+ 	contextP.h \
+-	elf-note.h \
+-	elf-note.c \
+ 	init.c \
+ 	kbdfile.c
+ 
+ libkbdfile_la_LIBADD =
+ libkbdfile_la_CFLAGS =
+ 
++if USE_ELFNOTE
++libkbdfile_la_SOURCES += \
++	elf-note.h \
++	elf-note.c
++
+ if USE_ZLIB
+ libkbdfile_la_SOURCES += kbdfile-zlib.c
+ libkbdfile_la_CFLAGS += $(ZLIB_CFLAGS)
+@@ -38,6 +41,8 @@ libkbdfile_la_SOURCES += kbdfile-zstd.c
+ libkbdfile_la_CFLAGS += $(ZSTD_CFLAGS)
+ endif
+ 
++endif # USE_ELFNOTE
++
+ KBDFILE_CURRENT  = 1
+ KBDFILE_REVISION = 0
+ KBDFILE_AGE      = 0
+diff --git a/src/libkbdfile/elf-note.c b/src/libkbdfile/elf-note.c
+index 842be9d..bc4a684 100644
+--- a/src/libkbdfile/elf-note.c
++++ b/src/libkbdfile/elf-note.c
+@@ -6,7 +6,10 @@
+ #include <stdint.h>
+ #include <stdarg.h>
+ #include <errno.h>
++
++#ifdef HAVE_DLFCN_H
+ #include <dlfcn.h>
++#endif
+ 
+ #include "elf-note.h"
+ 
+-- 
+2.55.0
+
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 34401075ce..6e34a45bae 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -14,6 +14,10 @@ KBD_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf
 
+# 0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
+# modifies configure.ac and src/libkbdfile/Makefile.am
+KBD_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 KBD_CONF_OPTS += --with-bzip2
 KBD_DEPENDENCIES += bzip2
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
