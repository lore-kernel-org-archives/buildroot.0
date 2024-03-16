Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FA9C54E68
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5822C4171C;
	Sat, 16 Mar 2024 22:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gv8oh1lWDzjJ; Sat, 16 Mar 2024 22:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4FA74098E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4FA74098E;
	Sat, 16 Mar 2024 22:01:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FD8D1BF83A
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACB6F818C4
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSYHqSSLhJrx for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:00:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82C92817AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82C92817AF
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:00:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36AAB883CF; Sat, 16 Mar 2024 22:00:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 22:08:51 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 3bdf1310e5566ac6fa3d5a0434370e30c18b376a
X-Git-Newrev: d0f6d3b0a62f0af52f53294e0fbb47be16b3136e
X-Patchwork-Hint: ignore
Message-Id: <20240316220050.36AAB883CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/rsync: fix
 openssl static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0f6d3b0a62f0af52f53294e0fbb47be16b3136e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix the following openssl static build raised since commit
80fa5672da85a110e60be0d2143e85f9e08a0f4a:

/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/12.3.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/lib/../lib64/libcrypto.a(libcrypto-lib-c_zlib.o): in function `zlib_oneshot_expand_block':
c_zlib.c:(.text+0xaec): undefined reference to `uncompress'

Commit b9a062b354953f3fbfee702bb5b5007598299925 can also be reverted as
pkg-config will also retrieve -latomic to avoid the following build
failure:

/home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-1/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(threads_pthread.o): in function `CRYPTO_atomic_add':
threads_pthread.c:(.text+0x208): undefined reference to `__atomic_is_lock_free'

RSYNC_POST_CONFIGURE_HOOKS must be added to call reconfigure and avoid
the following build failure after autoreconf:

autoconf -o configure.sh
autoheader && touch config.h.in
configure.sh has CHANGED.
config.h.in is unchanged.
You may need to run:
  make reconfigure

Fixes:
 - http://autobuild.buildroot.org/results/6c1636f7556e7370a4c9f6d02c63cf3e20dc985c
 - http://autobuild.buildroot.org/results/49abbaa1eab94b248bff434b40728065d687e278

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e889a1c9e983753dd0fa5062d3b9475a8cba6072)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...TX_copy-in-crypto-lib-instead-of-MD5_Init.patch | 28 +++++++++++++
 ...c-use-pkg-config-to-retrieve-openssl-depe.patch | 48 ++++++++++++++++++++++
 package/rsync/rsync.mk                             | 12 ++++--
 3 files changed, 84 insertions(+), 4 deletions(-)

diff --git a/package/rsync/0001-Check-for-EVP_MD_CTX_copy-in-crypto-lib-instead-of-MD5_Init.patch b/package/rsync/0001-Check-for-EVP_MD_CTX_copy-in-crypto-lib-instead-of-MD5_Init.patch
new file mode 100644
index 0000000000..5381159968
--- /dev/null
+++ b/package/rsync/0001-Check-for-EVP_MD_CTX_copy-in-crypto-lib-instead-of-MD5_Init.patch
@@ -0,0 +1,28 @@
+From 556a2c5bc2f6244f140a96302d4df92cfc25af8b Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayne@opencoder.net>
+Date: Tue, 25 Oct 2022 21:55:53 -0700
+Subject: [PATCH] Check for EVP_MD_CTX_copy in crypto lib instead of MD5_Init.
+
+Upstream: https://github.com/WayneD/rsync/commit/556a2c5bc2f6244f140a96302d4df92cfc25af8b
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a2c99558..ccad7f13 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -432,10 +432,10 @@ AH_TEMPLATE([USE_OPENSSL],
+ if test x"$enable_openssl" != x"no"; then
+     if test x"$ac_cv_header_openssl_md4_h" = x"yes" && test x"$ac_cv_header_openssl_md5_h" = x"yes"; then
+       AC_MSG_RESULT(yes)
+-      AC_SEARCH_LIBS(MD5_Init, crypto,
++      AC_SEARCH_LIBS(EVP_MD_CTX_copy, crypto,
+           [AC_DEFINE(USE_OPENSSL)
+ 	   enable_openssl=yes],
+-          [err_msg="$err_msg$nl- Failed to find MD5_Init function in openssl crypto lib.";
++          [err_msg="$err_msg$nl- Failed to find EVP_MD_CTX_copy function in openssl crypto lib.";
+ 	   no_lib="$no_lib openssl"])
+     else
+         AC_MSG_RESULT(no)
diff --git a/package/rsync/0002-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch b/package/rsync/0002-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch
new file mode 100644
index 0000000000..61fe4b0269
--- /dev/null
+++ b/package/rsync/0002-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch
@@ -0,0 +1,48 @@
+From 93865bad4c00e7d3c867965663fdb9a1a0448db8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 1 Jan 2023 16:53:23 +0100
+Subject: [PATCH] configure.ac: use pkg-config to retrieve openssl dependencies
+
+Use pkg-config to retrieve openssl dependencies such as -latomic and
+avoids the following build failure when building statically on
+architectures such as sparc:
+
+/home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-1/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(threads_pthread.o): in function `CRYPTO_atomic_add':
+threads_pthread.c:(.text+0x208): undefined reference to `__atomic_is_lock_free'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/49abbaa1eab94b248bff434b40728065d687e278
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/WayneD/rsync/pull/426
+---
+ configure.ac | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ccad7f13..b9591866 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -432,11 +432,15 @@ AH_TEMPLATE([USE_OPENSSL],
+ if test x"$enable_openssl" != x"no"; then
+     if test x"$ac_cv_header_openssl_md4_h" = x"yes" && test x"$ac_cv_header_openssl_md5_h" = x"yes"; then
+       AC_MSG_RESULT(yes)
+-      AC_SEARCH_LIBS(EVP_MD_CTX_copy, crypto,
++      PKG_CHECK_MODULES(LIBCRYPTO, libcrypto,
+           [AC_DEFINE(USE_OPENSSL)
+-	   enable_openssl=yes],
+-          [err_msg="$err_msg$nl- Failed to find EVP_MD_CTX_copy function in openssl crypto lib.";
+-	   no_lib="$no_lib openssl"])
++           enable_openssl=yes
++           LIBS="$LIBS $LIBCRYPTO_LIBS"],
++          [AC_SEARCH_LIBS(EVP_MD_CTX_copy, crypto,
++              [AC_DEFINE(USE_OPENSSL)
++	       enable_openssl=yes],
++              [err_msg="$err_msg$nl- Failed to find EVP_MD_CTX_copy function in openssl crypto lib.";
++	       no_lib="$no_lib openssl"])])
+     else
+         AC_MSG_RESULT(no)
+ 	err_msg="$err_msg$nl- Failed to find openssl/md4.h and openssl/md5.h for openssl crypto lib support."
+-- 
+2.35.1
+
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 3fd2ef257e..b9d392c8cb 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -10,7 +10,9 @@ RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
 RSYNC_CPE_ID_VENDOR = samba
 RSYNC_SELINUX_MODULES = rsync
-RSYNC_DEPENDENCIES = zlib popt
+# We're patching configure.ac
+RSYNC_AUTORECONF = YES
+RSYNC_DEPENDENCIES = host-pkgconf zlib popt
 # We know that our C library is modern enough for C99 vsnprintf(). Since
 # configure can't detect this, we tell configure that vsnprintf() is safe.
 RSYNC_CONF_ENV = rsync_cv_HAVE_C99_VSNPRINTF=yes
@@ -20,9 +22,11 @@ RSYNC_CONF_OPTS = \
 	--disable-roll-simd \
 	--disable-md5-asm
 
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-RSYNC_CONF_ENV += LIBS=-latomic
-endif
+# reconfigure must be run after autoreconf
+define RSYNC_RUN_RECONFIGURE
+	cd $(@D) && PATH=$(BR_PATH) make reconfigure
+endef
+RSYNC_POST_CONFIGURE_HOOKS += RSYNC_RUN_RECONFIGURE
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 RSYNC_DEPENDENCIES += acl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
