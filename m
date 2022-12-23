Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30681C4332F
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 15:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B2D88213E;
	Fri, 23 Dec 2022 15:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B2D88213E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aMhZm5koK9Qs; Fri, 23 Dec 2022 15:42:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F6CF82140;
	Fri, 23 Dec 2022 15:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F6CF82140
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2C9B1BF5E6
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 15:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA9814015F
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 15:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA9814015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qYg7oLXWYNTD for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 15:42:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 308BA4011D
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 308BA4011D
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 15:42:11 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id l10so1503665wrv.7
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 07:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l2lTnWS4aWdClB7/g7m51h8ORnMyW4Rv+i9S9KSGrv8=;
 b=Tp3OdOfdOBUcd/0NTUozZFluiZCvQA38Exw3Ie2vs70pLmQbiJ/u7R+sSMecRbfbQ4
 hUSwllFb8Xw4B/lSxUxA0o6+gCOmI/z61zl5wAP5iM3XH/Q8/XscIdiOBS6AKi9GiVCI
 7GDAkc8S/l5vRJ/E7t0JL3CTPGjIr/O7rVzK4qbYq5pv8xvAXkMWrjqV87bD6PnZluGb
 +EFVdtD8on+K/q7M6uBsTXq0pHcVMWhIwwErO6HJcU0W9LhEvKSP0EKDdTtYpEiJTKVY
 x6b9o24E7ABuzvaiX5+iGA7reoCUssPG4/rA9Y1hHpEgjbxg3hQ6nomCrzhKmENQOjtS
 vw9w==
X-Gm-Message-State: AFqh2ko4w269XGEII15lHrlrnI8MWKGyJco+6GTndsRzY7HFvmrcxOEg
 gOdwF0ERER1GnNaSh3+pJBZIYxAswGE=
X-Google-Smtp-Source: AMrXdXsqq2MUsvaQwjzSaEF5fCLSR6x8INT5Flaw7auj5nn84fDmDXT8sAzcE4g0arLM0l5Hn8i7FA==
X-Received: by 2002:adf:d4c7:0:b0:25d:6628:debc with SMTP id
 w7-20020adfd4c7000000b0025d6628debcmr6701199wrk.10.1671810128857; 
 Fri, 23 Dec 2022 07:42:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 x10-20020a5d490a000000b00242710c9910sm3389601wrq.8.2022.12.23.07.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 07:42:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 16:42:04 +0100
Message-Id: <20221223154204.306897-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l2lTnWS4aWdClB7/g7m51h8ORnMyW4Rv+i9S9KSGrv8=;
 b=pXgb8JEK8zeuxr103h38x9p8zHztIjQWKLPHvwD8FrhKrw33Y5+iZ4mCIM6rZ3U87L
 DtgYd/bAu6Jj/RnKoDqoRmGJHl8zbqrN5kgeRx4ZxzIO7V5wAUnbBu9ZdaAM1ffHIrSc
 rzgAIybJp7917h4NKHIDrBCUQGyspdDNBMiBH3a0qxx+OFCtPGB2YCBLd0auMjZhczoW
 lo5rip2mzBFvVhKhC2m4o0cQz7n6WXiY2KbeguLOG4BDm8s2TdVYyc6njCp721UrUb40
 flak7+BuEqAyosrh2H4li9PkAsGnjTTRCQAfNo0U13LShMFq4OM3Bc3cgep0HZj4H8dK
 LVrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pXgb8JEK
Subject: [Buildroot] [PATCH 1/1] package/memcached: bump to version 1.6.17
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Refresh second patch
- Drop fourth patch (already in version)

https://github.com/memcached/memcached/wiki/ReleaseNotes1617

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../memcached/0002-check-for-sys-auxv.h.patch |  10 +-
 ...c-use-pkg-config-to-retrieve-openssl.patch | 181 ------------------
 package/memcached/memcached.hash              |   6 +-
 package/memcached/memcached.mk                |   2 +-
 4 files changed, 9 insertions(+), 190 deletions(-)
 delete mode 100644 package/memcached/0004-configure-ac-use-pkg-config-to-retrieve-openssl.patch

diff --git a/package/memcached/0002-check-for-sys-auxv.h.patch b/package/memcached/0002-check-for-sys-auxv.h.patch
index 8c41bb4f01..a7d0dfdd00 100644
--- a/package/memcached/0002-check-for-sys-auxv.h.patch
+++ b/package/memcached/0002-check-for-sys-auxv.h.patch
@@ -37,14 +37,14 @@ index 26df879..05e61ff 100644
 --- a/crc32c.c
 +++ b/crc32c.c
 @@ -273,7 +273,7 @@ void crc32c_init(void) {
-     }
  }
  
--#elif defined(__aarch64__) && defined(__linux__)
-+#elif defined(__aarch64__) && defined(__linux__) && defined(HAVE_SYS_AUX_H)
+ #elif defined(__aarch64__) && (defined(__linux__) || defined(__APPLE__))
+-#if defined(__linux__)
++#if defined(__linux__) && defined(HAVE_SYS_AUX_H)
  #include <sys/auxv.h>
- 
- #if defined(HWCAP_CRC32)
+ #elif defined(__APPLE__)
+ #include <sys/sysctl.h>
 -- 
 2.35.1
 
diff --git a/package/memcached/0004-configure-ac-use-pkg-config-to-retrieve-openssl.patch b/package/memcached/0004-configure-ac-use-pkg-config-to-retrieve-openssl.patch
deleted file mode 100644
index 402fa03b3b..0000000000
--- a/package/memcached/0004-configure-ac-use-pkg-config-to-retrieve-openssl.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-From 656dedad48c81541060448d008b90290196263c5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 6 Sep 2020 23:38:19 +0200
-Subject: [PATCH] configure.ac: use pkg-config to retrieve openssl
-
-Use pkg-config to retrieve openssl dependencies such as -latomic or -lz
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/memcached/memcached/commit/656dedad48c81541060448d008b90290196263c5]
----
- README.md    |   2 +-
- configure.ac | 133 ++++++++++++++++++++++++++-------------------------
- 2 files changed, 69 insertions(+), 66 deletions(-)
-
-diff --git a/README.md b/README.md
-index 3ce1bc2156..8fe067b767 100644
---- a/README.md
-+++ b/README.md
-@@ -21,7 +21,7 @@ list to ask questions, github issues aren't seen by everyone!
- * libseccomp (optional, experimental, linux) - enables process restrictions for
-   better security. Tested only on x86-64 architectures.
- * openssl (optional) - enables TLS support. need relatively up to date
--  version.
-+  version. pkg-config is needed to find openssl dependencies (such as -lz).
- 
- ## Environment
- 
-diff --git a/configure.ac b/configure.ac
-index a0851f2131..2959a86c89 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -437,80 +437,83 @@ AC_ARG_WITH(libssl,
- dnl ----------------------------------------------------------------------------
- dnl libssl detection.  swiped from libevent.  modified for openssl detection.
- 
-+PKG_PROG_PKG_CONFIG
- OPENSSL_URL=https://www.openssl.org/
- if test "x$enable_tls" = "xyes"; then
--  AC_CACHE_CHECK([for libssl directory], ac_cv_libssl_dir, [
--    saved_LIBS="$LIBS"
--    saved_LDFLAGS="$LDFLAGS"
--    saved_CPPFLAGS="$CPPFLAGS"
--    le_found=no
--    for ledir in $trylibssldir "" $prefix /usr/local ; do
-+  PKG_CHECK_MODULES(OPENSSL, openssl, [LIBS="$LIBS $OPENSSL_LIBS" CFLAGS="$CFLAGS $OPENSSL_CFLAGS"], [
-+    AC_CACHE_CHECK([for libssl directory], ac_cv_libssl_dir, [
-+      saved_LIBS="$LIBS"
-+      saved_LDFLAGS="$LDFLAGS"
-+      saved_CPPFLAGS="$CPPFLAGS"
-+      le_found=no
-+      for ledir in $trylibssldir "" $prefix /usr/local ; do
-+        LDFLAGS="$saved_LDFLAGS"
-+        LIBS="-lssl -lcrypto $saved_LIBS"
-+
-+        # Skip the directory if it isn't there.
-+        if test ! -z "$ledir" -a ! -d "$ledir" ; then
-+          continue;
-+        fi
-+        if test ! -z "$ledir" ; then
-+          if test -d "$ledir/lib" ; then
-+            LDFLAGS="-L$ledir/lib $LDFLAGS"
-+          else
-+            LDFLAGS="-L$ledir $LDFLAGS"
-+          fi
-+          if test -d "$ledir/include" ; then
-+            CPPFLAGS="-I$ledir/include $CPPFLAGS"
-+          else
-+            CPPFLAGS="-I$ledir $CPPFLAGS"
-+          fi
-+        fi
-+        # Can I compile and link it?
-+        AC_TRY_LINK([#include <sys/time.h>
-+    #include <sys/types.h>
-+    #include <assert.h>
-+    #include <openssl/ssl.h>], [ SSL_CTX* ssl_ctx = SSL_CTX_new(TLS_server_method());
-+                                assert(OPENSSL_VERSION_NUMBER >= 0x10100000L);],
-+           [ libssl_linked=yes ], [ libssl_linked=no ])
-+        if test $libssl_linked = yes; then
-+          if test ! -z "$ledir" ; then
-+            ac_cv_libssl_dir=$ledir
-+            _myos=`echo $target_os | cut -f 1 -d .`
-+            AS_IF(test "$SUNCC" = "yes" -o "x$_myos" = "xsolaris2",
-+                  [saved_LDFLAGS="$saved_LDFLAGS -Wl,-R$ledir/lib"],
-+                  [AS_IF(test "$GCC" = "yes",
-+                        [saved_LDFLAGS="$saved_LDFLAGS -Wl,-rpath,$ledir/lib"])])
-+           else
-+             ac_cv_libssl_dir="(system)"
-+           fi
-+           le_found=yes
-+           break
-+        fi
-+      done
-+      LIBS="$saved_LIBS"
-       LDFLAGS="$saved_LDFLAGS"
--      LIBS="-lssl -lcrypto $saved_LIBS"
-+      CPPFLAGS="$saved_CPPFLAGS"
-+      if test $le_found = no ; then
-+        AC_MSG_ERROR([libssl (at least version 1.1.0) is required.  You can get it from $OPENSSL_URL
- 
--      # Skip the directory if it isn't there.
--      if test ! -z "$ledir" -a ! -d "$ledir" ; then
--         continue;
-+          If it's already installed, specify its path using --with-libssl=/dir/
-+    ])
-       fi
--      if test ! -z "$ledir" ; then
--        if test -d "$ledir/lib" ; then
--          LDFLAGS="-L$ledir/lib $LDFLAGS"
--        else
--          LDFLAGS="-L$ledir $LDFLAGS"
--        fi
--        if test -d "$ledir/include" ; then
--          CPPFLAGS="-I$ledir/include $CPPFLAGS"
--        else
--          CPPFLAGS="-I$ledir $CPPFLAGS"
--        fi
-+    ])
-+    LIBS="-lssl -lcrypto $LIBS"
-+    if test $ac_cv_libssl_dir != "(system)"; then
-+      if test -d "$ac_cv_libssl_dir/lib" ; then
-+        LDFLAGS="-L$ac_cv_libssl_dir/lib $LDFLAGS"
-+        le_libdir="$ac_cv_libssl_dir/lib"
-+      else
-+        LDFLAGS="-L$ac_cv_libssl_dir $LDFLAGS"
-+        le_libdir="$ac_cv_libssl_dir"
-       fi
--      # Can I compile and link it?
--      AC_TRY_LINK([#include <sys/time.h>
--  #include <sys/types.h>
--  #include <assert.h>
--  #include <openssl/ssl.h>], [ SSL_CTX* ssl_ctx = SSL_CTX_new(TLS_server_method());
--                              assert(OPENSSL_VERSION_NUMBER >= 0x10100000L);],
--         [ libssl_linked=yes ], [ libssl_linked=no ])
--      if test $libssl_linked = yes; then
--         if test ! -z "$ledir" ; then
--           ac_cv_libssl_dir=$ledir
--           _myos=`echo $target_os | cut -f 1 -d .`
--           AS_IF(test "$SUNCC" = "yes" -o "x$_myos" = "xsolaris2",
--                 [saved_LDFLAGS="$saved_LDFLAGS -Wl,-R$ledir/lib"],
--                 [AS_IF(test "$GCC" = "yes",
--                       [saved_LDFLAGS="$saved_LDFLAGS -Wl,-rpath,$ledir/lib"])])
--         else
--           ac_cv_libssl_dir="(system)"
--         fi
--         le_found=yes
--         break
-+      if test -d "$ac_cv_libssl_dir/include" ; then
-+        CPPFLAGS="-I$ac_cv_libssl_dir/include $CPPFLAGS"
-+      else
-+        CPPFLAGS="-I$ac_cv_libssl_dir $CPPFLAGS"
-       fi
--    done
--    LIBS="$saved_LIBS"
--    LDFLAGS="$saved_LDFLAGS"
--    CPPFLAGS="$saved_CPPFLAGS"
--    if test $le_found = no ; then
--      AC_MSG_ERROR([libssl (at least version 1.1.0) is required.  You can get it from $OPENSSL_URL
--
--        If it's already installed, specify its path using --with-libssl=/dir/
--  ])
-     fi
-   ])
--  LIBS="-lssl -lcrypto $LIBS"
--  if test $ac_cv_libssl_dir != "(system)"; then
--    if test -d "$ac_cv_libssl_dir/lib" ; then
--      LDFLAGS="-L$ac_cv_libssl_dir/lib $LDFLAGS"
--      le_libdir="$ac_cv_libssl_dir/lib"
--    else
--      LDFLAGS="-L$ac_cv_libssl_dir $LDFLAGS"
--      le_libdir="$ac_cv_libssl_dir"
--    fi
--    if test -d "$ac_cv_libssl_dir/include" ; then
--      CPPFLAGS="-I$ac_cv_libssl_dir/include $CPPFLAGS"
--    else
--      CPPFLAGS="-I$ac_cv_libssl_dir $CPPFLAGS"
--    fi
--  fi
- fi
- 
- if test "x$enable_static" = "xyes"; then
diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 3bdd1e5e33..78875dde66 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.16.tar.gz.sha1
-sha1  724f31c3462fb6b07264d72d0043fd65545fd84a  memcached-1.6.16.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.17.tar.gz.sha1
+sha1  e25639473e15f1bd9516b915fb7e03ab8209030f  memcached-1.6.17.tar.gz
 
 # Locally computed
-sha256  3051a93bf1dd0c3af2d0e589ff6ef6511f876385a35b18e9ff8741e4a1ab34da  memcached-1.6.16.tar.gz
+sha256  2055e373613d8fc21529aff9f0adce3e23b9ce01ba0478d30e7941d9f2bd1224  memcached-1.6.17.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 7b4069e820..7183da6c14 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.16
+MEMCACHED_VERSION = 1.6.17
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
