Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9717CC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:38:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40B8460232
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40B8460232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19B5F606F3;
	Tue,  7 Sep 2021 06:38:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5F2AD5x3K6Sx; Tue,  7 Sep 2021 06:38:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E698600C5;
	Tue,  7 Sep 2021 06:38:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA4571BF2A5
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A29B40624
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Px-WgKtUb5X for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 06:38:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8896F40604
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 06:38:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 764498878A; Tue,  7 Sep 2021 06:36:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Sep 2021 08:34:56 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 7743eab6bdf723845fb197ccae2133a5ac7474e0
X-Git-Newrev: ab962d86a7af602e470e81a194eb18e60bae7dc8
X-Patchwork-Hint: ignore
Message-Id: <20210907063638.764498878A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/linux-pam: find
 libxcrypt through pkg-config
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ab962d86a7af602e470e81a194eb18e60bae7dc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Find libxcryt through pkg-config to avoid the following build failure:

/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: .libs/passverify.o: in function `.L30':
passverify.c:(.text+0x368): undefined reference to `crypt_checksalt'

Fixes:
 - http://autobuild.buildroot.org/results/20b14e222b35c2d1269960075832b784ba81aa1a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2962697039c72583d1e57e2b61b6281896f5b761)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-also-search-libcrypt-through-pkg-config.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch b/package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch
new file mode 100644
index 0000000000..09b86902bb
--- /dev/null
+++ b/package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch
@@ -0,0 +1,55 @@
+From 49e3ffcbe267691dfbf24c91417aa296e7412146 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 29 Aug 2021 21:15:57 +0200
+Subject: [PATCH] configure.ac: also search libcrypt through pkg-config
+
+libxcrypt provides a libcrypt.pc file so use it if available as this
+will allow to retrieve the library path (e.g.
+-L/home/buildroot/output/host//riscv64-buildroot-linux-musl/sysroot/usr/lib)
+which is useful when cross-compiling and will avoid the following build
+failure on buildroot:
+
+/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: .libs/passverify.o: in function `.L30':
+passverify.c:(.text+0x368): undefined reference to `crypt_checksalt'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/20b14e222b35c2d1269960075832b784ba81aa1a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/linux-pam/linux-pam/commit/49e3ffcbe267691dfbf24c91417aa296e7412146]
+---
+ configure.ac | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d464884c..c06bc7dd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -363,8 +363,14 @@ AC_CHECK_HEADERS(crypt.h)
+ 
+ BACKUP_LIBS=$LIBS
+ LIBCRYPT=""
+-AC_SEARCH_LIBS([crypt_gensalt_rn],[crypt])
+-case "$ac_cv_search_crypt_gensalt_rn" in
++PKG_CHECK_MODULES([CRYPT], [libcrypt], [
++  CFLAGS="$CFLAGS $CRYPT_CFLAGS"
++  CPPFLAGS="$CPPFLAGS $CRYPT_CFLAGS"
++  LIBS="$LIBS $CRYPT_LIBS"
++  LIBCRYPT="$CRYPT_LIBS"
++], [
++  AC_SEARCH_LIBS([crypt_gensalt_rn],[crypt])
++  case "$ac_cv_search_crypt_gensalt_rn" in
+ 	-l*) LIBCRYPT="$ac_cv_search_crypt_gensalt_rn" ;;
+ 	no) AC_SEARCH_LIBS([crypt_r],[crypt])
+ 		case "$ac_cv_search_crypt_r" in
+@@ -374,7 +380,8 @@ case "$ac_cv_search_crypt_gensalt_rn" in
+ 			-l*) LIBCRYPT="$ac_cv_search_crypt" ;;
+ 		esac ;;
+ 	esac ;;
+-esac
++  esac
++])
+ AC_CHECK_FUNCS([crypt_r])
+ LIBS=$BACKUP_LIBS
+ AC_SUBST(LIBCRYPT)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
