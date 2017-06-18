From: Rodrigo Rebello <rprebello@gmail.com>
Date: Sun, 18 Jun 2017 20:22:26 -0300
Subject: [Buildroot] [PATCH] irssi: bump to version 1.0.3
In-Reply-To: <20170618230903.13371-1-rprebello@gmail.com>
References: <20170618230903.13371-1-rprebello@gmail.com>
Message-ID: <CABLs7GXGHGEE2-mqk=ZwrME2LPN7GWc5tx--6O4KDF9+7ykmqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just noticed Peter sent a similar patch a while ago, so I'll mark
this one as rejected. Sorry for the duplication.

Rodrigo

2017-06-18 20:09 GMT-03:00 Rodrigo Rebello <rprebello@gmail.com>:
> Also:
>
>   - Drop no longer needed patch (merged upstream).
>   - Drop obsolete configure option --with-ncurses (removed upstream
>     since version 1.0.0).
>
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
>  ...-to-using-pkg-config-to-check-for-OpenSSL.patch | 77 ----------------------
>  package/irssi/irssi.hash                           |  2 +-
>  package/irssi/irssi.mk                             |  6 +-
>  3 files changed, 2 insertions(+), 83 deletions(-)
>  delete mode 100644 package/irssi/0001-Get-back-to-using-pkg-config-to-check-for-OpenSSL.patch
>
> diff --git a/package/irssi/0001-Get-back-to-using-pkg-config-to-check-for-OpenSSL.patch b/package/irssi/0001-Get-back-to-using-pkg-config-to-check-for-OpenSSL.patch
> deleted file mode 100644
> index 0ce44f935..000000000
> --- a/package/irssi/0001-Get-back-to-using-pkg-config-to-check-for-OpenSSL.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From ed0c2c1b9504a99a6dcc3c0f5de3b3a1c0232758 Mon Sep 17 00:00:00 2001
> -From: Rodrigo Rebello <rprebello@gmail.com>
> -Date: Mon, 20 Mar 2017 13:17:42 -0300
> -Subject: [PATCH] Get back to using pkg-config to check for OpenSSL
> -
> -Commit 6300dfec7 removed the option to disable SSL support from the
> -configure script since it became a requirement, but it also removed the
> -use of pkg-config for finding the OpenSSL library and its dependencies.
> -
> -This had the unfortunate consequence of breaking the correct detection
> -of library flags in many static linking scenarios. In some cases, for
> -example, OpenSSL might have been built with zlib, which requires `-lz`
> -to be passed to the linker when doing a static link of the irssi
> -executable. Thus, pkg-config becomes an invaluable tool in such
> -situations, since no guessing work is needed as the OpenSSL .pc file
> -provides all the necessary flags.
> -
> -So, this patch re-inserts the PKG_CHECK_MODULES macro in the configure
> -script when looking for OpenSSL. The test using AC_CHECK_LIB remains,
> -but only as a last resort in case the one using pkg-config fails.
> -
> -Also, because the macro AM_PATH_GLIB_2_0 contains an unconditional call
> -to PKG_PROG_PKG_CONFIG, the OpenSSL checks are moved so that they come
> -after the Glib ones in order to avoid doubly checking for the pkg-config
> -binary (PKG_CHECK_MODULES skips that check if it has been performed
> -before, but PKG_PROG_PKG_CONFIG does not).
> -
> -Upstream status: submitted
> -https://github.com/irssi/irssi/pull/677
> -
> -Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ----
> - configure.ac | 21 +++++++++++++++------
> - 1 file changed, 15 insertions(+), 6 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 02b33497..9f191d3f 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -231,11 +231,6 @@ if test "x$want_socks" = "xyes"; then
> - fi
> -
> - dnl **
> --dnl ** OpenSSL checks
> --dnl **
> --AC_CHECK_LIB([ssl], [SSL_library_init])
> --
> --dnl **
> - dnl ** fe-text checks
> - dnl **
> -
> -@@ -276,7 +271,21 @@ if test -z "$GLIB_LIBS"; then
> -   AC_ERROR([GLIB is required to build irssi.])
> - fi
> -
> --LIBS="$LIBS $GLIB_LIBS -lssl -lcrypto"
> -+LIBS="$LIBS $GLIB_LIBS"
> -+
> -+dnl **
> -+dnl ** OpenSSL checks
> -+dnl **
> -+PKG_CHECK_MODULES([OPENSSL], [openssl], [
> -+      CFLAGS="$CFLAGS $OPENSSL_CFLAGS"
> -+      LIBS="$LIBS $OPENSSL_LIBS"
> -+], [
> -+      AC_CHECK_LIB([ssl], [SSL_library_init], [
> -+              LIBS="$LIBS -lssl -lcrypto"
> -+      ], [
> -+              AC_MSG_ERROR([The OpenSSL library was not found])
> -+      ])
> -+])
> -
> - dnl **
> - dnl ** curses checks
> ---
> -2.11.0
> -
> diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
> index f1472e04b..abb421998 100644
> --- a/package/irssi/irssi.hash
> +++ b/package/irssi/irssi.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated after checking pgp signature
> -sha256 5c1c3cc2caf103aad073fadeb000e0f8cb3b416833a7f43ceb8bd9fcf275fbe9        irssi-1.0.2.tar.xz
> +sha256 838220297dcbe7c8c42d01005059779a82f5b7b7e7043db37ad13f5966aff581        irssi-1.0.3.tar.xz
> diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
> index 1fe4de83c..ef9d0aafb 100644
> --- a/package/irssi/irssi.mk
> +++ b/package/irssi/irssi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -IRSSI_VERSION = 1.0.2
> +IRSSI_VERSION = 1.0.3
>  IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
>  # Do not use the github helper here. The generated tarball is *NOT* the
>  # same as the one uploaded by upstream for the release.
> @@ -13,12 +13,8 @@ IRSSI_LICENSE = GPL-2.0+
>  IRSSI_LICENSE_FILES = COPYING
>  IRSSI_DEPENDENCIES = host-pkgconf libglib2 ncurses openssl
>
> -# We're patching configure.ac, so we need to autoreconf
> -IRSSI_AUTORECONF = YES
> -
>  IRSSI_CONF_OPTS = \
>         --disable-glibtest \
> -       --with-ncurses=$(STAGING_DIR)/usr \
>         --without-perl
>
>  ifeq ($(BR2_PACKAGE_IRSSI_PROXY),y)
> --
> 2.11.0
>
