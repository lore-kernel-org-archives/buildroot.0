Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75384C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48D6D832EA;
	Fri, 13 May 2022 22:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dignj88LL1P3; Fri, 13 May 2022 22:12:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D4EF82F13;
	Fri, 13 May 2022 22:12:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0252B1BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F309281D5C
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lzg_l4msL0ss for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 395F081A3B
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F0A7885E29; Fri, 13 May 2022 22:00:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1f7af938cb51139b43a6ca640dc16eb04b46d98
X-Git-Newrev: 1195486b5828f734424554e62784e0e2d0f776dd
X-Patchwork-Hint: ignore
Message-Id: <20220513220044.F0A7885E29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkcs11-helper: fix build with
 libressl >= 3.5.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1195486b5828f734424554e62784e0e2d0f776dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

pkcs11h-openssl.c: In function 'DSA_meth_set1_name':
pkcs11h-openssl.c:239:41: error: invalid use of incomplete typedef 'DSA_METHOD' {aka 'struct dsa_method'}
  239 |  rv = _pkcs11h_mem_strdup ((void *)&meth->name, name);
      |                                         ^~

Fixes:
 - http://autobuild.buildroot.org/results/9b0d3bf7d97696c7be6de1724daaba196626b865

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...sl-3-5-0-does-not-have-DSA_meth_set1_name.patch | 69 ++++++++++++++++++++++
 package/pkcs11-helper/pkcs11-helper.mk             |  2 +
 2 files changed, 71 insertions(+)

diff --git a/package/pkcs11-helper/0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch b/package/pkcs11-helper/0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
new file mode 100644
index 0000000000..21ce66ae79
--- /dev/null
+++ b/package/pkcs11-helper/0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
@@ -0,0 +1,69 @@
+From 17d10b0dfb2b56a047db307687640adcd560e199 Mon Sep 17 00:00:00 2001
+From: Alon Bar-Lev <alon.barlev@gmail.com>
+Date: Mon, 2 May 2022 21:26:58 +0300
+Subject: [PATCH] openssl: libressl-3.5.0 does not have DSA_meth_set1_name
+
+while it does not expose the DSA_METHOD structure.
+
+[Retrieved (and updated to remove ChangeLog update) from:
+https://github.com/OpenSC/pkcs11-helper/commit/17d10b0dfb2b56a047db307687640adcd560e199]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ChangeLog             |  1 +
+ configure.ac          | 16 ++++++++++++++++
+ lib/pkcs11h-openssl.c |  4 ++++
+ 3 files changed, 21 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 716bb8d8..57697a3b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -300,7 +300,9 @@ if test "${have_openssl}" = "no"; then
+ fi
+ 
+ if test "${have_openssl}" = "yes"; then
++	old_CFLAGS="${CFLAGS}"
+ 	old_LIBS="${LIBS}"
++	CFLAGS="${CFLAGS} ${OPENSSL_CFLAGS}"
+ 	LIBS="${LIBS} ${OPENSSL_LIBS}"
+ 	AC_CHECK_FUNCS([ \
+ 		RSA_meth_dup RSA_meth_free \
+@@ -344,6 +346,20 @@ if test "${have_openssl}" = "yes"; then
+ 	)
+ 	AC_MSG_CHECKING([for OpenSSL ec support])
+ 	AC_MSG_RESULT([${openssl_ec}])
++	# https://github.com/OpenSC/pkcs11-helper/pull/55
++	AC_COMPILE_IFELSE(
++		[AC_LANG_PROGRAM(
++			[[#include <openssl/dsa.h>]],
++			[[
++				int foo() {
++					DSA_METHOD *meth = NULL;
++					sizeof(meth->name);
++				}
++			]]
++		)],
++		[AC_DEFINE([HAVE_DSA_METHOD_NAME], [1], [Have DSA_METHOD->name])]
++	)
++	CFLAGS="${old_CFLAGS}"
+ 	LIBS="${old_LIBS}"
+ fi
+ 
+diff --git a/lib/pkcs11h-openssl.c b/lib/pkcs11h-openssl.c
+index 961c955c..38ee8e2d 100644
+--- a/lib/pkcs11h-openssl.c
++++ b/lib/pkcs11h-openssl.c
+@@ -235,9 +235,13 @@ DSA_meth_free (DSA_METHOD *meth)
+ static int
+ DSA_meth_set1_name (DSA_METHOD *meth, const char *name)
+ {
++#ifdef HAVE_DSA_METHOD_NAME
+ 	CK_RV rv;
+ 	rv = _pkcs11h_mem_strdup ((void *)&meth->name, name);
+ 	return rv == CKR_OK ? 1 : 0;
++#else
++	return 0;
++#endif
+ }
+ #endif
+ 
diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index 4fc3e21e5a..f8fe54ecf5 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -11,6 +11,8 @@ PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
 PKCS11_HELPER_LICENSE_FILES = COPYING COPYING.BSD COPYING.GPL
 PKCS11_HELPER_DEPENDENCIES = host-pkgconf
 PKCS11_HELPER_INSTALL_STAGING = YES
+# We're patching configure.ac
+PKCS11_HELPER_AUTORECONF = YES
 
 PKCS11_HELPER_CONF_OPTS = \
 	--disable-crypto-engine-polarssl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
