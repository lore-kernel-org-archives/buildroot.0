Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B44C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 16:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8BE480E87;
	Tue, 22 Sep 2026 16:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7W_UZffXrtL; Tue, 22 Sep 2026 16:53:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 92E5D80E8B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790096023;
	b=X8e/Ri/5Fa2tnh/lRjupeND9DPxrrUgqJp89Ub3Da1jM2MDFMUAsCjFW4eRmgm4ARZkr
	 vNp3v1qT6syzO73/4NbqC5WVlyM/wJ4iAhxb7WkOtW/asJcgoMlBAoy45tla0t8x2rlBy
	 qtwAZ8n/4v3FCPsZ1XAvqs0jpiqrRWgYg9F9V0xc0k24X61gCKwpAtKL5i+l7HPTVpoUH
	 ZtvndMkqbo5GAn1Ipoig/+HM+j3HC4cfbH6r1RHgyki1HvJNJQqSlp6Nlyo7lt8haYZld
	 Rf5PlmUAs+1rsKhLHN0svxIuGCLyhyZ3Kt/hEDjIVGJ3B+xLbS6srv4fpn7TN7eBt7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790096023;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rn2NW2HpBVu2TTaHN1zoiC5lgl1s+W3cFx39o2gBh+g=;
	b=Xv3fJrxQFbvZ7SIKTVXhE7pHwpuu9QGwd1+ufVLZDYAVA+heeB7yZzXEbsI1IJlAKV0r
	 7kurZsa66lS1KBO5u+xis7KGWE5osN9uPOMd7OVGRuUusYFFKHZc7jgE01dd/JERqhPcg
	 o+4+f7+7e+D98bX0wXzDo1ieVYCRH+u2gpH+BmUzObBNfPxsAWFIxnZ9KCnkX7scIFg/2
	 7j6QE8PuzgQGn67gL8PDYE6KzlOy6HdjNLVfVvKrvsXh7le6dbJWEr3SMNn9oV9lav8Ee
	 ktFPPCXPiVOya0TQtITcsxwQH2k3jOr/7MxgFwqhB6Jh2AMpWf6EEaRyoMFUzfsAD1Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790096023;
	bh=rn2NW2HpBVu2TTaHN1zoiC5lgl1s+W3cFx39o2gBh+g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Via8okGwr9xp7Tub+U29pvpGy1iwUJU8IKHJ2Js7n+CQ56/eQW/60dIQhm1aLfqEE
	 YROHTgGuIIAfhZwnTMY52mgyEAKeumoohklC5oSdqDitQ1FVw7WetuViX/qfEeTu3u
	 tQ5Earm3s8bLH2FugMNbPZRLkL00SOEPLGL2/0v68KdUncbbsHM4ur/BVt4PqGTQdB
	 IPTYOJzhVowopW6F8KLrUGypAgFgsYqm3lVVx5xpvF2GSfqpDn/gcFpTHnp0N8USvZ
	 T/zFGUm4Rc82isPMxeNB8Rx7qMHuFGpR1q5fA7IVEVWDXvvQkkBCBzMTuVgl90zcmg
	 cnkgYN1u2z1Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92E5D80E8B;
	Tue, 22 Sep 2026 16:53:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BD469CD
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DA6540768
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cv4quPXSmgEE for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 16:53:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 457EE40763
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790096021;
 b=S8dzBRTeAFMHkS/XTg4ukVfjJu8lVu3FSQUiF/Cjm4AWCuYIV3wabc24yHm2l7ovVy0k
 aK/lJOfok3Ri8uzUY9HkAXOxmrQxKRxqRiLS3/Uwt9oOZmXiGVe6fvvCmBGbsUK7b5wo0
 msGxCnoPvQsZjoe5AnOr6ADvQfebOLcn13IBVZxzSLmhy7C3CyLlx0Y5h1aboAw5HnsLl
 hvtkVklkbeLK3exzsyEaCAFp6nMt3AFhRZMqPOPPJaOtb5GBXBM0SDeEevX1zUzFVs2Jd
 lmRSRdbkoRTm5HfGraX0WWlXGCSQrupWNybULZsSJuwyD29UV8RlK+wrIbw3C34Nw1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790096021;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=h7jzsdWeOgng6aFH+JYchR1IJpV0zweze4r0YbYgroc=;
 b=LTjjX21mIHYe4GbickJrDyuxE0p0tYfR7Xpk4Lbf4LU7qpAMCuY83BCHaX2ckYiKNRqM
 wCqVIZXsv/ezXDYoXidRV6xIaId4MXGAQZ2WuSnmw1aydTYL9WGeG6dfabBdSObR9r2C0
 5qaYAwuG6+wWfWzllBmnMzyaUjyHND3LcfZKW8jiYc+d1Q24BRI+MlZYH07QW8Y9kXXnb
 IPrDWRN0hdZ02nNldt5fXf/LAsihv2ND67jGGMaKTyJbiyx3qQe3eEeDKBYa90E6TFmfO
 kwbp5p6ZjW4r7J1HFKBbLpzL2OozyQLbS+poDzT/YRLme7xYU0p3At2+n2aAWWw6fcA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 457EE40763
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:53:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D197497692; Tue, 22 Sep 2026 16:52:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 18:52:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 309ea703677fe3067ab80b690fd03e45ce4db31d
X-Git-Newrev: 7eede98528473729916483aa5f7e3955433fa893
X-Patchwork-Hint: ignore
Message-Id: <20260922165231.D197497692@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kbd: fix static build with uClibc
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7eede98528473729916483aa5f7e3955433fa893
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
