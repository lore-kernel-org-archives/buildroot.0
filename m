From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 20 Apr 2015 04:46:56 +0200
Subject: [Buildroot] [PATCH 2/2] package/tor: new package
In-Reply-To: <1427638949-3191-2-git-send-email-bernd.kuhls@t-online.de>
References: <1427638949-3191-1-git-send-email-bernd.kuhls@t-online.de>
 <1427638949-3191-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <CAHkwnC_aKhRJezdfbxiMVq6ZsTSGrk-jmns7b7M5Yht3s9HpVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 29, 2015 at 4:22 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in                   |    1 +
>  package/tor/0001-openssl-libz.patch |   89 +++++++++++++++++++++++++++++++++++
>  package/tor/Config.in               |   13 +++++
>  package/tor/tor.hash                |    2 +
>  package/tor/tor.mk                  |   36 ++++++++++++++
>  5 files changed, 141 insertions(+)
>  create mode 100644 package/tor/0001-openssl-libz.patch
>  create mode 100644 package/tor/Config.in
>  create mode 100644 package/tor/tor.hash
>  create mode 100644 package/tor/tor.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 566a78a..2771ba7 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1233,6 +1233,7 @@ endif
>         source "package/tinc/Config.in"
>         source "package/tinyhttpd/Config.in"
>         source "package/tn5250/Config.in"
> +       source "package/tor/Config.in"
>         source "package/transmission/Config.in"
>         source "package/tvheadend/Config.in"
>         source "package/udpcast/Config.in"
> diff --git a/package/tor/0001-openssl-libz.patch b/package/tor/0001-openssl-libz.patch
> new file mode 100644
> index 0000000..802555e
> --- /dev/null
> +++ b/package/tor/0001-openssl-libz.patch
> @@ -0,0 +1,89 @@
> +Adjust link order of libz to solve bug with static linking
> +and remove host paths when looking for openssl.
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -uNr tor-0.2.5.11.org/configure.ac tor-0.2.5.11/configure.ac
> +--- tor-0.2.5.11.org/configure.ac      2015-03-12 17:49:50.000000000 +0100
> ++++ tor-0.2.5.11/configure.ac  2015-03-29 14:32:05.058142751 +0200
> +@@ -559,11 +559,11 @@
> +       fi
> +   ])
> +
> +-TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto $TOR_LIB_GDI],
> ++TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto -lz $TOR_LIB_GDI],
> +     [#include <openssl/rand.h>],
> +     [void RAND_add(const void *buf, int num, double entropy);],
> +     [RAND_add((void*)0,0,0); exit(0);], [],
> +-    [/usr/local/openssl /usr/lib/openssl /usr/local/ssl /usr/lib/ssl /usr/local /usr/athena /opt/openssl])
> ++    [])
> +
> + dnl XXXX check for OPENSSL_VERSION_NUMBER == SSLeay()
> +
> +diff -uNr tor-0.2.5.11.org/src/or/include.am tor-0.2.5.11/src/or/include.am
> +--- tor-0.2.5.11.org/src/or/include.am 2015-03-12 17:49:50.000000000 +0100
> ++++ tor-0.2.5.11/src/or/include.am     2015-03-29 14:37:35.409997674 +0200
> +@@ -115,7 +115,7 @@
> + src_or_tor_LDADD = src/or/libtor.a src/common/libor.a \
> +       src/common/libor-crypto.a $(LIBDONNA) \
> +       src/common/libor-event.a \
> +-      @TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ @TOR_OPENSSL_LIBS@ \
> ++      @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
> +       @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
> +
> + if COVERAGE_ENABLED
> +diff -uNr tor-0.2.5.11.org/src/test/include.am tor-0.2.5.11/src/test/include.am
> +--- tor-0.2.5.11.org/src/test/include.am       2015-03-12 17:49:50.000000000 +0100
> ++++ tor-0.2.5.11/src/test/include.am   2015-03-29 14:39:53.264265077 +0200
> +@@ -59,16 +59,16 @@
> + src_test_test_LDADD = src/or/libtor-testing.a src/common/libor-testing.a \
> +       src/common/libor-crypto-testing.a $(LIBDONNA) \
> +       src/common/libor-event-testing.a \
> +-      @TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
> +-      @TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
> ++      @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
> ++      @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
> +
> + src_test_bench_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@ \
> +         @TOR_LDFLAGS_libevent@
> + src_test_bench_LDADD = src/or/libtor.a src/common/libor.a \
> +       src/common/libor-crypto.a $(LIBDONNA) \
> +       src/common/libor-event.a \
> +-      @TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
> +-      @TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
> ++      @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
> ++      @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
> +
> + noinst_HEADERS+= \
> +       src/test/test.h
> +@@ -79,8 +79,8 @@
> + src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@
> + src_test_test_ntor_cl_LDADD = src/or/libtor.a src/common/libor.a \
> +       src/common/libor-crypto.a $(LIBDONNA) \
> +-      @TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ \
> +-      @TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
> ++      @TOR_LIB_MATH@ \
> ++      @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
> + src_test_test_ntor_cl_AM_CPPFLAGS =          \
> +       -I"$(top_srcdir)/src/or"
> + NTOR_TEST_DEPS=src/test/test-ntor-cl
> +diff -uNr tor-0.2.5.11.org/src/tools/include.am tor-0.2.5.11/src/tools/include.am
> +--- tor-0.2.5.11.org/src/tools/include.am      2014-06-18 21:11:45.000000000 +0200
> ++++ tor-0.2.5.11/src/tools/include.am  2015-03-29 14:41:29.143058949 +0200
> +@@ -9,14 +9,14 @@
> + src_tools_tor_gencert_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@
> + src_tools_tor_gencert_LDADD = src/common/libor.a src/common/libor-crypto.a \
> +       $(LIBDONNA) \
> +-        @TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ @TOR_OPENSSL_LIBS@ \
> ++        @TOR_LIB_MATH@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
> +         @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
> +
> + src_tools_tor_checkkey_SOURCES = src/tools/tor-checkkey.c
> + src_tools_tor_checkkey_LDFLAGS = @TOR_LDFLAGS_zlib@ @TOR_LDFLAGS_openssl@
> + src_tools_tor_checkkey_LDADD = src/common/libor.a src/common/libor-crypto.a \
> +       $(LIBDONNA) \
> +-        @TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ @TOR_OPENSSL_LIBS@ \
> ++        @TOR_LIB_MATH@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
> +         @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
> +
> + include src/tools/tor-fw-helper/include.am
> diff --git a/package/tor/Config.in b/package/tor/Config.in
> new file mode 100644
> index 0000000..0f48d36
> --- /dev/null
> +++ b/package/tor/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_TOR
> +       bool "tor"
> +       depends on BR2_USE_MMU # fork()
> +       select BR2_PACKAGE_LIBEVENT
> +       select BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_ZLIB
> +       help
> +         Tor is free software and an open network that helps you defend against
> +         traffic analysis, a form of network surveillance that threatens
> +         personal freedom and privacy, confidential business activities and
> +         relationships, and state security.
> +
> +         https://www.torproject.org
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> new file mode 100644
> index 0000000..fdcb069
> --- /dev/null
> +++ b/package/tor/tor.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 aee0faee9c3f1bb265ee8e94b4bb93967413f3c56e65f954db16b09451546769        tor-0.2.5.11.tar.gz
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> new file mode 100644
> index 0000000..1d0b117
> --- /dev/null
> +++ b/package/tor/tor.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# tor
> +#
> +################################################################################
> +
> +TOR_VERSION = 0.2.5.11

What about adding the latest version available (0.2.6.7)?

> +TOR_SITE = https://dist.torproject.org
> +TOR_LICENSE = BSD-3c
> +TOR_LICENSE_FILES = LICENSE
> +TOR_DEPENDENCIES = libevent openssl zlib
> +TOR_AUTORECONF = YES
> +
> +TOR_CONF_OPTS = \
> +       --disable-gcc-hardening \
> +       --with-libevent-dir=$(STAGING_DIR)/usr \
> +       --with-openssl-dir=$(STAGING_DIR)/usr \
> +       --with-zlib-dir=$(STAGING_DIR)/usr
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +TOR_CONF_OPTS += \
> +       --enable-static-libevent \
> +       --enable-static-openssl \
> +       --enable-static-tor \
> +       --enable-static-zlib
> +endif
> +
> +# libseccomp support depends on largefile, see src/common/sandbox.c, line 16
> +ifeq ($(BR2_PACKAGE_LIBSECCOMP)$(BR2_LARGEFILE),yy)
> +TOR_CONF_OPTS += --enable-seccomp
> +TOR_DEPENDENCIES += libseccomp
> +else
> +TOR_CONF_OPTS += --disable-seccomp
> +endif
> +
> +$(eval $(autotools-package))
> --
> 1.7.10.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

BR
-- 
Fabio Porcedda
