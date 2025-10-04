Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3140CAC5B0
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 13:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B43182386;
	Sat,  4 Oct 2025 13:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5S51iczsHFn; Sat,  4 Oct 2025 13:26:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7107482404
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7107482404;
	Sat,  4 Oct 2025 13:26:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24F6A226
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 13:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1352E60ACE
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 13:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6C1iI3Ey47LB for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 13:26:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8472660ACD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8472660ACD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8472660ACD
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 13:26:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A5603A4C5D64
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 15:26:43 +0200 (CEST)
Received: from [192.168.1.144] (port=51534 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v52Hb-000000005zg-0pL9
 for buildroot@buildroot.org; Sat, 04 Oct 2025 13:26:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  4 Oct 2025 15:26:43 +0200
Message-ID: <20251004132643.2356456-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759584403;
 bh=1JAPC6fAoBV/FNlBsN8FTVflba21QidOqijQNF+QW5A=;
 h=From:To:Subject:Date:From;
 b=SwgXCKLWh225HIyPI4n895A2MkX2fsbyXzuYLGO+mZGBy48fPN/ihuZ2G/HqRrdFo
 kcfkprBEVG2bdSS40q5Y2XFigdZR+6IXWRAwgt0XOwmSRal4Rlxve86xjhvEEuACwE
 rp9sexUi+8GprMLJqrw3K0WDN5L6dC0iwzroH2H07/oP4sVEhuozu/++WPStFE8kaC
 Kwckka7FiEIF6QHL91YR7u4n0WTXLYw96ItExf5gTwsBVGQcdGhyboDVXV9OXfFuhw
 tfbvhmyteZmfNcT+V8IHzO7VXo8X4AQt7lMeH8DqXmvTbQYXj4tyyYb+kX7VbBD0rc
 oMwl1UFPTykwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=SwgXCKLW
Subject: [Buildroot] [PATCH 1/1] package/libtheora: bump version to 1.2.0
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

Release notes:
https://xiph.org/press/2025/theora-release-1.2/
https://gitlab.xiph.org/xiph/theora/-/blob/v1.2.0/CHANGES?ref_type=tags

Removed patch 0001 which is not needed anymore due to upstream commit:
https://gitlab.xiph.org/xiph/theora/-/commit/14045376ee6897f20f6bb9815f246172da748e50

Removed patch 0002 which is included in this release.

Updated license hash due to upstream commit:
https://gitlab.xiph.org/xiph/theora/-/commit/b68e2e53b30365f52204521d00b5db3d1cc439d5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 .../libtheora/0001-link-libtheoradec.patch    | 21 ---------
 package/libtheora/0002-fix-autoreconf.patch   | 46 -------------------
 package/libtheora/libtheora.hash              |  4 +-
 package/libtheora/libtheora.mk                |  2 +-
 5 files changed, 3 insertions(+), 71 deletions(-)
 delete mode 100644 package/libtheora/0001-link-libtheoradec.patch
 delete mode 100644 package/libtheora/0002-fix-autoreconf.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 69877d1778..82ac385c9b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -634,7 +634,6 @@ package/libsvg/0001-fix-expat-static-declaration.patch lib_patch.Upstream
 package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch lib_patch.Upstream
 package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch lib_patch.Upstream
 package/libtelnet/0001-fix-compilation-without-zlib.patch lib_patch.Upstream
-package/libtheora/0001-link-libtheoradec.patch lib_patch.Upstream
 package/libtomcrypt/0001-fix-CVE-2019-17362.patch lib_patch.Upstream
 package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch lib_patch.Upstream
 package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch lib_patch.Upstream
diff --git a/package/libtheora/0001-link-libtheoradec.patch b/package/libtheora/0001-link-libtheoradec.patch
deleted file mode 100644
index c38d32bbbc..0000000000
--- a/package/libtheora/0001-link-libtheoradec.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-libtheoraenc.so needs to be linked to libtheoradec.so in order to avoid
-
-symbol 'th_comment_query_count': can't resolve symbol in lib '/usr/lib/libtheoraenc.so.1'
-
-when starting Freeswitch.
-
-Patch downloaded from
-http://www.sisyphus.ru/en/srpm/Sisyphus/libtheora/patches/0
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
---- libtheora/lib/Makefile.am
-+++ libtheora/lib/Makefile.am
-@@ -153,6 +153,7 @@ libtheoraenc_la_SOURCES = \
- libtheoraenc_la_LDFLAGS = \
-   -version-info @THENC_LIB_CURRENT@:@THENC_LIB_REVISION@:@THENC_LIB_AGE@ \
-   @THEORAENC_LDFLAGS@ $(OGG_LIBS)
-+libtheoraenc_la_LIBADD = libtheoradec.la
- 
- libtheora_la_SOURCES = \
- 	$(decoder_sources) \
diff --git a/package/libtheora/0002-fix-autoreconf.patch b/package/libtheora/0002-fix-autoreconf.patch
deleted file mode 100644
index 27fc379ad4..0000000000
--- a/package/libtheora/0002-fix-autoreconf.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Fix broken autoreconf
-
-Upstream: https://git.xiph.org/?p=theora.git;a=commitdiff;h=28cc6dbd9b2a141df94f60993256a5fca368fa54
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-
-
-From: Tim Terriberry <tterribe@xiph.org>
-Date: Fri, 20 May 2011 20:41:50 +0000 (+0000)
-Subject: Make autoreconf -i -f work.
-X-Git-Url: https://git.xiph.org/?p=theora.git;a=commitdiff_plain;h=28cc6dbd9b2a141df94f60993256a5fca368fa54
-
-Make autoreconf -i -f work.
-
-Patch from David Schleef.
-
-svn path=/trunk/theora/; revision=17990
----
-
-diff --git a/Makefile.am b/Makefile.am
-index 89fd753..1783857 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2,5 +2,7 @@
- AUTOMAKE_OPTIONS = foreign 1.6 dist-zip dist-bzip2
- 
-+ACLOCAL_AMFLAGS=-I m4
-+
- if THEORA_ENABLE_EXAMPLES
- EXAMPLES_DIR = examples
- else
-diff --git a/configure.ac b/configure.ac
-index 1cbec1a..456b603 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -61,7 +61,7 @@ AC_LIBTOOL_WIN32_DLL
- AM_PROG_LIBTOOL
- 
- dnl Add parameters for aclocal
--AC_SUBST(ACLOCAL_AMFLAGS, "-I m4")
-+AC_CONFIG_MACRO_DIR([m4])
- 
- dnl Check for doxygen
- AC_CHECK_PROG(HAVE_DOXYGEN, doxygen, true, false)
diff --git a/package/libtheora/libtheora.hash b/package/libtheora/libtheora.hash
index 42ffa05045..c2d0ea002e 100644
--- a/package/libtheora/libtheora.hash
+++ b/package/libtheora/libtheora.hash
@@ -1,6 +1,6 @@
 # From http://downloads.xiph.org/releases/theora/SHA256SUMS
-sha256  f36da409947aa2b3dcc6af0a8c2e3144bc19db2ed547d64e9171c59c66561c61  libtheora-1.1.1.tar.xz
+sha256  ebdf77a8f5c0a8f7a9e42323844fa09502b34eb1d1fece7b5f54da41fe2122ec  libtheora-1.2.0.tar.xz
 
 # Locally calculated
 sha256  8417fad7da775735564e209484a2e011e0fa201e94f01fdbee6e4977e478e6fc  COPYING
-sha256  654a0238f789f4435c4818f50005b141d013c5a09a31d861efc1d0d67ba975a4  LICENSE
+sha256  2c902950c73a63cd285dc0c36573de9c5fefe66d49312949c51d941f33e92932  LICENSE
diff --git a/package/libtheora/libtheora.mk b/package/libtheora/libtheora.mk
index f408e6cce6..289217e0a9 100644
--- a/package/libtheora/libtheora.mk
+++ b/package/libtheora/libtheora.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTHEORA_VERSION = 1.1.1
+LIBTHEORA_VERSION = 1.2.0
 LIBTHEORA_SOURCE = libtheora-$(LIBTHEORA_VERSION).tar.xz
 LIBTHEORA_SITE = http://downloads.xiph.org/releases/theora
 LIBTHEORA_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
