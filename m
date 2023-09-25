Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396E1CE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 11:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAE1261144;
	Mon, 25 Sep 2023 11:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAE1261144
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0GR_sFwB0-AM; Mon, 25 Sep 2023 11:49:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE76B61089;
	Mon, 25 Sep 2023 11:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE76B61089
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E4EB1BF947
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 347A340293
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 347A340293
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8S0GdVTMUluG for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 11:48:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3F0D40272
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 11:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3F0D40272
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9325B87727; Mon, 25 Sep 2023 11:48:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 09:40:13 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 2d9540e248ff07eb372a220a4d3b6720b9ac7e13
X-Git-Newrev: 48b0011c67ff941ada8c33d886308e677a8f3961
X-Patchwork-Hint: ignore
Message-Id: <20230925114822.9325B87727@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/netatalk:
 security bump to version 3.1.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=48b0011c67ff941ada8c33d886308e677a8f3961
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

- Drop patches (already in version) and so autoreconf
- Update COPYING hash (gpl mailing address updated with
  https://github.com/Netatalk/netatalk/commit/9bd45cc06e02e9bbfe8156bb1e5e2843b7727a51
  https://github.com/Netatalk/netatalk/commit/6a5997fbd64d6cd5a5400ea6a0a930d005ed89df)
- Fix CVE-2022-43634: This vulnerability allows remote attackers to
  execute arbitrary code on affected installations of Netatalk.
  Authentication is not required to exploit this vulnerability. The
  specific flaw exists within the dsi_writeinit function. The issue
  results from the lack of proper validation of the length of
  user-supplied data prior to copying it to a fixed-length heap-based
  buffer. An attacker can leverage this vulnerability to execute code in
  the context of root. Was ZDI-CAN-17646.
- Fix CVE-2022-45188: Netatalk through 3.1.13 has an afp_getappl
  heap-based buffer overflow resulting in code execution via a crafted
  .appl file. This provides remote root access on some platforms such as
  FreeBSD (used for TrueNAS).
- Fix CVE-2023-42464: Validate data type in dalloc_value_for_key()

https://github.com/Netatalk/netatalk/blob/netatalk-3-1-17/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d170cde0272401fd79b0bd100b72da25b2a13e5c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  2 -
 ...setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch | 48 ----------------------
 ...enssl_compat.h-fix-build-with-libressl-2..patch | 43 -------------------
 package/netatalk/netatalk.hash                     | 10 ++---
 package/netatalk/netatalk.mk                       |  8 ++--
 5 files changed, 8 insertions(+), 103 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0249db3233..a315f37e27 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1032,8 +1032,6 @@ package/neard/S53neard Indent Shellcheck Variables
 package/neardal/0001-lib-neardal.h-fix-build-with-gcc-10.patch Upstream
 package/neon/0001-Revert-Advertise-TS_SSL-feature-with-OpenSSL-1.1.0.patch Upstream
 package/neon/0002-configure.ac-fix-autoreconf.patch Upstream
-package/netatalk/0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch Upstream
-package/netatalk/0002-etc-uams-openssl_compat.h-fix-build-with-libressl-2..patch Upstream
 package/netatalk/S50netatalk EmptyLastLine Indent Variables
 package/netcat/0001-signed-bit-counting.patch Sob Upstream
 package/netopeer2/S52netopeer2 Shellcheck Variables
diff --git a/package/netatalk/0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch b/package/netatalk/0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
deleted file mode 100644
index 01d5776596..0000000000
--- a/package/netatalk/0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 60d100713b5289948e9cdf5b0646ff3cdd2c206b Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Mon, 17 Dec 2012 22:32:44 +0100
-Subject: [PATCH] Fix setting of LD_LIBRARY_FLAGS ($shlibpath_var).
-
-LD_LIBRARY_PATH should not be set when cross-compiling, because it
-adds the cross-libraries to the build's LD-path.
-
-Also the restoring of LD_LIBRARY_PATH was done incorrectly: it would
-set LD_LIBRARY_PATH=LD_LIBRARY_PATH.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- macros/db3-check.m4 |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/macros/db3-check.m4 b/macros/db3-check.m4
-index 902220b..d5a5446 100644
---- a/macros/db3-check.m4
-+++ b/macros/db3-check.m4
-@@ -94,7 +94,7 @@ if test "x$bdb_required" = "xyes"; then
-     savedldflags="$LDFLAGS"
-     savedcppflags="$CPPFLAGS"
-     savedlibs="$LIBS"
--    saved_shlibpath_var=$shlibpath_var
-+    eval saved_shlibpath_var=\$$shlibpath_var
- 
-     dnl required BDB version: 4.6, because of cursor API change
-     DB_MAJOR_REQ=4
-@@ -148,7 +148,7 @@ if test "x$bdb_required" = "xyes"; then
-                         dnl -- LD_LIBRARY_PATH on many platforms. This will be fairly
-                         dnl -- portable hopefully. Reference:
-                         dnl -- http://lists.gnu.org/archive/html/autoconf/2009-03/msg00040.html
--                        eval export $shlibpath_var=$bdblibdir
-+                        test "$cross_compiling" = yes || eval export $shlibpath_var=$bdblibdir
-                         NETATALK_BDB_TRY_LINK
-                         eval export $shlibpath_var=$saved_shlibpath_var
- 
-@@ -171,7 +171,7 @@ if test "x$bdb_required" = "xyes"; then
-                            CPPFLAGS="-I${bdbdir}/include${subdir} $CPPFLAGS"
-                            LDFLAGS="-L$bdblibdir $LDFLAGS"
- 
--                           eval export $shlibpath_var=$bdblibdir
-+                           test "$cross_compiling" = yes || eval export $shlibpath_var=$bdblibdir
-                            NETATALK_BDB_TRY_LINK
-                            eval export $shlibpath_var=$saved_shlibpath_var
- 
--- 
diff --git a/package/netatalk/0002-etc-uams-openssl_compat.h-fix-build-with-libressl-2..patch b/package/netatalk/0002-etc-uams-openssl_compat.h-fix-build-with-libressl-2..patch
deleted file mode 100644
index 05913862f6..0000000000
--- a/package/netatalk/0002-etc-uams-openssl_compat.h-fix-build-with-libressl-2..patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 58ddc137021a938f37c3794305a839f8df449d3f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 5 Apr 2022 23:59:15 +0200
-Subject: [PATCH] etc/uams/openssl_compat.h: fix build with libressl >= 2.7.0
-
-Fix the following build failure with libressl >= 2.7.0 which added
-DH_set0_pqg with
-https://github.com/libressl-portable/openbsd/commit/848e2a019c796b685fc8c5848283b86e48fbe0bf:
-
-In file included from uams_dhx_passwd.c:35:
-openssl_compat.h:15:19: error: static declaration of 'DH_set0_pqg' follows non-static declaration
-   15 | inline static int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
-      |                   ^~~~~~~~~~~
-In file included from uams_dhx_passwd.c:33:
-/home/autobuild/autobuild/instance-2/output-1/host/mips64-buildroot-linux-uclibc/sysroot/usr/include/openssl/dh.h:195:5: note: previous declaration of 'DH_set0_pqg' was here
-  195 | int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g);
-      |     ^~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/fc6e308f346570f8198542602bc8c1bdd0a4869e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
----
- etc/uams/openssl_compat.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/etc/uams/openssl_compat.h b/etc/uams/openssl_compat.h
-index ded377bc..5cc8de34 100644
---- a/etc/uams/openssl_compat.h
-+++ b/etc/uams/openssl_compat.h
-@@ -11,7 +11,7 @@ http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
- #ifndef OPENSSL_COMPAT_H
- #define OPENSSL_COMPAT_H
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000L)
- inline static int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
- {
-    /* If the fields p and g in d are NULL, the corresponding input
--- 
-2.35.1
-
diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
index 6dead5457c..a35e6bc36c 100644
--- a/package/netatalk/netatalk.hash
+++ b/package/netatalk/netatalk.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.13/
-md5  697421623c32ee0ab9c8076191766e5f  netatalk-3.1.13.tar.bz2
-sha1  16dd7fa84962a44b36b795b8c44393e728785947  netatalk-3.1.13.tar.bz2
+# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.17/
+md5  a6429a28948f85b69c9012fb437dd9c2  netatalk-3.1.17.tar.xz
+sha1  bc6578d9fa874b3816fd4ddd60a30a8f3aadc71d  netatalk-3.1.17.tar.xz
 # Locally computed
-sha256  89ada6bcfe1b39ad94f58c236654d1d944f2645c3e7de98b3374e0bd37d5e05d  netatalk-3.1.13.tar.bz2
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  8c208e2c94bf3047db33cdbc3ce4325d2b80db61d6cc527f18f9dbd8e95b5cff  netatalk-3.1.17.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  7599ae145e53be03a08f8b558b2f2e0c828e1630f1843cc04f41981b8cefcd65  COPYRIGHT
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 7cc950beb6..a47bfa7e84 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.1.13
-NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
-NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
-# For 0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
-NETATALK_AUTORECONF = YES
+NETATALK_VERSION = 3.1.17
+NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk-$(subst .,-,$(NETATALK_VERSION))
+NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.xz
 NETATALK_CONFIG_SCRIPTS = netatalk-config
 NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error \
 	libevent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
