Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F57EECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 20:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B087D417FB;
	Tue, 30 Aug 2022 20:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B087D417FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yiGR69iCaS8h; Tue, 30 Aug 2022 20:31:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EBBA417FA;
	Tue, 30 Aug 2022 20:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EBBA417FA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C354C1BF4E6
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 20:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABD27400AF
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 20:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABD27400AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zzNHV3UUS72t for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 20:31:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F0C140BAB
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F0C140BAB
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 20:31:07 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id kk26so24471503ejc.11
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 13:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=7YRLwJXawwqXIfIHkQNPINK2bb8xvU+gS3iDXCZhnj4=;
 b=SF+eqUcBa3CnCUFVBOJNZCFBhcGGNfr4ND06DGVZp87ODiJ0MZz88oi8xZZeo+tUlG
 F/bqDdaI6Bb3kVoE25zWF2hn62obV3AGjJUPwBiwexdcSFGanPNuDOPbfj7EJCZdeTmY
 7yY1yYbLqtnA4TtHe4c+Mx6AgAk6hM1o7jq9p0Z4IC9YCmWJXVbEcr0RpbCFhKxjzzaG
 fH+fhU4bxx52neodpyd5SyILAlLQFIdpAONWkrtN+xPSeKwouGAMBS2PXPHviDLFgpul
 qxqrn2QDXc5AzBaQy4iJ6h8Iwwbbn7PwJ95XD1pBvV1QJAp0yAIBhyuDIo+V5AtpmSuR
 noGw==
X-Gm-Message-State: ACgBeo1Pc4GoNxjoo7X2c3v4GgJfMXmXufrNxm6T2WlnaY1BHDwAmnFN
 eJp45E4uJ3HSuYSFjMJXG1oWnw==
X-Google-Smtp-Source: AA6agR5eHco+F++7ps/jHIESoeK0i7TulIsUia01exYHoJI1fXX2qdVDQJa9wh4uIwInsDf9pYf2Ww==
X-Received: by 2002:a17:906:7307:b0:73c:c9ee:8b5c with SMTP id
 di7-20020a170906730700b0073cc9ee8b5cmr17825374ejc.310.1661891465626; 
 Tue, 30 Aug 2022 13:31:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ku1-20020a170907788100b00738467f743dsm6223043ejc.5.2022.08.30.13.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 13:31:05 -0700 (PDT)
Message-ID: <faaefcb7-09b6-8062-03a4-11e32c558b02@mind.be>
Date: Tue, 30 Aug 2022 22:31:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220828215518.6512-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220828215518.6512-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=7YRLwJXawwqXIfIHkQNPINK2bb8xvU+gS3iDXCZhnj4=;
 b=NuR8H8jNzwG8V5v42KmW/vCGZUIMJYSwAgpCN+bQ4h2mP5hoiQWAw+N82rEnuxF6J3
 c3kmqrO9OZ3oXvLW+zeLbpalx3xVg+CChBZ6sDfYqLyXp89QcGoHL7Fij6XsehuluH4d
 ZbKQI2XdXtQUwwpWkurbpmoweogrQgbZUSFs9itJ4w6CnhhaukW5gua226wOlz76D/w/
 k5/LAQfpb/QZt5tpEEmpPSKV23oms4IGCxSQqMZOIGtag4WJQ6TJLdQIPyR/1QIkd95O
 6wTamlLWY1pC0cJQu7V6+xNUrCi6bicZq99A46K6xLO7NOLEMmptw0cpHMgc/AnEBesk
 MtRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NuR8H8jN
Subject: Re: [Buildroot] [PATCH 1/1] package/memcached: add openssl optional
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/08/2022 23:55, Fabrice Fontaine wrote:
> openssl is an optional dependency since version 1.5.13 and
> https://github.com/memcached/memcached/commit/ee1cfe3bf9384d1a93545fc942e25bed6437d910
> which must be handled through pkg-config to avoid static build failure
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...c-use-pkg-config-to-retrieve-openssl.patch | 181 ++++++++++++++++++
>   package/memcached/memcached.mk                |   7 +
>   2 files changed, 188 insertions(+)
>   create mode 100644 package/memcached/0004-configure-ac-use-pkg-config-to-retrieve-openssl.patch
> 
> diff --git a/package/memcached/0004-configure-ac-use-pkg-config-to-retrieve-openssl.patch b/package/memcached/0004-configure-ac-use-pkg-config-to-retrieve-openssl.patch
> new file mode 100644
> index 0000000000..402fa03b3b
> --- /dev/null
> +++ b/package/memcached/0004-configure-ac-use-pkg-config-to-retrieve-openssl.patch
> @@ -0,0 +1,181 @@
> +From 656dedad48c81541060448d008b90290196263c5 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 6 Sep 2020 23:38:19 +0200
> +Subject: [PATCH] configure.ac: use pkg-config to retrieve openssl
> +
> +Use pkg-config to retrieve openssl dependencies such as -latomic or -lz
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/memcached/memcached/commit/656dedad48c81541060448d008b90290196263c5]
> +---
> + README.md    |   2 +-
> + configure.ac | 133 ++++++++++++++++++++++++++-------------------------
> + 2 files changed, 69 insertions(+), 66 deletions(-)
> +
> +diff --git a/README.md b/README.md
> +index 3ce1bc2156..8fe067b767 100644
> +--- a/README.md
> ++++ b/README.md
> +@@ -21,7 +21,7 @@ list to ask questions, github issues aren't seen by everyone!
> + * libseccomp (optional, experimental, linux) - enables process restrictions for
> +   better security. Tested only on x86-64 architectures.
> + * openssl (optional) - enables TLS support. need relatively up to date
> +-  version.
> ++  version. pkg-config is needed to find openssl dependencies (such as -lz).
> +
> + ## Environment
> +
> +diff --git a/configure.ac b/configure.ac
> +index a0851f2131..2959a86c89 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -437,80 +437,83 @@ AC_ARG_WITH(libssl,
> + dnl ----------------------------------------------------------------------------
> + dnl libssl detection.  swiped from libevent.  modified for openssl detection.
> +
> ++PKG_PROG_PKG_CONFIG
> + OPENSSL_URL=https://www.openssl.org/
> + if test "x$enable_tls" = "xyes"; then
> +-  AC_CACHE_CHECK([for libssl directory], ac_cv_libssl_dir, [
> +-    saved_LIBS="$LIBS"
> +-    saved_LDFLAGS="$LDFLAGS"
> +-    saved_CPPFLAGS="$CPPFLAGS"
> +-    le_found=no
> +-    for ledir in $trylibssldir "" $prefix /usr/local ; do
> ++  PKG_CHECK_MODULES(OPENSSL, openssl, [LIBS="$LIBS $OPENSSL_LIBS" CFLAGS="$CFLAGS $OPENSSL_CFLAGS"], [
> ++    AC_CACHE_CHECK([for libssl directory], ac_cv_libssl_dir, [
> ++      saved_LIBS="$LIBS"
> ++      saved_LDFLAGS="$LDFLAGS"
> ++      saved_CPPFLAGS="$CPPFLAGS"
> ++      le_found=no
> ++      for ledir in $trylibssldir "" $prefix /usr/local ; do
> ++        LDFLAGS="$saved_LDFLAGS"
> ++        LIBS="-lssl -lcrypto $saved_LIBS"
> ++
> ++        # Skip the directory if it isn't there.
> ++        if test ! -z "$ledir" -a ! -d "$ledir" ; then
> ++          continue;
> ++        fi
> ++        if test ! -z "$ledir" ; then
> ++          if test -d "$ledir/lib" ; then
> ++            LDFLAGS="-L$ledir/lib $LDFLAGS"
> ++          else
> ++            LDFLAGS="-L$ledir $LDFLAGS"
> ++          fi
> ++          if test -d "$ledir/include" ; then
> ++            CPPFLAGS="-I$ledir/include $CPPFLAGS"
> ++          else
> ++            CPPFLAGS="-I$ledir $CPPFLAGS"
> ++          fi
> ++        fi
> ++        # Can I compile and link it?
> ++        AC_TRY_LINK([#include <sys/time.h>
> ++    #include <sys/types.h>
> ++    #include <assert.h>
> ++    #include <openssl/ssl.h>], [ SSL_CTX* ssl_ctx = SSL_CTX_new(TLS_server_method());
> ++                                assert(OPENSSL_VERSION_NUMBER >= 0x10100000L);],
> ++           [ libssl_linked=yes ], [ libssl_linked=no ])
> ++        if test $libssl_linked = yes; then
> ++          if test ! -z "$ledir" ; then
> ++            ac_cv_libssl_dir=$ledir
> ++            _myos=`echo $target_os | cut -f 1 -d .`
> ++            AS_IF(test "$SUNCC" = "yes" -o "x$_myos" = "xsolaris2",
> ++                  [saved_LDFLAGS="$saved_LDFLAGS -Wl,-R$ledir/lib"],
> ++                  [AS_IF(test "$GCC" = "yes",
> ++                        [saved_LDFLAGS="$saved_LDFLAGS -Wl,-rpath,$ledir/lib"])])
> ++           else
> ++             ac_cv_libssl_dir="(system)"
> ++           fi
> ++           le_found=yes
> ++           break
> ++        fi
> ++      done
> ++      LIBS="$saved_LIBS"
> +       LDFLAGS="$saved_LDFLAGS"
> +-      LIBS="-lssl -lcrypto $saved_LIBS"
> ++      CPPFLAGS="$saved_CPPFLAGS"
> ++      if test $le_found = no ; then
> ++        AC_MSG_ERROR([libssl (at least version 1.1.0) is required.  You can get it from $OPENSSL_URL
> +
> +-      # Skip the directory if it isn't there.
> +-      if test ! -z "$ledir" -a ! -d "$ledir" ; then
> +-         continue;
> ++          If it's already installed, specify its path using --with-libssl=/dir/
> ++    ])
> +       fi
> +-      if test ! -z "$ledir" ; then
> +-        if test -d "$ledir/lib" ; then
> +-          LDFLAGS="-L$ledir/lib $LDFLAGS"
> +-        else
> +-          LDFLAGS="-L$ledir $LDFLAGS"
> +-        fi
> +-        if test -d "$ledir/include" ; then
> +-          CPPFLAGS="-I$ledir/include $CPPFLAGS"
> +-        else
> +-          CPPFLAGS="-I$ledir $CPPFLAGS"
> +-        fi
> ++    ])
> ++    LIBS="-lssl -lcrypto $LIBS"
> ++    if test $ac_cv_libssl_dir != "(system)"; then
> ++      if test -d "$ac_cv_libssl_dir/lib" ; then
> ++        LDFLAGS="-L$ac_cv_libssl_dir/lib $LDFLAGS"
> ++        le_libdir="$ac_cv_libssl_dir/lib"
> ++      else
> ++        LDFLAGS="-L$ac_cv_libssl_dir $LDFLAGS"
> ++        le_libdir="$ac_cv_libssl_dir"
> +       fi
> +-      # Can I compile and link it?
> +-      AC_TRY_LINK([#include <sys/time.h>
> +-  #include <sys/types.h>
> +-  #include <assert.h>
> +-  #include <openssl/ssl.h>], [ SSL_CTX* ssl_ctx = SSL_CTX_new(TLS_server_method());
> +-                              assert(OPENSSL_VERSION_NUMBER >= 0x10100000L);],
> +-         [ libssl_linked=yes ], [ libssl_linked=no ])
> +-      if test $libssl_linked = yes; then
> +-         if test ! -z "$ledir" ; then
> +-           ac_cv_libssl_dir=$ledir
> +-           _myos=`echo $target_os | cut -f 1 -d .`
> +-           AS_IF(test "$SUNCC" = "yes" -o "x$_myos" = "xsolaris2",
> +-                 [saved_LDFLAGS="$saved_LDFLAGS -Wl,-R$ledir/lib"],
> +-                 [AS_IF(test "$GCC" = "yes",
> +-                       [saved_LDFLAGS="$saved_LDFLAGS -Wl,-rpath,$ledir/lib"])])
> +-         else
> +-           ac_cv_libssl_dir="(system)"
> +-         fi
> +-         le_found=yes
> +-         break
> ++      if test -d "$ac_cv_libssl_dir/include" ; then
> ++        CPPFLAGS="-I$ac_cv_libssl_dir/include $CPPFLAGS"
> ++      else
> ++        CPPFLAGS="-I$ac_cv_libssl_dir $CPPFLAGS"
> +       fi
> +-    done
> +-    LIBS="$saved_LIBS"
> +-    LDFLAGS="$saved_LDFLAGS"
> +-    CPPFLAGS="$saved_CPPFLAGS"
> +-    if test $le_found = no ; then
> +-      AC_MSG_ERROR([libssl (at least version 1.1.0) is required.  You can get it from $OPENSSL_URL
> +-
> +-        If it's already installed, specify its path using --with-libssl=/dir/
> +-  ])
> +     fi
> +   ])
> +-  LIBS="-lssl -lcrypto $LIBS"
> +-  if test $ac_cv_libssl_dir != "(system)"; then
> +-    if test -d "$ac_cv_libssl_dir/lib" ; then
> +-      LDFLAGS="-L$ac_cv_libssl_dir/lib $LDFLAGS"
> +-      le_libdir="$ac_cv_libssl_dir/lib"
> +-    else
> +-      LDFLAGS="-L$ac_cv_libssl_dir $LDFLAGS"
> +-      le_libdir="$ac_cv_libssl_dir"
> +-    fi
> +-    if test -d "$ac_cv_libssl_dir/include" ; then
> +-      CPPFLAGS="-I$ac_cv_libssl_dir/include $CPPFLAGS"
> +-    else
> +-      CPPFLAGS="-I$ac_cv_libssl_dir $CPPFLAGS"
> +-    fi
> +-  fi
> + fi
> +
> + if test "x$enable_static" = "xyes"; then
> diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
> index bddb713458..c7d89054bd 100644
> --- a/package/memcached/memcached.mk
> +++ b/package/memcached/memcached.mk
> @@ -22,4 +22,11 @@ else
>   MEMCACHED_CONF_ENV += ac_cv_c_endian=little
>   endif
>   
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +MEMCACHED_CONF_OPTS += --enable-tls
> +MEMCACHED_DEPENDENCIES += host-pkgconf openssl
> +else
> +MEMCACHED_CONF_OPTS += --disable-tls
> +endif
> +
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
