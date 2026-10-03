Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163B8CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 11:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C14F412F6;
	Sat,  3 Oct 2026 11:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spELcYGpTHml; Sat,  3 Oct 2026 11:35:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 48E99412F8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791027357;
	b=n7t07m9OuhdlIN1fTuN5WJT04SxiuPvEb+Urd/aGDgVxxw3UssCJsMe41WemifO5pUJH
	 7WtX5m0Kqy20VbJKeOAHcE/X9srg0deok1KPkH07ya+T0f4hNP/KcRYJSb8AR1ienU+zF
	 KMzY99smqeIr54UeKPhkJdX2fWUHaXZjIhjDseCI0BJs2UdySDctqxVGpNEMPfP4ShWm+
	 Fch7+v5/LEQnDyz8At7VoBwyFXJLHzMe0InXWjOJMsdFpa1M5dz+awB2ese+LxbEX6o2H
	 1MffxY9AQ+Qjfu3c00Fh1mN71yelvANUZVm2GrPANKakafQecg5ZupRvfpmoE+KSC7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791027357;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=D2W400hz4NLV5j0714YLCy7q1Q0dhmg2ub/IUIIHeFM=;
	b=nNC1RZAyk0RviaRVwm9grcxmtFMsbbB4vmluZylIDGDE2u7LI9if3GiC6vyaYCSm/Pb/
	 ByxtY6PvhF092ZeMH5Xu1yykDyXzkwZzNT5zXqd8hUxo6Lw+7RsP7XeMnctezSreDts77
	 WYtzEA4xGZQES8A6myY5fEFZZEEy+hc/a8zw3FE9ojQBiTRgh7gnG8eD8mzUDgUo8GnqH
	 o2mfLGQIDLX4Z+byPfcxga9NjugDPiaYqQjD9SPe/xgxrmjmWGgtcAGfDCatgRsIEuvte
	 luFyS2B4R802ufif3zmTDgtrcupSpwsTH3gzjZB/cVjV8TcSUicfnEGfGWrSItVJI7A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791027357;
	bh=D2W400hz4NLV5j0714YLCy7q1Q0dhmg2ub/IUIIHeFM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ave3IDl6+DO1tfHE5kTQvb91V+nNfCSindH9tPRHTVwKX6ciW4CEkBmSbkNbLXLb4
	 PsFrcHagCohoQb5G6hLpfx6tABOCRONyFrNbWwzqRxxslaajeX0gF21yeAgZSEFZNb
	 DgeduqABvd2xhNAFQBK7wA4eSKv+nhYEI5IX+WZKNJmORaww1rBfsgwaaMmD7+ASLQ
	 6YfUkf+1iHKA3zIAKqJnKiAvfz6ygwU1MVMxbhcyKysdFCzj67/kj76vLt6F/K5PWd
	 nGEfrh0dy2nuRN2NR+yuZBch4oOFt0RgeN3KyV6en1dLZIijNrY6p7GmBnyGFBsM1T
	 5juP3isPrmeaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48E99412F8;
	Sat,  3 Oct 2026 11:35:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D69334E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 139E3412EF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewMcKUbOyoBi for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 11:35:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0DBC2412F8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791027355;
 b=dSRir+L0uPW3yaS6WdKI8iW7RGXfXovZpOTWc+djKp8oSNSmKl/SYGhK+fOA38o+B/BM
 Q4rlE9FpclD0D6hGa2c9Rq5o6nSm/NQV0z4LQjV7reIi06Hqkya/mtpaV1m9ZwzLETTGt
 bGuYp1/kjDWgchjudRViMKO/3yz2ZU2UpkZv/dXCPJcbyF6844sCdMdfTA3x0SjHRdqCl
 QfreTTlMXxygmLpe2cJOkN5OzAv+wn/VSTzqjZ95sGnWCIcVZTQO+7HNArHB7WA5iWi+g
 ucsH4xnW8XOQTV4FxQeJiaO6YYON28LXJRzEuahHaKfHGpJc1Ey917G9mUByTut14kA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791027355;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=hvWQfM6ZVfXKcu7uRqkmwwyhPNM5cV6FUgNsbFM9X04=;
 b=TxtZSA4ZlifDw3iyMVtO+STdfIfoRiIwaUuO3J3Wde0GEm+HR0RFJAe8cNq0192WwqyD
 YZniBIZvDSPhCrcxsCvzxsy/heu+tDYo2nZfQNzt/PwVrPbxBD+2YAVddB6yMdN5pwGzE
 u6esjJvu3fTZRg8TvxXMICY/Q2CVzt662Zkf7sLjppjRy4b8eqcXRzOVXRe+xCQv7Sato
 cf3l1GYSI9fm3hWLR96pdp8wJXi3O9cUmxXsL9yCyWjSxEccrFgf6wu5iJdfnc6uCzwy8
 UPRJBi6LsPehRVnDDWA4Y7swbO3GHK/FrFrdNbF0Xif9aY6V39ktVg3OOJQ6ZpBlIHQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DBC2412F8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:35:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DB2989096; Sat,  3 Oct 2026 11:34:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 13:04:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e72d189aa0921622ff1c708ccd451aa9831fa56f
X-Git-Newrev: cd6814e779a02024dad86f19da9b4e70d8d91227
X-Patchwork-Hint: ignore
Message-Id: <20261003113440.5DB2989096@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kbd: bump to version 2.10.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd6814e779a02024dad86f19da9b4e70d8d91227
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

remove one upstream patch

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 ...equire-dlopen-and-memfd_create-for-libra.patch} | 48 ++++++++++++++++------
 package/kbd/0001-libkbdfile-fix-zlib-build.patch   | 35 ----------------
 package/kbd/kbd.hash                               |  2 +-
 package/kbd/kbd.mk                                 |  4 +-
 4 files changed, 39 insertions(+), 50 deletions(-)

diff --git a/package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch b/package/kbd/0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
similarity index 77%
rename from package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
rename to package/kbd/0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
index 3c83146d75..38733d337d 100644
--- a/package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
+++ b/package/kbd/0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
@@ -21,17 +21,20 @@ Signed-off-by: Alexey Gladkov <legion@kernel.org>
 Upstream: https://github.com/legionus/kbd/commit/6ff3161c1e5d448920d412a269716cf42be155b5
 [Fiona: backport to 2.9.0]
 Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+[Francois: backport to 2.10.0]
+Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
 ---
- configure.ac               | 19 ++++++++++++-------
- src/libkbdfile/Makefile.am |  9 +++++++--
- src/libkbdfile/elf-note.c  |  3 +++
- 3 files changed, 22 insertions(+), 9 deletions(-)
+ configure.ac                 | 19 ++++++++++++-------
+ src/libkbdfile/Makefile.am   |  9 +++++++--
+ src/libkbdfile/elf-note.c    |  3 +++
+ tests/libkbdfile/Makefile.am |  5 ++++-
+ 4 files changed, 26 insertions(+), 10 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 05cecab..0691167 100644
+index ffd67fe..e1a78f3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -81,7 +81,7 @@ AC_FUNC_STAT
+@@ -85,7 +85,7 @@ AC_FUNC_STAT
  AC_FUNC_MALLOC
  AC_FUNC_REALLOC
  AC_FUNC_STRERROR_R
@@ -40,7 +43,7 @@ index 05cecab..0691167 100644
  		strdup strndup strchr strrchr strspn strstr strtol])
  
  AC_SEARCH_LIBS([timer_create], [rt])
-@@ -263,13 +263,18 @@ AS_IF([test "$VLOCK_PROG" = "yes"], [
+@@ -267,13 +267,18 @@ AS_IF([test "$VLOCK_PROG" = "yes"], [
  ])
  AM_CONDITIONAL(VLOCK, test "$VLOCK_PROG" = "yes")
  
@@ -60,7 +63,7 @@ index 05cecab..0691167 100644
  	[PKG_CHECK_MODULES(ZLIB, zlib, [HAVE_ZLIB=yes], [HAVE_ZLIB=no])],
  	[HAVE_ZLIB=no]
  )
-@@ -284,11 +289,11 @@ AC_ARG_WITH([bzip2],
+@@ -288,11 +293,11 @@ AC_ARG_WITH([bzip2],
  	[],
  	[: m4_divert_text([DEFAULTS], [with_bzip2=yes])]
  )
@@ -75,7 +78,7 @@ index 05cecab..0691167 100644
  	AC_CHECK_LIB(bz2, BZ2_bzDecompressInit, [
  		HAVE_BZIP2=yes
  		BZIP2_LIBS=-lbz2
-@@ -306,7 +311,7 @@ AC_ARG_WITH([lzma],
+@@ -310,7 +315,7 @@ AC_ARG_WITH([lzma],
  	[],
  	[: m4_divert_text([DEFAULTS], [with_lzma=yes])]
  )
@@ -84,7 +87,7 @@ index 05cecab..0691167 100644
  	[PKG_CHECK_MODULES(LZMA, liblzma, [HAVE_LZMA=yes], [HAVE_LZMA=no])],
  	[HAVE_LZMA=no]
  )
-@@ -321,7 +326,7 @@ AC_ARG_WITH([zstd],
+@@ -325,7 +330,7 @@ AC_ARG_WITH([zstd],
  	[],
  	[: m4_divert_text([DEFAULTS], [with_zstd=yes])]
  )
@@ -94,7 +97,7 @@ index 05cecab..0691167 100644
  	[HAVE_ZSTD=no]
  )
 diff --git a/src/libkbdfile/Makefile.am b/src/libkbdfile/Makefile.am
-index 2511064..ebdb28d 100644
+index ea7aaf2..d301ca6 100644
 --- a/src/libkbdfile/Makefile.am
 +++ b/src/libkbdfile/Makefile.am
 @@ -10,14 +10,17 @@ headers = \
@@ -107,7 +110,7 @@ index 2511064..ebdb28d 100644
  	kbdfile.c
  
  libkbdfile_la_LIBADD =
- libkbdfile_la_CFLAGS =
+ libkbdfile_la_CFLAGS = $(AM_CFLAGS)
  
 +if USE_ELFNOTE
 +libkbdfile_la_SOURCES += \
@@ -141,6 +144,27 @@ index 842be9d..bc4a684 100644
  
  #include "elf-note.h"
  
+diff --git a/tests/libkbdfile/Makefile.am b/tests/libkbdfile/Makefile.am
+index cf31f3f..0b1f516 100644
+--- a/tests/libkbdfile/Makefile.am
++++ b/tests/libkbdfile/Makefile.am
+@@ -22,12 +22,15 @@ noinst_PROGRAMS = \
+ 	libkbdfile-test02 \
+ 	libkbdfile-test03 \
+ 	libkbdfile-test14 \
+-	libkbdfile-test16 \
+ 	$(NULL)
+ 
++if USE_ELFNOTE
++noinst_PROGRAMS += libkbdfile-test16
++
+ libkbdfile_test16_SOURCES = \
+ 	libkbdfile-test16.c \
+ 	$(top_srcdir)/src/libkbdfile/elf-note.c
++endif
+ 
+ libkbdfile_test16_LDADD = \
+ 	$(top_builddir)/src/libcommon/libcommon.a \
 -- 
 2.55.0
 
diff --git a/package/kbd/0001-libkbdfile-fix-zlib-build.patch b/package/kbd/0001-libkbdfile-fix-zlib-build.patch
deleted file mode 100644
index 1324d0b53e..0000000000
--- a/package/kbd/0001-libkbdfile-fix-zlib-build.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 488872421ef38215d2797f78497eb559d8eec32a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@users.noreply.github.com>
-Date: Fri, 5 Dec 2025 16:45:36 +0100
-Subject: [PATCH] libkbdfile: fix zlib build
-
-Upstream: https://github.com/legionus/kbd/commit/2f9a4e56c2ef245fbe840677aad9d5932e17f50d
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/libkbdfile/elf-note.h | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/src/libkbdfile/elf-note.h b/src/libkbdfile/elf-note.h
-index a0fd9e2..d3b8d5c 100644
---- a/src/libkbdfile/elf-note.h
-+++ b/src/libkbdfile/elf-note.h
-@@ -26,14 +26,11 @@ int dlsym_many(void **dlp, const char *filename, ...);
-  */
- #define DLSYM_ARG(symbol__) &sym_##symbol__, STRINGIFY(symbol__),
- 
--/* For symbols being dynamically loaded */
--#define DECLARE_DLSYM(symbol) static typeof(symbol) *sym_##symbol
--
- /*
-  * Helper defines, to be done locally before including this header to switch between
-  * implementations
-  */
--#define DECLARE_SYM(sym__) DECLARE_DLSYM(sym__);
-+#define DECLARE_SYM(sym__) static typeof(sym__) *sym_##sym__;
- 
- /*
-  * Originally from systemd codebase.
--- 
-2.47.3
-
diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
index d46a60a80c..83b45b0e89 100644
--- a/package/kbd/kbd.hash
+++ b/package/kbd/kbd.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
-sha256  fb3197f17a99eb44d22a3a1a71f755f9622dd963e66acfdea1a45120951b02ed  kbd-2.9.0.tar.xz
+sha256  6e5ca4f8d76ee9e3a8db700b667f13e12aac9933828a64e1aaad93d26be9b479  kbd-2.10.0.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5a16340fe773f422144b436df90319114a2884933c56e9be6fad642e59be5e1f  CREDITS
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 6e34a45bae..12e638200e 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KBD_VERSION = 2.9.0
+KBD_VERSION = 2.10.0
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 KBD_CONF_OPTS = \
@@ -14,7 +14,7 @@ KBD_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf
 
-# 0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
+# 0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
 # modifies configure.ac and src/libkbdfile/Makefile.am
 KBD_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
