Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5D6ECAAD5
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 21:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B28260E7C;
	Sun, 28 Aug 2022 21:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B28260E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSBX1qEQQeO3; Sun, 28 Aug 2022 21:55:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B45C60B4C;
	Sun, 28 Aug 2022 21:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B45C60B4C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 273731BF3F4
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 21:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 022CD60B4C
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 21:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 022CD60B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30-eWJCaGzOG for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 21:55:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CADC60B35
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CADC60B35
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 21:55:27 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 k18-20020a05600c0b5200b003a5dab49d0bso3529256wmr.3
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 14:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Gt32KxLpD6X6rmdhKyRrQhg29HoCZGGp5ufInYNYS78=;
 b=Yy8hNtrht7Hnqo31x/+5r+C2pJcrcJuMDEHJlTheb97p5naqJOoqiZJwd/md1+ZNzu
 pkj+hNrqXtOxTKwf5iB6wgmhJF/mCVSWX3yxoA5DlPB8cRWCP4z16fFoQWt3990ZWSRk
 26xREDjCHT1ICGov/eg5miLVuCWN8SbauBCHb0NfICZ+zjZrmCWeY6zdhxn06l27fOlo
 UsEGJRt6lf63k53FU9kSr9Kn5ueOmpadvZAYgy8Z676w2wvxs+kcAbPQ+xNSoOhTpMBg
 kB6OcrELnKonMvWKZBhEETmg1V1LAtGAqM8OoR5thAdfZBNLC6DQtrONwHqsFeOnzzY9
 Rw4Q==
X-Gm-Message-State: ACgBeo3L2Aq/LEIA2EV2uCypLTwdvg8sJDAy4JLH/pDbFk9/kw6/LjL2
 vWwbyVIuts50naTB1X++rBw6J9zgb90=
X-Google-Smtp-Source: AA6agR5zenKAIp8F4TcpyYudyHqDmEDw2AUZ5ECF5DEXLETVFknI50MMEe6BXIxk95tug05EmfZ82Q==
X-Received: by 2002:a05:600c:42c3:b0:3a6:431:91bf with SMTP id
 j3-20020a05600c42c300b003a6043191bfmr4995090wme.188.1661723725184; 
 Sun, 28 Aug 2022 14:55:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 d18-20020a05600c34d200b003a5c75bd36fsm7159925wmq.10.2022.08.28.14.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 14:55:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 23:55:18 +0200
Message-Id: <20220828215518.6512-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Gt32KxLpD6X6rmdhKyRrQhg29HoCZGGp5ufInYNYS78=;
 b=PakQ7FLBFV9gDDQL2OiUCpNlnLx6MaGKC/eQ/1T3M8a+BXGLwLML4wyO17lmE1I9dh
 FC98/p0BVRZEGKf/ZRalkhhBRZ7J//dYGq2OyeQX/rcMLFqJ4bjEQD+ZK+QqGOw2EaPv
 6tajzA4lz7BzadowcF9fCLkxKrokJ9kj4tyb8W+eZzlBJ7LmxGP61+X1hSTwaxqOihbL
 6Qu4TOzG9pXyCFQPBr6ukdwT/c5zJUWkKHmkL1sk83ffLpBnNtkYkLkdY4ABphqG15lm
 acIuSfOua40cXm88Taovv/codIbpT0WZl7nbTlDDZNpnmRykrXqfnMaIcumfILknwaYB
 Wi6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PakQ7FLB
Subject: [Buildroot] [PATCH 1/1] package/memcached: add openssl optional
 dependency
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

openssl is an optional dependency since version 1.5.13 and
https://github.com/memcached/memcached/commit/ee1cfe3bf9384d1a93545fc942e25bed6437d910
which must be handled through pkg-config to avoid static build failure

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...c-use-pkg-config-to-retrieve-openssl.patch | 181 ++++++++++++++++++
 package/memcached/memcached.mk                |   7 +
 2 files changed, 188 insertions(+)
 create mode 100644 package/memcached/0004-configure-ac-use-pkg-config-to-retrieve-openssl.patch

diff --git a/package/memcached/0004-configure-ac-use-pkg-config-to-retrieve-openssl.patch b/package/memcached/0004-configure-ac-use-pkg-config-to-retrieve-openssl.patch
new file mode 100644
index 0000000000..402fa03b3b
--- /dev/null
+++ b/package/memcached/0004-configure-ac-use-pkg-config-to-retrieve-openssl.patch
@@ -0,0 +1,181 @@
+From 656dedad48c81541060448d008b90290196263c5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 6 Sep 2020 23:38:19 +0200
+Subject: [PATCH] configure.ac: use pkg-config to retrieve openssl
+
+Use pkg-config to retrieve openssl dependencies such as -latomic or -lz
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/memcached/memcached/commit/656dedad48c81541060448d008b90290196263c5]
+---
+ README.md    |   2 +-
+ configure.ac | 133 ++++++++++++++++++++++++++-------------------------
+ 2 files changed, 69 insertions(+), 66 deletions(-)
+
+diff --git a/README.md b/README.md
+index 3ce1bc2156..8fe067b767 100644
+--- a/README.md
++++ b/README.md
+@@ -21,7 +21,7 @@ list to ask questions, github issues aren't seen by everyone!
+ * libseccomp (optional, experimental, linux) - enables process restrictions for
+   better security. Tested only on x86-64 architectures.
+ * openssl (optional) - enables TLS support. need relatively up to date
+-  version.
++  version. pkg-config is needed to find openssl dependencies (such as -lz).
+ 
+ ## Environment
+ 
+diff --git a/configure.ac b/configure.ac
+index a0851f2131..2959a86c89 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -437,80 +437,83 @@ AC_ARG_WITH(libssl,
+ dnl ----------------------------------------------------------------------------
+ dnl libssl detection.  swiped from libevent.  modified for openssl detection.
+ 
++PKG_PROG_PKG_CONFIG
+ OPENSSL_URL=https://www.openssl.org/
+ if test "x$enable_tls" = "xyes"; then
+-  AC_CACHE_CHECK([for libssl directory], ac_cv_libssl_dir, [
+-    saved_LIBS="$LIBS"
+-    saved_LDFLAGS="$LDFLAGS"
+-    saved_CPPFLAGS="$CPPFLAGS"
+-    le_found=no
+-    for ledir in $trylibssldir "" $prefix /usr/local ; do
++  PKG_CHECK_MODULES(OPENSSL, openssl, [LIBS="$LIBS $OPENSSL_LIBS" CFLAGS="$CFLAGS $OPENSSL_CFLAGS"], [
++    AC_CACHE_CHECK([for libssl directory], ac_cv_libssl_dir, [
++      saved_LIBS="$LIBS"
++      saved_LDFLAGS="$LDFLAGS"
++      saved_CPPFLAGS="$CPPFLAGS"
++      le_found=no
++      for ledir in $trylibssldir "" $prefix /usr/local ; do
++        LDFLAGS="$saved_LDFLAGS"
++        LIBS="-lssl -lcrypto $saved_LIBS"
++
++        # Skip the directory if it isn't there.
++        if test ! -z "$ledir" -a ! -d "$ledir" ; then
++          continue;
++        fi
++        if test ! -z "$ledir" ; then
++          if test -d "$ledir/lib" ; then
++            LDFLAGS="-L$ledir/lib $LDFLAGS"
++          else
++            LDFLAGS="-L$ledir $LDFLAGS"
++          fi
++          if test -d "$ledir/include" ; then
++            CPPFLAGS="-I$ledir/include $CPPFLAGS"
++          else
++            CPPFLAGS="-I$ledir $CPPFLAGS"
++          fi
++        fi
++        # Can I compile and link it?
++        AC_TRY_LINK([#include <sys/time.h>
++    #include <sys/types.h>
++    #include <assert.h>
++    #include <openssl/ssl.h>], [ SSL_CTX* ssl_ctx = SSL_CTX_new(TLS_server_method());
++                                assert(OPENSSL_VERSION_NUMBER >= 0x10100000L);],
++           [ libssl_linked=yes ], [ libssl_linked=no ])
++        if test $libssl_linked = yes; then
++          if test ! -z "$ledir" ; then
++            ac_cv_libssl_dir=$ledir
++            _myos=`echo $target_os | cut -f 1 -d .`
++            AS_IF(test "$SUNCC" = "yes" -o "x$_myos" = "xsolaris2",
++                  [saved_LDFLAGS="$saved_LDFLAGS -Wl,-R$ledir/lib"],
++                  [AS_IF(test "$GCC" = "yes",
++                        [saved_LDFLAGS="$saved_LDFLAGS -Wl,-rpath,$ledir/lib"])])
++           else
++             ac_cv_libssl_dir="(system)"
++           fi
++           le_found=yes
++           break
++        fi
++      done
++      LIBS="$saved_LIBS"
+       LDFLAGS="$saved_LDFLAGS"
+-      LIBS="-lssl -lcrypto $saved_LIBS"
++      CPPFLAGS="$saved_CPPFLAGS"
++      if test $le_found = no ; then
++        AC_MSG_ERROR([libssl (at least version 1.1.0) is required.  You can get it from $OPENSSL_URL
+ 
+-      # Skip the directory if it isn't there.
+-      if test ! -z "$ledir" -a ! -d "$ledir" ; then
+-         continue;
++          If it's already installed, specify its path using --with-libssl=/dir/
++    ])
+       fi
+-      if test ! -z "$ledir" ; then
+-        if test -d "$ledir/lib" ; then
+-          LDFLAGS="-L$ledir/lib $LDFLAGS"
+-        else
+-          LDFLAGS="-L$ledir $LDFLAGS"
+-        fi
+-        if test -d "$ledir/include" ; then
+-          CPPFLAGS="-I$ledir/include $CPPFLAGS"
+-        else
+-          CPPFLAGS="-I$ledir $CPPFLAGS"
+-        fi
++    ])
++    LIBS="-lssl -lcrypto $LIBS"
++    if test $ac_cv_libssl_dir != "(system)"; then
++      if test -d "$ac_cv_libssl_dir/lib" ; then
++        LDFLAGS="-L$ac_cv_libssl_dir/lib $LDFLAGS"
++        le_libdir="$ac_cv_libssl_dir/lib"
++      else
++        LDFLAGS="-L$ac_cv_libssl_dir $LDFLAGS"
++        le_libdir="$ac_cv_libssl_dir"
+       fi
+-      # Can I compile and link it?
+-      AC_TRY_LINK([#include <sys/time.h>
+-  #include <sys/types.h>
+-  #include <assert.h>
+-  #include <openssl/ssl.h>], [ SSL_CTX* ssl_ctx = SSL_CTX_new(TLS_server_method());
+-                              assert(OPENSSL_VERSION_NUMBER >= 0x10100000L);],
+-         [ libssl_linked=yes ], [ libssl_linked=no ])
+-      if test $libssl_linked = yes; then
+-         if test ! -z "$ledir" ; then
+-           ac_cv_libssl_dir=$ledir
+-           _myos=`echo $target_os | cut -f 1 -d .`
+-           AS_IF(test "$SUNCC" = "yes" -o "x$_myos" = "xsolaris2",
+-                 [saved_LDFLAGS="$saved_LDFLAGS -Wl,-R$ledir/lib"],
+-                 [AS_IF(test "$GCC" = "yes",
+-                       [saved_LDFLAGS="$saved_LDFLAGS -Wl,-rpath,$ledir/lib"])])
+-         else
+-           ac_cv_libssl_dir="(system)"
+-         fi
+-         le_found=yes
+-         break
++      if test -d "$ac_cv_libssl_dir/include" ; then
++        CPPFLAGS="-I$ac_cv_libssl_dir/include $CPPFLAGS"
++      else
++        CPPFLAGS="-I$ac_cv_libssl_dir $CPPFLAGS"
+       fi
+-    done
+-    LIBS="$saved_LIBS"
+-    LDFLAGS="$saved_LDFLAGS"
+-    CPPFLAGS="$saved_CPPFLAGS"
+-    if test $le_found = no ; then
+-      AC_MSG_ERROR([libssl (at least version 1.1.0) is required.  You can get it from $OPENSSL_URL
+-
+-        If it's already installed, specify its path using --with-libssl=/dir/
+-  ])
+     fi
+   ])
+-  LIBS="-lssl -lcrypto $LIBS"
+-  if test $ac_cv_libssl_dir != "(system)"; then
+-    if test -d "$ac_cv_libssl_dir/lib" ; then
+-      LDFLAGS="-L$ac_cv_libssl_dir/lib $LDFLAGS"
+-      le_libdir="$ac_cv_libssl_dir/lib"
+-    else
+-      LDFLAGS="-L$ac_cv_libssl_dir $LDFLAGS"
+-      le_libdir="$ac_cv_libssl_dir"
+-    fi
+-    if test -d "$ac_cv_libssl_dir/include" ; then
+-      CPPFLAGS="-I$ac_cv_libssl_dir/include $CPPFLAGS"
+-    else
+-      CPPFLAGS="-I$ac_cv_libssl_dir $CPPFLAGS"
+-    fi
+-  fi
+ fi
+ 
+ if test "x$enable_static" = "xyes"; then
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index bddb713458..c7d89054bd 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -22,4 +22,11 @@ else
 MEMCACHED_CONF_ENV += ac_cv_c_endian=little
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MEMCACHED_CONF_OPTS += --enable-tls
+MEMCACHED_DEPENDENCIES += host-pkgconf openssl
+else
+MEMCACHED_CONF_OPTS += --disable-tls
+endif
+
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
