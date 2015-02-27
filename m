From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 27 Feb 2015 23:39:47 +0100
Subject: [Buildroot] [PATCH] package/libevent: fix static build
In-Reply-To: <54EBA1B5.7000402@openwide.fr>
References: <20150223190040.70f41d55@free-electrons.com>	<2008003175.212046.1424715113306.JavaMail.root@openwide.fr>
 <20150223200748.46ce9690@free-electrons.com> <54EBA1B5.7000402@openwide.fr>
Message-ID: <54F0F233.6030605@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

[...]
>>
>> From c603940f3d54189a3ef4a430580166cfdda468d0 Mon Sep 17 00:00:00 2001
>> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Date: Mon, 23 Feb 2015 19:58:21 +0100
>> Subject: [PATCH 2/2] Use pkg-config to discover openssl and zlib
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
[...]
>> ---
>>  configure.ac       | 25 ++-----------------------
>>  sample/Makefile.am |  2 +-
>>  test/Makefile.am   |  2 +-
>>  3 files changed, 4 insertions(+), 25 deletions(-)
>>
>> diff --git a/configure.ac b/configure.ac
>> index d42edd8..da5bc49 100644
>> --- a/configure.ac
>> +++ b/configure.ac
>> @@ -146,16 +146,7 @@ AC_CHECK_HEADERS([zlib.h])
>>  if test "x$ac_cv_header_zlib_h" = "xyes"; then
>>  dnl Determine if we have zlib for regression tests
>>  dnl Don't put this one in LIBS
>> -save_LIBS="$LIBS"
>> -LIBS=""
>> -ZLIB_LIBS=""
>> -have_zlib=no
>> -AC_SEARCH_LIBS([inflateEnd], [z],
>> -	[have_zlib=yes
>> -	ZLIB_LIBS="$LIBS"
>> -	AC_DEFINE(HAVE_LIBZ, 1, [Define if the system has zlib])])
>> -LIBS="$save_LIBS"
>> -AC_SUBST(ZLIB_LIBS)
>> +    PKG_CHECK_MODULES([ZLIB], [zlib], [have_zlib=yes])
>>  fi
>>  AM_CONDITIONAL(ZLIB_REGRESS, [test "$have_zlib" = "yes"])

The first part of your patch can be upstreamed easily.

>>  
>> @@ -169,23 +160,11 @@ else
>>  fi
>>  AC_SUBST(EV_LIB_WS32)
>>  AC_SUBST(EV_LIB_GDI)
>> -AC_SUBST(OPENSSL_LIBADD)
>>  
>>  AC_CHECK_HEADERS([openssl/bio.h])
>>  
>>  if test "$enable_openssl" = "yes"; then
>> -save_LIBS="$LIBS"
>> -LIBS=""
>> -OPENSSL_LIBS=""
>> -have_openssl=no
>> -AC_SEARCH_LIBS([SSL_new], [ssl],
>> -	[have_openssl=yes
>> -	OPENSSL_LIBS="$LIBS -lcrypto $EV_LIB_GDI $EV_LIB_WS32 $OPENSSL_LIBADD"
>> -	AC_DEFINE(HAVE_OPENSSL, 1, [Define if the system has openssl])],
>> -	[have_openssl=no],
>> -	[-lcrypto $EV_LIB_GDI $EV_LIB_WS32 $OPENSSL_LIBADD])
>> -LIBS="$save_LIBS"
>> -AC_SUBST(OPENSSL_LIBS)
>> +   PKG_CHECK_MODULES([OPENSSL], [openssl], [have_openssl=yes], [have_openssl=no])
>>  fi
>>  

The second part doesn't apply since the following patch has been merged:

"Provide the autoconf m4 macros for the new OpenSSL via pkg-config stuff"
https://github.com/libevent/libevent/commit/674dc3d34ed0e46890f9db35402841527f2432f3

"Use pkg-config (if available) to handle OpenSSL"
https://github.com/libevent/libevent/commit/1c63860758f5ddb0bd00e9d3c841d488779be1bd

It seems that upstream want to make pkg-config optional and fall back to legacy way if
it's not found.
So, the PKG_CHECK_MODULES for zlib needs to be reworked to check if pkg-config is
available...

I'm not convinced about with/without pkg-config handling, the legacy way is still
broken for some corner case.
But from Buildroot point of view, it doesn't matter since pkg-config is always
available.

For the last part of the patch, sample/Makefile.am and test/Makefile.am has been
removed/renamed upstream.

What do you suggest ?

Best regards,
Romain
