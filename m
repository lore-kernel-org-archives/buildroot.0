Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0DCCA5FD4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE5D7607D4;
	Thu,  1 Oct 2026 14:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsCdx-HfAoy8; Thu,  1 Oct 2026 14:23:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 574C160DA3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864624;
	b=CgpicIZb0y9fbQLpufKfrKpojcX8VHZJBwCGZ0PpCYVAq/4tfKFxVq64GKgg3HWLgGOz
	 tjKYcJmHuPxHRp9m2B7Bfgl+eu0nGbOpbtw6acwqNfCgEUeEq0REWXyDM69q0MK1Wq1VZ
	 BLpL706zkWTusM1Qch9UWrgwEbhk7LgLaqPxHxpLEtGbvvw2KG766npA9Ve4I/d7Yjt3u
	 IWnmAMliFdVSfzMxcsGmC6B8Ci9sDVBuCKT+LEiELQBFBFnsPonWvmOHtGPcf4V9G7rkU
	 y+QDZ8mO0Ob87tziBsOX6EOHjVARFTODI8mRn+sRGxVffTSqSYGqucBDSUAyfb3Vj7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864624;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ZiMFp6xsdPk6m/CUTr6dIAuHvED2wIjhmoQGm19bR+s=;
	b=eywbAvPFRn4vzS3T8ZzC0wcs+9oSJPjFe4Nuk5FKdGmUYEYPeUaDK96Xh4fHdUPbZJwY
	 ZXyhMMGoxumhDYrWqOM6SBsRaTYPVWNj2EA1mONW51QGMXPJ2xKfyfhbBK8/p5HFupfSj
	 HxKpLvnoj+YdD5fS+ooaOnftS2zQrxyVpntgWBxlFkzMLTHYZq50z+nGIY23Hz7tsUiXw
	 /uhUTbiagSV1MMkQ+VAcsfwR4E8Yd3zPpPvETeSMsGq8rgX+OycDMB+rW5h3b+pEUJaRl
	 t53KKfjNqWUzvF9XZflIpl9TpOdlpCyyEurTj01pIDztQk7pwHgP965BYYwDxJPsEdA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864624;
	bh=ZiMFp6xsdPk6m/CUTr6dIAuHvED2wIjhmoQGm19bR+s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F8st4kvHb1/1k20xQGVFJFafVsR6UMzjKf84FRTMImD3qdjngHkerPU1a30xa5AK/
	 OIT2+CE7x9DcYCPUwFueQVJ6fh83rCl2X/Xh5zhWUXVttSsykiEfpJ6BUNM68qzyDn
	 Zt9Pqj4Urjdp6IM9Q1tPSRXV2HePFNHxiNKWrpnbmGP9xRyXY7Icqbwj9Jp7aVGwxQ
	 DwK2GHPfu03vUIAEdeWfnAdBBvtMbcuF6Tz+Q5ZTUuLcCO/MRNxrKN4YznY/XRwyHD
	 6R/J+bW2CfsZQ72nwK4Oi3BKWwnfvrjGLiE2wZCgMft45nIt2t42LvKekEr3/QMN32
	 W0+cSALTJdnRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 574C160DA3;
	Thu,  1 Oct 2026 14:23:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1005F1FE9
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECA0C407C0
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kQB2uHBWLxS for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0F27B40A18
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864563;
 b=ogvIIsq6jzU4cTMiNTlS8qz6AIV0C2QIZn21oWvCKrarmMjOi/9wppFDACgVqi4Lgt6K
 g+5OjqpO6HchzLccbA6jgnIAh51NcHflUnOKhL7tKFDTCquPcq9TOAyNHLqA7XO/IsUtc
 VBSwLykJVq2b47yjFxZb9bFVnXFJhslcpagGq58lB6Ft6I8gJrqipxhWLadxjbXvnocfM
 Wf4d7n/5uX9KRZvZxrmpgF7PbCbbSCk+ZL/W99bM5LgoFr2A/01YlvdZgShIaERA6Bg2K
 UoCST1u8RiERg8m2eff9Ec9judgtwE3rcvUnG4YcUPiS9VT1qNGKzdQ7BAj4UBfhDOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864563;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=g4Ni90cWHTtZl/8Z23fFLYhezj4Db+PEVq3S3M2p/ag=;
 b=N0afZS2EXW0SebnsUGt6bd6d6bcZdgmK4K1AAP899cLyR4m2e2hUcdhQuKbqzy61HZYB
 lZP6reayKoX/d27WQSsN/bcZLVN357d51HSj/m5dj7Ep000eMDiDe3CJMkSChVhumNefi
 xfMsUTm67bJntcpXyAKOGnTUkIcFOO8yKtkqmheLWFEAl90o0zQI7oWaujMqxIuppRd9F
 2YKHv3NACmkFb+jXXlo/oTMylKII1b9cEJz/fy7VtL7kCf1Dp1TQPPTCGKJQDBRvi41Dn
 fkrelaEjaKklKNk1ceJ61j5VPfNmfRiAiNkc5g98cVWJk5+NmMPCo+41ght7qM6H8Ug==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F27B40A18
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FDB29843D; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:07:29 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 0dd1e48c4d1674d2d078e480b23515f4eb9a77b6
X-Git-Newrev: 6a4a0b32f09d3df1c9085027f3ed9ab81d33024d
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.2FDB29843D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/kbd: fix static
 build with uClibc
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6100636155410686176=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6100636155410686176==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6a4a0b32f09d3df1c9085027f3ed9ab81d33024d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7eede98528473729916483aa5f7e3955433fa893)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...Require-dlopen-and-memfd_create-for-libra.patch | 146 +++++++++++++++++++++
 package/kbd/kbd.mk                                 |   4 +
 2 files changed, 150 insertions(+)

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

--===============6100636155410686176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6100636155410686176==--
