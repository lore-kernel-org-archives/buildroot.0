Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E49AC32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 07:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C0B642418;
	Sun, 18 Sep 2022 07:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C0B642418
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mfG22QBRXcLe; Sun, 18 Sep 2022 07:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3AA34240D;
	Sun, 18 Sep 2022 07:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3AA34240D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 642051BF484
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 07:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 402488443F
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 07:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 402488443F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYyP0ZGA_23F for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 07:00:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26FBF8443E
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 07:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26FBF8443E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14F2E846FF; Sun, 18 Sep 2022 07:00:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 08:49:37 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 91786c875d53fbbe549d474451a1f462261cf47b
X-Git-Newrev: 9feb6425ff22d5417a28fc31cd04aedadd67c24a
X-Patchwork-Hint: ignore
Message-Id: <20220918070055.14F2E846FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/memcached: add
 openssl optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=9feb6425ff22d5417a28fc31cd04aedadd67c24a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

openssl is an optional dependency since version 1.5.13 and
https://github.com/memcached/memcached/commit/ee1cfe3bf9384d1a93545fc942e25bed6437d910
which must be handled through pkg-config to avoid static build failure

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit c72795e3d6d321de82b888a24962061dd5c30353)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ure-ac-use-pkg-config-to-retrieve-openssl.patch | 181 +++++++++++++++++++++
 package/memcached/memcached.mk                     |   7 +
 2 files changed, 188 insertions(+)

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
index 842c0b42fa..1fcb8c2afa 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
