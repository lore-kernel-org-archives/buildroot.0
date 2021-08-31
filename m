Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A42C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 08:40:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9733F6023E
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 08:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9733F6023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61A9360A57;
	Tue, 31 Aug 2021 08:40:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id queIlZ1px2aa; Tue, 31 Aug 2021 08:40:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E97EC60BB9;
	Tue, 31 Aug 2021 08:40:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBFB81BF82B
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 08:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D81AE80E2A
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 08:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i_2-bIbtKwkR for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 08:40:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 132DE80E27
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 08:40:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 14EEA87D69; Tue, 31 Aug 2021 08:39:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 31 Aug 2021 10:39:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8a1d969b91b99ab2bf74ecb41402d21fee59b25
X-Git-Newrev: 2962697039c72583d1e57e2b61b6281896f5b761
X-Patchwork-Hint: ignore
Message-Id: <20210831083912.14EEA87D69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-pam: find libxcrypt through
 pkg-config
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2962697039c72583d1e57e2b61b6281896f5b761
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Find libxcryt through pkg-config to avoid the following build failure:

/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: .libs/passverify.o: in function `.L30':
passverify.c:(.text+0x368): undefined reference to `crypt_checksalt'

Fixes:
 - http://autobuild.buildroot.org/results/20b14e222b35c2d1269960075832b784ba81aa1a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
